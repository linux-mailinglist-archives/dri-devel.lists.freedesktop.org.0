Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 318974C1E0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 21:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD846E45E;
	Wed, 19 Jun 2019 19:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0FA6E460
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 19:57:29 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id w196so286861oie.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 12:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7z2tqXWz21B1V8yRVcYZ+guCUeprENU4KV1hN3na0Fs=;
 b=EYjLI++SMghoRhRVbsENZ3VR9BEux/fHGDHDn7hvLEiGqtnkSKfc7AKFLKIFPwAxN9
 JFAg1SnqfZ3GCLYprgaQzrB8TnLK2/LUgWe3aonLamArkWVbX6W7wj/tm5HagFVTGRGt
 eu29clUwXDKn3YEanpUvXpQhUUpPpwE0kNIkt4DBX0hFzi1meYhz7yIRalrI/oPVw4/N
 4SDJhAJcmWvPLZ/BFw93fSzMYkk1KbSQskQH23qlpHqrpf4vkD/ZXGVJwJQERNEpmKR/
 /j1xHdJgqyYoak+S+Afqssvv/H4tXxeMHW90AIh9AbOCTk7P3wyHJgJsyGxztx+MvxPf
 WtWQ==
X-Gm-Message-State: APjAAAW9vqEJSX0c18Rw6nh9JcY9uBHFDC3l1x9t297gC8fzFWVxg7kJ
 uj13gEbx06lSaGgvxZhiHo/JhMcTa9P4Ds5cv75RNw==
X-Google-Smtp-Source: APXvYqw5ofouG26OMfQzFxsOzV+EiqO0k+h0EfPvx43Md1F3SX/w73DYzzvppOkjHYp+QM5aupN2Qz3/NdhkpYGtQiw=
X-Received: by 2002:aca:b2d5:: with SMTP id b204mr3542425oif.101.1560974248386; 
 Wed, 19 Jun 2019 12:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
 <20190521154411.GD3836@redhat.com> <20190618152215.GG12905@phenom.ffwll.local>
 <20190619165055.GI9360@ziepe.ca>
