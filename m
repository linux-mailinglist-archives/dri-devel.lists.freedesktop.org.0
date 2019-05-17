Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF0C216A8
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 12:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1B78987A;
	Fri, 17 May 2019 10:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150053.outbound.protection.outlook.com [40.107.15.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9878987A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 10:05:09 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5055.eurprd08.prod.outlook.com (10.255.159.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 10:05:07 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 10:05:07 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 1/2] drm/komeda: Add komeda_fb_check_src_coords
Thread-Topic: [PATCH 1/2] drm/komeda: Add komeda_fb_check_src_coords
Thread-Index: AQHVDJgA8O3lpoQKg0O8UJ9n/d0vvA==
Date: Fri, 17 May 2019 10:05:06 +0000
Message-ID: <20190517100425.18716-2-james.qian.wang@arm.com>
References: <20190517100425.18716-1-james.qian.wang@arm.com>
In-Reply-To: <20190517100425.18716-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0222.apcprd02.prod.outlook.com
 (2603:1096:201:20::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e41575e-262e-4447-b7de-08d6daaf2340
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5055; 
x-ms-traffictypediagnostic: VE1PR08MB5055:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB50558F0D642D1B32F8EE5F0BB30B0@VE1PR08MB5055.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(346002)(366004)(396003)(199004)(189003)(4326008)(446003)(66556008)(81156014)(8676002)(66476007)(71190400001)(25786009)(81166006)(66446008)(316002)(486006)(2501003)(8936002)(50226002)(73956011)(66946007)(11346002)(68736007)(66066001)(64756008)(2616005)(14444005)(256004)(53936002)(2201001)(86362001)(386003)(6506007)(76176011)(52116002)(6116002)(1076003)(3846002)(99286004)(54906003)(2906002)(110136005)(36756003)(55236004)(6486002)(6512007)(476003)(5660300002)(478600001)(186003)(103116003)(14454004)(71200400001)(26005)(305945005)(6436002)(7736002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5055;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5FzYg6XV/xzkss9pv8niGp+BgChlUp1OoFDmX3SNSdgCxnpcRD+wE/dJFpQwELznypYlTCv0VxkYsrf/dEBbkPArfWJCmQz9s+4K3fEkDQzdBCEingLGDUH/e4aRbBzwSrj1+723/xDoRdvm1MtVAcioJgAxfMHrqP5BPqxRlHg5CCfgxdfHFrS/tn+DmAmGF2MkvJ/lZ/mILwKrbUNsQgW2dDiFabH6bqaavco4nxZZ2yn3FxvHjg+7tn4Uha5a+yUA00ss+r4sL3+aDKhPmNJRJgen3dNId6InvsxDHvmJy4OdWf0jDeQHU1KSMIGSbo1wtJ5Ha/xMKVdye5I6vKedekfqJKekfW/Y3wC0H4zmipaunSxnLVDcx3oKyRbOMIeJqAD44bM5uP/5NI0bgCk6k8efE6qcsfog4bIGZKA=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e41575e-262e-4447-b7de-08d6daaf2340
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 10:05:06.8457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5055
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXLECuAkNOwo4lKexmTeXwEgUEEKyyPRpvXbgIRBFeE=;
 b=iKRsMGBkyxG2iGRc0zCJXnC2DoU2i6cw3mfLrR1y+2/oCOI+haTxzcxmmc2lypGN0/Swu9YbR5/lwsJBxnSgsLRK5pIJKa31eEOMBhflEG2C51Jr3pZV/KYeAa0jGHV3g1Hy+Y2U4zZI2I2vK8/mzJk2HDSaSOCK082nfDsTctk=
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

QWRkIGtvbWVkYV9mYl9jaGVja19zcmNfY29vcmRzIGFuZCBjaGVjayBpZiB0aGUgbGF5ZXIgY29u
ZmlndXJlZCBzcmMNCnJlY3QgY2FuIG1lZXQgdGhlIHJlcXVpcmVtZW50IG9mIGZiIGFuZCBmYiBm
b3JtYXQuDQoNClNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4NCi0tLQ0KIC4uLi9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMgICB8IDIxICsrKysrKysrKysrKw0KIC4uLi9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmggICB8ICAyICsrDQogLi4uL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgMzQgKysrKysrKysrKysrKy0t
LS0tLQ0KIDMgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfZnJhbWVidWZmZXIuYw0KaW5kZXggMzYwYWI3MDFhODhiLi5kZDQyMzJkMTNiMjcgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1
ZmZlci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9m
cmFtZWJ1ZmZlci5jDQpAQCAtMjEzLDYgKzIxMywyNyBAQCBrb21lZGFfZmJfY3JlYXRlKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwNCiAJcmV0dXJuIEVSUl9Q
VFIocmV0KTsNCiB9DQogDQoraW50IGtvbWVkYV9mYl9jaGVja19zcmNfY29vcmRzKGNvbnN0IHN0
cnVjdCBrb21lZGFfZmIgKmtmYiwNCisJCQkgICAgICAgdTMyIHNyY194LCB1MzIgc3JjX3ksIHUz
MiBzcmNfdywgdTMyIHNyY19oKQ0KK3sNCisJY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAq
ZmIgPSAma2ZiLT5iYXNlOw0KKwljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvID0g
ZmItPmZvcm1hdDsNCisNCisJaWYgKChzcmNfeCArIHNyY193ID4gZmItPndpZHRoKSB8fCAoc3Jj
X3kgKyBzcmNfaCA+IGZiLT5oZWlnaHQpKSB7DQorCQlEUk1fREVCVUdfQVRPTUlDKCJJbnZhbGlk
IHNvdXJjZSBjb29yZGluYXRlLlxuIik7DQorCQlyZXR1cm4gLUVJTlZBTDsNCisJfQ0KKw0KKwlp
ZiAoKHNyY194ICUgaW5mby0+aHN1YikgfHwgKHNyY193ICUgaW5mby0+aHN1YikgfHwNCisJICAg
IChzcmNfeSAlIGluZm8tPnZzdWIpIHx8IChzcmNfaCAlIGluZm8tPnZzdWIpKSB7DQorCQlEUk1f
REVCVUdfQVRPTUlDKCJXcm9uZyBzdWJzYW1wbGluZyBkaW1lbnNpb24geDolZCwgeTolZCwgdzol
ZCwgaDolZCBmb3IgZm9ybWF0OiAleC5cbiIsDQorCQkJCSBzcmNfeCwgc3JjX3ksIHNyY193LCBz
cmNfaCwgaW5mby0+Zm9ybWF0KTsNCisJCXJldHVybiAtRUlOVkFMOw0KKwl9DQorDQorCXJldHVy
biAwOw0KK30NCisNCiBkbWFfYWRkcl90DQoga29tZWRhX2ZiX2dldF9waXhlbF9hZGRyKHN0cnVj
dCBrb21lZGFfZmIgKmtmYiwgaW50IHgsIGludCB5LCBpbnQgcGxhbmUpDQogew0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVy
LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZl
ci5oDQppbmRleCBmNDA0NmUyZTZmNzQuLmM2MWNhOThhM2E2MyAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmgNCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmgN
CkBAIC0zOCw2ICszOCw4IEBAIHN0cnVjdCBrb21lZGFfZmIgew0KIHN0cnVjdCBkcm1fZnJhbWVi
dWZmZXIgKg0KIGtvbWVkYV9mYl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0
IGRybV9maWxlICpmaWxlLA0KIAkJY29uc3Qgc3RydWN0IGRybV9tb2RlX2ZiX2NtZDIgKm1vZGVf
Y21kKTsNCitpbnQga29tZWRhX2ZiX2NoZWNrX3NyY19jb29yZHMoY29uc3Qgc3RydWN0IGtvbWVk
YV9mYiAqa2ZiLA0KKwkJCSAgICAgICB1MzIgc3JjX3gsIHUzMiBzcmNfeSwgdTMyIHNyY193LCB1
MzIgc3JjX2gpOw0KIGRtYV9hZGRyX3QNCiBrb21lZGFfZmJfZ2V0X3BpeGVsX2FkZHIoc3RydWN0
IGtvbWVkYV9mYiAqa2ZiLCBpbnQgeCwgaW50IHksIGludCBwbGFuZSk7DQogYm9vbCBrb21lZGFf
ZmJfaXNfbGF5ZXJfc3VwcG9ydGVkKHN0cnVjdCBrb21lZGFfZmIgKmtmYiwgdTMyIGxheWVyX3R5
cGUsDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGlwZWxpbmVfc3RhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BpcGVsaW5lX3N0YXRlLmMNCmluZGV4IGQzZjQxNGZjMzk1Ni4uZmNkMzQxNjRiM2My
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmVfc3RhdGUuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYw0KQEAgLTI2OSwyMSArMjY5LDMzIEBAIGtvbWVkYV9j
b21wb25lbnRfZ2V0X2F2YWlsX3NjYWxlcihzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywNCiAN
CiBzdGF0aWMgaW50DQoga29tZWRhX2xheWVyX2NoZWNrX2NmZyhzdHJ1Y3Qga29tZWRhX2xheWVy
ICpsYXllciwNCi0JCSAgICAgICBzdHJ1Y3Qga29tZWRhX3BsYW5lX3N0YXRlICprcGxhbmVfc3Qs
DQorCQkgICAgICAgc3RydWN0IGtvbWVkYV9mYiAqa2ZiLA0KIAkJICAgICAgIHN0cnVjdCBrb21l
ZGFfZGF0YV9mbG93X2NmZyAqZGZsb3cpDQogew0KLQlzdHJ1Y3Qga29tZWRhX2ZiICprZmIgPSB0
b19rZmIoa3BsYW5lX3N0LT5iYXNlLmZiKTsNCisJdTMyIGhzaXplX2luLCB2c2l6ZV9pbjsNCiAN
CiAJaWYgKCFrb21lZGFfZmJfaXNfbGF5ZXJfc3VwcG9ydGVkKGtmYiwgbGF5ZXItPmxheWVyX3R5
cGUsIGRmbG93LT5yb3QpKQ0KIAkJcmV0dXJuIC1FSU5WQUw7DQogDQotCWlmICghaW5fcmFuZ2Uo
JmxheWVyLT5oc2l6ZV9pbiwgZGZsb3ctPmluX3cpKSB7DQotCQlEUk1fREVCVUdfQVRPTUlDKCJz
cmNfdzogJWQgaXMgb3V0IG9mIHJhbmdlLlxuIiwgZGZsb3ctPmluX3cpOw0KKwlpZiAoa29tZWRh
X2ZiX2NoZWNrX3NyY19jb29yZHMoa2ZiLCBkZmxvdy0+aW5feCwgZGZsb3ctPmluX3ksDQorCQkJ
CSAgICAgICBkZmxvdy0+aW5fdywgZGZsb3ctPmluX2gpKQ0KKwkJcmV0dXJuIC1FSU5WQUw7DQor
DQorCWlmIChsYXllci0+YmFzZS5pZCA9PSBLT01FREFfQ09NUE9ORU5UX1dCX0xBWUVSKSB7DQor
CQloc2l6ZV9pbiA9IGRmbG93LT5vdXRfdzsNCisJCXZzaXplX2luID0gZGZsb3ctPm91dF9oOw0K
Kwl9IGVsc2Ugew0KKwkJaHNpemVfaW4gPSBkZmxvdy0+aW5fdzsNCisJCXZzaXplX2luID0gZGZs
b3ctPmluX2g7DQorCX0NCisNCisJaWYgKCFpbl9yYW5nZSgmbGF5ZXItPmhzaXplX2luLCBoc2l6
ZV9pbikpIHsNCisJCURSTV9ERUJVR19BVE9NSUMoImludmFsaWRhdGUgc3JjX3cgJWQuXG4iLCBo
c2l6ZV9pbik7DQogCQlyZXR1cm4gLUVJTlZBTDsNCiAJfQ0KIA0KLQlpZiAoIWluX3JhbmdlKCZs
YXllci0+dnNpemVfaW4sIGRmbG93LT5pbl9oKSkgew0KLQkJRFJNX0RFQlVHX0FUT01JQygic3Jj
X2g6ICVkIGlzIG91dCBvZiByYW5nZS5cbiIsIGRmbG93LT5pbl9oKTsNCisJaWYgKCFpbl9yYW5n
ZSgmbGF5ZXItPnZzaXplX2luLCB2c2l6ZV9pbikpIHsNCisJCURSTV9ERUJVR19BVE9NSUMoImlu
dmFsaWRhdGUgc3JjX2ggJWQuXG4iLCB2c2l6ZV9pbik7DQogCQlyZXR1cm4gLUVJTlZBTDsNCiAJ
fQ0KIA0KQEAgLTMwMiw3ICszMTQsNyBAQCBrb21lZGFfbGF5ZXJfdmFsaWRhdGUoc3RydWN0IGtv
bWVkYV9sYXllciAqbGF5ZXIsDQogCXN0cnVjdCBrb21lZGFfbGF5ZXJfc3RhdGUgKnN0Ow0KIAlp
bnQgaSwgZXJyOw0KIA0KLQllcnIgPSBrb21lZGFfbGF5ZXJfY2hlY2tfY2ZnKGxheWVyLCBrcGxh
bmVfc3QsIGRmbG93KTsNCisJZXJyID0ga29tZWRhX2xheWVyX2NoZWNrX2NmZyhsYXllciwga2Zi
LCBkZmxvdyk7DQogCWlmIChlcnIpDQogCQlyZXR1cm4gZXJyOw0KIA0KQEAgLTM2MCwxMSArMzcy
LDExIEBAIGtvbWVkYV93Yl9sYXllcl92YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX2xheWVyICp3Yl9s
YXllciwNCiAJc3RydWN0IGtvbWVkYV9mYiAqa2ZiID0gdG9fa2ZiKGNvbm5fc3QtPndyaXRlYmFj
a19qb2ItPmZiKTsNCiAJc3RydWN0IGtvbWVkYV9jb21wb25lbnRfc3RhdGUgKmNfc3Q7DQogCXN0
cnVjdCBrb21lZGFfbGF5ZXJfc3RhdGUgKnN0Ow0KLQlpbnQgaTsNCisJaW50IGksIGVycjsNCiAN
Ci0JaWYgKCFrb21lZGFfZmJfaXNfbGF5ZXJfc3VwcG9ydGVkKGtmYiwgd2JfbGF5ZXItPmxheWVy
X3R5cGUsDQotCQkJCQkgIGRmbG93LT5yb3QpKQ0KLQkJcmV0dXJuIC1FSU5WQUw7DQorCWVyciA9
IGtvbWVkYV9sYXllcl9jaGVja19jZmcod2JfbGF5ZXIsIGtmYiwgZGZsb3cpOw0KKwlpZiAoZXJy
KQ0KKwkJcmV0dXJuIGVycjsNCiANCiAJY19zdCA9IGtvbWVkYV9jb21wb25lbnRfZ2V0X3N0YXRl
X2FuZF9zZXRfdXNlcigmd2JfbGF5ZXItPmJhc2UsDQogCQkJY29ubl9zdC0+c3RhdGUsIGNvbm5f
c3QtPmNvbm5lY3RvciwgY29ubl9zdC0+Y3J0Yyk7DQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
