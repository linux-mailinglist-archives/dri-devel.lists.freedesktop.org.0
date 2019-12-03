Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7037510FEA3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8776E519;
	Tue,  3 Dec 2019 13:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399E76E519
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:23:03 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y19so2918309lfl.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:23:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lefF5BM/gcR+So8Ygs7RCzWIIBhGl0bonM5D7lIAz2M=;
 b=hvAuW0YKfoJKyZuP4ciu6SD1xAJSmXDjT4d1KTAjkWjm6ufm4gKvQxviWXmJaUYO4S
 UOa7VG4WrVTVYg1TxV2F6wEkCphOgU3xnKzRENth8Qd3U2ZzbwZ6BguUwEzqVf5AIJIn
 CPmRtYkFpIoKu3Jcb1M5h55s7qOaiXgj9XXtAPPhJvPOfSB220n74cpnXf5JJ7NGACrj
 byUj5lf06IO0Z18lC90Z8vrwcNjAtvqPgk8bmtu4ocme+PdFfBCfwvwxXhuGl4uK5n1L
 xc+FhbLYNeQqdQIJxKE90dihCcEYk2Dssw4MgR38h2vLy61xXDsLFnUUAkQ1fuuvyU8F
 Y5Iw==
X-Gm-Message-State: APjAAAXw7SksUjJCvkAqNgAmB/2x1aH97UahCMNNvSlkOI4r4voDLRhO
 v7iq8q8warLE0+SxzuhL7pvH+KbIGS9OmViquM+pOw==
X-Google-Smtp-Source: APXvYqx22ebZnmuYdNzG9TrFSZg4isgk95/zsKEGLemAt431mQBCED4F4+fJ5lhPiKhrPXI40LsyMbi9cYOMTmUUeRQ=
X-Received: by 2002:ac2:5083:: with SMTP id f3mr1970416lfm.135.1575379381560; 
 Tue, 03 Dec 2019 05:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-5-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-5-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Dec 2019 14:22:50 +0100
Message-ID: <CACRpkdYT8u2Liq60xtTWeLc2q-R16XWtE1YstGp2WTgM2Cc6CA@mail.gmail.com>
Subject: Re: [PATCH v1 04/26] drm: get drm_bridge_panel connector via helper
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lefF5BM/gcR+So8Ygs7RCzWIIBhGl0bonM5D7lIAz2M=;
 b=ZwcHFup3L1FGPGk2xtvdRZFPmqpjl+1VvQLCjzq0rimrVIVqaG32x7PCDfBwRBdhIo
 wfFVMCzt/nwBpmmu726MfJIBszKsNjFvMWKcURMFeYoJFnyFPvGbWfNUAkjmA0arprAH
 xxbwDWIJo9nDwD2K3RFDnub+OayDe800qVEItuex48rNok6smlLWT62Pp3P8wxG/YbWQ
 q5dde7mJTd61eoUyIeQ0PMpdo8DxM6TZOnmuYEYlu4eIbFMQ/aYRNjWF4Qj24lP7V1JO
 X4rGteLiKCtTpowk5xUuEB1HkwUeJ5Mr5SgOtJornUUaf2Dz/nR/O6sc39dTBk+hVW6X
 1kmQ==
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
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMiwgMjAxOSBhdCA4OjMzIFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gd3JvdGU6Cgo+IFRoZSBkcm1fY29ubmVjdG9yIGNyZWF0ZWQgYnkgZHJtX3BhbmVsX2Jy
aWRnZSB3YXMgYWNjZXNzZWQKPiB2aWEgZHJtX3BhbmVsLmNvbm5lY3Rvci4KPiBBdm9pZCB0aGUg
ZGV0b3VyIGFyb3VuZCBkcm1fcGFuZWwgYnkgcHJvdmlkaW5nIGEgc2ltcGxlIGdldCBtZXRob2Qu
Cj4gVGhpcyBhdm9pZHMgZGlyZWN0IGFjY2VzcyB0byB0aGUgY29ubmVjdG9yIGZpZWxkIGluIGRy
bV9wYW5lbCBpbgo+IHRoZSB0d28gdXNlcnMuCj4KPiBVcGRhdGUgcGwxMTEgYW5kIHR2ZTIwMCB0
byB1c2UgdGhlIG5ldyBoZWxwZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+Cj4gQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+
Cj4gQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiBDYzogTGF1
cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBK
b25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cj4gQ2M6IEplcm5laiBTa3JhYmVjIDxqZXJu
ZWouc2tyYWJlY0BzaW9sLm5ldD4KPiBDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4K
PiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IENjOiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBN
YXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgoKV2l0
aCB0aGUgbGl0dGxlIGlzc3VlcyBmb3VuZCBieSBMYXVyZW50IGZpeGVkOgpSZXZpZXdlZC1ieTog
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdh
bGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
