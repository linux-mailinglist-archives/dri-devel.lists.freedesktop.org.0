Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A682FAEE5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 11:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442296ECCA;
	Wed, 13 Nov 2019 10:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AF36ECCA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 10:50:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91AAEB320;
 Wed, 13 Nov 2019 10:50:23 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 550261E1498; Wed, 13 Nov 2019 11:50:23 +0100 (CET)
Date: Wed, 13 Nov 2019 11:50:23 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 03/23] mm/gup: move try_get_compound_head() to top,
 fix minor issues
Message-ID: <20191113105023.GG6367@quack2.suse.cz>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-4-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-4-jhubbard@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
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

T24gVHVlIDEyLTExLTE5IDIwOjI2OjUwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gQW4gdXBjb21p
bmcgcGF0Y2ggdXNlcyB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQoKSBtb3JlIHdpZGVseSwKPiBzbyBt
b3ZlIGl0IHRvIHRoZSB0b3Agb2YgZ3VwLmMuCj4gCj4gQWxzbyBmaXggYSB0aW55IHNwZWxsaW5n
IGVycm9yIGFuZCBhIGNoZWNrcGF0Y2gucGwgd2FybmluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CgpMb29rcyBnb29kLiBZb3UgY2FuIGFk
ZDoKClJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgoKCQkJCQkJCQlIb256YQoK
PiAtLS0KPiAgbW0vZ3VwLmMgfCAyOSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL21tL2d1cC5jIGIvbW0vZ3VwLmMKPiBpbmRleCAxOTlkYTk5ZThmZmMuLjkzMzUy
NGRlNjI0OSAxMDA2NDQKPiAtLS0gYS9tbS9ndXAuYwo+ICsrKyBiL21tL2d1cC5jCj4gQEAgLTI5
LDYgKzI5LDIxIEBAIHN0cnVjdCBmb2xsb3dfcGFnZV9jb250ZXh0IHsKPiAgCXVuc2lnbmVkIGlu
dCBwYWdlX21hc2s7Cj4gIH07Cj4gIAo+ICsvKgo+ICsgKiBSZXR1cm4gdGhlIGNvbXBvdW5kIGhl
YWQgcGFnZSB3aXRoIHJlZiBhcHByb3ByaWF0ZWx5IGluY3JlbWVudGVkLAo+ICsgKiBvciBOVUxM
IGlmIHRoYXQgZmFpbGVkLgo+ICsgKi8KPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZSAqdHJ5
X2dldF9jb21wb3VuZF9oZWFkKHN0cnVjdCBwYWdlICpwYWdlLCBpbnQgcmVmcykKPiArewo+ICsJ
c3RydWN0IHBhZ2UgKmhlYWQgPSBjb21wb3VuZF9oZWFkKHBhZ2UpOwo+ICsKPiArCWlmIChXQVJO
X09OX09OQ0UocGFnZV9yZWZfY291bnQoaGVhZCkgPCAwKSkKPiArCQlyZXR1cm4gTlVMTDsKPiAr
CWlmICh1bmxpa2VseSghcGFnZV9jYWNoZV9hZGRfc3BlY3VsYXRpdmUoaGVhZCwgcmVmcykpKQo+
ICsJCXJldHVybiBOVUxMOwo+ICsJcmV0dXJuIGhlYWQ7Cj4gK30KPiArCj4gIC8qKgo+ICAgKiBw
dXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkgLSByZWxlYXNlIGFuZCBvcHRpb25hbGx5IGRpcnR5
IGd1cC1waW5uZWQgcGFnZXMKPiAgICogQHBhZ2VzOiAgYXJyYXkgb2YgcGFnZXMgdG8gYmUgbWF5
YmUgbWFya2VkIGRpcnR5LCBhbmQgZGVmaW5pdGVseSByZWxlYXNlZC4KPiBAQCAtMTc5MywyMCAr
MTgwOCw2IEBAIHN0YXRpYyB2b2lkIF9fbWF5YmVfdW51c2VkIHVuZG9fZGV2X3BhZ2VtYXAoaW50
ICpuciwgaW50IG5yX3N0YXJ0LAo+ICAJfQo+ICB9Cj4gIAo+IC0vKgo+IC0gKiBSZXR1cm4gdGhl
IGNvbXB1bmQgaGVhZCBwYWdlIHdpdGggcmVmIGFwcHJvcHJpYXRlbHkgaW5jcmVtZW50ZWQsCj4g
LSAqIG9yIE5VTEwgaWYgdGhhdCBmYWlsZWQuCj4gLSAqLwo+IC1zdGF0aWMgaW5saW5lIHN0cnVj
dCBwYWdlICp0cnlfZ2V0X2NvbXBvdW5kX2hlYWQoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCByZWZz
KQo+IC17Cj4gLQlzdHJ1Y3QgcGFnZSAqaGVhZCA9IGNvbXBvdW5kX2hlYWQocGFnZSk7Cj4gLQlp
ZiAoV0FSTl9PTl9PTkNFKHBhZ2VfcmVmX2NvdW50KGhlYWQpIDwgMCkpCj4gLQkJcmV0dXJuIE5V
TEw7Cj4gLQlpZiAodW5saWtlbHkoIXBhZ2VfY2FjaGVfYWRkX3NwZWN1bGF0aXZlKGhlYWQsIHJl
ZnMpKSkKPiAtCQlyZXR1cm4gTlVMTDsKPiAtCXJldHVybiBoZWFkOwo+IC19Cj4gLQo+ICAjaWZk
ZWYgQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMCj4gIHN0YXRpYyBpbnQgZ3VwX3B0ZV9yYW5n
ZShwbWRfdCBwbWQsIHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBlbmQsCj4gIAkJ
CSB1bnNpZ25lZCBpbnQgZmxhZ3MsIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCj4gLS0g
Cj4gMi4yNC4wCj4gCi0tIApKYW4gS2FyYSA8amFja0BzdXNlLmNvbT4KU1VTRSBMYWJzLCBDUgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
