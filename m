Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48C479A5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 07:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762B089058;
	Mon, 17 Jun 2019 05:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC3489058
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 05:15:58 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id r185so12497801iod.6
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 22:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z/xQIH3LBg+VAK1KLRnICDLPmbbtsFmk2qarVRS+XwA=;
 b=G16xsfwwYNpfUCQPyZze0OBuyCJ6YKzc1l/u1ZIS+TJgoC3frZ/0Pjo9i7WYOUKTgQ
 isGeZpxeztKwCO/J7uJ4xrhK9UKNJ6imIsO7xjqHnYK6k7WsKqmtrQu+Tvrav73jRv7I
 PZczROQhOPP4JN5YsW2fPTmE9KGqED3hTrIlPyCtUSex4NpEzTHkILxdysnFi6uKom1h
 jmtP96GuHDddszvAC7OC44fWZTygJRJXBCNcr0pLy6EhvfGIARyKWSG7a2IrDrUO6UKY
 EredkyU2lAH2Cm8GrRM+F4j8/18ns9zhMb+rYRerBgdkb7OjqSzNDPZ5ZzSC0nZkTc7R
 u1vw==
X-Gm-Message-State: APjAAAVBMq8JVmMMjO1sj2WyoLDoaDy+fApA54RiqXGynMecDkyaJhLd
 toF7jyNoAuQHqDVvLxZYpnNCZ6gNs7/rmSVWcSt3nDTL
X-Google-Smtp-Source: APXvYqxrhmIkOIix3CBZC0rI2jxSoPNRq84hy87mbrhSLSc9HZ8DOGrLPOGAUji8tVTPYuxutRmfp1JCQUZKs2s5+YE=
X-Received: by 2002:a02:7b2d:: with SMTP id q45mr79512851jac.127.1560748557299; 
 Sun, 16 Jun 2019 22:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190610170440.28525-1-robh@kernel.org>
 <CAAObsKAvmtHSja+-XW5aWHiBNiKdanjN1OHKZTpx1O9v__E_Dw@mail.gmail.com>
 <CAL_Jsq+DPmcBr5r_vB1ucRYR2MXey_jpGPTZ16Q9Ab0dx8u_uw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+DPmcBr5r_vB1ucRYR2MXey_jpGPTZ16Q9Ab0dx8u_uw@mail.gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Mon, 17 Jun 2019 07:15:46 +0200
Message-ID: <CAAObsKDDZRhNijcAy3LXXYB=rB4v-rH_VR9JNsWiq+C4Dt8YSA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/panfrost: Add support for mapping BOs on GPU page
 faults
To: Rob Herring <robh@kernel.org>
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

