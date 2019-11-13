Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46831FB794
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 19:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6AC6EDE0;
	Wed, 13 Nov 2019 18:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6E76EDE0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 18:31:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 10:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="355555407"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga004.jf.intel.com with ESMTP; 13 Nov 2019 10:31:38 -0800
Date: Wed, 13 Nov 2019 10:31:38 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v4 09/23] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191113183137.GA12699@iweiny-DESK2.sc.intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-10-jhubbard@nvidia.com>
 <20191113104308.GE6367@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113104308.GE6367@quack2.suse.cz>
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
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
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

PiA+ICsvKioKPiA+ICsgKiBwaW5fdXNlcl9wYWdlc19mYXN0KCkgLSBwaW4gdXNlciBwYWdlcyBp
biBtZW1vcnkgd2l0aG91dCB0YWtpbmcgbG9ja3MKPiA+ICsgKgo+ID4gKyAqIE5lYXJseSB0aGUg
c2FtZSBhcyBnZXRfdXNlcl9wYWdlc19mYXN0KCksIGV4Y2VwdCB0aGF0IEZPTExfUElOIGlzIHNl
dC4gU2VlCj4gPiArICogZ2V0X3VzZXJfcGFnZXNfZmFzdCgpIGZvciBkb2N1bWVudGF0aW9uIG9u
IHRoZSBmdW5jdGlvbiBhcmd1bWVudHMsIGJlY2F1c2UKPiA+ICsgKiB0aGUgYXJndW1lbnRzIGhl
cmUgYXJlIGlkZW50aWNhbC4KPiA+ICsgKgo+ID4gKyAqIEZPTExfUElOIG1lYW5zIHRoYXQgdGhl
IHBhZ2VzIG11c3QgYmUgcmVsZWFzZWQgdmlhIHB1dF91c2VyX3BhZ2UoKS4gUGxlYXNlCj4gPiAr
ICogc2VlIERvY3VtZW50YXRpb24vdm0vcGluX3VzZXJfcGFnZXMucnN0IGZvciBmdXJ0aGVyIGRl
dGFpbHMuCj4gPiArICoKPiA+ICsgKiBUaGlzIGlzIGludGVuZGVkIGZvciBDYXNlIDEgKERJTykg
aW4gRG9jdW1lbnRhdGlvbi92bS9waW5fdXNlcl9wYWdlcy5yc3QuIEl0Cj4gPiArICogaXMgTk9U
IGludGVuZGVkIGZvciBDYXNlIDIgKFJETUE6IGxvbmctdGVybSBwaW5zKS4KPiA+ICsgKi8KPiA+
ICtpbnQgcGluX3VzZXJfcGFnZXNfZmFzdCh1bnNpZ25lZCBsb25nIHN0YXJ0LCBpbnQgbnJfcGFn
ZXMsCj4gPiArCQkJdW5zaWduZWQgaW50IGd1cF9mbGFncywgc3RydWN0IHBhZ2UgKipwYWdlcykK
PiA+ICt7Cj4gPiArCS8qIEZPTExfR0VUIGFuZCBGT0xMX1BJTiBhcmUgbXV0dWFsbHkgZXhjbHVz
aXZlLiAqLwo+ID4gKwlpZiAoV0FSTl9PTl9PTkNFKGd1cF9mbGFncyAmIEZPTExfR0VUKSkKPiA+
ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKwlndXBfZmxhZ3MgfD0gRk9MTF9QSU47Cj4g
PiArCXJldHVybiBpbnRlcm5hbF9nZXRfdXNlcl9wYWdlc19mYXN0KHN0YXJ0LCBucl9wYWdlcywg
Z3VwX2ZsYWdzLCBwYWdlcyk7Cj4gPiArfQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKHBpbl91c2Vy
X3BhZ2VzX2Zhc3QpOwo+IAo+IEkgd2FzIHNvbWV3aGF0IHdvbmRlcmluZyBhYm91dCB0aGUgbnVt
YmVyIG9mIGZ1bmN0aW9ucyB5b3UgYWRkIGhlcmUuIFNvIHdlCj4gaGF2ZToKPiAKPiBwaW5fdXNl
cl9wYWdlcygpCj4gcGluX3VzZXJfcGFnZXNfZmFzdCgpCj4gcGluX3VzZXJfcGFnZXNfcmVtb3Rl
KCkKPiAKPiBhbmQgdGhlbiBsb25ndGVybSB2YXJpYW50czoKPiAKPiBwaW5fbG9uZ3Rlcm1fcGFn
ZXMoKQo+IHBpbl9sb25ndGVybV9wYWdlc19mYXN0KCkKPiBwaW5fbG9uZ3Rlcm1fcGFnZXNfcmVt
b3RlKCkKPiAKPiBhbmQgb2J2aW91c2x5IHdlIGhhdmUgZ3VwIGxpa2U6Cj4gZ2V0X3VzZXJfcGFn
ZXMoKQo+IGdldF91c2VyX3BhZ2VzX2Zhc3QoKQo+IGdldF91c2VyX3BhZ2VzX3JlbW90ZSgpCj4g
Li4uIGFuZCBzb21lIG90aGVyIGd1cCB2YXJpYW50cyAuLi4KPiAKPiBJIHRoaW5rIHdlIHJlYWxs
eSBzaG91bGQgaGF2ZSBwaW5fKiB2cyBnZXRfKiB2YXJpYW50cyBhcyB0aGV5IGFyZSB2ZXJ5Cj4g
ZGlmZmVyZW50IGluIHRlcm1zIG9mIGd1YXJhbnRlZXMgYW5kIGFmdGVyIGNvbnZlcnNpb24sIGFu
eSB1c2Ugb2YgZ2V0XyoKPiB2YXJpYW50IGluIG5vbi1tbSBjb2RlIHNob3VsZCBiZSBjbG9zZWx5
IHNjcnV0aW5pemVkLiBPVE9IIHBpbl9sb25ndGVybV8qCj4gZG9uJ3QgbG9vayAqdGhhdCogdXNl
ZnVsIHRvIG1lIGFuZCBqdXN0IHVzaW5nIHBpbl8qIGluc3RlYWQgd2l0aAo+IEZPTExfTE9OR1RF
Uk0gZmxhZyB3b3VsZCBsb29rIE9LIHRvIG1lIGFuZCBzb21ld2hhdCByZWR1Y2UgdGhlIG51bWJl
ciBvZgo+IGZ1bmN0aW9ucyB3aGljaCBpcyBhbHJlYWR5IGxhcmdlIGVub3VnaD8gV2hhdCBkbyBw
ZW9wbGUgdGhpbms/IEkgZG9uJ3QgZmVlbAo+IHRvbyBzdHJvbmdseSBhYm91dCB0aGlzIGJ1dCB3
YW50ZWQgdG8gYnJpbmcgdGhpcyB1cC4KCkknbSBhIGJpdCBjb25jZXJuZWQgd2l0aCB0aGUgZnVu
Y3Rpb24gZXhwbG9zaW9uIG15c2VsZi4gIEkgdGhpbmsgd2hhdCB5b3UKc3VnZ2VzdCBpcyBhIGhh
cHB5IG1lZGl1bS4gIFNvIEknZCBiZSBvayB3aXRoIHRoYXQuCgpJcmEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
