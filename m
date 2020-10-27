Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D529A95A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 11:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31196EB5F;
	Tue, 27 Oct 2020 10:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFF86EB62
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 10:18:18 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id y186so741487oia.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 03:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YjXYxaFPwSeN30BLPfmc3I2KnuswdrHPK9m/TSUfAjQ=;
 b=kUbKUBT0LzTVLn0pxmm+MNdCOgrLoI3cXBm9DqcbnxPwzr4DkWgWzvZ9EhIdI1I+Rj
 10xlKQj1rQACU0jhG6X1mVHVlEZQaYp9tiywAR42lIBmQCGZbuVvG9YvZjENoC3nFXfx
 AIQE6y2+OC/imjrzBqMhOvnN9XSH5nLRpH5lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YjXYxaFPwSeN30BLPfmc3I2KnuswdrHPK9m/TSUfAjQ=;
 b=iZS85Jkt1OC99XAVVxU/saA2WC7bKy/UysJCQWpeKJolw0FN2ak7FhFDmyWU+I3y0O
 8s0MA6vXvHA42UzGlW6WxvmGmqnUMeKcjQ8Djb+Goyr7Ghw23uXbFuf0sRlGs8rspKoc
 9ltUyyPSash/3raVzZSoYOqSXGFgdbP5jxzy13IMnAHrZt4TUara0InBbIwdZU3t02Yt
 TwSvKiVNYgGdlkHWD7V6YFB7g0P9JGUGVTqg3Hw4Kysq7FS6Ui778MXoPr/kG5VnLVrN
 jQMglXT2YhvQImSKIWXRU4TtlS49nLLWOfBc8si0Gse1di59YyI6YLbbBYoCf6CUOyeG
 XtOw==
X-Gm-Message-State: AOAM530LnRJjeEQJB223KnUcn4Qs1jFe5fFVTAyN3wuPqLFWKr0pgGqC
 u/pmlg6VbWnDQcDW+KCOCPRJWQkUXWQhXMzBY7yayg==
X-Google-Smtp-Source: ABdhPJzaItJivtZErHQMoBUWOCNpV8MjpWkJm/S/9oieHueLsdvGo+hu/4SSiaOPE/nNvWtvohs7tvbJeD0owr2bPoU=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr936257oig.128.1603793897422;
 Tue, 27 Oct 2020 03:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <UQ4Aj6rvEUPvWt1cTYlNRLNoawlAIGTCnzstzNkRjZkv_NH-jIpnL7Xt9kGALYGc1M0RzZS0BcdvTb0V4przOwP8UBG_Xm6q2yRjCi3n-QE=@emersion.fr>
 <CAKMK7uFtesxom12TL4MX2rAb2eW2nEmh5gfeCG-wVAyfNvkGRw@mail.gmail.com>
 <ef0788e4-d645-6f71-bece-fb8bcd0cb3c7@suse.de>
