Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36396294EEE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 16:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F0E6EDB2;
	Wed, 21 Oct 2020 14:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BFB6EDB2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 14:42:23 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id w25so587887oos.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AfTAgHtdVyrAaS1/nhVnFIFYQUqkwRIKER1d/mcr31s=;
 b=OFfWjJvd0e4xoMAnKosQZX6u4yueJkvQajrGY1gnJgHtnDIJWFT6fq0RgYnrDwWRw+
 gRHeZQoM62EreIDByRy+hh+RB9j+SqRdJPUlf5qW1UjkGm+tTrGcfzuZz+PumuavbfPc
 b7fWM4FcGBuAVp+/h1VQnDUxVv4jkFf54gZSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AfTAgHtdVyrAaS1/nhVnFIFYQUqkwRIKER1d/mcr31s=;
 b=l3yynYup2rAI3vx2D6MyxReVUEvHsvl5ZoMow5bYNnPP9h0hkJO3WZv1blzht5snbb
 PxFScXzu9BD2jhfRMApfEhDK4yBGd5X8akiOKrR1cpElde88mMrnL7/2Fy8mXU1xP9Dy
 BOJPsn+FrsBxOiQ4ebL2anpPOJSrX3m9f4krqtbKooQ/74Xw7tU2RYYL9EbvfN3WWqNc
 xQzFkCSxJQ4hMcSoqJ3qEDjSDx2lFwXQuzxy0GS0bveg4osv2v6ixyTXbkxI2N4P1UbJ
 xb7aEl97btOLa+0btePu/YbUMaEltXoWKyDn7Pd27zZgtXbJGBnFyD/R+5urn4uyfFiE
 c6kQ==
X-Gm-Message-State: AOAM530PsVX215PyQ5XdvLKucOUqFcMtIm/fozNt9S5q2q7NiMXhhtGW
 osbFlCu2O4B3VTuBIGDsW1MrfIPk4Hs/SJ8ShvX+w6RY1guQyw==
X-Google-Smtp-Source: ABdhPJycyct2TB9wVg2Ih3Z02FAHwtZsXVwJzQ0pYxum/KMQuFJw++9YeXuYFSUooQTyT8GemxYhpDCSqAKwx53jYrg=
X-Received: by 2002:a4a:e1d7:: with SMTP id n23mr2839407oot.85.1603291342907; 
 Wed, 21 Oct 2020 07:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch>
 <20201021125030.GK36674@ziepe.ca>
