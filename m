Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798A4863A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03170890A5;
	Mon, 17 Jun 2019 14:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1652A892CF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:56:39 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDD62208CB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:56:38 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id s15so11010983qtk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 07:56:38 -0700 (PDT)
X-Gm-Message-State: APjAAAXfi/ZijIufEYoMpwCH2ihkg/BYwXiCWn7lHjuzrxA8Sslz2RJm
 nh5CWhMsj+fxRawTHsPJfNtDMCbt4e0GTEdb+g==
X-Google-Smtp-Source: APXvYqzxVdl7Y1lZz9wV0XaDJ3wazZe2TmVcOoeycDqg+TG2532qtzvFeeqPAFtry8CqA4vsKpAa73bssQVFV/qMNLs=
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr95453640qtc.300.1560783397983; 
 Mon, 17 Jun 2019 07:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190610170440.28525-1-robh@kernel.org>
 <CAAObsKAvmtHSja+-XW5aWHiBNiKdanjN1OHKZTpx1O9v__E_Dw@mail.gmail.com>
 <CAL_Jsq+DPmcBr5r_vB1ucRYR2MXey_jpGPTZ16Q9Ab0dx8u_uw@mail.gmail.com>
 <CAAObsKDDZRhNijcAy3LXXYB=rB4v-rH_VR9JNsWiq+C4Dt8YSA@mail.gmail.com>
