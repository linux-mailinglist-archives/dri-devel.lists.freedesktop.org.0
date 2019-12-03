Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8BC10FEBD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138AF6E52C;
	Tue,  3 Dec 2019 13:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942776E52C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:26:54 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l18so2970302lfc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:26:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KgNg5NNZGR0exGpYVHoss0gt+wdaKyNS8ghAP3VHhsg=;
 b=o5+NhdfbzlhN11YSx+4ZRTOGLssIid9GV1AmPZM7R9B3YiduILcYrEnrYuy974Jafh
 kCwhBVnCF/gps53Q6Y/nL33Ns7l3cRqjIppxm4Bd0vYCDVJodirFRCEeAIuuM1oGNEUh
 ScGGE8M6d6sZOoJbvryySZsjaPQmAGantUg6vY0nPVXeK0XwFaxd5vBBJ6aHqENzSJaJ
 QO+ELY7DoKzJggvgaWiyjiBR3fmLdn/H90ujuS0SmwIeZKKTAS6InWU4C6BEundNklR7
 HFoqS3owvGFnFxdN0PCEByLrqbps+eqyy14wPrlQsqO6dY0FNnMFaAUtam0UuHCRHj2N
 ZRQA==
X-Gm-Message-State: APjAAAV3//s2bHvqAJw6aAoT3K1JNf037pCw+dvErzLrhAKHdN+kGFef
 rvDZbnFOT8wAqZ/k1J6XDUoUsqtbilo/eoUhEnOGLw==
X-Google-Smtp-Source: APXvYqzpK5xVCXuWnpb6zuvLbpHseb2a4Nv0GYrRiK24+O1ab7jDScclek+59Vfvj4nYCDMcLN7eKeirkaGez7A3MBw=
X-Received: by 2002:a19:c84:: with SMTP id 126mr2719867lfm.5.1575379612995;
 Tue, 03 Dec 2019 05:26:52 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-7-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-7-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Dec 2019 14:26:41 +0100
