Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B08B760
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 13:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A19E6E0F3;
	Tue, 13 Aug 2019 11:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092069058.outbound.protection.outlook.com [40.92.69.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBAA6E0F3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBSvfHDLlryt4y5aoAhr+xXeGy5Aj45wIaiB7kCYbUUBh6n8srI3RusJRa5OwsAM8H3GYn41bWaS6IgjFFnZcc7R+OONxjR41X8cyFHgMNrDBXi51KCHQIev/CcSp9FDRxnZbg3jLKrfb7FYkYsKxZlbHXEIxSGNKkOwJ3o6+RsZalBkV0McJ6qyfiBxXcsX/oVEv0y3prmWik7PdjjozUoNXI+PSlTu8F+NcJAwPQk5K+rSK9E7B7gGAVHXM3LWdxsSd+d+B57uEFLNpoawh2wAVJCbd/nBnh99r6UfnDNu0LzJs6y3jziW1ETlRTVg2KzEdZaK22JqKBvfErs1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cD2DkD/c1zhWJfZwcfdVf73TGm23Au53Qc2pcRO7H8=;
 b=OCVEBat+nDqOPt0VnJrWZViOcdR2t42dSk083wPNDt5IuE8eXYs6X065rQIeRVMHm0xEE6jytE4Q+y4IEtVFror4ggBP9R28ZNDGkHCBHoV0onPil7YB+ICkGqqwtB1GEOLY2ImbARry1brpvUFSN+P5TSuYpHzgDkjm1VfDBbafv4xFH793G9+1DqZ2xV9UEL+K90baOO9f4oJMoFrr2hXVn9SwulFYIXJNl/XzQOAo+Sey8WE0wKjKKCbiiWL670xLaUmznSfXXVAxRjLiBcU22ZP+KsvqCgqaqNwuN9C49wRuvYqQ6Vt66/rMr6TkAP+33/jz26Ydt1k+A3advA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR02FT065.eop-EUR02.prod.protection.outlook.com
 (10.152.8.51) by AM5EUR02HT189.eop-EUR02.prod.protection.outlook.com
 (10.152.9.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15; Tue, 13 Aug
 2019 11:41:17 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.8.56) by
 AM5EUR02FT065.mail.protection.outlook.com (10.152.9.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15 via Frontend Transport; Tue, 13 Aug 2019 11:41:17 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b952:7cd2:4c8d:e460]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b952:7cd2:4c8d:e460%4]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 11:41:17 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
Thread-Topic: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
Thread-Index: AQHVUboa7A1pYK0KN0KnivRIR5caz6b40QaAgAAMi4CAABMMgIAAA/QA
Date: Tue, 13 Aug 2019 11:41:17 +0000
Message-ID: <HE1PR06MB40111851284C0568343A9774ACD20@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
 <60547c6d-e8a1-0b2c-b8ae-acb2f4643be8@xs4all.nl>
 <HE1PR06MB40116485045605E0B9E67B92ACD20@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <806faef0-8d54-8f6c-2cbe-46e0961e926a@xs4all.nl>
In-Reply-To: <806faef0-8d54-8f6c-2cbe-46e0961e926a@xs4all.nl>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0402CA0009.eurprd04.prod.outlook.com
 (2603:10a6:208:15::22) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:24610F1D48F41F31E503C90570030EAD9D9D93EAAEEC5B0534DBB23974D3B373;
 UpperCasedChecksum:D9B712C9B01F2FEBD331A2047FAD92BB16A14FC841AE3D0B1E8F0F7C869793C6;
 SizeAsReceived:7931; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [/7W0WIA8yXnJSj62LEESW6pGtO2SsX6y]
