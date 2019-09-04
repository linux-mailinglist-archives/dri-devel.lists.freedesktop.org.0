Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D89A81F0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 14:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E102989971;
	Wed,  4 Sep 2019 12:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEF289971
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 12:13:25 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id n7so12937685otk.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 05:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oL1Ls8siuoOnuGqUqRq+e8wRK/hG+Krs0DxGAa+ONko=;
 b=OoGpbWTe3sLgc9/pRBsnpfJ8QIiV716YI7d8y39OMr7z7BhX/MZMmazYOdHB++A1kP
 uPIHgQe/0GIQl+rwizDzob/MrUUWgiLeEUwrpqC7MNP6G7nLv8CUhP5vb44WhktUMhEF
 3HmTnLvl+w3i9v8HgnECczx0AmqHf35edU1ZOdyqxN4/XEl7YsAb7E3RVAmp5RiUzEXS
 iSeqh0AIfrheSdQDw1gaIATts0+yOm+R2MLwiCiDkyBvOh+5/gCFp+yOenm4WScbvlOR
 6YCcU8vYE50qKpLrveAV4LfLC4VgSL3fA1RAq8bL7ydO6Ncx947lmBeR3RHbk39DNVhw
 5dlw==
X-Gm-Message-State: APjAAAWuFMnqqlqg4r5r7Cq2amDJmTkK6mTsNxfPvbw3qG3GmrlZ+aQo
 ZrB7PgRNJBtRhEgBXMt3f9d2qjMhKpnbRw2cRFTvwA==
X-Google-Smtp-Source: APXvYqzFeeZSjUj0SwkJeAQfED+9rg0eEL4hSfqlseQ6YiC3E4bF5LAEk2cPATzmhMvrMKLP3tl/2a5U0FOUPi6LNjA=
X-Received: by 2002:a9d:6955:: with SMTP id p21mr29325121oto.204.1567599204517; 
 Wed, 04 Sep 2019 05:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190904115644.7620-1-tzimmermann@suse.de>
