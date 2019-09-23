Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C311BB50F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C32589B5F;
	Mon, 23 Sep 2019 13:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3366 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2019 08:58:24 UTC
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC59D6E248;
 Mon, 23 Sep 2019 08:58:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
 [147.11.189.41])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8N81gls020214
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Mon, 23 Sep 2019 01:01:58 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.87]) by
 ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0468.000; Mon,
 23 Sep 2019 01:01:38 -0700
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: "bskeggs@redhat.com" <bskeggs@redhat.com>
Subject: RE: [Nouveau] [PATCH] drm/nouveau: Fix memory leak in nvkm_ram_get()
Thread-Topic: [Nouveau] [PATCH] drm/nouveau: Fix memory leak in nvkm_ram_get()
Thread-Index: AQHVWaJ8lGkRjnMWK0GJoR/Fq3raaKc5FkgA
Date: Mon, 23 Sep 2019 08:01:38 +0000
Message-ID: <597B109EC20B76429F71A8A97770610D19E1085A@ALA-MBD.corp.ad.wrs.com>
References: <20190823085042.37349-1-yongxin.liu@windriver.com>
In-Reply-To: <20190823085042.37349-1-yongxin.liu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.171]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 13:17:21 +0000
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Gortmaker,
 Paul" <Paul.Gortmaker@windriver.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Wei, 
 Yunguo \(Bryan\)" <Yunguo.Wei@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmVuLA0KDQpBbnkgY29tbWVudHMgb24gdGhpcyBwYXRjaD8NCg0KDQpUaGFua3MsDQpZb25n
eGluDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOb3V2ZWF1IFtt
YWlsdG86bm91dmVhdS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24gQmVoYWxmIE9m
DQo+IFlvbmd4aW4gTGl1DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDIzLCAyMDE5IDE2OjUxDQo+
IFRvOiBic2tlZ2dzQHJlZGhhdC5jb207IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBXZWksIFl1bmd1byAoQnJ5YW4p
OyBHb3J0bWFrZXIsIFBhdWwNCj4gU3ViamVjdDogW05vdXZlYXVdIFtQQVRDSF0gZHJtL25vdXZl
YXU6IEZpeCBtZW1vcnkgbGVhayBpbiBudmttX3JhbV9nZXQoKQ0KPiANCj4gV2hlbiByZXN1bWlu
ZyBmcm9tIEFDUEkgUzMsIG1lbW9yeSBsZWFrIGhhcHBlbnMgaW4gbnZrbV9yYW1fZ2V0KCkuDQo+
IFRoaXMgaXMgYmVjYXVzZSAqcG1lbW9yeSBwb2ludHMgdG8gbmV3bHkgYWxsb2NhdGVkIG1lbW9y
eSB3aXRob3V0DQo+IGNoZWNraW5nIGFuZCBmcmVlaW5nIHRoZSBvbGQgbWVtb3J5Lg0KPiANCj4g
SGVyZSBpcyB0aGUgbG9nIHNob3dpbmcgdGhpcyBpc3N1ZS4NCj4gDQo+IHVucmVmZXJlbmNlZCBv
YmplY3QgMHhmZmZmYTNiNjA4YzZkNWMwIChzaXplIDY0KToNCj4gICBjb21tICJrd29ya2VyL3Uz
MjozMCIsIHBpZCA5MzQsIGppZmZpZXMgNDI5NDgyMzUyMCAoYWdlIDUwMDAuMjE3cykNCj4gICBo
ZXggZHVtcCAoZmlyc3QgMzIgYnl0ZXMpOg0KPiAgICAgMDAgZmMgNGEgYzAgZmYgZmYgZmYgZmYg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uSi4uLi4uLi4uLi4uLi4NCj4gICAgIDAxIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4u
DQo+ICAgYmFja3RyYWNlOg0KPiAgICAgWzwwMDAwMDAwMGU5MjNiZjgxPl0ga21lbV9jYWNoZV9h
bGxvY190cmFjZSsweDE4MS8weDI1MA0KPiAgICAgWzwwMDAwMDAwMGVkYjdiZWFhPl0gbnZrbV9y
YW1fZ2V0KzB4YjAvMHgxZDAgW25vdXZlYXVdDQo+ICAgICBbPDAwMDAwMDAwNGVjYWE5MTg+XSBn
dDIxNV9yYW1faW5pdCsweGM1LzB4MmYwIFtub3V2ZWF1XQ0KPiAgICAgWzwwMDAwMDAwMDAwN2Jh
MWEwPl0gbnZrbV9yYW1faW5pdCsweDFhLzB4MjAgW25vdXZlYXVdDQo+ICAgICBbPDAwMDAwMDAw
NTBhYmY4NGI+XSBudmttX2ZiX2luaXQrMHgyNy8weGUwIFtub3V2ZWF1XQ0KPiAgICAgWzwwMDAw
MDAwMGZhZTdmZWRjPl0gbnZrbV9zdWJkZXZfaW5pdCsweGJjLzB4MjEwIFtub3V2ZWF1XQ0KPiAg
ICAgWzwwMDAwMDAwMGE2N2I4NmU0Pl0gbnZrbV9kZXZpY2VfaW5pdCsweDEyYS8weDI4MCBbbm91
dmVhdV0NCj4gICAgIFs8MDAwMDAwMDBjMDJhYzAzZT5dIG52a21fdWRldmljZV9pbml0KzB4NDgv
MHg2MCBbbm91dmVhdV0NCj4gICAgIFs8MDAwMDAwMDA0OGYzNTY0MT5dIG52a21fb2JqZWN0X2lu
aXQrMHg0My8weDExMCBbbm91dmVhdV0NCj4gICAgIFs8MDAwMDAwMDBjNmY5MmRjMD5dIG52a21f
b2JqZWN0X2luaXQrMHg3NC8weDExMCBbbm91dmVhdV0NCj4gICAgIFs8MDAwMDAwMDBjNmY5MmRj
MD5dIG52a21fb2JqZWN0X2luaXQrMHg3NC8weDExMCBbbm91dmVhdV0NCj4gICAgIFs8MDAwMDAw
MDA3NDE2OTUxYz5dIG52a21fY2xpZW50X3Jlc3VtZSsweGUvMHgxMCBbbm91dmVhdV0NCj4gICAg
IFs8MDAwMDAwMDBjNWQzMWRmZD5dIG52aWZfY2xpZW50X3Jlc3VtZSsweDFkLzB4MjAgW25vdXZl
YXVdDQo+ICAgICBbPDAwMDAwMDAwOGYzYTYzOGY+XSBub3V2ZWF1X2RvX3Jlc3VtZSsweDJkLzB4
MTUwIFtub3V2ZWF1XQ0KPiAgICAgWzwwMDAwMDAwMGRmMmMyYjg1Pl0gbm91dmVhdV9wbW9wc19y
ZXN1bWUrMHg2Yi8weGEwIFtub3V2ZWF1XQ0KPiAgICAgWzwwMDAwMDAwMGY0NGM2NDlkPl0gcGNp
X3BtX3Jlc3VtZSsweDcxLzB4YjANCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFlvbmd4aW4gTGl1IDx5
b25neGluLmxpdUB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L2ZiL3JhbS5jIHwgMyArKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9mYi9yYW0uYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L2ZiL3JhbS5jDQo+IGluZGV4IGIxMTg2N2Y2ODJjYi4uNjBiZTRkODExMTg3IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9yYW0uYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9yYW0uYw0KPiBAQCAt
MTI0LDYgKzEyNCw5IEBAIG52a21fcmFtX2dldChzdHJ1Y3QgbnZrbV9kZXZpY2UgKmRldmljZSwg
dTggaGVhcCwgdTgNCj4gdHlwZSwgdTggcnBhZ2UsIHU2NCBzaXplLA0KPiAgCW52a21fbWVtb3J5
X2N0b3IoJm52a21fdnJhbSwgJnZyYW0tPm1lbW9yeSk7DQo+ICAJdnJhbS0+cmFtID0gcmFtOw0K
PiAgCXZyYW0tPnBhZ2UgPSBwYWdlOw0KPiArDQo+ICsJaWYgKCpwbWVtb3J5KQ0KPiArCQludmtt
X21lbW9yeV91bnJlZihwbWVtb3J5KTsNCj4gIAkqcG1lbW9yeSA9ICZ2cmFtLT5tZW1vcnk7DQo+
IA0KPiAgCW11dGV4X2xvY2soJnJhbS0+ZmItPnN1YmRldi5tdXRleCk7DQo+IC0tDQo+IDIuMTQu
NA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gTm91dmVhdSBtYWlsaW5nIGxpc3QNCj4gTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
