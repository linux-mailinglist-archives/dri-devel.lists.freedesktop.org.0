Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C6310E19A
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2019 12:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8ED789B70;
	Sun,  1 Dec 2019 11:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5BC89B70
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2019 11:32:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 28D822003D;
 Sun,  1 Dec 2019 12:32:48 +0100 (CET)
Date: Sun, 1 Dec 2019 12:32:46 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 03/16] drm/exynos: fix opencoded use of drm_panel_*
Message-ID: <20191201113246.GC8753@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-4-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=hD80L64hAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=XXxF64UjzUu2oWhWWqkA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
 a=1CNFftbPRP8L7MoqJWF3:22
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMDQsIDIwMTkgYXQgMTA6MTY6MjRQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IENhbGwgdmlhIGRybV9wYW5lbF9nZXRfbW9kZXMoKS4KPiAKCkFwcGxpZWQgdG8gZHJt
LW1pc2MtbmV4dC4KCiAgICAgICAgU2FtCgo+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgo+
IENjOiBKb29ueW91bmcgU2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+Cj4gQ2M6IFNldW5n
LVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5jb20+Cj4gQ2M6IEt5dW5nbWluIFBhcmsgPGt5
dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+Cj4gQ2M6IEt1a2ppbiBLaW0gPGtnZW5lQGtlcm5lbC5v
cmc+Cj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiBDYzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNhbXN1bmctc29j
QHZnZXIua2VybmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZHNpLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiBpbmRl
eCA2OTI2Y2VlOTFiMzYuLjM2YjAyYjQ1NmQ5YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZHNpLmMKPiBAQCAtMTQ2MCw3ICsxNDYwLDcgQEAgc3RhdGljIGludCBleHlu
b3NfZHNpX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAJc3Ry
dWN0IGV4eW5vc19kc2kgKmRzaSA9IGNvbm5lY3Rvcl90b19kc2koY29ubmVjdG9yKTsKPiAgCj4g
IAlpZiAoZHNpLT5wYW5lbCkKPiAtCQlyZXR1cm4gZHNpLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2Rl
cyhkc2ktPnBhbmVsKTsKPiArCQlyZXR1cm4gZHJtX3BhbmVsX2dldF9tb2Rlcyhkc2ktPnBhbmVs
KTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+IC0tIAo+IDIuMjAuMQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