In-Reply-To: <20190619165055.GI9360@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Jun 2019 21:57:15 +0200
Message-ID: <CAKMK7uGpupxF8MdyX3_HmOfc+OkGxVM_b9WbF+S-2fHe0F5SQA@mail.gmail.com>
Subject: Re: [PATCH 1/4] mm: Check if mmu notifier callbacks are allowed to
 fail
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7z2tqXWz21B1V8yRVcYZ+guCUeprENU4KV1hN3na0Fs=;
 b=c98keUgte0uTFh2NqchAuIxnX8Q49/GZCgQczWFfVOcAzumkG95NuHQPDWP2WUsqo/
 oCLbH0XtppVL+lGrn05uM9oLm3WIhfibqD8PTm4hTs0/e0Z+Pqsa2VuNsS3X9lc9qmmu
 Z3zqjTkCzBNUM3CWJvMoRhJP+YYYDv1DhjaEA=
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
Cc: Michal Hocko <mhocko@suse.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Rientjes <rientjes@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgNjo1MCBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDU6MjI6MTVQTSArMDIwMCwg
RGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5IDIxLCAyMDE5IGF0IDExOjQ0OjEx
QU0gLTA0MDAsIEplcm9tZSBHbGlzc2Ugd3JvdGU6Cj4gPiA+IE9uIE1vbiwgTWF5IDIwLCAyMDE5
IGF0IDExOjM5OjQyUE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gSnVzdCBh
IGJpdCBvZiBwYXJhbm9pYSwgc2luY2UgaWYgd2Ugc3RhcnQgcHVzaGluZyB0aGlzIGRlZXAgaW50
bwo+ID4gPiA+IGNhbGxjaGFpbnMgaXQncyBoYXJkIHRvIHNwb3QgYWxsIHBsYWNlcyB3aGVyZSBh
biBtbXUgbm90aWZpZXIKPiA+ID4gPiBpbXBsZW1lbnRhdGlvbiBtaWdodCBmYWlsIHdoZW4gaXQn
cyBub3QgYWxsb3dlZCB0by4KPiA+ID4gPgo+ID4gPiA+IEluc3BpcmVkIGJ5IHNvbWUgY29uZnVz
aW9uIHdlIGhhZCBkaXNjdXNzaW5nIGk5MTUgbW11IG5vdGlmaWVycyBhbmQKPiA+ID4gPiB3aGV0
aGVyIHdlIGNvdWxkIHVzZSB0aGUgbmV3bHktaW50cm9kdWNlZCByZXR1cm4gdmFsdWUgdG8gaGFu
ZGxlIHNvbWUKPiA+ID4gPiBjb3JuZXIgY2FzZXMuIFVudGlsIHdlIHJlYWxpemVkIHRoYXQgdGhl
c2UgYXJlIG9ubHkgZm9yIHdoZW4gYSB0YXNrCj4gPiA+ID4gaGFzIGJlZW4ga2lsbGVkIGJ5IHRo
ZSBvb20gcmVhcGVyLgo+ID4gPiA+Cj4gPiA+ID4gQW4gYWx0ZXJuYXRpdmUgYXBwcm9hY2ggd291
bGQgYmUgdG8gc3BsaXQgdGhlIGNhbGxiYWNrIGludG8gdHdvCj4gPiA+ID4gdmVyc2lvbnMsIG9u
ZSB3aXRoIHRoZSBpbnQgcmV0dXJuIHZhbHVlLCBhbmQgdGhlIG90aGVyIHdpdGggdm9pZAo+ID4g
PiA+IHJldHVybiB2YWx1ZSBsaWtlIGluIG9sZGVyIGtlcm5lbHMuIEJ1dCB0aGF0J3MgYSBsb3Qg
bW9yZSBjaHVybiBmb3IKPiA+ID4gPiBmYWlybHkgbGl0dGxlIGdhaW4gSSB0aGluay4KPiA+ID4g
Pgo+ID4gPiA+IFN1bW1hcnkgZnJvbSB0aGUgbS1sIGRpc2N1c3Npb24gb24gd2h5IHdlIHdhbnQg
c29tZXRoaW5nIGF0IHdhcm5pbmcKPiA+ID4gPiBsZXZlbDogVGhpcyBhbGxvd3MgYXV0b21hdGVk
IHRvb2xpbmcgaW4gQ0kgdG8gY2F0Y2ggYnVncyB3aXRob3V0Cj4gPiA+ID4gaHVtYW5zIGhhdmlu
ZyB0byBsb29rIGF0IGV2ZXJ5dGhpbmcuIElmIHdlIGp1c3QgdXBncmFkZSB0aGUgZXhpc3RpbmcK
PiA+ID4gPiBwcl9pbmZvIHRvIGEgcHJfd2FybiwgdGhlbiB3ZSdsbCBoYXZlIGZhbHNlIHBvc2l0
aXZlcy4gQW5kIGFzLWlzLCBubwo+ID4gPiA+IG9uZSB3aWxsIGV2ZXIgc3BvdCB0aGUgcHJvYmxl
bSBzaW5jZSBpdCdzIGxvc3QgaW4gdGhlIG1hc3NpdmUgYW1vdW50cwo+ID4gPiA+IG9mIG92ZXJh
bGwgZG1lc2cgbm9pc2UuCj4gPiA+ID4KPiA+ID4gPiB2MjogRHJvcCB0aGUgZnVsbCBXQVJOX09O
IGJhY2t0cmFjZSBpbiBmYXZvdXIgb2YganVzdCBhIHByX3dhcm4gZm9yCj4gPiA+ID4gdGhlIHBy
b2JsZW1hdGljIGNhc2UgKE1pY2hhbCBIb2NrbykuCj4KPiBJIGRpc2FncmVlIHdpdGggdGhpcyB2
MiBub3RlLCB0aGUgV0FSTl9PTi9XQVJOIHdpbGwgdHJpZ2dlciBjaGVja2Vycwo+IGxpa2Ugc3l6
a2FsbGVyIHRvIHJlcG9ydCBhIGJ1Zywgd2hpbGUgYSByYW5kb20gcHJfd2FybiBwcm9iYWJseSB3
aWxsCj4gbm90Lgo+Cj4gSSBkbyBhZ3JlZSB0aGUgYmFja3RyYWNlIGlzIG5vdCB1c2VmdWwgaGVy
ZSwgYnV0IHdlIGRvbid0IGhhdmUgYQo+IHdhcm4tbm8tYmFja3RyYWNlIHZlcnNpb24uLgo+Cj4g
SU1ITywga2VybmVsL2RyaXZlciBidWdzIHNob3VsZCBhbHdheXMgYmUgcmVwb3J0ZWQgYnkgV0FS
TiAmCj4gZnJpZW5kcy4gV2UgbmV2ZXIgZXhwZWN0IHRvIHNlZSB0aGUgcHJpbnQsIHNvIHdoeSBk
byB3ZSBjYXJlIGhvdyBiaWcKPiBpdCBpcz8KPgo+IEFsc28gbm90ZSB0aGF0IFdBUk4gaW50ZWdy
YXRlcyBhbiB1bmxpa2VseSgpIGludG8gaXQgc28gdGhlIGNvZGVnZW4gaXMKPiBhdXRvbWF0aWNh
bGx5IGEgYml0IG1vcmUgb3B0aW1hbCB0aGF0IHRoZSBpZiAmIHByX3dhcm4gY29tYmluYXRpb24u
CgpXaGVyZSBkbyB5b3UgbWFrZSBhIGRpZmZlcmVuY2UgYmV0d2VlbiBhIFdBUk4gd2l0aG91dCBi
YWNrdHJhY2UgYW5kIGEKcHJfd2Fybj8gVGhleSdyZSBib3RoIGR1bXBlZCBhdCB0aGUgc2FtZSBs
b2ctbGV2ZWwgLi4uCgpJIGNhbiBlYXNpbHkgdGhyb3cgYW4gdW5saWtlbHkgYXJvdW5kIHRoaXMg
aGVyZSBpZiB0aGF0J3MgdGhlIG9ubHkKdGhpbmcgdGhhdCdzIGJsb2NraW5nIHRoZSBtZXJnZS4K
LURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
