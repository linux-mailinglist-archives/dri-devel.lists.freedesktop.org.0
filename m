Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE37010F940
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 08:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2FC6E1A3;
	Tue,  3 Dec 2019 07:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800041.outbound.protection.outlook.com [40.107.80.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC5189FF9;
 Tue,  3 Dec 2019 07:47:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTKWX3EWBXYy/G1jxD/GkHI7h6xxiOmUaX/1gbTUsFbhFtTcTgkKoMxVnNqd7gDe1jCKzqYeBYWtvShhJGkzrYzGjzF+DTYVEGSYVnwLAgiOdPifX3K1Dze5J2dgmFhlqRo5OSU3LaKQNHnmJAbaGkuVH3RVVFVr4hFPvrJ4Od2d4F91ZpbyXEJIdbbSILB0BLV131T3k4gSXBNQRa9x60zh6x8KUmuDEMBTAG1nDtQTgklCvIGrPpmTTCYrPZ8yWAhB29qLnONQYcUXJpSw1gHhpJDN8KK0KeydBVP+36x1J61SR48YHY3CG8L8FMvNN5k8fJ7/t/UROT2npyFkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOuR/qsOh1DNAacH7yhUy5NkPscbBYkARC7g3hi0PM8=;
 b=TheEeo4dnvlaLfATb2VwcLD2GKY5zx8IFDIK3LiLqpu/8GNH5s5PcGfOhfrj5oSRAlrrreSrMp1Uc8BGmfu6bvB/k3qlqSTrfTF7vr5IPgDEmX/3D/163dT+tUx880VopvgLMQRpWAA9/9WOK8uzY20+cH7o4pn4LTM4e7GEuU9BHICiAvDgvAfMR7dfAAkFxocvB+7xpZe1TqMn85IUb4uIIMwTHJMIHg8Al1vDmggf5OG5Onqigu5HfZSIO7jS5QahO3mL2HoLiRDSLvJGs9JRZeZ9iaAv4lI0OTHl7WI9JzKyEXolKFllGYTEub9yrrnpOcSOeQnU3XK7VOhuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB2969.namprd12.prod.outlook.com (20.178.29.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Tue, 3 Dec 2019 07:47:47 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::f06d:7ff3:2a22:99d4]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::f06d:7ff3:2a22:99d4%3]) with mapi id 15.20.2516.003; Tue, 3 Dec 2019
 07:47:47 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/dp_mst: Remove VCPI while disabling topology mgr
Thread-Topic: [PATCH] drm/dp_mst: Remove VCPI while disabling topology mgr
Thread-Index: AQHVqMTDkx7LGqPGT0KWVsia36v+wqeniGWAgABrX6A=
Date: Tue, 3 Dec 2019 07:47:47 +0000
Message-ID: <DM6PR12MB41374D000AAD2C20191EDB58FC420@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20191202035737.16909-1-Wayne.Lin@amd.com>
 <a67744f1ddebe98a0760677949ef014f6a150f74.camel@redhat.com>
