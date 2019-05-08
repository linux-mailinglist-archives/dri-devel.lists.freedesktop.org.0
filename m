Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366CE1860F
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B45189BA1;
	Thu,  9 May 2019 07:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10058.outbound.protection.outlook.com [40.107.1.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C561D890ED
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 10:58:20 +0000 (UTC)
Received: from AM0PR04MB4865.eurprd04.prod.outlook.com (20.176.215.158) by
 AM0PR04MB5474.eurprd04.prod.outlook.com (20.178.113.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 10:58:18 +0000
Received: from AM0PR04MB4865.eurprd04.prod.outlook.com
 ([fe80::f496:84c1:30b5:43be]) by AM0PR04MB4865.eurprd04.prod.outlook.com
 ([fe80::f496:84c1:30b5:43be%7]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 10:58:18 +0000
From: Wen He <wen.he_1@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>, "brian.starkey@arm.com"
 <brian.starkey@arm.com>
Subject: [v1] drm/arm/mali-dp: Add a loop around the second set CVAL and try 5
 times
Thread-Topic: [v1] drm/arm/mali-dp: Add a loop around the second set CVAL and
 try 5 times
Thread-Index: AQHVBYzxBN8dpmpwpU6J1s6j0tqqMg==
Date: Wed, 8 May 2019 10:58:18 +0000
Message-ID: <20190508105956.6107-1-wen.he_1@nxp.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::23) To AM0PR04MB4865.eurprd04.prod.outlook.com
 (2603:10a6:208:c4::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e2e2f1c-8b39-4fa7-4f40-08d6d3a413bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB5474; 
x-ms-traffictypediagnostic: AM0PR04MB5474:
x-microsoft-antispam-prvs: <AM0PR04MB5474C0B51F685B2AD14B4AA1E2320@AM0PR04MB5474.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:506;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(26005)(486006)(2501003)(2616005)(476003)(8936002)(102836004)(53936002)(2906002)(3846002)(1076003)(316002)(36756003)(99286004)(81156014)(6486002)(81166006)(4326008)(8676002)(66476007)(2201001)(71190400001)(71200400001)(66556008)(50226002)(66946007)(66066001)(6506007)(386003)(305945005)(73956011)(6512007)(6116002)(7736002)(86362001)(66446008)(64756008)(6436002)(256004)(186003)(68736007)(478600001)(25786009)(14444005)(110136005)(14454004)(54906003)(5660300002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5474;
 H:AM0PR04MB4865.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: msq+7yCd9bb5+rPkPoAYYbXTFXqBdOwoJJcktjl2108weibALQXefIi1WTWrUOXAGRNUZjBX79uZ/QjqJLA/DGDTfySl1bF+r6rp+aZ7a+wuxPpjUol90qiooM+eVGRRP6TfsAuyjYWz9iDNP1ow67Ie9QTf3I9DaNaCO/XUAXqO5lfDWAiesmMVU6qQKV4kkG/lvtx5xaXEGpEldSHzD+r4eEWQLrv+v4Bl5YWUMij3NvNtngSSZ4xiwVrYKmVsnPnGbZmm3P1FPv9ag6ykJr3QAe6YnCmh2jUQvVvJe4pcWKIW5PFvKkw5SwR3rag96gJMMgmHZ7hSVjgfCDgQBLGL+TUP1Z7h05th0JWeVJ1//RYsc9wxy74NJ4fjxfgHtTP5lDYV+bFkaK04Es0aqS3irGmZ1mARpxj6tizH5ew=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2e2f1c-8b39-4fa7-4f40-08d6d3a413bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 10:58:18.1214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5474
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXW3YK6slftNlgC2m0DTk1r8b1rkzRY9JJ1j/qE7wA0=;
 b=NuOc76GspqRMOaoqbR+tAHBj5t1ow9K2KVuwHyZCCRbFYC+TsaNZSQbIfTglANgeUCQUsUl+8T45XvL36u5H++9ixBmlyHsWILo7IbgxF26/1y/Gw3Y20bo8hR65nXf+giI7qmjvAli7bOuutWD3Yg/C8yADGsZV2WoyscpLxZ8=
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
