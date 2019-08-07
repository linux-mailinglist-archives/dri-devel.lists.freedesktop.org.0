Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4362E84B18
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 13:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1C56E6B6;
	Wed,  7 Aug 2019 11:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648436E6B7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 11:55:46 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g18so65511576qkl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 04:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SYVsSHsvSWXRztrf3IuVhfzf5yR2eq8e4OeojMpGXV4=;
 b=r6PXiBT1eZcmesgJZu8LttFs//4ZRVpIgxzzebt88n4G7qJdAWlMcvwemD3P2ihBFL
 9gGN68u6++vuL6A+8q9SxJ44v/zZ8bu9BnTgkCvw59VCKnDgeQlAeNh7EeEHeUbNFDa6
 Z3LToCoIMegk50xeLl6fZm5DWzMmMdC+mlAOROIixli8pPNaFrjj7SuBCyUGmR1bL/0d
 ZYzs6dFmRWSAPzxPEixYbvx1jG5XDRSn1s2csFDW3DPpA8fsLYzVrp3sZbo3/vF2V5Gb
 lDhLMJxit5B9OaSxk3fPwq7udiFzQibYDcrdkrHukHDe6CWzLiYM35N0OmEAi6+o+QLW
 f8eA==
X-Gm-Message-State: APjAAAUfQPC0EN2M499IHNymES9vXU26rDzl/Xp9J2Vxpsde9Se7C5es
 g7Eo2RtewEUXX6uSKue8hNgHngJPHe8dNwWlbZfhfw==
X-Google-Smtp-Source: APXvYqwEsXcr4FpH9gDfLIkM8xlP9ZUuM0nR3mM2uKxsKf/UACxOWHfAXNmHuJ/ZKRMRUNo55y8wJzZDblUivvVNr2A=
X-Received: by 2002:a37:4d16:: with SMTP id a22mr8030512qkb.103.1565178944593; 
 Wed, 07 Aug 2019 04:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-9-sam@ravnborg.org>
In-Reply-To: <20190804201637.1240-9-sam@ravnborg.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Wed, 7 Aug 2019 13:55:33 +0200
Message-ID: <CA+M3ks4weUp8wtZktTj9TwLis=x4EyyRjOYh6eavvw_CxuKkuA@mail.gmail.com>
Subject: Re: [PATCH v1 08/16] drm/sti: fix opencoded use of drm_panel_*
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SYVsSHsvSWXRztrf3IuVhfzf5yR2eq8e4OeojMpGXV4=;
 b=MvVp0PhouLDFbAzPC6BlPhwnjMq6wj4aKW+xqnyO4EpFpbnlmYNShTSj2QvZyC2cwo
 id+9iDAv2VuLz4ZkOVmpWD1iFCrwBLFEzgrsVH7lrHNpz3794rZO51JvOwAAtLZKxLag
 KuferNUkbVm+v83TZ3zD0XXQ2ZXvook4I1m8N86QUeZ/JH7AT1mPxoVIhYstrgX7Du+a
 Us50AGkRmA3jrnvewEbut09BEHBAtTdwhhwW7cWPiC8wTo7iwH/9xwmZYsG0GKzbXmOA
 JfRO1GBWleE+OiE3Rry//QTfz0UyU5RMxzecKNz68fhKbBiH6J+Gnrl4QNF+hwmmjLYk
 BZhw==
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
 ML dri-devel <dri-devel@lists.freedesktop.org>,
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
 "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgZGltLiA0IGFvw7t0IDIwMTkgw6AgMjI6MTcsIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gYSDDqWNyaXQgOgo+Cj4gVXNlIHRoZSBkcm1fcGFuZWxfKGVuYWJsZXxkaXNhYmxlfGdl
dF9tb2RlcykgZnVuY3Rpb25zLgoKQXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0LApUaGFua3MuCgpC
ZW5qYW1pbgoKPgo+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+
Cj4gQ2M6IFZpbmNlbnQgQWJyaW91IDx2aW5jZW50LmFicmlvdUBzdC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9zdGkvc3RpX2R2by5jIHwgOCArKystLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9zdGkvc3RpX2R2by5jIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHZvLmMK
PiBpbmRleCA5ZTZkNWQ4YjcwMzAuLmU1NTg3MDE5MGJmNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc3RpL3N0aV9kdm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2R2
by5jCj4gQEAgLTIyMSw4ICsyMjEsNyBAQCBzdGF0aWMgdm9pZCBzdGlfZHZvX2Rpc2FibGUoc3Ry
dWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPgo+ICAgICAgICAgd3JpdGVsKDB4MDAwMDAwMDAsIGR2
by0+cmVncyArIERWT19ET0ZfQ0ZHKTsKPgo+IC0gICAgICAgaWYgKGR2by0+cGFuZWwpCj4gLSAg
ICAgICAgICAgICAgIGR2by0+cGFuZWwtPmZ1bmNzLT5kaXNhYmxlKGR2by0+cGFuZWwpOwo+ICsg
ICAgICAgZHJtX3BhbmVsX2Rpc2FibGUoZHZvLT5wYW5lbCk7Cj4KPiAgICAgICAgIC8qIERpc2Fi
bGUvdW5wcmVwYXJlIGR2byBjbG9jayAqLwo+ICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJl
KGR2by0+Y2xrX3BpeCk7Cj4gQEAgLTI2Miw4ICsyNjEsNyBAQCBzdGF0aWMgdm9pZCBzdGlfZHZv
X3ByZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgICAgICAgIGlmIChjbGtf
cHJlcGFyZV9lbmFibGUoZHZvLT5jbGspKQo+ICAgICAgICAgICAgICAgICBEUk1fRVJST1IoIkZh
aWxlZCB0byBwcmVwYXJlL2VuYWJsZSBkdm8gY2xrXG4iKTsKPgo+IC0gICAgICAgaWYgKGR2by0+
cGFuZWwpCj4gLSAgICAgICAgICAgICAgIGR2by0+cGFuZWwtPmZ1bmNzLT5lbmFibGUoZHZvLT5w
YW5lbCk7Cj4gKyAgICAgICBkcm1fcGFuZWxfZW5hYmxlKGR2by0+cGFuZWwpOwo+Cj4gICAgICAg
ICAvKiBTZXQgTFVUICovCj4gICAgICAgICB3cml0ZWwoY29uZmlnLT5sb3dieXRlLCAgZHZvLT5y
ZWdzICsgRFZPX0xVVF9QUk9HX0xPVyk7Cj4gQEAgLTM0MCw3ICszMzgsNyBAQCBzdGF0aWMgaW50
IHN0aV9kdm9fY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yKQo+ICAgICAgICAgc3RydWN0IHN0aV9kdm8gKmR2byA9IGR2b19jb25uZWN0b3ItPmR2bzsK
Pgo+ICAgICAgICAgaWYgKGR2by0+cGFuZWwpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBkdm8t
PnBhbmVsLT5mdW5jcy0+Z2V0X21vZGVzKGR2by0+cGFuZWwpOwo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gZHJtX3BhbmVsX2dldF9tb2Rlcyhkdm8tPnBhbmVsKTsKPgo+ICAgICAgICAgcmV0dXJu
IDA7Cj4gIH0KPiAtLQo+IDIuMjAuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
