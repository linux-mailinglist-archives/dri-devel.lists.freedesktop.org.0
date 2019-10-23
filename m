Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2245DE2B12
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 09:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217FA6E104;
	Thu, 24 Oct 2019 07:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30072.outbound.protection.outlook.com [40.107.3.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1202B6EB57;
 Wed, 23 Oct 2019 17:24:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSoIh2Re3QHAc2joYgOWb+Me3GXRpED+0zTPRYajXTdY0KeHwJy0YY96BZBFJmjfWeHyLeHSvCU7wrAKRd4IxReFstNBeizO3WxMV+vEuW0+mfusMveKh8LFvcd1ZLGW3LohNbsukRBHXO27I7YBbpz1UJ52HTswwziJpNDepnhhKo2cvsNFHtKGem7cbiwfyIGly+YvkLSv4d6dzV/J4l8i+lbLDn5PPPeBc1/QEMUGjn4kYmCpYZMkehxSN+bxj5yGy86LLoWfwRtIOuhsrBQcLw4/xnndGAiJ/6LfPq8A14P7Ja9FBzqlELpIK1yLuKZ1BAIaLP01tCQZFJcK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e27RJwgohDjB5rPJYMfqo9M5TDj75Snml902/edeD64=;
 b=RBadsEmZujOi/G3z+o/KoCPUFGoZqmqMHI8gNv4TNayYClzMJJpqU7Jq50I49BCWkzu6EWqv3MRD7bPXMk5vqAvlmb9+QqjtPdYIEO4tzGip2bBtLfd4JSGMo+ta7LIPEWVZ1lDRM/zT5EilUfJ3LMAWXD6gr7cns5QmrX/00czhfq+bketAl/QTuziRhdcNHe8lhavizZelSmxYJtxwwyWwMErLCOK/MreyG+zQwoydwCOXjOyAZh6ZzYO3F275mtd4a3HGpq6kzzYVokbETBCbq7tXdooZJxy8B6AkCDa80B/Yygn6T0Qy0ie4xcFU2KmukRnrXUFrFJ9VwJywMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4239.eurprd05.prod.outlook.com (52.134.123.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Wed, 23 Oct 2019 17:24:45 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2367.025; Wed, 23 Oct 2019
 17:24:45 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Topic: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Index: AQHVg4Sqa7CCxCToXEeTrrYAqVQVhqdc+JgAgAB3OACAARovgIAAficAgAAF3YCAAdJKAIACvAUAgAGLqgCAAAilAIAADDUAgAEY24CAAHZYgIABL+8AgAAGggCAAHr4gIAACQcA
Date: Wed, 23 Oct 2019 17:24:45 +0000
Message-ID: <20191023172442.GX22766@mellanox.com>
References: <20191018203608.GA5670@mellanox.com>
 <f7e34d8f-f3b0-b86d-7388-1f791674a4a9@amd.com>
 <20191021135744.GA25164@mellanox.com>
 <e07092c3-8ccd-9814-835c-6c462017aff8@amd.com>
 <20191021151221.GC25164@mellanox.com>
 <20191022075735.GV11828@phenom.ffwll.local>
 <20191022150109.GF22766@mellanox.com>
 <20191023090858.GV11828@phenom.ffwll.local>
 <13edf841-421e-3522-fcec-ef919c2013ef@gmail.com>
 <20191023165223.GA4163@redhat.com>
In-Reply-To: <20191023165223.GA4163@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0137.namprd02.prod.outlook.com
 (2603:10b6:208:35::42) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8f6b4a1d-3abc-4baf-6e57-08d757dde5f7
x-ms-traffictypediagnostic: VI1PR05MB4239:
x-microsoft-antispam-prvs: <VI1PR05MB42391529A72E1D681D6E323FCF6B0@VI1PR05MB4239.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(189003)(199004)(71190400001)(36756003)(6246003)(6436002)(86362001)(4326008)(6116002)(1076003)(3846002)(6916009)(6486002)(33656002)(2906002)(71200400001)(478600001)(7416002)(5660300002)(26005)(66446008)(76176011)(11346002)(486006)(64756008)(476003)(256004)(52116002)(66476007)(386003)(6506007)(66556008)(66946007)(186003)(305945005)(7736002)(446003)(66066001)(99286004)(6512007)(81166006)(81156014)(25786009)(8936002)(8676002)(14444005)(229853002)(2616005)(316002)(102836004)(14454004)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4239;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /eDCrbN2DZ7jIHyX3sGWvx8DgQk9MjRGIiKuxS3Lsl935gUs7E+g91bhJwfIHxLFxgdAE+/hPJWFdMIxN7sxANaES+49qJESfLhmxuoSLrdS8viRM6yy+6JRLGRZHDyj4+8PoUMT8ArRtrhgxDmwN0k1N3FRh/ebqplcDfxPclckH6mVCR2Gset6aFwB0YBUOaexLD4aNg6Pjnn9MWpKdRws+jl3XnLsHiLWOLzA+wIuMeCui4VJAVcJDjtwhgmzcoORQ3RwN5P7u0v/3ll3qq62pQx7BU36gSQG4aNHJgdgWbtabVcYwLtLcLri9DDSEMKP2LkjKMAL8b9dOHQYAMNzwDHmCXONbJ+hz3xYWArNOJWFTznOIf7bQz459TRux6R9gKna115MLyXE+G3wFO0/pmDgwGkNyz7Ntz2ATS4SzCkKzKu4hBcq0S3mYb8E
x-ms-exchange-transport-forked: True
Content-ID: <ECB58748CAB4784EBC55A1889CAC7D2B@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6b4a1d-3abc-4baf-6e57-08d757dde5f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 17:24:45.5170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jd8rcyB6pWt4/zZXZYHvAYuYU/mqvHSucyjl1/KDFNaq8LOiiu5qcuSve8X4a9z++8cRiHm9oN56WcEN+qWeww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4239
X-Mailman-Approved-At: Thu, 24 Oct 2019 07:27:37 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e27RJwgohDjB5rPJYMfqo9M5TDj75Snml902/edeD64=;
 b=p5PJZX8QiqkvZDVkoXS+MksknfUpTBD+uWoELKAEeh4p4/HGbAm+rADHP/zSyQgek/c+GVOdib4vaNsZeu5Mx1gzD0/1scToH0aMD1PMT6ITits7izXr7FqcxMDB7hitHfxyvtjHz94W9jLGU43zioNZMMvWowa3RW69N1HawLI=
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
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, 
 Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTI6NTI6MjNQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiA+IEdvaW5nIGFub3RoZXIgc3RlcCBmdXJ0aGVyLi4uLiB3aGF0IGhpbmRlcnMgdXMg
dG8gcHV0IHRoZSBsb2NrIGludG8gdGhlIG1tdQo+ID4gcmFuZ2Ugbm90aWZpZXIgaXRzZWxmIGFu
ZCBoYXZlIF9sb2NrKCkvX3VubG9jaygpIGhlbHBlcnM/Cj4gPiAKPiA+IEkgbWVhbiBoYXZpbmcg
dGhlIGxvY2sgaW4gdGhlIGRyaXZlciBvbmx5IG1ha2VzIHNlbnNlIHdoZW4gdGhlIGRyaXZlciB3
b3VsZAo+ID4gYmUgdXNpbmcgdGhlIHNhbWUgbG9jayBmb3IgbXVsdGlwbGUgdGhpbmdzLCBlLmcu
IG11bHRpcGxlIE1NVSByYW5nZQo+ID4gbm90aWZpZXJzIHVuZGVyIHRoZSBzYW1lIGxvY2suIEJ1
dCBJIHJlYWxseSBkb24ndCBzZWUgdGhhdCB1c2UgY2FzZSBoZXJlLgo+IAo+IEkgYWN0dWFseSBk
bywgbm91dmVhdSB1c2Ugb25lIGxvY2sgdG8gcHJvdGVjdCB0aGUgcGFnZSB0YWJsZSBhbmQgdGhh
dCdzIHRoZQo+IGxvY2sgdGhhdCBtYXR0ZXIuIFlvdSBjYW4gaGF2ZSBtdWx0aXBsZSByYW5nZSBm
b3IgYSBzaW5nbGUgcGFnZSB0YWJsZSwgaWRlYQo+IGJlaW5nIG9ubHkgYSBzdWItc2V0IG9mIHRo
ZSBwcm9jZXNzIGFkZHJlc3Mgc3BhY2UgaXMgZXZlciBhY2Nlc3NlZCBieSB0aGUKPiBHUFUgYW5k
IHRob3NlIGl0IGlzIGJldHRlciB0byBmb2N1cyBvbiB0aGlzIHN1Yi1zZXQgYW5kIHRyYWNrIGlu
dmFsaWRhdGlvbiBpbgo+IGEgZmluZXIgZ3JhaW4uCgptbHg1IGlzIHNpbWlsYXIsIGJ1dCBub3Qg
Y3VycmVudGx5IGNvZGVkIHF1aXRlIHJpZ2h0LCB0aGVyZSBpcyBvbmUKbG9jayB0aGF0IHByb3Rl
Y3RzIHRoZSBjb21tYW5kIHF1ZXVlIGZvciBzdWJtaXR0aW5nIGludmFsaWRhdGlvbnMgdG8KdGhl
IEhXIGFuZCBpdCBkb2Vzbid0IG1ha2UgYSBsb3Qgb2Ygc2Vuc2UgdG8gaGF2ZSBhZGRpdGlvbmFs
IGZpbmUKZ3JhaW5lZCBsb2NraW5nIGJleW9uZCB0aGF0LgoKU28gSSBzdXBwb3NlIHRoZSBpbnRl
bnQgaGVyZSB0aGF0IG1vc3QgZHJpdmVycyB3b3VsZCBoYXZlIGEgc2luZ2xlCidwYWdlIHRhYmxl
IGxvY2snIHRoYXQgcHJvdGVjdHMgdGhlIEhXJ3MgcGFnZSB0YWJsZSB1cGRhdGUsIGFuZCB0aGlz
CmxvY2sgaXMgdGhlIG9uZSB0aGF0IHNob3VsZCBiZSBoZWxkIHdoaWxlIHVwYXRpbmcgYW5kIGNo
ZWNraW5nIHRoZQpzZXF1ZW5jZSBudW1iZXIuCgpkbWFfZmVuY2UgYmFzZWQgZHJpdmVycyBhcmUg
cG9zc2libHkgYSBsaXR0bGUgZGlmZmVyZW50LCBJIHRoaW5rIHRoZXkKY2FuIGp1c3QgdXNlIGEg
c3BpbmxvY2ssIHRoZWlyIHBhdHRlcm4gc2hvdWxkIHByb2JhYmx5IGJlIHNvbWV0aGluZwpsaWtl
CgpmYXVsdDoKIGhtbV9yYW5nZV9mYXVsdCgpCgogc3Bpbl9sb2NrKCkKIGlmIChtbXVfcmFuZ2Vf
cmVhZF9yZXRyeSgpKSkKICAgICBnb3RvIGFnYWluCiBkbWFfZmVuY2VfaW5pdChtcm4tPmZlbmNl
KQogc3Bpbl91bmxvY2soKQoKaW52YWxpZGF0ZToKIHNwaW5fbG9jaygpCiBpc19pbml0ZWQgPSAn
ZG1hIGZlbmNlIGluaXQgaGFzIGJlZW4gY2FsbGVkJwogc3Bpbl91bmxvY2soKQogaWYgKGlzX2lu
aXRlZCkKICAgIGRtYV9mZW5jZV93YWl0KGZlbmNlKQoKCkknbSBub3Qgc3VyZSwgbmV2ZXIgdXNl
ZCBkbWFfZmVuY2UgYmVmb3JlLiBUaGUga2V5IHRoaW5nIGlzIHRoYXQgdGhlCmRtYV9mZW5jZV93
YWl0KCkgY2Fubm90IGJsb2NrIHVudGlsIGFmdGVyIHRoZSBtbXVfcmFuZ2VfcmVhZF9yZXRyeSgp
ICYKdW5sb2NrIGNvbXBsZXRlcy4gT3RoZXJ3aXNlIGl0IGNhbiBkZWFkbG9jayB3aXRoIGhtbV9y
YW5nZV9mYXVsdCgpLgoKSXQgd291bGQgYmUgbmljZSB0byBmaWd1cmUgdGhpcyBvdXQgYW5kIGFk
ZCBpdCB0byB0aGUgaG1tLnJzdCBhcyB3ZSBkbwpoYXZlIHR3byBkcml2ZXJzIHVzaW5nIHRoZSBk
bWFfZmVuY2Ugc2NoZW1lLgoKQWxzbywgdGhlIHVzZSBvZiBhIHNwaW5sb2NrIGhlcmUgcHJvYmFi
bHkgc2F5cyB3ZSBzaG91bGQga2VlcCB0aGUgbG9jawpleHRlcm5hbC4KCkJ1dCwgaXQgc291bmRz
IGxpa2UgdGhlIG1tdV9yYW5nZV9ub3RpZmllcl91cGRhdGVfc2VxKCkgaXMgYSBnb29kCmlkZWEs
IHNvIGxldCBtZSBhZGQgdGhhdCBpbiB2Mi4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
