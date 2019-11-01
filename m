Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA12ECBAE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933496F88C;
	Fri,  1 Nov 2019 22:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50060.outbound.protection.outlook.com [40.107.5.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8D36E22F;
 Fri,  1 Nov 2019 15:12:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgdC4d24Rdtu00wf76tr/TjDTx2aWKmDIzVNYGp5ljjpdhopFRK9GZbf0JfB5tok5L9rh3aoQI4VRmjBQVigpNBNc97tFv5QhSx3mAOWZr6brmy+Mndg0n09rRgcOpr4ihHtxRUl3hkfekp+e25Z1ioiBmjA4chhX8r03Xrmwz+DzI0z7f+cJVl3cya4U++b+PhuzmiOe6b0UR5doPtLZClyz0D249PtqnrlY+6cmRWtn1DfU0VAGK6W8oPa4fYhbymrzc/LVDrlagpcDWZBPmp//XmMICAy1zCcjKEKzogs4Rl4JBDBBw58bXO7okn5aJn1QoZm+zGqI9poxxaP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBkO4Aj0byn7s6Bm0dFVLfpXWPn4l83nSzrjzVuIjYM=;
 b=cVHZJRIGZr9UlfgrqZBAOZlvrPTJSuatYApR3bYE2bRumC3sUFFk7Y2L7FMkZQf6oW8ozX0LUTqxknMoW00QMlPh+25T8tVL4e2BtCTaDthLsy6lR+N0ex9Vp6Y/MO7fazndK7grryy59ECQU8vALxxwmFsshkspOufk4Dv3Im1H7tkAy/q/HowhDTMwVmEVQWWK+m2mlNx7l78x34iU7QmdGjyIB97vJL01uczSDTGu3MHn2UzsABL0qb+CoPYhxl97jAOY6S5QjLhYSoNHEAEaMU5UwoCfH649qi2QAm+onspqx4z2E9sxvGv4nPb1JOSwM6fg5LgHWLsPNCMdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6272.eurprd05.prod.outlook.com (20.177.52.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Fri, 1 Nov 2019 15:12:27 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2387.028; Fri, 1 Nov 2019
 15:12:27 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Yang, Philip" <Philip.Yang@amd.com>
Subject: Re: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Topic: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Index: AQHVjcvOUfhzqykxXkO0v7SQaQq3BKdyANqAgAAA3wCABGiEgIAAB7AA
Date: Fri, 1 Nov 2019 15:12:27 +0000
Message-ID: <20191101151222.GN22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
 <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
In-Reply-To: <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR22CA0046.namprd22.prod.outlook.com
 (2603:10b6:404:37::32) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2778cc13-f4ca-4bcf-a336-08d75edde7fe
x-ms-traffictypediagnostic: VI1PR05MB6272:
x-microsoft-antispam-prvs: <VI1PR05MB6272CE1186E06EA63BEAFCCECF620@VI1PR05MB6272.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(199004)(189003)(71200400001)(3846002)(71190400001)(229853002)(7416002)(6436002)(36756003)(8936002)(4326008)(6916009)(6246003)(81166006)(4001150100001)(81156014)(256004)(6486002)(14444005)(6512007)(305945005)(316002)(8676002)(5024004)(54906003)(7736002)(1076003)(11346002)(476003)(2616005)(52116002)(33656002)(446003)(25786009)(66946007)(386003)(66476007)(66446008)(64756008)(6506007)(186003)(66556008)(99286004)(66066001)(86362001)(5660300002)(53546011)(14454004)(76176011)(102836004)(26005)(6116002)(2906002)(486006)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6272;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0PHZo1jiT1pkz33nCJj8So/VbYak/n14O0cbehhz3RR1ym22xMr9KmU+ZWIpMKKp1GJiXGv4CBcItN+k5mMgzadBxM4wqZ2otHp/FbvhGjL377p2XLoFgCwJMsPYcBIzqtZBQ8DeS3k0Zo+H1EtxytFNEGiaTmf5kKrTheDqgxmJSc6+thxaBdeO8THCsrvQPn6kFFUeS7R0/Uybm2ll/MRiQOL19dudiVLo94i+BjLenM2l90VDSfxjaQglwfhR3TIX3nQ4aMSm/HbtjsGgw2Lu3zto2kBGEB5G2AY4FSXjDG0rjtRW0Gw7X50RXwtSQjCFgoHylb9NK75usq4GiwBGrkm44kf4Sv3+SE3xDXHbIClXiaGswYGw14ROASHeGkWtVjB7DwFSZvI/fjMTRwjzZKGq3Q1Q61j+KSQyA+b1R4vq1u9UUOuEqZ0epj2b
x-ms-exchange-transport-forked: True
Content-ID: <57BD06A1E1219245833195A807EB8970@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2778cc13-f4ca-4bcf-a336-08d75edde7fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 15:12:27.2730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IAUkTm1jGhsDFiwCZ1GCJfQdaQdau5qLwgyjoO3DI3luUvfYVzzuKVYtAwoTn37NQaBhgOUxb+jgb9QRdBIpOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6272
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:49:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBkO4Aj0byn7s6Bm0dFVLfpXWPn4l83nSzrjzVuIjYM=;
 b=bDHwJTdqflJxu7YIoWqMyjjeiyB25GsQ4j55aDhprJ65AXQxtK17c3ZyQDS4jBt3NqEFRR2LSlV9756M/MxeSLmPYTkowS+zZaNzQTRxP6VJNyMqD7VZO4snXRypdIaojIykpeYFPNJM8GvMHI001h0fNW849iHfj9T+rtypnxE=
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

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDI6NDQ6NTFQTSArMDAwMCwgWWFuZywgUGhpbGlwIHdy
b3RlOgo+IAo+IAo+IE9uIDIwMTktMTAtMjkgMzoyNSBwLm0uLCBKYXNvbiBHdW50aG9ycGUgd3Jv
dGU6Cj4gPiBPbiBUdWUsIE9jdCAyOSwgMjAxOSBhdCAwNzoyMjozN1BNICswMDAwLCBZYW5nLCBQ
aGlsaXAgd3JvdGU6Cj4gPj4gSGkgSmFzb24sCj4gPj4KPiA+PiBJIGRpZCBxdWljayB0ZXN0IGFm
dGVyIG1lcmdpbmcgYW1kLXN0YWdpbmctZHJtLW5leHQgd2l0aCB0aGUKPiA+PiBtbXVfbm90aWZp
ZXIgYnJhbmNoLCB3aGljaCBpbmNsdWRlcyB0aGlzIHNldCBjaGFuZ2VzLiBUaGUgdGVzdCByZXN1
bHQKPiA+PiBoYXMgZGlmZmVyZW50IGZhaWx1cmVzLCBhcHAgc3R1Y2sgaW50ZXJtaXR0ZW50bHks
IEdVSSBubyBkaXNwbGF5IGV0Yy4gSQo+ID4+IGFtIHVuZGVyc3RhbmRpbmcgdGhlIGNoYW5nZXMg
YW5kIHdpbGwgdHJ5IHRvIGZpZ3VyZSBvdXQgdGhlIGNhdXNlLgo+ID4gCj4gPiBUaGFua3MhIEkn
bSBub3Qgc3VycHJpc2VkIGJ5IHRoaXMgZ2l2ZW4gaG93IGRpZmZpY3VsdCB0aGlzIHBhdGNoIHdh
cwo+ID4gdG8gbWFrZS4gTGV0IG1lIGtub3cgaWYgSSBjYW4gYXNzaXN0IGluIGFueSB3YXkKPiA+
IAo+ID4gUGxlYXNlIGVuc3VyZSB0byBydW4gd2l0aCBsb2NrZGVwIGVuYWJsZWQuLiBZb3VyIHN5
bXB0b3BzIHNvdW5kcyBzb3J0Cj4gPiBvZiBsaWtlIGRlYWRsb2NraW5nPwo+ID4gCj4gSGkgSmFz
b24sCj4gCj4gQXR0YWNoZWQgcGF0Y2ggZml4IHNldmVyYWwgaXNzdWVzIGluIGFtZGdwdSBkcml2
ZXIsIG1heWJlIHlvdSBjYW4gc3F1YXNoIAo+IHRoaXMgaW50byBwYXRjaCAxNC4gV2l0aCB0aGlz
IGlzIGRvbmUsIHBhdGNoIDEyLCAxMywgMTQgaXMgUmV2aWV3ZWQtYnkgCj4gYW5kIFRlc3RlZC1i
eSBQaGlsaXAgWWFuZyA8cGhpbGlwLnlhbmdAYW1kLmNvbT4KCldvdywgdGhpcyBpcyBncmVhdCB0
aGFua3MhIENhbiB5b3UgY2xhcmlmeSB3aGF0IHRoZSBwcm9ibGVtcyB5b3UgZm91bmQKd2VyZT8g
V2FzIHRoZSBidWcgdGhlICdyZXR1cm4gIXInIGJlbG93PwoKSSdsbCBhbHNvIGFkZCB5b3VyIHNp
Z25lZCBvZmYgYnkKCkhlcmUgYXJlIHNvbWUgcmVtYXJrczoKCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X21uLmMKPiBpbmRleCBjYjcxOGEwNjRlYjQuLmM4YmJkMDZmMTAwOSAxMDA2
NDQKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYwo+IEBAIC02
NywyMSArNjcsMTUgQEAgc3RhdGljIGJvb2wgYW1kZ3B1X21uX2ludmFsaWRhdGVfZ2Z4KHN0cnVj
dCBtbXVfcmFuZ2Vfbm90aWZpZXIgKm1ybiwKPiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRldik7Cj4gIAlsb25nIHI7Cj4gIAo+IC0JLyoK
PiAtCSAqIEZJWE1FOiBNdXN0IGhvbGQgc29tZSBsb2NrIHNoYXJlZCB3aXRoCj4gLQkgKiBhbWRn
cHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUoKQo+IC0JICovCj4gLQltbXVfcmFuZ2Vfc2V0
X3NlcShtcm4sIGN1cl9zZXEpOwo+ICsJbXV0ZXhfbG9jaygmYWRldi0+bm90aWZpZXJfbG9jayk7
Cj4gIAo+IC0JLyogRklYTUU6IElzIHRoaXMgbmVjZXNzYXJ5PyAqLwo+IC0JaWYgKCFhbWRncHVf
dHRtX3R0X2FmZmVjdF91c2VycHRyKGJvLT50Ym8udHRtLCByYW5nZS0+c3RhcnQsCj4gLQkJCQkJ
ICByYW5nZS0+ZW5kKSkKPiAtCQlyZXR1cm4gdHJ1ZTsKPiArCW1tdV9yYW5nZV9zZXRfc2VxKG1y
biwgY3VyX3NlcSk7Cj4gIAo+IC0JaWYgKCFtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJh
bmdlKSkKPiArCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkpIHsKPiAr
CQltdXRleF91bmxvY2soJmFkZXYtPm5vdGlmaWVyX2xvY2spOwo+ICAJCXJldHVybiBmYWxzZTsK
ClRoaXMgdGVzdCBmb3IgcmFuZ2VfYmxvY2thYmxlIHNob3VsZCBiZSBiZWZvcmUgbXV0ZXhfbG9j
aywgSSBjYW4gbW92ZQppdCB1cAoKQWxzbywgZG8geW91IGtub3cgaWYgbm90aWZpZXJfbG9jayBp
cyBoZWxkIHdoaWxlIGNhbGxpbmcKYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlc19kb25lKCk/
IENhbiB3ZSBhZGQgYSAnbG9jayBhc3NlcnQgaGVsZCcKdG8gYW1kZ3B1X3R0bV90dF9nZXRfdXNl
cl9wYWdlc19kb25lKCk/Cgo+IEBAIC04NTQsMTIgKzg1MywyMCBAQCBpbnQgYW1kZ3B1X3R0bV90
dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdl
cykKPiAgCQlyID0gLUVQRVJNOwo+ICAJCWdvdG8gb3V0X3VubG9jazsKPiAgCX0KPiArCXVwX3Jl
YWQoJm1tLT5tbWFwX3NlbSk7Cj4gKwl0aW1lb3V0ID0gamlmZmllcyArIG1zZWNzX3RvX2ppZmZp
ZXMoSE1NX1JBTkdFX0RFRkFVTFRfVElNRU9VVCk7Cj4gKwo+ICtyZXRyeToKPiArCXJhbmdlLT5u
b3RpZmllcl9zZXEgPSBtbXVfcmFuZ2VfcmVhZF9iZWdpbigmYm8tPm5vdGlmaWVyKTsKPiAgCj4g
Kwlkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7Cj4gIAlyID0gaG1tX3JhbmdlX2ZhdWx0KHJhbmdl
LCAwKTsKPiAgCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7Cj4gLQo+IC0JaWYgKHVubGlrZWx5KHIg
PCAwKSkKPiArCWlmICh1bmxpa2VseShyIDw9IDApKSB7Cj4gKwkJaWYgKChyID09IDAgfHwgciA9
PSAtRUJVU1kpICYmICF0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvdXQpKQo+ICsJCQlnb3RvIHJl
dHJ5Owo+ICAJCWdvdG8gb3V0X2ZyZWVfcGZuczsKPiArCX0KClRoaXMgaXNuJ3QgcmVhbGx5IHJp
Z2h0LCBhIHJldHJ5IGxvb3AgbGlrZSB0aGlzIG5lZWRzIHRvIGdvIGFsbCB0aGUKd2F5IHRvIG1t
dV9yYW5nZV9yZWFkX3JldHJ5KCkgYW5kIGRvbmUgdW5kZXIgdGhlIG5vdGlmaWVyX2xvY2suIGll
Cm1tdV9yYW5nZV9yZWFkX3JldHJ5KCkgY2FuIGZhaWwganVzdCBhcyBsaWtlbHkgYXMgaG1tX3Jh
bmdlX2ZhdWx0KCkKY2FuLCBhbmQgZHJpdmVycyBhcmUgc3VwcG9zZWQgdG8gcmV0cnkgaW4gYm90
aCBjYXNlcywgd2l0aCBhIHNpbmdsZQp0aW1lb3V0LgoKQUZBSUNUIGl0IGlzIGEgbWFqb3IgYnVn
IHRoYXQgbWFueSBwbGFjZXMgaWdub3JlIHRoZSByZXR1cm4gY29kZSBvZgphbWRncHVfdHRtX3R0
X2dldF91c2VyX3BhZ2VzX2RvbmUoKSA/Pz8KCkhvd2V2ZXIsIHRoaXMgaXMgYWxsIHByZS1leGlz
dGluZyBidWdzLCBzbyBJJ20gT0sgZ28gYWhlYWQgd2l0aCB0aGlzCnBhdGNoIGFzIG1vZGlmaWVk
LiBJIGFkdmlzZSBBTUQgdG8gbWFrZSBhIGZvbGxvd3VwIHBhdGNoIC4uCgpJJ2xsIGFkZCBhIEZJ
WE1FIG5vdGUgdG8gdGhpcyBlZmZlY3QuCgo+ICAJZm9yIChpID0gMDsgaSA8IHR0bS0+bnVtX3Bh
Z2VzOyBpKyspIHsKPiAgCQlwYWdlc1tpXSA9IGhtbV9kZXZpY2VfZW50cnlfdG9fcGFnZShyYW5n
ZSwgcmFuZ2UtPnBmbnNbaV0pOwo+IEBAIC05MTYsNyArOTIzLDcgQEAgYm9vbCBhbWRncHVfdHRt
X3R0X2dldF91c2VyX3BhZ2VzX2RvbmUoc3RydWN0IHR0bV90dCAqdHRtKQo+ICAJCWd0dC0+cmFu
Z2UgPSBOVUxMOwo+ICAJfQo+ICAKPiAtCXJldHVybiByOwo+ICsJcmV0dXJuICFyOwoKQWggaXMg
dGhpcyB0aGUgbWFqb3IgZXJyb3I/IGhtbV9yYW5nZV92YWxpZCgpIGlzIGludmVydGVkIHZzCm1t
dV9yYW5nZV9yZWFkX3JldHJ5KCk/Cgo+ICB9Cj4gICNlbmRpZgo+ICAKPiBAQCAtOTk3LDEwICsx
MDA0LDE4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV90dG1fdHRfdW5waW5fdXNlcnB0cihzdHJ1Y3Qg
dHRtX3R0ICp0dG0pCj4gIAlzZ19mcmVlX3RhYmxlKHR0bS0+c2cpOwo+ICAKPiAgI2lmIElTX0VO
QUJMRUQoQ09ORklHX0RSTV9BTURHUFVfVVNFUlBUUikKPiAtCWlmIChndHQtPnJhbmdlICYmCj4g
LQkgICAgdHRtLT5wYWdlc1swXSA9PSBobW1fZGV2aWNlX2VudHJ5X3RvX3BhZ2UoZ3R0LT5yYW5n
ZSwKPiAtCQkJCQkJICAgICAgZ3R0LT5yYW5nZS0+cGZuc1swXSkpCj4gLQkJV0FSTl9PTkNFKDEs
ICJNaXNzaW5nIGdldF91c2VyX3BhZ2VfZG9uZVxuIik7Cj4gKwlpZiAoZ3R0LT5yYW5nZSkgewo+
ICsJCXVuc2lnbmVkIGxvbmcgaTsKPiArCj4gKwkJZm9yIChpID0gMDsgaSA8IHR0bS0+bnVtX3Bh
Z2VzOyBpKyspIHsKPiArCQkJaWYgKHR0bS0+cGFnZXNbaV0gIT0KPiArCQkJCWhtbV9kZXZpY2Vf
ZW50cnlfdG9fcGFnZShndHQtPnJhbmdlLAo+ICsJCQkJCSAgICAgIGd0dC0+cmFuZ2UtPnBmbnNb
aV0pKQo+ICsJCQkJYnJlYWs7Cj4gKwkJfQo+ICsKPiArCQlXQVJOKChpID09IHR0bS0+bnVtX3Bh
Z2VzKSwgIk1pc3NpbmcgZ2V0X3VzZXJfcGFnZV9kb25lXG4iKTsKPiArCX0KCklzIHRoaXMgcmVs
YXRlZC9uZWNlc3Nhcnk/IEkgY2FuIHB1dCBpdCBpbiBhbm90aGVyIHBhdGNoIGlmIGl0IGlzIGp1
c3QKZGVidWdnaW5nIGltcHJvdmVtZW50PyBQbGVhc2UgYWR2aXNlCgpUaGFua3MgYSBsb3QsCkph
c29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
