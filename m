Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 465DFEC643
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 16:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F416E24E;
	Fri,  1 Nov 2019 15:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680053.outbound.protection.outlook.com [40.107.68.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06D96E24E;
 Fri,  1 Nov 2019 15:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rb0vaTjrjgp43A1K3TkjU94osaOI2fbMPyv/gVDiR83E+XtBSkwpz5+5dK2AG0RNh7JBYwHqZWEP4u9s7wwwSHGZX0v/w65xUBWZA8nfJLdMD4CZY42gPHLdd5QyfMruhTAHPwMq78DD5tNkVvZKOCT3OlLdlUnOKq1VMxiRLa18sdD03PSIameqK/WR5sg5zH75vkey48xgrrD1FUOb4kc15Qpo8pHBggD+2OsyeRav4aAXviFkj/yrZXEgJ+HPk+Zc5M4Pg2l9jLm+NRUT1VSklq25o8xQQGbUXu4BWI1glwvZO5HlNnunKGFHOKs59GACySgu9w3G2riJKMILvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B70gKRy7javyiS02uROv/RyLGEqbq/siw3rZJOLViU=;
 b=AwHK7/UYginbUL4x0txuclKvMvMXqXNBOiWVhyld45VUVpTAWw8ehyy393Os+LZeZXsFQvDqViCrk0zSsOZn3sXZN53QiqRSpp3YdIqkUmQTXOYlFK9EA/9OJa3i6wJKs2tYkzwX9ZD78vVcoE/JhwVweBYn+6FBQdfduurepDjAXSzXOIwesUrwhRxXZZSqkJBrbM8TBkJMbn28bvoPe9No5hsy1g/6oMfUz1iyoY+WKc/6bxf8ZWYKmBVFkOLKh01IRjX7Cxl4NRata8j4+DcmWmFZI+a6+XhzrcySZohpW7IgxNpBbY72uLs80Av/RRqJ/bss0Xwwm8fU9XIySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB2959.namprd12.prod.outlook.com (20.179.81.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 1 Nov 2019 15:59:27 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2387.027; Fri, 1 Nov 2019
 15:59:27 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Topic: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Index: AQHVjcy5krMagvVO3k2ER8a03a+2l6dyANaAgAAA5gCABGh8AIAAB7mAgAANHgA=
Date: Fri, 1 Nov 2019 15:59:26 +0000
Message-ID: <8280fb65-a897-3d71-79f9-9f80d9e474e9@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
 <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
 <20191101151222.GN22766@mellanox.com>
In-Reply-To: <20191101151222.GN22766@mellanox.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::35) To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c66652d-a310-4869-6dcc-08d75ee4789e
x-ms-traffictypediagnostic: MN2PR12MB2959:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2959AEFA4AFCD810CAD6FAF2E6620@MN2PR12MB2959.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(199004)(189003)(36756003)(256004)(14444005)(5024004)(5660300002)(186003)(476003)(102836004)(14454004)(386003)(2616005)(6436002)(478600001)(52116002)(66476007)(66946007)(64756008)(66556008)(66446008)(6486002)(7736002)(6116002)(305945005)(76176011)(486006)(6506007)(6246003)(26005)(99286004)(66066001)(3846002)(71200400001)(25786009)(8676002)(71190400001)(6916009)(4001150100001)(316002)(81166006)(81156014)(31686004)(8936002)(229853002)(7416002)(86362001)(53546011)(6512007)(11346002)(446003)(2906002)(4326008)(54906003)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2959;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Fd+ZIRFlYHudINQjv2FvowZfkrp/UC4KJ/g1mKxUpCr2aaHHg47rITqylM7RQ8PxGEG8AIl6rus7MGBRS2ZAP+XIQMsH4r7bCbQnifg0Ud8+QJbz5yp/F6a+LveWqATX1PIMrgBw5toqCvauirfcnzFC0id9f6m9VCd/UdYe0g0X2RggKlWMkRgROMYBL7vmZ/00bAbwXFzXh/NAXWIah5G9pGDnKB77lL3/nU1NQF79qejd5Gtuhalz5ReJyAPg919z13BitZ8MHkMixIrXjKbjSrfs/0WWmgltXVPYhhiUVF2sM4zwLw0Iyz+RkYR+1iixjW4+I85KKwe8rUtxq+2Q+dbvHEYk30efUgG7Yqq5fyVx/kzRYoygt5Az6+BPTpTlFPwfu4l7nxcnZ1D6g0pwMBI+SGROmGVst5to4Z7xn8vclH5OFK1g1zoFO2u
Content-ID: <2B29A7595DFC8C4E904872A54BF79A49@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c66652d-a310-4869-6dcc-08d75ee4789e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 15:59:26.8086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YRcD5rCkg9YRWPD2cG2lq3anT/Bpz7B7kUKNijCPZ8WgFl7AmV8bKnq9OD3C7uBU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2959
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B70gKRy7javyiS02uROv/RyLGEqbq/siw3rZJOLViU=;
 b=Xa+dATVHv9YhBVcztkih9Pf0+hZmBnP4hDtTwdryQP/7tnvQKjMpl0cy91VyPoIp/VIBvNYn9SbE+EYoM2ij0RpdC5vAG20EprqhN7nrLnmREwFHsOJmYk7vKT41hAM2Pwm+bIuIdDIrpnrS+Nj0dsqyEQYsW1uydOjCdGdjp9Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMTEtMDEgMTE6MTIgYS5tLiwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPiBP
biBGcmksIE5vdiAwMSwgMjAxOSBhdCAwMjo0NDo1MVBNICswMDAwLCBZYW5nLCBQaGlsaXAgd3Jv
dGU6DQo+Pg0KPj4NCj4+IE9uIDIwMTktMTAtMjkgMzoyNSBwLm0uLCBKYXNvbiBHdW50aG9ycGUg
d3JvdGU6DQo+Pj4gT24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDc6MjI6MzdQTSArMDAwMCwgWWFu
ZywgUGhpbGlwIHdyb3RlOg0KPj4+PiBIaSBKYXNvbiwNCj4+Pj4NCj4+Pj4gSSBkaWQgcXVpY2sg
dGVzdCBhZnRlciBtZXJnaW5nIGFtZC1zdGFnaW5nLWRybS1uZXh0IHdpdGggdGhlDQo+Pj4+IG1t
dV9ub3RpZmllciBicmFuY2gsIHdoaWNoIGluY2x1ZGVzIHRoaXMgc2V0IGNoYW5nZXMuIFRoZSB0
ZXN0IHJlc3VsdA0KPj4+PiBoYXMgZGlmZmVyZW50IGZhaWx1cmVzLCBhcHAgc3R1Y2sgaW50ZXJt
aXR0ZW50bHksIEdVSSBubyBkaXNwbGF5IGV0Yy4gSQ0KPj4+PiBhbSB1bmRlcnN0YW5kaW5nIHRo
ZSBjaGFuZ2VzIGFuZCB3aWxsIHRyeSB0byBmaWd1cmUgb3V0IHRoZSBjYXVzZS4NCj4+Pg0KPj4+
IFRoYW5rcyEgSSdtIG5vdCBzdXJwcmlzZWQgYnkgdGhpcyBnaXZlbiBob3cgZGlmZmljdWx0IHRo
aXMgcGF0Y2ggd2FzDQo+Pj4gdG8gbWFrZS4gTGV0IG1lIGtub3cgaWYgSSBjYW4gYXNzaXN0IGlu
IGFueSB3YXkNCj4+Pg0KPj4+IFBsZWFzZSBlbnN1cmUgdG8gcnVuIHdpdGggbG9ja2RlcCBlbmFi
bGVkLi4gWW91ciBzeW1wdG9wcyBzb3VuZHMgc29ydA0KPj4+IG9mIGxpa2UgZGVhZGxvY2tpbmc/
DQo+Pj4NCj4+IEhpIEphc29uLA0KPj4NCj4+IEF0dGFjaGVkIHBhdGNoIGZpeCBzZXZlcmFsIGlz
c3VlcyBpbiBhbWRncHUgZHJpdmVyLCBtYXliZSB5b3UgY2FuIHNxdWFzaA0KPj4gdGhpcyBpbnRv
IHBhdGNoIDE0LiBXaXRoIHRoaXMgaXMgZG9uZSwgcGF0Y2ggMTIsIDEzLCAxNCBpcyBSZXZpZXdl
ZC1ieQ0KPj4gYW5kIFRlc3RlZC1ieSBQaGlsaXAgWWFuZyA8cGhpbGlwLnlhbmdAYW1kLmNvbT4N
Cj4gDQo+IFdvdywgdGhpcyBpcyBncmVhdCB0aGFua3MhIENhbiB5b3UgY2xhcmlmeSB3aGF0IHRo
ZSBwcm9ibGVtcyB5b3UgZm91bmQNCj4gd2VyZT8gV2FzIHRoZSBidWcgdGhlICdyZXR1cm4gIXIn
IGJlbG93Pw0KPiANClllcy4gcmV0dXJuICFyIGlzIGNyaXRpY2FsIG9uZSwgYW5kIHJldHJ5IGlm
IGhtbV9yYW5nZV9mYXVsdCByZXR1cm4gDQotRUJVU1kgaXMgbmVlZGVkIHRvby4NCg0KPiBJJ2xs
IGFsc28gYWRkIHlvdXIgc2lnbmVkIG9mZiBieQ0KPiANCj4gSGVyZSBhcmUgc29tZSByZW1hcmtz
Og0KPiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
bW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jDQo+PiBpbmRleCBj
YjcxOGEwNjRlYjQuLmM4YmJkMDZmMTAwOSAxMDA2NDQNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jDQo+PiBAQCAtNjcsMjEgKzY3LDE1IEBAIHN0YXRpYyBi
b29sIGFtZGdwdV9tbl9pbnZhbGlkYXRlX2dmeChzdHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyICpt
cm4sDQo+PiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihi
by0+dGJvLmJkZXYpOw0KPj4gICAJbG9uZyByOw0KPj4gICANCj4+IC0JLyoNCj4+IC0JICogRklY
TUU6IE11c3QgaG9sZCBzb21lIGxvY2sgc2hhcmVkIHdpdGgNCj4+IC0JICogYW1kZ3B1X3R0bV90
dF9nZXRfdXNlcl9wYWdlc19kb25lKCkNCj4+IC0JICovDQo+PiAtCW1tdV9yYW5nZV9zZXRfc2Vx
KG1ybiwgY3VyX3NlcSk7DQo+PiArCW11dGV4X2xvY2soJmFkZXYtPm5vdGlmaWVyX2xvY2spOw0K
Pj4gICANCj4+IC0JLyogRklYTUU6IElzIHRoaXMgbmVjZXNzYXJ5PyAqLw0KPj4gLQlpZiAoIWFt
ZGdwdV90dG1fdHRfYWZmZWN0X3VzZXJwdHIoYm8tPnRiby50dG0sIHJhbmdlLT5zdGFydCwNCj4+
IC0JCQkJCSAgcmFuZ2UtPmVuZCkpDQo+PiAtCQlyZXR1cm4gdHJ1ZTsNCj4+ICsJbW11X3Jhbmdl
X3NldF9zZXEobXJuLCBjdXJfc2VxKTsNCj4+ICAgDQo+PiAtCWlmICghbW11X25vdGlmaWVyX3Jh
bmdlX2Jsb2NrYWJsZShyYW5nZSkpDQo+PiArCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2Nr
YWJsZShyYW5nZSkpIHsNCj4+ICsJCW11dGV4X3VubG9jaygmYWRldi0+bm90aWZpZXJfbG9jayk7
DQo+PiAgIAkJcmV0dXJuIGZhbHNlOw0KPiANCj4gVGhpcyB0ZXN0IGZvciByYW5nZV9ibG9ja2Fi
bGUgc2hvdWxkIGJlIGJlZm9yZSBtdXRleF9sb2NrLCBJIGNhbiBtb3ZlDQo+IGl0IHVwDQo+IA0K
eWVzLCB0aGFua3MuDQo+IEFsc28sIGRvIHlvdSBrbm93IGlmIG5vdGlmaWVyX2xvY2sgaXMgaGVs
ZCB3aGlsZSBjYWxsaW5nDQo+IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZSgpPyBD
YW4gd2UgYWRkIGEgJ2xvY2sgYXNzZXJ0IGhlbGQnDQo+IHRvIGFtZGdwdV90dG1fdHRfZ2V0X3Vz
ZXJfcGFnZXNfZG9uZSgpPw0KPiANCmdwdSBzaWRlIGhvbGQgbm90aWZpZXJfbG9jayBidXQga2Zk
IHNpZGUgZG9lc24ndC4ga2ZkIHNpZGUgZG9lc24ndCBjaGVjayANCmFtZGdwdV90dG1fdHRfZ2V0
X3VzZXJfcGFnZXNfZG9uZS9tbXVfcmFuZ2VfcmVhZF9yZXRyeSByZXR1cm4gdmFsdWUgYnV0IA0K
Y2hlY2sgbWVtLT5pbnZhbGlkIGZsYWcgd2hpY2ggaXMgdXBkYXRlZCBmcm9tIGludmFsaWRhdGUg
Y2FsbGJhY2suIEl0IA0KdGFrZXMgbW9yZSB0aW1lIHRvIGNoYW5nZSwgSSB3aWxsIGNvbWUgdG8g
YW5vdGhlciBwYXRjaCB0byBmaXggaXQgbGF0ZXIuDQoNCj4+IEBAIC04NTQsMTIgKzg1MywyMCBA
QCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywg
c3RydWN0IHBhZ2UgKipwYWdlcykNCj4+ICAgCQlyID0gLUVQRVJNOw0KPj4gICAJCWdvdG8gb3V0
X3VubG9jazsNCj4+ICAgCX0NCj4+ICsJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsNCj4+ICsJdGlt
ZW91dCA9IGppZmZpZXMgKyBtc2Vjc190b19qaWZmaWVzKEhNTV9SQU5HRV9ERUZBVUxUX1RJTUVP
VVQpOw0KPj4gKw0KPj4gK3JldHJ5Og0KPj4gKwlyYW5nZS0+bm90aWZpZXJfc2VxID0gbW11X3Jh
bmdlX3JlYWRfYmVnaW4oJmJvLT5ub3RpZmllcik7DQo+PiAgIA0KPj4gKwlkb3duX3JlYWQoJm1t
LT5tbWFwX3NlbSk7DQo+PiAgIAlyID0gaG1tX3JhbmdlX2ZhdWx0KHJhbmdlLCAwKTsNCj4+ICAg
CXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7DQo+PiAtDQo+PiAtCWlmICh1bmxpa2VseShyIDwgMCkp
DQo+PiArCWlmICh1bmxpa2VseShyIDw9IDApKSB7DQo+PiArCQlpZiAoKHIgPT0gMCB8fCByID09
IC1FQlVTWSkgJiYgIXRpbWVfYWZ0ZXIoamlmZmllcywgdGltZW91dCkpDQo+PiArCQkJZ290byBy
ZXRyeTsNCj4+ICAgCQlnb3RvIG91dF9mcmVlX3BmbnM7DQo+PiArCX0NCj4gDQo+IFRoaXMgaXNu
J3QgcmVhbGx5IHJpZ2h0LCBhIHJldHJ5IGxvb3AgbGlrZSB0aGlzIG5lZWRzIHRvIGdvIGFsbCB0
aGUNCj4gd2F5IHRvIG1tdV9yYW5nZV9yZWFkX3JldHJ5KCkgYW5kIGRvbmUgdW5kZXIgdGhlIG5v
dGlmaWVyX2xvY2suIGllDQo+IG1tdV9yYW5nZV9yZWFkX3JldHJ5KCkgY2FuIGZhaWwganVzdCBh
cyBsaWtlbHkgYXMgaG1tX3JhbmdlX2ZhdWx0KCkNCj4gY2FuLCBhbmQgZHJpdmVycyBhcmUgc3Vw
cG9zZWQgdG8gcmV0cnkgaW4gYm90aCBjYXNlcywgd2l0aCBhIHNpbmdsZQ0KPiB0aW1lb3V0Lg0K
PiANCkZvciBncHUsIGNoZWNrIG1tdV9yYW5nZV9yZWFkX3JldHJ5IHJldHVybiB2YWx1ZSB1bmRl
ciB0aGUgbm90aWZpZXJfbG9jayANCnRvIGRvIHJldHJ5IGlzIGluIHNlcGVyYXRlIGxvY2F0aW9u
LCBub3QgaW4gc2FtZSByZXRyeSBsb29wLg0KDQo+IEFGQUlDVCBpdCBpcyBhIG1ham9yIGJ1ZyB0
aGF0IG1hbnkgcGxhY2VzIGlnbm9yZSB0aGUgcmV0dXJuIGNvZGUgb2YNCj4gYW1kZ3B1X3R0bV90
dF9nZXRfdXNlcl9wYWdlc19kb25lKCkgPz8/DQo+DQpGb3Iga2ZkLCBleHBsYWluZWQgYWJvdmUu
DQoNCj4gSG93ZXZlciwgdGhpcyBpcyBhbGwgcHJlLWV4aXN0aW5nIGJ1Z3MsIHNvIEknbSBPSyBn
byBhaGVhZCB3aXRoIHRoaXMNCj4gcGF0Y2ggYXMgbW9kaWZpZWQuIEkgYWR2aXNlIEFNRCB0byBt
YWtlIGEgZm9sbG93dXAgcGF0Y2ggLi4NCj4gDQp5ZXMsIEkgd2lsbC4NCj4gSSdsbCBhZGQgYSBG
SVhNRSBub3RlIHRvIHRoaXMgZWZmZWN0Lg0KPiANCj4+ICAgCWZvciAoaSA9IDA7IGkgPCB0dG0t
Pm51bV9wYWdlczsgaSsrKSB7DQo+PiAgIAkJcGFnZXNbaV0gPSBobW1fZGV2aWNlX2VudHJ5X3Rv
X3BhZ2UocmFuZ2UsIHJhbmdlLT5wZm5zW2ldKTsNCj4+IEBAIC05MTYsNyArOTIzLDcgQEAgYm9v
bCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUoc3RydWN0IHR0bV90dCAqdHRtKQ0K
Pj4gICAJCWd0dC0+cmFuZ2UgPSBOVUxMOw0KPj4gICAJfQ0KPj4gICANCj4+IC0JcmV0dXJuIHI7
DQo+PiArCXJldHVybiAhcjsNCj4gDQo+IEFoIGlzIHRoaXMgdGhlIG1ham9yIGVycm9yPyBobW1f
cmFuZ2VfdmFsaWQoKSBpcyBpbnZlcnRlZCB2cw0KPiBtbXVfcmFuZ2VfcmVhZF9yZXRyeSgpPw0K
PiANCnllcy4NCj4+ICAgfQ0KPj4gICAjZW5kaWYNCj4+ICAgDQo+PiBAQCAtOTk3LDEwICsxMDA0
LDE4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV90dG1fdHRfdW5waW5fdXNlcnB0cihzdHJ1Y3QgdHRt
X3R0ICp0dG0pDQo+PiAgIAlzZ19mcmVlX3RhYmxlKHR0bS0+c2cpOw0KPj4gICANCj4+ICAgI2lm
IElTX0VOQUJMRUQoQ09ORklHX0RSTV9BTURHUFVfVVNFUlBUUikNCj4+IC0JaWYgKGd0dC0+cmFu
Z2UgJiYNCj4+IC0JICAgIHR0bS0+cGFnZXNbMF0gPT0gaG1tX2RldmljZV9lbnRyeV90b19wYWdl
KGd0dC0+cmFuZ2UsDQo+PiAtCQkJCQkJICAgICAgZ3R0LT5yYW5nZS0+cGZuc1swXSkpDQo+PiAt
CQlXQVJOX09OQ0UoMSwgIk1pc3NpbmcgZ2V0X3VzZXJfcGFnZV9kb25lXG4iKTsNCj4+ICsJaWYg
KGd0dC0+cmFuZ2UpIHsNCj4+ICsJCXVuc2lnbmVkIGxvbmcgaTsNCj4+ICsNCj4+ICsJCWZvciAo
aSA9IDA7IGkgPCB0dG0tPm51bV9wYWdlczsgaSsrKSB7DQo+PiArCQkJaWYgKHR0bS0+cGFnZXNb
aV0gIT0NCj4+ICsJCQkJaG1tX2RldmljZV9lbnRyeV90b19wYWdlKGd0dC0+cmFuZ2UsDQo+PiAr
CQkJCQkgICAgICBndHQtPnJhbmdlLT5wZm5zW2ldKSkNCj4+ICsJCQkJYnJlYWs7DQo+PiArCQl9
DQo+PiArDQo+PiArCQlXQVJOKChpID09IHR0bS0+bnVtX3BhZ2VzKSwgIk1pc3NpbmcgZ2V0X3Vz
ZXJfcGFnZV9kb25lXG4iKTsNCj4+ICsJfQ0KPiANCj4gSXMgdGhpcyByZWxhdGVkL25lY2Vzc2Fy
eT8gSSBjYW4gcHV0IGl0IGluIGFub3RoZXIgcGF0Y2ggaWYgaXQgaXMganVzdA0KPiBkZWJ1Z2dp
bmcgaW1wcm92ZW1lbnQ/IFBsZWFzZSBhZHZpc2UNCj4gDQpJIHNlZSB0aGlzIFdBUk4gYmFja3Ry
YWNlIG5vdywgYnV0IEkgZGlkbid0IHNlZSBpdCBiZWZvcmUuIFRoaXMgaXMgDQpzb21laG93IHJl
bGF0ZWQuDQoNCj4gVGhhbmtzIGEgbG90LA0KPiBKYXNvbg0KPiANCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
