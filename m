Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D4B000A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 17:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892E86EB3C;
	Wed, 11 Sep 2019 15:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710040.outbound.protection.outlook.com [40.107.71.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277986EB3C;
 Wed, 11 Sep 2019 15:29:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVnmRb5k0GlY3GJPlBg1SG/kvP7YPy5SqkoBGPjCipAQTLEwhB/hyfa1h2KVBCnTSeqPWqFMAnG2KVQh6eEQRB/EaHBLQEwJyEyPm4BIAmPC5/nZxuF9Ow/FXiVmDNlk38npOlfwZs0AGU0aBY367r7F4ojB20d6XNPQgE5mQW4oGVvjtw43SEsfuf8ZO+8RFanQvCitzVcgvCDWnla8c1VfBJmP3XYn1GDt1Jeuh5faZqO99ciwpnViuezP8wd17orYHdzBakA21e0qj6EZ8mDrEerIfQGHU9RzHCv9aXUXWK/Juv/N45/l3BDslWTfIXUG/TahUDqomHZgLMlS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWDKTFAfS001HTLz2LPXt6/11mV6xN/B/HagWzJTW/4=;
 b=elidUmNjaNyf3AtLF14hc9ixYadXl6vtZ9iuuPAVA8pKkXOjjF58Db5U8z8FZdY/Yy0ivcVRJR0Rmjk2IeNYcGlo9pyGyE4zRX+kAff5P6sYDUHLGVkiuUgPaebP/hYrj+umoZO27NRaljyKNxj7dq1IRJjShWPAumOmAomqN8CcXw1V2zN0w9wFO2PTV3kwikZvL93yH1WGIhuzCfuA1ta+RmhNUN1EC/OQ1RpW851yh2GRvU7S+XWwEbCuJb3kkoLTMGnMKI7K+cRJUqbSm/k2OABzq5yTetAlt58uDDEyNOysl1tt8AkfR1kBh0G6L1Q15vvpwdJEPPiynskDKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1617.namprd12.prod.outlook.com (10.172.22.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Wed, 11 Sep 2019 15:29:49 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f0e0:63fb:5af:5e1f]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f0e0:63fb:5af:5e1f%8]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 15:29:49 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, =?utf-8?B?TWljaGVsIETDpG56ZXI=?=
 <michel@daenzer.net>, "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou,
 David(ChunMing)" <David1.Zhou@amd.com>
Subject: RE: [PATCH] drm/radeon: Bail earlier when radeon.cik_/si_support=0 is
 passed
Thread-Topic: [PATCH] drm/radeon: Bail earlier when radeon.cik_/si_support=0
 is passed
Thread-Index: AQHVZbtpHgXqCGyBTU2b2ltbftxqdKcknjiAgAAMrACAAfTSMA==
Date: Wed, 11 Sep 2019 15:29:49 +0000
Message-ID: <BN6PR12MB180943F751CF9CCFA8B5B7F0F7B10@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190907203238.232005-1-hdegoede@redhat.com>
 <22da19aa-0ab4-ab48-ab70-037ec41c2f87@daenzer.net>
 <3c0eb318-6c30-fc98-4005-80b5c00b8f5e@redhat.com>
In-Reply-To: <3c0eb318-6c30-fc98-4005-80b5c00b8f5e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44f6b839-6590-4f91-b1c7-08d736cce26b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1617; 
x-ms-traffictypediagnostic: BN6PR12MB1617:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1617D9AD8CFD48C9910CA527F7B10@BN6PR12MB1617.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(199004)(189003)(13464003)(99286004)(5660300002)(478600001)(74316002)(7696005)(316002)(66574012)(6116002)(966005)(3846002)(86362001)(7736002)(6306002)(6436002)(6246003)(6636002)(52536014)(25786009)(305945005)(2906002)(53936002)(76176011)(14454004)(53546011)(6506007)(446003)(256004)(66446008)(64756008)(66946007)(11346002)(14444005)(66556008)(66476007)(66066001)(81156014)(81166006)(55016002)(9686003)(33656002)(4326008)(71190400001)(76116006)(26005)(54906003)(229853002)(8936002)(476003)(8676002)(486006)(71200400001)(186003)(102836004)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1617;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ihSCusjx+rBswyHG7xab8LTrb02i7Ol94sL17d6Cyt9xAeKAVYkycfvBsfl263QfhiOalm80lP4aR3X5Gt9KTD6dqlTuY9Dw8ajL2YrNB4MQdgC7lbuTfH7CJgg592PWlr5pWIXnKMYMG3YYMR26qpPwBFD1HqlT6cihVVRgyjyKPO+FTadXs462YkWX8WjW5gwGbfdB0S9eSaG02IWN98yo+0qcRae55MvONmYPb6yfo/G95vHaiolvBSt8jm2/sW19uj3ZDPQazlGRQ/MDpyNFpoMPORoRC3fLKel+R8FOQQJICNa4MxQZaUsVTMXEp31trBWrs9zeNZ84pC01xhHiKR408Lron2GwIM0fma7Drbq0wpyKD4vC8l1SJAia0HLpg083AAZRYQVT2bSoq0qp1cQcHrCrvOUhS0adcMs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f6b839-6590-4f91-b1c7-08d736cce26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 15:29:49.4252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dTrB8o3GJ23YjWaA9HY/U/rW+4G+gMX5Ufxuoz0sPe5yhe3tPzOiAjyVDvGS0V+/+gpgpV9SZ8ryVP7MNOMPoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1617
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWDKTFAfS001HTLz2LPXt6/11mV6xN/B/HagWzJTW/4=;
 b=DeWcEvTBlseVmox+rIMMN15Y77hwNSo6n92auoQAsBqzySGjFQkn1l+XtZn6aD+18b6OPgk2FOmAJqwH/H0CrBSXmXOrxnIpum0tjD4SLlpXRKGPBQ8fmMVLMP/8jbwLKpNwr4AXM1kTKtTLP1jnG+Vpc+lyS3mWGy/Xj2oJu2w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTAsIDIwMTkgNToz
