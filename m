Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9418602
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E967789B95;
	Thu,  9 May 2019 07:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30049.outbound.protection.outlook.com [40.107.3.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4636A892BB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 09:39:13 +0000 (UTC)
Received: from AM0PR04MB4865.eurprd04.prod.outlook.com (20.176.215.158) by
 AM0PR04MB4562.eurprd04.prod.outlook.com (52.135.148.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 09:39:10 +0000
Received: from AM0PR04MB4865.eurprd04.prod.outlook.com
 ([fe80::f496:84c1:30b5:43be]) by AM0PR04MB4865.eurprd04.prod.outlook.com
 ([fe80::f496:84c1:30b5:43be%7]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 09:39:10 +0000
From: Wen He <wen.he_1@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>, "brian.starkey@arm.com"
 <brian.starkey@arm.com>
Subject: [v1] drm/arm/mali-dp: Add a loop around the second set CVAL and try 5
 times
Thread-Topic: [v1] drm/arm/mali-dp: Add a loop around the second set CVAL and
 try 5 times
Thread-Index: AQHVBYHjcdB1eoEScEKX0puYnABClg==
Date: Wed, 8 May 2019 09:39:10 +0000
Message-ID: <20190508094049.21658-1-wen.he_1@nxp.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::20) To AM0PR04MB4865.eurprd04.prod.outlook.com
 (2603:10a6:208:c4::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b22288ce-3ca6-4d74-8cc6-08d6d39905cd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB4562; 
x-ms-traffictypediagnostic: AM0PR04MB4562:
x-microsoft-antispam-prvs: <AM0PR04MB456275BAC4A9F01FA2A5CCC6E2320@AM0PR04MB4562.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:506;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(346002)(39860400002)(396003)(376002)(199004)(189003)(386003)(110136005)(486006)(316002)(1076003)(102836004)(68736007)(8936002)(5660300002)(6506007)(4326008)(186003)(71190400001)(71200400001)(36756003)(26005)(52116002)(99286004)(54906003)(53936002)(6116002)(66556008)(2501003)(256004)(66066001)(2201001)(2906002)(14444005)(6512007)(86362001)(50226002)(25786009)(7736002)(14454004)(305945005)(2616005)(81166006)(8676002)(64756008)(81156014)(6486002)(66946007)(73956011)(66476007)(476003)(66446008)(6436002)(3846002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4562;
 H:AM0PR04MB4865.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PrdTkGt17I6aPusNNqcF8gt7V0hklo5rUm1NCSrTEKPNPYxNPvCWvYCxmjWPrsr5aDmx0YNxdx9QrjAakwwzJe+a3q0OjzOTmj4f6Y81t0CtuyaO2YImXGPhpoND8KERWz063JRgq1TOFA/8QoCMmKihNGMkEORP/tKSvCz3RVroXIqRcW8rVSh5wPGLjIQpRxwBgKmlWUl5LKznGKIbnJmG+P1R1OT2rcIFqZgXv0SK3ALyP7IboVmAbrmbCND8440kcuyd3tDE3Bl6NlYK/08WT0EOhOoWjmKiX1JqcZxPbX9GRhnjFTQmCitj8GYeGnE7TfFgtL5jRdEYrgwr7SqM3zZgUp5wcIj3L50Y5cVHeRHb+KIO6U5UbjTg2HrOQVJP0ePGIVFcRkLI0H3b90G752Nkh9OdZBmF+HYRYgI=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22288ce-3ca6-4d74-8cc6-08d6d39905cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 09:39:10.3086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4562
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXW3YK6slftNlgC2m0DTk1r8b1rkzRY9JJ1j/qE7wA0=;
 b=SsxG1nJYoqR+JdMGoNbiJEkqyAMb0S5nbHzX+L1EcM/68Vdt+HKTWUVW5P18YM0tS4r+5J/IJkEOcBW9dAd1sr9ROsGXqVXpERZ0fpKqEZBFHIrSRy1zfjtDtewrMRXUd30rVIhXHyTP7BgUNMCqngHA31KJAkstFmWRi3efsvY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=wen.he_1@nxp.com; 
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
Cc: Wen He <wen.he_1@nxp.com>, Leo Li <leoyang.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCB0cnlpbmcgdG8gZml4IG1vbml0b3IgZnJlZXplIGlzc3VlIGNhdXNlZCBieSBk
cm0gZXJyb3INCidmbGlwX2RvbmUgdGltZWQgb3V0JyBvbiBMUzEwMjhBIHBsYXRmb3JtLiB0aGlz
IHNldCB0cnkgaXMgbWFrZSBhIGxvb3ANCmFyb3VuZCB0aGUgc2Vjb25kIHNldHRpbmcgQ1ZBTCBh
bmQgdHJ5IGxpa2UgNSB0aW1lcyBiZWZvcmUgZ2l2ZWluZyB1cC4NCg0KU2lnbmVkLW9mZi1ieTog
TGl2aXUgPGxpdml1LkR1ZGF1QGFybS5jb20+DQpTaWduZWQtb2ZmLWJ5OiBXZW4gSGUgPHdlbi5o
ZV8xQG54cC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYyB8IDEz
ICsrKysrKysrKysrKy0NCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYw0KaW5kZXggMjE3MjVjOWI5ZjVlLi4x
OGNiN2YxMzRmNGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYu
Yw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMNCkBAIC0xOTIsNiArMTky
LDcgQEAgc3RhdGljIHZvaWQgbWFsaWRwX2F0b21pY19jb21taXRfaHdfZG9uZShzdHJ1Y3QgZHJt
X2F0b21pY19zdGF0ZSAqc3RhdGUpDQogew0KIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gc3Rh
dGUtPmRldjsNCiAJc3RydWN0IG1hbGlkcF9kcm0gKm1hbGlkcCA9IGRybS0+ZGV2X3ByaXZhdGU7
DQorCWludCBsb29wID0gNTsNCiANCiAJbWFsaWRwLT5ldmVudCA9IG1hbGlkcC0+Y3J0Yy5zdGF0
ZS0+ZXZlbnQ7DQogCW1hbGlkcC0+Y3J0Yy5zdGF0ZS0+ZXZlbnQgPSBOVUxMOw0KQEAgLTIwNiw4
ICsyMDcsMTggQEAgc3RhdGljIHZvaWQgbWFsaWRwX2F0b21pY19jb21taXRfaHdfZG9uZShzdHJ1
Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpDQogCQkJZHJtX2NydGNfdmJsYW5rX2dldCgmbWFs
aWRwLT5jcnRjKTsNCiANCiAJCS8qIG9ubHkgc2V0IGNvbmZpZ192YWxpZCBpZiB0aGUgQ1JUQyBp
cyBlbmFibGVkICovDQotCQlpZiAobWFsaWRwX3NldF9hbmRfd2FpdF9jb25maWdfdmFsaWQoZHJt
KSA8IDApDQorCQlpZiAobWFsaWRwX3NldF9hbmRfd2FpdF9jb25maWdfdmFsaWQoZHJtKSA8IDAp
IHsNCisJCQkvKg0KKwkJCSAqIG1ha2UgYSBsb29wIGFyb3VuZCB0aGUgc2Vjb25kIENWQUwgc2V0
dGluZyBhbmQNCisJCQkgKiB0cnkgNSB0aW1lcyBiZWZvcmUgZ2l2aW5nIHVwLg0KKwkJCSAqLw0K
KwkJCXdoaWxlIChsb29wLS0pIHsNCisJCQkJaWYgKCFtYWxpZHBfc2V0X2FuZF93YWl0X2NvbmZp
Z192YWxpZChkcm0pKQ0KKwkJCQkJYnJlYWs7DQorCQkJfQ0KIAkJCURSTV9ERUJVR19EUklWRVIo
InRpbWVkIG91dCB3YWl0aW5nIGZvciB1cGRhdGVkIGNvbmZpZ3VyYXRpb25cbiIpOw0KKwkJfQ0K
Kw0KIAl9IGVsc2UgaWYgKG1hbGlkcC0+ZXZlbnQpIHsNCiAJCS8qIENSVEMgaW5hY3RpdmUgbWVh
bnMgdmJsYW5rIElSUSBpcyBkaXNhYmxlZCwgc2VuZCBldmVudCBkaXJlY3RseSAqLw0KIAkJc3Bp
bl9sb2NrX2lycSgmZHJtLT5ldmVudF9sb2NrKTsNCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
