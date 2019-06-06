Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C83F36E9D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 10:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E243896AF;
	Thu,  6 Jun 2019 08:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF9B89270
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 08:27:35 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so1688983qtk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 01:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xjfm4NWwc99jN8Dg0kWxRzRed9ZkvyJyZbRJ4tOZzFc=;
 b=pOYEX0T6EchBko+Lh/XOGIdIgbYXLuBDvhzN6eYQ6W6HqL8dgYHfoMjQXk61L1Ey9s
 UyZ1jnO6/eHlhein9WW2RCcYbuaXQkugIWzPOBbwelf2wWRFakk4zGGleDPVlmqbMQNZ
 GNvr9COZ5hrNeJbPq93Sf/XuTR8pFj/u8z4vo+1p+KO7R6GW1baL8STt/VHuZRotvejz
 RAFHomE/81PytmhzoU8/JqnpWeiHtDDvU6lDiIrcxlCSOUpHJemBYefSMKQRimEcGSxw
 Yc55O+yugx964IUSwmpgGjIhs9f+avYSxN2IXsJZDyfTvTmYG6k3RsZu8LPwLHyO1jwJ
 UZKg==
X-Gm-Message-State: APjAAAVWx41n+UVCf6/VHc2OcG6tS9vuaILjr/LBg0eY82Q25HxMWzM8
 tuWbIkqui/GAshzlRTRH7bFEsgmXIBdRNPDleYCoZw==
X-Google-Smtp-Source: APXvYqzaTeporuL3AXmDOxS0lUa+JftyX1jBmPODF1/+JuUv/kCALT07zX45ss/j0NHnJItIlvL7jZ3nhhvro+6l6EY=
X-Received: by 2002:ac8:7545:: with SMTP id b5mr30624720qtr.234.1559809654402; 
 Thu, 06 Jun 2019 01:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190605194556.16744-1-daniel.vetter@ffwll.ch>
 <20190606081241.GT5942@intel.com>
In-Reply-To: <20190606081241.GT5942@intel.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 6 Jun 2019 10:27:23 +0200
Message-ID: <CA+M3ks41OnehTCHxz2TwJ3DA1ODNLNFhPsFs-k0bLX6Brye6sw@mail.gmail.com>
Subject: Re: [PATCH] drm/crc-debugfs: User irqsafe spinlock in
 drm_crtc_add_crc_entry
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xjfm4NWwc99jN8Dg0kWxRzRed9ZkvyJyZbRJ4tOZzFc=;
 b=uh82ZdlHNwj1OLCvW2K3Xohx3Au+0uQWhmav0KEnmSGanMlOTsNWPqbSLUOtNRs1uA
 l8ATl5AeOh78easfM4BYZ9SvkfhGQrKjr8NIlCJCWId9Msdvf2nWs4GdOeUtogBJjKzv
 QqxDewGXX/mHCbN+C59EqnpC/Hv+MdayDo5lspzbxRe+jE1p3vfcVDG4jmF72Sb2tqWh
 HPjexxK+i28bGMZ3j+teTD/K+aKBGAq6c3CURpzvifQeuyJofEFbFLbHLdquMlKXQayN
 21E1mvRh4ta/KXgtvvQkPSLqfa2wsGZX6ZUXzrUYwN6Bjx0b1ITxMEOTCgo+ngnVDB8m
 1YPw==
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgamV1LiA2IGp1aW4gMjAxOSDDoCAxMDoxMiwgVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gYSDDqWNyaXQgOgo+Cj4gT24gV2VkLCBKdW4gMDUsIDIwMTkg
YXQgMDk6NDU6NTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IFdlIGNhbiBiZSBj
YWxsZWQgZnJvbSBhbnkgY29udGV4dCwgd2UgbmVlZCB0byBiZSBwcmVwYXJlZC4KPiA+Cj4gPiBO
b3RpY2VkIHRoaXMgd2hpbGUgaGFja2luZyBvbiB2a21zLCB3aGljaCBjYWxscyB0aGlzIGZ1bmN0
aW9uIGZyb20gYQo+ID4gbm9ybWFsIHdvcmtlci4gV2hpY2ggcmVhbGx5IHVwc2V0cyBsb2NrZGVw
Lgo+ID4KPiA+IENjOiBSb2RyaWdvIFNpcXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWls
LmNvbT4KPiA+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+
ID4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiBDYzog
QmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPgo+IFJl
dmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PgoKUmV2aWV3ZWQtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5h
cm8ub3JnPgoKPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5j
IHwgNSArKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19j
cmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwo+ID4gaW5kZXggNTg1MTY5
ZjBkY2M1Li43ZjM1YjViYTE5MjQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RlYnVnZnNfY3JjLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMu
Ywo+ID4gQEAgLTM5Niw4ICszOTYsOSBAQCBpbnQgZHJtX2NydGNfYWRkX2NyY19lbnRyeShzdHJ1
Y3QgZHJtX2NydGMgKmNydGMsIGJvb2wgaGFzX2ZyYW1lLAo+ID4gICAgICAgc3RydWN0IGRybV9j
cnRjX2NyYyAqY3JjID0gJmNydGMtPmNyYzsKPiA+ICAgICAgIHN0cnVjdCBkcm1fY3J0Y19jcmNf
ZW50cnkgKmVudHJ5Owo+ID4gICAgICAgaW50IGhlYWQsIHRhaWw7Cj4gPiArICAgICB1bnNpZ25l
ZCBsb25nIGZsYWdzOwo+ID4KPiA+IC0gICAgIHNwaW5fbG9jaygmY3JjLT5sb2NrKTsKPiA+ICsg
ICAgIHNwaW5fbG9ja19pcnFzYXZlKCZjcmMtPmxvY2ssIGZsYWdzKTsKPiA+Cj4gPiAgICAgICAv
KiBDYWxsZXIgbWF5IG5vdCBoYXZlIG5vdGljZWQgeWV0IHRoYXQgdXNlcnNwYWNlIGhhcyBzdG9w
cGVkIHJlYWRpbmcgKi8KPiA+ICAgICAgIGlmICghY3JjLT5lbnRyaWVzKSB7Cj4gPiBAQCAtNDI4
LDcgKzQyOSw3IEBAIGludCBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YywgYm9vbCBoYXNfZnJhbWUsCj4gPiAgICAgICBoZWFkID0gKGhlYWQgKyAxKSAmIChEUk1f
Q1JDX0VOVFJJRVNfTlIgLSAxKTsKPiA+ICAgICAgIGNyYy0+aGVhZCA9IGhlYWQ7Cj4gPgo+ID4g
LSAgICAgc3Bpbl91bmxvY2soJmNyYy0+bG9jayk7Cj4gPiArICAgICBzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZjcmMtPmxvY2ssIGZsYWdzKTsKPiA+Cj4gPiAgICAgICB3YWtlX3VwX2ludGVycnVw
dGlibGUoJmNyYy0+d3EpOwo+ID4KPiA+IC0tCj4gPiAyLjIwLjEKPiA+Cj4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPgo+IC0tCj4g
VmlsbGUgU3lyasOkbMOkCj4gSW50ZWwKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
