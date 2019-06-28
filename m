Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749205B13C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D17B89D49;
	Sun, 30 Jun 2019 18:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30084.outbound.protection.outlook.com [40.107.3.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8A66E17E;
 Fri, 28 Jun 2019 18:29:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=SMGjLKbDUPfnf9EYwqTLq1tumGoualfPfZcFgUBrEzxzlqL/SVk3jtE5n9dT2tOgXbmj9lBwtsvItQONYVwwr5YfzL8oruGtdHK8n1yZklIdQeNlQZ01vC9+f3RSEKPH/fr3Re4hHu0z8fC0KIRg7c9+19rrwDox0/hNIeYC3b8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW+4ZnzFUxI2thr+G8Np8e2Oaw4bAbhf7CTAtwXVS7w=;
 b=XA9ftZejVn45JWnTwlvetjfcxwbhqKfzuI3izLVSnEYc9VQemMGteuUAyAVrpeKuLkJIT302YxzUg27XJQW/0988mEqMEeO0tQmLJrfKXyD4vaqSjxdd9qbfNfrlYTolHJ4xLjagtiu9BgCJ2iyCHiqF3okOMTCvJM0pprTAjp0=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4365.eurprd05.prod.outlook.com (52.133.12.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 18:29:30 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2008.014; Fri, 28 Jun 2019
 18:29:30 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 16/25] device-dax: use the dev_pagemap internal refcount
Thread-Topic: [PATCH 16/25] device-dax: use the dev_pagemap internal refcount
Thread-Index: AQHVLBqgvimki3zmIk2l4xtSxGbkyKaxNtmAgAANxQCAAAmqgIAAAboAgAAAeQCAABYfAA==
Date: Fri, 28 Jun 2019 18:29:29 +0000
Message-ID: <20190628182922.GA15242@mellanox.com>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-17-hch@lst.de> <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
 <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
 <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
In-Reply-To: <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [76.14.1.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92287021-7090-4314-de00-08d6fbf68ed6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4365; 
x-ms-traffictypediagnostic: VI1PR05MB4365:
x-microsoft-antispam-prvs: <VI1PR05MB43657FBDB1EA58C053C63BC0CFFC0@VI1PR05MB4365.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(39840400004)(376002)(136003)(199004)(189003)(66476007)(486006)(6512007)(33656002)(66946007)(7416002)(6916009)(71200400001)(2906002)(73956011)(64756008)(36756003)(66556008)(71190400001)(68736007)(66066001)(1076003)(305945005)(99286004)(7736002)(6506007)(102836004)(53546011)(6116002)(66446008)(316002)(81156014)(52116002)(54906003)(8936002)(14454004)(5660300002)(2616005)(476003)(386003)(26005)(6246003)(53936002)(25786009)(86362001)(76176011)(6486002)(4326008)(229853002)(14444005)(3846002)(186003)(11346002)(6436002)(81166006)(446003)(478600001)(256004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4365;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NndW95S8YhHhIuIPXgE6DJ7FFQ7Wi7Qv94ks4fGecraJJl1kl/B/OiUhXXk9d64RAObNBGQNxj/+Dsy5mCDDXsBwBDTWMuw3tjOuwTSgwG5PzhEEsvNDJf9XW+MPpKaSIsZv/rs4/U1oe22/ThS4DnCfmYBIFdhumeofar4MDc1jemYw0XIYXX8bU9TB+TOtLL3E7d3f4yPyOPANELn3trWurneIuwVvOkzGEBz4dpp7ebk/fyq+oyUj00Dl1Sgj+X8NHddMhnD3WgJiL9qTBSapgYgKOkVLUcxF56u40YYlfwNZXXBi5FOP0gnYxu24VP8w25yfd0HTdOMjiy1SlXg4j33ovwiSGHGgr9YOfs+e/FuwerlAr0ZU/nj91QnAncOQQTkPfIx9yX5IeyPw9IJWGZeEyz3r0NamJ8DV4Fo=
Content-ID: <14F6B0C5B925FB4B8ECAEFC2C0B435B0@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92287021-7090-4314-de00-08d6fbf68ed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 18:29:30.0154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4365
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW+4ZnzFUxI2thr+G8Np8e2Oaw4bAbhf7CTAtwXVS7w=;
 b=i/sq3VFp3C08XaTuKwHLxcVYHPXIaNzhEuu3F3FguK6s4f+v0TYSCoJH2ugmmoXVU6n5/DNhHQNaWKQmEIMLgq5RWK0e1Er/GxWZs+smSRYlWXAF/zxXR48Wo9swMfK8cs9srf9qNSeH2CyPNtX0djywJbltIyU2UZb4thfbaC4=
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTA6MTA6MTJBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDEwOjA4IEFNIERhbiBXaWxsaWFtcyA8ZGFu
Lmoud2lsbGlhbXNAaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEp1biAyOCwgMjAx
OSBhdCAxMDowMiBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPiBPbiBGcmksIEp1biAyOCwgMjAxOSBhdCAwOToyNzo0NEFNIC0wNzAwLCBEYW4g
V2lsbGlhbXMgd3JvdGU6Cj4gPiA+ID4gT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgODozOSBBTSBK
YXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4g
PiA+IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDAyOjI3OjE1UE0gKzAyMDAsIENocmlzdG9waCBI
ZWxsd2lnIHdyb3RlOgo+ID4gPiA+ID4gPiBUaGUgZnVuY3Rpb25hbGl0eSBpcyBpZGVudGljYWwg
dG8gdGhlIG9uZSBjdXJyZW50bHkgb3BlbiBjb2RlZCBpbgo+ID4gPiA+ID4gPiBkZXZpY2UtZGF4
Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGxzdC5kZT4KPiA+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndl
aW55QGludGVsLmNvbT4KPiA+ID4gPiA+ID4gIGRyaXZlcnMvZGF4L2RheC1wcml2YXRlLmggfCAg
NCAtLS0tCj4gPiA+ID4gPiA+ICBkcml2ZXJzL2RheC9kZXZpY2UuYyAgICAgIHwgNDMgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDQ3IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IERhblc6IEkgdGhpbmsg
dGhpcyBzZXJpZXMgaGFzIHJlYWNoZWQgZW5vdWdoIHJldmlldywgZGlkIHlvdSB3YW50Cj4gPiA+
ID4gPiB0byBhY2svdGVzdCBhbnkgZnVydGhlcj8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIG5l
ZWRzIHRvIGxhbmQgaW4gaG1tLmdpdCBzb29uIHRvIG1ha2UgdGhlIG1lcmdlIHdpbmRvdy4KPiA+
ID4gPgo+ID4gPiA+IEkgd2FzIGF3YWl0aW5nIGEgZGVjaXNpb24gYWJvdXQgcmVzb2x2aW5nIHRo
ZSBjb2xsaXNpb24gd2l0aCBJcmEncwo+ID4gPiA+IHBhdGNoIGJlZm9yZSB0ZXN0aW5nIHRoZSBm
aW5hbCByZXN1bHQgYWdhaW4gWzFdLiBZb3UgY2FuIGdvIGFoZWFkIGFuZAo+ID4gPiA+IGFkZCBt
eSByZXZpZXdlZC1ieSBmb3IgdGhlIHNlcmllcywgYnV0IG15IHRlc3RlZC1ieSBzaG91bGQgYmUg
b24gdGhlCj4gPiA+ID4gZmluYWwgc3RhdGUgb2YgdGhlIHNlcmllcy4KPiA+ID4KPiA+ID4gVGhl
IGNvbmZsaWN0IGxvb2tzIE9LIHRvIG1lLCBJIHRoaW5rIHdlIGNhbiBsZXQgQW5kcmV3IGFuZCBM
aW51cwo+ID4gPiByZXNvbHZlIGl0Lgo+ID4KPiA+IEFuZHJldydzIHRyZWUgZWZmZWN0aXZlbHkg
YWx3YXlzIHJlYmFzZXMgc2luY2UgaXQncyBhIHF1aWx0IHNlcmllcy4KPiA+IEknZCByZWNvbW1l
bmQgcHVsbGluZyBJcmEncyBwYXRjaCBvdXQgb2YgLW1tIGFuZCBhcHBseWluZyBpdCB3aXRoIHRo
ZQo+ID4gcmVzdCBvZiBobW0gcmV3b3Jrcy4gQW55IG90aGVyIGdpdCB0cmVlIEknZCBhZ3JlZSB3
aXRoIGp1c3QgZG9pbmcgdGhlCj4gPiBsYXRlIGNvbmZsaWN0IHJlc29sdXRpb24sIGJ1dCBJJ20g
bm90IGNsZWFyIG9uIHdoYXQncyB0aGUgYmVzdAo+ID4gcHJhY3RpY2Ugd2hlbiBjb25mbGljdGlu
ZyB3aXRoIC1tbS4KCldoYXQgaGFwcGVucyBkZXBlbmRzIG9uIHRpbWluZyBhcyB0aGluZ3MgYXJy
aXZlIHRvIExpbnVzLiBJIHByb21pc2VkCnRvIHNlbmQgaG1tLmdpdCBlYXJseSwgc28gSSB1bmRl
cnN0YW5kIHRoYXQgQW5kcmV3IHdpbGwgcXVpbHQgcmViYXNlCmhpcyB0cmVlIHRvIExpbnVzJ3Mg
YW5kIGZpeCB0aGUgY29uZmxpY3QgaW4gSXJhJ3MgcGF0Y2ggYmVmb3JlIGhlCnNlbmRzIGl0LgoK
PiBSZWdhcmRsZXNzIHRoZSBwYXRjaCBpcyBidWdneS4gSWYgeW91IHdhbnQgdG8gZG8gdGhlIGNv
bmZsaWN0Cj4gcmVzb2x1dGlvbiBpdCBzaG91bGQgYmUgYmVjYXVzZSB0aGUgREVWSUNFX1BVQkxJ
QyByZW1vdmFsIGVmZmVjdGl2ZWx5Cj4gZG9lcyB0aGUgc2FtZSBmaXggb3RoZXJ3aXNlIHdlJ3Jl
IGtub3dpbmdseSBsZWF2aW5nIGEgYnJva2VuIHBvaW50IGluCj4gdGhlIGhpc3RvcnkuCgpJJ20g
bm90IHN1cmUgSSB1bmRlcnN0YW5kIHlvdXIgY29uY2VybiwgaXMgdGhlcmUgc29tZXRoaW5nIHdy
b25nIHdpdGgKQ0gncyBzZXJpZXMgYXMgaXQgc3RhbmRzPyBobW0gaXMgYSBub24tcmViYXNpbmcg
Z2l0IHRyZWUsIHNvIGFzIGxvbmcKYXMgdGhlIHNlcmllcyBpcyBjb3JyZWN0ICp3aGVuIEkgYXBw
bHkgaXQqIHRoZXJlIGlzIG5vIGJyb2tlbiBoaXN0b3J5LgoKSSBhc3N1bWVkIHRoZSBjb25mbGlj
dCByZXNvbHV0aW9uIGZvciBJcmEncyBwYXRjaCB3YXMgdG8gc2ltcGx5IHRha2UKdGhlIGRlbGV0
aW9uIG9mIHRoZSBpZiBibG9jayBmcm9tIENIJ3Mgc2VyaWVzIC0gcmlnaHQ/CgpJZiB3ZSBkbyBu
ZWVkIHRvIHRha2UgSXJhJ3MgcGF0Y2ggaW50byBobW0uZ2l0IGl0IHdpbGwgZ28gYWZ0ZXIgQ0gn
cwpzZXJpZXMgKGFuZCBJcmEgd2lsbCBoYXZlIHRvIHJlYmFzZS9yZXBvc3QgaXQpLCBzbyBJIHRo
aW5rIHRoZXJlIGlzCm5vdGhpbmcgdG8gZG8gYXQgdGhpcyBtb21lbnQgLSB1bmxlc3MgeW91IGFy
ZSBzYXlpbmcgdGhlcmUgaXMgYQpwcm9ibGVtIHdpdGggdGhlIHNlcmllcyBpbiBDSCdzIGdpdCB0
cmVlPwoKUmVnYXJkcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
