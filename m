Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93109289F86
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 11:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3224D6EE65;
	Sat, 10 Oct 2020 09:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96626EE65
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 09:24:26 +0000 (UTC)
Received: from coco.lan (ip5f5ad5ce.dynamic.kabel-deutschland.de
 [95.90.213.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E166207CD;
 Sat, 10 Oct 2020 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602321866;
 bh=/M97QDk4dmePHLGMz8L/1LDgfweGz0LFfE/UcKJE7Us=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0WfcGZ/NRaNLmDS+jOh+NTKZmtgBMPUVlTwtRgayCgG8fNqT9ga5dKdpSd17V6cdr
 HukrmYrFiRiZHk4mzgeyyRmliXyLjN62NnFMnyCvZOm9KoAKj1aPSNb/0Gk/GRwb/0
 cnkcKxRZlgiEC0lyCm9ojQx8D9uJxVDmS5Ffiehg=
Date: Sat, 10 Oct 2020 11:24:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 10/17] media/videbuf1|2: Mark follow_pfn usage as unsafe
Message-ID: <20201010112416.4259249a@coco.lan>
In-Reply-To: <20201009075934.3509076-11-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-11-daniel.vetter@ffwll.ch>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>, Michel Lespinasse <walken@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 LKML <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gRnJpLCAgOSBPY3QgMjAyMCAwOTo1OToyNyArMDIwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPiBlc2NyZXZldToKCj4gVGhlIG1lZGlhIG1vZGVsIGFzc3VtZXMgdGhh
dCBidWZmZXJzIGFyZSBhbGwgcHJlYWxsb2NhdGVkLCBzbyB0aGF0Cj4gd2hlbiBhIG1lZGlhIHBp
cGVsaW5lIGlzIHJ1bm5pbmcgd2UgbmV2ZXIgbWlzcyBhIGRlYWRsaW5lIGJlY2F1c2UgdGhlCj4g
YnVmZmVycyBhcmVuJ3QgYWxsb2NhdGVkIG9yIGF2YWlsYWJsZS4KPiAKPiBUaGlzIG1lYW5zIHdl
IGNhbm5vdCBmaXggdGhlIHY0bCBmb2xsb3dfcGZuIHVzYWdlIHRocm91Z2gKPiBtbXVfbm90aWZp
ZXIsIHdpdGhvdXQgYnJlYWtpbmcgaG93IHRoaXMgYWxsIHdvcmtzLiBUaGUgb25seSByZWFsIGZp
eAo+IGlzIHRvIGRlcHJlY2F0ZSB1c2VycHRyIHN1cHBvcnQgZm9yIFZNX0lPIHwgVk1fUEZOTUFQ
IG1hcHBpbmdzIGFuZAo+IHRlbGwgZXZlcnlvbmUgdG8gY3V0IG92ZXIgdG8gZG1hLWJ1ZiBtZW1v
cnkgc2hhcmluZyBmb3IgemVyb2NvcHkuCj4gCj4gdXNlcnB0ciBmb3Igbm9ybWFsIG1lbW9yeSB3
aWxsIGtlZXAgd29ya2luZyBhcy1pcy4KCkkgd29uJ3QgcmVwZWF0IGhlcmUgdGhlIGRpc2N1c3Np
b25zIGZvciBwYXRjaCAwOS8xNywgYnV0Cmp1c3QgdG8gYmUgY2xlYXIgYWJvdXQgdGhpcyBvbmU6
CgpOQUNLLgoKV2UgbmVlZCBhIGJldHRlciBhbHRlcm5hdGl2ZSB0byBhdm9pZCBicmVha2luZyBl
eGlzdGluZwptZWRpYSBhcHBsaWNhdGlvbnMuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBKYXNvbiBHdW50aG9ycGUgPGpn
Z0B6aWVwZS5jYT4KPiBDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gQ2M6
IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgo+IENjOiBBbmRyZXcgTW9y
dG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+Cj4gQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29t
Pgo+IENjOiBKYW4gS2FyYSA8amFja0BzdXNlLmN6Pgo+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5q
LndpbGxpYW1zQGludGVsLmNvbT4KPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4gQ2M6IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2
Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IFBh
d2VsIE9zY2lhayA8cGF3ZWxAb3NjaWFrLmNvbT4KPiBDYzogTWFyZWsgU3p5cHJvd3NraSA8bS5z
enlwcm93c2tpQHNhbXN1bmcuY29tPgo+IENjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJr
QHNhbXN1bmcuY29tPgo+IENjOiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPgo+IENj
OiBMYXVyZW50IER1Zm91ciA8bGR1Zm91ckBsaW51eC5pYm0uY29tPgo+IENjOiBWbGFzdGltaWwg
QmFia2EgPHZiYWJrYUBzdXNlLmN6Pgo+IENjOiBEYW5pZWwgSm9yZGFuIDxkYW5pZWwubS5qb3Jk
YW5Ab3JhY2xlLmNvbT4KPiBDYzogTWljaGVsIExlc3BpbmFzc2UgPHdhbGtlbkBnb29nbGUuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvZnJhbWVfdmVjdG9yLmMg
fCAyICstCj4gIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1jb250aWcuYyB8
IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi9mcmFtZV92
ZWN0b3IuYyBiL2RyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi9mcmFtZV92ZWN0b3IuYwo+
IGluZGV4IDJiMGI5Nzc2MWQxNS4uYTFiODVmZTllN2MxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvY29tbW9uL3ZpZGVvYnVmMi9mcmFtZV92ZWN0b3IuYwo+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvY29tbW9uL3ZpZGVvYnVmMi9mcmFtZV92ZWN0b3IuYwo+IEBAIC02OSw3ICs2OSw3IEBAIGlu
dCBnZXRfdmFkZHJfZnJhbWVzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGludCBucl9m
cmFtZXMsCj4gIAkJCWJyZWFrOwo+ICAKPiAgCQl3aGlsZSAocmV0IDwgbnJfZnJhbWVzICYmIHN0
YXJ0ICsgUEFHRV9TSVpFIDw9IHZtYS0+dm1fZW5kKSB7Cj4gLQkJCWVyciA9IGZvbGxvd19wZm4o
dm1hLCBzdGFydCwgJm51bXNbcmV0XSk7Cj4gKwkJCWVyciA9IHVuc2FmZV9mb2xsb3dfcGZuKHZt
YSwgc3RhcnQsICZudW1zW3JldF0pOwo+ICAJCQlpZiAoZXJyKSB7Cj4gIAkJCQlpZiAocmV0ID09
IDApCj4gIAkJCQkJcmV0ID0gZXJyOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Y0bDIt
Y29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRl
b2J1Zi1kbWEtY29udGlnLmMKPiBpbmRleCA1MjMxMmNlMmJhMDUuLjgyMWM0YTc2YWI5NiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMK
PiArKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKPiBA
QCAtMTgzLDcgKzE4Myw3IEBAIHN0YXRpYyBpbnQgdmlkZW9idWZfZG1hX2NvbnRpZ191c2VyX2dl
dChzdHJ1Y3QgdmlkZW9idWZfZG1hX2NvbnRpZ19tZW1vcnkgKm1lbSwKPiAgCXVzZXJfYWRkcmVz
cyA9IHVudGFnZ2VkX2JhZGRyOwo+ICAKPiAgCXdoaWxlIChwYWdlc19kb25lIDwgKG1lbS0+c2l6
ZSA+PiBQQUdFX1NISUZUKSkgewo+IC0JCXJldCA9IGZvbGxvd19wZm4odm1hLCB1c2VyX2FkZHJl
c3MsICZ0aGlzX3Bmbik7Cj4gKwkJcmV0ID0gdW5zYWZlX2ZvbGxvd19wZm4odm1hLCB1c2VyX2Fk
ZHJlc3MsICZ0aGlzX3Bmbik7Cj4gIAkJaWYgKHJldCkKPiAgCQkJYnJlYWs7Cj4gIAoKCgpUaGFu
a3MsCk1hdXJvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
