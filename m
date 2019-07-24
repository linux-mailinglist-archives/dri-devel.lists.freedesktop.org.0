Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B719873715
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 20:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CE86E624;
	Wed, 24 Jul 2019 18:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC556E624;
 Wed, 24 Jul 2019 18:59:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 170CCADC1;
 Wed, 24 Jul 2019 18:59:14 +0000 (UTC)
Date: Wed, 24 Jul 2019 20:59:10 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Message-ID: <20190724185910.GF6410@dhcp22.suse.cz>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
 <20190724175858.GC6410@dhcp22.suse.cz>
 <20190724180837.GF28493@ziepe.ca>
 <20190724185617.GE6410@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724185617.GE6410@dhcp22.suse.cz>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkIDI0LTA3LTE5IDIwOjU2OjE3LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gT24gV2VkIDI0
LTA3LTE5IDE1OjA4OjM3LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAy
NCwgMjAxOSBhdCAwNzo1ODo1OFBNICswMjAwLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gWy4uLl0K
PiA+ID4gTWF5YmUgbmV3IHVzZXJzIGhhdmUgc3RhcnRlZCByZWx5aW5nIG9uIGEgbmV3IHNlbWFu
dGljIGluIHRoZSBtZWFudGltZSwKPiA+ID4gYmFjayB0aGVuLCBub25lIG9mIHRoZSBub3RpZmll
ciBoYXMgZXZlbiBzdGFydGVkIGFueSBhY3Rpb24gaW4gYmxvY2tpbmcKPiA+ID4gbW9kZSBvbiBh
IEVBR0FJTiBiYWlsb3V0LiBNb3N0IG9mIHRoZW0gc2ltcGx5IGRpZCB0cnlsb2NrIGVhcmx5IGlu
IHRoZQo+ID4gPiBwcm9jZXNzIGFuZCBiYWlsZWQgb3V0IHNvIHRoZXJlIHdhcyBub3RoaW5nIHRv
IGRvIGZvciB0aGUgcmFuZ2VfZW5kCj4gPiA+IGNhbGxiYWNrLgo+ID4gCj4gPiBTaW5nbGUgbm90
aWZpZXJzIGFyZSBub3QgdGhlIHByb2JsZW0uIEkgdHJpZWQgdG8gbWFrZSB0aGlzIGNsZWFyIGlu
Cj4gPiB0aGUgY29tbWl0IG1lc3NhZ2UsIGJ1dCBsZXRzIGJlIG1vcmUgZXhwbGljaXQuCj4gPiAK
PiA+IFdlIGhhdmUgKnR3byogbm90aWZpZXJzIHJlZ2lzdGVyZWQgdG8gdGhlIG1tLCBBIGFuZCBC
Ogo+ID4gCj4gPiBBIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQ6IChoYXMgbm8gYmxvY2tpbmcpCj4g
PiAgICAgc3Bpbl9sb2NrKCkKPiA+ICAgICBjb3VudGVyKysKPiA+ICAgICBzcGluX3VubG9jaygp
Cj4gPiAKPiA+IEEgaW52YWxpZGF0ZV9yYW5nZV9lbmQ6Cj4gPiAgICAgc3Bpbl9sb2NrKCkKPiA+
ICAgICBjb3VudGVyLS0KPiA+ICAgICBzcGluX3VubG9jaygpCj4gPiAKPiA+IEFuZCB0aGlzIG9u
ZToKPiA+IAo+ID4gQiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0OiAoaGFzIGJsb2NraW5nKQo+ID4g
ICAgIGlmICghdHJ5X211dGV4X2xvY2soKSkKPiA+ICAgICAgICAgcmV0dXJuIC1FQUdBSU47Cj4g
PiAgICAgY291bnRlcisrCj4gPiAgICAgbXV0ZXhfdW5sb2NrKCkKPiA+IAo+ID4gQiBpbnZhbGlk
YXRlX3JhbmdlX2VuZDoKPiA+ICAgICBzcGluX2xvY2soKQo+ID4gICAgIGNvdW50ZXItLQo+ID4g
ICAgIHNwaW5fdW5sb2NrKCkKPiA+IAo+ID4gU28gbm93IHRoZSBvb20gcGF0aCBkb2VzOgo+ID4g
Cj4gPiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X25vbl9ibG9ja2luZzoKPiA+ICBmb3IgZWFjaCBt
bjoKPiA+ICAgIGEtPmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQKPiA+ICAgIGItPmludmFsaWRhdGVf
cmFuZ2Vfc3RhcnQKPiA+ICAgIHJjID0gRUFHQUlOCj4gPiAKPiA+IE5vdyB3ZSBTS0lQIEEncyBp
bnZhbGlkYXRlX3JhbmdlX2VuZCBldmVuIHRob3VnaCBBIGhhZCBubyBpZGVhIHRoaXMKPiA+IHdv
dWxkIGhhcHBlbiBoYXMgc3RhdGUgdGhhdCBuZWVkcyB0byBiZSB1bndvdW5kLiBBIGlzIGJyb2tl
bi4KPiA+IAo+ID4gQiBzdXJ2aXZlZCBqdXN0IGZpbmUuCj4gPiAKPiA+IEEgYW5kIEIgKmFsb25l
KiB3b3JrIGZpbmUsIGNvbWJpbmVkIHRoZXkgZmFpbC4KPiAKPiBCdXQgdGhhdCByZXF1aXJlcyB0
aGF0IHRoZXkgc2hhcmUgc29tZSBzdGF0ZSwgcmlnaHQ/Cj4gCj4gPiBXaGVuIHRoZSBjb21taXQg
d2FzIGxhbmRlZCB5b3UgY2FuIHVzZSBLVk0gYXMgYW4gZXhhbXBsZSBvZiBBIGFuZCBSRE1BCj4g
PiBPRFAgYXMgYW4gZXhhbXBsZSBvZiBCCj4gCj4gQ291bGQgeW91IHBvaW50IG1lIHdoZXJlIHRo
b3NlIHR3byBzaGFyZSB0aGUgc3RhdGUgcGxlYXNlPyBLVk0gc2VlbXMgdG8KPiBiZSB1c2luZyBr
dm0tPm1tdV9ub3RpZmllcl9jb3VudCBidXQgSSBkbyBub3Qga25vdyB3aGVyZSB0byBsb29rIGZv
ciB0aGUKPiBSRE1BLi4uCgpTY3JhdGNoIHRoYXQuIEVMT05HREFZLi4uIEkgY2FuIHNlZSB5b3Vy
IHBvaW50LiBJdCBpcyBhbGwgb3Igbm90aGluZwp0aGF0IGRvZXNuJ3QgcmVhbGx5IHdvcmsgaGVy
ZS4gTG9va2luZyBiYWNrIGF0IHlvdXIgcGF0Y2ggaXQgc2VlbXMKcmVhc29uYWJsZSBidXQgSSBh
bSBub3Qgc3VyZSB3aGF0IGlzIHN1cHBvc2VkIHRvIGJlIGEgYmVoYXZpb3IgZm9yCm5vdGlmaWVy
cyB0aGF0IGZhaWxlZC4KLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
