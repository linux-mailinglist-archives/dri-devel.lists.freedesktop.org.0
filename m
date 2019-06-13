Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC4E43507
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 11:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BEE898AF;
	Thu, 13 Jun 2019 09:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D075898B7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 09:58:15 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id p24so14580644lfo.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 02:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UeQpwXCeDLPpi68/6pv3vrzu0yim26SWBWe/Hs+pCZQ=;
 b=f6dWlX+OoXyR/+eWH8xVfKIfcwm3MKYmQq5oNlBNF4Oge6lDbjs3274tFMHj/DdQmi
 i7pefZDWfbha5oz7P9KXAGKPUg0nf3LXGbDFpyueesM4tl9eiI3MWR9wc7gM5SuAvRF1
 FlcnYkdshORi10XNb7U0KzQnG5AuBpg1wsF7D7tkIVYNRpwyOqjbwNcOz0J087X/JdjU
 7JjGM7iOyjRSKHIvzIEgdEFQq0RsLPc1WpUl1qq0JkWJoPwQ8r3zDxu/0LTgCn0mhZUc
 TMCAimzMY8NTxvtciEYGE2lzZC69IhRv4y8eX+igqiCh9772sLxtjpvMISS06yf482ZB
 CQtg==
X-Gm-Message-State: APjAAAXEXYzlQjiLNCRCbEXIndifXIN19khzvEBwGXk0YfeUZqtPiF60
 Fx+nceCehovcdASEfyY55zs0N3QjlcYr/WkUSe9nWI5/
X-Google-Smtp-Source: APXvYqzzRYF2k/IXZZ7COJzFlNipdBNWGuSew0skOVez7AncsiN64/Xr0+4VQtJGG1EZMKfkyncDn3CcPqcgWkpZum4=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr9124106lfc.60.1560419893989; 
 Thu, 13 Jun 2019 02:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190529113458.GG19119@mwanda>
In-Reply-To: <20190529113458.GG19119@mwanda>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jun 2019 11:58:01 +0200
Message-ID: <CACRpkdZj=TPB_mDib6sQnDPLUJUtwhmrFqWSwcRMozJYFeuAaw@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: Fix an uninitialized variable
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UeQpwXCeDLPpi68/6pv3vrzu0yim26SWBWe/Hs+pCZQ=;
 b=lpOISga17qBlvACtZGt4+jtA8zbDfh+2i3A3HDY2kAHIuGNEha2LDJQ4TYvwPNRtt2
 WjccyF30xL8MNHpDpik9UtjU9Mvm7pmUL9WVFenm3WQAtbSsYUaSIgKUAb/h7NmieYVq
 vbJ04PVpH2CKlPzTjYoAD0LlYPtprXSTGaiewoQ/ZcYUUw4Je2qmaGnv5pllOzbXVuSq
 y8LhCGFLwHdfL1+ydGtLz6iiKpYBem0IKo1+oLLp0th3nFoUJ47+2HEhGYzSUpau2h6+
 jOIPgxr9ReC3ZSDN2raLeb1ru3QXSC1moV6zAtWF+d250y9X8ZypVbCXr4d8HF+kXE+i
 EIHg==
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgNDoyNSBQTSBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOgoKPiBXZSBuZXZlciBzZXQgInZibGFuayIgdG8gImZhbHNl
Ii4KPgo+IEN1cnJlbnQgdmVyc2lvbnMgb2YgR0NDIHdpbGwgaW5pdGlhbGl6ZSBpdCB0byB6ZXJv
IGF1dG9tYXRpY2FsbHkgYXQKPiBjZXJ0YWluIG9wdGltaXphdGlvbiBsZXZlbHMgc28gdGhhdCdz
IHByb2JhYmx5IHdoeSB0aGlzIGRpZG4ndCBzaG93IHVwCj4gaW4gdGVzdGluZy4KPgo+IEZpeGVz
OiA1ZmM1MzdiZmQwMDAgKCJkcm0vbWNkZTogQWRkIG5ldyBkcml2ZXIgZm9yIFNULUVyaWNzc29u
IE1DREUiKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3Jh
Y2xlLmNvbT4KClBhdGNoIGFwcGxpZWQuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
