Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6404AA2DA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 14:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27CC6E0AA;
	Thu,  5 Sep 2019 12:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7614C6E0AA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 12:17:12 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w6so1855285lfl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 05:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=StI3XcB3ZvY/m6NR8Jm9Qa6iMDjUpCo1O+h+kCm3Mhs=;
 b=HDGgThifQWExOlbB7MOjPmEHkigk1gJJjkx7Ixp9B1gNhUmgHSUymnQk2iZ+1a0HhY
 bew9zFUpwl36R+DHAyTM8hy7oTndDSO3Y/jLFO56dnOqV5IPmGsxyK7yp9YEz3G46rXD
 Q3ZnqaxT+jnXYrnPU0j5H7y5hrBqC5u/DBDyrxpCbkocLIYTOuhE6c4qiG0Qr3fWUQxY
 JVRrVp8qs3XBveYh32oQEeTboRx7gdk7jYt9j/IcSZHgbqgA8UZuawm5jX9Dyg0igCzM
 o1LchU1wbXrJQNZcRdGUT9hGPVEGMew6aHFBNf2AKoKNiqP1FNa0zl6pTWI2a+DAmspM
 ZZog==
X-Gm-Message-State: APjAAAWiEKGswp4LYvyd/u95MH9SMIapWV2N5G7wPloV6Q0tMFCxgUfQ
 5it8Ql6mbRbj8T/hRLHqDgaetAxbcSXIF8XO0METVKlgHyDBUg==
X-Google-Smtp-Source: APXvYqz1HIEEslu0C/MDCa5oulKWClv1iCI63dh5dtfrqNlp7dL4eID2qjNiYEwjIHqFGZW3qcIjGeu6PQa0MaM/JQ0=
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr2195051lfp.61.1567685830776; 
 Thu, 05 Sep 2019 05:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190903091512.15780-1-linus.walleij@linaro.org>
 <20190903143745.GA2263@gerhold.net>
In-Reply-To: <20190903143745.GA2263@gerhold.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2019 14:16:59 +0200
Message-ID: <CACRpkdZvy6aa15wGjBMDXccaXjxgPjYe89XbpkzSbOABgFhOQQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mcde: Some fixes to handling video mode
To: Stephan Gerhold <stephan@gerhold.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=StI3XcB3ZvY/m6NR8Jm9Qa6iMDjUpCo1O+h+kCm3Mhs=;
 b=DwucrMempHp2o8ChP6eO3ydIdJgDP45Fq1wxMW7+WbOnHWfClZX/d2iqVzfUKZb0yz
 gUR/JMZMhXjyRRnBGl3DP6uABKMwlbWHTaDd0C4AN0UIl5o+YdgRnUSEP0k0CSa1Tfmf
 /POGfhKtLR7h0LLcyMJFjitOMw87VAMu/b4g/WV2voAuGo/LjDbbKEd5cWwIAJYbXtwp
 SDplugUS4Hrt+3u3uDmUW2RgY0vSkim7PggeqbMbj1UJ0HKNpCwAg5Y3i+B0m4+iN03M
 dQyAvDtKxav3eHlejaSz4ymsizyw7Qhtit1Y7Iu7hE56wWb0GzIoIHY51cgtpPEx9EJu
 Xq+Q==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCA0OjM4IFBNIFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhhbkBn
