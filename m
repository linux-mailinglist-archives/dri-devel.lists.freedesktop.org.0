Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38884104527
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 21:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E16D6EA26;
	Wed, 20 Nov 2019 20:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E186EA26
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 20:33:05 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y23so585257ljh.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CX0sEQr8WI8l3jpI/Uek4j+yfhDbsc5jpx4UFAkfVWE=;
 b=K5RY1NdPtfRXR47mLjrWtp9ZvSh1su4IlRlsE9JTvxalgtDHSXCIw7dkoRXZ9Am6Nl
 /7K7mprMk7FZOOVbtopztwm6ls351OjecvB0Rc1zNI/Mb2ZYxU9hSl+3xiEbr1/i1I7h
 iksZKDZZ/xIxeV2l2HbMI1QUx4lcFmPYUKNTSc/lHwa0tBlIieV8//ZR6wfgbFQEDN8H
 cMdKOoKnFD9C0i3BOlRRyypRuCSYXBRmmjh1jxGZkurjUEludTgCEFHMOkuZ2LrWtZbZ
 UyGY+OAjIw++ZyPGsvmu6gs+M/Na529FHxHOUZJjHcAh6jGdTB1xyCt6aHFHfZfzmyTk
 38Og==
X-Gm-Message-State: APjAAAVt/z2/5xylO11D0owG7YJrLmZC7E4lZ2YjT2YuPrh0dua3t065
 tsfoSyIAz4WGY0yhVOJ+Eeam9+jlql18WuGbZoXeMA==
X-Google-Smtp-Source: APXvYqz6nHxRAERTSyvWsOimSaGv8OyCawtOTBJu6+DmMpbJpE9YaYF2R2Gx9Rv2X6anQ15/5/vYhkbahOdYSMMgSp8=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr4431575ljd.183.1574281983876; 
 Wed, 20 Nov 2019 12:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20191118130252.170324-1-stephan@gerhold.net>
In-Reply-To: <20191118130252.170324-1-stephan@gerhold.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Nov 2019 21:32:52 +0100
Message-ID: <CACRpkdZgeDtFdBLLiO2Kw9AKU-rbBoKCAccJvOP5GMG+NqS2GQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: dsi: Fix invalid pointer dereference if panel
 cannot be found
To: Stephan Gerhold <stephan@gerhold.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CX0sEQr8WI8l3jpI/Uek4j+yfhDbsc5jpx4UFAkfVWE=;
 b=Al5l4E4xtj1f2KYK87U5xnNVGqq/w2dR6lByuU/kC5Ei2FFFIYSwNIwjOlbn2txhoT
 0cVSOBBCUUtp5mOyBmAgZjM4WI3ARJ50syN8HiyPP1pGyjXvJjnGBOtpcxldOHolknQA
 D9+Jb8DDf+lfsB0ZYboaF5C33P7JRDm2EXE9pJr/SPpl+rGtcQ4ogA+5z5QfBA2/xpZM
 6JaH+/OWZiceK4KeCiernnuNovE8wT0LROenVUz8A/uGsoq2asW1L28HLiy7yOdVZ0V3
 bhH02oeCniDbNDueQEy6AQPdOdmCicRxgAURPF9fvzGdN56rPVrJPzXHVok7c0NLzPfb
 Ru2w==
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMjowNCBQTSBTdGVwaGFuIEdlcmhvbGQgPHN0ZXBoYW5A
Z2VyaG9sZC5uZXQ+IHdyb3RlOgoKPiBUaGUgInBhbmVsIiBwb2ludGVyIGlzIG5vdCByZXNldCB0
byBOVUxMIGlmIG9mX2RybV9maW5kX3BhbmVsKCkKPiByZXR1cm5zIGFuIGVycm9yLiBUaGVyZWZv
cmUgd2UgbGF0ZXIgYXNzdW1lIHRoYXQgYSBwYW5lbCB3YXMgZm91bmQsCj4gYW5kIHRyeSB0byBk
ZXJlZmVyZW5jZSB0aGUgZXJyb3IgcG9pbnRlciwgcmVzdWx0aW5nIGluOgo+Cj4gICAgIG1jZGUt
ZHNpIGEwMzUxMDAwLmRzaTogZmFpbGVkIHRvIGZpbmQgcGFuZWwgdHJ5IGJyaWRnZSAoNDI5NDk2
Njc3OSkKPiAgICAgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmly
dHVhbCBhZGRyZXNzIGZmZmZmZTAzCj4gICAgIFBDIGlzIGF0IGRybV9wYW5lbF9icmlkZ2VfYWRk
LnBhcnQuMCsweDEwLzB4NWMKPiAgICAgTFIgaXMgYXQgbWNkZV9kc2lfYmluZCsweDEyMC8weDQ2
NAo+ICAgICAuLi4KPgo+IFJlc2V0ICJwYW5lbCIgdG8gTlVMTCB0byBhdm9pZCB0aGlzIHByb2Js
ZW0uCj4gQWxzbyBjaGFuZ2UgdGhlIGZvcm1hdCBzdHJpbmcgb2YgdGhlIGVycm9yIHRvICVsZCB0
byBwcmludAo+IHRoZSBuZWdhdGl2ZSBlcnJvcnMgY29ycmVjdGx5LiBUaGUgY3Jhc2ggYWJvdmUg
dGhlbiBiZWNvbWVzOgo+Cj4gICAgIG1jZGUtZHNpIGEwMzUxMDAwLmRzaTogZmFpbGVkIHRvIGZp
bmQgcGFuZWwgdHJ5IGJyaWRnZSAoLTUxNykKPiAgICAgbWNkZS1kc2kgYTAzNTEwMDAuZHNpOiBu
byBwYW5lbCBvciBicmlkZ2UKPiAgICAgLi4uCj4KPiBGaXhlczogNWZjNTM3YmZkMDAwICgiZHJt
L21jZGU6IEFkZCBuZXcgZHJpdmVyIGZvciBTVC1Fcmljc3NvbiBNQ0RFIikKPiBTaWduZWQtb2Zm
LWJ5OiBTdGVwaGFuIEdlcmhvbGQgPHN0ZXBoYW5AZ2VyaG9sZC5uZXQ+CgpQYXRjaCBhcHBsaWVk
IGFuZCBwdXNoZWQgdG8gZHJtLW1pc2MtZml4ZXMsIHRoYW5rcyEKCllvdXJzLApMaW51cyBXYWxs
ZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
