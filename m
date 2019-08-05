Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B403D81544
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86AD89CF7;
	Mon,  5 Aug 2019 09:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0AE89CF7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:20:43 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 82F595C0169;
 Mon,  5 Aug 2019 11:20:41 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 05 Aug 2019 11:20:41 +0200
From: Stefan Agner <stefan@agner.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 07/16] drm/mxsfb: fix opencoded use of drm_panel_*
In-Reply-To: <20190804201637.1240-8-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-8-sam@ravnborg.org>
Message-ID: <a6833b84301dfb5f73a2f4caaf7d482d@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1564996841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDYDScTuSCYF0FjQcbcrJzxIQ0/kmURL7uAqHm2hNns=;
 b=Rxq2u4nFlSE5hZ1FNYyZNJOOGXI2LUdn8tyMLyaKzfEYo+rwaFHmxVUnWg61t+arxfbptS
 EfHfSmB+RD8tMiMKiqGE/OBJaN1BzwJbv9b61JtDIRYnkw9x2i1R/BwMxV+VGBa+zD1d1Q
 qce/WUzXxVIHeQivwwCACaXiPAyrhfI=
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
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Sam Ravnborg <sam.ravnborg@gmail.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0wNCAyMjoxNiwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IFVzZSB0aGUgZHJtX3Bh
bmVsX2dldF9tb2RlcygpIGZ1bmN0aW9uLgoKTG9va3MgZ29vZCB0byBtZSwKCkFja2VkLWJ5OiBT
dGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KCi0tClN0ZWZhbgoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxt
YXJleEBkZW54LmRlPgo+IENjOiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiBDYzog
U2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgo+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1
ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxA
cGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4K
PiBDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgo+IENjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL214c2Zi
L214c2ZiX291dC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2Zi
X291dC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfb3V0LmMKPiBpbmRleCAyMzFk
MDE2YzZmNDcuLmJlMzZmNGQ2Y2M5NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhz
ZmIvbXhzZmJfb3V0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfb3V0LmMK
PiBAQCAtMzAsNyArMzAsNyBAQCBzdGF0aWMgaW50IG14c2ZiX3BhbmVsX2dldF9tb2RlcyhzdHJ1
Y3QKPiBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAkJCWRybV9jb25uZWN0b3JfdG9fbXhz
ZmJfZHJtX3ByaXZhdGUoY29ubmVjdG9yKTsKPiAgCj4gIAlpZiAobXhzZmItPnBhbmVsKQo+IC0J
CXJldHVybiBteHNmYi0+cGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMobXhzZmItPnBhbmVsKTsKPiAr
CQlyZXR1cm4gZHJtX3BhbmVsX2dldF9tb2RlcyhteHNmYi0+cGFuZWwpOwo+ICAKPiAgCXJldHVy
biAwOwo+ICB9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