In-Reply-To: <20190904115644.7620-1-tzimmermann@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 4 Sep 2019 14:13:13 +0200
Message-ID: <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ast,
 mgag200: Map console BO while it's being displayed
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oL1Ls8siuoOnuGqUqRq+e8wRK/hG+Krs0DxGAa+ONko=;
 b=bjIkqJQ7khGvNHMSyFuwuRVrNYBH/+QW9HYz15x6ik/DR5k4YVcQpOEccmmAj1tJE8
 vHfTmjoZbk1mCIP8faOw+Ce6Gfa9vonZFg++2xuyPLLePF+lUNDrnEVK2pbrXH11uoCs
 seUtN9x4l2Z+o/9KZjk799FWnJJn3meRRXnMc=
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
Cc: Feng Tang <feng.tang@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kernel test robot <rong.a.chen@intel.com>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Huang Ying <ying.huang@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxOjU2IFBNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+ICh3YXM6IGRybS92cmFtLWhlbHBlcjogRml4IHBlcmZv
cm1hbmNlIHJlZ3Jlc3Npb24gaW4gZmJkZXYpCj4KPiBHZW5lcmljIGZiZGV2IGVtdWxhdGlvbiBt
YXBzIGFuZCB1bm1hcHMgdGhlIGNvbnNvbGUgQk8gZm9yIHVwZGF0aW5nIGl0J3MKPiBjb250ZW50
IGZyb20gdGhlIHNoYWRvdyBidWZmZXIuIElmIHRoaXMgaW52b2x2ZXMgYW4gYWN0dWFsIG1hcHBp
bmcKPiBvcGVyYXRpb24gKGluc3RlYWQgb2YgcmV1c2luZyBhbiBleGlzdGluZyBtYXBwaW5nKSwg
bG90cyBvZiBkZWJ1ZyBtZXNzYWdlcwo+IG1heSBiZSBwcmludGVkLCBzdWNoIGFzCj4KPiAgIHg4
Ni9QQVQ6IE92ZXJsYXAgYXQgMHhkMDAwMDAwMC0weGQxMDAwMDAwCj4gICB4ODYvUEFUOiByZXNl
cnZlX21lbXR5cGUgYWRkZWQgW21lbSAweGQwMDAwMDAwLTB4ZDAyZmZmZmZdLCB0cmFjayB3cml0
ZS1jb21iaW5pbmcsIHJlcSB3cml0ZS1jb21iaW5pbmcsIHJldCB3cml0ZS1jb21iaW5pbmcKPiAg
IHg4Ni9QQVQ6IGZyZWVfbWVtdHlwZSByZXF1ZXN0IFttZW0gMHhkMDAwMDAwMC0weGQwMmZmZmZm
XQo+Cj4gYXMgcmVwb3J0ZWQgYXQgWzFdLiBEcml2ZXJzIHVzaW5nIFZSQU0gaGVscGVycyBtYXkg
YWxzbyBzZWUgcmVkdWNlZAo+IHBlcmZvcm1hbmNlIGFzIHRoZSBtYXBwaW5nIG9wZXJhdGlvbnMg
Y2FuIGNyZWF0ZSBvdmVyaGVhZC4KPgo+IFRoaXMgcGF0Y2ggc2V0IGZpeGVzIHRoZSBwcm9ibGVt
IGJ5IGFkZGluZyBhIHJlZiBjb3VudGVyIHRvIHRoZSBHRU0KPiBWUkFNIGJ1ZmZlcnMnIGttYXAg
b3BlcmF0aW9uLCBhbmQga2VlcGluZyB0aGUgZmJkZXYncyBjb25zb2xlIGJ1ZmZlcgo+IG1hcHBl
ZCB3aGlsZSB0aGUgY29uc29sZSBpcyBiZWluZyBkaXNwbGF5ZWQuIFRoZXNlIGNoYW5nZXMgYXZv
aWQgdGhlCj4gZnJlcXVlbnQgbWFwcGluZ3MgaW4gdGhlIGZiZGV2IGNvZGUuIFRoZSBkcml2ZXJz
LCBhc3QgYW5kIG1nYWcyMDAsCj4gbWFwIHRoZSBjb25zb2xlJ3MgYnVmZmVyIHdoZW4gaXQgYmVj
b21lcyB2aXNpYmxlIGFuZCB0aGUgZmJkZXYgY29kZQo+IHJldXNlcyB0aGlzIG1hcHBpbmcuIFRo
ZSBvcmlnaW5hbCBmYmRldiBjb2RlIGluIGFzdCBhbmQgbWdhZzIwMCB1c2VkCj4gdGhlIHNhbWUg
c3RyYXRlZ3kuCj4KPiBbMV0gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMv
ZHJpLWRldmVsLzIwMTktU2VwdGVtYmVyLzIzNDMwOC5odG1sCgpBcyBkaXNjdXNzZWQgb24gaXJj
IGEgYml0LCBoZXJlJ3MgbXkgdGhvdWdodHM6CgotIGltbyB3ZSBzaG91bGQgZml4IHRoaXMgYnkg
dXNpbmcgdGhlIGlvX21hcHBpbmcgc3R1ZmYsIHRoYXQgYXZvaWRzCnRoZSBvdmVyaGVhZCBvZiBy
ZXBlYXRlZCBwYXQgY2hlY2tzIGZvciBtYXAvdW5tYXAuIEl0IHNob3VsZCBhbHNvIGN1dApkb3du
IG9uIHJlbWFwcGluZyBjb3N0cyBhIGxvdCBpbiBnZW5lcmFsIChhdCBsZWFzdCBvbiA2NGJpdCBr
ZXJuZWxzLAp3aGljaCBpcyBsaWtlIGV2ZXJ5dGhpbmcgbm93YWRheXMpLiBCdXQgaXQncyBhIGxv
dCBtb3JlIHdvcmsgdG8gcm9sbApvdXQgSSBndWVzcy4gSSB0aGluayB0aGlzIHdvdWxkIGJlIHRo
ZSBtdWNoIGJldHRlciBsb25ndGVybSBmaXguCgotIHRoaXMgaGVyZSBvbmx5IHdvcmtzIHdoZW4g
ZmJjb24gaXMgYWN0aXZlLCB0aGUgbm9pc2Ugd2lsbCBjb21lIGJhY2sKd2hlbiB5b3Ugc3RhcnQg
WCBvciB3YXlsYW5kLiBXZSBzaG91bGQgcHJvYmFibHkgY2hlY2sgd2hldGhlciB0aGUKZGlzcGxh
eSBpcyBhY3RpdmUgd2l0aCBkcm1fbWFzdGVyX2ludGVybmFsX2FjcXVpcmUgKGFuZCByZXVwbG9h
ZCB3aGVuCndlIHJlc3RvcmUgdGhlIGVudGlyZSBjb25zb2xlIGluIHRoZSByZXN0b3JlIGZ1bmN0
aW9uIC0gY291bGQganVzdApsYXVuY2ggdGhlIHdvcmtlciBmb3IgdGhhdCkuCgpJJ20gYWxzbyBu
b3Qgc3VyZSB3aGV0aGVyIHdlIGhhdmUgYSByZWFsIHByb2JsZW0gaGVyZSwgaXQncyBqdXN0IGRl
YnVnCm5vaXNlIHRoYXQgd2UncmUgZmlnaHRpbmcgaGVyZT8KLURhbmllbAoKPgo+IHYyOgo+ICAg
ICAgICAgKiBmaXhlZCBjb21tZW50IHR5cG9zCj4KPiBUaG9tYXMgWmltbWVybWFubiAoMyk6Cj4g
ICBkcm0vdnJhbTogQWRkIGttYXAgcmVmLWNvdW50aW5nIHRvIEdFTSBWUkFNIG9iamVjdHMKPiAg
IGRybS9hc3Q6IE1hcCBmYmRldiBmcmFtZWJ1ZmZlciB3aGlsZSBpdCdzIGJlaW5nIGRpc3BsYXll
ZAo+ICAgZHJtL21nYWcyMDA6IE1hcCBmYmRldiBmcmFtZWJ1ZmZlciB3aGlsZSBpdCdzIGJlaW5n
IGRpc3BsYXllZAo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyAgICAgICAgIHwg
MTkgKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jICB8IDc0
ICsrKysrKysrKysrKysrKysrKystLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfbW9kZS5jIHwgMjAgKysrKysrKwo+ICBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmggICAgICB8IDE5ICsrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMTQgaW5zZXJ0aW9u
cygrKSwgMTggZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMjMuMAo+CgoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3
IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
