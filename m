Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA7F10F63D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 05:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358E36E02E;
	Tue,  3 Dec 2019 04:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680049.outbound.protection.outlook.com [40.107.68.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797E26E02E;
 Tue,  3 Dec 2019 04:18:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4cSWdmvO74GlK+FcPo62gfxKzrxxfg5d2tDT1XQ2naMi6doaCVc11ynpBMPmBwz4Zp249EPodiCZ6OjebAg0B5+DN34rslZCOxkIz20Uuh0qaEIDwaD050cWww5+CKB7l/BL9u065FJyRem+PXouB8lfAi9SuWlaijN95Q8SKSAGataqZ8LujOdFfD2H54gUBeK2y8infHDCwGNGzStOJl69iTSioElM1I7Ixe0Ytk2lSgyOYAumzb1E09MF7msscbBm3HnAshlRPWFKS5iSAOTFLKoUvyZqHAi2m4BdlT9fT7MaPrEdLUOYPBVNmUAGf4zgudYW97u8rQipfxSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyPKmY551cadOnEOIANF5JQVq5Qatp09zEd6kkwixdE=;
 b=gPDNl8dbv2k+UAu0L3lOqPXRQdn23QNYGZt178nujcxYX74xh+9MPgmdc0UWQ0L/853HHouBrEJJ1MzDuL81Bi53NttjjAfXPL1cL3LHVL8HcGfFr3XR9hJIMc7w9sgYvgP9y+jD90B55uNuCPYDNS1UIr9fe9Dd420SIjbYe+CYI0HTakkvpTA/QTfxj9WKp3zqgZAC0Lo7p+5OBE9M0oFaGpLV86JTGicC76N5zssyUGgtiCkOBcnoBJxc6Xp3n9OmMwjPoGABauCWEFMSkg1vbsj9H0FvtUX+euQ7YnlGyYCMIaq3JeJsrsLjuwOh1mb11zcRqQU1XsGuaxYzLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6SPR01MB0081.namprd12.prod.outlook.com (10.255.172.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Tue, 3 Dec 2019 04:18:52 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::f06d:7ff3:2a22:99d4]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::f06d:7ff3:2a22:99d4%3]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 04:18:52 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/dp_mst: Correct the bug in
 drm_dp_update_payload_part1()
Thread-Topic: [PATCH] drm/dp_mst: Correct the bug in
 drm_dp_update_payload_part1()
Thread-Index: AQHVqMTS1g24hAS7S0KwALex6xaG4aenjicAgABAVMA=
Date: Tue, 3 Dec 2019 04:18:52 +0000
Message-ID: <DM6PR12MB41370F38FE447FB285E21A9CFC420@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20191202035841.16984-1-Wayne.Lin@amd.com>
 <0ee5e2e9f6a739ee95715764ee8a3673fec29d08.camel@redhat.com>
