Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C227B6C
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 13:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A2989DC0;
	Thu, 23 May 2019 11:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116B789DC0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 11:10:18 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5166.eurprd08.prod.outlook.com (20.179.30.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 11:10:15 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1922.017; Thu, 23 May 2019
 11:10:15 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH v2 4/6] drm/komeda: Add writeback scaling support
Thread-Topic: [PATCH v2 4/6] drm/komeda: Add writeback scaling support
Thread-Index: AQHVEVgZBMehxAL8ckO0VU373wdL4Q==
Date: Thu, 23 May 2019 11:10:15 +0000
Message-ID: <20190523110933.10742-5-james.qian.wang@arm.com>
References: <20190523110933.10742-1-james.qian.wang@arm.com>
In-Reply-To: <20190523110933.10742-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0191.apcprd02.prod.outlook.com
 (2603:1096:201:21::27) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f45f281-5107-4f9b-f89a-08d6df6f3b64
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5166; 
x-ms-traffictypediagnostic: VE1PR08MB5166:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB5166B6144567F8BD5227B0BBB3010@VE1PR08MB5166.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(346002)(136003)(39860400002)(199004)(189003)(6512007)(25786009)(50226002)(53936002)(476003)(256004)(14444005)(6436002)(103116003)(446003)(2616005)(11346002)(99286004)(486006)(4326008)(6486002)(81156014)(26005)(81166006)(36756003)(66066001)(54906003)(110136005)(8676002)(2906002)(316002)(8936002)(73956011)(66946007)(2501003)(305945005)(68736007)(7736002)(64756008)(186003)(66556008)(1076003)(76176011)(55236004)(66446008)(66476007)(86362001)(6506007)(386003)(71200400001)(71190400001)(478600001)(3846002)(52116002)(6116002)(2201001)(102836004)(14454004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5166;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zMohkRaguvkZk5e/s8CwYmN6wVuZrOl/99WHTNMhcfrKomDblqeGOiOFNNkuM26oBCzQTtTn4ZNDH0pQgiIdlH9yC+o2vh2jfQwOc2BfgpQtRttyaCE4RHPMdkA2I67j8PaFDWJJUGyiU0hxS+rGoXclyIbIZ9X0eFW5nAW++HNL+Sgj64cAFAdZlTFEw3VXo0nM/cyEVgITNAnef614dWoOVT1TPL/cLc9yZDQKLYYnGct1sGZg8t3oDEUfOqZsgnIH1ROuSyK/UFURKxP6o1saH3XYWVUzCq2uNrIc9CoWbx7FmxsyHrmBqzfUj28BozbJiAwOAeJKlDi9+baKPhNqlrc2Z/Zv191YEfADu4p3M3KHaU8iT/d380n1HSu+4bn8WhiPkVMLwQMXl4p7YYSs7m7ZZPCJRbGzDUX22jU=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f45f281-5107-4f9b-f89a-08d6df6f3b64
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 11:10:15.3708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhHT3DG2lBc5atcjhuMBmHYziZaLKThrWBieaD1vqiA=;
 b=mOlNtxmXMcmab6CERvE+dQekv7pRr2ObUCVzbhmR6Vnk9OhKKoblpLRxLtAvtT2UhARt2jGHF3AdUlMBaFpXXDVxQlM9m/vFJ0vzFgeTkuBEgipUaGLrW424Xb+/I2wdf3N5yfNaHRhyYAO9uhpouU9GegUEX5CWd62lSNFSQiY=
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

MS4gQWRkIHNjYWxlciB0byB3cml0ZWJhY2sgcGlwZWxpbmUgdG8gZW5hYmxlIHRoZSB3cml0ZWJh
Y2sgc2NhbGluZyBzdXBwb3J0DQoyLiBEaXNwbGF5IEhXIGNhbiBub3QgZG8gdXBzY2FsaW5nIGZv
ciB3cml0ZWJhY2ssIGNoZWNrIGl0IHdoZW4gdmFsaWRhdGUuDQoNCnYyOiBSZWJhc2UNCg0KU2ln
bmVkLW9mZi1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVz
LnFpYW4ud2FuZ0Bhcm0uY29tPg0KLS0tDQogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3BpcGVsaW5lLmggIHwgIDIgKysNCiAuLi4vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVs
aW5lX3N0YXRlLmMgICAgfCAzNiArKysrKysrKysrKysrKystLS0tDQogLi4uL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIHwgIDggKy0tLS0NCiAuLi4vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyAgfCAgMiArKw0KIDQgZmlsZXMgY2hhbmdl
ZCwgMzQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaA0KaW5kZXggNDAw
YWYyMTdlZDg2Li45ZmZlMTFjOWYzODYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oDQpAQCAtNDcwLDQgKzQ3MCw2IEBA
IHZvaWQga29tZWRhX3BpcGVsaW5lX2Rpc2FibGUoc3RydWN0IGtvbWVkYV9waXBlbGluZSAqcGlw
ZSwNCiB2b2lkIGtvbWVkYV9waXBlbGluZV91cGRhdGUoc3RydWN0IGtvbWVkYV9waXBlbGluZSAq
cGlwZSwNCiAJCQkgICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSk7DQogDQor
dm9pZCBrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhzdHJ1Y3Qga29tZWRhX2RhdGFfZmxv
d19jZmcgKmRmbG93KTsNCisNCiAjZW5kaWYgLyogX0tPTUVEQV9QSVBFTElORV9IXyovDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxp
bmVfc3RhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lX3N0YXRlLmMNCmluZGV4IGE1MzAwZWY5MmViNy4uOWYwN2VmNjUwMDhmIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVf
c3RhdGUuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmVfc3RhdGUuYw0KQEAgLTM5MCw2ICszOTAsNyBAQCBrb21lZGFfc2NhbGVyX2NoZWNr
X2NmZyhzdHJ1Y3Qga29tZWRhX3NjYWxlciAqc2NhbGVyLA0KIAkJCXN0cnVjdCBrb21lZGFfZGF0
YV9mbG93X2NmZyAqZGZsb3cpDQogew0KIAl1MzIgaHNpemVfaW4sIHZzaXplX2luLCBoc2l6ZV9v
dXQsIHZzaXplX291dDsNCisJdTMyIG1heF91cHNjYWxpbmc7DQogDQogCWhzaXplX2luID0gZGZs
b3ctPmluX3c7DQogCXZzaXplX2luID0gZGZsb3ctPmluX2g7DQpAQCAtNDA4LDEzICs0MDksMjEg
QEAga29tZWRhX3NjYWxlcl9jaGVja19jZmcoc3RydWN0IGtvbWVkYV9zY2FsZXIgKnNjYWxlciwN
CiAJCXJldHVybiAtRUlOVkFMOw0KIAl9DQogDQotCWlmICghc2NhbGluZ19yYXRpb192YWxpZCho
c2l6ZV9pbiwgaHNpemVfb3V0LCBzY2FsZXItPm1heF91cHNjYWxpbmcsDQorCS8qIElmIGlucHV0
IGNvbWVzIGZyb20gY29tcGl6IHRoYXQgbWVhbnMgdGhlIHNjYWxpbmcgaXMgZm9yIHdyaXRlYmFj
aw0KKwkgKiBhbmQgc2NhbGVyIGNhbiBub3QgZG8gdXBzY2FsaW5nIGZvciB3cml0ZWJhY2sNCisJ
ICovDQorCWlmIChoYXNfYml0KGRmbG93LT5pbnB1dC5jb21wb25lbnQtPmlkLCBLT01FREFfUElQ
RUxJTkVfQ09NUElaUykpDQorCQltYXhfdXBzY2FsaW5nID0gMTsNCisJZWxzZQ0KKwkJbWF4X3Vw
c2NhbGluZyA9IHNjYWxlci0+bWF4X3Vwc2NhbGluZzsNCisNCisJaWYgKCFzY2FsaW5nX3JhdGlv
X3ZhbGlkKGhzaXplX2luLCBoc2l6ZV9vdXQsIG1heF91cHNjYWxpbmcsDQogCQkJCSBzY2FsZXIt
Pm1heF9kb3duc2NhbGluZykpIHsNCiAJCURSTV9ERUJVR19BVE9NSUMoIkludmFsaWQgaG9yaXpv
bnRhbCBzY2FsaW5nIHJhdGlvIik7DQogCQlyZXR1cm4gLUVJTlZBTDsNCiAJfQ0KIA0KLQlpZiAo
IXNjYWxpbmdfcmF0aW9fdmFsaWQodnNpemVfaW4sIHZzaXplX291dCwgc2NhbGVyLT5tYXhfdXBz
Y2FsaW5nLA0KKwlpZiAoIXNjYWxpbmdfcmF0aW9fdmFsaWQodnNpemVfaW4sIHZzaXplX291dCwg
bWF4X3Vwc2NhbGluZywNCiAJCQkJIHNjYWxlci0+bWF4X2Rvd25zY2FsaW5nKSkgew0KIAkJRFJN
X0RFQlVHX0FUT01JQygiSW52YWxpZCB2ZXJ0aWNhbCBzY2FsaW5nIHJhdGlvIik7DQogCQlyZXR1
cm4gLUVJTlZBTDsNCkBAIC02MTQsNiArNjIzLDE3IEBAIGtvbWVkYV90aW1pbmdfY3RybHJfdmFs
aWRhdGUoc3RydWN0IGtvbWVkYV90aW1pbmdfY3RybHIgKmN0cmxyLA0KIAlyZXR1cm4gMDsNCiB9
DQogDQordm9pZCBrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhzdHJ1Y3Qga29tZWRhX2Rh
dGFfZmxvd19jZmcgKmRmbG93KQ0KK3sNCisJdTMyIHcgPSBkZmxvdy0+aW5fdzsNCisJdTMyIGgg
PSBkZmxvdy0+aW5faDsNCisNCisJaWYgKGRybV9yb3RhdGlvbl85MF9vcl8yNzAoZGZsb3ctPnJv
dCkpDQorCQlzd2FwKHcsIGgpOw0KKw0KKwlkZmxvdy0+ZW5fc2NhbGluZyA9ICh3ICE9IGRmbG93
LT5vdXRfdykgfHwgKGggIT0gZGZsb3ctPm91dF9oKTsNCit9DQorDQogaW50IGtvbWVkYV9idWls
ZF9sYXllcl9kYXRhX2Zsb3coc3RydWN0IGtvbWVkYV9sYXllciAqbGF5ZXIsDQogCQkJCSBzdHJ1
Y3Qga29tZWRhX3BsYW5lX3N0YXRlICprcGxhbmVfc3QsDQogCQkJCSBzdHJ1Y3Qga29tZWRhX2Ny
dGNfc3RhdGUgKmtjcnRjX3N0LA0KQEAgLTY0MSwxNiArNjYxLDE4IEBAIGludCBrb21lZGFfYnVp
bGRfbGF5ZXJfZGF0YV9mbG93KHN0cnVjdCBrb21lZGFfbGF5ZXIgKmxheWVyLA0KIAlyZXR1cm4g
ZXJyOw0KIH0NCiANCisvKiB3cml0ZWJhY2sgZGF0YSBwYXRoOiBjb21waXogLT4gc2NhbGVyIC0+
IHdiX2xheWVyIC0+IG1lbW9yeSAqLw0KIGludCBrb21lZGFfYnVpbGRfd2JfZGF0YV9mbG93KHN0
cnVjdCBrb21lZGFfbGF5ZXIgKndiX2xheWVyLA0KIAkJCSAgICAgIHN0cnVjdCBkcm1fY29ubmVj
dG9yX3N0YXRlICpjb25uX3N0LA0KIAkJCSAgICAgIHN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAq
a2NydGNfc3QsDQogCQkJICAgICAgc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnICpkZmxvdykN
CiB7DQotCWlmICgoZGZsb3ctPmluX3cgIT0gZGZsb3ctPm91dF93KSB8fA0KLQkgICAgKGRmbG93
LT5pbl9oICE9IGRmbG93LT5vdXRfaCkpIHsNCi0JCURSTV9ERUJVR19BVE9NSUMoImN1cnJlbnQg
ZG8gbm90IHN1cHBvcnQgc2NhbGluZyB3cml0ZWJhY2suXG4iKTsNCi0JCXJldHVybiAtRUlOVkFM
Ow0KLQl9DQorCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uID0gY29ubl9zdC0+Y29ubmVjdG9y
Ow0KKwlpbnQgZXJyOw0KKw0KKwllcnIgPSBrb21lZGFfc2NhbGVyX3ZhbGlkYXRlKGNvbm4sIGtj
cnRjX3N0LCBkZmxvdyk7DQorCWlmIChlcnIpDQorCQlyZXR1cm4gZXJyOw0KIA0KIAlyZXR1cm4g
a29tZWRhX3diX2xheWVyX3ZhbGlkYXRlKHdiX2xheWVyLCBjb25uX3N0LCBkZmxvdyk7DQogfQ0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bs
YW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5j
DQppbmRleCBjZDNhNzE3MmE3NTYuLjk3ZDhhZGI2Y2QyYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMNCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMNCkBAIC0xNiw3ICsxNiw2
IEBAIGtvbWVkYV9wbGFuZV9pbml0X2RhdGFfZmxvdyhzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpz
dCwNCiAJCQkgICAgc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnICpkZmxvdykNCiB7DQogCXN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gc3QtPmZiOw0KLQl1MzIgdywgaDsNCiANCiAJbWVt
c2V0KGRmbG93LCAwLCBzaXplb2YoKmRmbG93KSk7DQogDQpAQCAtMzcsMTIgKzM2LDcgQEAga29t
ZWRhX3BsYW5lX2luaXRfZGF0YV9mbG93KHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0LA0KIAlk
Zmxvdy0+aW5fdyA9IHN0LT5zcmNfdyA+PiAxNjsNCiAJZGZsb3ctPmluX2ggPSBzdC0+c3JjX2gg
Pj4gMTY7DQogDQotCXcgPSBkZmxvdy0+aW5fdzsNCi0JaCA9IGRmbG93LT5pbl9oOw0KLQlpZiAo
ZHJtX3JvdGF0aW9uXzkwX29yXzI3MChkZmxvdy0+cm90KSkNCi0JCXN3YXAodywgaCk7DQotDQot
CWRmbG93LT5lbl9zY2FsaW5nID0gKHcgIT0gZGZsb3ctPm91dF93KSB8fCAoaCAhPSBkZmxvdy0+
b3V0X2gpOw0KKwlrb21lZGFfY29tcGxldGVfZGF0YV9mbG93X2NmZyhkZmxvdyk7DQogDQogCXJl
dHVybiAwOw0KIH0NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jDQppbmRleCAwYzFhNDIyMGMyODAuLmVlZDUyMTIx
OGVmMyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3diX2Nvbm5lY3Rvci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYw0KQEAgLTMxLDYgKzMxLDggQEAga29tZWRhX3diX2lu
aXRfZGF0YV9mbG93KHN0cnVjdCBrb21lZGFfbGF5ZXIgKndiX2xheWVyLA0KIAlkZmxvdy0+cGl4
ZWxfYmxlbmRfbW9kZSA9IERSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkU7DQogCWRmbG93LT5yb3Qg
PSBEUk1fTU9ERV9ST1RBVEVfMDsNCiANCisJa29tZWRhX2NvbXBsZXRlX2RhdGFfZmxvd19jZmco
ZGZsb3cpOw0KKw0KIAlyZXR1cm4gMDsNCiB9DQogDQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
