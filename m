Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FA1E0380
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 13:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3415C6E5EF;
	Tue, 22 Oct 2019 11:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32FF6E5EF;
 Tue, 22 Oct 2019 11:56:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 04:56:17 -0700
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="191437251"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.201.232])
 ([10.254.201.232])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 22 Oct 2019 04:56:15 -0700
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <5fdbcda8-c6ec-70aa-3f89-147fe67152f2@intel.com>
 <20191021165828.GA6285@mellanox.com>
From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <35d803f3-a24a-8a5f-745b-52c2f9876b7c@intel.com>
Date: Tue, 22 Oct 2019 07:56:12 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021165828.GA6285@mellanox.com>
Content-Language: en-US
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMjEvMjAxOSAxMjo1OCBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIE1vbiwg
T2N0IDIxLCAyMDE5IGF0IDExOjU1OjUxQU0gLTA0MDAsIERlbm5pcyBEYWxlc3NhbmRybyB3cm90
ZToKPj4gT24gMTAvMTUvMjAxOSAyOjEyIFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+PiBU
aGlzIGlzIHN0aWxsIGJlaW5nIHRlc3RlZCwgYnV0IEkgZmlndXJlZCB0byBzZW5kIGl0IHRvIHN0
YXJ0IGdldHRpbmcgaGVscAo+Pj4gZnJvbSB0aGUgeGVuLCBhbWQgYW5kIGhmaSBkcml2ZXJzIHdo
aWNoIEkgY2Fubm90IHRlc3QgaGVyZS4KPj4KPj4gU29ycnkgZm9yIHRoZSBkZWxheSwgSSBuZXZl
ciBzZWVuIHRoaXMuIFdhcyBub3Qgb24gQ2MgbGlzdCBhbmQgZGlkbid0Cj4+IHJlZ2lzdGVyIHRv
IG1lIGl0IGltcGFjdGVkIGhmaS4gSSdsbCB0YWtlIGEgbG9vayBhbmQgcnVuIGl0IHRocm91Z2gg
c29tZQo+PiBoZmkxIHRlc3RzLgo+IAo+IEhtLCB5b3Ugd2VyZSBjYydkIG9uIHRoZSBoZmkxIHBh
dGNoIG9mIHRoZSBzZXJpZXM6Cj4gCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRj
aC8xMTE5MTM5NS8KPiAKPiBTbyB5b3Ugc2F3IHRoYXQsIHJpZ2h0PwoKSSBkbyBub3cuCgo+IEJ1
dCBpdCBzZWVtcyB0aGF0IGdpdCBzZW5kLWVtYWlsIGRpZG4ndCBwdWxsIGFsbCB0aGUgY2MncyB0
b2dldGhlcj8KCkkgZG9uJ3Qga25vdy4gSSB0aG91Z2h0IGl0IGRpZCwgYXQgb25lIHRpbWUgSSBy
ZWNhbGwgdHJ5aW5nIHRvIGdldCBpdCAKKm5vdCogdG8gZG8gdGhhdCwgd2hlbiBwcmVwYXJpbmcg
c29tZSBpbnRlcm5hbCByZXZpZXdzLiBIYXZlbid0IHVzZWQgaXQgCmZvciBhIGxvbmcgdGltZSB0
aG91Z2gsIEkndmUgYmVlbiB1c2luZyBzdGdpdC4KCkF0IGFueSByYXRlIGNhbiB5b3UgZ2l2ZSBt
ZSBhIFNIQSBvciBicmFuY2ggdGhpcyBhcHBsaWVzIG9uIHRvcCBvZj8gSSAKaGF2ZSBwdWxsZWQg
cmRtYS9obW0sIHJkbWEvd2lwL2pnZywgbGludXMvbWFzdGVyIGJ1dCBzZWVtIHRvIGhhdmUgY29u
ZmxpY3RzLgoKLURlbm55CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
