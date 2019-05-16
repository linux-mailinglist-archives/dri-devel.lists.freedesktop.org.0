Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1272026F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 11:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D498932E;
	Thu, 16 May 2019 09:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720067.outbound.protection.outlook.com [40.107.72.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6E08932E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 09:23:25 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6527.namprd05.prod.outlook.com (20.178.246.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.7; Thu, 16 May 2019 09:23:17 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::60b8:98a9:5fab:36ee]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::60b8:98a9:5fab:36ee%4]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 09:23:17 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/ttm, drm/vmwgfx: Use a configuration option for the TTM
 dma page pool
Thread-Topic: [PATCH] drm/ttm, drm/vmwgfx: Use a configuration option for the
 TTM dma page pool
Thread-Index: AQHVC8j+6axTnEl2aUOfUZSS+aLflA==
Date: Thu, 16 May 2019 09:23:16 +0000
Message-ID: <20190516092251.39351-1-thellstrom@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0901CA0101.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::27) To MN2PR05MB6141.namprd05.prod.outlook.com
 (2603:10b6:208:c7::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32dca1cd-18ab-4908-c0e1-08d6d9e0208b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MN2PR05MB6527; 
x-ms-traffictypediagnostic: MN2PR05MB6527:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB65273700C4DB54A12D6E8CEFA10A0@MN2PR05MB6527.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(136003)(396003)(376002)(346002)(199004)(189003)(6116002)(8936002)(6486002)(3846002)(486006)(2501003)(476003)(53936002)(2616005)(36756003)(66066001)(81166006)(66476007)(26005)(64756008)(66556008)(66446008)(256004)(81156014)(66946007)(73956011)(186003)(2906002)(110136005)(4326008)(99286004)(25786009)(1076003)(7736002)(316002)(305945005)(54906003)(478600001)(8676002)(71190400001)(6436002)(86362001)(50226002)(14454004)(52116002)(102836004)(71200400001)(386003)(6512007)(68736007)(5660300002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6527;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y4yjj/lyokuU4kHhv/ez9TtxGYUzC3ZyzJjTMf8XDLWzorFKfoP2W5r8nD6YjC15Pm7aXOGf67wPysTCB6kGx2I4WKHM5Us8Nlt0ukNU/BcqGi0+EbNvTGcC7l4h8HBMJrkeiTsn+tIZ2LVJY74vgq3Qab4h8A+OG4BP/ysVtxOjyp19Qmw43xhrpcgFbdCno+MmDpMdmTlOKeh3yyiKoyyXmYInb4vHym/cDyiAUOOvJ+DJ69OI1LVMNHUJi2m/tDNBwS9xrbbCNHkBD5KOfUyUgRgF3YrocSb7OjVZkKoLXQ+vrTc9oeSx840s8QyA3Xen2xWQszdH9JG1A1CSJSGmrLInrCUBktSkPDrpDPEuGQtPK1vY1/rZfTbGm9pkBW/5LkAFIbn96qU7K+Ae7rKP3tH/NTDyyqUmUjGHI+I=
Content-ID: <92FBFAF986F67441A303D49A77568A97@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dca1cd-18ab-4908-c0e1-08d6d9e0208b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 09:23:16.9720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6527
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WeKAnJzsDbJpU8CM6lbnryLFHi/fw5SaLm6OzYOGY4=;
 b=tSg2sTMAMNR1C8IoSA7OqcQ+wDUeF+kz8mdEAZ6OlUujhNrO16ONXNvYPe/4fYfBbLw5zJiMFNCpwmqWsY1LWUUZue1m3ePmgdZu6DWNVDs4DYlOSPStieKuZkaa/4GzHjN1HZEcQH7tyRX7B5rcbB0i6++wv8Hr9OOHyZ4Eko8=
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
dHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL0tjb25m
aWcgICAgICAgICAgICAgICAgICB8IDUgKysrKysNCiBkcml2ZXJzL2dwdS9kcm0vdHRtL01ha2Vm
aWxlICAgICAgICAgICAgIHwgNCArKy0tDQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9h
bGxvY19kbWEuYyB8IDMgLS0tDQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMg
ICAgICB8IDMgKy0tDQogaW5jbHVkZS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmggICAgICAgICB8
IDIgKy0NCiA1IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJt
L0tjb25maWcNCmluZGV4IDIyNjdlODRkNWNiNC4uZjczM2E5MjczYjNmIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQpA
QCAtMTYwLDYgKzE2MCwxMSBAQCBjb25maWcgRFJNX1RUTQ0KIAkgIEdQVSBtZW1vcnkgdHlwZXMu
IFdpbGwgYmUgZW5hYmxlZCBhdXRvbWF0aWNhbGx5IGlmIGEgZGV2aWNlIGRyaXZlcg0KIAkgIHVz
ZXMgaXQuDQogDQorY29uZmlnIERSTV9UVE1fRE1BX1BBR0VfUE9PTA0KKyAgICAgICAgYm9vbA0K
KwlkZXBlbmRzIG9uIERSTV9UVE0gJiYgKFNXSU9UTEIgfHwgSU5URUxfSU9NTVUpDQorCWRlZmF1
bHQgeQ0KKw0KIGNvbmZpZyBEUk1fR0VNX0NNQV9IRUxQRVINCiAJYm9vbA0KIAlkZXBlbmRzIG9u
IERSTQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vTWFrZWZpbGUgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL01ha2VmaWxlDQppbmRleCAwMWZjNjcwY2U3YTIuLmNhZWEyYTA5OTQ5NiAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vTWFrZWZpbGUNCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vTWFrZWZpbGUNCkBAIC00LDggKzQsOCBAQA0KIA0KIHR0bS15IDo9IHR0bV9t
ZW1vcnkubyB0dG1fdHQubyB0dG1fYm8ubyBcDQogCXR0bV9ib191dGlsLm8gdHRtX2JvX3ZtLm8g
dHRtX21vZHVsZS5vIFwNCi0JdHRtX2V4ZWNidWZfdXRpbC5vIHR0bV9wYWdlX2FsbG9jLm8gdHRt
X2JvX21hbmFnZXIubyBcDQotCXR0bV9wYWdlX2FsbG9jX2RtYS5vDQorCXR0bV9leGVjYnVmX3V0
aWwubyB0dG1fcGFnZV9hbGxvYy5vIHR0bV9ib19tYW5hZ2VyLm8NCiB0dG0tJChDT05GSUdfQUdQ
KSArPSB0dG1fYWdwX2JhY2tlbmQubw0KK3R0bS0kKENPTkZJR19EUk1fVFRNX0RNQV9QQUdFX1BP
T0wpICs9IHR0bV9wYWdlX2FsbG9jX2RtYS5vDQogDQogb2JqLSQoQ09ORklHX0RSTV9UVE0pICs9
IHR0bS5vDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvY19k
bWEuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMNCmluZGV4IGQ1
OTRmNzUyMGI3Yi4uOThkMTAwZmQxNTk5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fcGFnZV9hbGxvY19kbWEuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFn
ZV9hbGxvY19kbWEuYw0KQEAgLTMzLDcgKzMzLDYgQEANCiAgKiAgIHdoZW4gZnJlZWQpLg0KICAq
Lw0KIA0KLSNpZiBkZWZpbmVkKENPTkZJR19TV0lPVExCKSB8fCBkZWZpbmVkKENPTkZJR19JTlRF
TF9JT01NVSkNCiAjZGVmaW5lIHByX2ZtdChmbXQpICJbVFRNXSAiIGZtdA0KIA0KICNpbmNsdWRl
IDxsaW51eC9kbWEtbWFwcGluZy5oPg0KQEAgLTEyMzQsNSArMTIzMywzIEBAIGludCB0dG1fZG1h
X3BhZ2VfYWxsb2NfZGVidWdmcyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpDQogCXJl
dHVybiAwOw0KIH0NCiBFWFBPUlRfU1lNQk9MX0dQTCh0dG1fZG1hX3BhZ2VfYWxsb2NfZGVidWdm
cyk7DQotDQotI2VuZGlmDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYw0KaW5kZXggZDU5
YzQ3NGJlMzhlLi5iYzI1OWQ0ZGYxY2IgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9kcnYuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2
LmMNCkBAIC01NzIsOCArNTcyLDcgQEAgc3RhdGljIGludCB2bXdfZG1hX3NlbGVjdF9tb2RlKHN0
cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYpDQogCWVsc2UNCiAJCWRldl9wcml2LT5tYXBfbW9k
ZSA9IHZtd19kbWFfbWFwX3BvcHVsYXRlOw0KIA0KLQkvKiBObyBUVE0gY29oZXJlbnQgcGFnZSBw
b29sPyBGSVhNRTogQXNrIFRUTSBpbnN0ZWFkISAqLw0KLSAgICAgICAgaWYgKCEoSVNfRU5BQkxF
RChDT05GSUdfU1dJT1RMQikgfHwgSVNfRU5BQkxFRChDT05GSUdfSU5URUxfSU9NTVUpKSAmJg0K
KyAgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19EUk1fVFRNX0RNQV9QQUdFX1BPT0wpICYm
DQogCSAgICAoZGV2X3ByaXYtPm1hcF9tb2RlID09IHZtd19kbWFfYWxsb2NfY29oZXJlbnQpKQ0K
IAkJcmV0dXJuIC1FSU5WQUw7DQogDQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9w
YWdlX2FsbG9jLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuaA0KaW5kZXggNGQ5
YjAxOWQyNTNjLi5hNmI2ZWY1ZjliZjQgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2RybS90dG0vdHRt
X3BhZ2VfYWxsb2MuaA0KKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmgNCkBA
IC03NCw3ICs3NCw3IEBAIHZvaWQgdHRtX3VubWFwX2FuZF91bnBvcHVsYXRlX3BhZ2VzKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IHR0bV9kbWFfdHQgKnR0KTsNCiAgKi8NCiBpbnQgdHRtX3Bh
Z2VfYWxsb2NfZGVidWdmcyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpOw0KIA0KLSNp
ZiBkZWZpbmVkKENPTkZJR19TV0lPVExCKSB8fCBkZWZpbmVkKENPTkZJR19JTlRFTF9JT01NVSkN
CisjaWYgZGVmaW5lZChDT05GSUdfRFJNX1RUTV9ETUFfUEFHRV9QT09MKQ0KIC8qKg0KICAqIElu
aXRpYWxpemUgcG9vbCBhbGxvY2F0b3IuDQogICovDQotLSANCjIuMjAuMQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
