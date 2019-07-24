Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEA73711
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 20:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCAD6E625;
	Wed, 24 Jul 2019 18:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4326E625;
 Wed, 24 Jul 2019 18:56:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 377DCAE1B;
 Wed, 24 Jul 2019 18:56:20 +0000 (UTC)
Date: Wed, 24 Jul 2019 20:56:17 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Message-ID: <20190724185617.GE6410@dhcp22.suse.cz>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
 <20190724175858.GC6410@dhcp22.suse.cz>
 <20190724180837.GF28493@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724180837.GF28493@ziepe.ca>
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

T24gV2VkIDI0LTA3LTE5IDE1OjA4OjM3LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2Vk
LCBKdWwgMjQsIDIwMTkgYXQgMDc6NTg6NThQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgpb
Li4uXQo+ID4gTWF5YmUgbmV3IHVzZXJzIGhhdmUgc3RhcnRlZCByZWx5aW5nIG9uIGEgbmV3IHNl
bWFudGljIGluIHRoZSBtZWFudGltZSwKPiA+IGJhY2sgdGhlbiwgbm9uZSBvZiB0aGUgbm90aWZp
ZXIgaGFzIGV2ZW4gc3RhcnRlZCBhbnkgYWN0aW9uIGluIGJsb2NraW5nCj4gPiBtb2RlIG9uIGEg
RUFHQUlOIGJhaWxvdXQuIE1vc3Qgb2YgdGhlbSBzaW1wbHkgZGlkIHRyeWxvY2sgZWFybHkgaW4g
dGhlCj4gPiBwcm9jZXNzIGFuZCBiYWlsZWQgb3V0IHNvIHRoZXJlIHdhcyBub3RoaW5nIHRvIGRv
IGZvciB0aGUgcmFuZ2VfZW5kCj4gPiBjYWxsYmFjay4KPiAKPiBTaW5nbGUgbm90aWZpZXJzIGFy
ZSBub3QgdGhlIHByb2JsZW0uIEkgdHJpZWQgdG8gbWFrZSB0aGlzIGNsZWFyIGluCj4gdGhlIGNv
bW1pdCBtZXNzYWdlLCBidXQgbGV0cyBiZSBtb3JlIGV4cGxpY2l0Lgo+IAo+IFdlIGhhdmUgKnR3
byogbm90aWZpZXJzIHJlZ2lzdGVyZWQgdG8gdGhlIG1tLCBBIGFuZCBCOgo+IAo+IEEgaW52YWxp
ZGF0ZV9yYW5nZV9zdGFydDogKGhhcyBubyBibG9ja2luZykKPiAgICAgc3Bpbl9sb2NrKCkKPiAg
ICAgY291bnRlcisrCj4gICAgIHNwaW5fdW5sb2NrKCkKPiAKPiBBIGludmFsaWRhdGVfcmFuZ2Vf
ZW5kOgo+ICAgICBzcGluX2xvY2soKQo+ICAgICBjb3VudGVyLS0KPiAgICAgc3Bpbl91bmxvY2so
KQo+IAo+IEFuZCB0aGlzIG9uZToKPiAKPiBCIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQ6IChoYXMg
YmxvY2tpbmcpCj4gICAgIGlmICghdHJ5X211dGV4X2xvY2soKSkKPiAgICAgICAgIHJldHVybiAt
RUFHQUlOOwo+ICAgICBjb3VudGVyKysKPiAgICAgbXV0ZXhfdW5sb2NrKCkKPiAKPiBCIGludmFs
aWRhdGVfcmFuZ2VfZW5kOgo+ICAgICBzcGluX2xvY2soKQo+ICAgICBjb3VudGVyLS0KPiAgICAg
c3Bpbl91bmxvY2soKQo+IAo+IFNvIG5vdyB0aGUgb29tIHBhdGggZG9lczoKPiAKPiBpbnZhbGlk
YXRlX3JhbmdlX3N0YXJ0X25vbl9ibG9ja2luZzoKPiAgZm9yIGVhY2ggbW46Cj4gICAgYS0+aW52
YWxpZGF0ZV9yYW5nZV9zdGFydAo+ICAgIGItPmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQKPiAgICBy
YyA9IEVBR0FJTgo+IAo+IE5vdyB3ZSBTS0lQIEEncyBpbnZhbGlkYXRlX3JhbmdlX2VuZCBldmVu
IHRob3VnaCBBIGhhZCBubyBpZGVhIHRoaXMKPiB3b3VsZCBoYXBwZW4gaGFzIHN0YXRlIHRoYXQg
bmVlZHMgdG8gYmUgdW53b3VuZC4gQSBpcyBicm9rZW4uCj4gCj4gQiBzdXJ2aXZlZCBqdXN0IGZp
bmUuCj4gCj4gQSBhbmQgQiAqYWxvbmUqIHdvcmsgZmluZSwgY29tYmluZWQgdGhleSBmYWlsLgoK
QnV0IHRoYXQgcmVxdWlyZXMgdGhhdCB0aGV5IHNoYXJlIHNvbWUgc3RhdGUsIHJpZ2h0PwoKPiBX
aGVuIHRoZSBjb21taXQgd2FzIGxhbmRlZCB5b3UgY2FuIHVzZSBLVk0gYXMgYW4gZXhhbXBsZSBv
ZiBBIGFuZCBSRE1BCj4gT0RQIGFzIGFuIGV4YW1wbGUgb2YgQgoKQ291bGQgeW91IHBvaW50IG1l
IHdoZXJlIHRob3NlIHR3byBzaGFyZSB0aGUgc3RhdGUgcGxlYXNlPyBLVk0gc2VlbXMgdG8KYmUg
dXNpbmcga3ZtLT5tbXVfbm90aWZpZXJfY291bnQgYnV0IEkgZG8gbm90IGtub3cgd2hlcmUgdG8g
bG9vayBmb3IgdGhlClJETUEuLi4KLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
