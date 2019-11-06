Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3DAF16A2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 14:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66D46ED26;
	Wed,  6 Nov 2019 13:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC446ED26
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 13:06:39 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id s71so20862517oih.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 05:06:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hVc0Tx4X0RQr+pYE32FFQ/Xp5O08qjA8Kck1++y+aVg=;
 b=WPPQRblG/oF3UhPmeFvUziekADTWPsY4TkN9td78fAorsFjR9USjn65j7k3yCfQ1pr
 BfN8AlqOWBaV2gpaUUAe9Pu8JSilkZEqPd2x4ds6+RFF8S/B7LBelbMS2wBzdtKUGbZ9
 2uDsQ9HYJQJy+oepvy49IYGSkRnAm7V7lp8UecObwueoN92UJHegeAiKlJMGc5E9GLr8
 kt+Qwm8ovgdXjSLluI3DrlhiNrN83rfpxSxojfIPqWEJzVfW0phXiIZauws7t7xU9s53
 aBo/9nopRKqla5wfNlQRTmLysa88ZGfEbkxlUmlWguLiAgNlfTV7C3VL2rrhUeuzsA+j
 z7Kw==
X-Gm-Message-State: APjAAAV3rNCqbTVB6ovdCTgAFeUsQ+V6J9qXVEgbHofN5qq9mZR7my16
 XvLM7oLwjx4blgMNpTCMqBxhS2hSweX3/VljKQpbsA==
X-Google-Smtp-Source: APXvYqwqFJIhOBkFTTdNz+J9Eu1OAtyy3hUNA6baUl/g3/1mDJ1ZzoTY1Affa/DIAUFd4QnLvktgHeRUaESQxD5KV0M=
X-Received: by 2002:a05:6808:4cf:: with SMTP id
 a15mr2070629oie.132.1573045599089; 
 Wed, 06 Nov 2019 05:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20191106100716.18181-1-chris@chris-wilson.co.uk>
 <20191106100716.18181-3-chris@chris-wilson.co.uk>
 <20191106102157.GF23790@phenom.ffwll.local>
 <157303711710.24928.18026997375656120508@skylake-alporthouse-com>
