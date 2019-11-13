Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8583CFB7BE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 19:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CD16E030;
	Wed, 13 Nov 2019 18:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38986E030
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 18:38:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 10:38:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="207879666"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga006.jf.intel.com with ESMTP; 13 Nov 2019 10:38:23 -0800
Date: Wed, 13 Nov 2019 10:38:23 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 03/23] mm/gup: move try_get_compound_head() to top,
 fix minor issues
Message-ID: <20191113183822.GC12699@iweiny-DESK2.sc.intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-4-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-4-jhubbard@nvidia.com>
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
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
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

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDg6MjY6NTBQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IEFuIHVwY29taW5nIHBhdGNoIHVzZXMgdHJ5X2dldF9jb21wb3VuZF9oZWFkKCkgbW9y
ZSB3aWRlbHksCj4gc28gbW92ZSBpdCB0byB0aGUgdG9wIG9mIGd1cC5jLgo+IAo+IEFsc28gZml4
IGEgdGlueSBzcGVsbGluZyBlcnJvciBhbmQgYSBjaGVja3BhdGNoLnBsIHdhcm5pbmcuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKU2ltcGxl
IGVub3VnaC4uLgoKUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4K
Cj4gLS0tCj4gIG1tL2d1cC5jIHwgMjkgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1cC5jCj4gaW5kZXggMTk5ZGE5OWU4ZmZjLi45MzM1
MjRkZTYyNDkgMTAwNjQ0Cj4gLS0tIGEvbW0vZ3VwLmMKPiArKysgYi9tbS9ndXAuYwo+IEBAIC0y
OSw2ICsyOSwyMSBAQCBzdHJ1Y3QgZm9sbG93X3BhZ2VfY29udGV4dCB7Cj4gIAl1bnNpZ25lZCBp
bnQgcGFnZV9tYXNrOwo+ICB9Owo+ICAKPiArLyoKPiArICogUmV0dXJuIHRoZSBjb21wb3VuZCBo
ZWFkIHBhZ2Ugd2l0aCByZWYgYXBwcm9wcmlhdGVseSBpbmNyZW1lbnRlZCwKPiArICogb3IgTlVM
TCBpZiB0aGF0IGZhaWxlZC4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2UgKnRy
eV9nZXRfY29tcG91bmRfaGVhZChzdHJ1Y3QgcGFnZSAqcGFnZSwgaW50IHJlZnMpCj4gK3sKPiAr
CXN0cnVjdCBwYWdlICpoZWFkID0gY29tcG91bmRfaGVhZChwYWdlKTsKPiArCj4gKwlpZiAoV0FS
Tl9PTl9PTkNFKHBhZ2VfcmVmX2NvdW50KGhlYWQpIDwgMCkpCj4gKwkJcmV0dXJuIE5VTEw7Cj4g
KwlpZiAodW5saWtlbHkoIXBhZ2VfY2FjaGVfYWRkX3NwZWN1bGF0aXZlKGhlYWQsIHJlZnMpKSkK
PiArCQlyZXR1cm4gTlVMTDsKPiArCXJldHVybiBoZWFkOwo+ICt9Cj4gKwo+ICAvKioKPiAgICog
cHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpIC0gcmVsZWFzZSBhbmQgb3B0aW9uYWxseSBkaXJ0
eSBndXAtcGlubmVkIHBhZ2VzCj4gICAqIEBwYWdlczogIGFycmF5IG9mIHBhZ2VzIHRvIGJlIG1h
eWJlIG1hcmtlZCBkaXJ0eSwgYW5kIGRlZmluaXRlbHkgcmVsZWFzZWQuCj4gQEAgLTE3OTMsMjAg
KzE4MDgsNiBAQCBzdGF0aWMgdm9pZCBfX21heWJlX3VudXNlZCB1bmRvX2Rldl9wYWdlbWFwKGlu
dCAqbnIsIGludCBucl9zdGFydCwKPiAgCX0KPiAgfQo+ICAKPiAtLyoKPiAtICogUmV0dXJuIHRo
ZSBjb21wdW5kIGhlYWQgcGFnZSB3aXRoIHJlZiBhcHByb3ByaWF0ZWx5IGluY3JlbWVudGVkLAo+
IC0gKiBvciBOVUxMIGlmIHRoYXQgZmFpbGVkLgo+IC0gKi8KPiAtc3RhdGljIGlubGluZSBzdHJ1
Y3QgcGFnZSAqdHJ5X2dldF9jb21wb3VuZF9oZWFkKHN0cnVjdCBwYWdlICpwYWdlLCBpbnQgcmVm
cykKPiAtewo+IC0Jc3RydWN0IHBhZ2UgKmhlYWQgPSBjb21wb3VuZF9oZWFkKHBhZ2UpOwo+IC0J
aWYgKFdBUk5fT05fT05DRShwYWdlX3JlZl9jb3VudChoZWFkKSA8IDApKQo+IC0JCXJldHVybiBO
VUxMOwo+IC0JaWYgKHVubGlrZWx5KCFwYWdlX2NhY2hlX2FkZF9zcGVjdWxhdGl2ZShoZWFkLCBy
ZWZzKSkpCj4gLQkJcmV0dXJuIE5VTEw7Cj4gLQlyZXR1cm4gaGVhZDsKPiAtfQo+IC0KPiAgI2lm
ZGVmIENPTkZJR19BUkNIX0hBU19QVEVfU1BFQ0lBTAo+ICBzdGF0aWMgaW50IGd1cF9wdGVfcmFu
Z2UocG1kX3QgcG1kLCB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgZW5kLAo+ICAJ
CQkgdW5zaWduZWQgaW50IGZsYWdzLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQo+IC0t
IAo+IDIuMjQuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
