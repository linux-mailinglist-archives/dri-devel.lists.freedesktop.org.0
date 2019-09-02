Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B7A5457
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 12:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFCD897EE;
	Mon,  2 Sep 2019 10:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-oln040092064063.outbound.protection.outlook.com [40.92.64.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D14897EE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 10:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFvnGT7kibWRZLn4pE9xG2yuusTkDqRTCsoGrVsE24MQfu1MJ1mOWx2pz5FNCLmBXVDFLhnCGRMp0lv6SA5F6xGCi5F9RqyaxOhrqCvSAUKyacWFSB4OCJtPQV1mOIbcgnnCj5REC+l/NE3fhvA0LTYdjQ1Q01cHCTDM5ihQzCcue1yDtlhQtrPeCCGq2q3TCqrcr6QySHIt/8Wzu7NXx3RYfeySAG7FzfddQETyGD3qDupwf9zGMDEgkYfBbc8KUsqF6qU8fNq74j5UxPGf5IDhEldEgphRLjeZF3M0Ij8o+5VhCdPCE7VsKfrNxEDH9i0hJ1HrOVshPgRDP6e4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmFhpZxLwhZaIRYAzSaCQF50e+WXIPq9aD+svjhuYlw=;
 b=ixtj7bM4TVU8FmTTo4D3awLljH//x2q+pCG1OMySqEKAI/godc2moouLfcbnjPiiS+ADVSUrVTPq4qXcnyRhuRMNqaS33NwWsDLlaqAn5rriqmL5uQcWvzgBrFWR4zwCi6aapkEUlLxlt6uG+tXJyceCki8PWkyq2mBL6HdRuiabExFJy7S70WRb3l3ecsj6hZDp5BwAdo//TASjQMcAql2yjYU9x0tgVR9idArGjCAtKCXYz85/tXj0wvvxNy6cFPwqZrekcEI5qhqg9SWpXK/B+KtB3x0sa5Ss0VcsFytMWIXPhjCk/PsbD7SiGP2Nq+A00RsfJKI0vSQceWX04w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT054.eop-EUR01.prod.protection.outlook.com
 (10.152.0.57) by HE1EUR01HT130.eop-EUR01.prod.protection.outlook.com
 (10.152.1.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Mon, 2 Sep
 2019 10:49:34 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.58) by
 HE1EUR01FT054.mail.protection.outlook.com (10.152.1.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Mon, 2 Sep 2019 10:49:34 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::1188:7e7d:69b:a036]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::1188:7e7d:69b:a036%5]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:49:34 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: Re: [PATCH 3/5] drm: dw-hdmi: update CEC phys addr and EDID on HPD
 event
Thread-Topic: [PATCH 3/5] drm: dw-hdmi: update CEC phys addr and EDID on HPD
 event
Thread-Index: AQHVYOBbQpm/ZMlRykOhaECOU9r4vKcYCfWAgAAsfYA=
Date: Mon, 2 Sep 2019 10:49:34 +0000
Message-ID: <HE1PR06MB40112A70BFF02182310DD3E4ACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <AM0PR06MB40049562E295DD62302C8DB7ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
 <20190901161426.1606-1-jonas@kwiboo.se>
 <AM0PR06MB4004285BAA935D14F1A68787ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
 <d0d7a5b8-4301-9a08-64af-8474a0c4f5de@baylibre.com>
In-Reply-To: <d0d7a5b8-4301-9a08-64af-8474a0c4f5de@baylibre.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::32)
 To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:638B98758CD7D450D439C660868FDAFC89FF6AE35CFEA6ACCAF18B7034823439;
 UpperCasedChecksum:B50DD240BA448C26675459662D7AE8E7604ADDD060C0F2DE1649D363D59F51BF;
 SizeAsReceived:8108; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [3dJFHbEQVhsRIPcfawhfxKQ2oc8hNkbT]
