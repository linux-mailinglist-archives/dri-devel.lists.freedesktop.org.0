Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D74847DE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 10:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93F589B9A;
	Wed,  7 Aug 2019 08:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382BB89B9A;
 Wed,  7 Aug 2019 08:46:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8E81EAD29;
 Wed,  7 Aug 2019 08:46:50 +0000 (UTC)
Date: Wed, 7 Aug 2019 10:46:49 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
Message-ID: <20190807084649.GQ11812@dhcp22.suse.cz>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802091244.GD6461@dhcp22.suse.cz>
 <20190802124146.GL25064@quack2.suse.cz>
 <20190802142443.GB5597@bombadil.infradead.org>
 <20190802145227.GQ25064@quack2.suse.cz>
 <076e7826-67a5-4829-aae2-2b90f302cebd@nvidia.com>
 <20190807083726.GA14658@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807083726.GA14658@quack2.suse.cz>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 john.hubbard@gmail.com, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkIDA3LTA4LTE5IDEwOjM3OjI2LCBKYW4gS2FyYSB3cm90ZToKPiBPbiBGcmkgMDItMDgt
MTkgMTI6MTQ6MDksIEpvaG4gSHViYmFyZCB3cm90ZToKPiA+IE9uIDgvMi8xOSA3OjUyIEFNLCBK
YW4gS2FyYSB3cm90ZToKPiA+ID4gT24gRnJpIDAyLTA4LTE5IDA3OjI0OjQzLCBNYXR0aGV3IFdp
bGNveCB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAwMjo0MTo0NlBNICsw
MjAwLCBKYW4gS2FyYSB3cm90ZToKPiA+ID4gPiA+IE9uIEZyaSAwMi0wOC0xOSAxMToxMjo0NCwg
TWljaGFsIEhvY2tvIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBUaHUgMDEtMDgtMTkgMTk6MTk6MzEs
IGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4gPiA+ID4gPiA+IFsuLi5dCj4gPiA+ID4g
PiA+ID4gMikgQ29udmVydCBhbGwgb2YgdGhlIGNhbGwgc2l0ZXMgZm9yIGdldF91c2VyX3BhZ2Vz
KigpLCB0bwo+ID4gPiA+ID4gPiA+IGludm9rZSBwdXRfdXNlcl9wYWdlKigpLCBpbnN0ZWFkIG9m
IHB1dF9wYWdlKCkuIFRoaXMgaW52b2x2ZXMgZG96ZW5zIG9mCj4gPiA+ID4gPiA+ID4gY2FsbCBz
aXRlcywgYW5kIHdpbGwgdGFrZSBzb21lIHRpbWUuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBI
b3cgZG8gd2UgbWFrZSBzdXJlIHRoaXMgaXMgdGhlIGNhc2UgYW5kIGl0IHdpbGwgcmVtYWluIHRo
ZSBjYXNlIGluIHRoZQo+ID4gPiA+ID4gPiBmdXR1cmU/IFRoZXJlIG11c3QgYmUgc29tZSBhdXRv
bWFnaWMgdG8gZW5mb3JjZS9jaGVjayB0aGF0LiBJdCBpcyBzaW1wbHkKPiA+ID4gPiA+ID4gbm90
IG1hbmFnZWFibGUgdG8gZG8gaXQgZXZlcnkgbm93IGFuZCB0aGVuIGJlY2F1c2UgdGhlbiAzKSB3
aWxsIHNpbXBseQo+ID4gPiA+ID4gPiBiZSBuZXZlciBzYWZlLgo+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gSGF2ZSB5b3UgY29uc2lkZXJlZCBjb2NjaW5lbGUgb3Igc29tZSBvdGhlciBzY3JpcHRl
ZCB3YXkgdG8gZG8gdGhlCj4gPiA+ID4gPiA+IHRyYW5zaXRpb24/IEkgaGF2ZSBubyBpZGVhIGhv
dyB0byBkZWFsIHdpdGggZnV0dXJlIGNoYW5nZXMgdGhhdCB3b3VsZAo+ID4gPiA+ID4gPiBicmVh
ayB0aGUgYmFsYW5jZSB0aG91Z2guCj4gPiAKPiA+IEhpIE1pY2hhbCwKPiA+IAo+ID4gWWVzLCBJ
J3ZlIHRob3VnaHQgYWJvdXQgaXQsIGFuZCBjb2NjaW5lbGxlIGZhbGxzIGEgYml0IHNob3J0IChp
dCdzIG5vdCBzbWFydAo+ID4gZW5vdWdoIHRvIGtub3cgd2hpY2ggcHV0X3BhZ2UoKSdzIHRvIGNv
bnZlcnQpLiBIb3dldmVyLCB0aGVyZSBpcyBhIGRlYnVnCj4gPiBvcHRpb24gcGxhbm5lZDogYSB5
ZXQtdG8tYmUtcG9zdGVkIGNvbW1pdCBbMV0gdXNlcyBzdHJ1Y3QgcGFnZSBleHRlbnNpb25zCj4g
PiAob2J2aW91c2x5IHByb3RlY3RlZCBieSBDT05GSUdfREVCVUdfR0VUX1VTRVJfUEFHRVNfUkVG
RVJFTkNFUykgdG8gYWRkCj4gPiBhIHJlZHVuZGFudCBjb3VudGVyLiBUaGF0IGFsbG93czoKPiA+
IAo+ID4gdm9pZCBfX3B1dF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+ID4gewo+ID4gCS4uLgo+
ID4gCS8qIFNvbWVvbmUgY2FsbGVkIHB1dF9wYWdlKCkgaW5zdGVhZCBvZiBwdXRfdXNlcl9wYWdl
KCkgKi8KPiA+IAlXQVJOX09OX09OQ0UoYXRvbWljX3JlYWQoJnBhZ2VfZXh0LT5waW5fY291bnQp
ID4gMCk7Cj4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gWWVhaCwgdGhhdCdzIHdoeSBJJ3ZlIGJl
ZW4gc3VnZ2VzdGluZyBhdCBMU0YvTU0gdGhhdCB3ZSBtYXkgbmVlZCB0byBjcmVhdGUKPiA+ID4g
PiA+IGEgZ3VwIHdyYXBwZXIgLSBzYXkgdmFkZHJfcGluX3BhZ2VzKCkgLSBhbmQgdHJhY2sgd2hp
Y2ggc2l0ZXMgZHJvcHBpbmcKPiA+ID4gPiA+IHJlZmVyZW5jZXMgZ290IGNvbnZlcnRlZCBieSB1
c2luZyB0aGlzIHdyYXBwZXIgaW5zdGVhZCBvZiBndXAuIFRoZQo+ID4gPiA+ID4gY291bnRlcnBh
cnQgd291bGQgdGhlbiBiZSBtb3JlIGxvZ2ljYWxseSBuYW1lZCBhcyB1bnBpbl9wYWdlKCkgb3Ig
d2hhdGV2ZXIKPiA+ID4gPiA+IGluc3RlYWQgb2YgcHV0X3VzZXJfcGFnZSgpLiAgU3VyZSB0aGlz
IGlzIG5vdCBjb21wbGV0ZWx5IGZvb2xwcm9vZiAoeW91IGNhbgo+ID4gPiA+ID4gY3JlYXRlIG5l
dyBjYWxsc2l0ZSB1c2luZyB2YWRkcl9waW5fcGFnZXMoKSBhbmQgdGhlbiBqdXN0IGRyb3AgcmVm
cyB1c2luZwo+ID4gPiA+ID4gcHV0X3BhZ2UoKSkgYnV0IEkgc3VwcG9zZSBpdCB3b3VsZCBiZSBh
IGhpZ2ggZW5vdWdoIGJhcnJpZXIgZm9yIG1pc3NlZAo+ID4gPiA+ID4gY29udmVyc2lvbnMuLi4g
VGhvdWdodHM/Cj4gPiAKPiA+IFRoZSBkZWJ1ZyBvcHRpb24gYWJvdmUgaXMgc3RpbGwgYSBiaXQg
c2ltcGxpc3RpYyBpbiBpdHMgaW1wbGVtZW50YXRpb24KPiA+IChhbmQgbWF5YmUgbm90IHRha2lu
ZyBmdWxsIGFkdmFudGFnZSBvZiB0aGUgZGF0YSBpdCBoYXMpLCBidXQgSSB0aGluawo+ID4gaXQn
cyBwcmVmZXJhYmxlLCBiZWNhdXNlIGl0IG1vbml0b3JzIHRoZSAiY29yZSIgYW5kIFdBUk5zLgo+
ID4gCj4gPiBJbnN0ZWFkIG9mIHRoZSB3cmFwcGVyLCBJJ20gdGhpbmtpbmc6IGRvY3VtZW50YXRp
b24gYW5kIHRoZSBwYXNzYWdlIG9mCj4gPiB0aW1lLCBwbHVzIHRoZSBkZWJ1ZyBvcHRpb24gKHBl
cmhhcHMgZW5oYW5jZWQtLXByb2JhYmx5IG9uY2UgSSBwb3N0IGl0Cj4gPiBzb21lb25lIHdpbGwg
bm90aWNlIG9wcG9ydHVuaXRpZXMpLCB5ZXM/Cj4gCj4gU28gSSB0aGluayB5b3VyIGRlYnVnIG9w
dGlvbiBhbmQgbXkgc3VnZ2VzdGVkIHJlbmFtaW5nIHNlcnZlIGEgYml0Cj4gZGlmZmVyZW50IHB1
cnBvc2VzIChhbmQgdGh1cyBib3RoIG1ha2Ugc2Vuc2UpLiBJZiB5b3UgZG8gdGhlIHJlbmFtaW5n
LCB5b3UKPiBjYW4ganVzdCBncmVwIHRvIHNlZSB1bmNvbnZlcnRlZCBzaXRlcy4gQWxzbyB3aGVu
IHNvbWVvbmUgbWVyZ2VzIG5ldyBHVVAKPiB1c2VyICh1bmF3YXJlIG9mIHRoZSBuZXcgcnVsZXMp
IHdoaWxlIHlvdSBzd2l0Y2ggR1VQIHRvIHVzZSBwaW5zIGluc3RlYWQgb2YKPiBvcmRpbmFyeSBy
ZWZlcmVuY2VzLCB5b3UnbGwgZ2V0IGNvbXBpbGF0aW9uIGVycm9yIGluIGNhc2Ugb2YgcmVuYW1p
bmcKPiBpbnN0ZWFkIG9mIGhhcmQgdG8gZGVidWcgcmVmY291bnQgbGVhayB3aXRob3V0IHRoZSBy
ZW5hbWluZy4gQW5kIHN1Y2gKPiBjb25mbGljdCBpcyBhbG1vc3QgYm91bmQgdG8gaGFwcGVuIGdp
dmVuIHRoZSBzaXplIG9mIEdVUCBwYXRjaCBzZXQuLi4gQWxzbwo+IHRoZSByZW5hbWluZyBzZXJ2
ZXMgYWdhaW5zdCB0aGUgImNvZGluZyBpbmVydGlhIiAtIGkuZS4sIEdVUCBpcyBhcm91bmQgZm9y
Cj4gYWdlcyBzbyBwZW9wbGUganVzdCB1c2UgaXQgd2l0aG91dCBjaGVja2luZyBhbnkgZG9jdW1l
bnRhdGlvbiBvciBjb21tZW50cy4KPiBBZnRlciBzd2l0Y2hpbmcgaG93IEdVUCB3b3Jrcywgd2hh
dCB1c2VkIHRvIGJlIGNvcnJlY3QgaXNuJ3QgYW55bW9yZSBzbwo+IHJlbmFtaW5nIHRoZSBmdW5j
dGlvbiBzZXJ2ZXMgYXMgYSB3YXJuaW5nIHRoYXQgc29tZXRoaW5nIGhhcyByZWFsbHkKPiBjaGFu
Z2VkLgoKRnVsbHkgYWdyZWVkIQoKPiBZb3VyIHJlZmNvdW50IGRlYnVnIHBhdGNoZXMgYXJlIGdv
b2QgdG8gY2F0Y2ggYnVncyBpbiB0aGUgY29udmVyc2lvbnMgZG9uZQo+IGJ1dCB0aGF0IHJlcXVp
cmVzIHlvdSB0byBiZSBhYmxlIHRvIGV4Y2VyY2lzZSB0aGUgY29kZSBwYXRoIGluIHRoZSBmaXJz
dAo+IHBsYWNlIHdoaWNoIG1heSByZXF1aXJlIHBhcnRpY3VsYXIgSFcgb3Igc28sIGFuZCB5b3Ug
YWxzbyBoYXZlIHRvIGVuYWJsZQo+IHRoZSBkZWJ1ZyBvcHRpb24gd2hpY2ggbWVhbnMgeW91IGFs
cmVhZHkgYWltIGF0IHZlcmlmeWluZyB0aGUgR1VQCj4gcmVmZXJlbmNlcyBhcmUgdHJlYXRlZCBw
cm9wZXJseS4KPiAKPiAJCQkJCQkJCUhvbnphCj4gCj4gLS0gCj4gSmFuIEthcmEgPGphY2tAc3Vz
ZS5jb20+Cj4gU1VTRSBMYWJzLCBDUgoKLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
