Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E6EDF7FC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AA96E2BC;
	Mon, 21 Oct 2019 22:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00054.outbound.protection.outlook.com [40.107.0.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608486E0EB;
 Mon, 21 Oct 2019 13:57:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaBcaqO+A2oYzpn9ScBXyNUajmgKvhqgoi1h7zEYdJVhYmdgHMtXoc8eNFiZC5ryG8IuQu4Hw+m2Y7UZTm11LJqCg1aL4reI9W55+22vehy7UmkFi+aabb6a3Wnrq+HspkiktASXsuxcfY1FPRVf+UzOfxE5X1KPPPKTH7Xn2ipGyknmlU4f+4XkWmv2/6zNNQzFCMF4YA4svNRJZjG1/zUYlWort2Ax/khZ+7DrYbKbinqYP84vTDzhl21CdnK2afWAg3m+GfLbWrJS40nizAQlS2e7H9fMuDhW2eMpz7IXfAL6oe4B7lpv/OlcWv0xRWqypA6NoEgm1aOMnXTbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJ5HS6/1AKteyYU6dkUKxQSX0pFeDKdgRsqVjkqi8vs=;
 b=L/24revzDXFLMLm2Nea+DMNN6opde5y3nBkvSXY6SS2WbM6AKQpLZ4uKNLWMZwsyePPOgO0az1pPNoqn9QsV0yTTK3Max+/m7oBt5JXGDJvbmh9wD6X3fh5kG2g5uwKkhcsYd6g9cMZ6Ryv07r76Q4C2VcexAxMXjVDrMk4Fd5QgXQPIEYU4PkxuNabFEtz+5hhpAD3hIR215u5xpAbps3tHonp2r5WUwv7hP1XJA9eGNkAJQjcwFpYXU7A28ceny6UMMColIuhyQmxHMsmudgVqeB491Vu3GMcY1gmPivVd6hYrZCA0E/rUgPOi7HvukPW9Fyfyhb4FpqYa6YlZuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5710.eurprd05.prod.outlook.com (20.178.121.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 21 Oct 2019 13:57:51 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 13:57:51 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Topic: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Index: AQHVg4Sqa7CCxCToXEeTrrYAqVQVhqdc+JgAgAB3OACAARovgIAAficAgAAF3YCAAdJKAIACvAUAgAGLqgA=
Date: Mon, 21 Oct 2019 13:57:51 +0000
Message-ID: <20191021135744.GA25164@mellanox.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <bc954d29-388b-9e29-f960-115ccc6b9fea@gmail.com>
 <20191016160444.GB3430@mellanox.com>
 <2df298e2-ee91-ef40-5da9-2bc1af3a17be@gmail.com>
 <2046e0b4-ba05-0683-5804-e9bbf903658d@amd.com>
 <d6bcbd2a-2519-8945-eaf5-4f4e738c7fa9@amd.com>
 <20191018203608.GA5670@mellanox.com>
 <f7e34d8f-f3b0-b86d-7388-1f791674a4a9@amd.com>
In-Reply-To: <f7e34d8f-f3b0-b86d-7388-1f791674a4a9@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN8PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:408:4c::26) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06136c48-b1d7-4e90-3de2-08d7562ea9de
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR05MB5710:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB5710C7D031CB342A9E2853F0CF690@VI1PR05MB5710.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(199004)(189003)(6436002)(8676002)(229853002)(81166006)(3846002)(86362001)(71200400001)(71190400001)(6116002)(102836004)(81156014)(36756003)(6916009)(2906002)(14454004)(4326008)(6246003)(6506007)(386003)(486006)(478600001)(305945005)(99286004)(14444005)(966005)(186003)(66446008)(64756008)(66946007)(33656002)(66476007)(66556008)(5660300002)(26005)(7416002)(1076003)(6512007)(6306002)(7736002)(54906003)(25786009)(8936002)(76176011)(476003)(66066001)(446003)(256004)(2616005)(11346002)(52116002)(6486002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5710;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PkLcGchfBnEDUoVADx+70rmVErm6z5gkQ6qtdCXwrJlSfI6JtRYkKbMZlLVOtc2LdDxZP8eiTMGSAXz8yy2yYY856aa4KQIHUjkgnptZTa7WC724kcGb5Nlw9K2zkDj7TjmOXgtESy8BzTYDuGTg5H2iavPADwQGKxlHmO4eTzS0bqLr7srt82UqAlekCDd7CR8a8oGKgkchXihqcistEVpKgFf6V0bg+2fIX3yvzOD9Y9KafT9rYtIh678tx1qwdCwJqxs0gdIM/rnN+4OsXURo+sMfJmyfMBjdnlskQOS0cGCypHSMzHz6Ssok98kz6LW1XTgftfJ2IT4fevSzrOqAWnIyk6kQ+Ktz2Wp0y5bxrra5hH3mJu747JE3FuD6LSbSF+1lUaDbdw8CyU8z/Toyn7l979r8NT/VnuWzNMtXLmJpbgn7IILO8mQKvl5e7GemM73VkNYQdUZ2H3TA5S07e+H4eioe5Hgb3ThuL8Y=
x-ms-exchange-transport-forked: True
Content-ID: <65E636A7AEB8FE479F728A3DE81C272C@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06136c48-b1d7-4e90-3de2-08d7562ea9de
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 13:57:51.6382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AXzR5n7/fHElrCJWBk5Da715utsa9B70hDCnOCYctG4SLoIUqR5Hqg97egkiFVMioHBKaowESGz4u2z5q4+zKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5710
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:23:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJ5HS6/1AKteyYU6dkUKxQSX0pFeDKdgRsqVjkqi8vs=;
 b=GJmSYJBUdHTVxhY+WmVlSTWnWlnjMWM5GGbEqg8Re0VBxMnuyKPMhlrByIc6GFsn3q3NJ1Pf/beRm/9g6LG0RIatMCFHHXsK2iVcvyPqTlxxezqcFjofWU7AjlXf6PatYEj/fOoCSm0sniqdO5uLpaZuyVAjNxWSsI0txnsGWiM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, "Yang,
 Philip" <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBPY3QgMjAsIDIwMTkgYXQgMDI6MjE6NDJQTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6DQo+IEFtIDE4LjEwLjE5IHVtIDIyOjM2IHNjaHJpZWIgSmFzb24gR3VudGhvcnBl
Og0KPiA+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDA0OjQ3OjIwUE0gKzAwMDAsIEtvZW5pZywg
Q2hyaXN0aWFuIHdyb3RlOg0KPiA+DQo+ID4+PiBnZXRfdXNlcl9wYWdlcy9obW1fcmFuZ2VfZmF1
bHQoKSBhbmQgaW52YWxpZGF0ZV9yYW5nZV9zdGFydCgpIGJvdGggYXJlDQo+ID4+PiBjYWxsZWQg
d2hpbGUgaG9sZGluZyBtbS0+bWFwX3NlbSwgc28gdGhleSBhcmUgYWx3YXlzIHNlcmlhbGl6ZWQu
DQo+ID4+IE5vdCBldmVuIHJlbW90ZWx5Lg0KPiA+Pg0KPiA+PiBGb3IgY2FsbGluZyBnZXRfdXNl
cl9wYWdlcygpL2htbV9yYW5nZV9mYXVsdCgpIHlvdSBvbmx5IG5lZWQgdG8gaG9sZCB0aGUNCj4g
Pj4gbW1hcF9zZW0gaW4gcmVhZCBtb2RlLg0KPiA+IFJpZ2h0DQo+ID4gICANCj4gPj4gQW5kIElJ
UkMgaW52YWxpZGF0ZV9yYW5nZV9zdGFydCgpIGlzIHNvbWV0aW1lcyBjYWxsZWQgd2l0aG91dCBo
b2xkaW5nDQo+ID4+IHRoZSBtbWFwX3NlbSBhdCBhbGwuDQo+ID4gWWVwDQo+ID4gICANCj4gPj4g
U28gYWdhaW4gaG93IGFyZSB0aGV5IHNlcmlhbGl6ZWQ/DQo+ID4gVGhlICdkcml2ZXIgbG9jaycg
dGhpbmcgZG9lcyBpdCwgcmVhZCB0aGUgaG1tIGRvY3VtZW50YXRpb24sIHRoZSBobW0NCj4gPiBh
cHByb2FjaCBpcyBiYXNpY2FsbHkgdGhlIG9ubHkgYXBwcm9hY2ggdGhhdCB3YXMgY29ycmVjdCBv
ZiBhbGwgdGhlDQo+ID4gZHJpdmVycy4uDQo+IA0KPiBXZWxsIHRoYXQncyB3aGF0IEkndmUgZGlk
LCBidXQgd2hhdCBITU0gZG9lcyBzdGlsbCBkb2Vzbid0IGxvb2tzIGNvcnJlY3QgDQo+IHRvIG1l
Lg0KDQpJdCBoYXMgYSBidWcsIGJ1dCB0aGUgYmFzaWMgZmxvdyBzZWVtcyB0byB3b3JrLg0KDQpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTkxDQoNCj4gPiBTbyBsb25nIGFz
IHRoZSAnZHJpdmVyIGxvY2snIGlzIGhlbGQgdGhlIHJhbmdlIGNhbm5vdCBiZWNvbWUNCj4gPiBp
bnZhbGlkYXRlZCBhcyB0aGUgJ2RyaXZlciBsb2NrJyBwcmV2ZW50cyBwcm9ncmVzcyBvZiBpbnZh
bGlkYXRpb24uDQo+IA0KPiBDb3JyZWN0LCBidXQgdGhlIHByb2JsZW0gaXMgaXQgZG9lc24ndCB3
YWl0IGZvciBvbmdvaW5nIG9wZXJhdGlvbnMgdG8gDQo+IGNvbXBsZXRlLg0KPg0KPiBTZWUgSSdt
IHRhbGtpbmcgYWJvdXQgdGhlIGZvbGxvd2luZyBjYXNlOg0KPiANCj4gVGhyZWFkIEHCoMKgwqAg
VGhyZWFkIEINCj4gaW52YWxpZGF0ZV9yYW5nZV9zdGFydCgpDQo+ICAgICAgICAgICAgICAgICAg
ICAgIG1tdV9yYW5nZV9yZWFkX2JlZ2luKCkNCj4gICAgICAgICAgICAgICAgICAgICAgZ2V0X3Vz
ZXJfcGFnZXMoKS9obW1fcmFuZ2VfZmF1bHQoKQ0KPiAgICAgICAgICAgICAgICAgICAgICBncmFi
X2RyaXZlcl9sb2NrKCkNCj4gVXBkYXRpbmcgdGhlIHB0ZXMNCj4gaW52YWxpZGF0ZV9yYW5nZV9l
bmQoKQ0KPiANCj4gQXMgZmFyIGFzIEkgY2FuIHNlZSBpbiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0
KCkgdGhlIGRyaXZlciBsb2NrIGlzIHRha2VuIA0KPiB0byBtYWtlIHN1cmUgdGhhdCB3ZSBjYW4n
dCBzdGFydCBhbnkgaW52YWxpZGF0aW9uIHdoaWxlIHRoZSBkcml2ZXIgaXMgDQo+IHVzaW5nIHRo
ZSBwYWdlcyBmb3IgYSBjb21tYW5kIHN1Ym1pc3Npb24uDQoNCkFnYWluLCB0aGlzIHVzZXMgdGhl
IHNlcWxvY2sgbGlrZSBzY2hlbWUgKmFuZCogdGhlIGRyaXZlciBsb2NrLg0KDQpJbiB0aGlzIGNh
c2UgYWZ0ZXIgZ3JhYl9kcml2ZXJfbG9jaygpIG1tdV9yYW5nZV9yZWFkX3JldHJ5KCkgd2lsbA0K
cmV0dXJuIGZhbHNlIGlmIFRocmVhZCBBIGhhcyBwcm9ncmVzc2VkIHRvICd1cGRhdGluZyB0aGUg
cHRlcy4NCg0KRm9yIGluc3RhbmNlIGhlcmUgaXMgaG93IHRoZSBjb25jdXJyZW5jeSByZXNvbHZl
cyBmb3IgcmV0cnk6DQoNCiAgICAgICBDUFUxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBDUFUyDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2VxID0gbW11X3Jhbmdl
X3JlYWRfYmVnaW4oKQ0KaW52YWxpZGF0ZV9yYW5nZV9zdGFydCgpDQogIGludmFsaWRhdGVfc2Vx
KysgDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X3VzZXJfcGFnZXMoKS9o
bW1fcmFuZ2VfZmF1bHQoKQ0KICBncmFiX2RyaXZlcl9sb2NrKCkNCiAgdW5ncmFiX2RyaXZlcl9s
b2NrKCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncmFiX2RyaXZlcl9sb2Nr
KCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXEgIT0gaW52YWxpZGF0ZV9z
ZXEsIHNvIHJldHJ5DQoNCiAgVXBkYXRpbmcgdGhlIHB0ZXMNCg0KaW52YWxpZGF0ZV9yYW5nZV9l
bmQoKQ0KICBpbnZhbGlkYXRlX3NlcSsrDQoNCg0KQW5kIGhlcmUgaXMgaG93IGl0IHJlc29sdmVz
IGZvciBibG9ja2luZzoNCg0KICAgICAgIENQVTEgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIENQVTINCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXEgPSBtbXVfcmFu
Z2VfcmVhZF9iZWdpbigpDQppbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBnZXRfdXNlcl9wYWdlcygpL2htbV9yYW5nZV9mYXVsdCgpDQoN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncmFiX2RyaXZlcl9sb2NrKCkNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXEgPT0gaW52YWxpZGF0ZV9zZXEsIHNv
IGNvbml0bnVlDQogIGludmFsaWRhdGVfc2VxKysgDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5ncmFiX2RyaXZlcl9sb2NrKCkNCiAgZ3JhYl9kcml2ZXJfbG9jaygpDQogIC8v
IENhbm5vdCBwcm9ncmVzcyB0byAnVXBkYXRpbmcgdGhlIHB0ZXMnIHdoaWxlIHRoZSBkcml2ZV9s
b2NrIGlzIGhlbGQNCiAgdW5ncmFiX2RyaXZlcl9sb2NrKCkNCiAgVXBkYXRpbmcgdGhlIHB0ZXMN
Cg0KaW52YWxpZGF0ZV9yYW5nZV9lbmQoKQ0KICBpbnZhbGlkYXRlX3NlcSsrDQoNCkZvciB0aGUg
YWJvdmUgSSd2ZSBzaW1wbGlmaWVkIHRoZSBtZWNoYW5pY3Mgb2YgdGhlIGludmFsaWRhdGVfc2Vx
LCB5b3UNCm5lZWQgdG8gbG9vayB0aHJvdWdoIHRoZSBwYXRjaCB0byBzZWUgaG93IGl0IGFjdHVh
bGx5IHdvcmtzLg0KDQo+IFdlbGwgd2UgZG9uJ3QgdXBkYXRlIHRoZSBzZXFsb2NrIGFmdGVyIHRo
ZSB1cGRhdGUgdG8gdGhlIHByb3RlY3RlZCBkYXRhIA0KPiBzdHJ1Y3R1cmUgKHRoZSBwYWdlIHRh
YmxlKSBoYXBwZW5lZCwgYnV0IHJhdGhlciBiZWZvcmUgdGhhdC4NCg0KPz8/IFRoaXMgaXMgd2hh
dCBtbl9pdHJlZV9pbnZfZW5kKCkgZG9lcywgaXQgaXMgY2FsbGVkIGJ5DQppbnZhbGlkYXRlX3Jh
bmdlX2VuZA0KDQo+IFRoYXQgZG9lc24ndCBsb29rcyBsaWtlIHRoZSBub3JtYWwgcGF0dGVyIGZv
ciBhIHNlcWxvY2sgdG8gbWUgYW5kIGFzIGZhciANCj4gYXMgSSBjYW4gc2VlIHRoYXQgaXMgcXVp
dGUgYSBidWcgaW4gdGhlIEhNTSBkZXNpZ24vbG9naWMuDQoNCldlbGwsIGhtbSBoYXMgYSBidWcg
YmVjYXVzZSBpdCBkb2Vzbid0IHVzZSBhIHNlcWxvY2sgcGF0dGVybiwgc2VlIHRoZQ0KYWJvdmUg
VVJMLg0KDQpPbmUgb2YgdGhlIG1vdGl2YXRpb25zIGZvciB0aGlzIHdvcmsgaXMgdG8gc3F1YXNo
IHRoYXQgYnVnIGJ5IGFkZGluZyBhDQpzZXFsb2NrIGxpa2UgcGF0dGVybi4gQnV0IHRoZSBiYXNp
YyBobW0gZmxvdyBhbmQgY29sbGlzaW9uLXJldHJ5DQphcHByb2FjaCBzZWVtcyBzb3VuZC4NCg0K
RG8geW91IHNlZSBhIHByb2JsZW0gd2l0aCB0aGlzIHBhdGNoPw0KDQpKYXNvbg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