NiBBTQ0KPiBUbzogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD47IERldWNoZXIs
IEFsZXhhbmRlcg0KPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0
aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBaaG91LCBEYXZpZChDaHVuTWluZykN
Cj4gPERhdmlkMS5aaG91QGFtZC5jb20+DQo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtDQo+IGdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gZHJtL3JhZGVvbjogQmFpbCBlYXJsaWVyIHdoZW4NCj4gcmFkZW9u
LmNpa18vc2lfc3VwcG9ydD0wIGlzIHBhc3NlZA0KPiANCj4gSGksDQo+IA0KPiBPbiA5LzEwLzE5
IDk6NTAgQU0sIE1pY2hlbCBEw6RuemVyIHdyb3RlOg0KPiA+IE9uIDIwMTktMDktMDcgMTA6MzIg
cC5tLiwgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4gPj4gQmFpbCBmcm9tIHRoZSBwY2lfZHJpdmVy
IHByb2JlIGZ1bmN0aW9uIGluc3RlYWQgb2YgZnJvbSB0aGUNCj4gPj4gZHJtX2RyaXZlciBsb2Fk
IGZ1bmN0aW9uLg0KPiA+Pg0KPiA+PiBUaGlzIGF2b2lkIC9kZXYvZHJpL2NhcmQwIHRlbXBvcmFy
aWx5IGdldHRpbmcgcmVnaXN0ZXJlZCBhbmQgdGhlbg0KPiA+PiB1bnJlZ2lzdGVyZWQgYWdhaW4s
IHNlbmRpbmcgdW53YW50ZWQgYWRkIC8gcmVtb3ZlIHVkZXYgZXZlbnRzIHRvDQo+ID4+IHVzZXJz
cGFjZS4NCj4gPj4NCj4gPj4gU3BlY2lmaWNhbGx5IHRoaXMgYXZvaWRzIHRyaWdnZXJpbmcgdGhl
ICh1c2Vyc3BhY2UpIGJ1ZyBmaXhlZCBieSB0aGlzDQo+ID4+IHBseW1vdXRoIG1lcmdlLXJlcXVl
c3Q6DQo+ID4+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9wbHltb3V0aC9wbHltb3V0
aC9tZXJnZV9yZXF1ZXN0cy81OQ0KPiA+Pg0KPiA+PiBOb3RlIHRoYXQgZGVzcGl0ZSB0aGF0IGJl
aW5nIGFuIHVzZXJzcGFjZSBidWcsIG5vdCBzZW5kaW5nDQo+ID4+IHVubmVjZXNzYXJ5IHVkZXYg
ZXZlbnRzIGlzIGEgZ29vZCBpZGVhIGluIGdlbmVyYWwuDQo+ID4+DQo+ID4+IEJ1Z0xpbms6IGh0
dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTQ5MDQ5MA0KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiA+DQo+
ID4gUmV2aWV3ZWQtYnk6IE1pY2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRoYXQuY29tPg0KPiAN
Cj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LiBJJ3ZlIGRybSBwdXNoIHJpZ2h0cywgYnV0IEkg
Z3Vlc3MgdGhhdCByYWRlb24vYW1kDQo+IEdQVSBwYXRjaGVzIGFyZSBjb2xsZWN0ZWQgYnkgc29t
ZW9uZSBAQU1ELCBzbyBJIGRvIG5vdCBuZWVkIHRvIC8gc2hvdWxkDQo+IG5vdCBwdXNoIHRoaXMg
bXlzZWxmLCByaWdodD8NCg0KSSdsbCBwaWNrIHRoaXMgdXAgbGF0ZXIgdGhpcyB3ZWVrIHdoZW4g
SSBnZXQgaG9tZSBmcm9tIHRyYXZlbC4NCg0KVGhhbmtzIQ0KDQpBbGV4DQoNCj4gDQo+ID4gYW1k
Z3B1IHNob3VsZCBiZSBjaGFuZ2VkIGNvcnJlc3BvbmRpbmdseSBhcyB3ZWxsLg0KPiANCj4gR29v
ZCBwb2ludC4gSSdtIGN1cnJlbnRseSB0cmF2ZWxsaW5nIChAcGx1bWJlcnMpIEkgY2FuIGRvIHRo
aXMgd2hlbiBJJ20gYmFjaw0KPiBob21lLCBidXQgZmVlbCBmcmVlIHRvIGJlYXQgbWUgdG8gaXQg
KGlmIHlvdSBkbyBwbGVhc2UgQ2MgbWUgdG8gYXZvaWQgZG91YmxlDQo+IHdvcmspLg0KPiANCj4g
UmVnYXJkcywNCj4gDQo+IEhhbnMNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
