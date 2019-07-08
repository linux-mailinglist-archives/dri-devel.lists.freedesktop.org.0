Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10C361A55
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 07:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE15899C7;
	Mon,  8 Jul 2019 05:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF982899C7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 05:38:41 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5181.eurprd08.prod.outlook.com (20.179.31.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 05:38:39 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Mon, 8 Jul 2019
 05:38:39 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 2/2] drm/komeda: Computing image enhancer internally
Thread-Topic: [PATCH 2/2] drm/komeda: Computing image enhancer internally
Thread-Index: AQHVNU9lN59GOuQcEkeNTfkO8UQO6Q==
Date: Mon, 8 Jul 2019 05:38:39 +0000
Message-ID: <20190708053819.3574-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0072.apcprd04.prod.outlook.com
 (2603:1096:202:15::16) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2278cffa-255a-4770-7aea-08d703668781
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5181; 
x-ms-traffictypediagnostic: VE1PR08MB5181:
x-microsoft-antispam-prvs: <VE1PR08MB518167C7B0C9B3C90E268733B3F60@VE1PR08MB5181.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39850400004)(136003)(366004)(376002)(396003)(189003)(199004)(2906002)(99286004)(478600001)(8936002)(53936002)(6116002)(52116002)(3846002)(5660300002)(26005)(64756008)(86362001)(14454004)(71190400001)(66066001)(2201001)(66556008)(71200400001)(66446008)(73956011)(305945005)(66476007)(6486002)(1076003)(66946007)(25786009)(103116003)(14444005)(256004)(2616005)(6512007)(186003)(6436002)(316002)(102836004)(110136005)(6506007)(2501003)(476003)(386003)(54906003)(55236004)(36756003)(7736002)(81166006)(8676002)(486006)(50226002)(68736007)(4326008)(81156014)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5181;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ylkJiGCSOXfjqMr6/NSldKdqtSn+HXgEvQEYsapdO56tX9b9GHESBHIr6r6P1JZm78aUn3YbkUXQaD4IjzAiw19aIl27FYm9oNsGbb+pNLILhtjf7Uwlw6k5dRFr59y/UWaly3tD3XIVuJcGEon87An7Gg3RvsQsIXrrU8QVBQUSJ4tqRZEkGer9ZNFACxULytcxiECcYLd3YFOVa0J3bn5aYK4t5ybDygfF3qodMW8JtiCUX6q8H7egqZktNi83vFchMPvNlgJZwc47ypiiL09IaineDkRPGyGA6QZjtTU9RJOYfTihco12QStuCpFmn4EBgYkzzXo4ZhdDrc0mUIF753yDFUxSYAleU/T0qlwPQW+4Ti3fd9XAibAB4sHgECmd5JmfTzAclPM3G1/BXk9HFEHMMB6aiz51Rfetbqo=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2278cffa-255a-4770-7aea-08d703668781
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 05:38:39.4639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5181
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z70kcexbLeO0Hy6vrTImscr4g9/MuPHR8gD1w9lKGj8=;
 b=i8xjNfGqNBVF3qWo1B8IR35Fsk10jjHN2Iv29BYlJFFyGUqMuwVBXos9HqtNPLOQeSL9+LZxDI/X8cjxbMyqAmH1FrDXP7geDBeRzu6YSK+taQYb0SvsU8yxssDYywXo1QbPocEx0O+KhLoIjqXCN7eBms3qJ12moeiosSLnedk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlIGltYWdlIGVuaGFuY2VyIHdoZW4gdGhlIGlucHV0IGRhdGEgZmxvdyBpcyAyeCsgdXBz
