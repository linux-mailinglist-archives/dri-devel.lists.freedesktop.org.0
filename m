Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA604F41E8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9916F897;
	Fri,  8 Nov 2019 08:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70049.outbound.protection.outlook.com [40.107.7.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A3E6F78E;
 Thu,  7 Nov 2019 20:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nm8BTQc4XcVTH5AaIKywjzo0C9fWhL5LyHHaZXEcnqCacomefreNfCKYQ2Oa0s16aXW/c2911ukmgASDwn20ZW6cnBzvAqn8cyj8vO63bdPEgpPjdyVeLlt4Mak0civxWgMIpYwzLQ0KSDYPZ/gD4kroy5KkQif6whPF91zAh3v7+1YTYQdeiAtFx2lIKky2rwPSwPhs1FWpC8j3vAtxEKvCBxcP4DR77nl18J6wCkgZPeqZAg9BFa4zbCTv3vvDa7O2Ht5Mu1Ro18uRYhGu5yoRkzSf/MN+2W5ls0uPTsCZ/tO/eQHaoBAI3YU9UVv+c1l3kNpq3O4DTNIrHAiMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgxel6wzKCB7iAx3fWFDmhvkjcwH++biBi9chHqduk0=;
 b=Y1VPdXKJOiXfUGO+KcCfgfc7X6vspbWwExS7JeTNyrHYmgiqc7w5TOu7GYwxtKutUPCOrvzwGby8zAXw2DUmL5NwGjxi75ZkhmtsZyDuaaeny6JyRpQUL3o++LbgL0PUENxQSPmCYtMcp8cuYR7IsrhUjixrjELVOnX7uzHOdde30hIqPYLlJ8QILxJxMjkat5ZsHj1asY0s0JLc46RanLeTw1CMhdYjPBFj5oSSiiwjDot2qTz6s82GyCVoQss1X5F0X23FCAfRBSs5xpAoDfO9EK2RrbKnawEG0Lk2NSfgEg/bkf6pJ7vSnunTwOQiGdj209mcO6w4NJZbfnGpQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB3406.eurprd05.prod.outlook.com (10.175.245.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.23; Thu, 7 Nov 2019 20:11:06 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2408.028; Thu, 7 Nov 2019
 20:11:06 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH v2 02/15] mm/mmu_notifier: add an interval tree notifier
Thread-Topic: [PATCH v2 02/15] mm/mmu_notifier: add an interval tree notifier
Thread-Index: AQHVjcvJYOye0EiwZkisYK74G5bmhqd+54eAgAAdRYCAAS6QAA==
Date: Thu, 7 Nov 2019 20:11:06 +0000
Message-ID: <20191107201102.GC21728@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
 <35c2b322-004e-0e18-87e4-1920dc71bfd5@nvidia.com>
 <20191107020807.GA747656@redhat.com>
In-Reply-To: <20191107020807.GA747656@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN4PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:403:3::25) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4cdf982f-b6aa-4a1e-ead0-08d763be9f65
x-ms-traffictypediagnostic: VI1PR05MB3406:
x-microsoft-antispam-prvs: <VI1PR05MB340605F186CF3F42C41E3009CF780@VI1PR05MB3406.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(39850400004)(346002)(396003)(199004)(189003)(14454004)(25786009)(7416002)(305945005)(6916009)(478600001)(7736002)(6512007)(8936002)(6486002)(6436002)(36756003)(229853002)(86362001)(2906002)(81166006)(8676002)(81156014)(4326008)(6246003)(71190400001)(386003)(316002)(1076003)(66946007)(54906003)(99286004)(33656002)(5660300002)(256004)(14444005)(66066001)(52116002)(76176011)(3846002)(486006)(2616005)(476003)(71200400001)(11346002)(6116002)(66446008)(64756008)(66556008)(66476007)(186003)(26005)(6506007)(102836004)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3406;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H5+pRnFkA5QDCMKd68E5ZKcpCb4oVJ3md863xj2cktKvQTKyzXn1xrpDtS9RNSLvsS1j3UXr/9v9oIJDV32GgFLWBOgnOoFuBJ+0TqRXfuiiBoeTrLB2abbk55CpA8TFeZgPeHvt1+1YlT8wbXygJthoj7FkBQm05t2h9kPXeCtZFWApw4yQb1Jx9p8Z/fO9qNjtRHWosI+hnxeHeIk2HHUNKsPCCMlbVe9qBgUy/ZqunC95Ji8bAPUOKQ9idWmIDjErlGSbaD0b3lXAiatAeC7ND7VLBjyk5L52U3MpSGDpVj/2KbTxDZSmwMG6yjJ0dQFfPcQe2XNhIa+YATjVxGRONmg1JkQc4QttBO2T2/f5ekxfmYtl2Xw00zNQJpnN6h42OLr296dVCm7jMhiGk07NexaMqkbX4v7XUttzwHCpqBwhWvIRTlmxi9y91JRG
x-ms-exchange-transport-forked: True
Content-ID: <9C8D977ED7A453449570F9D0913CEE68@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdf982f-b6aa-4a1e-ead0-08d763be9f65
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 20:11:06.8215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z8D1valdPpKPqSFVylDJ7wF0U0fhXCJCXosYRLsrWDT8na41aquw4LOQzKGcVcTaq+RimeECKXfXEcNqGoIfXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3406
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgxel6wzKCB7iAx3fWFDmhvkjcwH++biBi9chHqduk0=;
 b=BNXsKXL9nJvqfGHHD/lPQbRXn/qd1yJwC3pT5azbBvdC35OPaGVyJz11549WonzkCt8RbubfZxch6PcjKWWnmHJTSZ38OOWd162SVBKSns8OP2ugL8tVb3WrTIhZUl9ji1XzNUD8Cpr2qo1jQvBAzvWBLCnkH2TiPtk2d3cY9Tw=
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
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6MDg6MDdQTSAtMDUwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKCj4gPiAKPiA+IEV4dHJhIGNyZWRpdDogSU1ITywgdGhpcyBjbGVhcmx5IGRlc2VydmVz
IHRvIGFsbCBiZSBpbiBhIG5ldyBtbXVfcmFuZ2Vfbm90aWZpZXIuaAo+ID4gaGVhZGVyIGZpbGUs
IGJ1dCBJIGtub3cgdGhhdCdzIGV4dHJhIHdvcmsuIE1heWJlIGxhdGVyIGFzIGEgZm9sbG93LXVw
IHBhdGNoLAo+ID4gaWYgYW55b25lIGhhcyB0aGUgdGltZS4KPiAKPiBUaGUgcmFuZ2Ugbm90aWZp
ZXIgc2hvdWxkIGdldCB0aGUgZXZlbnQgdG9vLCBpdCB3b3VsZCBiZSBhIHdhc3RlLCBpIHRoaW5r
IGl0IGlzCj4gYW4gb3ZlcnNpZ2h0IGhlcmUuIFRoZSByZWxlYXNlIGV2ZW50IGlzIGZpbmUgc28g
TkFLIHRvIHlvdSBzZXBhcmF0ZSBldmVudC4gRXZlbnQKPiBpcyByZWFsbHkgYW4gaGVscGVyIGZv
ciBub3RpZmllciBpIGhhZCBhIHNldCBvZiBwYXRjaCBmb3Igbm91dmVhdSB0byBsZXZlcmFnZQo+
IHRoaXMgaSBuZWVkIHRvIHJlc3VjaXRlIHRoZW0uIFNvIG5vIG5lZWQgdG8gc3BsaXQgdGhpbmcs
IGkgd291bGQganVzdCBmb3J3YXJkCj4gdGhlIGV2ZW50IGllIGFkZCBldmVudCB0byBtbXVfcmFu
Z2Vfbm90aWZpZXJfb3BzLmludmFsaWRhdGUoKSBpIGZhaWxlZCB0byBjYXRjaAo+IHRoYXQgaW4g
djEgc29ycnkuCgpJIHRoaW5rIHdoYXQgeW91IG1lYW4gaXMgYWxyZWFkeSBkb25lPwoKc3RydWN0
IG1tdV9yYW5nZV9ub3RpZmllcl9vcHMgewoJYm9vbCAoKmludmFsaWRhdGUpKHN0cnVjdCBtbXVf
cmFuZ2Vfbm90aWZpZXIgKm1ybiwKCQkJICAgY29uc3Qgc3RydWN0IG1tdV9ub3RpZmllcl9yYW5n
ZSAqcmFuZ2UsCgkJCSAgIHVuc2lnbmVkIGxvbmcgY3VyX3NlcSk7Cgo+IE5vIGl0IGlzIGFsd2F5
cyBvZGQsIHlvdSBtdXN0IGNhbGwgbW11X3JhbmdlX3NldF9zZXEoKSBvbmx5IGZyb20gdGhlCj4g
b3AtPmludmFsaWRhdGVfcmFuZ2UoKSBjYWxsYmFjayBhdCB3aGljaCBwb2ludCB0aGUgc2VxIGlz
IG9kZC4gQXMgd2VsbAo+IHdoZW4gbXJuIGlzIGFkZGVkIGFuZCBpdHMgc2VxIGZpcnN0IHNldCBp
dCBpcyBzZXQgdG8gYW4gb2RkIHZhbHVlCj4gYWx3YXlzLiBNYXliZSB0aGUgY29tbWVudCwgc2hv
dWxkIHJlYWQ6Cj4gCj4gICogbXJuLT5pbnZhbGlkYXRlX3NlcSBpcyBhbHdheXMsIHllcyBhbHdh
eXMsIHNldCB0byBhbiBvZGQgdmFsdWUuIFRoaXMgZW5zdXJlcwo+IAo+IFRvIHN0cmVzcyB0aGF0
IGl0IGlzIG5vdCBhbiBlcnJvci4KCkkgd2VudCB3aXRoIHRoaXM6CgoJLyoKCSAqIG1ybi0+aW52
YWxpZGF0ZV9zZXEgbXVzdCBhbHdheXMgYmUgc2V0IHRvIGFuIG9kZCB2YWx1ZSB2aWEKCSAqIG1t
dV9yYW5nZV9zZXRfc2VxKCkgdXNpbmcgdGhlIHByb3ZpZGVkIGN1cl9zZXEgZnJvbQoJICogbW5f
aXRyZWVfaW52X3N0YXJ0X3JhbmdlKCkuIFRoaXMgZW5zdXJlcyB0aGF0IGlmIHNlcSBkb2VzIHdy
YXAgd2UKCSAqIHdpbGwgYWx3YXlzIGNsZWFyIHRoZSBiZWxvdyBzbGVlcCBpbiBzb21lIHJlYXNv
bmFibGUgdGltZSBhcwoJICogbW1uX21tLT5pbnZhbGlkYXRlX3NlcSBpcyBldmVuIGluIHRoZSBp
ZGxlIHN0YXRlLgoJICovCgo+ID4gPiArCXNwaW5fbG9jaygmbW1uX21tLT5sb2NrKTsKPiA+ID4g
KwlpZiAobW1uX21tLT5hY3RpdmVfaW52YWxpZGF0ZV9yYW5nZXMpIHsKPiA+ID4gKwkJaWYgKG1u
X2l0cmVlX2lzX2ludmFsaWRhdGluZyhtbW5fbW0pKQo+ID4gPiArCQkJaGxpc3RfYWRkX2hlYWQo
Jm1ybi0+ZGVmZXJyZWRfaXRlbSwKPiA+ID4gKwkJCQkgICAgICAgJm1tbl9tbS0+ZGVmZXJyZWRf
bGlzdCk7Cj4gPiA+ICsJCWVsc2Ugewo+ID4gPiArCQkJbW1uX21tLT5pbnZhbGlkYXRlX3NlcSB8
PSAxOwo+ID4gPiArCQkJaW50ZXJ2YWxfdHJlZV9pbnNlcnQoJm1ybi0+aW50ZXJ2YWxfdHJlZSwK
PiA+ID4gKwkJCQkJICAgICAmbW1uX21tLT5pdHJlZSk7Cj4gPiA+ICsJCX0KPiA+ID4gKwkJbXJu
LT5pbnZhbGlkYXRlX3NlcSA9IG1tbl9tbS0+aW52YWxpZGF0ZV9zZXE7Cj4gPiA+ICsJfSBlbHNl
IHsKPiA+ID4gKwkJV0FSTl9PTihtbl9pdHJlZV9pc19pbnZhbGlkYXRpbmcobW1uX21tKSk7Cj4g
PiA+ICsJCW1ybi0+aW52YWxpZGF0ZV9zZXEgPSBtbW5fbW0tPmludmFsaWRhdGVfc2VxIC0gMTsK
PiA+IAo+ID4gT2hoaCwgY2hlY2ttYXRlLiBJIGxvc2UuIFdoeSBpcyAqc3VidHJhY3RpbmcqIHRo
ZSByaWdodCB0aGluZyB0byBkbwo+ID4gZm9yIHNlcSBudW1iZXJzIGhlcmU/ICBJJ20gYWN1dGVs
eSB1bmhhcHB5IHRyeWluZyB0byBmaWd1cmUgdGhpcyBvdXQuCj4gPiBJIHN1c3BlY3QgaXQncyBh
bm90aGVyIHVuZm9ydHVuYXRlIHNpZGUgZWZmZWN0IG9mIHRyeWluZyB0byB1c2UgdGhlCj4gPiBs
b3dlciBiaXQgb2YgdGhlIHNlcSBudW1iZXIgKGV2ZW4vb2RkKSBmb3Igc29tZXRoaW5nIGVsc2Uu
Cj4gCj4gSWYgdGhlcmUgaXMgbm8gbW1uX21tLT5hY3RpdmVfaW52YWxpZGF0ZV9yYW5nZXMgdGhl
biBpdCBtZWFucyB0aGF0Cj4gbW1uX21tLT5pbnZhbGlkYXRlX3NlcSBpcyBldmVuIGFuZCB0aHVz
IG1tbl9tbS0+aW52YWxpZGF0ZV9zZXEgLSAxCj4gaXMgYW4gb2RkIG51bWJlciB3aGljaCBtZWFu
cyB0aGF0IG1ybi0+aW52YWxpZGF0ZV9zZXEgaXMgaW5pdGlhbGl6ZWQKPiB0byBvZGQgdmFsdWUg
YW5kIGlmIHlvdSBmb2xsb3cgdGhlIHJ1bGUgZm9yIGNhbGxpbmcgbW11X3JhbmdlX3NldF9zZXEo
KQo+IHRoZW4gaXQgd2lsbCBfYWx3YXlzXyBiZSBhbiBvZGQgbnVtYmVyIGFuZCB0aGlzIGNsb3Nl
IHRoZSBsb29wIHdpdGgKPiB0aGUgYWJvdmUgY29tbWVudHMgOikKClRoZSBrZXkgdGhpbmcgaXMg
dGhhdCBpdCBpcyBhbiBvZGQgdmFsdWUgdGhhdCB3aWxsIHRha2UgYSBsb25nIHRpbWUKYmVmb3Jl
IG1tbl9tbS0+aW52YWxpZGF0ZSBzZXEgcmVhY2hlcyBpdAoKPiA+ID4gKwltaWdodF9sb2NrKCZt
bS0+bW1hcF9zZW0pOwo+ID4gPiArCj4gPiA+ICsJbW1uX21tID0gc21wX2xvYWRfYWNxdWlyZSgm
bW0tPm1tdV9ub3RpZmllcl9tbSk7Cj4gPiAKPiA+IFdoYXQgZG9lcyB0aGUgYWJvdmUgcGFpciB3
aXRoPyBTaG91bGQgaGF2ZSBhIGNvbW1lbnQgdGhhdCBzcGVjaWZpZXMgdGhhdC4KPiAKPiBJdCB3
YXMgZGlzY3Vzc2VkIGluIHYxIGJ1dCBtYXliZSBhIGNvbW1lbnQgb2Ygd2hhdCB3YXMgc2FpZCBi
YWNrIHRoZW4gd291bGQKPiBiZSBoZWxwZnVsLiBTb21ldGhpbmcgbGlrZToKPiAKPiAvKgo+ICAq
IFdlIG5lZWQgdG8gaW5zdXJlIHRoYXQgYWxsIHdyaXRlcyB0byBtbS0+bW11X25vdGlmaWVyX21t
IGFyZSB2aXNpYmxlIGJlZm9yZQo+ICAqIGFueSBjaGVja3Mgd2UgZG8gb24gbW1uX21tIGJlbG93
IGFzIG90aGVyd2lzZSBDUFUgbWlnaHQgcmUtb3JkZXIgd3JpdGUgZG9uZQo+ICAqIGJ5IGFub3Ro
ZXIgQ1BVIGNvcmUgdG8gbW0tPm1tdV9ub3RpZmllcl9tbSBzdHJ1Y3R1cmUgZmllbGRzIGFmdGVy
IHRoZSByZWFkCj4gICogYmVsb3dzLgo+ICAqLwoKVGhpcyBjb21tZW50IG1hZGUgaXQsIGp1c3Qg
YXQgdGhlIHN0b3JlIHNpZGU6CgoJLyoKCSAqIFNlcmlhbGl6ZSB0aGUgdXBkYXRlIGFnYWluc3Qg
bW11X25vdGlmaWVyX3VucmVnaXN0ZXIuIEEKCSAqIHNpZGUgbm90ZTogbW11X25vdGlmaWVyX3Jl
bGVhc2UgY2FuJ3QgcnVuIGNvbmN1cnJlbnRseSB3aXRoCgkgKiB1cyBiZWNhdXNlIHdlIGhvbGQg
dGhlIG1tX3VzZXJzIHBpbiAoZWl0aGVyIGltcGxpY2l0bHkgYXMKCSAqIGN1cnJlbnQtPm1tIG9y
IGV4cGxpY2l0bHkgd2l0aCBnZXRfdGFza19tbSgpIG9yIHNpbWlsYXIpLgoJICogV2UgY2FuJ3Qg
cmFjZSBhZ2FpbnN0IGFueSBvdGhlciBtbXUgbm90aWZpZXIgbWV0aG9kIGVpdGhlcgoJICogdGhh
bmtzIHRvIG1tX3Rha2VfYWxsX2xvY2tzKCkuCgkgKgoJICogcmVsZWFzZSBzZW1hbnRpY3Mgb24g
dGhlIGluaXRpYWxpemF0aW9uIG9mIHRoZSBtbXVfbm90aWZpZXJfbW0ncwogICAgICAgICAqIGNv
bnRlbnRzIGFyZSBwcm92aWRlZCBmb3IgdW5sb2NrZWQgcmVhZGVycy4gIGFjcXVpcmUgY2FuIG9u
bHkgYmUKICAgICAgICAgKiB1c2VkIHdoaWxlIGhvbGRpbmcgdGhlIG1tZ3JhYiBvciBtbWdldCwg
YW5kIGlzIHNhZmUgYmVjYXVzZSBvbmNlCiAgICAgICAgICogY3JlYXRlZCB0aGUgbW11X25vdGlm
aWZlcl9tbSBpcyBub3QgZnJlZWQgdW50aWwgdGhlIG1tIGlzCiAgICAgICAgICogZGVzdHJveWVk
LiAgQXMgYWJvdmUsIHVzZXJzIGhvbGRpbmcgdGhlIG1tYXBfc2VtIG9yIG9uZSBvZiB0aGUKICAg
ICAgICAgKiBtbV90YWtlX2FsbF9sb2NrcygpIGRvIG5vdCBuZWVkIHRvIHVzZSBhY3F1aXJlIHNl
bWFudGljcy4KCSAqLwoJaWYgKG1tdV9ub3RpZmllcl9tbSkKCQlzbXBfc3RvcmVfcmVsZWFzZSgm
bW0tPm1tdV9ub3RpZmllcl9tbSwgbW11X25vdGlmaWVyX21tKTsKCldoaWNoIEkgdGhpbmsgaXMg
cmVhbGx5IG92ZXJseSBiZWxhYm9yaW5nIHRoZSB0eXBpY2FsIHNtcApzdG9yZS9yZWxlYXNlIHBh
dHRlcm4sIGJ1dCBwZW9wbGUgZG8gc2VlbSB1bmZhbWlsaWFyIHdpdGggdGhlbS4uLgoKVGhhbmtz
LApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