In-Reply-To: <ef0788e4-d645-6f71-bece-fb8bcd0cb3c7@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 27 Oct 2020 11:18:06 +0100
Message-ID: <CAKMK7uHX2j2nKFWfk1KReGymto8HEVVG_L8wQAzqe4X+WoFeYw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/vkms: Set preferred depth correctly
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMTE6MTMgQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gSGkKPgo+IEFtIDE2LjEwLjIwIHVtIDEzOjM1IHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+IE9uIEZyaSwgT2N0IDE2LCAyMDIwIGF0IDEyOjM4IFBN
IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4gd3JvdGU6Cj4gPj4KPiA+Pj4gVGhlIG9u
bHkgdGhpbmcgd2Ugc3VwcG9ydCBpcyB4cmdiODg4OC4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPj4+IENjOiBSb2Ry
aWdvIFNpcXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4KPiA+Pj4gQ2M6IE1l
bGlzc2EgV2VuIDxtZWxpc3NhLnNyd0BnbWFpbC5jb20+Cj4gPj4+IENjOiBIYW5lZW4gTW9oYW1t
ZWQgPGhhbW9oYW1tZWQuc2FAZ21haWwuY29tPgo+ID4+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+ID4+PiAtLS0KPiA+Pj4gIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNf
ZHJ2LmMgfCAyICstCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3Zr
bXNfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jCj4gPj4+IGluZGV4IDcy
NjgwMWFiNDRkNC4uZWI0MDA3NDQzNzA2IDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdmttcy92a21zX2Rydi5jCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNf
ZHJ2LmMKPiA+Pj4gQEAgLTEyNCw3ICsxMjQsNyBAQCBzdGF0aWMgaW50IHZrbXNfbW9kZXNldF9p
bml0KHN0cnVjdCB2a21zX2RldmljZSAqdmttc2RldikKPiA+Pj4gICAgICAgZGV2LT5tb2RlX2Nv
bmZpZy5tYXhfaGVpZ2h0ID0gWVJFU19NQVg7Cj4gPj4+ICAgICAgIGRldi0+bW9kZV9jb25maWcu
Y3Vyc29yX3dpZHRoID0gNTEyOwo+ID4+PiAgICAgICBkZXYtPm1vZGVfY29uZmlnLmN1cnNvcl9o
ZWlnaHQgPSA1MTI7Cj4gPj4+IC0gICAgIGRldi0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRo
ID0gMjQ7Cj4gPj4+ICsgICAgIGRldi0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMzI7
Cj4gPj4KPiA+PiBBcmUgeW91IHN1cmUgeHJnYjg4ODgncyBkZXB0aCBpcyAzMiBhbmQgbm90IDI0
PyBMb29raW5nIGF0IGRybWRiIFsxXSwgKmFsbCoKPiA+PiBkcml2ZXJzIHNldCBpdCB0byAyNC4K
PiA+Cj4gPiBVaCB0aGVyZSdzIGEgcHJvYmxlbSBJIHRoaW5rLiBEZXB0aCBzaG91bGQgaW5kZWVk
IHN0YXkgYXQgMjQsIHRoZQo+ID4gcHJvYmxlbSBpcyB0aGF0IGZiIGhlbHBlcnMgZGlyZWN0bHkg
dGFrZSB0aGF0IHRvIGJlIHRoZSBicHAgcGFyYW1ldGVyLAo+ID4gd2hpY2ggaXMgYSBkaWZmZXJl
bnQgdGhpbmcuIEFuZCBpZiB5b3UgbG9vayBhdCBob3cgbW9zdCBkcml2ZXJzIHNldCB1cAo+ID4g
dGhhdCwgdGhleSBwaWNrIDMyLgo+ID4KPiA+IEkgZ3Vlc3MgSSBuZWVkIHRvIHJldmVydCB0aGlz
IGhlcmUsIGFuZCB1bmNvbmZ1c2UgdGhlIGZiIGhlbHBlcnMgYWJvdXQKPiA+IGRlcHRoIHZzIGJw
cC4KPgo+IEkganVzdCBwcmVwYXJlZCB0aGUgUFIgZm9yIGRybS1taXNjLW5leHQsIGJ1dCBzYXcg
aXQgYXQgMzIgc3RpbGwuIFdhcwo+IHRoaXMgc3VwcG9zZWQgdG8gYmUgcmV2ZXJ0ZWQ/CgpSZXZl
cnQgbWFrZXMgZmJkZXYgZ28gYm9vbSwgb25seSB0aGluZyB0aGF0IHdvdWxkIHdvcmsgaXMgbGVh
dmluZyBpdAphdCAwIHNvIHRoYXQgZXZlcnlvbmUgcGlja3MgdGhlIGRlZmF1bHQuIEkndmUgdHJp
ZWQgdG8gY29tZSB1cCB3aXRoIGEKcGF0Y2ggc2VyaWVzIHRvIGNsZWFuIHVwIHRoaXMgbWVzcywg
YnV0IGl0J3MgcmF0aGVyIGhvcnJpYmxlIDotLwotRGFuaWVsCgo+Cj4gQmVzdCByZWdhcmRzCj4g
VGhvbWFzCj4KPiA+Cj4gPiBNYXliZSBiZXN0IHdvdWxkIGJlIHRvIGp1c3Qgc3dpdGNoIG92ZXIg
dG8gcHJlZmVycmVkIGRybV9mb3VyY2MgZm9ybWF0Cj4gPiBjb2RlLCBvciBtYXliZSBqdXN0IHBp
Y2sgdGhpcyB1cCBmcm9tIHRoZSBmaXJzdCBmb3JtYXQgdGhlIHByaW1hcnkKPiA+IHBsYW5lIHN1
cHBvcnRzLgo+ID4KPiA+IFRoaXMgaXMgYWxsIGdldHRpbmcgc2xpZ2h0bHkgdHJpY2t5IGFuZCBh
IGxvdCBtb3JlIHdvcmsgOi0vCj4gPiAtRGFuaWVsCj4gPiAtLQo+ID4gRGFuaWVsIFZldHRlcgo+
ID4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPiBodHRwOi8vYmxvZy5m
ZndsbC5jaAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCj4gPgo+Cj4gLS0KPiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXIKPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKPiBN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKPiAoSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCgotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
