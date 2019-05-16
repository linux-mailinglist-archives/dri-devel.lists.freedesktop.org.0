Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BAA204A8
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 13:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BA289394;
	Thu, 16 May 2019 11:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0590889394
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 11:26:12 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6048.namprd05.prod.outlook.com (20.178.244.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.13; Thu, 16 May 2019 11:26:04 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::60b8:98a9:5fab:36ee]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::60b8:98a9:5fab:36ee%4]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 11:26:04 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/ttm, drm/vmwgfx: Use a configuration option for the
 TTM dma page pool
Thread-Topic: [PATCH v2] drm/ttm, drm/vmwgfx: Use a configuration option for
 the TTM dma page pool
Thread-Index: AQHVC9omNhkGcGtWE0uq/hFXJAII3g==
Date: Thu, 16 May 2019 11:26:04 +0000
Message-ID: <20190516112540.47685-1-thellstrom@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:45::18) To MN2PR05MB6141.namprd05.prod.outlook.com
 (2603:10b6:208:c7::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50407659-c8fc-4dbd-960b-08d6d9f1485a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MN2PR05MB6048; 
x-ms-traffictypediagnostic: MN2PR05MB6048:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB6048BCD11F9073D86A96E9BBA10A0@MN2PR05MB6048.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(346002)(366004)(39860400002)(189003)(199004)(4326008)(66476007)(14454004)(316002)(54906003)(2906002)(478600001)(53936002)(110136005)(6116002)(3846002)(2501003)(1076003)(86362001)(81156014)(71200400001)(6436002)(68736007)(6512007)(8676002)(26005)(66946007)(73956011)(66556008)(64756008)(66446008)(36756003)(66066001)(476003)(186003)(256004)(8936002)(5660300002)(52116002)(50226002)(6486002)(7736002)(25786009)(305945005)(99286004)(486006)(81166006)(2616005)(71190400001)(102836004)(386003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6048;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BnHLaFm7g725nqE4b0RI7M0V6Y1lPmniT4KQiSNkYf5bHOKO8LE4lUiNfgG5vagTdT2Z4Metds01ljhD7Rgj+Oxi1zRuNnWkz/GZThTGlUifvd/6jRivv3Xx4Q5tftKBEKcU5/9VuG5gtREOlttF7W0FgYkVtMIN8Gc3ajzUDbIBg8wUL5Kl95jpkRg8w5HzbziEvX6SHuj7951ZxDoJUatVkfYa2NO70tzfw8V8lCBgD88M+DlE4DN6E5R8P/fRo3xWpGaLaCzO50buiIlt4/8fLCPqyTUUYnQ+ZQTCtKy4wXEbiO/e8g7C8AATsuY1y7nT5Pcse6Z5OrufTX8R1IGPbuULT2QU8rWsKvcG6O4cAPmKy/6avI7deH6fRnIJlgJwIHptWITlHqeL7HL8IuUsLXW8WwYvfBBS+hAfpCI=
Content-ID: <29367DA1FDAB6749BC60D70813C10250@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50407659-c8fc-4dbd-960b-08d6d9f1485a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 11:26:04.8633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6048
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuY4n1WB1K44TNlVxeo0GaP55z/gsoFbdCH1Tc9qgLc=;
 b=mbKnHDUTZJI1N9b4MxUN9x8GO1Wh9s/KYOhFWGlm0tf4k9dKqETlLaQYNsvLe2DnOWLZshmvqRE88OCQg91qw3VEF3UIfXA/B/dFt/RGdb9ZxlHLHhyRLDJDE1tdurcMUQctoh3zbryMnjJvWPAlQ74kRZ3JXa75YzkTPyTR1HQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJpdmVycyBsaWtlIHZtd2dmeCBtYXkgd2FudCB0byB0ZXN0IHdoZXRoZXIgdGhlIGRtYSBwYWdl
IHBvb2wgaXMgcHJlc2VudA0Kb3Igbm90LiBTaW5jZSBpdCdzIGFjdGl2YXRlZCBieSBkZWZhdWx0
IGJ5IFRUTSBpZiBjb21waWxlZC1pbiwgZGVmaW5lIGENCmhpZGRlbiBjb25maWd1cmF0aW9uIG9w
dGlvbiB0aGF0IHRoZSBkcml2ZXIgY2FuIHRlc3QgZm9yLg0KDQpDYzogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxz
dHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9LY29u
ZmlnICAgICAgICAgICAgICAgICAgfCA3ICsrKysrKysNCiBkcml2ZXJzL2dwdS9kcm0vdHRtL01h
a2VmaWxlICAgICAgICAgICAgIHwgNCArKy0tDQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFn
ZV9hbGxvY19kbWEuYyB8IDMgLS0tDQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2
LmMgICAgICB8IDMgKy0tDQogaW5jbHVkZS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmggICAgICAg
ICB8IDIgKy0NCiA1IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1
L2RybS9LY29uZmlnDQppbmRleCAyMjY3ZTg0ZDVjYjQuLmJlNjYwMjdmN2RiZSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZp
Zw0KQEAgLTE2MCw2ICsxNjAsMTMgQEAgY29uZmlnIERSTV9UVE0NCiAJICBHUFUgbWVtb3J5IHR5
cGVzLiBXaWxsIGJlIGVuYWJsZWQgYXV0b21hdGljYWxseSBpZiBhIGRldmljZSBkcml2ZXINCiAJ
ICB1c2VzIGl0Lg0KIA0KK2NvbmZpZyBEUk1fVFRNX0RNQV9QQUdFX1BPT0wNCisJYm9vbA0KKwlk
ZXBlbmRzIG9uIERSTV9UVE0gJiYgKFNXSU9UTEIgfHwgSU5URUxfSU9NTVUpDQorCWRlZmF1bHQg
eQ0KKwloZWxwDQorCSAgQ2hvb3NlIHRoaXMgaWYgeW91IG5lZWQgdGhlIFRUTSBkbWEgcGFnZSBw
b29sDQorDQogY29uZmlnIERSTV9HRU1fQ01BX0hFTFBFUg0KIAlib29sDQogCWRlcGVuZHMgb24g
RFJNDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS9NYWtlZmlsZSBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vTWFrZWZpbGUNCmluZGV4IDAxZmM2NzBjZTdhMi4uY2FlYTJhMDk5NDk2IDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS9NYWtlZmlsZQ0KKysrIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS9NYWtlZmlsZQ0KQEAgLTQsOCArNCw4IEBADQogDQogdHRtLXkgOj0gdHRtX21l
bW9yeS5vIHR0bV90dC5vIHR0bV9iby5vIFwNCiAJdHRtX2JvX3V0aWwubyB0dG1fYm9fdm0ubyB0
dG1fbW9kdWxlLm8gXA0KLQl0dG1fZXhlY2J1Zl91dGlsLm8gdHRtX3BhZ2VfYWxsb2MubyB0dG1f
Ym9fbWFuYWdlci5vIFwNCi0JdHRtX3BhZ2VfYWxsb2NfZG1hLm8NCisJdHRtX2V4ZWNidWZfdXRp
bC5vIHR0bV9wYWdlX2FsbG9jLm8gdHRtX2JvX21hbmFnZXIubw0KIHR0bS0kKENPTkZJR19BR1Ap
ICs9IHR0bV9hZ3BfYmFja2VuZC5vDQordHRtLSQoQ09ORklHX0RSTV9UVE1fRE1BX1BBR0VfUE9P
TCkgKz0gdHRtX3BhZ2VfYWxsb2NfZG1hLm8NCiANCiBvYmotJChDT05GSUdfRFJNX1RUTSkgKz0g
dHRtLm8NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2Rt
YS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvY19kbWEuYw0KaW5kZXggZDU5
NGY3NTIwYjdiLi45OGQxMDBmZDE1OTkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9wYWdlX2FsbG9jX2RtYS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdl
X2FsbG9jX2RtYS5jDQpAQCAtMzMsNyArMzMsNiBAQA0KICAqICAgd2hlbiBmcmVlZCkuDQogICov
DQogDQotI2lmIGRlZmluZWQoQ09ORklHX1NXSU9UTEIpIHx8IGRlZmluZWQoQ09ORklHX0lOVEVM
X0lPTU1VKQ0KICNkZWZpbmUgcHJfZm10KGZtdCkgIltUVE1dICIgZm10DQogDQogI2luY2x1ZGUg
PGxpbnV4L2RtYS1tYXBwaW5nLmg+DQpAQCAtMTIzNCw1ICsxMjMzLDMgQEAgaW50IHR0bV9kbWFf
cGFnZV9hbGxvY19kZWJ1Z2ZzKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkNCiAJcmV0
dXJuIDA7DQogfQ0KIEVYUE9SVF9TWU1CT0xfR1BMKHR0bV9kbWFfcGFnZV9hbGxvY19kZWJ1Z2Zz
KTsNCi0NCi0jZW5kaWYNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jDQppbmRleCBkNTlj
NDc0YmUzOGUuLjg1MGVmYTE5NmQ3MiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2Rydi5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYu
Yw0KQEAgLTU3Miw4ICs1NzIsNyBAQCBzdGF0aWMgaW50IHZtd19kbWFfc2VsZWN0X21vZGUoc3Ry
dWN0IHZtd19wcml2YXRlICpkZXZfcHJpdikNCiAJZWxzZQ0KIAkJZGV2X3ByaXYtPm1hcF9tb2Rl
ID0gdm13X2RtYV9tYXBfcG9wdWxhdGU7DQogDQotCS8qIE5vIFRUTSBjb2hlcmVudCBwYWdlIHBv
b2w/IEZJWE1FOiBBc2sgVFRNIGluc3RlYWQhICovDQotICAgICAgICBpZiAoIShJU19FTkFCTEVE
KENPTkZJR19TV0lPVExCKSB8fCBJU19FTkFCTEVEKENPTkZJR19JTlRFTF9JT01NVSkpICYmDQor
CWlmICghSVNfRU5BQkxFRChDT05GSUdfRFJNX1RUTV9ETUFfUEFHRV9QT09MKSAmJg0KIAkgICAg
KGRldl9wcml2LT5tYXBfbW9kZSA9PSB2bXdfZG1hX2FsbG9jX2NvaGVyZW50KSkNCiAJCXJldHVy
biAtRUlOVkFMOw0KIA0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fcGFnZV9hbGxv
Yy5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmgNCmluZGV4IDRkOWIwMTlkMjUz
Yy4uYTZiNmVmNWY5YmY0IDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9wYWdlX2Fs
bG9jLmgNCisrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5oDQpAQCAtNzQsNyAr
NzQsNyBAQCB2b2lkIHR0bV91bm1hcF9hbmRfdW5wb3B1bGF0ZV9wYWdlcyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCB0dG1fZG1hX3R0ICp0dCk7DQogICovDQogaW50IHR0bV9wYWdlX2FsbG9j
X2RlYnVnZnMoc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKTsNCiANCi0jaWYgZGVmaW5l
ZChDT05GSUdfU1dJT1RMQikgfHwgZGVmaW5lZChDT05GSUdfSU5URUxfSU9NTVUpDQorI2lmIGRl
ZmluZWQoQ09ORklHX0RSTV9UVE1fRE1BX1BBR0VfUE9PTCkNCiAvKioNCiAgKiBJbml0aWFsaXpl
IHBvb2wgYWxsb2NhdG9yLg0KICAqLw0KLS0gDQoyLjIwLjENCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
