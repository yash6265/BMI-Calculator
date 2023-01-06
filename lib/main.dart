import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            color: bgColor,
            child: Center(
                child: Container(
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('BMI', style: TextStyle(fontSize: 35)),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: wtController,
                          decoration: InputDecoration(
                            label: Text('Enter your weight in kg  '),
                            prefixIcon: Icon(Icons.line_weight),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: ftController,
                          decoration: InputDecoration(
                            label: Text('Enter your height in feet '),
                            prefixIcon: Icon(Icons.height),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: inController,
                          decoration: InputDecoration(
                            label: Text('Enter your height in inche '),
                            prefixIcon: Icon(Icons.height),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              var wt = wtController.text.toString();
                              var ft = ftController.text.toString();
                              var inch = inController.text.toString();
                              if (wt != "" && ft != "" && inch != "") {
                                // BMI Calculation
                                var iwt = int.parse(wt);
                                var ift = int.parse(ft);
                                var iInch = int.parse(inch);

                                var tInch = (ift * 12) + iInch;
                                var total = tInch * 2.54;
                                var tm = total / 100;
                                var bmi = iwt / (tm * tm);
                                var msg = "";

                                if (bmi > 25) {
                                  msg = "You are over weight..Loose it!!";
                                  bgColor = Colors.orange;
                                } else if (bmi < 18) {
                                  msg = "You are Under weight..Grow It!! ";
                                  bgColor = Colors.red;
                                } else {
                                  msg = "You are healty..Nice!!";
                                  bgColor = Colors.green;
                                }

                                setState(() {
                                  result =
                                      "$msg \n BMI is :${bmi.toStringAsFixed(2)}";
                                });
                              } else {
                                setState(() {
                                  result = "Please fill all the blanks!!!";
                                });
                              }
                            },
                            child: Text("Calculate")),
                        Text(
                          result,
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    )))));
  }
}
