Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292310234A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 12:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C16A6E89E;
	Tue, 19 Nov 2019 11:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A666E89E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 11:37:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8BC3DBCC5;
 Tue, 19 Nov 2019 11:37:52 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1D7961E47E5; Tue, 19 Nov 2019 12:37:46 +0100 (CET)
Date: Tue, 19 Nov 2019 12:37:46 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v6 17/24] mm/gup: track FOLL_PIN pages
Message-ID: <20191119113746.GD25605@quack2.suse.cz>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
 <20191119081643.1866232-18-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191119081643.1866232-18-jhubbard@nvidia.com>
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

T24gVHVlIDE5LTExLTE5IDAwOjE2OjM2LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gQEAgLTIwMjUs
NiArMjE0OSwyMCBAQCBzdGF0aWMgaW50IF9fcmVjb3JkX3N1YnBhZ2VzKHN0cnVjdCBwYWdlICpw
YWdlLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gIAlyZXR1cm4gbnI7Cj4gIH0KPiAgCj4gK3N0YXRp
YyBib29sIF9fcGluX2NvbXBvdW5kX2hlYWQoc3RydWN0IHBhZ2UgKmhlYWQsIGludCByZWZzLCB1
bnNpZ25lZCBpbnQgZmxhZ3MpCj4gK3sKCkkgZG9uJ3QgcXVpdGUgbGlrZSB0aGUgcHJvbGlmZXJh
dGlvbiBvZiBuYW1lcyBzdGFydGluZyB3aXRoIF9fLiBJIGRvbid0CnRoaW5rIHRoZXJlJ3MgYSBn
b29kIHJlYXNvbiBmb3IgdGhhdCwgcGFydGljdWxhcmx5IGluIHRoaXMgY2FzZS4gQWxzbyAncGlu
JwpoZXJlIGlzIHNvbWV3aGF0IG1pc2xlYWRpbmcgYXMgd2UgYWxyZWFkeSB1c2UgdGVybSAicGlu
IiBmb3IgdGhlIHBhcnRpY3VsYXIKd2F5IG9mIHBpbm5pbmcgdGhlIHBhZ2UuIFdlIGNvdWxkIGhh
dmUgZ3JhYl9jb21wb3VuZF9oZWFkKCkgb3IgbWF5YmUKbmFpbF9jb21wb3VuZF9oZWFkKCkgOiks
IGJ1dCB5b3UncmUgbmF0aXZlIHNwZWFrZXIgc28geW91IG1heSBjb21lIHVwIHdpdGgKYmV0dGVy
IHdvcmQuCgo+ICsJaWYgKGZsYWdzICYgRk9MTF9QSU4pIHsKPiArCQlpZiAodW5saWtlbHkoIXRy
eV9waW5fY29tcG91bmRfaGVhZChoZWFkLCByZWZzKSkpCj4gKwkJCXJldHVybiBmYWxzZTsKPiAr
CX0gZWxzZSB7Cj4gKwkJaGVhZCA9IHRyeV9nZXRfY29tcG91bmRfaGVhZChoZWFkLCByZWZzKTsK
PiArCQlpZiAoIWhlYWQpCj4gKwkJCXJldHVybiBmYWxzZTsKPiArCX0KPiArCj4gKwlyZXR1cm4g
dHJ1ZTsKPiArfQo+ICsKPiAgc3RhdGljIHZvaWQgcHV0X2NvbXBvdW5kX2hlYWQoc3RydWN0IHBh
Z2UgKnBhZ2UsIGludCByZWZzKQo+ICB7Cj4gIAkvKiBEbyBhIGdldF9wYWdlKCkgZmlyc3QsIGlu
IGNhc2UgcmVmcyA9PSBwYWdlLT5fcmVmY291bnQgKi8KCnB1dF9jb21wb3VuZF9oZWFkKCkgbmVl
ZHMgc2ltaWxhciB0cmVhdG1lbnQgYXMgdW5kb19kZXZfcGFnZW1hcCgpLCBkb2Vzbid0Cml0PwoK
PiBAQCAtOTY4LDcgKzk3MywxOCBAQCBzdHJ1Y3QgcGFnZSAqZm9sbG93X2Rldm1hcF9wbWQoc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgCWlmICghKnBn
bWFwKQo+ICAJCXJldHVybiBFUlJfUFRSKC1FRkFVTFQpOwo+ICAJcGFnZSA9IHBmbl90b19wYWdl
KHBmbik7Cj4gLQlnZXRfcGFnZShwYWdlKTsKPiArCj4gKwlpZiAoZmxhZ3MgJiBGT0xMX0dFVCkK
PiArCQlnZXRfcGFnZShwYWdlKTsKPiArCWVsc2UgaWYgKGZsYWdzICYgRk9MTF9QSU4pIHsKPiAr
CQkvKgo+ICsJCSAqIHRyeV9waW5fcGFnZSgpIGlzIG5vdCBhY3R1YWxseSBleHBlY3RlZCB0byBm
YWlsIGhlcmUgYmVjYXVzZQo+ICsJCSAqIHdlIGhvbGQgdGhlIHBtZCBsb2NrIHNvIG5vIG9uZSBj
YW4gdW5tYXAgdGhlIHBtZCBhbmQgZnJlZSB0aGUKPiArCQkgKiBwYWdlIHRoYXQgaXQgcG9pbnRz
IHRvLgo+ICsJCSAqLwo+ICsJCWlmICh1bmxpa2VseSghdHJ5X3Bpbl9wYWdlKHBhZ2UpKSkKPiAr
CQkJcGFnZSA9IEVSUl9QVFIoLUVGQVVMVCk7Cj4gKwl9CgpUaGlzIHBhdHRlcm4gaXMgcmF0aGVy
IGNvbW1vbi4gU28gbWF5YmUgSSdkIGFkZCBhIGhlbHBlciBncmFiX3BhZ2UocGFnZSwKZmxhZ3Mp
IGRvaW5nCgoJaWYgKGZsYWdzICYgRk9MTF9HRVQpCgkJZ2V0X3BhZ2UocGFnZSk7CgllbHNlIGlm
IChmbGFncyAmIEZPTExfUElOKQoJCXJldHVybiB0cnlfcGluX3BhZ2UocGFnZSk7CglyZXR1cm4g
dHJ1ZTsKCk90aGVyd2lzZSB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZSBub3cuCgoJCQkJCQkJ
CUhvbnphCi0tIApKYW4gS2FyYSA8amFja0BzdXNlLmNvbT4KU1VTRSBMYWJzLCBDUgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
