Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AC7FAF75
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 12:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAAC6ECD9;
	Wed, 13 Nov 2019 11:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A676ECD9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 11:15:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 69351B4F8;
 Wed, 13 Nov 2019 11:15:23 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id D45001E1498; Wed, 13 Nov 2019 12:15:21 +0100 (CET)
Date: Wed, 13 Nov 2019 12:15:21 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 02/23] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191113111521.GI6367@quack2.suse.cz>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-3-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-3-jhubbard@nvidia.com>
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlIDEyLTExLTE5IDIwOjI2OjQ5LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gVGhlcmUgYXJl
IGZvdXIgbG9jYXRpb25zIGluIGd1cC5jIHRoYXQgaGF2ZSBhIGZhaXIgYW1vdW50IG9mIGNvZGUK
PiBkdXBsaWNhdGlvbi4gVGhpcyBtZWFucyB0aGF0IGNoYW5naW5nIG9uZSByZXF1aXJlcyBtYWtp
bmcgdGhlIHNhbWUKPiBjaGFuZ2VzIGluIGZvdXIgcGxhY2VzLCBub3QgdG8gbWVudGlvbiByZWFk
aW5nIHRoZSBzYW1lIGNvZGUgZm91cgo+IHRpbWVzLCBhbmQgd29uZGVyaW5nIGlmIHRoZXJlIGFy
ZSBzdWJ0bGUgZGlmZmVyZW5jZXMuCj4gCj4gRmFjdG9yIG91dCB0aGUgY29tbW9uIGNvZGUgaW50
byBzdGF0aWMgZnVuY3Rpb25zLCB0aHVzIHJlZHVjaW5nIHRoZQo+IG92ZXJhbGwgbGluZSBjb3Vu
dCBhbmQgdGhlIGNvZGUncyBjb21wbGV4aXR5Lgo+IAo+IEFsc28sIHRha2UgdGhlIG9wcG9ydHVu
aXR5IHRvIHNsaWdodGx5IGltcHJvdmUgdGhlIGVmZmljaWVuY3kgb2YgdGhlCj4gZXJyb3IgY2Fz
ZXMsIGJ5IGRvaW5nIGEgbWFzcyBzdWJ0cmFjdGlvbiBvZiB0aGUgcmVmY291bnQsIHN1cnJvdW5k
ZWQKPiBieSBnZXRfcGFnZSgpL3B1dF9wYWdlKCkuCj4gCj4gQWxzbywgZnVydGhlciBzaW1wbGlm
eSAoc2xpZ2h0bHkpLCBieSB3YWl0aW5nIHVudGlsIHRoZSB0aGUgc3VjY2Vzc2Z1bAo+IGVuZCBv
ZiBlYWNoIHJvdXRpbmUsIHRvIGluY3JlbWVudCAqbnIuCj4gCj4gUmV2aWV3ZWQtYnk6IErDqXLD
tG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+IENjOiBJcmEgV2VpbnkgPGlyYS53ZWlu
eUBpbnRlbC5jb20+Cj4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IENjOiBB
bmVlc2ggS3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cgo+IGRpZmYgLS1naXQgYS9t
bS9ndXAuYyBiL21tL2d1cC5jCj4gaW5kZXggODVjYWY3NmIzMDEyLi4xOTlkYTk5ZThmZmMgMTAw
NjQ0Cj4gLS0tIGEvbW0vZ3VwLmMKPiArKysgYi9tbS9ndXAuYwo+IEBAIC0xOTY5LDYgKzE5Njks
MzQgQEAgc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wdWQocHVkX3QgcHVkLCBwdWRfdCAq
cHVkcCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICB9Cj4gICNlbmRpZgo+ICAKPiArc3RhdGljIGlu
dCBfX3JlY29yZF9zdWJwYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9uZyBhZGRy
LAo+ICsJCQkgICAgIHVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQg
bnIpCj4gK3sKPiArCWludCBucl9yZWNvcmRlZF9wYWdlcyA9IDA7Cj4gKwo+ICsJZG8gewo+ICsJ
CXBhZ2VzW25yXSA9IHBhZ2U7Cj4gKwkJbnIrKzsKPiArCQlwYWdlKys7Cj4gKwkJbnJfcmVjb3Jk
ZWRfcGFnZXMrKzsKPiArCX0gd2hpbGUgKGFkZHIgKz0gUEFHRV9TSVpFLCBhZGRyICE9IGVuZCk7
Cj4gKwlyZXR1cm4gbnJfcmVjb3JkZWRfcGFnZXM7Cj4gK30KCldoeSBkb24ndCB5b3UgcGFzcyBp
biBhbHJlYWR5IHBhZ2VzICsgbnI/Cgo+ICsKPiArc3RhdGljIHZvaWQgcHV0X2NvbXBvdW5kX2hl
YWQoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCByZWZzKQo+ICt7Cj4gKwkvKiBEbyBhIGdldF9wYWdl
KCkgZmlyc3QsIGluIGNhc2UgcmVmcyA9PSBwYWdlLT5fcmVmY291bnQgKi8KPiArCWdldF9wYWdl
KHBhZ2UpOwo+ICsJcGFnZV9yZWZfc3ViKHBhZ2UsIHJlZnMpOwo+ICsJcHV0X3BhZ2UocGFnZSk7
Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIF9faHVnZV9wdF9kb25lKHN0cnVjdCBwYWdlICpoZWFk
LCBpbnQgbnJfcmVjb3JkZWRfcGFnZXMsIGludCAqbnIpCj4gK3sKPiArCSpuciArPSBucl9yZWNv
cmRlZF9wYWdlczsKPiArCVNldFBhZ2VSZWZlcmVuY2VkKGhlYWQpOwo+ICt9CgpJIGRvbid0IGZp
bmQgdGhpcyBsYXN0IGhlbHBlciB2ZXJ5IHVzZWZ1bC4gSXQgc2VlbXMgdG8gbXVkZHkgd2F0ZXIg
bW9yZQp0aGFuIG5lY2Vzc2FyeS4uLgoKT3RoZXIgdGhhbiB0aGF0IHRoZSBjbGVhbnVwIGxvb2tz
IG5pY2UgdG8gbWUuCgoJCQkJCQkJCUhvbnphCi0tIApKYW4gS2FyYSA8amFja0BzdXNlLmNvbT4K
U1VTRSBMYWJzLCBDUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