ZXJob2xkLm5ldD4gd3JvdGU6Cj4gT24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMTE6MTU6MTJBTSAr
MDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gPiAgICAgICAvKgo+ID4gICAgICAgICogVGhp
cyBpcyB0aGUgdGltZSB0byBwZXJmb3JtIExQLT5IUyBvbiBELVBIWQo+ID4gICAgICAgICogRklY
TUU6IG5vd2hlcmUgdG8gZ2V0IHRoaXMgZnJvbTogRFQgcHJvcGVydHkgb24gdGhlIERTST8KPiA+
ICsgICAgICAqIHZhbHVlcyBsaWtlIDQ4IGFuZCA3MiBzZWVuIGluIHRoZSB2ZW5kb3IgY29kZS4K
PiA+ICAgICAgICAqLwo+ID4gLSAgICAgdmFsIHw9IDAgPDwgRFNJX1ZJRF9EUEhZX1RJTUVfUkVH
X1dBS0VVUF9USU1FX1NISUZUOwo+ID4gKyAgICAgdmFsIHw9IDQ4IDw8IERTSV9WSURfRFBIWV9U
SU1FX1JFR19XQUtFVVBfVElNRV9TSElGVDsKPiA+ICAgICAgIHdyaXRlbCh2YWwsIGQtPnJlZ3Mg
KyBEU0lfVklEX0RQSFlfVElNRSk7Cj4KPiBJIGp1c3Qgd2FudCB0byBub3RlIHRoYXQgdGhlIFNh
bXN1bmcgUzMgTWluaSAoZ29sZGVuKSBzZWVtcyB0byB1c2UgODgKPiBoZXJlLiBJIHN1cHBvc2Ug
d2Ugd2lsbCBuZWVkIHRvIHNlZSBob3cgaW1wb3J0YW50IHRoaXMgcHJvcGVydHkgaXMsCj4gb3Ig
aWYgcGFuZWxzIGNhbiBhbHNvIHdvcmsgd2l0aCBhIHNsaWdodGx5IHdyb25nIHZhbHVlLgoKWWVh
aCBtYXliZSB3ZSBzaG91bGQganVzdCBmaWd1cmUgb3V0IHdoYXQgdG8gZG8gYWJvdXQgdGhpcy4K
ClRoaXMgaXMgdGhlIHdha2V1cCB0aW1lLCBpbiBjbG9jayBjeWNsZXMsIGZvciBhIExQLT5IUwp0
cmFuc2l0aW9uIG9uIHRoZSBELVBIWS4KClRoZSBwYW5lbCBkcml2ZXIga2luZCBvZiBrbm93cyBr
bm93cyB0aGlzIHRpbWluZywgc28gSQpndWVzcyB3ZSBzaG91bGQgYWRkIGEgZmllbGQgdG8gc3Ry
dWN0IG1pcGlfZHNpX2RldmljZQpzdWNoIGFzIHVuc2lnbmVkIGludCBscF90b19oc193YWtlcCwg
YnV0IGl0IG5lZWRzIHRvCmNvbWUgZnJvbSB0aGUgZGV2aWNlIHRyZWUgc2luY2UgcGVyIHRoZSBt
YW51YWwgdGhpcwp2YWx1ZSBpcyBzeXN0ZW0gZGVwZW5kZW50OgoKInJlZ193YWtldXBfdGltZSBt
dXN0IGJlIHNob3J0ZXIgdGhhbiBsaW5lIGR1cmF0aW9uIGFuZApkZXBlbmRzIG9uIHRoZSBELVBI
WSBjZWxsIHBsdXMgc29tZSBwaXBlbGluZXMgZGVsYXlzIGluc2VydGVkCmJ5IHRoZSBEU0kgbGlu
ay4gVGhpcyB2YWx1ZSBzdHJvbmdseSBkZXBlbmRzIG9uIHRoZSBQTEwKcHJvZ3JhbW1pbmcgYW5k
IGFzIGl0IGlzIGEgbWl4IG9mIGFuYWxvZyBhbmQgZGlnaXRhbCB0aW1pbmcsIGl0CmlzIHByYWN0
aWNhbGx5IGltcG9zc2libGUgdG8gcHJvdmlkZSBhIGdlbmVyYWwgZm9ybXVsYS4gQnkgdGhlCndh
eSwgaXQgaGFzIHRvIGJlIGNoYXJhY3Rlcml6ZWQgYXQgc3lzdGVtIGxldmVsICh2YWxpZGF0aW9u
CmFuZC9vciBzaW11bGF0aW9uKS4iCgo+ID4gLSAgICAgICAgICAgICB3cml0ZWwoYmxrZW9sX3Bj
aywgZC0+cmVncyArIERTSV9WSURfVkNBX1NFVFRJTkcyKTsKPiA+ICsgICAgICAgICAgICAgd3Jp
dGVsKChibGtlb2xfcGNrICYgRFNJX1ZJRF9WQ0FfU0VUVElORzJfRVhBQ1RfQlVSU1RfTElNSVRf
TUFTSykKPiA+ICsgICAgICAgICAgICAgICAgICAgIDw8IERTSV9WSURfVkNBX1NFVFRJTkcyX0VY
QUNUX0JVUlNUX0xJTUlUX1NISUZULAo+ID4gKyAgICAgICAgICAgICAgICAgICAgZC0+cmVncyAr
IERTSV9WSURfVkNBX1NFVFRJTkcyKTsKPgo+IEl0IGRvZXMgbm90IG1ha2UgYSBkaWZmZXJlbmNl
IGluIHRoaXMgY2FzZSBiZWNhdXNlIFNISUZUID0gMCwKPiBidXQgc2hvdWxkbid0IHlvdSBub3Jt
YWxseSBzaGlmdCBiZWZvcmUgYXBwbHlpbmcgdGhlIG1hc2s/Cj4gT3RoZXJ3aXNlLCB5b3Ugd291
bGQgd2lwZSBvdXQgdGhlIGxvd2VyIGJpdHMgYmVmb3JlIHlvdSBzaGlmdCB0aGVtLgoKT0sgeW91
J3JlIHJpZ2h0LCBJIGZpeCBpdCB1cCBhbmQgcmVzZW5kLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