T24gRnJpLCAxNCBKdW4gMjAxOSBhdCAyMzoyMiwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCA2OjU1IEFNIFRvbWV1IFZpem9z
byA8dG9tZXVAdG9tZXV2aXpvc28ubmV0PiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIDEwIEp1biAy
MDE5IGF0IDE5OjA2LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4K
PiA+ID4gVGhlIG1pZGdhcmQvYmlmcm9zdCBHUFVzIG5lZWQgdG8gYWxsb2NhdGUgR1BVIG1lbW9y
eSB3aGljaCBpcyBhbGxvY2F0ZWQKPiA+ID4gb24gR1BVIHBhZ2UgZmF1bHRzIGFuZCBub3QgcGlu
bmVkIGluIG1lbW9yeS4gVGhlIHZlbmRvciBkcml2ZXIgY2FsbHMKPiA+ID4gdGhpcyBmdW5jdGlv
bmFsaXR5IEdST1dfT05fR1BGLgo+ID4gPgo+ID4gPiBUaGlzIGltcGxlbWVudGF0aW9uIGFzc3Vt
ZXMgdGhhdCBCT3MgYWxsb2NhdGVkIHdpdGggdGhlCj4gPiA+IFBBTkZST1NUX0JPX05PTUFQIGZs
YWcgYXJlIG5ldmVyIG1tYXBwZWQgb3IgZXhwb3J0ZWQuIEJvdGggb2YgdGhvc2UgbWF5Cj4gPiA+
IGFjdHVhbGx5IHdvcmssIGJ1dCBJJ20gdW5zdXJlIGlmIHRoZXJlJ3Mgc29tZSBpbnRlcmFjdGlv
biB0aGVyZS4gSXQKPiA+ID4gd291bGQgY2F1c2UgdGhlIHdob2xlIG9iamVjdCB0byBiZSBwaW5u
ZWQgaW4gbWVtb3J5IHdoaWNoIHdvdWxkIGRlZmVhdAo+ID4gPiB0aGUgcG9pbnQgb2YgdGhpcy4K
PiA+ID4KPiA+ID4gSXNzdWVzL3F1ZXN0aW9ucy90aG91Z2h0czoKPiA+ID4KPiA+ID4gV2hhdCdz
IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gaV9tYXBwaW5nIGFuZCBmX21hcHBpbmc/Cj4gPiA+Cj4g
PiA+IFdoYXQga2luZCBvZiBjbGVhbi11cCBvbiBjbG9zZSBpcyBuZWVkZWQ/IEJhc2VkIG9uIHZn
ZW0gZmF1bHRzLCB0aGVyZQo+ID4gPiBkb2Vzbid0IHNlZW0gdG8gYmUgYW55IHJlZmNvdW50aW5n
LiBBc3N1bWUgdXNlcnNwYWNlIGlzIHJlc3BvbnNpYmxlIGZvcgo+ID4gPiBub3QgZnJlZWluZyB0
aGUgQk8gd2hpbGUgYSBwYWdlIGZhdWx0IGNhbiBvY2N1cj8KPiA+Cj4gPiBBcmVuJ3Qgd2UgdGFr
aW5nIGEgcmVmZXJlbmNlIG9uIGFsbCBCT3MgdGhhdCBhIGpvYiByZWxhdGVzIHRvIGFuZAo+ID4g
dW5yZWZlcmVuY2luZyB0aGVtIG9uY2UgdGhlIGpvYiBpcyBkb25lPyBJIHdvdWxkIHRoaW5rIHRo
YXQgdGhhdCdzCj4gPiBlbm91Z2gsIG9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cj4KPiBObywg
SSB0aGluayB3ZSdyZSBmaW5lLgo+Cj4gPiA+IFdoYXQgYWJvdXQgZXZpY3Rpb25zPyBOZWVkIHRv
IGNhbGwgbWFwcGluZ19zZXRfdW5ldmljdGFibGUoKT8gTWF5YmUgd2UKPiA+ID4gd2FudCB0aGVz
ZSBwYWdlcyB0byBiZSBzd2FwcGFibGUsIGJ1dCB0aGVuIHdlIG5lZWQgc29tZSBub3RpZmljYXRp
b24gdG8KPiA+ID4gdW5tYXAgdGhlbS4KPiA+Cj4gPiBJJ20gbm90IHN1cmUgdGhlcmUncyBtdWNo
IHBvaW50IGluIHN3YXBwaW5nIG91dCBwYWdlcyB3aXRoIGxpZmV0aW1lcwo+ID4gb2YgYSBmZXcg
bWlsbGlzZWNvbmRzLgo+Cj4gVGhlIGxpZmV0aW1lIGlzICpmb3JldmVyKiB0aG91Z2guIElmIHdl
IGRvbid0IGFsbG93IHN3YXBwaW5nLCB0aGVuIHRoZQo+IGhlYXAgaXMgZ3JvdyBvbmx5IHVudGls
IHRoZSBGRCBpcyBjbG9zZWQuIElJUkMsIHRoZSBtYXhpbXVtIHNpemUgaXMgb24KPiB0aGUgb3Jk
ZXIgb2YgMUdCLiBTZWVtcyBsaWtlIHlvdSdkIHdhbnQgdG8gc2hyaW5rIGl0IHdpdGggc29tZQo+
IHRyaWdnZXIuCgpJIHRob3VnaHQgdGhhdCB0aGUgbGlmZXRpbWUgb2YgdGhlICpjb250ZW50cyog
b2YgdGhlIGhlYXAgd2FzIHRoYXQgb2YKdGhlIGpvYiBjaGFpbiB0aGF0IHdyb3RlIHRoZW0/IE90
aGVyd2lzZSwgb25seSB0aGUgR1BVIHdvdWxkIGtub3cgd2hhdApjYW4gYmUgZGlzY2FyZGVkLgoK
Q2hlZXJzLAoKVG9tZXUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
