Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB9F28B1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C21F6EEBC;
	Thu,  7 Nov 2019 08:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CED6EEBC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:07:20 +0000 (UTC)
Received: from rapoport-lnx (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14F2F2077C;
 Thu,  7 Nov 2019 08:07:10 +0000 (UTC)
Date: Thu, 7 Nov 2019 10:07:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191107080706.GB3239@rapoport-lnx>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191105131032.GG25005@rapoport-lnx>
 <9ac948a4-59bf-2427-2007-e460aad2848a@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ac948a4-59bf-2427-2007-e460aad2848a@nvidia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573114040;
 bh=Vs0vmuJFZJfCdBWbcef1JshwZZc9l+YrjwUdtsaNu3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KypO2u9qQZOpCT97PagoJmJ05jNzzAwEOh5TQuJtaHcnw290kuyiCyRgXcpTDgoff
 yL2r3/5Nv3OxL5iW1vDTUMldS7lvQVWUl8vBPDTErZIqUCYXU5EvD9rUB9CL4lekw9
 M70s0IBFr/3wdhsUYXeg/j3kPNjd4MGq8LMTqoAU=
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

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTE6MDA6MDZBTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDExLzUvMTkgNToxMCBBTSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiAuLi4KPiA+
PiAtLS0KPiA+PiAgRG9jdW1lbnRhdGlvbi92bS9pbmRleC5yc3QgICAgICAgICAgfCAgIDEgKwo+
ID4+ICBEb2N1bWVudGF0aW9uL3ZtL3Bpbl91c2VyX3BhZ2VzLnJzdCB8IDIxMiArKysrKysrKysr
KysrKysrKysrKysrCj4gPiAKPiA+IEkgdGhpbmsgaXQgYmVsb25ncyB0byBEb2N1bWVudGF0aW9u
L2NvcmUtYXBpLgo+IAo+IERvbmU6Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vY29y
ZS1hcGkvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9pbmRleC5yc3QKPiBpbmRl
eCBhYjBlYWUxYzE1M2EuLjQxM2Y3ZDdjODY0MiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2NvcmUtYXBpL2luZGV4LnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vY29yZS1hcGkvaW5kZXgu
cnN0Cj4gQEAgLTMxLDYgKzMxLDcgQEAgQ29yZSB1dGlsaXRpZXMKPiAgICAgZ2VuZXJpYy1yYWRp
eC10cmVlCj4gICAgIG1lbW9yeS1hbGxvY2F0aW9uCj4gICAgIG1tLWFwaQo+ICsgICBwaW5fdXNl
cl9wYWdlcwo+ICAgICBnZnBfbWFzay1mcm9tLWZzLWlvCj4gICAgIHRpbWVrZWVwaW5nCj4gICAg
IGJvb3QtdGltZS1tbQoKVGhhbmtzIQogCj4gLi4uCj4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdm0vcGluX3VzZXJfcGFnZXMucnN0IGIvRG9jdW1lbnRhdGlvbi92bS9waW5fdXNlcl9w
YWdlcy5yc3QKPiA+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+IGluZGV4IDAwMDAwMDAwMDAw
MC4uMzkxMGY0OWNhOThjCj4gPj4gLS0tIC9kZXYvbnVsbAo+ID4+ICsrKyBiL0RvY3VtZW50YXRp
b24vdm0vcGluX3VzZXJfcGFnZXMucnN0Cj4gPj4gQEAgLTAsMCArMSwyMTIgQEAKPiA+PiArLi4g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+PiArCj4gPj4gKz09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+PiArcGluX3VzZXJf
cGFnZXMoKSBhbmQgcmVsYXRlZCBjYWxscwo+ID4+ICs9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiAKPiA+IEkga25vdyB0aGlzIGlzIHRvbyBt
dWNoIHRvIGFzaywgYnV0IGhhdmluZyBwaW5fdXNlcl9wYWdlcygpIGEgcGFydCBvZiBtb3JlCj4g
PiBnZW5lcmFsIEdVUCBkZXNjcmlwdGlvbiB3b3VsZCBiZSByZWFsbHkgZ3JlYXQgOikKPiA+IAo+
IAo+IFllcywgZGVmaW5pdGVseS4gQnV0IHVudGlsIEkgc2F3IHRoZSByZWFjdGlvbiB0byB0aGUg
cGluX3VzZXJfcGFnZXMoKSBBUEkKPiBmYW1pbHksIEkgZGlkbid0IHdhbnQgdG8gd3JpdGUgdG9v
IG11Y2gtLWl0IGNvdWxkIGhhdmUgYWxsIGJlZW4gdG9zc2VkIG91dAo+IGluIGZhdm9yIG9mIGEg
d2hvbGUgZGlmZmVyZW50IEFQSS4gQnV0IG5vdyB0aGF0IHdlJ3ZlIGhhZCBzb21lIGluaXRpYWwK
PiByZXZpZXdzLCBJJ20gbXVjaCBtb3JlIGNvbmZpZGVudCBpbiBiZWluZyBhYmxlIHRvIHdyaXRl
IGFib3V0IHRoZSBsYXJnZXIgCj4gQVBJIHNldC4KPiAKPiBTbyB5ZXMsIEknbGwgcHV0IHRoYXQg
b24gbXkgcGVuZGluZyBsaXN0Lgo+IAo+IAo+IC4uLgo+ID4+ICtUaGlzIGRvY3VtZW50IGRlc2Ny
aWJlcyB0aGUgZm9sbG93aW5nIGZ1bmN0aW9uczogOjoKPiA+PiArCj4gPj4gKyBwaW5fdXNlcl9w
YWdlcwo+ID4+ICsgcGluX3VzZXJfcGFnZXNfZmFzdAo+ID4+ICsgcGluX3VzZXJfcGFnZXNfcmVt
b3RlCj4gPj4gKwo+ID4+ICsgcGluX2xvbmd0ZXJtX3BhZ2VzCj4gPj4gKyBwaW5fbG9uZ3Rlcm1f
cGFnZXNfZmFzdAo+ID4+ICsgcGluX2xvbmd0ZXJtX3BhZ2VzX3JlbW90ZQo+ID4+ICsKPiA+PiAr
QmFzaWMgZGVzY3JpcHRpb24gb2YgRk9MTF9QSU4KPiA+PiArPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KPiA+PiArCj4gPj4gK0EgbmV3IGZsYWcgZm9yIGdldF91c2VyX3BhZ2VzICgiZ3Vw
IikgaGFzIGJlZW4gYWRkZWQ6IEZPTExfUElOLiBGT0xMX1BJTiBoYXMKPiA+IAo+ID4gQ29uc2lk
ZXIgcmVhZGluZyB0aGlzIGFmdGVyLCBzYXksIGhhbGYgYSB5ZWFyIDstKQo+ID4gCj4gCj4gT0ss
IE9LLiBJIGtuZXcgd2hlbiBJIHdyb3RlIHRoYXQgdGhhdCBpdCB3YXMgbm90IGdvaW5nIHRvIHN0
YXkgbmV3IGZvcmV2ZXIsIGJ1dAo+IHNvbWVob3cgZmFpbGVkIHRvIHdyaXRlIHRoZSByaWdodCB0
aGluZyBhbnl3YXkuIDopIAo+IAo+IEhlcmUncyBhIHJldmlzZWQgc2V0IG9mIHBhcmFncmFwaHM6
Cj4gCj4gQmFzaWMgZGVzY3JpcHRpb24gb2YgRk9MTF9QSU4KPiA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQo+IAo+IEZPTExfUElOIGFuZCBGT0xMX0xPTkdURVJNIGFyZSBmbGFncyB0aGF0
IGNhbiBiZSBwYXNzZWQgdG8gdGhlIGdldF91c2VyX3BhZ2VzKigpCj4gKCJndXAiKSBmYW1pbHkg
b2YgZnVuY3Rpb25zLiBGT0xMX1BJTiBoYXMgc2lnbmlmaWNhbnQgaW50ZXJhY3Rpb25zIGFuZAo+
IGludGVyZGVwZW5kZW5jaWVzIHdpdGggRk9MTF9MT05HVEVSTSwgc28gYm90aCBhcmUgY292ZXJl
ZCBoZXJlLgo+IAo+IEJvdGggRk9MTF9QSU4gYW5kIEZPTExfTE9OR1RFUk0gYXJlIGludGVybmFs
IHRvIGd1cCwgbWVhbmluZyB0aGF0IG5laXRoZXIKPiBGT0xMX1BJTiBub3IgRk9MTF9MT05HVEVS
TSBzaG91bGQgbm90IGFwcGVhciBhdCB0aGUgZ3VwIGNhbGwgc2l0ZXMuIFRoaXMgYWxsb3dzCj4g
dGhlIGFzc29jaWF0ZWQgd3JhcHBlciBmdW5jdGlvbnMgIChwaW5fdXNlcl9wYWdlcygpIGFuZCBv
dGhlcnMpIHRvIHNldCB0aGUKPiBjb3JyZWN0IGNvbWJpbmF0aW9uIG9mIHRoZXNlIGZsYWdzLCBh
bmQgdG8gY2hlY2sgZm9yIHByb2JsZW1zIGFzIHdlbGwuCgpHcmVhdCwgdGhhbmtzISAKIAo+IHRo
YW5rcywKPiAKPiBKb2huIEh1YmJhcmQKPiBOVklESUEKCi0tIApTaW5jZXJlbHkgeW91cnMsCk1p
a2UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