In-Reply-To: <CAAObsKDDZRhNijcAy3LXXYB=rB4v-rH_VR9JNsWiq+C4Dt8YSA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jun 2019 08:56:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKF8re3TB8aCUktHXGQBCuAQmvhiHo+zcR=4_fD49drAQ@mail.gmail.com>
Message-ID: <CAL_JsqKF8re3TB8aCUktHXGQBCuAQmvhiHo+zcR=4_fD49drAQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/panfrost: Add support for mapping BOs on GPU page
 faults
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560783398;
 bh=8ZHg1a6iDEnrkkwOnw4t9PWerf6xY+bX9mprmp9L8ls=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ABiwrGv3Nto5iEyRNPCSsPcxPLuP3s/DdYBtgLMNjWRFhFNbfvGAsg8JSz4sjtpqx
 qvnQCQwM3bHdE/GcMgdDu2HR20dsgrnzc98jtKLQubchanolOgmNmqHBvMKU6R2/zv
 fpJy3A9Ztr/gvba5gRl1LP5WBeaPKjInlJ6So5AE=
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgMTE6MTUgUE0gVG9tZXUgVml6b3NvCjx0b21ldS52aXpv
c29AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIDE0IEp1biAyMDE5IGF0IDIzOjIy
LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEp1
biAxMiwgMjAxOSBhdCA2OjU1IEFNIFRvbWV1IFZpem9zbyA8dG9tZXVAdG9tZXV2aXpvc28ubmV0
PiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCAxMCBKdW4gMjAxOSBhdCAxOTowNiwgUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGUgbWlkZ2Fy
ZC9iaWZyb3N0IEdQVXMgbmVlZCB0byBhbGxvY2F0ZSBHUFUgbWVtb3J5IHdoaWNoIGlzIGFsbG9j
YXRlZAo+ID4gPiA+IG9uIEdQVSBwYWdlIGZhdWx0cyBhbmQgbm90IHBpbm5lZCBpbiBtZW1vcnku
IFRoZSB2ZW5kb3IgZHJpdmVyIGNhbGxzCj4gPiA+ID4gdGhpcyBmdW5jdGlvbmFsaXR5IEdST1df
T05fR1BGLgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBpbXBsZW1lbnRhdGlvbiBhc3N1bWVzIHRoYXQg
Qk9zIGFsbG9jYXRlZCB3aXRoIHRoZQo+ID4gPiA+IFBBTkZST1NUX0JPX05PTUFQIGZsYWcgYXJl
IG5ldmVyIG1tYXBwZWQgb3IgZXhwb3J0ZWQuIEJvdGggb2YgdGhvc2UgbWF5Cj4gPiA+ID4gYWN0
dWFsbHkgd29yaywgYnV0IEknbSB1bnN1cmUgaWYgdGhlcmUncyBzb21lIGludGVyYWN0aW9uIHRo
ZXJlLiBJdAo+ID4gPiA+IHdvdWxkIGNhdXNlIHRoZSB3aG9sZSBvYmplY3QgdG8gYmUgcGlubmVk
IGluIG1lbW9yeSB3aGljaCB3b3VsZCBkZWZlYXQKPiA+ID4gPiB0aGUgcG9pbnQgb2YgdGhpcy4K
PiA+ID4gPgo+ID4gPiA+IElzc3Vlcy9xdWVzdGlvbnMvdGhvdWdodHM6Cj4gPiA+ID4KPiA+ID4g
PiBXaGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBpX21hcHBpbmcgYW5kIGZfbWFwcGluZz8K
PiA+ID4gPgo+ID4gPiA+IFdoYXQga2luZCBvZiBjbGVhbi11cCBvbiBjbG9zZSBpcyBuZWVkZWQ/
IEJhc2VkIG9uIHZnZW0gZmF1bHRzLCB0aGVyZQo+ID4gPiA+IGRvZXNuJ3Qgc2VlbSB0byBiZSBh
bnkgcmVmY291bnRpbmcuIEFzc3VtZSB1c2Vyc3BhY2UgaXMgcmVzcG9uc2libGUgZm9yCj4gPiA+
ID4gbm90IGZyZWVpbmcgdGhlIEJPIHdoaWxlIGEgcGFnZSBmYXVsdCBjYW4gb2NjdXI/Cj4gPiA+
Cj4gPiA+IEFyZW4ndCB3ZSB0YWtpbmcgYSByZWZlcmVuY2Ugb24gYWxsIEJPcyB0aGF0IGEgam9i
IHJlbGF0ZXMgdG8gYW5kCj4gPiA+IHVucmVmZXJlbmNpbmcgdGhlbSBvbmNlIHRoZSBqb2IgaXMg
ZG9uZT8gSSB3b3VsZCB0aGluayB0aGF0IHRoYXQncwo+ID4gPiBlbm91Z2gsIG9yIGFtIEkgbWlz
c2luZyBzb21ldGhpbmc/Cj4gPgo+ID4gTm8sIEkgdGhpbmsgd2UncmUgZmluZS4KPiA+Cj4gPiA+
ID4gV2hhdCBhYm91dCBldmljdGlvbnM/IE5lZWQgdG8gY2FsbCBtYXBwaW5nX3NldF91bmV2aWN0
YWJsZSgpPyBNYXliZSB3ZQo+ID4gPiA+IHdhbnQgdGhlc2UgcGFnZXMgdG8gYmUgc3dhcHBhYmxl
LCBidXQgdGhlbiB3ZSBuZWVkIHNvbWUgbm90aWZpY2F0aW9uIHRvCj4gPiA+ID4gdW5tYXAgdGhl
bS4KPiA+ID4KPiA+ID4gSSdtIG5vdCBzdXJlIHRoZXJlJ3MgbXVjaCBwb2ludCBpbiBzd2FwcGlu
ZyBvdXQgcGFnZXMgd2l0aCBsaWZldGltZXMKPiA+ID4gb2YgYSBmZXcgbWlsbGlzZWNvbmRzLgo+
ID4KPiA+IFRoZSBsaWZldGltZSBpcyAqZm9yZXZlciogdGhvdWdoLiBJZiB3ZSBkb24ndCBhbGxv
dyBzd2FwcGluZywgdGhlbiB0aGUKPiA+IGhlYXAgaXMgZ3JvdyBvbmx5IHVudGlsIHRoZSBGRCBp
cyBjbG9zZWQuIElJUkMsIHRoZSBtYXhpbXVtIHNpemUgaXMgb24KPiA+IHRoZSBvcmRlciBvZiAx
R0IuIFNlZW1zIGxpa2UgeW91J2Qgd2FudCB0byBzaHJpbmsgaXQgd2l0aCBzb21lCj4gPiB0cmln
Z2VyLgo+Cj4gSSB0aG91Z2h0IHRoYXQgdGhlIGxpZmV0aW1lIG9mIHRoZSAqY29udGVudHMqIG9m
IHRoZSBoZWFwIHdhcyB0aGF0IG9mCj4gdGhlIGpvYiBjaGFpbiB0aGF0IHdyb3RlIHRoZW0/IE90
aGVyd2lzZSwgb25seSB0aGUgR1BVIHdvdWxkIGtub3cgd2hhdAo+IGNhbiBiZSBkaXNjYXJkZWQu
CgpZZXMsIHRoYXQncyBwcm9iYWJseSB0cnVlLiBUbyB0YWtlIHRoYXQgdG8gdGhlIGV4dHJlbWUs
IHdlIGNvdWxkCmFsbG9jYXRlIGFuZCBmcmVlIHRoZSBoZWFwIEJPIG9uIGVhY2ggam9iIGNoYWlu
LiBCdXQgd2UgZG9uJ3QgZG8gdGhhdApiZWNhdXNlIG9mIHRoZSBvdmVyaGVhZC4gU28gbWFwcGlu
ZyBhbmQgdW5tYXBwaW5nIGlzIGEgc2ltaWxhciB0cmFkZQpvZmYgb2YgZnJlcXVlbmN5IHZzLiBv
dmVyaGVhZC4gVGhlIHF1ZXN0aW9uIGlzIHdoZW4gZG8gd2UgYWxsb3cgcGFnZXMKdG8gYmUgc3dh
cHBlZCBvdXQgKGFzIHRoYXQgaXMgdW5oYW5kbGVkIGluIHRoZSBjdXJyZW50IHBhdGNoKT8gT3Vy
CmNob2ljZXMgYXJlOgoKLSBhdCBhbnkgdGltZS4gVGhpcyBpcyB3aGF0IHRoZSBwYXRjaCBjdXJy
ZW50bHkgZG9lcyBhcyB3ZSBkb24ndApwcmV2ZW50IGV2aWN0aW9uLiBUaG91Z2ggd2UnZCBuZWVk
IHNvbWUgbWVjaGFuaXNtIHRvIGJlIG5vdGlmaWVkIHdoZW4KYSBwYWdlIGlzIGV2aWN0ZWQgd2hp
Y2ggaXMgY3VycmVudGx5IG1pc3NpbmcuCi0gd2hlbiBhIGpvYiBmaW5pc2hlcy4gV2UnZCBoYXZl
IHRvIGl0ZXJhdGUgdGhydSBCTydzIGFuZCBtYXJrIHBhZ2VzCmV2aWN0LWFibGUgb24gTk9NQVAg
Qk9zLiBOb3Qgc3VyZSB3aGVyZSB3ZSBkbyB0aGF0IGluIHRoZSBkcml2ZXIuCi0gd2hlbiB0aGUg
Qk8gaXMgZnJlZWQuIFRoaXMgaXMgdGhlIGVhc2llc3QgdG8gaW1wbGVtZW50Li4uCgpSb2IKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