In-Reply-To: <a67744f1ddebe98a0760677949ef014f6a150f74.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 90cc31d4-f346-428d-a09c-08d777c51743
x-ms-traffictypediagnostic: DM6PR12MB2969:|DM6PR12MB2969:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB29697978199AE6C6602239F4FC420@DM6PR12MB2969.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(13464003)(189003)(199004)(81166006)(6246003)(478600001)(8676002)(25786009)(8936002)(99286004)(81156014)(2501003)(54906003)(66446008)(66066001)(64756008)(14454004)(66476007)(66556008)(3846002)(316002)(52536014)(2906002)(7736002)(4326008)(5660300002)(110136005)(86362001)(186003)(7696005)(102836004)(66946007)(6116002)(2201001)(76176011)(14444005)(71200400001)(76116006)(74316002)(11346002)(305945005)(71190400001)(33656002)(446003)(256004)(9686003)(55016002)(53546011)(229853002)(26005)(6506007)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2969;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: APj6vLTeL5VCkvqLFpJznqgFyed6SY7eO4AoeYDil4Uh48Rh1IZQUTWzrcyoW33am4DtN494WNKhA6Qxp7LQwr0AVOt/auJbCN3uPaKe3MMljgOd/4jq5qPDylAhOY/+mAoCfLL1MaVE7K1nrh82fYbCROYuhe5Ox/P5noBwFsMxnutYK5MWetWatz43Uw2ryGLUmCbCAo6nR1q23D1U62SnR7E66v94/vrKKVswFHWWmeJB9RKKL1buM9agARRXHkhyjq45Kh8Us3wowUovsRTnnHaEsfgU2pamksKWiutuCZqBnAiAz6I7bsCC3vKzjXUi6mRh+3tAwXsk2VgrWsHL19Dz3VWMUPaP++ry1AKluyKocVrH+tz+Nf+ptW5FVTbibsPA1aMaatHIfH616jOAMAdzprQPrKIFtH1SQgWPghpA/P/zAYyrurWdoo8l
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cc31d4-f346-428d-a09c-08d777c51743
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 07:47:47.7480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzNXfwFyLvePeMRzjrB3jJlPz9Uxdo7ED2fykom29YJoB02/CMGNemwH5v8fXd4R8uSR6dcCD+OuZc2oAkXBMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2969
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOuR/qsOh1DNAacH7yhUy5NkPscbBYkARC7g3hi0PM8=;
 b=OxaPHLTzwSaSDu4U9fjI8COi8uE1GDF+QtHLwpzvYcPEsdZuzHFgx+Kxzjlo2W0golq4pWjdVYKJSXNKlbW9GOm90//qwLkV75Q0pItZRePkanBGARcksCIsVBlazMuCD7Of0GcfZG7006Ir5cmKSGkulwMffts+Fimrs8KrqjE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTHl1ZGUgUGF1bCA8bHl1
ZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMywgMjAxOSA4OjAzIEFN
DQo+IFRvOiBMaW4sIFdheW5lIDxXYXluZS5MaW5AYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBL
YXpsYXVza2FzLCBOaWNob2xhcyA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29tPjsgV2VudGxh
bmQsIEhhcnJ5DQo+IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPjsgWnVvLCBKZXJyeSA8SmVycnku
WnVvQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9kcF9tc3Q6IFJlbW92ZSBW
Q1BJIHdoaWxlIGRpc2FibGluZyB0b3BvbG9neSBtZ3INCj4gDQo+IEknbSwgbm90IGVudGlyZWx5
IHN1cmUgd2hhdCB0aGlzIHBhdGNoIGlzIHRyeWluZyB0byBhY2NvbXBsaXNoLiBJJ20gZ3Vlc3Np
bmcNCj4gbWF5YmUgd2UncmUgbGVhdmluZyBzdGFsZSBWQ1BJIGFsbG9jYXRpb25zIGZyb20gdGhl
IHByZXZpb3VzIHRvcG9sb2d5DQo+IGVuYWJsZW1lbnQgYW5kIHRoZW4gc29tZWhvdyB0cnlpbmcg
dG8gdXNlIHRob3NlIGFnYWluIHdoZW4gYWxsb2NhdGluZw0KPiBwYXlsb2Fkcz8gVGhlIHBhdGNo
IGxvb2tzIGNvcnJlY3QgYXQgbGVhc3QuDQo+IA0KVGhhbmtzIGZvciB5b3VyIHRpbWUgYW5kIHRo
ZSBjb21tZW50Lg0KDQpZZXMsIHRoaXMgcGF0Y2ggaXMgdHJ5aW5nIHRvIGFkZHJlc3MgdGhlIHBy
b2JsZW0geW91IG1lbnRpb25lZC4NCk9uY2UgdW5wbHVnIGEgRFAgTVNUIGNhcGFibGUgZGV2aWNl
LCBkcml2ZXIgd2lsbCBjYWxsIA0KZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdCgpIHRv
IHJlc2V0IG1nci0+cGF5bG9hZHMgYnV0IGl0IGRvZXNuJ3QNCnJlc2V0IHRoZSBtZ3ItPnByb3Bv
c2VkX3ZjcGlzLiBJZiBpdCBkb2Vzbid0IHJlc2V0IHRoZSBwcm9wb3NlZF92Y3BpLCBjb2RlIHdp
bGwNCmZhaWwgYXQgY2hlY2tpbmcgcG9ydCB2YWxpZGF0aW9uIG9uY2UgcGx1ZyBpbiBNU1QgZGV2
aWNlIGxhdGVyLiANCk9uY2UgTVNUIGNhcGFibGUgZGV2aWNlIHBsdWcgaW4gYWdhaW4gYW5kIHRy
eSB0byBhbGxvY2F0ZSBwYXlsb2FkcyBieSBjYWxsaW5nDQpkcm1fZHBfdXBkYXRlX3BheWxvYWRf
cGFydDEoKSwgdGhpcyBmdW5jdGlvbiB3aWxsIGl0ZXJhdGUgb3ZlciBhbGwgcHJvcG9zZWQNCnZp
cnR1YWwgY2hhbm5lbHMgYW5kIGNoZWNrIGVhY2ggcG9ydCB2YWxpZGF0aW9uIHRvIHNlZSBpZiB0
aGUgc3BlY2lmaWVkIHBvcnQgaXMgc3RpbGwNCmluIHRoZSB0b3BvbG9neS4gU2luY2UgdGhlcmUg
YXJlIHN0YWxlIFZDUEkgYWxsb2NhdGlvbnMgZnJvbSB0aGUgcHJldmlvdXMgdG9wb2xvZ3kNCmVu
YWJsZW1lbnQgaW4gcHJvcG9zZWRfdmNwaVtdLCBjb2RlIGZsb3cgd2lsbCBmYWlsIGFuZCByZXVy
biBFSU5WQUwuDQoNCj4gSWYgdGhpcyBwYXRjaCBpcyBmaXhpbmcgYW4gaXNzdWUsIHN1Y2ggYXMg
ZGlzcGxheXMgbm90IHR1cm5pbmcgb24gd2l0aCBhbWRncHUsIEknZA0KPiBkZWZpbml0ZWx5IG1l
bnRpb24gaXQgaW4gbW9yZSBkZXRhaWwgaGVyZSBhbmQgQ2MgdG8gc3RhYmxlIGlmIGFwcGxpY2Fi
bGUuDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50LiBJIHdpbGwgQ2MgdG8gc3RhYmxlQHZnZXIu
a2VybmVsLm9yZyBhbmQgYW1lbmQgdGhlIA0KbWVzc2FnZSBpbiBtb3JlIGRldGFpbCBpbiBuZXh0
IHZlcnNpb24uDQoNCj4gQWxzbywgb25lIG5pdHBpY2sgYmVsb3c6DQoNClRoYW5rcywgSSdsbCBt
b2RpZnkgaXQuDQo+IA0KPiBPbiBNb24sIDIwMTktMTItMDIgYXQgMTE6NTcgKzA4MDAsIFdheW5l
IExpbiB3cm90ZToNCj4gPiBbV2h5XQ0KPiA+IFdoaWxlIGRpc2FibGluZyBtc3QgdG9wb2xvZ3kg
bWFuYWdlciBpbg0KPiA+IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3NldF9tc3QoKSwgbm93IGp1
c3QgcmVzZXQgdGhlIG1nci0+cGF5bG9hZHMNCj4gPiBidXQgZG9lc24ndCBoYW5kbGUgdGhlIG1n
ci0+cHJvcG9zZWRfdmNwaXMuDQo+ID4NCj4gPiBbSG93XQ0KPiA+IFJlbW92ZSBtZ3ItPnByb3Bv
c2VkX3ZjcGlzIHRvIE5VTEwuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXYXluZSBMaW4gPFdh
eW5lLkxpbkBhbWQuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jIHwgMTIgKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYw0KPiA+IGluZGV4IGFlNTgwOWExZjE5YS4uODFlOTJiMjYwZDdhIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jDQo+ID4gQEAgLTMzODYsNiArMzM4Niw3
IEBAIHN0YXRpYyBpbnQgZHJtX2RwX2dldF92Y19wYXlsb2FkX2J3KHU4DQo+ID4gZHBfbGlua19i
dywNCj4gPiB1OCAgZHBfbGlua19jb3VudCkNCj4gPiAgaW50IGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyX3NldF9tc3Qoc3RydWN0DQo+IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyDQo+ID4gKm1nciwg
Ym9vbCBtc3Rfc3RhdGUpICB7DQo+ID4gIAlpbnQgcmV0ID0gMDsNCj4gPiArCWludCBpID0gMDsN
Cj4gPiAgCXN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiA9IE5VTEw7DQo+ID4NCj4gPiAg
CW11dGV4X2xvY2soJm1nci0+bG9jayk7DQo+ID4gQEAgLTM0NDYsMTAgKzM0NDcsMjEgQEAgaW50
IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3NldF9tc3Qoc3RydWN0DQo+ID4gZHJtX2RwX21zdF90
b3BvbG9neV9tZ3IgKm1nciwgYm9vbCBtcw0KPiA+ICAJCS8qIHRoaXMgY2FuIGZhaWwgaWYgdGhl
IGRldmljZSBpcyBnb25lICovDQo+ID4gIAkJZHJtX2RwX2RwY2Rfd3JpdGViKG1nci0+YXV4LCBE
UF9NU1RNX0NUUkwsIDApOw0KPiA+ICAJCXJldCA9IDA7DQo+ID4gKwkJbXV0ZXhfbG9jaygmbWdy
LT5wYXlsb2FkX2xvY2spOw0KPiA+ICAJCW1lbXNldChtZ3ItPnBheWxvYWRzLCAwLCBtZ3ItPm1h
eF9wYXlsb2FkcyAqIHNpemVvZihzdHJ1Y3QNCj4gPiBkcm1fZHBfcGF5bG9hZCkpOw0KPiA+ICAJ
CW1nci0+cGF5bG9hZF9tYXNrID0gMDsNCj4gPiAgCQlzZXRfYml0KDAsICZtZ3ItPnBheWxvYWRf
bWFzayk7DQo+ID4gKwkJZm9yIChpID0gMDsgaSA8IG1nci0+bWF4X3BheWxvYWRzOyBpKyspIHsN
Cj4gPiArCQkJc3RydWN0IGRybV9kcF92Y3BpICp0bXBfdmNwaSA9IG1nci0+cHJvcG9zZWRfdmNw
aXNbaV07DQo+ID4gKw0KPiA+ICsJCQlpZiAodG1wX3ZjcGkpIHsNCj4gPiArCQkJCXRtcF92Y3Bp
LT52Y3BpID0gMDsNCj4gPiArCQkJCXRtcF92Y3BpLT5udW1fc2xvdHMgPSAwOw0KPiA+ICsJCQl9
DQo+ID4gKwkJCW1nci0+cHJvcG9zZWRfdmNwaXNbaV0gPSBOVUxMOw0KPiA+ICsJCX0NCj4gPiAg
CQltZ3ItPnZjcGlfbWFzayA9IDA7DQo+ID4gKwkJbXV0ZXhfdW5sb2NrKCZtZ3ItPnBheWxvYWRf
bG9jayk7DQo+IA0KPiBiaWtlc2hlZDogSSdkIGp1c3QgcmVuYW1lIHRtcF92Y3BpIGhlcmUgdG8g
dmNwaSwgYnV0IEknbGwgbGVhdmUgdGhhdCB1cCB0byB5b3UNCj4gPiAgCX0NCj4gPg0KPiA+ICBv
dXRfdW5sb2NrOg0KPiAtLQ0KPiBDaGVlcnMsDQo+IAlMeXVkZSBQYXVsDQotLQ0KQlIsDQpXYXlu
ZSBMaW4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
