import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VB Solver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'First Match with 3 VB Teams Solver'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _opacity = 0.0;
  int _serveCalc = 0;
  int _workTeam = 0;
  int _sideTeam = 0;
  int _serveTeam = 0;

  void _incrementCounter() {
    setState(() {
      var rng = new Random.secure();
      var rng2 = new Random.secure();
      _workTeam = rng.nextInt(3) + 1;
      _serveCalc = rng2.nextInt(2);
      switch (_workTeam) {
        case 1:
          {
            if (_serveCalc == 0) {
              _serveTeam = 2;
              _sideTeam = 3;
            } else {
              _serveTeam = 3;
              _sideTeam = 2;
            }
          }
          break;
        case 2:
          {
            if (_serveCalc == 0) {
              _serveTeam = 1;
              _sideTeam = 3;
            } else {
              _serveTeam = 3;
              _sideTeam = 1;
            }
          }
          break;

        case 3:
          {
            if (_serveCalc == 0) {
              _serveTeam = 1;
              _sideTeam = 2;
            } else {
              _serveTeam = 2;
              _sideTeam = 1;
            }
          }
          break;

        default:
          {
            //statements;
          }
          break;
      }
      _opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), centerTitle: true),
        body: SingleChildScrollView(
          child: 
         Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedOpacity(
                    opacity: _opacity,
                    duration: Duration(milliseconds: 1500),
                    child: (Column(children: <Widget>[
                      Text(
                        '\nTeam has to work, first:',
                      ),
                      Text(
                        'Team $_workTeam Works',
                        style: Theme.of(context).textTheme.display1,
                      ),
                      Text(
                        '\nTeam has to choose a side:',
                      ),
                      Text(
                        'Team $_sideTeam Gets Side',
                        style: Theme.of(context).textTheme.display1,
                      ),
                      Text(
                        '\nTeam has to choose whether to serve first:',
                      ),
                      Text(
                        'Team $_serveTeam Gets Serve',
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ]))),
                Column(
                  children: <Widget>[
                    Material(
                      color: Colors.white,
                      child: Center(
                        child: Ink.image(
                          image: AssetImage('assets/vball350.jpg'),
                          fit: BoxFit.cover,
                          width: 350.0,
                          height: 350.0,
                          child: InkWell(
                              onTap: () {
                                _incrementCounter();
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text('Click the ball',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('Click the ball to solve your problems')
              ]),
         )
        ));
  }
}
