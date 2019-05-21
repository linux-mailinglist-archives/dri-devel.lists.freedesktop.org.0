Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A7B24B9E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 11:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1977D8928F;
	Tue, 21 May 2019 09:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10066.outbound.protection.outlook.com [40.107.1.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4CC8928F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 09:34:51 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5134.eurprd08.prod.outlook.com (20.179.30.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 21 May 2019 09:34:48 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 09:34:48 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "ezequiel@collabora.com" <ezequiel@collabora.com>, "uma.shankar@intel.com"
 <uma.shankar@intel.com>
Subject: [PATCH 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Topic: [PATCH 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Index: AQHVD7huQH3p8BmTy0SztNn0GEsDBw==
Date: Tue, 21 May 2019 09:34:48 +0000
Message-ID: <20190521093411.26609-3-james.qian.wang@arm.com>
References: <20190521093411.26609-1-james.qian.wang@arm.com>
In-Reply-To: <20190521093411.26609-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0002.apcprd03.prod.outlook.com
 (2603:1096:203:2e::14) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 303d5890-5b47-4f87-a689-08d6ddcf90e4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5134; 
x-ms-traffictypediagnostic: VE1PR08MB5134:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB5134C7CBD45F934CC2FA6430B3070@VE1PR08MB5134.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(376002)(366004)(396003)(199004)(189003)(54906003)(486006)(68736007)(110136005)(4326008)(103116003)(2501003)(66446008)(64756008)(66066001)(73956011)(66946007)(50226002)(11346002)(66556008)(66476007)(36756003)(8676002)(2906002)(81156014)(25786009)(8936002)(186003)(26005)(446003)(81166006)(476003)(86362001)(3846002)(99286004)(256004)(14444005)(478600001)(76176011)(52116002)(5660300002)(2616005)(6116002)(305945005)(7736002)(53936002)(6512007)(2201001)(71190400001)(6486002)(316002)(6436002)(71200400001)(55236004)(14454004)(1076003)(6506007)(102836004)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5134;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sIhhLPl405iQ7WM7alS+hJgqrnhpQ0HlTV705jsVkXxjVdRc4s5hFHlINq/ouyyskx+93vlz3YarYfuDHt8XPRh0jgV+9Qex6kcX0w/aVvcB9xUPF0lkzkq9VXdO66YmCaZu6DwnDGxo31ZTosKTjEC8uZgHE4pk3mMdb5zWaEye9Lya5hc++ZcR4fveJzJX1CKaOoRoPcfl/BQL7N6LybG0twF2iFZu2zut5rkm0ywRXVXNJvpH8denxAHBInBAQcWotXOWK9VWesuveVFFzbIJ+zG49SBMFWKTx9JRYNogixvaIWRxX9nWBG6fAQcIuNmnapUhpcqWCkcQhmoCt2SnxpR/jI+X86B0PMXzx9gs4AbcY+s2aU0dn4iiTe4TJLGXidtH+a5PqFDeWImHz83fqhGoeC8T3g/Wyi1Nz+Y=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303d5890-5b47-4f87-a689-08d6ddcf90e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 09:34:48.1444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SACDZ4hTbum31xpttgLhpCCzbxxM7a+7/P0m7NjhbWw=;
 b=coCCW0tvPgLMNgG0BUrnWuH7LVm5We0uEHa+llNgammgC6/BKdFdAxKYkCaHTtTcfNOabJ7Xn7jma2xu4GKRG+i1skow1TsRUhIB5eMqmVSm/QoRxzUHr5RUhUKsn5oDimD2kcAuQVnKR0G1xbelgxD1VdiC0nAKtIKNDNXAPyc=
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

TWFueSBrb21lZGEgY29tcG9uZW50IHN1cHBvcnQgY29sb3IgbWFuYWdlbWVudCBsaWtlIGxheWVy
IGFuZCBJUFMsIHNvDQprb21lZGFfY29sb3JfbWFuYWdlci9zdGF0ZSBhcmUgaW50cm9kdWNlZCB0
byBtYW5hZ2VyIGdhbW1hLCBjc2MgYW5kIGRlZ2FtbWENCnRvZ2V0aGVyIGZvciBlYXNpbHkgc2hh
cmUgaXQgdG8gbXVsdGlwbGUgY29tcG9ucGVudC4NCg0KQW5kIGZvciBrb21lZGFfY29sb3JfbWFu
YWdlciB3aGljaDoNCi0gY29udmVydCBkcm0gM2QgZ2FtbWEgbHV0IHRvIGtvbWVkYSBzcGVjaWZp
YyBnYW1tYSBjb2VmZnMNCi0gZ2FtbWEgdGFibGUgbWFuYWdlbWVudCBhbmQgaGlkZSB0aGUgSFcg
ZGlmZmVyZW5jZSBmb3Iga29tZWRhLUNPUkUNCg0KU2lnbmVkLW9mZi1ieTogSmFtZXMgUWlhbiBX
YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPg0KLS0t
DQogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5jICAgIHwgMTI2ICsr
KysrKysrKysrKysrKysrKw0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21n
bXQuaCAgICB8ICAzMiArKysrLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMTU2IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMNCmluZGV4IDlkMTRhOTJkYmIxNy4uYmYyMzg4
ZDY0MWI5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY29sb3JfbWdtdC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMNCkBAIC00LDcgKzQsOSBAQA0KICAqIEF1dGhvcjogSmFt
ZXMuUWlhbi5XYW5nIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4NCiAgKg0KICAqLw0KKyNpbmNs
dWRlIDxkcm0vZHJtX3ByaW50Lmg+DQoNCisjaW5jbHVkZSAibWFsaWRwX3V0aWxzLmgiDQogI2lu
Y2x1ZGUgImtvbWVkYV9jb2xvcl9tZ210LmgiDQoNCiAvKiAxMGJpdCBwcmVjaXNpb24gWVVWMlJH
QiBtYXRyaXggKi8NCkBAIC02NSwzICs2NywxMjcgQEAgY29uc3QgczMyICprb21lZGFfc2VsZWN0
X3l1djJyZ2JfY29lZmZzKHUzMiBjb2xvcl9lbmNvZGluZywgdTMyIGNvbG9yX3JhbmdlKQ0KDQog
CXJldHVybiBjb2VmZnM7DQogfQ0KKw0KK3N0cnVjdCBnYW1tYV9jdXJ2ZV9zZWN0b3Igew0KKwl1
MzIgYm91bmRhcnlfc3RhcnQ7DQorCXUzMiBudW1fb2Zfc2VnbWVudHM7DQorCXUzMiBzZWdtZW50
X3dpZHRoOw0KK307DQorDQorc3RydWN0IGdhbW1hX2N1cnZlX3NlZ21lbnQgew0KKwl1MzIgc3Rh
cnQ7DQorCXUzMiBlbmQ7DQorfTsNCisNCitzdGF0aWMgc3RydWN0IGdhbW1hX2N1cnZlX3NlY3Rv
ciBzZWN0b3JfdGJsW10gPSB7DQorCXsgMCwgICAgNCwgIDQgICB9LA0KKwl7IDE2LCAgIDQsICA0
ICAgfSwNCisJeyAzMiwgICA0LCAgOCAgIH0sDQorCXsgNjQsICAgNCwgIDE2ICB9LA0KKwl7IDEy
OCwgIDQsICAzMiAgfSwNCisJeyAyNTYsICA0LCAgNjQgIH0sDQorCXsgNTEyLCAgMTYsIDMyICB9
LA0KKwl7IDEwMjQsIDI0LCAxMjggfSwNCit9Ow0KKw0KK3N0YXRpYyBzdHJ1Y3QgZ2FtbWFfY3Vy
dmVfc2VjdG9yIGlnYW1tYV9zZWN0b3JfdGJsW10gPSB7DQorCXswLCA2NCwgNjR9LA0KK307DQor
DQorc3RhdGljIHZvaWQNCitkcm1fbHV0X3RvX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Js
b2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcywNCisJCSAgc3RydWN0IGdhbW1hX2N1cnZlX3NlY3Rv
ciAqc2VjdG9yX3RibCwgdTMyIG51bV9zZWN0b3JzKQ0KK3sNCisJc3RydWN0IGRybV9jb2xvcl9s
dXQgKmx1dDsNCisJdTMyIGksIGosIGluLCBudW0gPSAwOw0KKw0KKwlpZiAoIWx1dF9ibG9iKQ0K
KwkJcmV0dXJuOw0KKw0KKwlsdXQgPSBsdXRfYmxvYi0+ZGF0YTsNCisNCisJZm9yIChpID0gMDsg
aSA8IG51bV9zZWN0b3JzOyBpKyspIHsNCisJCWZvciAoaiA9IDA7IGogPCBzZWN0b3JfdGJsW2ld
Lm51bV9vZl9zZWdtZW50czsgaisrKSB7DQorCQkJaW4gPSBzZWN0b3JfdGJsW2ldLmJvdW5kYXJ5
X3N0YXJ0ICsNCisJCQkgICAgIGogKiBzZWN0b3JfdGJsW2ldLnNlZ21lbnRfd2lkdGg7DQorDQor
CQkJY29lZmZzW251bSsrXSA9IGRybV9jb2xvcl9sdXRfZXh0cmFjdChsdXRbaW5dLnJlZCwNCisJ
CQkJCQlLT01FREFfQ09MT1JfUFJFQ0lTSU9OKTsNCisJCX0NCisJfQ0KKw0KKwljb2VmZnNbbnVt
XSA9IEJJVChLT01FREFfQ09MT1JfUFJFQ0lTSU9OKTsNCit9DQorDQordm9pZCBkcm1fbHV0X3Rv
X2lnYW1tYV9jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpj
b2VmZnMpDQorew0KKwlkcm1fbHV0X3RvX2NvZWZmcyhsdXRfYmxvYiwgY29lZmZzLA0KKwkJCSAg
aWdhbW1hX3NlY3Rvcl90YmwsIEFSUkFZX1NJWkUoaWdhbW1hX3NlY3Rvcl90YmwpKTsNCit9DQor
DQordm9pZCBkcm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9i
ICpsdXRfYmxvYiwgdTMyICpjb2VmZnMpDQorew0KKwlkcm1fbHV0X3RvX2NvZWZmcyhsdXRfYmxv
YiwgY29lZmZzLA0KKwkJCSAgc2VjdG9yX3RibCwgQVJSQVlfU0laRShzZWN0b3JfdGJsKSk7DQor
fQ0KKw0KK3ZvaWQgZHJtX2N0bV90b19jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpj
dG1fYmxvYiwgdTMyICpjb2VmZnMpDQorew0KKwlzdHJ1Y3QgZHJtX2NvbG9yX2N0bSAqY3RtOw0K
Kwl1MzIgaTsNCisNCisJaWYgKCFjdG1fYmxvYikNCisJCXJldHVybjsNCisNCisJY3RtID0gY3Rt
X2Jsb2ItPmRhdGE7DQorDQorCWZvciAoaSA9IDA7IGkgPCBLT01FREFfTl9DVE1fQ09FRkZTOyAr
K2kpIHsNCisJCS8qIENvbnZlcnQgZnJvbSBTMzEuMzIgdG8gUTMuMTIuICovDQorCQlzNjQgdiA9
IGN0bS0+bWF0cml4W2ldOw0KKw0KKwkJY29lZmZzW2ldID0gY2xhbXBfdmFsKHYsIDEgLSAoMUxM
IDw8IDM0KSwgKDFMTCA8PCAzNCkgLSAxKSA+PiAyMDsNCisJfQ0KK30NCisNCit2b2lkIGtvbWVk
YV9jb2xvcl9kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqbmV3LA0K
KwkJCQkgIHN0cnVjdCBrb21lZGFfY29sb3Jfc3RhdGUgKm9sZCkNCit7DQorCW5ldy0+aWdhbW1h
ID0ga29tZWRhX2NvZWZmc19nZXQob2xkLT5pZ2FtbWEpOw0KKwluZXctPmZnYW1tYSA9IGtvbWVk
YV9jb2VmZnNfZ2V0KG9sZC0+ZmdhbW1hKTsNCit9DQorDQordm9pZCBrb21lZGFfY29sb3JfY2xl
YW51cF9zdGF0ZShzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRlICpjb2xvcl9zdCkNCit7DQorCWtv
bWVkYV9jb2VmZnNfcHV0KGNvbG9yX3N0LT5pZ2FtbWEpOw0KKwlrb21lZGFfY29lZmZzX3B1dChj
b2xvcl9zdC0+ZmdhbW1hKTsNCit9DQorDQoraW50IGtvbWVkYV9jb2xvcl92YWxpZGF0ZShzdHJ1
Y3Qga29tZWRhX2NvbG9yX21hbmFnZXIgKm1nciwNCisJCQkgIHN0cnVjdCBrb21lZGFfY29sb3Jf
c3RhdGUgKnN0LA0KKwkJCSAgc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICppZ2FtbWFfYmxvYiwN
CisJCQkgIHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqZmdhbW1hX2Jsb2IpDQorew0KKwl1MzIg
Y29lZmZzW0tPTUVEQV9OX0dBTU1BX0NPRUZGU107DQorDQorCWtvbWVkYV9jb2xvcl9jbGVhbnVw
X3N0YXRlKHN0KTsNCisNCisJaWYgKGlnYW1tYV9ibG9iKSB7DQorCQlkcm1fbHV0X3RvX2lnYW1t
YV9jb2VmZnMoaWdhbW1hX2Jsb2IsIGNvZWZmcyk7DQorCQlzdC0+aWdhbW1hID0ga29tZWRhX2Nv
ZWZmc19yZXF1ZXN0KG1nci0+aWdhbW1hX21nciwgY29lZmZzKTsNCisJCWlmICghc3QtPmlnYW1t
YSkgew0KKwkJCURSTV9ERUJVR19BVE9NSUMoInJlcXVlc3QgaWdhbW1hIHRhYmxlIGZhaWxlZC5c
biIpOw0KKwkJCXJldHVybiAtRUJVU1k7DQorCQl9DQorCX0NCisNCisJaWYgKGZnYW1tYV9ibG9i
KSB7DQorCQlkcm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoZmdhbW1hX2Jsb2IsIGNvZWZmcyk7DQor
CQlzdC0+ZmdhbW1hID0ga29tZWRhX2NvZWZmc19yZXF1ZXN0KG1nci0+ZmdhbW1hX21nciwgY29l
ZmZzKTsNCisJCWlmICghc3QtPmZnYW1tYSkgew0KKwkJCURSTV9ERUJVR19BVE9NSUMoInJlcXVl
c3QgZmdhbW1hIHRhYmxlIGZhaWxlZC5cbiIpOw0KKwkJCXJldHVybiAtRUJVU1k7DQorCQl9DQor
CX0NCisNCisJcmV0dXJuIDA7DQorfQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaA0KaW5kZXggYTJkZjIxOGY1OGU3Li40
MWE5NmIzYjU0MGYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaA0KQEAgLTQsMTQgKzQsNDIgQEANCiAgKiBBdXRo
b3I6IEphbWVzLlFpYW4uV2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5jb20+DQogICoNCiAgKi8N
Ci0NCiAjaWZuZGVmIF9LT01FREFfQ09MT1JfTUdNVF9IXw0KICNkZWZpbmUgX0tPTUVEQV9DT0xP
Ul9NR01UX0hfDQoNCiAjaW5jbHVkZSA8ZHJtL2RybV9jb2xvcl9tZ210Lmg+DQorI2luY2x1ZGUg
ImtvbWVkYV9jb2VmZnMuaCINCg0KICNkZWZpbmUgS09NRURBX05fWVVWMlJHQl9DT0VGRlMJCTEy
DQorI2RlZmluZSBLT01FREFfTl9SR0IyWVVWX0NPRUZGUwkJMTINCisjZGVmaW5lIEtPTUVEQV9D
T0xPUl9QUkVDSVNJT04JCTEyDQorI2RlZmluZSBLT01FREFfTl9HQU1NQV9DT0VGRlMJCTY1DQor
I2RlZmluZSBLT01FREFfQ09MT1JfTFVUX1NJWkUJCUJJVChLT01FREFfQ09MT1JfUFJFQ0lTSU9O
KQ0KKyNkZWZpbmUgS09NRURBX05fQ1RNX0NPRUZGUwkJOQ0KKw0KK3N0cnVjdCBrb21lZGFfY29s
b3JfbWFuYWdlciB7DQorCXN0cnVjdCBrb21lZGFfY29lZmZzX21hbmFnZXIgKmlnYW1tYV9tZ3I7
DQorCXN0cnVjdCBrb21lZGFfY29lZmZzX21hbmFnZXIgKmZnYW1tYV9tZ3I7DQorCWJvb2wgaGFz
X2N0bTsNCit9Ow0KKw0KK3N0cnVjdCBrb21lZGFfY29sb3Jfc3RhdGUgew0KKwlzdHJ1Y3Qga29t
ZWRhX2NvZWZmc190YWJsZSAqaWdhbW1hOw0KKwlzdHJ1Y3Qga29tZWRhX2NvZWZmc190YWJsZSAq
ZmdhbW1hOw0KK307DQorDQordm9pZCBrb21lZGFfY29sb3JfZHVwbGljYXRlX3N0YXRlKHN0cnVj
dCBrb21lZGFfY29sb3Jfc3RhdGUgKm5ldywNCisJCQkJICBzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0
YXRlICpvbGQpOw0KK3ZvaWQga29tZWRhX2NvbG9yX2NsZWFudXBfc3RhdGUoc3RydWN0IGtvbWVk
YV9jb2xvcl9zdGF0ZSAqY29sb3Jfc3QpOw0KK2ludCBrb21lZGFfY29sb3JfdmFsaWRhdGUoc3Ry
dWN0IGtvbWVkYV9jb2xvcl9tYW5hZ2VyICptZ3IsDQorCQkJICBzdHJ1Y3Qga29tZWRhX2NvbG9y
X3N0YXRlICpzdCwNCisJCQkgIHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqaWdhbW1hX2Jsb2Is
DQorCQkJICBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmZnYW1tYV9ibG9iKTsNCisNCit2b2lk
IGRybV9sdXRfdG9faWdhbW1hX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9i
bG9iLCB1MzIgKmNvZWZmcyk7DQordm9pZCBkcm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoc3RydWN0
IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMpOw0KK3ZvaWQgZHJtX2N0
bV90b19jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpjb2Vm
ZnMpOw0KDQogY29uc3QgczMyICprb21lZGFfc2VsZWN0X3l1djJyZ2JfY29lZmZzKHUzMiBjb2xv
cl9lbmNvZGluZywgdTMyIGNvbG9yX3JhbmdlKTsNCg0KLSNlbmRpZg0KKyNlbmRpZiAvKl9LT01F
REFfQ09MT1JfTUdNVF9IXyovDQotLQ0KMi4xNy4xDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