x-microsoft-original-message-id: <914c4edc-e3e2-9cb5-384b-c983427edf82@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119158)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:HE1EUR01HT130; 
x-ms-traffictypediagnostic: HE1EUR01HT130:
x-microsoft-antispam-message-info: ISEF/gA/HRMVbm2J7Y78IHeJdipYotDtJ979fTEVMYNEWyMJVqMXkYYucBPqt8bfnF7nxSsK5KhgPyQhiqyn02Mz6UC2fLfHB3n6apnFZHBlV8hloURKqi/f8uLaf2l/Y3HrhLX3RnSdC6/zz2eKB82z3KthsJS/PfSviSxxgJgnokcwcUnleK+ht5XglQEP
x-ms-exchange-transport-forked: True
Content-ID: <BEE870B58B10314283DDC3BB1DE2F89E@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b02354-cc05-4bc3-cb2f-08d72f933dc3
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:49:34.2382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT130
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wMiAxMDoxMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6DQo+IE9uIDAxLzA5LzIw
MTkgMTg6MTQsIEpvbmFzIEthcmxtYW4gd3JvdGU6DQo+PiBVcGRhdGUgQ0VDIHBoeXMgYWRkciBh
bmQgRURJRCBvbiBIUEQgZXZlbnQsIGZpeGVzIGxvc3QgQ0VDIHBoeXMgYWRkciBhbmQNCj4+IHN0
YWxlIEVESUQgd2hlbiBIRE1JIGNhYmxlIGlzIHVucGx1Z2dlZC9yZXBsdWdnZWQgb3IgQVZSIGlz
IHBvd2VyZWQgb24vb2ZmLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4gPGpv
bmFzQGt3aWJvby5zZT4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jIHwgMTYgKysrKysrKysrLS0tLS0tLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMNCj4+IGluZGV4IDkxZDg2ZGRkNjYyNC4uMGYwN2JlMWI1
OTE0IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
DQo+PiBAQCAtMjE4OSw2ICsyMTg5LDcgQEAgc3RhdGljIGludCBkd19oZG1pX2Nvbm5lY3Rvcl91
cGRhdGVfZWRpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPj4gIHN0YXRpYyBl
bnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzDQo+PiAgZHdfaGRtaV9jb25uZWN0b3JfZGV0ZWN0KHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpDQo+PiAgew0KPj4gKwll
bnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIHN0YXR1czsNCj4+ICAJc3RydWN0IGR3X2hkbWkgKmhk
bWkgPSBjb250YWluZXJfb2YoY29ubmVjdG9yLCBzdHJ1Y3QgZHdfaGRtaSwNCj4+ICAJCQkJCSAg
ICAgY29ubmVjdG9yKTsNCj4+ICANCj4+IEBAIC0yMTk4LDcgKzIxOTksMTQgQEAgZHdfaGRtaV9j
b25uZWN0b3JfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9y
Y2UpDQo+PiAgCWR3X2hkbWlfdXBkYXRlX3BoeV9tYXNrKGhkbWkpOw0KPj4gIAltdXRleF91bmxv
Y2soJmhkbWktPm11dGV4KTsNCj4+ICANCj4+IC0JcmV0dXJuIGhkbWktPnBoeS5vcHMtPnJlYWRf
aHBkKGhkbWksIGhkbWktPnBoeS5kYXRhKTsNCj4+ICsJc3RhdHVzID0gaGRtaS0+cGh5Lm9wcy0+
cmVhZF9ocGQoaGRtaSwgaGRtaS0+cGh5LmRhdGEpOw0KPj4gKw0KPj4gKwlpZiAoc3RhdHVzID09
IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkKQ0KPj4gKwkJZHdfaGRtaV9jb25uZWN0b3JfdXBk
YXRlX2VkaWQoY29ubmVjdG9yLCBmYWxzZSk7DQo+PiArCWVsc2UNCj4+ICsJCWNlY19ub3RpZmll
cl9waHlzX2FkZHJfaW52YWxpZGF0ZShoZG1pLT5jZWNfbm90aWZpZXIpOw0KPj4gKw0KPj4gKwly
ZXR1cm4gc3RhdHVzOw0KPj4gIH0NCj4+ICANCj4+ICBzdGF0aWMgaW50IGR3X2hkbWlfY29ubmVj
dG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0KPj4gQEAgLTI0
MzgsMTIgKzI0NDYsNiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgZHdfaGRtaV9pcnEoaW50IGlycSwg
dm9pZCAqZGV2X2lkKQ0KPj4gIAkJZHdfaGRtaV9zZXR1cF9yeF9zZW5zZShoZG1pLA0KPj4gIAkJ
CQkgICAgICAgcGh5X3N0YXQgJiBIRE1JX1BIWV9IUEQsDQo+PiAgCQkJCSAgICAgICBwaHlfc3Rh
dCAmIEhETUlfUEhZX1JYX1NFTlNFKTsNCj4+IC0NCj4+IC0JCWlmICgocGh5X3N0YXQgJiAoSERN
SV9QSFlfUlhfU0VOU0UgfCBIRE1JX1BIWV9IUEQpKSA9PSAwKSB7DQo+PiAtCQkJbXV0ZXhfbG9j
aygmaGRtaS0+Y2VjX25vdGlmaWVyX211dGV4KTsNCj4+IC0JCQljZWNfbm90aWZpZXJfcGh5c19h
ZGRyX2ludmFsaWRhdGUoaGRtaS0+Y2VjX25vdGlmaWVyKTsNCj4+IC0JCQltdXRleF91bmxvY2so
JmhkbWktPmNlY19ub3RpZmllcl9tdXRleCk7DQo+PiAtCQl9DQo+PiAgCX0NCj4+ICANCj4+ICAJ
aWYgKGludHJfc3RhdCAmIEhETUlfSUhfUEhZX1NUQVQwX0hQRCkgew0KPj4NCj4gV29uJ3QgaXQg
cG9zc2libHkgdHJpZ2dlciB0d2ljZSBlZGlkIHJlYWRvdXRzIG9uIGVhY2ggSFBEIGV2ZW50LA0K
PiBvbmUgZm9yIENFQyBhbmQgb25lIGZvciBtb2RlcyA/IEl0IHNlZW1zIHNhbmUgYnV0IG5vdCB2
ZXJ5IGVmZmljaWVudCB0byBtZS4uLg0KDQpZZXMgdGhlcmUgbWF5IGJlIEVESUQgcmVhZG91dCB0
d2ljZSB3aXRoIHRoaXMgY2hhbmdlIGluIGNhc2UgYm90aCBkZXRlY3QgYW5kIGdldF9tb2RlcyBn
ZXRzIGNhbGxlZC4NCkd1ZXNzIHdlIGNvdWxkIHNhdmUgdGhlIEVESUQgcmVhZG91dCBpbiBkZXRl
Y3QgYW5kIHJldXNlIGl0IGluIGdldF9tb2RlcyBvciBzaW1pbGFyPw0KDQpUaGUgaXNzdWUgb2Jz
ZXJ2ZWQgaXMgdGhhdCBDRUMgcGh5cyBhZGRyIG5ldmVyIGdldHMgdXBkYXRlZCBhZnRlciBhbiBp
bnZhbGlkYXRpb24gKEhQRCkNCnVudGlsIGdldF9tb2RlcyBpcyBjYWxsZWQsIHdoZW4gVFYvQVZS
IHRyaWdnZXJzIGFuIEVESUQgcmVmcmVzaCB1c2luZyBhIDEwMG1zIEhQRCBwdWxzZQ0Kb3IgYW4g
QVZSIGlzIHBvd2VyZWQgb24vb2ZmIHRoZSBDRUMgcGh5cyBhZGRyLCBFRElEIGFuZCBFTEQgbmV2
ZXIgZ2V0cyByZWZyZXNoZWQgYXMNCm9ubHkgZGV0ZWN0IGlzIGNhbGxlZCBhbmQgbm90IGdldF9t
b2Rlcy4NCg0KUmVnYXJkcywNCkpvbmFzDQoNCj4NCj4gQW55d2F5Og0KPiBSZXZpZXdlZC1ieTog
TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
