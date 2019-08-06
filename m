Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091EC831ED
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 14:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0A46E37C;
	Tue,  6 Aug 2019 12:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048D488525
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 12:56:30 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m8so48564933lji.7
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 05:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hWkwxSekOFjOJkkiUvNS6vk1XTlC8GglcO/MoVG5QiU=;
 b=BLnpDjmW762ZsDd4QCB3nBdivyp45SnCaKOC6FL4ZhIR7k0/x+d025m3J+VwxfL6V+
 kqEt1yBVR9Yao3Xx2PUM1ftLjfesPUBpk6rF9NsJyiU2ox7enZqTzs2f/8cRXfr1vvjH
 GucATW/qbjKLcUNidPCjAw4MTmciBv05saFsJ33jsjVQid1kEZX2sfMCrLgn0bzovEyQ
 kMBnlK5Jz04YwHOlWalCf1cbIo7K2+Qcg0ZE8JGHaCwJATT/9kWPfDqJZGapvMoN5sae
 5JKSfgJ9MfovoHh9YGSTyjWSkVKYVucYYz7PgAxqjMSaW5pVFSpm2EN1ZX2QbCpgkQWH
 /gGg==
X-Gm-Message-State: APjAAAUu2eRAU5uaVvHrARnAsc5knElqw+xGfqbstPaXis1gRpKXUlLX
 k49/X3f0SJxdnhdzY/qySzV3+ByjYzpCUTYCHwGZEg==
X-Google-Smtp-Source: APXvYqyubXEyA8qA2bp+bFUDFeaZYa6vFIsx3pnY8ux450GbZ0ztgW/G/BCVR2DhdbCt29loENRPoYWQh344coTndK4=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr1742815ljg.37.1565096189174;
 Tue, 06 Aug 2019 05:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-11-sam@ravnborg.org>
In-Reply-To: <20190804201637.1240-11-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Aug 2019 14:56:16 +0200
Message-ID: <CACRpkdYTaaxqhSSPx8KToVaiRJtzNmNynGCoGTMeJVgDUCsTnQ@mail.gmail.com>
Subject: Re: [PATCH v1 10/16] drm/panel: ili9322: move bus_flags to get_modes()
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hWkwxSekOFjOJkkiUvNS6vk1XTlC8GglcO/MoVG5QiU=;
 b=sHDErg1nel+qWZ6ii4Ow3da3HFj48RR7397s2QyeksX1iOni6fqeQTB3BqjhvnXymg
 iDZ9/asuSdIwLEQ5+ASOgIwa3KaYHYgffPLUz0DjarhoqXArAdSLVuCeimHCPEmQL82E
 estLVQyp/jfbd0YCA4DksvLMUL4+LXAC4feuCS6kGtz1OOY2ZNT0FLZ+LPKAkssy0/pu
 Lfv3LV7ZLljskBd/xxsMOK9/JcDO0QbOgrA9r4p7x1osSVLm64d75lQd7dEkiUbPCFWU
 Dm6ChuZWYqbu4VavYKXXv5UWiFoLLFsK1wv1UblaGU+WQIYDezjt/pURraKW1BTA3+if
 87kw==
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgNCwgMjAxOSBhdCAxMDoxNyBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgoKPiBUbyBwcmVwYXJlIHRoZSBkcml2ZXIgdG8gcmVjZWl2ZSBkcm1fY29u
bmVjdG9yIG9ubHkgaW4gdGhlIGdldF9tb2RlcygpCj4gY2FsbGJhY2ssIG1vdmUgYnVzX2ZsYWdz
IGhhbmRsaW5nIHRvIGlsaTkzMjJfZ2V0X21vZGVzKCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BnbWFpbC5jb20+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
Ck9LIEkgZG9uJ3Qgc2VlIHdoZXJlIHRoaXMgaXMgZ29pbmcgYnV0IEkgdHJ1c3QgeW91IHNvOgpB
Y2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
