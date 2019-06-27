Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179358138
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 13:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0815F6E0CD;
	Thu, 27 Jun 2019 11:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530726E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 11:15:11 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v24so1882187ljg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 04:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5TqvPz8DpORGx1+vi8ExXWSK0FXpNg/HXwHTY32b52w=;
 b=WupmN98qonvqNdSEv+tjfDwLz244m4WU6OUT3527n5zwsoLFvCyaqHvJvkeyEaeB2a
 uE/wxfDpG0fWsS9kD2MgSvWR+hr4e++LerSUh/2zSt4GRZ9sVPsTHE6gTm1tVsyYZgDL
 wA+hCwQjV3nV6bB4wZuBWu/hjrqKl/Y3Es4z4rulafueaoB/J3L9p+AyJj02sXXSHOyT
 o8RLE4348kBOuYI2Ky3pPYrXTCQc1+Z944NMXLZDjOQt1dfLz2Dlfn5GoeBdClFiXITk
 tOSoz0f+uv1VM0kgq651grkf6/oNLmCxKgJGKm/7oKVn5pWh0RGsLn1sAFyooAC8lLVy
 Je9w==
X-Gm-Message-State: APjAAAWj4R28ZkcMKQl9FGVlZ3PSxNBozWbzjI0rDEqLxzHVgY95yjAT
 NvqQMGk1c8cRZ/dG1p3BzOEMhHh12QGQ+81zeWYSHA==
X-Google-Smtp-Source: APXvYqyVA9C7Y1iH92FooDzDgEr3HQuytpfeJym/aOuE5hBX0/swTw0Rz9L0rgrDIJ1qob4Es/otbtAluqfU9XSMIXs=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr2303238ljm.180.1561634109728; 
 Thu, 27 Jun 2019 04:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <20190625163434.13620-4-brgl@bgdev.pl>
In-Reply-To: <20190625163434.13620-4-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Jun 2019 12:14:58 +0100
Message-ID: <CACRpkdZm35HOxBqDN0dfAyiMPFAPOguPrzuPUwS14kZM-VJV4A@mail.gmail.com>
Subject: Re: [PATCH 03/12] backlight: gpio: pull the non-pdata device probing
 code into probe()
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5TqvPz8DpORGx1+vi8ExXWSK0FXpNg/HXwHTY32b52w=;
 b=Oh8LTD8m7IDgDorBBc7V+VvCco9ShEfKtubYx65x1T5UADxUHneIwXm5D34fbeGt8A
 ixjCx/VH3pF/bQ6ZHMg9PHCQmjkpCAiXVk/t5qsh/Qqm5tx9SPGzVhjOT8gQTzjQQrfi
 lAGtQ9fEG9oF9K1v8oeREAXC0uuw/SL0BJN950l/xiDxO5+wGYpYmT+5VPl0QUp7nSue
 aAMKG7ngQmAlBgnfr7IMamGqNGSDVnT6ZsHyoFmoAYfgNHCqJ4qfQ4AxjZkWYV30/+vx
 p6K15ZkS7XsSbBvwsLCURk/PDZbWbvX4UVyTadC7wxBwmODusUKB4z9LZEZdJG1mVlPF
 JTEg==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Lechner <david@lechnology.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Sekhar Nori <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgNTozNCBQTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmds
QGJnZGV2LnBsPiB3cm90ZToKCj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3
c2tpQGJheWxpYnJlLmNvbT4KPgo+IFRoZXJlJ3Mgbm8gZ29vZCByZWFzb24gdG8gaGF2ZSB0aGUg
Z2VuZXJpYyBwcm9iaW5nIGNvZGUgaW4gYSBzZXBhcmF0ZQo+IHJvdXRpbmUuIFRoaXMgZnVuY3Rp
b24gaXMgc2hvcnQgYW5kIGlzIGlubGluZWQgYnkgdGhlIGNvbXBpbGVyIGFueXdheS4KPiBNb3Zl
IGl0IGludG8gcHJvYmUgdW5kZXIgdGhlIHBkYXRhLXNwZWNpZmljIHBhcnQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgoK
UmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllv
dXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