In-Reply-To: <0ee5e2e9f6a739ee95715764ee8a3673fec29d08.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 59e327e0-322d-49be-6360-08d777a7e79e
x-ms-traffictypediagnostic: DM6SPR01MB0081:|DM6SPR01MB0081:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6SPR01MB00817C9DB9B9DBDE7B91C130FC420@DM6SPR01MB0081.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(13464003)(189003)(199004)(26005)(55016002)(9686003)(102836004)(186003)(11346002)(478600001)(446003)(99286004)(14454004)(66066001)(6246003)(256004)(110136005)(66556008)(64756008)(76116006)(25786009)(6436002)(66946007)(66476007)(53546011)(6506007)(76176011)(7696005)(4326008)(54906003)(229853002)(66446008)(316002)(6116002)(14444005)(3846002)(2906002)(52536014)(5660300002)(71190400001)(33656002)(71200400001)(81156014)(305945005)(74316002)(81166006)(86362001)(8676002)(7736002)(8936002)(2501003)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6SPR01MB0081;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i5n1E21ijUbkZQFwZIpmBd5pPRVUI9EBeeRVWAa7hFep+bJTWAvnoWh9Aq3LqQK652n1r/dnuAHUvdfTxvC/1VVNJX392GeUK9HyeXLS6f+cLEyXyWIh6CgOc++x/maoIRt09WEzl/G/ulhcMtNLLxLHedjwXYDZagBOMxM4MAXxJgwerW9KYg4H7xCf4sjQjcaSn341RcYyXu051v62/EN1LGVXeVrJ8D+NRCIHDsey5p5BLKAM5GtmubOQkM8SxspTgp1iJfPDvlmWQUtwQ2OXGIGDMaIOnq4Ts0AESsFFg9grk/7+MoP5Ty3FFkMlzK59wRUbkIR5RlBng/mNBdvzDpw20WXnUPbNf39TtlPBQEFJtsZy49OMB8sNqpASWgKSluR4g/A3Qha8o6kS6smyH+nIJYJaTzGDqaqqe7/uFh4DpehtR4OpQYdQZn3K
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e327e0-322d-49be-6360-08d777a7e79e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 04:18:52.4369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Y026wnRTBQGzYl32C2FuScbZwKCPgMZ5z5w2WgcyvadM4wtzVbBqk3dxsGinCqwo6L1lncoNAK+yu9D9dvJ7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0081
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyPKmY551cadOnEOIANF5JQVq5Qatp09zEd6kkwixdE=;
 b=I5sE8M8SIsrPZsMYmvUwJQTN8j8wVQJETRd+5S3S5HVjDChyznVq0wc7Sn0R6pWcJ8Ib7f/lbgmVJbi7V7Q+NS/yc1wHYQkRNO9dU2uuaJIVZwr41S8ZwXAp07FJCTyDiNPjpk0eidA3RZWndjfJ5SNvwxjtzJUcE76IlZRTaaw=
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
ZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMywgMjAxOSA4OjIzIEFN
DQo+IFRvOiBMaW4sIFdheW5lIDxXYXluZS5MaW5AYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBL
YXpsYXVza2FzLCBOaWNob2xhcyA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29tPjsgV2VudGxh
bmQsIEhhcnJ5DQo+IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPjsgWnVvLCBKZXJyeSA8SmVycnku
WnVvQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9kcF9tc3Q6IENvcnJlY3Qg
dGhlIGJ1ZyBpbg0KPiBkcm1fZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoKQ0KPiANCj4gT24gTW9u
LCAyMDE5LTEyLTAyIGF0IDExOjU4ICswODAwLCBXYXluZSBMaW4gd3JvdGU6DQo+ID4gW1doeV0N
Cj4gPiBJZiB0aGUgcGF5bG9hZF9zdGF0ZSBpcyBEUF9QQVlMT0FEX0RFTEVURV9MT0NBTCBpbiBz
ZXJpZXMsIGN1cnJlbnQNCj4gPiBjb2RlIGRvZXNuJ3QgZGVsZXRlIHRoZSBwYXlsb2FkIGF0IGN1
cnJlbnQgaW5kZXggYW5kIGp1c3QgbW92ZSB0aGUNCj4gPiBpbmRleCB0byBuZXh0IG9uZSBhZnRl
ciBzaHVmZmxpbmcgcGF5bG9hZHMuDQo+ID4NCj4gPiBbSG93XQ0KPiA+IEFmdGVyIHNodWZmbGlu
ZyBwYXlsb2FkcywgZGVjaWRlIHdoZXRoZXIgdG8gbW92ZSBvbiBpbmRleCBvciBub3QNCj4gPiBh
Y2NvcmRpbmcgdG8gcGF5bG9hZF9zdGF0ZSBvZiBjdXJyZW50IHBheWxvYWQuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBXYXluZSBMaW4gPFdheW5lLkxpbkBhbWQuY29tPg0KPiA+IC0tLQ0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMyArKy0NCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gPiBpbmRleCA4MWU5MmIyNjBk
N2EuLjhkYTVkNDYxZWEwMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYw0KPiA+IEBAIC0zMTc2LDcgKzMxNzYsOCBAQCBpbnQgZHJtX2RwX3VwZGF0ZV9wYXls
b2FkX3BhcnQxKHN0cnVjdA0KPiA+IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpDQo+ID4g
IAkJCWRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQocG9ydCk7DQo+ID4gIAl9DQo+ID4NCj4g
PiAtCWZvciAoaSA9IDA7IGkgPCBtZ3ItPm1heF9wYXlsb2FkczsgaSsrKSB7DQo+ID4gKwlmb3Ig
KGkgPSAwOyBpIDwgbWdyLT5tYXhfcGF5bG9hZHM7DQo+ID4gKwkJKG1nci0+cGF5bG9hZHNbaV0u
cGF5bG9hZF9zdGF0ZSA9PSBEUF9QQVlMT0FEX0RFTEVURV9MT0NBTCkgPw0KPiA+IGkgOiBpKysp
IHsNCj4gDQo+IFRvb2sgbWUgYSBtb21lbnQgdG8gZmlndXJlIG91dCB3aGF0IHRoaXMgbGluZSB3
YXMgYWN0dWFsbHkgZG9pbmcuIE5pY2UgY2F0Y2gNCj4gYnkgdGhlIHdheSENCj4gDQo+IEFueXdh
eTogbGV0J3MganVzdCBkcm9wIHRoaXMgbGluZSB0byBhdm9pZCBtYWtpbmcgdGhpbmdzIGNvbmZ1
c2luZyB0byByZWFkLCBkcm9wDQo+IGkrKyBmcm9tIHRoZSBmb3IgbG9vcCBpbnN0ZWFkLCBhbmQg
anVzdCByZXdyaXRlIGl0IHNvIGl0IGxvb2tzIGxpa2UgdGhpczoNCj4gDQo+IGZvciAoaSA9IDA7
IGkgPCBtZ3ItPm1heF9wYXlsb2FkczsgLyogZG8gbm90aGluZyAqLykgew0KPiAJaWYgKG1nci0+
cGF5bG9hZHNbaV0ucGF5bG9hZF9zdGF0ZSAhPSBEUF9QQVlMT0FEX0RFTEVURV9MT0NBTCkgew0K
PiAJCWkrKzsNCj4gCQljb250aW51ZTsNCj4gCX0NCj4gDQo+IFdpdGggdGhvc2UgY2hhbmdlcywg
dGhpcyBwYXRjaCBpczoNCj4gDQo+IFJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPg0KPiANCg0KVGhhbmtzIGZvciB5b3VyIHRpbWUgYW5kIHNvcnJ5IGZvciBub3Qgd2Vs
bCBvcmdhbml6ZWQgY29kZS4NCkkgd2lsbCBzZW5kIHlvdSB0aGUgdjIgcmlnaHQgYXdheS4gVGhh
bmtzIQ0KIA0KPiBJIGNhbiBnbyBhaGVhZCBhbmQgcHVzaCB0aGVzZSBwYXRjaGVzIHRvIGRybS1t
aXNjIGZvciB5b3Ugb25jZSB5b3UndmUgc2VudA0KPiBtZSB0aGUgdjINCj4gPiAgCQlpZiAobWdy
LT5wYXlsb2Fkc1tpXS5wYXlsb2FkX3N0YXRlICE9IERQX1BBWUxPQURfREVMRVRFX0xPQ0FMKQ0K
PiA+ICAJCQljb250aW51ZTsNCj4gPg0KPiAtLQ0KPiBDaGVlcnMsDQo+IAlMeXVkZSBQYXVsDQot
LQ0KQlIsDQpXYXluZSBMaW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
