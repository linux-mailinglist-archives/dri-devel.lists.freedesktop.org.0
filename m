Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876B42047B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 13:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8525C89394;
	Thu, 16 May 2019 11:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820059.outbound.protection.outlook.com [40.107.82.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D7D89394
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 11:23:53 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6048.namprd05.prod.outlook.com (20.178.244.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.13; Thu, 16 May 2019 11:23:47 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::60b8:98a9:5fab:36ee]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::60b8:98a9:5fab:36ee%4]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 11:23:47 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm, drm/vmwgfx: Use a configuration option for the
 TTM dma page pool
Thread-Topic: [PATCH] drm/ttm, drm/vmwgfx: Use a configuration option for the
 TTM dma page pool
Thread-Index: AQHVC8j+6axTnEl2aUOfUZSS+aLflKZthigAgAAV64A=
Date: Thu, 16 May 2019 11:23:46 +0000
Message-ID: <76d1edd2da3d5760f234abcbd1d4ebacf2ac5c72.camel@vmware.com>
References: <20190516092251.39351-1-thellstrom@vmware.com>
 <26006f21-6ef9-2002-21bf-4ff3d3f8a361@gmail.com>
In-Reply-To: <26006f21-6ef9-2002-21bf-4ff3d3f8a361@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b039ac8-5a12-4c19-0d2d-08d6d9f0f67f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MN2PR05MB6048; 
x-ms-traffictypediagnostic: MN2PR05MB6048:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB60483748FC3398B4D6A898FAA10A0@MN2PR05MB6048.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(346002)(366004)(39860400002)(189003)(199004)(66476007)(118296001)(6246003)(14454004)(316002)(2906002)(478600001)(53936002)(110136005)(6116002)(3846002)(2501003)(86362001)(81156014)(229853002)(71200400001)(6436002)(68736007)(6512007)(8676002)(26005)(66946007)(73956011)(66556008)(64756008)(76116006)(91956017)(66446008)(36756003)(66066001)(476003)(76176011)(186003)(256004)(8936002)(5660300002)(446003)(6486002)(7736002)(25786009)(305945005)(99286004)(486006)(81166006)(2616005)(11346002)(71190400001)(102836004)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6048;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oGqWtoUHYvH665vVjPt6vjQ9Bn3uK79C+KuZd4BTFzfkFooOLAYJcrFnW6v3Ck0sF6uv8CRnimpNiJ9k4NZNuZOYGdbtOxp4ha7CDh3yf66LWibUSCMDoJwu0Ci/3hizP9ChQcsHTWLrE+KjFEy4/bBB8JEKjpsFA+v/ruYSbALv57Mtv4ILp6lShSS3PR2ithEPCA5Lkdu/mEbIXCI3lT36pD6afr2JBIXkkPZItDlOGmZM1JVu5c9uyVcspyzBl1HDEWoDPc2+hRHoVxvyzg+G1w+mWptCqMgzwaPsZlDF2HAjlUvU/Uq0zdNJC07Nd9DFKantkf1jsmxTipgsJuo4Iv39OaZZFS31e4QbkLfAhdewDj5LOy6+TM73FwDfeQ/zWF+1w9XnPLLWNAmPqDS3DKh1iLjEFG7PLhHW1uM=
Content-ID: <10DF7034795BD140A71C7C451C83F69A@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b039ac8-5a12-4c19-0d2d-08d6d9f0f67f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 11:23:46.9304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6048
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evs99+JpjJhJT1YG05bkZIxmxOaSDTqD+f2/z7moSBc=;
 b=wyb8E89lP1zaRgNwN4tkgivuFKA0rZWG2C4EtRoqxptSSmyQTA0yexI6oQ+LZIfCWxD9NKy50QsuaGXBK8g+1EBRvPj2g/cez0ZLCX5BLPAxVptek2kg6a5j9xKXw8uSemShZt5R/O7LjpBvC0x8ceDLpTJ8Be3CnW2j201R8O4=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA1LTE2IGF0IDEyOjA1ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAxNi4wNS4xOSB1bSAxMToyMyBzY2hyaWViIFRob21hcyBIZWxsc3Ryb206DQo+ID4g
