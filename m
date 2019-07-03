Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB9C5E6FB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 16:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE2A6E156;
	Wed,  3 Jul 2019 14:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790052.outbound.protection.outlook.com [40.107.79.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2641B6E156
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 14:41:19 +0000 (UTC)
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1743.namprd12.prod.outlook.com (10.175.55.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.15; Wed, 3 Jul 2019 14:41:16 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::2884:f3a3:2582:edf6]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::2884:f3a3:2582:edf6%9]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 14:41:16 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Lucas Stach <l.stach@pengutronix.de>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/scheduler: put killed job cleanup to worker
Thread-Topic: [PATCH] drm/scheduler: put killed job cleanup to worker
Thread-Index: AQHVMYoDUGBPoFod9UaqCvOwnPfn16a4r6EAgABFdoCAAAKPAA==
Date: Wed, 3 Jul 2019 14:41:16 +0000
Message-ID: <186e567c-81e7-e874-2dae-4c4495bce224@amd.com>
References: <20190703102802.17004-1-l.stach@pengutronix.de>
 <e40563b4-3a0f-0370-4790-67328c6e5ad2@amd.com>
 <1562164325.2321.13.camel@pengutronix.de>
In-Reply-To: <1562164325.2321.13.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::27) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 049ec791-cdaf-43ab-b5bb-08d6ffc48115
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1743; 
x-ms-traffictypediagnostic: MWHPR12MB1743:
x-microsoft-antispam-prvs: <MWHPR12MB1743293FCA51872E2CCCEF8CEAFB0@MWHPR12MB1743.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:120;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(189003)(199004)(71190400001)(6636002)(71200400001)(110136005)(186003)(6246003)(2616005)(99286004)(76176011)(54906003)(53546011)(6506007)(31686004)(386003)(14454004)(102836004)(2906002)(316002)(26005)(446003)(11346002)(52116002)(66066001)(8676002)(53936002)(6512007)(81156014)(81166006)(8936002)(86362001)(72206003)(31696002)(4326008)(6486002)(25786009)(68736007)(14444005)(7736002)(66556008)(229853002)(478600001)(64756008)(256004)(6116002)(3846002)(73956011)(66476007)(6436002)(305945005)(476003)(66946007)(5660300002)(66446008)(36756003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1743;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jmvCbHNnPWxPcIJIsU58WY1dfadFhkMB7j7qoJZ63Ezc/kfySmwM1va60Uv7XKi/xcuQzGAoOrmb+gSq9MB5r06j2JgJntkGq09ZetJlagFonKtQBImfs7GzemwNb1uafXKJ7u24OWoq6Ttizsw2cWrmrGKoFeqBI7RnrTf0/JYTI5Frqm54n96O6w4FTbhpA/vKaP2MPKR01BYZmD97OxOUMtCNzpE+6XBRBPU66dNuAQ7eOMRvGUjINK6nKNLe+OX+xAxkPCDcWCE6LhoAueX6COgwteBdE4yZQrR+h7V5U3+Lj0Fm2QQlh72JE4NoWTu+Iw4xk5v4+eNcNKzaPhNBpw05zM9xghyOwfQlJvSA4DOUOVNwYhfBxcDZ0OXWzwIEfxi5+VtFEwIJqfk3mmiKTkdrzYbG+8R4xkiRPno=
Content-ID: <63847A9207F9544FA2411ADE30996C87@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049ec791-cdaf-43ab-b5bb-08d6ffc48115
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 14:41:16.7003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1743
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqdWlIfgw/Lo0KFa+0PYjCCkGcWeflEvZuF9TOscrO0=;
 b=rVgjUGbegr2sMUNGiz6i/rqKrm2TpjVsHPSkP+eQKpaiJcSLyhR5OsZIWBQbNoT3pd6PxzLRL0doL0XovB4GorL/PZkG8mZW52HJo2+SUCOoplpgISFHnoY5ZzmPFTJiTcQTaU4tLs3ELFjfRlhtgapOMMHZwnGJMdy0U4DrYe0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiA3LzMvMTkgMTA6MzIgQU0sIEx1Y2FzIFN0YWNoIHdyb3RlOg0KPiBBbSBNaXR0d29jaCwg
ZGVuIDAzLjA3LjIwMTksIDE0OjIzICswMDAwIHNjaHJpZWIgR3JvZHpvdnNreSwgQW5kcmV5Og0K
Pj4gT24gNy8zLzE5IDY6MjggQU0sIEx1Y2FzIFN0YWNoIHdyb3RlOg0KPj4+IGRybV9zY2hlZF9l
bnRpdHlfa2lsbF9qb2JzX2NiKCkgaXMgY2FsbGVkIHJpZ2h0IGZyb20gdGhlIGxhc3Qgc2NoZWR1
bGVkDQo+Pj4gam9iIGZpbmlzaGVkIGZlbmNlIHNpZ25hbGluZy4gQXMgdGhpcyBtaWdodCBoYXBw
ZW4gZnJvbSBJUlEgY29udGV4dCB3ZQ0KPj4+IG5vdyBlbmQgdXAgY2FsbGluZyB0aGUgR1BVIGRy
aXZlciBmcmVlX2pvYiBjYWxsYmFjayBpbiBJUlEgY29udGV4dCwgd2hpbGUNCj4+PiBhbGwgb3Ro
ZXIgcGF0aHMgY2FsbCBpdCBmcm9tIG5vcm1hbCBwcm9jZXNzIGNvbnRleHQuDQo+Pj4NCj4+PiBF
dG5hdml2IGluIHBhcnRpY3VsYXIgY2FsbHMgY29yZSBrZXJuZWwgZnVuY3Rpb25zIHRoYXQgYXJl
IG9ubHkgdmFsaWQgdG8NCj4+PiBiZSBjYWxsZWQgZnJvbSBwcm9jZXNzIGNvbnRleHQgd2hlbiBm
cmVlaW5nIHRoZSBqb2IuIE90aGVyIGRyaXZlcnMgbWlnaHQNCj4+PiBoYXZlIHNpbWlsYXIgaXNz
dWVzLCBidXQgSSBkaWQgbm90IHZhbGlkYXRlIHRoaXMuIEZpeCB0aGlzIGJ5IHB1bnRpbmcNCj4+
PiB0aGUgY2xlYW51cCB3b3JrIGludG8gYSB3b3JrIGl0ZW0sIHNvIHRoZSBkcml2ZXIgZXhwZWN0
YXRpb25zIGFyZSBtZXQuDQo+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxs
LnN0YWNoQHBlbmd1dHJvbml4LmRlPg0KPj4+IC0tLQ0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIHwgMjggKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+
Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkN
Cj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2Vu
dGl0eS5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYw0KPj4+IGlu
ZGV4IDM1ZGRiZWMxMzc1YS4uYmE0ZWI2Njc4NGI5IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jDQo+Pj4gQEAgLTIwMiwyMyArMjAyLDIzIEBAIGxv
bmcgZHJtX3NjaGVkX2VudGl0eV9mbHVzaChzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5
LCBsb25nIHRpbWVvdXQpDQo+Pj4gIMKgIH0NCj4+PiAgwqAgRVhQT1JUX1NZTUJPTChkcm1fc2No
ZWRfZW50aXR5X2ZsdXNoKTsNCj4+PiAgICANCj4+PiAtLyoqDQo+Pj4gLSAqIGRybV9zY2hlZF9l
bnRpdHlfa2lsbF9qb2JzIC0gaGVscGVyIGZvciBkcm1fc2NoZWRfZW50aXR5X2tpbGxfam9icw0K
Pj4+IC0gKg0KPj4+IC0gKiBAZjogc2lnbmFsZWQgZmVuY2UNCj4+PiAtICogQGNiOiBvdXIgY2Fs
bGJhY2sgc3RydWN0dXJlDQo+Pj4gLSAqDQo+Pj4gLSAqIFNpZ25hbCB0aGUgc2NoZWR1bGVyIGZp
bmlzaGVkIGZlbmNlIHdoZW4gdGhlIGVudGl0eSBpbiBxdWVzdGlvbiBpcyBraWxsZWQuDQo+Pj4g
LSAqLw0KPj4+ICtzdGF0aWMgdm9pZCBkcm1fc2NoZWRfZW50aXR5X2tpbGxfd29yayhzdHJ1Y3Qg
d29ya19zdHJ1Y3QgKndvcmspDQo+Pj4gK3sNCj4+Pj4+ICsJc3RydWN0IGRybV9zY2hlZF9qb2Ig
KmpvYiA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwNCj4+Pj4+ICsJ
CQkJCQnCoGZpbmlzaF93b3JrKTsNCj4+PiArDQo+Pj4+PiArCWRybV9zY2hlZF9mZW5jZV9maW5p
c2hlZChqb2ItPnNfZmVuY2UpOw0KPj4+Pj4gKwlXQVJOX09OKGpvYi0+c19mZW5jZS0+cGFyZW50
KTsNCj4+Pj4+ICsJam9iLT5zY2hlZC0+b3BzLT5mcmVlX2pvYihqb2IpOw0KPj4+ICt9DQo+Pj4g
Kw0KPj4+ICDCoCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfZW50aXR5X2tpbGxfam9ic19jYihzdHJ1
Y3QgZG1hX2ZlbmNlICpmLA0KPj4+Pj4gIMKgwqAJCQkJCcKgwqBzdHJ1Y3QgZG1hX2ZlbmNlX2Ni
ICpjYikNCj4+PiAgwqAgew0KPj4+Pj4gIMKgwqAJc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYiA9
IGNvbnRhaW5lcl9vZihjYiwgc3RydWN0IGRybV9zY2hlZF9qb2IsDQo+Pj4+PiAgwqDCoAkJCQkJ
CcKgZmluaXNoX2NiKTsNCj4+PiAgICANCj4+Pj4+IC0JZHJtX3NjaGVkX2ZlbmNlX2ZpbmlzaGVk
KGpvYi0+c19mZW5jZSk7DQo+Pj4+PiAtCVdBUk5fT04oam9iLT5zX2ZlbmNlLT5wYXJlbnQpOw0K
Pj4+Pj4gLQlqb2ItPnNjaGVkLT5vcHMtPmZyZWVfam9iKGpvYik7DQo+Pj4+PiArCXNjaGVkdWxl
X3dvcmsoJmpvYi0+ZmluaXNoX3dvcmspOw0KPj4+ICDCoCB9DQo+Pj4gICAgDQo+Pj4gIMKgIC8q
Kg0KPj4+IEBAIC0yNDAsNiArMjQwLDEyIEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9lbnRpdHlf
a2lsbF9qb2JzKHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHkpDQo+Pj4+PiAgwqDCoAkJ
ZHJtX3NjaGVkX2ZlbmNlX3NjaGVkdWxlZChzX2ZlbmNlKTsNCj4+Pj4+ICDCoMKgCQlkbWFfZmVu
Y2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgLUVTUkNIKTsNCj4+PiAgICANCj4+Pj4+
ICsJCS8qDQo+Pj4+PiArCQnCoCogUmVwbGFjZSByZWd1bGFyIGZpbmlzaCB3b3JrIGZ1bmN0aW9u
IHdpdGggb25lIHRoYXQganVzdA0KPj4+Pj4gKwkJwqAqIGtpbGxzIHRoZSBqb2IuDQo+Pj4+PiAr
CQnCoCovDQo+Pj4gKwkJam9iLT5maW5pc2hfd29yay5mdW5jID0gZHJtX3NjaGVkX2VudGl0eV9r
aWxsX3dvcms7DQo+Pg0KPj4gSSByZWNoZWNrZWQgdGhlIGxhdGVzdCBjb2RlIGFuZCBmaW5pc2hf
d29yayB3YXMgcmVtb3ZlZCBpbiBmZmFlM2U1DQo+PiAnZHJtL3NjaGVkdWxlcjogcmV3b3JrIGpv
YiBkZXN0cnVjdGlvbicNCj4gQXcsIHRoYW5rcy4gU2VlbXMgdGhpcyBwYXRjaCB3YXMgc3R1Y2sg
Zm9yIGEgYml0IHRvbyBsb25nIGluIG15DQo+IG91dGdvaW5nIHF1ZXVlLiBJJ3ZlIGp1c3QgY2hl
Y2tlZCB0aGUgY29tbWl0IHlvdSBwb2ludGVkIG91dCwgaXQgc2hvdWxkDQo+IGFsc28gZml4IHRo
ZSBpc3N1ZSB0aGF0IHRoaXMgcGF0Y2ggd2FzIHRyeWluZyB0byBmaXguDQoNCg0KTm90IHN1cmUg
YWJvdXQgdGhpcyBhcyB5b3UgcGF0Y2ggb25seSBjb25jZXJucyB1c2UgY2FzZSB3aGVuIGNsZWFu
aW5nIA0KdW5maW5pc2hlZCBqb2IncyBmb3IgZW50aXR5IGJlaW5nIGRlc3Ryb3llZC4NCg0KQW5k
cmV5DQoNCg0KPg0KPiBSZWdhcmRzLA0KPiBMdWNhcw0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
