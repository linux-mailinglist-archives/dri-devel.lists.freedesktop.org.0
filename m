Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850E581375
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD0F6E2B1;
	Mon,  5 Aug 2019 07:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA996EE7E;
 Fri,  2 Aug 2019 14:24:49 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1htYU7-0007La-VU; Fri, 02 Aug 2019 14:24:43 +0000
Date: Fri, 2 Aug 2019 07:24:43 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
Message-ID: <20190802142443.GB5597@bombadil.infradead.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802091244.GD6461@dhcp22.suse.cz>
 <20190802124146.GL25064@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802124146.GL25064@quack2.suse.cz>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jvuzp+6FCROkRR+waxcd/xSBD2jk0LdlEwwlmE/QRVo=; b=G2sxycFAx+YSXemaZWFj5rBoO
 L5W+suRd87Fzi03i9UbUkz+K/l4OLA7u4vdCzpFKd8kbKkpNT5POJKTjl3Y9NgF+IfuEQiw+Ya9sZ
 Uz98GhfWAglGYt98RBvfBnca/15T9G/n1hhy4hthNjlrIrfsKUlfX1Lr9suoRAYQ/pICfFJo13kmR
 L+hbvfVY5BZygvFEilaamnzYAdT/2P4dTNkPPWEPWi3WZyJpk4mE3pZYxvO4hCe5QB9xougEB5c3g
 IV0U5HMFOk+fqAqk6ui4QqQV5LiDqQxBtFq8kG3bamWa6AZ5dtGBvDFf6uxZiiuQmelcNvOe6qNsg
 wQg03COuw==;
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
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, john.hubbard@gmail.com,
 linux-block@vger.kernel.org,
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

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDI6NDE6NDZQTSArMDIwMCwgSmFuIEthcmEgd3JvdGU6
Cj4gT24gRnJpIDAyLTA4LTE5IDExOjEyOjQ0LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gPiBPbiBU
aHUgMDEtMDgtMTkgMTk6MTk6MzEsIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4gPiBb
Li4uXQo+ID4gPiAyKSBDb252ZXJ0IGFsbCBvZiB0aGUgY2FsbCBzaXRlcyBmb3IgZ2V0X3VzZXJf
cGFnZXMqKCksIHRvCj4gPiA+IGludm9rZSBwdXRfdXNlcl9wYWdlKigpLCBpbnN0ZWFkIG9mIHB1
dF9wYWdlKCkuIFRoaXMgaW52b2x2ZXMgZG96ZW5zIG9mCj4gPiA+IGNhbGwgc2l0ZXMsIGFuZCB3
aWxsIHRha2Ugc29tZSB0aW1lLgo+ID4gCj4gPiBIb3cgZG8gd2UgbWFrZSBzdXJlIHRoaXMgaXMg
dGhlIGNhc2UgYW5kIGl0IHdpbGwgcmVtYWluIHRoZSBjYXNlIGluIHRoZQo+ID4gZnV0dXJlPyBU
aGVyZSBtdXN0IGJlIHNvbWUgYXV0b21hZ2ljIHRvIGVuZm9yY2UvY2hlY2sgdGhhdC4gSXQgaXMg
c2ltcGx5Cj4gPiBub3QgbWFuYWdlYWJsZSB0byBkbyBpdCBldmVyeSBub3cgYW5kIHRoZW4gYmVj
YXVzZSB0aGVuIDMpIHdpbGwgc2ltcGx5Cj4gPiBiZSBuZXZlciBzYWZlLgo+ID4gCj4gPiBIYXZl
IHlvdSBjb25zaWRlcmVkIGNvY2NpbmVsZSBvciBzb21lIG90aGVyIHNjcmlwdGVkIHdheSB0byBk
byB0aGUKPiA+IHRyYW5zaXRpb24/IEkgaGF2ZSBubyBpZGVhIGhvdyB0byBkZWFsIHdpdGggZnV0
dXJlIGNoYW5nZXMgdGhhdCB3b3VsZAo+ID4gYnJlYWsgdGhlIGJhbGFuY2UgdGhvdWdoLgo+IAo+
IFllYWgsIHRoYXQncyB3aHkgSSd2ZSBiZWVuIHN1Z2dlc3RpbmcgYXQgTFNGL01NIHRoYXQgd2Ug
bWF5IG5lZWQgdG8gY3JlYXRlCj4gYSBndXAgd3JhcHBlciAtIHNheSB2YWRkcl9waW5fcGFnZXMo
KSAtIGFuZCB0cmFjayB3aGljaCBzaXRlcyBkcm9wcGluZwo+IHJlZmVyZW5jZXMgZ290IGNvbnZl
cnRlZCBieSB1c2luZyB0aGlzIHdyYXBwZXIgaW5zdGVhZCBvZiBndXAuIFRoZQo+IGNvdW50ZXJw
YXJ0IHdvdWxkIHRoZW4gYmUgbW9yZSBsb2dpY2FsbHkgbmFtZWQgYXMgdW5waW5fcGFnZSgpIG9y
IHdoYXRldmVyCj4gaW5zdGVhZCBvZiBwdXRfdXNlcl9wYWdlKCkuICBTdXJlIHRoaXMgaXMgbm90
IGNvbXBsZXRlbHkgZm9vbHByb29mICh5b3UgY2FuCj4gY3JlYXRlIG5ldyBjYWxsc2l0ZSB1c2lu
ZyB2YWRkcl9waW5fcGFnZXMoKSBhbmQgdGhlbiBqdXN0IGRyb3AgcmVmcyB1c2luZwo+IHB1dF9w
YWdlKCkpIGJ1dCBJIHN1cHBvc2UgaXQgd291bGQgYmUgYSBoaWdoIGVub3VnaCBiYXJyaWVyIGZv
ciBtaXNzZWQKPiBjb252ZXJzaW9ucy4uLiBUaG91Z2h0cz8KCkkgdGhpbmsgdGhlIEFQSSB3ZSBy
ZWFsbHkgbmVlZCBpcyBnZXRfdXNlcl9idmVjKCkgLyBwdXRfdXNlcl9idmVjKCksCmFuZCBJIGtu
b3cgQ2hyaXN0b3BoIGhhcyBiZWVuIHB1dHRpbmcgc29tZSB3b3JrIGludG8gdGhhdC4gIFRoYXQg
YXZvaWRzCmRvaW5nIHJlZmNvdW50IG9wZXJhdGlvbnMgb24gaHVuZHJlZHMgb2YgcGFnZXMgaWYg
dGhlIHBhZ2UgaW4gcXVlc3Rpb24gaXMKYSBodWdlIHBhZ2UuICBPbmNlIHBlb3BsZSBhcmUgc3dp
dGNoZWQgb3ZlciB0byB0aGF0LCB0aGV5IHdvbid0IGJlIHRlbXB0ZWQKdG8gbWFudWFsbHkgY2Fs
bCBwdXRfcGFnZSgpIG9uIHRoZSBpbmRpdmlkdWFsIGNvbnN0aXR1ZW50IHBhZ2VzIG9mIGEgYnZl
Yy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