x-microsoft-original-message-id: <323f8f31-df22-fddc-228e-d39ec7a1dd23@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:AM5EUR02HT189; 
x-ms-traffictypediagnostic: AM5EUR02HT189:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-message-info: 8lOeJXN/hUaWAkOMAX4Vl8xE5tF9o+i7iA/DZxsfqcqTdNnkA2CXeGIwxpzYlyiCHNHFM9hRTcSH6GYWx8Jv3wfP3uckJc6RJUxl56/PxbyQD1ZWktjd9efVLzn5hFB8ZKgnlWWxsMHFMVNXoK80Gq8UOQ7JO6oc91Xhe+07O+IAKcK9a/XzI3ASg+p62eiE
x-ms-exchange-transport-forked: True
Content-ID: <F2D6B9509CCBCA48A4C1902BF9C650D6@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 163b4bba-b9b8-4a52-0cec-08d71fe32742
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 11:41:17.5981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT189
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
Cc: Dariusz Marcinkiewicz <darekm@google.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0xMyAxMzoyNywgSGFucyBWZXJrdWlsIHdyb3RlOg0KPiBPbiA4LzEzLzE5IDEy
OjE4IFBNLCBKb25hcyBLYXJsbWFuIHdyb3RlOg0KPj4gQXMgYW4gYWx0ZXJuYXRpdmUgSSBoYXZl
IGEgcGF0Y2ggWzFdIHRvIHN1Ym1pdCB0aGF0IG1vdmVzIGNlY19ub3RpZmllcl9waHlzX2FkZHJf
aW52YWxpZGF0ZSgpIGNhbGwNCj4+IGZyb20gZHdfaGRtaV9pcnEoKSB0byBkd19oZG1pX2Nvbm5l
Y3Rvcl9kZXRlY3QoKSBpbiBvcmRlciB0byBhZGRyZXNzIGFuIGlzc3VlIHdpdGgNCj4+IHN0YWxl
IENFQyBwaHlzIGFkZHIgYW5kIHN0YWxlIEVESUQvRUxEIGRhdGEgYWZ0ZXIgVFYgb3IgQVZSIHVz
ZXMgYSAxMDBtcyBIUEQgcHVsc2UNCj4+IHRvIHNpZ25hbCBFRElEIGhhcyBjaGFuZ2VkLCBmdWxs
IHBhdGNoc2V0IGF0IFsyXS4NCj4+DQo+PiBBdCB0aGUgbW9tZW50IENFQyBwaHlzIGFkZHJlc3Mg
aXMgaW52YWxpZGF0ZWQgZGlyZWN0bHkgYXQgSFBELCBsZWF2aW5nIHRoZSBhZGRyZXNzIGFzIGlu
dmFsaWQNCj4+IGFmdGVyIGEgMTAwbXMgSFBEIHB1bHNlLCBwaHlzIGFkZHJlc3MgbWF5IGxhdGVy
IGJlIHJlc3RvcmVkIHRvIGEgdmFsaWQgcGh5cyBhZGRyZXNzIHdoZW4NCj4+IGdldF9tb2Rlcygp
IGlzIGNhbGxlZCBieSBkcm0gY29yZS4NCj4+DQo+PiBTaG91bGQgSSB3YWl0IG9uIHlvdXIgYW5k
IHJlbGF0ZWQgcGF0Y2hlcyB0byBiZSBtZXJnZWQgYmVmb3JlIHN1Ym1pdHRpbmcgbXkgc2VyaWVz
Pw0KPiBZb3VyIHBhdGNoIGZpeGVzIHRoaXMgaXNzdWUgYXMgd2VsbCwgc28ganVzdCBpZ25vcmUg
bXkgcGF0Y2ggYW5kIHN1Ym1pdCB5b3VyIHNlcmllcy4NCj4gUGxlYXNlIENDIG1lIHdoZW4geW91
IHBvc3QgeW91ciBzZXJpZXMuDQoNClRoYW5rcyBmb3IgdGVzdGluZywgSSB3aWxsIGluY2x1ZGUg
eW91IGluIENDIHdoZW4gSSBzdWJtaXQgbXkgc2VyaWVzIGxhdGVyIHRvZGF5IG9yIHRvbW9ycm93
Lg0KDQpSZWdhcmRzLA0KSm9uYXMNCg0KPg0KPiBSZWdhcmRzLA0KPg0KPiAJSGFucw0KPg0KPj4g
WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9Ld2lib28vbGludXgtcm9ja2NoaXAvY29tbWl0LzJmNGY5
OWM4Mjk4M2U3MDk1MjY2OGMyMWYxYzU2YTAyNDFiZDc1ZjINCj4+IFsyXSBodHRwczovL2dpdGh1
Yi5jb20vS3dpYm9vL2xpbnV4LXJvY2tjaGlwL2NvbXBhcmUvbmV4dC0yMDE5MDgxMy4uLm5leHQt
MjAxOTA4MTMtY2VjLWVsZA0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBKb25hcw0KPj4NCj4+IE9uIDIw
MTktMDgtMTMgMTE6MzQsIEhhbnMgVmVya3VpbCB3cm90ZToNCj4+PiBDQyBEYXJpdXN6IGFzIHdl
bGwsIHNpbmNlIHRoaXMgaXNzdWUgd2FzIGRpc2NvdmVyZWQgd2hlbiB0ZXN0aW5nIGhpcw0KPj4+
IENFQyBwYXRjaGVzLg0KPj4+DQo+Pj4gUmVnYXJkcywNCj4+Pg0KPj4+IAlIYW5zDQo+Pj4NCj4+
PiBPbiA4LzEzLzE5IDExOjMyIEFNLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+Pj4+IFdoZW4gdGVz
dGluZyBDRUMgb24gdGhlIEFNTC1TOTA1WC1DQyBib2FyZCBJIG5vdGljZWQgdGhhdCB0aGUgQ0VD
IHBoeXNpY2FsDQo+Pj4+IGFkZHJlc3Mgd2FzIG5vdCBpbnZhbGlkYXRlZCB3aGVuIHRoZSBIRE1J
IGNhYmxlIHdhcyB1bnBsdWdnZWQuIFNvbWUgbW9yZQ0KPj4+PiBkaWdnaW5nIHNob3dlZCB0aGF0
IG1lc29uIHVzZXMgbWVzb25fZHdfaGRtaS5jIHRvIGhhbmRsZSB0aGUgSFBELg0KPj4+Pg0KPj4+
PiBCb3RoIGR3X2hkbWlfaXJxKCkgYW5kIGR3X2hkbWlfdG9wX3RocmVhZF9pcnEoKSAoaW4gbWVz
b25fZHdfaGRtaS5jKSBjYWxsDQo+Pj4+IHRoZSBkd19oZG1pX3NldHVwX3J4X3NlbnNlKCkgZnVu
Y3Rpb24uIFNvIG1vdmUgdGhlIGNvZGUgdG8gaW52YWxpZGF0ZSB0aGUNCj4+Pj4gQ0VDIHBoeXNp
Y2FsIGFkZHJlc3MgdG8gdGhhdCBmdW5jdGlvbiwgc28gdGhhdCBpdCBpcyBpbmRlcGVuZGVudCBv
ZiB3aGVyZQ0KPj4+PiB0aGUgSFBEIGludGVycnVwdCBoYXBwZW5zLg0KPj4+Pg0KPj4+PiBUZXN0
ZWQgd2l0aCBib3RoIGEgQU1MLVM5MDVYLUNDIGFuZCBhIEtoYWRhcyBWSU0yIGJvYXJkLg0KPj4+
Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFs
bC5ubD4NCj4+Pj4gLS0tDQo+Pj4+IE5vdGU6IGFuIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIG1h
a2UgYSBuZXcgZHctaGRtaSBmdW5jdGlvbiBzdWNoIGFzDQo+Pj4+IGR3X2hkbWlfY2VjX3BoeXNf
YWRkcl9pbnZhbGlkYXRlKCkgdGhhdCBpcyBjYWxsZWQgZnJvbSBtZXNvbl9kd19oZG1pLmMuDQo+
Pj4+IEkgZGVjaWRlZCBub3QgdG8gZG8gdGhhdCBzaW5jZSB0aGlzIHBhdGNoIGlzIG1pbmltYWxs
eSBpbnZhc2l2ZSwgYnV0DQo+Pj4+IHRoYXQgY2FuIG9idmlvdXNseSBiZSBjaGFuZ2VkIGlmIHRo
YXQgYXBwcm9hY2ggaXMgcHJlZmVycmVkLg0KPj4+PiAtLS0NCj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMNCj4+Pj4gaW5kZXggYzVhODU0YWY1NGY4Li5lODk5
YjMxZTE0MzIgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMv
ZHctaGRtaS5jDQo+Pj4+IEBAIC0yMzI5LDYgKzIzMjksMTMgQEAgdm9pZCBkd19oZG1pX3NldHVw
X3J4X3NlbnNlKHN0cnVjdCBkd19oZG1pICpoZG1pLCBib29sIGhwZCwgYm9vbCByeF9zZW5zZSkN
Cj4+Pj4gIAkJZHdfaGRtaV91cGRhdGVfcG93ZXIoaGRtaSk7DQo+Pj4+ICAJCWR3X2hkbWlfdXBk
YXRlX3BoeV9tYXNrKGhkbWkpOw0KPj4+PiAgCX0NCj4+Pj4gKwlpZiAoIWhwZCAmJiAhcnhfc2Vu
c2UpIHsNCj4+Pj4gKwkJc3RydWN0IGNlY19ub3RpZmllciAqbm90aWZpZXIgPSBSRUFEX09OQ0Uo
aGRtaS0+Y2VjX25vdGlmaWVyKTsNCj4+Pj4gKw0KPj4+PiArCQlpZiAobm90aWZpZXIpDQo+Pj4+
ICsJCQljZWNfbm90aWZpZXJfcGh5c19hZGRyX2ludmFsaWRhdGUobm90aWZpZXIpOw0KPj4+PiAr
CX0NCj4+Pj4gKw0KPj4+PiAgCW11dGV4X3VubG9jaygmaGRtaS0+bXV0ZXgpOw0KPj4+PiAgfQ0K
Pj4+PiAgRVhQT1JUX1NZTUJPTF9HUEwoZHdfaGRtaV9zZXR1cF9yeF9zZW5zZSk7DQo+Pj4+IEBA
IC0yMzY5LDE0ICsyMzc2LDYgQEAgc3RhdGljIGlycXJldHVybl90IGR3X2hkbWlfaXJxKGludCBp
cnEsIHZvaWQgKmRldl9pZCkNCj4+Pj4gIAkJZHdfaGRtaV9zZXR1cF9yeF9zZW5zZShoZG1pLA0K
Pj4+PiAgCQkJCSAgICAgICBwaHlfc3RhdCAmIEhETUlfUEhZX0hQRCwNCj4+Pj4gIAkJCQkgICAg
ICAgcGh5X3N0YXQgJiBIRE1JX1BIWV9SWF9TRU5TRSk7DQo+Pj4+IC0NCj4+Pj4gLQkJaWYgKChw
aHlfc3RhdCAmIChIRE1JX1BIWV9SWF9TRU5TRSB8IEhETUlfUEhZX0hQRCkpID09IDApIHsNCj4+
Pj4gLQkJCXN0cnVjdCBjZWNfbm90aWZpZXIgKm5vdGlmaWVyOw0KPj4+PiAtDQo+Pj4+IC0JCQlu
b3RpZmllciA9IFJFQURfT05DRShoZG1pLT5jZWNfbm90aWZpZXIpOw0KPj4+PiAtCQkJaWYgKG5v
dGlmaWVyKQ0KPj4+PiAtCQkJCWNlY19ub3RpZmllcl9waHlzX2FkZHJfaW52YWxpZGF0ZShub3Rp
Zmllcik7DQo+Pj4+IC0JCX0NCj4+Pj4gIAl9DQo+Pj4+DQo+Pj4+ICAJaWYgKGludHJfc3RhdCAm
IEhETUlfSUhfUEhZX1NUQVQwX0hQRCkgew0KPj4+Pg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