Y2FsaW5nLgoKU2lnbmVkLW9mZi1ieTogamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBD
aGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oICAgICAgICAgICAgfCA3ICsrLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgfCA0
ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMg
ICAgICAgICAgfCA1IC0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfa21zLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuaAppbmRleCAwYzAwNjU3NmEyNWMuLjhjODlmYzI0NWI4MyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKQEAgLTQ3LDExICs0
Nyw4IEBAIHN0cnVjdCBrb21lZGFfcGxhbmVfc3RhdGUgewogCS8qKiBAemxpc3Rfbm9kZTogem9y
ZGVyIGxpc3Qgbm9kZSAqLwogCXN0cnVjdCBsaXN0X2hlYWQgemxpc3Rfbm9kZTsKIAotCS8qIEBp
bWdfZW5oYW5jZW1lbnQ6IG9uL29mZiBpbWFnZSBlbmhhbmNlbWVudAotCSAqIEBsYXllcl9zcGxp
dDogb24vb2ZmIGxheWVyX3NwbGl0Ci0JICovCi0JdTggaW1nX2VuaGFuY2VtZW50IDogMSwKLQkg
ICBsYXllcl9zcGxpdCA6IDE7CisJLyoqIEBsYXllcl9zcGxpdDogb24vb2ZmIGxheWVyX3NwbGl0
ICovCisJdTggbGF5ZXJfc3BsaXQgOiAxOwogfTsKIAogLyoqCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwpp
bmRleCA5NzJhMGYyNTI1NGQuLjk1MDIzNWFmMWU3OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCkBA
IC04MDYsNiArODA2LDEwIEBAIHZvaWQga29tZWRhX2NvbXBsZXRlX2RhdGFfZmxvd19jZmcoc3Ry
dWN0IGtvbWVkYV9sYXllciAqbGF5ZXIsCiAJZGZsb3ctPmVuX3NjYWxpbmcgPSAodyAhPSBkZmxv
dy0+b3V0X3cpIHx8IChoICE9IGRmbG93LT5vdXRfaCk7CiAJZGZsb3ctPmlzX3l1diA9IGZiLT5m
b3JtYXQtPmlzX3l1djsKIAorCS8qIHRyeSB0byBlbmFibGUgaW1hZ2UgZW5oYW5jZXIgaWYgZGF0
YSBmbG93IGlzIGEgMngrIHVwc2NhbGluZyAqLworCWRmbG93LT5lbl9pbWdfZW5oYW5jZW1lbnQg
PSBkZmxvdy0+b3V0X3cgPj0gMiAqIHcgfHwKKwkJCQkgICAgZGZsb3ctPm91dF9oID49IDIgKiBo
OworCiAJLyogdHJ5IHRvIGVuYWJsZSBzcGxpdCBpZiBzY2FsaW5nIGV4Y2VlZCB0aGUgc2NhbGVy
J3MgYWNjZXB0YWJsZQogCSAqIGlucHV0L291dHB1dCByYW5nZS4KIAkgKi8KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCmluZGV4IGIxMzg2
NDM4MzU3Yi4uYzA5NWFmMTU0MjE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKQEAgLTE4LDcgKzE4LDYgQEAga29tZWRhX3BsYW5l
X2luaXRfZGF0YV9mbG93KHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0LAogCQkJICAgIHN0cnVj
dCBrb21lZGFfZGF0YV9mbG93X2NmZyAqZGZsb3cpCiB7CiAJc3RydWN0IGtvbWVkYV9wbGFuZSAq
a3BsYW5lID0gdG9fa3BsYW5lKHN0LT5wbGFuZSk7Ci0Jc3RydWN0IGtvbWVkYV9wbGFuZV9zdGF0
ZSAqa3BsYW5lX3N0ID0gdG9fa3BsYW5lX3N0KHN0KTsKIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiA9IHN0LT5mYjsKIAljb25zdCBzdHJ1Y3Qga29tZWRhX2Zvcm1hdF9jYXBzICpjYXBzID0g
dG9fa2ZiKGZiKS0+Zm9ybWF0X2NhcHM7CiAJc3RydWN0IGtvbWVkYV9waXBlbGluZSAqcGlwZSA9
IGtwbGFuZS0+bGF5ZXItPmJhc2UucGlwZWxpbmU7CkBAIC01Nyw4ICs1Niw2IEBAIGtvbWVkYV9w
bGFuZV9pbml0X2RhdGFfZmxvdyhzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdCwKIAkJcmV0dXJu
IC1FSU5WQUw7CiAJfQogCi0JZGZsb3ctPmVuX2ltZ19lbmhhbmNlbWVudCA9ICEha3BsYW5lX3N0
LT5pbWdfZW5oYW5jZW1lbnQ7Ci0KIAlrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhrcGxh
bmUtPmxheWVyLCBkZmxvdywgZmIpOwogCiAJcmV0dXJuIDA7CkBAIC0xNzQsOCArMTcxLDYgQEAg
a29tZWRhX3BsYW5lX2F0b21pY19kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUpCiAKIAlvbGQgPSB0b19rcGxhbmVfc3QocGxhbmUtPnN0YXRlKTsKIAotCW5ldy0+aW1nX2Vu
aGFuY2VtZW50ID0gb2xkLT5pbWdfZW5oYW5jZW1lbnQ7Ci0KIAlyZXR1cm4gJm5ldy0+YmFzZTsK
IH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
