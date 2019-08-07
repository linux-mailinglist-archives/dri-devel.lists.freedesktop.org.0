Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE8B847A3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 10:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600BB89970;
	Wed,  7 Aug 2019 08:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597208996F;
 Wed,  7 Aug 2019 08:37:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F237BAF41;
 Wed,  7 Aug 2019 08:37:26 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 9D5DC1E3551; Wed,  7 Aug 2019 10:37:26 +0200 (CEST)
Date: Wed, 7 Aug 2019 10:37:26 +0200
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
Message-ID: <20190807083726.GA14658@quack2.suse.cz>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802091244.GD6461@dhcp22.suse.cz>
 <20190802124146.GL25064@quack2.suse.cz>
 <20190802142443.GB5597@bombadil.infradead.org>
 <20190802145227.GQ25064@quack2.suse.cz>
 <076e7826-67a5-4829-aae2-2b90f302cebd@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <076e7826-67a5-4829-aae2-2b90f302cebd@nvidia.com>
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
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

T24gRnJpIDAyLTA4LTE5IDEyOjE0OjA5LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gT24gOC8yLzE5
IDc6NTIgQU0sIEphbiBLYXJhIHdyb3RlOgo+ID4gT24gRnJpIDAyLTA4LTE5IDA3OjI0OjQzLCBN
YXR0aGV3IFdpbGNveCB3cm90ZToKPiA+ID4gT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDI6NDE6
NDZQTSArMDIwMCwgSmFuIEthcmEgd3JvdGU6Cj4gPiA+ID4gT24gRnJpIDAyLTA4LTE5IDExOjEy
OjQ0LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUgMDEtMDgtMTkgMTk6MTk6
MzEsIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4gPiA+ID4gPiBbLi4uXQo+ID4gPiA+
ID4gPiAyKSBDb252ZXJ0IGFsbCBvZiB0aGUgY2FsbCBzaXRlcyBmb3IgZ2V0X3VzZXJfcGFnZXMq
KCksIHRvCj4gPiA+ID4gPiA+IGludm9rZSBwdXRfdXNlcl9wYWdlKigpLCBpbnN0ZWFkIG9mIHB1
dF9wYWdlKCkuIFRoaXMgaW52b2x2ZXMgZG96ZW5zIG9mCj4gPiA+ID4gPiA+IGNhbGwgc2l0ZXMs
IGFuZCB3aWxsIHRha2Ugc29tZSB0aW1lLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBIb3cgZG8gd2Ug
bWFrZSBzdXJlIHRoaXMgaXMgdGhlIGNhc2UgYW5kIGl0IHdpbGwgcmVtYWluIHRoZSBjYXNlIGlu
IHRoZQo+ID4gPiA+ID4gZnV0dXJlPyBUaGVyZSBtdXN0IGJlIHNvbWUgYXV0b21hZ2ljIHRvIGVu
Zm9yY2UvY2hlY2sgdGhhdC4gSXQgaXMgc2ltcGx5Cj4gPiA+ID4gPiBub3QgbWFuYWdlYWJsZSB0
byBkbyBpdCBldmVyeSBub3cgYW5kIHRoZW4gYmVjYXVzZSB0aGVuIDMpIHdpbGwgc2ltcGx5Cj4g
PiA+ID4gPiBiZSBuZXZlciBzYWZlLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBIYXZlIHlvdSBjb25z
aWRlcmVkIGNvY2NpbmVsZSBvciBzb21lIG90aGVyIHNjcmlwdGVkIHdheSB0byBkbyB0aGUKPiA+
ID4gPiA+IHRyYW5zaXRpb24/IEkgaGF2ZSBubyBpZGVhIGhvdyB0byBkZWFsIHdpdGggZnV0dXJl
IGNoYW5nZXMgdGhhdCB3b3VsZAo+ID4gPiA+ID4gYnJlYWsgdGhlIGJhbGFuY2UgdGhvdWdoLgo+
IAo+IEhpIE1pY2hhbCwKPiAKPiBZZXMsIEkndmUgdGhvdWdodCBhYm91dCBpdCwgYW5kIGNvY2Np
bmVsbGUgZmFsbHMgYSBiaXQgc2hvcnQgKGl0J3Mgbm90IHNtYXJ0Cj4gZW5vdWdoIHRvIGtub3cg
d2hpY2ggcHV0X3BhZ2UoKSdzIHRvIGNvbnZlcnQpLiBIb3dldmVyLCB0aGVyZSBpcyBhIGRlYnVn
Cj4gb3B0aW9uIHBsYW5uZWQ6IGEgeWV0LXRvLWJlLXBvc3RlZCBjb21taXQgWzFdIHVzZXMgc3Ry
dWN0IHBhZ2UgZXh0ZW5zaW9ucwo+IChvYnZpb3VzbHkgcHJvdGVjdGVkIGJ5IENPTkZJR19ERUJV
R19HRVRfVVNFUl9QQUdFU19SRUZFUkVOQ0VTKSB0byBhZGQKPiBhIHJlZHVuZGFudCBjb3VudGVy
LiBUaGF0IGFsbG93czoKPiAKPiB2b2lkIF9fcHV0X3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCj4g
ewo+IAkuLi4KPiAJLyogU29tZW9uZSBjYWxsZWQgcHV0X3BhZ2UoKSBpbnN0ZWFkIG9mIHB1dF91
c2VyX3BhZ2UoKSAqLwo+IAlXQVJOX09OX09OQ0UoYXRvbWljX3JlYWQoJnBhZ2VfZXh0LT5waW5f
Y291bnQpID4gMCk7Cj4gCj4gPiA+ID4gCj4gPiA+ID4gWWVhaCwgdGhhdCdzIHdoeSBJJ3ZlIGJl
ZW4gc3VnZ2VzdGluZyBhdCBMU0YvTU0gdGhhdCB3ZSBtYXkgbmVlZCB0byBjcmVhdGUKPiA+ID4g
PiBhIGd1cCB3cmFwcGVyIC0gc2F5IHZhZGRyX3Bpbl9wYWdlcygpIC0gYW5kIHRyYWNrIHdoaWNo
IHNpdGVzIGRyb3BwaW5nCj4gPiA+ID4gcmVmZXJlbmNlcyBnb3QgY29udmVydGVkIGJ5IHVzaW5n
IHRoaXMgd3JhcHBlciBpbnN0ZWFkIG9mIGd1cC4gVGhlCj4gPiA+ID4gY291bnRlcnBhcnQgd291
bGQgdGhlbiBiZSBtb3JlIGxvZ2ljYWxseSBuYW1lZCBhcyB1bnBpbl9wYWdlKCkgb3Igd2hhdGV2
ZXIKPiA+ID4gPiBpbnN0ZWFkIG9mIHB1dF91c2VyX3BhZ2UoKS4gIFN1cmUgdGhpcyBpcyBub3Qg
Y29tcGxldGVseSBmb29scHJvb2YgKHlvdSBjYW4KPiA+ID4gPiBjcmVhdGUgbmV3IGNhbGxzaXRl
IHVzaW5nIHZhZGRyX3Bpbl9wYWdlcygpIGFuZCB0aGVuIGp1c3QgZHJvcCByZWZzIHVzaW5nCj4g
PiA+ID4gcHV0X3BhZ2UoKSkgYnV0IEkgc3VwcG9zZSBpdCB3b3VsZCBiZSBhIGhpZ2ggZW5vdWdo
IGJhcnJpZXIgZm9yIG1pc3NlZAo+ID4gPiA+IGNvbnZlcnNpb25zLi4uIFRob3VnaHRzPwo+IAo+
IFRoZSBkZWJ1ZyBvcHRpb24gYWJvdmUgaXMgc3RpbGwgYSBiaXQgc2ltcGxpc3RpYyBpbiBpdHMg
aW1wbGVtZW50YXRpb24KPiAoYW5kIG1heWJlIG5vdCB0YWtpbmcgZnVsbCBhZHZhbnRhZ2Ugb2Yg
dGhlIGRhdGEgaXQgaGFzKSwgYnV0IEkgdGhpbmsKPiBpdCdzIHByZWZlcmFibGUsIGJlY2F1c2Ug
aXQgbW9uaXRvcnMgdGhlICJjb3JlIiBhbmQgV0FSTnMuCj4gCj4gSW5zdGVhZCBvZiB0aGUgd3Jh
cHBlciwgSSdtIHRoaW5raW5nOiBkb2N1bWVudGF0aW9uIGFuZCB0aGUgcGFzc2FnZSBvZgo+IHRp
bWUsIHBsdXMgdGhlIGRlYnVnIG9wdGlvbiAocGVyaGFwcyBlbmhhbmNlZC0tcHJvYmFibHkgb25j
ZSBJIHBvc3QgaXQKPiBzb21lb25lIHdpbGwgbm90aWNlIG9wcG9ydHVuaXRpZXMpLCB5ZXM/CgpT
byBJIHRoaW5rIHlvdXIgZGVidWcgb3B0aW9uIGFuZCBteSBzdWdnZXN0ZWQgcmVuYW1pbmcgc2Vy
dmUgYSBiaXQKZGlmZmVyZW50IHB1cnBvc2VzIChhbmQgdGh1cyBib3RoIG1ha2Ugc2Vuc2UpLiBJ
ZiB5b3UgZG8gdGhlIHJlbmFtaW5nLCB5b3UKY2FuIGp1c3QgZ3JlcCB0byBzZWUgdW5jb252ZXJ0
ZWQgc2l0ZXMuIEFsc28gd2hlbiBzb21lb25lIG1lcmdlcyBuZXcgR1VQCnVzZXIgKHVuYXdhcmUg
b2YgdGhlIG5ldyBydWxlcykgd2hpbGUgeW91IHN3aXRjaCBHVVAgdG8gdXNlIHBpbnMgaW5zdGVh
ZCBvZgpvcmRpbmFyeSByZWZlcmVuY2VzLCB5b3UnbGwgZ2V0IGNvbXBpbGF0aW9uIGVycm9yIGlu
IGNhc2Ugb2YgcmVuYW1pbmcKaW5zdGVhZCBvZiBoYXJkIHRvIGRlYnVnIHJlZmNvdW50IGxlYWsg
d2l0aG91dCB0aGUgcmVuYW1pbmcuIEFuZCBzdWNoCmNvbmZsaWN0IGlzIGFsbW9zdCBib3VuZCB0
byBoYXBwZW4gZ2l2ZW4gdGhlIHNpemUgb2YgR1VQIHBhdGNoIHNldC4uLiBBbHNvCnRoZSByZW5h
bWluZyBzZXJ2ZXMgYWdhaW5zdCB0aGUgImNvZGluZyBpbmVydGlhIiAtIGkuZS4sIEdVUCBpcyBh
cm91bmQgZm9yCmFnZXMgc28gcGVvcGxlIGp1c3QgdXNlIGl0IHdpdGhvdXQgY2hlY2tpbmcgYW55
IGRvY3VtZW50YXRpb24gb3IgY29tbWVudHMuCkFmdGVyIHN3aXRjaGluZyBob3cgR1VQIHdvcmtz
LCB3aGF0IHVzZWQgdG8gYmUgY29ycmVjdCBpc24ndCBhbnltb3JlIHNvCnJlbmFtaW5nIHRoZSBm
dW5jdGlvbiBzZXJ2ZXMgYXMgYSB3YXJuaW5nIHRoYXQgc29tZXRoaW5nIGhhcyByZWFsbHkKY2hh
bmdlZC4KCllvdXIgcmVmY291bnQgZGVidWcgcGF0Y2hlcyBhcmUgZ29vZCB0byBjYXRjaCBidWdz
IGluIHRoZSBjb252ZXJzaW9ucyBkb25lCmJ1dCB0aGF0IHJlcXVpcmVzIHlvdSB0byBiZSBhYmxl
IHRvIGV4Y2VyY2lzZSB0aGUgY29kZSBwYXRoIGluIHRoZSBmaXJzdApwbGFjZSB3aGljaCBtYXkg
cmVxdWlyZSBwYXJ0aWN1bGFyIEhXIG9yIHNvLCBhbmQgeW91IGFsc28gaGF2ZSB0byBlbmFibGUK
dGhlIGRlYnVnIG9wdGlvbiB3aGljaCBtZWFucyB5b3UgYWxyZWFkeSBhaW0gYXQgdmVyaWZ5aW5n
IHRoZSBHVVAKcmVmZXJlbmNlcyBhcmUgdHJlYXRlZCBwcm9wZXJseS4KCgkJCQkJCQkJSG9uemEK
Ci0tIApKYW4gS2FyYSA8amFja0BzdXNlLmNvbT4KU1VTRSBMYWJzLCBDUgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
