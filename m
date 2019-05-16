Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498FD210A9
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 00:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1559F893D0;
	Thu, 16 May 2019 22:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED84893D0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 22:45:04 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id q13so3403104vso.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 15:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+W9jD9o7YYLYB/v0Ro7pXl+sH8ADQyIbB7T7NXFVEcc=;
 b=pfZhEJAZW9Q/u+B6RVKwIqCLXY6jFCRDNasuUz9s/rOHwuMZc26Nc38EVobZ3D9+GU
 L/qDXMTzZwDqPx6H8z2K1pq+AYSeEvLMBhIbuOpKdr6Ou5sgBjnTxz/uGBHR35CdftLp
 YRYLir22La97DEGi2aXZtv75sD2GKT2IAEajEynqFdzADxpZMBKOOCrAlyyvALpa1R0O
 vuDY7UiMVl6NPwF+KC8FRpuf1P21AwBYx1okPuXsz53MAxRvk39R96/0Fwwvtr5dPSyY
 HcCqnttNCRxWCU1r3G0NoScUyJU7IxmcFCu6MUitLgtYF+FZy2hpxlENt+PXFzLldBaS
 81LA==
X-Gm-Message-State: APjAAAW4RnXG7MmlcWnBIyfdlwKmTQ9EnSTorB6z9W1sOEL+MIF5FpFP
 dYifwUwEyPep17AzwNwQYE+K/avOgmE=
X-Google-Smtp-Source: APXvYqyPlNx94q3bZFIFqxJs25BSBZjLKms/n05bBHHOPSU/cwmsAkkXlOVZ12NxWz6zGbIhSoZsaQ==
X-Received: by 2002:a05:6102:208a:: with SMTP id
 h10mr21355863vsr.239.1558046703806; 
 Thu, 16 May 2019 15:45:03 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id o5sm2510472vki.37.2019.05.16.15.45.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 15:45:03 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id g187so3381529vsc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 15:45:03 -0700 (PDT)
X-Received: by 2002:a67:b348:: with SMTP id b8mr17879343vsm.144.1558046702869; 
 Thu, 16 May 2019 15:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190516214022.65220-1-dianders@chromium.org>
 <20190516214022.65220-2-dianders@chromium.org>
In-Reply-To: <20190516214022.65220-2-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 May 2019 15:44:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V3U=5KttaqjUvvF=vpKwFNMd6q0=J1ZKUrJ1b-Stz5bQ@mail.gmail.com>
Message-ID: <CAD=FV=V3U=5KttaqjUvvF=vpKwFNMd6q0=J1ZKUrJ1b-Stz5bQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/rockchip: dw_hdmi: Handle suspend/resume
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+W9jD9o7YYLYB/v0Ro7pXl+sH8ADQyIbB7T7NXFVEcc=;
 b=iFdbvY1Qgl23eLRHTcbK2KUoW8rVpz0RfgpjJVzvA3c+FlUStxkuV64Wmn8f0D9q+0
 WFM2GPW77EVVaGnoDv7ntLl+FCqJJHHbK/5HI2zpwdwTg2qw1RbSA+tCBCNIKN5g9LuL
 cXJ8bXROlUY7THLAZMkcbiVOe572QpbIYKKjs=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Matthias Kaehlcke <mka@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAyOjQwIFBNIERvdWdsYXMgQW5kZXJzb24gPGRp
YW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBPbiBSb2NrY2hpcCByazMyODgtYmFzZWQg
Q2hyb21lYm9va3Mgd2hlbiB5b3UgZG8gYSBzdXNwZW5kL3Jlc3VtZQo+IGN5Y2xlOgo+Cj4gMS4g
WW91IGxvc2UgdGhlIGFiaWxpdHkgdG8gZGV0ZWN0IGFuIEhETUkgZGV2aWNlIGJlaW5nIHBsdWdn
ZWQgaW4uCj4KPiAyLiBJZiB5b3UncmUgdXNpbmcgdGhlIGkyYyBidXMgYnVpbHQgaW4gdG8gZHdf
aGRtaSB0aGVuIGl0IHN0b3BzCj4gd29ya2luZy4KPgo+IExldCdzIGNhbGwgdGhlIGNvcmUgZHct
aGRtaSdzIHN1c3BlbmQvcmVzdW1lIGZ1bmN0aW9ucyB0byByZXN0b3JlCj4gdGhpbmdzLgo+Cj4g
Tk9URTogaW4gZG93bnN0cmVhbSBDaHJvbWUgT1MgKGJhc2VkIG9uIGtlcm5lbCAzLjE0KSB3ZSB1
c2VkIHRoZQo+ICJsYXRlL2Vhcmx5IiB2ZXJzaW9ucyBvZiBzdXNwZW5kL3Jlc3VtZSBiZWNhdXNl
IHdlIGZvdW5kIHRoYXQgdGhlIFZPUAo+IHdhcyBzb21ldGltZXMgcmVzdW1pbmcgYmVmb3JlIGR3
X2hkbWkgYW5kIHRoZW4gY2FsbGluZyBpbnRvIHVzIGJlZm9yZQo+IHdlIHdlcmUgZnVsbHkgcmVz
dW1lZC4gIEZvciBub3cgSSBoYXZlIGdvbmUgYmFjayB0byB0aGUgbm9ybWFsCj4gc3VzcGVuZC9y
ZXN1bWUgYmVjYXVzZSBJIGNhbid0IHJlcHJvZHVjZSB0aGUgcHJvYmxlbXMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4K
PiBDaGFuZ2VzIGluIHYyOgo+IC0gQWRkIGZvcmdvdHRlbiBzdGF0aWMgKExhdXJlbnQpCj4gLSBO
byBlbXB0eSBzdHViIGZvciBzdXNwZW5kIChMYXVyZW50KQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKykKCldob29wcywgZm9yZ290IHRoYXQgSSBzaG91bGQgaGF2
ZSBjYXJyaWVkIGZvcndhcmQ6CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKLURvdWcKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