RHJpdmVycyBsaWtlIHZtd2dmeCBtYXkgd2FudCB0byB0ZXN0IHdoZXRoZXIgdGhlIGRtYSBwYWdl
IHBvb2wgaXMNCj4gPiBwcmVzZW50DQo+ID4gb3Igbm90LiBTaW5jZSBpdCdzIGFjdGl2YXRlZCBi
eSBkZWZhdWx0IGJ5IFRUTSBpZiBjb21waWxlZC1pbiwNCj4gPiBkZWZpbmUgYQ0KPiA+IGhpZGRl
biBjb25maWd1cmF0aW9uIG9wdGlvbiB0aGF0IHRoZSBkcml2ZXIgY2FuIHRlc3QgZm9yLg0KPiA+
IA0KPiA+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29t
Pg0KPiANCj4gVGhlcmUgYXJlIGF0IGxlYXN0IGFsc28gb2NjYXNpb25zIG9mIHRoaXMgaW4gcmFk
ZW9uIGFuZCBhbWRncHUsIGJ1dCANCj4gdGhvc2UgY2FuIGJlIGNsZWFuZWQgdXAgbGF0ZXIgb24u
DQo+IA0KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPiBmb3Igbm93Lg0KPiANCj4gV2hpY2ggdHJlZSBzaG91bGQgd2UgdXNlIGZvciBtZXJn
aW5nPw0KPiANCj4gVGhhbmtzLA0KPiBDaHJpc3RpYW4uDQoNCldlIGNhbiB0YWtlIGl0IHRocm91
Z2ggYW4gQU1EIHRyZWUgaWYgaXQncyBPSyB3aXRoIHlvdS4gVGhlbiBpdCB3b3VsZA0KYmUgZWFz
aWVyIHRvIGFkZCBzaW1pbGFyIGNoYW5nZXMgdG8gdGhlIEFNRCBkcml2ZXJzLg0KDQpJJ2xsIHNl
bmQgb3V0IHYyIHdpdGggc29tZSB3aGl0ZXNwYWNlIGNsZWFudXAsIGEgY29uZmlnIGhlbHAgdGV4
dCBhbmQNClItYiBuZXh0Lg0KDQpUaGFua3MsDQpUaG9tYXMNCg0KDQoNCg0KDQo+IA0KPiA+IC0t
LQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgICAgICB8IDUgKysr
KysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vTWFrZWZpbGUgICAgICAgICAgICAgfCA0ICsr
LS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMgfCAzIC0t
LQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgICAgICB8IDMgKy0t
DQo+ID4gICBpbmNsdWRlL2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuaCAgICAgICAgIHwgMiArLQ0K
PiA+ICAgNSBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnIGIvZHJpdmVycy9n
cHUvZHJtL0tjb25maWcNCj4gPiBpbmRleCAyMjY3ZTg0ZDVjYjQuLmY3MzNhOTI3M2IzZiAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9LY29uZmlnDQo+ID4gQEAgLTE2MCw2ICsxNjAsMTEgQEAgY29uZmlnIERSTV9UVE0N
Cj4gPiAgIAkgIEdQVSBtZW1vcnkgdHlwZXMuIFdpbGwgYmUgZW5hYmxlZCBhdXRvbWF0aWNhbGx5
IGlmIGEgZGV2aWNlDQo+ID4gZHJpdmVyDQo+ID4gICAJICB1c2VzIGl0Lg0KPiA+ICAgDQo+ID4g
K2NvbmZpZyBEUk1fVFRNX0RNQV9QQUdFX1BPT0wNCj4gPiArICAgICAgICBib29sDQo+ID4gKwlk
ZXBlbmRzIG9uIERSTV9UVE0gJiYgKFNXSU9UTEIgfHwgSU5URUxfSU9NTVUpDQo+ID4gKwlkZWZh
dWx0IHkNCj4gPiArDQo+ID4gICBjb25maWcgRFJNX0dFTV9DTUFfSEVMUEVSDQo+ID4gICAJYm9v
bA0KPiA+ICAgCWRlcGVuZHMgb24gRFJNDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vTWFrZWZpbGUNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vTWFrZWZpbGUNCj4gPiBp
bmRleCAwMWZjNjcwY2U3YTIuLmNhZWEyYTA5OTQ5NiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS9NYWtl
ZmlsZQ0KPiA+IEBAIC00LDggKzQsOCBAQA0KPiA+ICAgDQo+ID4gICB0dG0teSA6PSB0dG1fbWVt
b3J5Lm8gdHRtX3R0Lm8gdHRtX2JvLm8gXA0KPiA+ICAgCXR0bV9ib191dGlsLm8gdHRtX2JvX3Zt
Lm8gdHRtX21vZHVsZS5vIFwNCj4gPiAtCXR0bV9leGVjYnVmX3V0aWwubyB0dG1fcGFnZV9hbGxv
Yy5vIHR0bV9ib19tYW5hZ2VyLm8gXA0KPiA+IC0JdHRtX3BhZ2VfYWxsb2NfZG1hLm8NCj4gPiAr
CXR0bV9leGVjYnVmX3V0aWwubyB0dG1fcGFnZV9hbGxvYy5vIHR0bV9ib19tYW5hZ2VyLm8NCj4g
PiAgIHR0bS0kKENPTkZJR19BR1ApICs9IHR0bV9hZ3BfYmFja2VuZC5vDQo+ID4gK3R0bS0kKENP
TkZJR19EUk1fVFRNX0RNQV9QQUdFX1BPT0wpICs9IHR0bV9wYWdlX2FsbG9jX2RtYS5vDQo+ID4g
ICANCj4gPiAgIG9iai0kKENPTkZJR19EUk1fVFRNKSArPSB0dG0ubw0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jDQo+ID4gaW5kZXggZDU5NGY3NTIwYjdi
Li45OGQxMDBmZDE1OTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
cGFnZV9hbGxvY19kbWEuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2Vf
YWxsb2NfZG1hLmMNCj4gPiBAQCAtMzMsNyArMzMsNiBAQA0KPiA+ICAgICogICB3aGVuIGZyZWVk
KS4NCj4gPiAgICAqLw0KPiA+ICAgDQo+ID4gLSNpZiBkZWZpbmVkKENPTkZJR19TV0lPVExCKSB8
fCBkZWZpbmVkKENPTkZJR19JTlRFTF9JT01NVSkNCj4gPiAgICNkZWZpbmUgcHJfZm10KGZtdCkg
IltUVE1dICIgZm10DQo+ID4gICANCj4gPiAgICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5o
Pg0KPiA+IEBAIC0xMjM0LDUgKzEyMzMsMyBAQCBpbnQgdHRtX2RtYV9wYWdlX2FsbG9jX2RlYnVn
ZnMoc3RydWN0DQo+ID4gc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpDQo+ID4gICAJcmV0dXJuIDA7
DQo+ID4gICB9DQo+ID4gICBFWFBPUlRfU1lNQk9MX0dQTCh0dG1fZG1hX3BhZ2VfYWxsb2NfZGVi
dWdmcyk7DQo+ID4gLQ0KPiA+IC0jZW5kaWYNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2Rydi5jDQo+ID4gaW5kZXggZDU5YzQ3NGJlMzhlLi5iYzI1OWQ0ZGYxY2IgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYw0KPiA+IEBAIC01NzIsOCArNTcyLDcg
QEAgc3RhdGljIGludCB2bXdfZG1hX3NlbGVjdF9tb2RlKHN0cnVjdA0KPiA+IHZtd19wcml2YXRl
ICpkZXZfcHJpdikNCj4gPiAgIAllbHNlDQo+ID4gICAJCWRldl9wcml2LT5tYXBfbW9kZSA9IHZt
d19kbWFfbWFwX3BvcHVsYXRlOw0KPiA+ICAgDQo+ID4gLQkvKiBObyBUVE0gY29oZXJlbnQgcGFn
ZSBwb29sPyBGSVhNRTogQXNrIFRUTSBpbnN0ZWFkISAqLw0KPiA+IC0gICAgICAgIGlmICghKElT
X0VOQUJMRUQoQ09ORklHX1NXSU9UTEIpIHx8DQo+ID4gSVNfRU5BQkxFRChDT05GSUdfSU5URUxf
SU9NTVUpKSAmJg0KPiA+ICsgICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfRFJNX1RUTV9E
TUFfUEFHRV9QT09MKSAmJg0KPiA+ICAgCSAgICAoZGV2X3ByaXYtPm1hcF9tb2RlID09IHZtd19k
bWFfYWxsb2NfY29oZXJlbnQpKQ0KPiA+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiAgIA0KPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuaA0KPiA+IGIvaW5j
bHVkZS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmgNCj4gPiBpbmRleCA0ZDliMDE5ZDI1M2MuLmE2
YjZlZjVmOWJmNCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX3BhZ2VfYWxs
b2MuaA0KPiA+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5oDQo+ID4gQEAg
LTc0LDcgKzc0LDcgQEAgdm9pZCB0dG1fdW5tYXBfYW5kX3VucG9wdWxhdGVfcGFnZXMoc3RydWN0
IGRldmljZQ0KPiA+ICpkZXYsIHN0cnVjdCB0dG1fZG1hX3R0ICp0dCk7DQo+ID4gICAgKi8NCj4g
PiAgIGludCB0dG1fcGFnZV9hbGxvY19kZWJ1Z2ZzKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAq
ZGF0YSk7DQo+ID4gICANCj4gPiAtI2lmIGRlZmluZWQoQ09ORklHX1NXSU9UTEIpIHx8IGRlZmlu
ZWQoQ09ORklHX0lOVEVMX0lPTU1VKQ0KPiA+ICsjaWYgZGVmaW5lZChDT05GSUdfRFJNX1RUTV9E
TUFfUEFHRV9QT09MKQ0KPiA+ICAgLyoqDQo+ID4gICAgKiBJbml0aWFsaXplIHBvb2wgYWxsb2Nh
dG9yLg0KPiA+ICAgICovDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
