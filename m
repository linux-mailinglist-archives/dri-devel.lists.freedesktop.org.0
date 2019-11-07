Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 424EFF2559
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 03:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9F96EE6E;
	Thu,  7 Nov 2019 02:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA866EE6E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 02:26:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 18:26:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,276,1569308400"; d="scan'208";a="227685256"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga004.fm.intel.com with ESMTP; 06 Nov 2019 18:26:48 -0800
Date: Wed, 6 Nov 2019 18:26:48 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 07/18] infiniband: set FOLL_PIN, FOLL_LONGTERM via
 pin_longterm_pages*()
Message-ID: <20191107022647.GC32084@iweiny-DESK2.sc.intel.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-8-jhubbard@nvidia.com>
 <20191104203346.GF30938@ziepe.ca>
 <578c1760-7221-4961-9f7d-c07c22e5c259@nvidia.com>
 <20191104205738.GH30938@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104205738.GH30938@ziepe.ca>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDQ6NTc6MzhQTSAtMDQwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIE1vbiwgTm92IDA0LCAyMDE5IGF0IDEyOjQ4OjEzUE0gLTA4MDAsIEpvaG4g
SHViYmFyZCB3cm90ZToKPiA+IE9uIDExLzQvMTkgMTI6MzMgUE0sIEphc29uIEd1bnRob3JwZSB3
cm90ZToKPiA+IC4uLgo+ID4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3Jl
L3VtZW0uYyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYwo+ID4gPj4gaW5kZXggMjQy
NDRhMmY2OGNjLi5jNWE3OGQzZTY3NGIgMTAwNjQ0Cj4gPiA+PiArKysgYi9kcml2ZXJzL2luZmlu
aWJhbmQvY29yZS91bWVtLmMKPiA+ID4+IEBAIC0yNzIsMTEgKzI3MiwxMCBAQCBzdHJ1Y3QgaWJf
dW1lbSAqaWJfdW1lbV9nZXQoc3RydWN0IGliX3VkYXRhICp1ZGF0YSwgdW5zaWduZWQgbG9uZyBh
ZGRyLAo+ID4gPj4gIAo+ID4gPj4gIAl3aGlsZSAobnBhZ2VzKSB7Cj4gPiA+PiAgCQlkb3duX3Jl
YWQoJm1tLT5tbWFwX3NlbSk7Cj4gPiA+PiAtCQlyZXQgPSBnZXRfdXNlcl9wYWdlcyhjdXJfYmFz
ZSwKPiA+ID4+ICsJCXJldCA9IHBpbl9sb25ndGVybV9wYWdlcyhjdXJfYmFzZSwKPiA+ID4+ICAJ
CQkJICAgICBtaW5fdCh1bnNpZ25lZCBsb25nLCBucGFnZXMsCj4gPiA+PiAgCQkJCQkgICBQQUdF
X1NJWkUgLyBzaXplb2YgKHN0cnVjdCBwYWdlICopKSwKPiA+ID4+IC0JCQkJICAgICBndXBfZmxh
Z3MgfCBGT0xMX0xPTkdURVJNLAo+ID4gPj4gLQkJCQkgICAgIHBhZ2VfbGlzdCwgTlVMTCk7Cj4g
PiA+PiArCQkJCSAgICAgZ3VwX2ZsYWdzLCBwYWdlX2xpc3QsIE5VTEwpOwo+ID4gPiAKPiA+ID4g
RldJVywgdGhpcyBvbmUgc2hvdWxkIGJlIGNvbnZlcnRlZCB0byBmYXN0IGFzIHdlbGwsIEkgdGhp
bmsgd2UgZmluYWxseQo+ID4gPiBnb3QgcmlkIG9mIGFsbCB0aGUgYmxvY2tlcnMgZm9yIHRoYXQ/
Cj4gPiA+IAo+ID4gCj4gPiBJJ20gbm90IGF3YXJlIG9mIGFueSBibG9ja2VycyBvbiB0aGUgZ3Vw
LmMgZW5kLCBhbnl3YXkuIFRoZSBvbmx5IGJyb2tlbiB0aGluZyB3ZQo+ID4gaGF2ZSB0aGVyZSBp
cyAiZ3VwIHJlbW90ZSArIEZPTExfTE9OR1RFUk0iLiBCdXQgd2UgY2FuIGRvICJndXAgZmFzdCAr
IExPTkdURVJNIi4gCj4gCj4gSSBtZWFuIHRoZSB1c2Ugb2YgdGhlIG1tYXBfc2VtIGhlcmUgaXMg
ZmluYWxseSBpbiBhIHdheSB3aGVyZSB3ZSBjYW4KPiBqdXN0IGRlbGV0ZSB0aGUgbW1hcF9zZW0g
YW5kIHVzZSBfZmFzdAoKWWF5ISAgSSBhZ3JlZSBpZiB3ZSBjYW4gZG8gdGhpcyB3ZSBzaG91bGQu
CgpUaGFua3MsCklyYQoKPiAgCj4gaWUsIEFGQUlLIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZSBt
bWFwX3NlbSB0byBiZSBoZWxkIGR1cmluZwo+IGliX3VtZW1fYWRkX3NnX3RhYmxlKCkKPiAKPiBU
aGlzIHNob3VsZCBwcm9iYWJseSBiZSBhIHN0YW5kYWxvbmUgcGF0Y2ggaG93ZXZlcgo+IAo+IEph
c29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