In-Reply-To: <157303711710.24928.18026997375656120508@skylake-alporthouse-com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 6 Nov 2019 14:06:26 +0100
Message-ID: <CAKMK7uEy_HdxksnqXbUqsmCvXZ-BcXv=DqFv8wZ6Y4NE0q4dSw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/prime: Use anon_drm_getfile() for an internal drm
 struct file
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hVc0Tx4X0RQr+pYE32FFQ/Xp5O08qjA8Kck1++y+aVg=;
 b=QkUW2NeJVBRi3TbWNSOkD9qmBqLpT4+UjJVjGK6lONdvQDct1FCtkYzQG2IIr+zHpC
 DXXCUSXLjOCro3HJaDxc30RiNONEiEt7mz+VFZ5y/eeOMrsscP7Pexjn8giT/0mipu7g
 G+4lNAiHkTAHKYVESCdsxoUDI9PGKpyFTH9c0=
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCAxMTo0NSBBTSBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4gd3JvdGU6Cj4KPiBRdW90aW5nIERhbmllbCBWZXR0ZXIgKDIwMTktMTEt
MDYgMTA6MjE6NTcpCj4gPiBPbiBXZWQsIE5vdiAwNiwgMjAxOSBhdCAxMDowNzoxNkFNICswMDAw
LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiA+IEN1cnJlbnRseSB0aGUgZHJtX3ByaW1lIG1tYXAg
ZmFsbGJhY2sgdXNlcyBhIG1vY2sgc3RydWN0IGZpbGUgdG8gcHJvdmlkZQo+ID4gPiB0aGUgZmls
ZSBwb2ludGVyIGludG8gdGhlIGJhY2tlbmQgbW1hcCByb3V0aW5lLiBOb3cgdGhhdCB3ZSBjYW4g
Y3JlYXRlCj4gPiA+IGZ1bGx5IGZsZWRnZWQgYW5vbnltb3VzIHN0cnVjdCBmaWxlIGFyb3VuZCB0
aGUgZHJtIGRldmljZSwgcHV0IGl0IHRvCj4gPiA+IHVzZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiA+IC0tLQo+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgMjYgKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0
aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmlt
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4gPiA+IGluZGV4IDA4MTQyMTFiMGYz
Zi4uNWZhYTYzNzEzZWM4IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3By
aW1lLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4gPiA+IEBAIC03
MDksOCArNzA5LDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX2RtYWJ1Zl92dW5tYXApOwo+ID4g
PiAgICovCj4gPiA+ICBpbnQgZHJtX2dlbV9wcmltZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiA+ID4gIHsKPiA+ID4gLSAgICAg
c3RydWN0IGRybV9maWxlICpwcml2Owo+ID4gPiAtICAgICBzdHJ1Y3QgZmlsZSAqZmlsOwo+ID4g
PiArICAgICBzdHJ1Y3QgZmlsZSAqZmlsZTsKPiA+ID4gICAgICAgaW50IHJldDsKPiA+ID4KPiA+
ID4gICAgICAgaWYgKG9iai0+ZnVuY3MgJiYgb2JqLT5mdW5jcy0+bW1hcCkgewo+ID4KPiA+IG9i
ai0+ZnVuY3MtPm1tYXAgaXMgdGhlIG5ldyB3YXkgb2YgZG9pbmcgdGhpcyAoYW5kIGhvcGVmdWxs
eSBmaW5hbGx5Cj4gPiBzb21ldGhpbmcgY2xlYW4pLCBJJ2QgcmVhbGx5IGxpa2UgdG8gcmV0aXJl
IHRoZSBiZWxvdyBoYWNrIG91dHJpZ2h0Lgo+ID4KPiA+IFBsdXMgSSdtIG5vdCBzdXJlIHdoeSB5
b3UgbmVlZCBhbiBhbm9uIGlub2RlIGhlcmU/IElmIGEgZHJpdmVyIG5lZWRzIHRoaXMKPiA+IGZv
ciB1bm1hcF9tYXBwaW5nX3JhbmdlIG9yIHNpbWlsYXIgSSB0aGluayBpdCdkIGJlIGJldHRlciB0
byB0cnkgYW5kIG1ha2UKPiA+IHNvbWV0aGluZyB3b3JrIGNsZWFubHkgZm9yIG9iai0+ZnVuY3Mt
Pm1tYXAuCj4KPiBJdCdzIGZha2luZyBvbmUgY3VycmVudGx5LiBJZiB0aGUgZmFrZSBpcyBub3Qg
Z29vZCBlbm91Z2gsIHlvdSBhcmUKPiBwbGF5aW5nIHdoYWNrLWEtbW9sZSB1bnRpbCB5b3UgZmlu
YWxseSBkbyBjcmVhdGUgYSBmdWxseSBmbGVkZ2VkIGZpbGUuCj4KPiBJZiB5b3UgYXJlIGdvaW5n
IHRvIHRoZSB0cm91YmxlIG9mIGhhdmluZyB0byBjcmVhdGUgYSBzdHJ1Y3QgZmlsZSB0bwo+IHBy
b3ZpZGUgdG8gdGhlIGZhbGxiYWNrIHJvdXRpbmVzLCBtaWdodCBhcyB3ZWxsIGF2b2lkIHN0aW5r
eSBjb2RlIDopCgpXZSdyZSBjdXJyZW50bHkgbm90IGZha2luZyB0aGUgaW5vZGUgYXQgYWxsLCB3
ZSdyZSBqdXN0IHVzaW5nIHRoZSBvbmUKdGhhdCBjb21lcyB3aXRoIHRoZSBkbWEtYnVmLiBTbyBk
aXN0aW5jdCBmcm9tIHRoZSBkcm1fZGV2aWNlIGZpbGUsIGFuZApoZW5jZSB1bm1hcF9tYXBwaW5n
X3JhbmdlIHdvbid0IHdvcmsgKG9yIGF0IGxlYXN0IGRvaW5nIHRoYXQgb24gdGhlCmRybV9kZXZp
Y2UgaW5vZGUgd29udCBzaG9vdCBkb3duIHRoZSBwdGVzIGZvciByZWRpcmVjdGVkIGRtYS1idWYK
bW1hcHMpLiBvYmotPmZ1bmNzLT5tbWFwIGhhcyB0aGUgc2FtZSBpc3N1ZS4KCkJ1dCBzaW5jZSBh
bGwgY3VycmVudCB1c2VycyBvZiB0aGlzIGRvbid0IGV4cGVjdCB1bm1hcF9tYXBwaW5nX3Jhbmdl
CnRvIHdvcmsgY29ycmVjdGx5LCBpdCdzIG5vdCBhbiByZWFsIGlzc3VlLiBJZiB0aGF0IGNoYW5n
ZXMgdGhlbiBpbW8gd2UKc2hvdWxkIGZpeCB1cCB0aGUgb2JqLT5mdW5jcy0+bW1hcCBwYXRoIHRv
IGhhdmUgdGhlIGNvcnJlY3QgaW5vZGUsIG5vdAp0aGUgZGVwcmVjYXRlZCBwYXRoIHlvdSdyZSB1
cGRhdGluZyBoZXJlLiBCdXQgc2luY2UgdGhlcmUncyBubyBwYXRjaCA0CmluIHRoaXMgc2VyaWVz
IHRvIHN0YXJ0IHVzaW5nIHRoaXMgZm9yIGk5MTUgb3Igc29tZW9uZSBlbHNlLCBJJ20gbm90CnNl
ZWluZyB0aGUgcG9pbnQuCgpPciBhbSBJIGJsaW5kPyBBdCBsZWFzdCBzbGlnaHRseSBjb25mdXNl
ZCwKLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
