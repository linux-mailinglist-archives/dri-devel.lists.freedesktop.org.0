Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8BF1FA26
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 20:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08B989175;
	Wed, 15 May 2019 18:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8C689175
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 18:42:50 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h1so941130qtp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 11:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1reD9us9N5mO/PuTxFUyMzUfJf88hZBU0BFrHnbD0Bo=;
 b=uYW5i3XdCrnarYYCi1bkUWA5kCuxVX6VmWahP0wZMqTZYuyt4XRTAhQFszWsTjChaF
 lwAY5n8KiovIcK4Qx0xX7rLVFa9o8b1mBoYYXP6Lvi5dn2rMUDJFGSZuDfCGEYa3hlng
 lnAMwBoHJvbWEv+1L/DUBKG5MwTgPQABFqion8mfG4GnaawigjdWQdvSndrbSdNYomjq
 dDn86qfFdJ31F/5nl2oQOkbGYTDc4zMo7D5NDXzrrR5qddkMIHgxCuO21fUAxzZXWIBS
 KfGqERGkKF5sxFiO+0K/fi8SvtZXm0qqP1AH92TTn4AF6a4fUwCBh+HmfcCrrjel880D
 HZfw==
X-Gm-Message-State: APjAAAW0hdwNiA+KMt4iiA7OHBdLqX0UCUyAU1VWT715ys/KtCbapKmD
 AYZw45vxgdnzQmxIFf2T0L5tYg==
X-Google-Smtp-Source: APXvYqxrY8c666Igwg1R0i0REY1OJW1Ih3Ad8v+ZlbR2LUupNFnSbQkoVPBYFdyzfysek+egkkA9dA==
X-Received: by 2002:aed:2a85:: with SMTP id t5mr8551891qtd.264.1557945769970; 
 Wed, 15 May 2019 11:42:49 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id t63sm1274466qka.33.2019.05.15.11.42.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 11:42:49 -0700 (PDT)
Date: Wed, 15 May 2019 14:42:49 -0400
From: Sean Paul <sean@poorly.run>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/5] drm/bridge/synopsys: dw-hdmi: Add "unwedge" for ddc
 bus
Message-ID: <20190515184249.GA17077@art_vandelay>
References: <20190502225336.206885-1-dianders@chromium.org>
 <20190502225336.206885-2-dianders@chromium.org>
 <20190515182038.GV17077@art_vandelay>
 <CAD=FV=WP-rFDAR28oZg+9DcrXbaYPjFCAD-dV1VR3-3_XDs-3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WP-rFDAR28oZg+9DcrXbaYPjFCAD-dV1VR3-3_XDs-3A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1reD9us9N5mO/PuTxFUyMzUfJf88hZBU0BFrHnbD0Bo=;
 b=TDOw0JqG4MjKV/6oPistcSMXTCPQKhxSgzGJ/dexYJdSGe/daqrONJ1A9P2mr4N9vE
 LNAL0hfNzpBNmX2d16ydeNQrlLloRhFKn763PhLvoNiPF0YpYM3ij0yYm+5NNLBjVUOn
 ygtIVMAFfXUxICL4Geq/Pm0Dg+Cg4ZmOop6JOMf0GkEe+byYEQYqN3SWvLSXOqCrQshi
 P4lgu+IZ/vH/7qZg3HYwntrYlEyu2dHKA1yELq4rFLP36JN7QwfkaKh7fUt4Rf2RC1ju
 5jJvgI9D30JfE4j3f8KNHKrbV3P/j6dM7gdz5yw++DQd5s7tncpv42Se5FAZf3DByu81
 rfPQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTE6MzY6MzNBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPiAKPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAxMToyMCBBTSBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4gd3JvdGU6Cj4gCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBpZiAoSVNfRVJSKGhkbWktPmRlZmF1bHRfc3RhdGUpICYmCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgIUlTX0VSUihoZG1pLT51bndlZGdlX3N0YXRlKSkgewo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkZXZfd2FybihkZXYsCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJVbndlZGdlIHJlcXVpcmVzIGRlZmF1bHQgcGluY3Ry
bFxuIik7Cj4gPgo+ID4gQ2FuIHlvdSBkb3duZ3JhZGUgdGhpcyBtZXNzYWdlIHRvIGluZm8gb3Ig
ZGJnPyBHaXZlbiBob3cgcmFyZSB0aGlzIGlzc3VlIGlzLCB3ZQo+ID4gcHJvYmFibHkgZG9uJ3Qg
d2FudCB0byBzcGFtIGV2ZXJ5b25lIHdobyBpcyBoYXBwaWx5IHVzaW5nIGR3LWhkbWkuCj4gCj4g
SSBkb24ndCB0aGluayBpdCB3aWxsIHNwYW0gYW55b25lLCB3aWxsIGl0PyAgSXQgd2lsbCBvbmx5
IHNwYW0gaWYgeW91Cj4gX2RvXyBzcGVjaWZ5IGFuIHVud2VkZ2Ugc3RhdGUgYW5kIHlvdSBfZG9u
J3RfIHNwZWNpZnkgYSBkZWZhdWx0IHN0YXRlLgo+IFRoaXMgc2VlbXMgbGlrZSBzb21ldGhpbmcg
eW91J2Qgd2FudCBhIHByZXR0eSBzZXJpb3VzIHdhcm5pbmcgYWJvdXQKPiBiZWNhdXNlIGl0IG1l
YW50IHRoYXQgeW91IHdhbnRlZCB0byB1c2UgdW53ZWRnZSBidXQgeW91IGRpZG4ndCBzcGVjaWZ5
Cj4gaXQgcHJvcGVybHkuCj4gCgpUaGF0J2xsIHRlYWNoIG1lIGZvciBza2ltbWluZywgeW91J3Jl
IHJpZ2h0IG9uLCB0aGFua3MgZm9yIHRoZSBjb3JyZWN0aW9uIQoKPiAKPiA+IFJldmlld2VkLWJ5
OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiAKPiBUaGFua3MhCj4gCj4gLURvdWcKCi0t
IApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
