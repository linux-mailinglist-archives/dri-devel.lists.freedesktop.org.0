Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE4EB8BC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 22:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BD589E3F;
	Thu, 31 Oct 2019 21:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092C689E3F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 21:09:58 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 14:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; d="scan'208";a="375376881"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga005.jf.intel.com with ESMTP; 31 Oct 2019 14:09:55 -0700
Date: Thu, 31 Oct 2019 14:09:55 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 02/19] mm/gup: factor out duplicate code from four routines
Message-ID: <20191031210954.GE14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-3-jhubbard@nvidia.com>
 <20191031183549.GC14771@iweiny-DESK2.sc.intel.com>
 <75b557f7-24b2-740c-2640-2f914d131600@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75b557f7-24b2-740c-2640-2f914d131600@nvidia.com>
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
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

T24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMTE6NDM6MzdBTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDEwLzMxLzE5IDExOjM1IEFNLCBJcmEgV2Vpbnkgd3JvdGU6Cj4gPiBPbiBXZWQs
IE9jdCAzMCwgMjAxOSBhdCAwMzo0OToxM1BNIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
Li4uCj4gPj4gKwo+ID4+ICtzdGF0aWMgdm9pZCBfX3JlbW92ZV9yZWZzX2Zyb21faGVhZChzdHJ1
Y3QgcGFnZSAqcGFnZSwgaW50IHJlZnMpCj4gPj4gK3sKPiA+PiArCS8qIERvIGEgZ2V0X3BhZ2Uo
KSBmaXJzdCwgaW4gY2FzZSByZWZzID09IHBhZ2UtPl9yZWZjb3VudCAqLwo+ID4+ICsJZ2V0X3Bh
Z2UocGFnZSk7Cj4gPj4gKwlwYWdlX3JlZl9zdWIocGFnZSwgcmVmcyk7Cj4gPj4gKwlwdXRfcGFn
ZShwYWdlKTsKPiA+PiArfQo+ID4gCj4gPiBJIHdvbmRlciBpZiB0aGlzIGlzIGJldHRlciBpbXBs
ZW1lbnRlZCBhcyAicHV0X2NvbXBvdW5kX2hlYWQoKSI/ICBUbyBtYXRjaCB0aGUKPiA+IHRyeV9n
ZXRfY29tcG91bmRfaGVhZCgpIGNhbGwgYmVsb3c/Cj4gCj4gSGkgSXJhLAo+IAo+IEdvb2QgaWRl
YSwgSSdsbCByZW5hbWUgaXQgdG8gdGhhdC4KPiAKPiA+IAo+ID4+ICsKPiA+PiArc3RhdGljIGlu
dCBfX2h1Z2VfcHRfZG9uZShzdHJ1Y3QgcGFnZSAqaGVhZCwgaW50IG5yX3JlY29yZGVkX3BhZ2Vz
LCBpbnQgKm5yKQo+ID4+ICt7Cj4gPj4gKwkqbnIgKz0gbnJfcmVjb3JkZWRfcGFnZXM7Cj4gPj4g
KwlTZXRQYWdlUmVmZXJlbmNlZChoZWFkKTsKPiA+PiArCXJldHVybiAxOwo+ID4gCj4gPiBXaGVu
IHdpbGwgdGhpcyByZXR1cm4gYW55dGhpbmcgYnV0IDE/Cj4gPiAKPiAKPiBOZXZlciwgYnV0IGl0
IHNhdmVzIGEgbGluZSBhdCBhbGwgZm91ciBjYWxsIHNpdGVzLCBieSBoYXZpbmcgaXQgcmV0dXJu
IGxpa2UgdGhhdC4KPiAKPiBJIGNvdWxkIHNlZSBob3cgbWF5YmUgcGVvcGxlIHdvdWxkIHByZWZl
ciB0byBqdXN0IGhhdmUgaXQgYmUgYSB2b2lkIGZ1bmN0aW9uLAo+IGFuZCByZXR1cm4gMSBkaXJl
Y3RseSBhdCB0aGUgY2FsbCBzaXRlcy4gU2luY2UgdGhpcyB3YXMgYSBsb3dlciBsaW5lIGNvdW50
IEkKPiB0aG91Z2h0IG1heWJlIGl0IHdvdWxkIGJlIHNsaWdodGx5IGJldHRlciwgYnV0IGl0J3Mg
aGFyZCB0byBzYXkgcmVhbGx5LgoKSXQgaXMgYSBOSVQgcGVyaGFwcyBidXQgSSBmZWVsIGxpa2Ug
dGhlIHNpZ25hdHVyZSBvZiBhIGZ1bmN0aW9uIHNob3VsZCBzdGFuZCBvbgppdCdzIG93bi4gIFdo
YXQgdGhpcyBkb2VzIGlzIG1peCB0aGUgbWVhbmluZyBvZiB0aGlzIGZ1bmN0aW9uIHdpdGggdGhv
c2UKY2FsbGluZyBpdC4gIFdoaWNoIElNTyBpcyBub3QgZ29vZCBzdHlsZS4KCldlIGNhbiBzZWUg
d2hhdCBvdGhlcnMgc2F5LgoKSXJhCgo+IAo+IHRoYW5rcywKPiAKPiBKb2huIEh1YmJhcmQKPiBO
VklESUEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
