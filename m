Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE09DEF78
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33906E10E;
	Mon, 21 Oct 2019 14:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750042.outbound.protection.outlook.com [40.107.75.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ED86E10C;
 Mon, 21 Oct 2019 14:28:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiVENu5JQqnl831Msrz3rk899+OHLTCSXqKA3FBXIQINSQgVlipE4r3rYyqXuQh5Kr/fUmlvBZWfETqEoZRF7e/EQHGIusYR98MTNKrGiZraGgXt9rwbClkuJ5ASh4u9pOkqJFmnQgCOx3sSkU2/NIr4CaVm99iwRPf/dZGj4yyobO2sH1jaDzZSHn2p4VI5I/qdU6EUu2+ToK9b6RrfTeU/nl39UPOzoo4zZZC1AZG0ucegS6lzEgJb3czS5TwC+07e8o8ULyVJodHzy9bUN/8SUxonsFh1QkKDqSzts22/Fv5FS6BnV8d5LOKk7jfR/Nflj5IWR1O4wBOv6Khwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMLHktLYbgfSy3Wsl/Px3Esub9Xq8ALLCSjiNkUuWuw=;
 b=C3rewGuupiskCOnJHIiUepFMveoV4DWMdro50BObxMZx7qahLX7Jq0gO45CfHiGbRaLRzzDgEsHWLf63+ZPIgq7gqVlAezPd5naoD2iCQu6mZPyLtP0IjYjMjEqFg1IhZ8cCyDxX9wXwG19dFNB5+WLfmxUlvY0IxVSX3D52sCuM/pVLbWY/DkK1/MsiC5YKSzwWcS9mYeWJxigd2kCDYLt5Ex6ZKa4yGUmGI4umV/rLA+XUPjg03MPka5NJ9iH0TNTHRu+wxZJ6OqOMmLoyBbF1r00kyGPLQeXZk0I7ToRRsNzsIYWsycDxE+j5cT3ed5KwEUFZJrvvUbALutdz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1531.namprd12.prod.outlook.com (10.172.39.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 21 Oct 2019 14:28:47 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.028; Mon, 21 Oct
 2019 14:28:47 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Topic: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Index: AQHVg4Sqa7CCxCToXEeTrrYAqVQVhqdc+JgAgAB3OACAARovgIAAficAgAAF3YCAAdJKAIACvAUAgAGLqgCAAAilAA==
Date: Mon, 21 Oct 2019 14:28:46 +0000
Message-ID: <e07092c3-8ccd-9814-835c-6c462017aff8@amd.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <bc954d29-388b-9e29-f960-115ccc6b9fea@gmail.com>
 <20191016160444.GB3430@mellanox.com>
 <2df298e2-ee91-ef40-5da9-2bc1af3a17be@gmail.com>
 <2046e0b4-ba05-0683-5804-e9bbf903658d@amd.com>
 <d6bcbd2a-2519-8945-eaf5-4f4e738c7fa9@amd.com>
 <20191018203608.GA5670@mellanox.com>
 <f7e34d8f-f3b0-b86d-7388-1f791674a4a9@amd.com>
 <20191021135744.GA25164@mellanox.com>
In-Reply-To: <20191021135744.GA25164@mellanox.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR06CA0042.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::19) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fba8548-85e2-4d5b-bc6a-08d75632fbb8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1531:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1531CAB76636C456046A1BAB83690@DM5PR12MB1531.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(189003)(199004)(86362001)(6246003)(8676002)(81156014)(71200400001)(81166006)(316002)(71190400001)(6116002)(14444005)(256004)(31686004)(6486002)(6436002)(31696002)(7416002)(58126008)(476003)(11346002)(2616005)(446003)(36756003)(486006)(99286004)(8936002)(6916009)(46003)(52116002)(4326008)(76176011)(6506007)(386003)(5660300002)(102836004)(186003)(305945005)(7736002)(14454004)(6512007)(6306002)(54906003)(66446008)(64756008)(66556008)(66476007)(66946007)(229853002)(2906002)(65956001)(65806001)(25786009)(66574012)(478600001)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1531;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lQmu9AkixQOuCF153Irqww/BQdl7v3uHGewglnLRaDLK8MVRGQ/IlAfuffmLucTMa9YnN8fzY/kbkFHMUTW9Sp24zUIUqtfXtCU6D55v4UPgxicp5jIRTW1lMfxe4FGyIrlsB2MPDvfESihqQEKqw1dkrR8MggWxx3OyQZvyXfhwgQ/SHI1bAPdwj22eaikYYsDPbZ6MXOOtJHFiDDsATHJWdf8H32dls3ShWorJEWlJheQR8eK0qmrSUzvKkpX/lDZBxYvn90mJ3rOQn4tuFm/f0rdIUKjAl16fw7yznttDZXPmya/RuPwyW2avJjRkCWISKIp8XvycozRFim2osbLCVr/dipnNU3JlsDNm7jFUllZ5l6w66IjSO6ny5fgbhRbv/9b9bygHOlDYqUrnbZ1Gu6SqBIz74y+17uIUthvwMh5JYGFY9sKA/WbtqzR9xlR1pUWXtafZbEbcTDYkG9y/HnqsyGr7wj66/XSTSac=
Content-ID: <C8AB85CE73410E46A13A7818A70C6315@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fba8548-85e2-4d5b-bc6a-08d75632fbb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 14:28:46.9885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tHiFD0dUSOMiZV7q/wDXDS8T9zTNUpZEoUmGNLM10joS4yfI03GZNNorA19fyB4v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1531
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMLHktLYbgfSy3Wsl/Px3Esub9Xq8ALLCSjiNkUuWuw=;
 b=qI4NppyRhgeGwOejRI+XMkPVd+O0eZ+iEqDe5oYe7DskckImZSImIGvwdaZW2A6zJ7P3gZLiqkSkdaZX4/VtAxQ97NuQcPd5rGnq7fNEjLgCsOfsmmgpKHCAXqOFlG3Qi4v15x7dctwTumDKT2SPDaxATAMIYDwJYgwi8mpM3pY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

QW0gMjEuMTAuMTkgdW0gMTU6NTcgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6DQo+IE9uIFN1biwg
T2N0IDIwLCAyMDE5IGF0IDAyOjIxOjQyUE0gKzAwMDAsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3Rl
Og0KPj4gQW0gMTguMTAuMTkgdW0gMjI6MzYgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6DQo+Pj4g
T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDQ6NDc6MjBQTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6DQo+Pj4gW1NOSVBdDQo+Pj4gICAgDQo+Pj4+IFNvIGFnYWluIGhvdyBhcmUgdGhl
eSBzZXJpYWxpemVkPw0KPj4+IFRoZSAnZHJpdmVyIGxvY2snIHRoaW5nIGRvZXMgaXQsIHJlYWQg
dGhlIGhtbSBkb2N1bWVudGF0aW9uLCB0aGUgaG1tDQo+Pj4gYXBwcm9hY2ggaXMgYmFzaWNhbGx5
IHRoZSBvbmx5IGFwcHJvYWNoIHRoYXQgd2FzIGNvcnJlY3Qgb2YgYWxsIHRoZQ0KPj4+IGRyaXZl
cnMuLg0KPj4gV2VsbCB0aGF0J3Mgd2hhdCBJJ3ZlIGRpZCwgYnV0IHdoYXQgSE1NIGRvZXMgc3Rp
bGwgZG9lc24ndCBsb29rcyBjb3JyZWN0DQo+PiB0byBtZS4NCj4gSXQgaGFzIGEgYnVnLCBidXQg
dGhlIGJhc2ljIGZsb3cgc2VlbXMgdG8gd29yay4NCj4NCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMTE5MQ0KDQpNYXliZSB3cm9uZyBsaW5rPyBUaGF0IGxpbmsgbG9va3Mg
bGlrZSBhbiB1bnJlbGF0ZWQgZGlzY3Vzc2lvbiBvbiBrZXJuZWwgDQppbWFnZSByZWxvY2F0aW9u
Lg0KDQo+Pj4gU28gbG9uZyBhcyB0aGUgJ2RyaXZlciBsb2NrJyBpcyBoZWxkIHRoZSByYW5nZSBj
YW5ub3QgYmVjb21lDQo+Pj4gaW52YWxpZGF0ZWQgYXMgdGhlICdkcml2ZXIgbG9jaycgcHJldmVu
dHMgcHJvZ3Jlc3Mgb2YgaW52YWxpZGF0aW9uLg0KPj4gQ29ycmVjdCwgYnV0IHRoZSBwcm9ibGVt
IGlzIGl0IGRvZXNuJ3Qgd2FpdCBmb3Igb25nb2luZyBvcGVyYXRpb25zIHRvDQo+PiBjb21wbGV0
ZS4NCj4+DQo+PiBTZWUgSSdtIHRhbGtpbmcgYWJvdXQgdGhlIGZvbGxvd2luZyBjYXNlOg0KPj4N
Cj4+IFRocmVhZCBBwqDCoMKgIFRocmVhZCBCDQo+PiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkN
Cj4+ICAgICAgICAgICAgICAgICAgICAgICBtbXVfcmFuZ2VfcmVhZF9iZWdpbigpDQo+PiAgICAg
ICAgICAgICAgICAgICAgICAgZ2V0X3VzZXJfcGFnZXMoKS9obW1fcmFuZ2VfZmF1bHQoKQ0KPj4g
ICAgICAgICAgICAgICAgICAgICAgIGdyYWJfZHJpdmVyX2xvY2soKQ0KPj4gVXBkYXRpbmcgdGhl
IHB0ZXMNCj4+IGludmFsaWRhdGVfcmFuZ2VfZW5kKCkNCj4+DQo+PiBBcyBmYXIgYXMgSSBjYW4g
c2VlIGluIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKSB0aGUgZHJpdmVyIGxvY2sgaXMgdGFrZW4N
Cj4+IHRvIG1ha2Ugc3VyZSB0aGF0IHdlIGNhbid0IHN0YXJ0IGFueSBpbnZhbGlkYXRpb24gd2hp
bGUgdGhlIGRyaXZlciBpcw0KPj4gdXNpbmcgdGhlIHBhZ2VzIGZvciBhIGNvbW1hbmQgc3VibWlz
c2lvbi4NCj4gQWdhaW4sIHRoaXMgdXNlcyB0aGUgc2VxbG9jayBsaWtlIHNjaGVtZSAqYW5kKiB0
aGUgZHJpdmVyIGxvY2suDQo+DQo+IEluIHRoaXMgY2FzZSBhZnRlciBncmFiX2RyaXZlcl9sb2Nr
KCkgbW11X3JhbmdlX3JlYWRfcmV0cnkoKSB3aWxsDQo+IHJldHVybiBmYWxzZSBpZiBUaHJlYWQg
QSBoYXMgcHJvZ3Jlc3NlZCB0byAndXBkYXRpbmcgdGhlIHB0ZXMuDQo+DQo+IEZvciBpbnN0YW5j
ZSBoZXJlIGlzIGhvdyB0aGUgY29uY3VycmVuY3kgcmVzb2x2ZXMgZm9yIHJldHJ5Og0KPg0KPiAg
ICAgICAgIENQVTEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVTINCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXEgPSBtbXVfcmFuZ2VfcmVhZF9iZWdpbigp
DQo+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKQ0KPiAgICBpbnZhbGlkYXRlX3NlcSsrDQoNCkhv
dyB0aGF0IHdhcyBvcmRlciB3YXMgd2hhdCBjb25mdXNpbmcgbWUuIEJ1dCBJJ3ZlIHJlYWQgdXAg
b24gdGhlIGNvZGUgDQppbiBtbXVfcmFuZ2VfcmVhZF9iZWdpbigpIGFuZCBmb3VuZCB0aGUgbGlu
ZXMgSSB3YXMgbG9va2luZyBmb3I6DQoNCivCoMKgwqAgaWYgKGlzX2ludmFsaWRhdGluZykNCivC
oMKgwqAgwqDCoMKgIHdhaXRfZXZlbnQobW1uX21tLT53cSwNCivCoMKgwqAgwqDCoMKgIMKgwqDC
oCDCoMKgIFJFQURfT05DRShtbW5fbW0tPmludmFsaWRhdGVfc2VxKSAhPSBzZXEpOw0KDQpbU05J
UF0NCg0KPiBGb3IgdGhlIGFib3ZlIEkndmUgc2ltcGxpZmllZCB0aGUgbWVjaGFuaWNzIG9mIHRo
ZSBpbnZhbGlkYXRlX3NlcSwgeW91DQo+IG5lZWQgdG8gbG9vayB0aHJvdWdoIHRoZSBwYXRjaCB0
byBzZWUgaG93IGl0IGFjdHVhbGx5IHdvcmtzLg0KDQpZZWEsIHRoYXQgeW91IGFsc28gYWxsb3cg
bXVsdGlwbGUgd3JpdGUgc2lkZXMgaXMgcHJldHR5IG5lYXQuDQoNCj4+IFdlbGwgd2UgZG9uJ3Qg
dXBkYXRlIHRoZSBzZXFsb2NrIGFmdGVyIHRoZSB1cGRhdGUgdG8gdGhlIHByb3RlY3RlZCBkYXRh
DQo+PiBzdHJ1Y3R1cmUgKHRoZSBwYWdlIHRhYmxlKSBoYXBwZW5lZCwgYnV0IHJhdGhlciBiZWZv
cmUgdGhhdC4NCj4gPz8/IFRoaXMgaXMgd2hhdCBtbl9pdHJlZV9pbnZfZW5kKCkgZG9lcywgaXQg
aXMgY2FsbGVkIGJ5DQo+IGludmFsaWRhdGVfcmFuZ2VfZW5kDQo+DQo+PiBUaGF0IGRvZXNuJ3Qg
bG9va3MgbGlrZSB0aGUgbm9ybWFsIHBhdHRlciBmb3IgYSBzZXFsb2NrIHRvIG1lIGFuZCBhcyBm
YXINCj4+IGFzIEkgY2FuIHNlZSB0aGF0IGlzIHF1aXRlIGEgYnVnIGluIHRoZSBITU0gZGVzaWdu
L2xvZ2ljLg0KPiBXZWxsLCBobW0gaGFzIGEgYnVnIGJlY2F1c2UgaXQgZG9lc24ndCB1c2UgYSBz
ZXFsb2NrIHBhdHRlcm4sIHNlZSB0aGUNCj4gYWJvdmUgVVJMLg0KPg0KPiBPbmUgb2YgdGhlIG1v
dGl2YXRpb25zIGZvciB0aGlzIHdvcmsgaXMgdG8gc3F1YXNoIHRoYXQgYnVnIGJ5IGFkZGluZyBh
DQo+IHNlcWxvY2sgbGlrZSBwYXR0ZXJuLiBCdXQgdGhlIGJhc2ljIGhtbSBmbG93IGFuZCBjb2xs
aXNpb24tcmV0cnkNCj4gYXBwcm9hY2ggc2VlbXMgc291bmQuDQo+DQo+IERvIHlvdSBzZWUgYSBw
cm9ibGVtIHdpdGggdGhpcyBwYXRjaD8NCg0KTm8sIG5vdCBhbnkgbW9yZS4NCg0KRXNzZW50aWFs
bHkgeW91IGFyZSBkb2luZyB0aGUgc2FtZSB0aGluZyBJJ3ZlIHRyaWVkIHRvIGRvIHdpdGggdGhl
IA0Kb3JpZ2luYWwgYW1kZ3B1IGltcGxlbWVudGF0aW9uLiBUaGUgZGlmZmVyZW5jZSBpcyB0aGF0
IHlvdSBkb24ndCB0cnkgdG8gDQp1c2UgYSBwZXIgcmFuZ2Ugc2VxdWVuY2UgKHdoaWNoIGlzIGEg
Z29vZCBpZGVhLCB3ZSBuZXZlciBnb3QgdGhhdCBmdWxseSANCndvcmtpbmcpIGFuZCB5b3UgYWxs
b3cgbXVsdGlwbGUgd3JpdGVycyBhdCB0aGUgc2FtZSB0aW1lLg0KDQpGZWVsIGZyZWUgdG8gc3Rp
dGNoIGFuIEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIA0KPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4gb24gcGF0Y2ggIzIsIGJ1dCB5b3Ugc3RpbGwgZG9pbmcgYSBidW5jaCBvZiANCnRoaW5n
cyBpbiB0aGVyZSB3aGljaCBhcmUgd2F5IGJleW9uZCBteSB1bmRlcnN0YW5kaW5nIChlLmcuIHdo
ZXJlIGFyZSANCmFsbCB0aGUgU01QIGJhcnJpZXJzPykuDQoNCkNoZWVycywNCkNocmlzdGlhbi4N
Cg0KPg0KPiBKYXNvbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
