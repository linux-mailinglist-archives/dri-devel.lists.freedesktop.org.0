Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B76A8E085
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 00:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9301D892C9;
	Wed, 14 Aug 2019 22:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52177892C9;
 Wed, 14 Aug 2019 22:14:48 +0000 (UTC)
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net
 [73.223.200.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97C652064A;
 Wed, 14 Aug 2019 22:14:47 +0000 (UTC)
Date: Wed, 14 Aug 2019 15:14:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/5] mm: Check if mmu notifier callbacks are allowed to
 fail
Message-Id: <20190814151447.e9ab74f4c7ed4297e39321d1@linux-foundation.org>
In-Reply-To: <20190814202027.18735-2-daniel.vetter@ffwll.ch>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-2-daniel.vetter@ffwll.ch>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565820888;
 bh=UI7guIwUhxj2d7avxjaE7hMxiiSK2A0bwoAKP8qw2sk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kgdL+2SiVRNwSW1JH17ZCHCofzHSIpTR4YWsnpsl1DebWSKDpe5dUCISgu8Up/S+V
 wgHLmG+J9tdZ0hOfZk+W2Gz3gtDTZ1kwYLUSkUSYDNbrgubOrLmnymmaQQqM86LjYb
 4pgir0WNhhiFRt0JrlAp8mqwek9vmFjP5iLFjw8w=
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
Cc: Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNCBBdWcgMjAxOSAyMjoyMDoyMyArMDIwMCBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKCj4gSnVzdCBhIGJpdCBvZiBwYXJhbm9pYSwgc2luY2Ug
aWYgd2Ugc3RhcnQgcHVzaGluZyB0aGlzIGRlZXAgaW50bwo+IGNhbGxjaGFpbnMgaXQncyBoYXJk
IHRvIHNwb3QgYWxsIHBsYWNlcyB3aGVyZSBhbiBtbXUgbm90aWZpZXIKPiBpbXBsZW1lbnRhdGlv
biBtaWdodCBmYWlsIHdoZW4gaXQncyBub3QgYWxsb3dlZCB0by4KPiAKPiBJbnNwaXJlZCBieSBz
b21lIGNvbmZ1c2lvbiB3ZSBoYWQgZGlzY3Vzc2luZyBpOTE1IG1tdSBub3RpZmllcnMgYW5kCj4g
d2hldGhlciB3ZSBjb3VsZCB1c2UgdGhlIG5ld2x5LWludHJvZHVjZWQgcmV0dXJuIHZhbHVlIHRv
IGhhbmRsZSBzb21lCj4gY29ybmVyIGNhc2VzLiBVbnRpbCB3ZSByZWFsaXplZCB0aGF0IHRoZXNl
IGFyZSBvbmx5IGZvciB3aGVuIGEgdGFzawo+IGhhcyBiZWVuIGtpbGxlZCBieSB0aGUgb29tIHJl
YXBlci4KPiAKPiBBbiBhbHRlcm5hdGl2ZSBhcHByb2FjaCB3b3VsZCBiZSB0byBzcGxpdCB0aGUg
Y2FsbGJhY2sgaW50byB0d28KPiB2ZXJzaW9ucywgb25lIHdpdGggdGhlIGludCByZXR1cm4gdmFs
dWUsIGFuZCB0aGUgb3RoZXIgd2l0aCB2b2lkCj4gcmV0dXJuIHZhbHVlIGxpa2UgaW4gb2xkZXIg
a2VybmVscy4gQnV0IHRoYXQncyBhIGxvdCBtb3JlIGNodXJuIGZvcgo+IGZhaXJseSBsaXR0bGUg
Z2FpbiBJIHRoaW5rLgo+IAo+IFN1bW1hcnkgZnJvbSB0aGUgbS1sIGRpc2N1c3Npb24gb24gd2h5
IHdlIHdhbnQgc29tZXRoaW5nIGF0IHdhcm5pbmcKPiBsZXZlbDogVGhpcyBhbGxvd3MgYXV0b21h
dGVkIHRvb2xpbmcgaW4gQ0kgdG8gY2F0Y2ggYnVncyB3aXRob3V0Cj4gaHVtYW5zIGhhdmluZyB0
byBsb29rIGF0IGV2ZXJ5dGhpbmcuIElmIHdlIGp1c3QgdXBncmFkZSB0aGUgZXhpc3RpbmcKPiBw
cl9pbmZvIHRvIGEgcHJfd2FybiwgdGhlbiB3ZSdsbCBoYXZlIGZhbHNlIHBvc2l0aXZlcy4gQW5k
IGFzLWlzLCBubwo+IG9uZSB3aWxsIGV2ZXIgc3BvdCB0aGUgcHJvYmxlbSBzaW5jZSBpdCdzIGxv
c3QgaW4gdGhlIG1hc3NpdmUgYW1vdW50cwo+IG9mIG92ZXJhbGwgZG1lc2cgbm9pc2UuCj4gCj4g
Li4uCj4KPiAtLS0gYS9tbS9tbXVfbm90aWZpZXIuYwo+ICsrKyBiL21tL21tdV9ub3RpZmllci5j
Cj4gQEAgLTE3OSw2ICsxNzksOCBAQCBpbnQgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5n
ZV9zdGFydChzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPiAgCQkJCXByX2luZm8o
IiVwUyBjYWxsYmFjayBmYWlsZWQgd2l0aCAlZCBpbiAlc2Jsb2NrYWJsZSBjb250ZXh0LlxuIiwK
PiAgCQkJCQltbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0LCBfcmV0LAo+ICAJCQkJCSFt
bXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJhbmdlKSA/ICJub24tIiA6ICIiKTsKPiArCQkJ
CVdBUk5fT04obW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkgfHwKPiArCQkJCQly
ZXQgIT0gLUVBR0FJTik7Cj4gIAkJCQlyZXQgPSBfcmV0Owo+ICAJCQl9Cj4gIAkJfQoKQSBwcm9i
bGVtIHdpdGggV0FSTl9PTihhIHx8IGIpIGlzIHRoYXQgaWYgaXQgdHJpZ2dlcnMsIHdlIGRvbid0
IGtub3cKd2hldGhlciBpdCB3YXMgYmVjYXVzZSBvZiBhIG9yIGJlY2F1c2Ugb2YgYi4gIE9yIGJv
dGguICBTbyBJJ2Qgc3VnZ2VzdAoKCVdBUk5fT04oYSk7CglXQVJOX09OKGIpOwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
