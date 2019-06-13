Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B234394D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 17:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B8689B06;
	Thu, 13 Jun 2019 15:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9EF89B06
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:13:13 +0000 (UTC)
Received: from AM0PR08MB4226.eurprd08.prod.outlook.com (20.179.36.17) by
 AM0PR08MB4468.eurprd08.prod.outlook.com (20.179.35.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 13 Jun 2019 15:13:10 +0000
Received: from AM0PR08MB4226.eurprd08.prod.outlook.com
 ([fe80::bc0c:5148:629e:1a31]) by AM0PR08MB4226.eurprd08.prod.outlook.com
 ([fe80::bc0c:5148:629e:1a31%6]) with mapi id 15.20.1987.010; Thu, 13 Jun 2019
 15:13:10 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>, Ayan
 Halder <Ayan.Halder@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Brian
 Starkey <Brian.Starkey@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/komeda: Make Komeda interrupts shareable
Thread-Topic: [PATCH v2] drm/komeda: Make Komeda interrupts shareable
Thread-Index: AQHVIfqDLdXCjTdCoUOWEBxFONS5qQ==
Date: Thu, 13 Jun 2019 15:13:10 +0000
Message-ID: <20190613151257.32297-1-ayan.halder@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0245.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::17) To AM0PR08MB4226.eurprd08.prod.outlook.com
 (2603:10a6:208:147::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [217.140.106.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bb68c40-2942-459d-a13c-08d6f011a561
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR08MB4468; 
x-ms-traffictypediagnostic: AM0PR08MB4468:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB4468FC61808D39073CF414FFE4EF0@AM0PR08MB4468.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:56;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(376002)(39860400002)(366004)(189003)(199004)(66066001)(72206003)(110136005)(316002)(2906002)(486006)(73956011)(66946007)(66476007)(66556008)(64756008)(81166006)(4326008)(8936002)(50226002)(44832011)(66446008)(476003)(6116002)(3846002)(2501003)(68736007)(2616005)(14454004)(36756003)(478600001)(6486002)(6512007)(53936002)(6436002)(81156014)(2201001)(71190400001)(71200400001)(6506007)(386003)(5024004)(14444005)(256004)(5660300002)(52116002)(1076003)(305945005)(86362001)(8676002)(7736002)(25786009)(26005)(186003)(102836004)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4468;
 H:AM0PR08MB4226.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dgS8jc7D6j/3ixr+u1JZoB6Qi0AyHIMvgqFl8k5MWHn/PPQwEyV1kBQFUMrPgTFSMXw48n0vYT6P9Uqcj6kHHWrKW5rwEWGDzhdrTIQ4X/BpL8K/yEjo6S9zBZPnOGMu31xkQBmdvvDE3gzB8FBrfyObY28vHs6kVgqYCml4MY5LA2k1kl36cXfBai31frDo+0HZfJJZ+4aqZqkcg1+1X+/ltFmGjUf2GkuDy2ndbGvFW/lTonZM3SuYfA+of3IDzduNt10tvGE/sQGQwbVaOxCZy0xn250E8CgREWS3rc6ugqCEoVQYIh/ZQWxOTU2QMvoLLO7F/YSUYiR3e24XJQ5qMFp8pQjY8Oit8ZBtYTIuk0lELSlMr/Kzvc1pNjpmWXe0kO9vO+vpctF3RWNcTaFw17OS0wAC5Fq0fLBxeXI=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb68c40-2942-459d-a13c-08d6f011a561
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 15:13:10.5039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ayan.Halder@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4468
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nzj6MzH2pmOXiTX7PZgRezf7afByiP578fSn+fcp0PM=;
 b=my07G9XgfGoIzq81PKv6TN0PMPMjv/U+xTj9K+LgyTYR51+teuXgTQsmLTGwHVkuWrVCN5ebf9GTvGBBhBGS5LsX/Ml4/3Pk17tT1QldbQa540MELh/2FjPotHrpVZ7JVFcpRsqG9if9ngZLSVLumFheHewTw0P+SJVksv0R2b0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
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
Cc: nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S29tZWRhIGludGVycnVwdHMgbWF5IGJlIHNoYXJlZCB3aXRoIG90aGVyIGhhcmR3YXJlIGJsb2Nr
cy4NCk9uZSBuZWVkcyB0byB1c2UgZGV2bV9yZXF1ZXN0X2lycSgpIHdpdGggSVJRRl9TSEFSRUQg
dG8gY3JlYXRlIGEgc2hhcmVkDQogaW50ZXJydXB0IGhhbmRsZXIuDQpBcyBhIHJlc3VsdCBvZiBu
b3QgdXNpbmcgZHJtX2lycV9pbnN0YWxsKCkgYXBpLCBvbmUgbmVlZHMgdG8gc2V0DQoiKHN0cnVj
dCBkcm1fZGV2aWNlICopLT5pcnFfZW5hYmxlZCA9IHRydWUvZmFsc2UiIHRvIGVuYWJsZS9kaXNh
YmxlDQp2YmxhbmsgaW50ZXJydXB0cy4NCg0KQ2hhbmdlcyBmcm9tIHYxOi0NCjEuIFNxdWFzaGVk
IHRoZSBmb2xsb3dpbmcgdHdvIHBhdGNoZXMgaW50byBvbmUgKGFzIHRoZSBzZWNvbmQgcGF0Y2gg
aXMgYQ0KY29uc2VxdWVuY2Ugb2YgdGhlIGZpcnN0IG9uZSk6LQ0KICAgZHJtL2tvbWVkYTogQXZv
aWQgdXNpbmcgRFJJVkVSX0lSUV9TSEFSRUQNCiAgIGRybS9rb21lZGE6IEVuYWJsZS9EaXNhYmxl
IHZibGFuayBpbnRlcnJ1cHRzDQoyLiBGaXhlZCB0aGUgY29tbWl0IG1lc3NhZ2UgKGFzIHBvaW50
ZWQgYnkgRGFuaWVsIFZldHRlcikNCjMuIFJlbW92ZWQgY2FsbHMgdG8gJ2RybV9pcnFfdW5pbnN0
YWxsKCknIGFzIHdlIGFyZSBubyBsb25nZXIgdXNpbmcNCmRybV9pcnFfaW5zdGFsbCgpDQo0LiBS
ZW1vdmVkIHRoZSBzdHJ1Y3QgbWVtYmVyICdrb21lZGFfa21zX2RyaXZlci5pcnFfaGFuZGxlcicg
YXMgaXQgaXMgbm90DQp1c2VkIGFueXdoZXJlLg0KDQpTaWduZWQtb2ZmLWJ5OiBBeWFuIEt1bWFy
IGhhbGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIHwgMTYgKysrKysrKysrLS0tLS0tLQ0KIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jDQppbmRleCA4NmY2NTQy
YWZiNDAuLmJiMmJmZmMwZTAyMiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2ttcy5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9rbXMuYw0KQEAgLTU4LDcgKzU4LDYgQEAgc3RhdGljIHN0cnVjdCBk
cm1fZHJpdmVyIGtvbWVkYV9rbXNfZHJpdmVyID0gew0KIAkuZHJpdmVyX2ZlYXR1cmVzID0gRFJJ
VkVSX0dFTSB8IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX0FUT01JQyB8DQogCQkJICAgRFJJVkVS
X1BSSU1FIHwgRFJJVkVSX0hBVkVfSVJRLA0KIAkubGFzdGNsb3NlCQkJPSBkcm1fZmJfaGVscGVy
X2xhc3RjbG9zZSwNCi0JLmlycV9oYW5kbGVyCQkJPSBrb21lZGFfa21zX2lycV9oYW5kbGVyLA0K
IAkuZ2VtX2ZyZWVfb2JqZWN0X3VubG9ja2VkCT0gZHJtX2dlbV9jbWFfZnJlZV9vYmplY3QsDQog
CS5nZW1fdm1fb3BzCQkJPSAmZHJtX2dlbV9jbWFfdm1fb3BzLA0KIAkuZHVtYl9jcmVhdGUJCQk9
IGtvbWVkYV9nZW1fY21hX2R1bWJfY3JlYXRlLA0KQEAgLTE5NCwyMyArMTkzLDI2IEBAIHN0cnVj
dCBrb21lZGFfa21zX2RldiAqa29tZWRhX2ttc19hdHRhY2goc3RydWN0IGtvbWVkYV9kZXYgKm1k
ZXYpDQogDQogCWRybV9tb2RlX2NvbmZpZ19yZXNldChkcm0pOw0KIA0KLQllcnIgPSBkcm1faXJx
X2luc3RhbGwoZHJtLCBtZGV2LT5pcnEpOw0KKwllcnIgPSBkZXZtX3JlcXVlc3RfaXJxKGRybS0+
ZGV2LCBtZGV2LT5pcnEsDQorCQkJICAgICAgIGtvbWVkYV9rbXNfaXJxX2hhbmRsZXIsIElSUUZf
U0hBUkVELA0KKwkJCSAgICAgICBkcm0tPmRyaXZlci0+bmFtZSwgZHJtKTsNCiAJaWYgKGVycikN
CiAJCWdvdG8gY2xlYW51cF9tb2RlX2NvbmZpZzsNCiANCiAJZXJyID0gbWRldi0+ZnVuY3MtPmVu
YWJsZV9pcnEobWRldik7DQogCWlmIChlcnIpDQotCQlnb3RvIHVuaW5zdGFsbF9pcnE7DQorCQln
b3RvIGNsZWFudXBfbW9kZV9jb25maWc7DQorDQorCWRybS0+aXJxX2VuYWJsZWQgPSB0cnVlOw0K
IA0KIAllcnIgPSBkcm1fZGV2X3JlZ2lzdGVyKGRybSwgMCk7DQogCWlmIChlcnIpDQotCQlnb3Rv
IHVuaW5zdGFsbF9pcnE7DQorCQlnb3RvIGNsZWFudXBfbW9kZV9jb25maWc7DQogDQogCXJldHVy
biBrbXM7DQogDQotdW5pbnN0YWxsX2lycToNCi0JZHJtX2lycV91bmluc3RhbGwoZHJtKTsNCiBj
bGVhbnVwX21vZGVfY29uZmlnOg0KKwlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7DQogCWRybV9t
b2RlX2NvbmZpZ19jbGVhbnVwKGRybSk7DQogCWtvbWVkYV9rbXNfY2xlYW51cF9wcml2YXRlX29i
anMoa21zKTsNCiBmcmVlX2ttczoNCkBAIC0yMjMsOSArMjI1LDkgQEAgdm9pZCBrb21lZGFfa21z
X2RldGFjaChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcykNCiAJc3RydWN0IGRybV9kZXZpY2Ug
KmRybSA9ICZrbXMtPmJhc2U7DQogCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0gZHJtLT5kZXZf
cHJpdmF0ZTsNCiANCisJZHJtLT5pcnFfZW5hYmxlZCA9IGZhbHNlOw0KIAltZGV2LT5mdW5jcy0+
ZGlzYWJsZV9pcnEobWRldik7DQogCWRybV9kZXZfdW5yZWdpc3Rlcihkcm0pOw0KLQlkcm1faXJx
X3VuaW5zdGFsbChkcm0pOw0KIAljb21wb25lbnRfdW5iaW5kX2FsbChtZGV2LT5kZXYsIGRybSk7
DQogCWtvbWVkYV9rbXNfY2xlYW51cF9wcml2YXRlX29ianMoa21zKTsNCiAJZHJtX21vZGVfY29u
ZmlnX2NsZWFudXAoZHJtKTsNCi0tIA0KMi4yMS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