In-Reply-To: <20201021125030.GK36674@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 21 Oct 2020 16:42:11 +0200
Message-ID: <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.com>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjEsIDIwMjAgYXQgMjo1MCBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAyMSwgMjAyMCBhdCAxMDo1Njo1MUFNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gVGhlcmUncyB0aHJlZSB3YXlzIHRvIGFjY2VzcyBQ
Q0kgQkFScyBmcm9tIHVzZXJzcGFjZTogL2Rldi9tZW0sIHN5c2ZzCj4gPiBmaWxlcywgYW5kIHRo
ZSBvbGQgcHJvYyBpbnRlcmZhY2UuIFR3byBjaGVjayBhZ2FpbnN0Cj4gPiBpb21lbV9pc19leGNs
dXNpdmUsIHByb2MgbmV2ZXIgZGlkLiBBbmQgd2l0aCBDT05GSUdfSU9fU1RSSUNUX0RFVk1FTSwK
PiA+IHRoaXMgc3RhcnRzIHRvIG1hdHRlciwgc2luY2Ugd2UgZG9uJ3Qgd2FudCByYW5kb20gdXNl
cnNwYWNlIGhhdmluZwo+ID4gYWNjZXNzIHRvIFBDSSBCQVJzIHdoaWxlIGEgZHJpdmVyIGlzIGxv
YWRlZCBhbmQgdXNpbmcgaXQuCj4gPgo+ID4gRml4IHRoaXMgYnkgYWRkaW5nIHRoZSBzYW1lIGlv
bWVtX2lzX2V4Y2x1c2l2ZSgpIGNoZWNrIHdlIGFscmVhZHkgaGF2ZQo+ID4gb24gdGhlIHN5c2Zz
IHNpZGUgaW4gcGNpX21tYXBfcmVzb3VyY2UoKS4KPiA+Cj4gPiBSZWZlcmVuY2VzOiA5MGE1NDVl
OTgxMjYgKCJyZXN0cmljdCAvZGV2L21lbSB0byBpZGxlIGlvIG1lbW9yeSByYW5nZXMiKQo+ID4g
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4g
PiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4gPiBDYzogS2VlcyBDb29rIDxr
ZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gPiBDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFt
c0BpbnRlbC5jb20+Cj4gPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9u
Lm9yZz4KPiA+IENjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gPiBDYzog
SsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gPiBDYzogSmFuIEthcmEgPGph
Y2tAc3VzZS5jej4KPiA+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNv
bT4KPiA+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiA+IENjOiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiA+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5v
cmcKPiA+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBCam9ybiBIZWxn
YWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgo+ID4gQ2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5v
cmcKPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y29tPgo+Cj4gTWF5YmUgbm90IGZvciBmaXhpbmcgaW4gdGhpcyBzZXJpZXMsIGJ1dCB0aGlzIGFj
Y2VzcyB0bwo+IElPUkVTT1VSQ0VfQlVTWSBkb2Vzbid0IGhhdmUgYW55IGxvY2tpbmcuCj4KPiBU
aGUgd3JpdGUgc2lkZSBob2xkcyB0aGUgcmVzb3VyY2VfbG9jayBhdCBsZWFzdC4uCj4KPiA+ICAg
ICAgIHJldCA9IHBjaV9tbWFwX3BhZ2VfcmFuZ2UoZGV2LCBpLCB2bWEsCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZwcml2LT5tbWFwX3N0YXRlLCB3cml0ZV9jb21iaW5lKTsK
Pgo+IEF0IHRoaXMgcG9pbnQgdGhlIHZtYSBpc24ndCBsaW5rZWQgaW50byB0aGUgYWRkcmVzcyBz
cGFjZSwgc28gZG9lc24ndAo+IHRoaXMgaGFwcGVuPwo+Cj4gICAgICBDUFUgMCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBDUFUxCj4gIG1tYXBfcmVnaW9uKCkKPiAgICB2bWEgPSB2
bV9hcmVhX2FsbG9jCj4gICAgcHJvY19idXNfcGNpX21tYXAKPiAgICAgaW9tZW1faXNfZXhjbHVz
aXZlCj4gICAgIHBjaV9tbWFwX3BhZ2VfcmFuZ2UKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldm9rZV9kZXZtZW0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bm1hcF9tYXBwaW5nX3JhbmdlKCkKPiAgICAgIC8vIHZt
YSBpcyBub3QgbGlua2VkIHRvIHRoZSBhZGRyZXNzIHNwYWNlIGhlcmUsCj4gICAgICAvLyB1bm1h
cCBkb2Vzbid0IGZpbmQgaXQKPiAgIHZtYV9saW5rKCkKPiAgICEhISBUaGUgVk1BIGdldHMgbWFw
cGVkIHdpdGggdGhlIHJldm9rZWQgUFRFcwo+Cj4gSSBjb3VsZG4ndCBmaW5kIGFueXRoaW5nIHRo
YXQgcHJldmVudHMgaXQgYXQgbGVhc3QsIG5vIG1tYXBfc2VtIG9uIHRoZQo+IHVubWFwIHNpZGUs
IGp1c3QgdGhlIGlfbW1hcF9sb2NrCj4KPiBOb3Qgc2VlaW5nIGhvdyBhZGRyZXNzIHNwYWNlIGFu
ZCBwcmUtcG9wdWxhdGluZyBkdXJpbmcgbW1hcCB3b3JrCj4gdG9nZXRoZXI/IERpZCBJIG1pc3Mg
bG9ja2luZyBzb21lcGxhY2U/Cj4KPiBOb3Qgc29tZXRoaW5nIHRvIGJlIGZpeGVkIGZvciB0aGlz
IHNlcmllcywgdGhpcyBpcyBjbGVhcmx5IGFuCj4gaW1wcm92ZW1lbnQsIGJ1dCBzZWVtcyBsaWtl
IGFub3RoZXIgcHJvYmxlbSB0byB0YWNrbGU/CgpVaCB5ZXMuIEluIGRyaXZlcnMvZ3B1IHRoaXMg
aXNuJ3QgYSBwcm9ibGVtIGJlY2F1c2Ugd2Ugb25seSBpbnN0YWxsCnB0ZXMgZnJvbSB0aGUgdm1f
b3BzLT5mYXVsdCBoYW5kbGVyLiBTbyBubyByYWNlcy4gQW5kIEkgZG9uJ3QgdGhpbmsKeW91IGNh
biBmaXggdGhpcyBvdGhlcndpc2UgdGhyb3VnaCBob2xkaW5nIGxvY2tzOiBtbWFwX3NlbSB3ZSBj
YW4ndApob2xkIGJlY2F1c2UgYmVmb3JlIHZtYV9saW5rIHdlIGRvbid0IGV2ZW4ga25vdyB3aGlj
aCBtbV9zdHJ1Y3QgaXMKaW52b2x2ZWQsIHNvIGNhbid0IHNvbHZlIHRoZSByYWNlLiBQbHVzIHRo
aXMgd291bGQgYmUgd29yc2UgdGhhdAptbV90YWtlX2FsbF9sb2NrcyB1c2VkIGJ5IG1tdSBub3Rp
Zmllci4gQW5kIHRoZSBhZGRyZXNzX3NwYWNlCmlfbW1hcF9sb2NrIGlzIGFsc28gbm8gZ29vZCBz
aW5jZSBpdCdzIG5vdCBoZWxkIGR1cmluZyB0aGUgLT5tbWFwCmNhbGxiYWNrLCB3aGVuIHdlIHdy
aXRlIHRoZSBwdGVzLiBBbmQgdGhlIHJlc291cmNlIGxvY2tzIGlzIGV2ZW4gbGVzcwp1c2VmdWws
IHNpbmNlIHdlJ3JlIG5vdCBnb2luZyB0byBob2xkIHRoYXQgYXQgdm1hX2xpbmsoKSB0aW1lIGZv
cgpzdXJlLgoKSGVuY2UgZGVsYXlpbmcgdGhlIHB0ZSB3cml0ZXMgYWZ0ZXIgdGhlIHZtYV9saW5r
LCB3aGljaCBtZWFucyAtPmZhdWx0CnRpbWUsIGxvb2tzIGxpa2UgdGhlIG9ubHkgd2F5IHRvIGNs
b3NlIHRoaXMgZ2FwLgoKVHJvdWJsZSBpcyBJIGhhdmUgbm8gaWRlYSBob3cgdG8gZG8gdGhpcyBj
bGVhbmx5IC4uLgotRGFuaWVsCgoKCi0tCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