Message-ID: <CACRpkdaCgWu2ZhHc2L=bVW8S4V+omaZZhitpSKE4n0y4J6bdQQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/26] drm/panel: decouple connector from drm_panel
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KgNg5NNZGR0exGpYVHoss0gt+wdaKyNS8ghAP3VHhsg=;
 b=igkQQe78pMODNDUT8UJdAPTI3XPGUsbvE7Z0opW/4i+YxWrghvsSkBxmC/Tg4MAZQg
 u5ZCPeygt2VJ078TncPJqyerJr+k4NUeqCpp7Dh0OBHp8gjo3k/DsH8Gr5VBesqs75a8
 E65Uzd9tnumQ0HmJBFOkIjpsE+qiAiBGNBWizShXH0BbhJI+OxD2k4x0VqoRCnn9RbFa
 ZgG6GyycqKiJ/HgewELwsHSwS1T7Fqca13xC4y9rCOnm72R0g4bAA3zklkZX8aF4tMoa
 yUOVp/SKpaE9qzr5p2jCe2+z5C1ENiqT8IY/mK0+zIndY7yy1I//Hzhfrt1rLvU8FUDS
 bmIg==
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
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Vincent Abriou <vincent.abriou@st.com>, Allison Randal <allison@lohutok.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Rob Clark <robdclark@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Brian Masney <masneyb@onstation.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Shayenne Moura <shayenneluzmoura@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Kukjin Kim <kgene@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Icenowy Zheng <icenowy@aosc.io>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMiwgMjAxOSBhdCA4OjMzIFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gd3JvdGU6Cgo+IFRvIGZhY2lsaXRhdGUgdGhhdCBjb25uZWN0b3IgY3JlYXRpb24gd2ls
bCBiZSBtb3ZlZAo+IHRvIGRpc3BsYXkgZHJpdmVycywgZGVjb3VwbGUgdGhlIGRybV9jb25uZWN0
b3IgZnJvbSBkcm1fcGFuZWwuCj4gQWRkIGEgY29ubmVjdG9yIGFyZ3VtZW50IHRvIGRybV9wYW5l
bF9nZXRfbW9kZXMoKQo+Cj4gQWxsIHVzZXJzIG9mIGRybV9wYW5lbF9nZXRfbW9kZXMoKSBhbHJl
YWR5IGhhZCB0aGUgY29ubmVjdG9yCj4gYXZhaWxhYmxlLCBzbyB1cGRhdGluZyB1c2VycyB3YXMg
dHJpdmlhbC4KPgo+IFdpdGggdGhpcyBwYXRjaCBkcm1fcGFuZWwgbm8gbG9uZ2VyIGtlZXAgYSBj
b3B5IG9mIHRoZSBkcm1fY29ubmVjdG9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzog
QW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBDYzogTmVpbCBBcm1zdHJvbmcg
PG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IENjOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2li
b28uc2U+Cj4gQ2M6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KPiBD
YzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
PiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgo+IENjOiBKb29ueW91bmcg
U2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+Cj4gQ2M6IFNldW5nLVdvbyBLaW0gPHN3MDMx
Mi5raW1Ac2Ftc3VuZy5jb20+Cj4gQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ft
c3VuZy5jb20+Cj4gQ2M6IEt1a2ppbiBLaW0gPGtnZW5lQGtlcm5lbC5vcmc+Cj4gQ2M6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiBDYzogU3RlZmFuIEFnbmVyIDxzdGVm
YW5AYWduZXIuY2g+Cj4gQ2M6IEFsaXNvbiBXYW5nIDxhbGlzb24ud2FuZ0BueHAuY29tPgo+IENj
OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBTaGF3biBHdW8g
PHNoYXduZ3VvQGtlcm5lbC5vcmc+Cj4gQ2M6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRy
b25peC5kZT4KPiBDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25p
eC5kZT4KPiBDYzogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+IENjOiBOWFAg
TGludXggVGVhbSA8bGludXgtaW14QG54cC5jb20+Cj4gQ2M6IENLIEh1IDxjay5odUBtZWRpYXRl
ay5jb20+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4g
Q2M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9t
aS52YWxrZWluZW5AdGkuY29tPgo+IENjOiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0r
cmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+IENjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hp
cHMuY29tPgo+IENjOiAiSGVpa28gU3TDvGJuZXIiIDxoZWlrb0BzbnRlY2guZGU+Cj4gQ2M6IEJl
bmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+IENjOiBWaW5j
ZW50IEFicmlvdSA8dmluY2VudC5hYnJpb3VAc3QuY29tPgo+IENjOiBDaGVuLVl1IFRzYWkgPHdl
bnNAY3NpZS5vcmc+Cj4gQ2M6IEpvbmF0aGFuIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+
Cj4gQ2M6IFRvcnN0ZW4gRHV3ZSA8ZHV3ZUBsc3QuZGU+Cj4gQ2M6IFZhc2lseSBLaG9ydXpoaWNr
IDxhbmFyc291bEBnbWFpbC5jb20+Cj4gQ2M6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5p
bz4KPiBDYzogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gQ2M6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBDYzogQm9yaXMgQnJlemlsbG9uIDxi
b3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBDYzogSGFyaXByYXNhZCBLZWxhbSA8aGFy
aXByYXNhZC5rZWxhbUBnbWFpbC5jb20+Cj4gQ2M6IEFsZXhpb3MgWmF2cmFzIDxhbGV4aW9zLnph
dnJhc0BpbnRlbC5jb20+Cj4gQ2M6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3Jn
Pgo+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gQ2M6IFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IENjOiBBbGxpc29uIFJhbmRhbCA8YWxsaXNv
bkBsb2h1dG9rLm5ldD4KPiBDYzogU2hheWVubmUgTW91cmEgPHNoYXllbm5lbHV6bW91cmFAZ21h
aWwuY29tPgo+IENjOiBBYmhpbmF2IEt1bWFyIDxhYmhpbmF2a0Bjb2RlYXVyb3JhLm9yZz4KPiBD
YzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNhbXN1
bmctc29jQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCj4gQ2M6IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51
eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXRlZ3JhQHZnZXIua2Vy
bmVsLm9yZwoKVGhpcyBpcyBhIGdvb2QgcmVmYWN0b3JpbmcuIEl0IG1ha2VzIGl0IGVhc2llciB0
byB1bmRlcnN0YW5kCndoZXJlIHRoaW5ncyBiZWxvbmcuCgpSZXZpZXdlZC1ieTogTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
