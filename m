Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D0479C7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 07:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EE789149;
	Mon, 17 Jun 2019 05:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40074.outbound.protection.outlook.com [40.107.4.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12D789149
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 05:55:52 +0000 (UTC)
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB5293.eurprd08.prod.outlook.com (20.178.126.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Mon, 17 Jun 2019 05:55:49 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b%4]) with mapi id 15.20.1987.013; Mon, 17 Jun 2019
 05:55:49 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Adds power management support
Thread-Topic: [PATCH] drm/komeda: Adds power management support
Thread-Index: AQHVJNFQETmVGDI6/06sk+Bd75NFbQ==
Date: Mon, 17 Jun 2019 05:55:49 +0000
Message-ID: <1560750919-32255-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39084433-8e5a-4c2d-46d7-08d6f2e8727b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB5293; 
x-ms-traffictypediagnostic: VI1PR08MB5293:
x-ms-exchange-purlcount: 2
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB52935B27F0AD06E7A3ACF17A9FEB0@VI1PR08MB5293.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:91;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39850400004)(376002)(366004)(396003)(346002)(199004)(189003)(386003)(71200400001)(6506007)(486006)(102836004)(72206003)(36756003)(71190400001)(2501003)(14454004)(7736002)(316002)(305945005)(66066001)(3846002)(6116002)(476003)(73956011)(66446008)(64756008)(66946007)(66476007)(66556008)(25786009)(2616005)(50226002)(8936002)(2906002)(81156014)(81166006)(8676002)(110136005)(5660300002)(54906003)(14444005)(256004)(5024004)(6486002)(6436002)(4326008)(53936002)(6512007)(6306002)(26005)(186003)(52116002)(966005)(99286004)(86362001)(68736007)(6636002)(2201001)(478600001)(55236004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5293;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wWCoB+9jDCeJVNVIB1p7dtn0sHUpJqJJ6x2AoW1Tsv0ezDU1HJkSffhlO5/ftM5xI+2yskbyHFiOvSWjjD0qZfEW7Ji0Q4Ob0tqsh6rd+CmKYwJv99sx+vpX7EK5h0PrwtryvTUvoxsrHkVTF5dOZYlQ+zdubDJhBK0YXSGBrLKVlnaEpbytDo9NVkmcOsnkt7MqA7ofyBxdh6i3keGcW0pcE84nCpnYCg9baFOcCFIZeqOiEA3Ypz95+zmKRo34EyBvUk3ISbSGp65eSPaALAXdouHdKDim0NbG9Vlq6XhFnatNHe3YkBvyx0peg3Z+ETquElCWwMqOGiwpbxdCVQ1hfi8QE9z0DfEAkHl+uTvDS2U+Dn5kBCBl8Si6VYEhs8kSSitUfDS/rgciV8mQiuO48UlypLfoOgu9acc0Se4=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39084433-8e5a-4c2d-46d7-08d6f2e8727b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 05:55:49.1023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5293
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0RuAXkwis8QJsOmnZcWpFM9eX2qUcTjMLxPgdRoyjQ=;
 b=in6l+JbAvWqQuDC0UhJrtrtRUsWVMOTGdckSmGRlD0GDL7iha5oWEPu+hdBjvRYrlT3dN34b6AeRZl9dAHBkny6caz7oa7dURnZ7hge+AI/jlCF4+x8Q2jtI82DBv8SPqwqEO8slfJyMipnq491r977c0iDM70FtJsXGDhMx9+I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkcyBydW50aW1lIGFuZCBzeXN0ZW0gcG93ZXIgbWFuYWdlbWVudCBzdXBwb3J0IGluIEtNUyBr
ZXJuZWwgZHJpdmVyLg0KDQpEZXBlbmRzIG9uOg0KLSBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvc2VyaWVzLzYxNjUwLw0KLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvc2VyaWVzLzYwMDgzLw0KDQpTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIHwgIDIgKw0KIGRyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jICB8IDMwICsrKysrKysrKysrKysNCiBkcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCAgfCAgMiArDQogZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMgIHwgNTQgKysrKysrKysr
KysrKysrKysrKysrKy0tDQogNCBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY3J0Yy5jDQppbmRleCA2NmM1ZTBkLi4xYjRlYThhIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMNCkBAIC0yNTcsNiArMjU3
LDcgQEAgdm9pZCBrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoc3RydWN0IGtvbWVkYV9jcnRjICAg
KmtjcnRjLA0KIGtvbWVkYV9jcnRjX2F0b21pY19lbmFibGUoc3RydWN0IGRybV9jcnRjICpjcnRj
LA0KIAkJCSAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGQpDQogew0KKwlwbV9ydW50aW1lX2dl
dF9zeW5jKGNydGMtPmRldi0+ZGV2KTsNCiAJa29tZWRhX2NydGNfcHJlcGFyZSh0b19rY3J0Yyhj
cnRjKSk7DQogCWRybV9jcnRjX3ZibGFua19vbihjcnRjKTsNCiAJa29tZWRhX2NydGNfZG9fZmx1
c2goY3J0Yywgb2xkKTsNCkBAIC0zMzAsNiArMzMxLDcgQEAgdm9pZCBrb21lZGFfY3J0Y19oYW5k
bGVfZXZlbnQoc3RydWN0IGtvbWVkYV9jcnRjICAgKmtjcnRjLA0KIA0KIAlkcm1fY3J0Y192Ymxh
bmtfb2ZmKGNydGMpOw0KIAlrb21lZGFfY3J0Y191bnByZXBhcmUoa2NydGMpOw0KKwlwbV9ydW50
aW1lX3B1dChjcnRjLT5kZXYtPmRldik7DQogfQ0KIA0KIHN0YXRpYyB2b2lkDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYw0KaW5kZXggNDA1YzY0
ZC4uZWRkMDk0MyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Rldi5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kZXYuYw0KQEAgLTMwOCwzICszMDgsMzMgQEAgdm9pZCBrb21lZGFfZGV2X2Rlc3Ry
b3koc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpDQogDQogCWRldm1fa2ZyZWUoZGV2LCBtZGV2KTsN
CiB9DQorDQoraW50IGtvbWVkYV9kZXZfcmVzdW1lKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQ0K
K3sNCisJaW50IHJldCA9IDA7DQorDQorCWlmIChtZGV2LT5pb21tdSAmJiBtZGV2LT5mdW5jcy0+
Y29ubmVjdF9pb21tdSkgew0KKwkJcmV0ID0gbWRldi0+ZnVuY3MtPmNvbm5lY3RfaW9tbXUobWRl
dik7DQorCQlpZiAocmV0IDwgMCkgew0KKwkJCURSTV9FUlJPUigiY29ubmVjdCBpb21tdSBmYWls
ZWQuXG4iKTsNCisJCQlyZXR1cm4gcmV0Ow0KKwkJfQ0KKwl9DQorDQorCXJldHVybiBtZGV2LT5m
dW5jcy0+ZW5hYmxlX2lycShtZGV2KTsNCit9DQorDQoraW50IGtvbWVkYV9kZXZfc3VzcGVuZChz
dHJ1Y3Qga29tZWRhX2RldiAqbWRldikNCit7DQorCWludCByZXQgPSAwOw0KKw0KKwlpZiAobWRl
di0+aW9tbXUgJiYgbWRldi0+ZnVuY3MtPmRpc2Nvbm5lY3RfaW9tbXUpIHsNCisJCXJldCA9IG1k
ZXYtPmZ1bmNzLT5kaXNjb25uZWN0X2lvbW11KG1kZXYpOw0KKwkJaWYgKHJldCA8IDApIHsNCisJ
CQlEUk1fRVJST1IoImRpc2Nvbm5lY3QgaW9tbXUgZmFpbGVkLlxuIik7DQorCQkJcmV0dXJuIHJl
dDsNCisJCX0NCisJfQ0KKw0KKwlyZXR1cm4gbWRldi0+ZnVuY3MtPmRpc2FibGVfaXJxKG1kZXYp
Ow0KK30NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rl
di5oDQppbmRleCBkMWM4NmI2Li4wOTZmOWY3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oDQpAQCAtMjA3LDQgKzIwNyw2IEBAIHN0cnVj
dCBrb21lZGFfZGV2IHsNCiANCiBzdHJ1Y3Qga29tZWRhX2RldiAqZGV2X3RvX21kZXYoc3RydWN0
IGRldmljZSAqZGV2KTsNCiANCitpbnQga29tZWRhX2Rldl9yZXN1bWUoc3RydWN0IGtvbWVkYV9k
ZXYgKm1kZXYpOw0KK2ludCBrb21lZGFfZGV2X3N1c3BlbmQoc3RydWN0IGtvbWVkYV9kZXYgKm1k
ZXYpOw0KICNlbmRpZiAvKl9LT01FREFfREVWX0hfKi8NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jDQppbmRleCBjZmE1MDY4Li5hYTRjZWYxIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5j
DQpAQCAtOCw2ICs4LDcgQEANCiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQogI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KICNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4N
CisjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KICNpbmNsdWRlIDxkcm0vZHJtX29mLmg+
DQogI2luY2x1ZGUgImtvbWVkYV9kZXYuaCINCiAjaW5jbHVkZSAia29tZWRhX2ttcy5oIg0KQEAg
LTMyLDYgKzMzLDkgQEAgc3RhdGljIHZvaWQga29tZWRhX3VuYmluZChzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQogCQlyZXR1cm47DQogDQogCWtvbWVkYV9rbXNfZGV0YWNoKG1kcnYtPmttcyk7DQorDQor
CXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KKw0KIAlrb21lZGFfZGV2X2Rlc3Ryb3kobWRydi0+
bWRldik7DQogDQogCWRldl9zZXRfZHJ2ZGF0YShkZXYsIE5VTEwpOw0KQEAgLTUyLDYgKzU2LDkg
QEAgc3RhdGljIGludCBrb21lZGFfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQogCQllcnIgPSBQ
VFJfRVJSKG1kcnYtPm1kZXYpOw0KIAkJZ290byBmcmVlX21kcnY7DQogCX0NCisJZGV2X3NldF9k
cnZkYXRhKGRldiwgbWRydik7DQorDQorCXBtX3J1bnRpbWVfZW5hYmxlKGRldik7DQogDQogCW1k
cnYtPmttcyA9IGtvbWVkYV9rbXNfYXR0YWNoKG1kcnYtPm1kZXYpOw0KIAlpZiAoSVNfRVJSKG1k
cnYtPmttcykpIHsNCkBAIC01OSwxMSArNjYsMTAgQEAgc3RhdGljIGludCBrb21lZGFfYmluZChz
dHJ1Y3QgZGV2aWNlICpkZXYpDQogCQlnb3RvIGRlc3Ryb3lfbWRldjsNCiAJfQ0KIA0KLQlkZXZf
c2V0X2RydmRhdGEoZGV2LCBtZHJ2KTsNCi0NCiAJcmV0dXJuIDA7DQogDQogZGVzdHJveV9tZGV2
Og0KKwlwbV9ydW50aW1lX2Rpc2FibGUoZGV2KTsNCiAJa29tZWRhX2Rldl9kZXN0cm95KG1kcnYt
Pm1kZXYpOw0KIA0KIGZyZWVfbWRydjoNCkBAIC0xMzQsMTMgKzE0MCw1NSBAQCBzdGF0aWMgaW50
IGtvbWVkYV9wbGF0Zm9ybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAN
CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBrb21lZGFfb2ZfbWF0Y2gpOw0KIA0KK3N0YXRpYyBp
bnQga29tZWRhX3J0X3BtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KK3sNCisJZGV2X2lu
Zm8oZGV2LCAiJXNcbiIsIF9fZnVuY19fKTsNCisJcmV0dXJuIDA7DQorfQ0KKw0KK3N0YXRpYyBp
bnQga29tZWRhX3J0X3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQorew0KKwlkZXZfaW5m
byhkZXYsICIlc1xuIiwgX19mdW5jX18pOw0KKwlyZXR1cm4gMDsNCit9DQorDQorc3RhdGljIGlu
dCBfX21heWJlX3VudXNlZCBrb21lZGFfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQor
ew0KKwlzdHJ1Y3Qga29tZWRhX2RydiAqbWRydiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KKwlz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gJm1kcnYtPmttcy0+YmFzZTsNCisJaW50IHJlczsNCisN
CisJZGV2X2luZm8oZGV2LCAiJXNcbiIsIF9fZnVuY19fKTsNCisJcmVzID0gZHJtX21vZGVfY29u
ZmlnX2hlbHBlcl9zdXNwZW5kKGRybSk7DQorDQorCWtvbWVkYV9kZXZfc3VzcGVuZChtZHJ2LT5t
ZGV2KTsNCisNCisJcmV0dXJuIHJlczsNCit9DQorDQorc3RhdGljIGludCBfX21heWJlX3VudXNl
ZCBrb21lZGFfcG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCit7DQorCXN0cnVjdCBrb21l
ZGFfZHJ2ICptZHJ2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQorCXN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0gPSAmbWRydi0+a21zLT5iYXNlOw0KKw0KKwlkZXZfaW5mbyhkZXYsICIlc1xuIiwgX19m
dW5jX18pOw0KKwlrb21lZGFfZGV2X3Jlc3VtZShtZHJ2LT5tZGV2KTsNCisNCisJcmV0dXJuIGRy
bV9tb2RlX2NvbmZpZ19oZWxwZXJfcmVzdW1lKGRybSk7DQorfQ0KKw0KK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZGV2X3BtX29wcyBrb21lZGFfcG1fb3BzID0gew0KKwlTRVRfU1lTVEVNX1NMRUVQX1BN
X09QUyhrb21lZGFfcG1fc3VzcGVuZCwga29tZWRhX3BtX3Jlc3VtZSkNCisJU0VUX1JVTlRJTUVf
UE1fT1BTKGtvbWVkYV9ydF9wbV9zdXNwZW5kLCBrb21lZGFfcnRfcG1fcmVzdW1lLCBOVUxMKQ0K
K307DQorDQogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIga29tZWRhX3BsYXRmb3JtX2Ry
aXZlciA9IHsNCiAJLnByb2JlCT0ga29tZWRhX3BsYXRmb3JtX3Byb2JlLA0KIAkucmVtb3ZlCT0g
a29tZWRhX3BsYXRmb3JtX3JlbW92ZSwNCiAJLmRyaXZlcgk9IHsNCiAJCS5uYW1lID0gImtvbWVk
YSIsDQogCQkub2ZfbWF0Y2hfdGFibGUJPSBrb21lZGFfb2ZfbWF0Y2gsDQotCQkucG0gPSBOVUxM
LA0KKwkJLnBtID0gJmtvbWVkYV9wbV9vcHMsDQogCX0sDQogfTsNCiANCi0tIA0KMS45LjENCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
