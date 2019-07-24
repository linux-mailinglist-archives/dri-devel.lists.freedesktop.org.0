Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF2A7307D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 16:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7723D6E550;
	Wed, 24 Jul 2019 14:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC7D6E550;
 Wed, 24 Jul 2019 14:00:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 22E3E28B54B
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 02/24] drm: Add drm_connector_init() variant with ddc
Date: Wed, 24 Jul 2019 15:59:24 +0200
Message-Id: <53f5ded2971235e5b63c9a3ed4ed8bccf10c78f2.1563960855.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgcGFzc2luZyBkZGMgYWRhcHRlciBwb2ludGVyIHRvIHRoZSBpbml0IGZ1bmN0aW9uLiBF
dmVuIGlmCmRybV9jb25uZWN0b3JfaW5pdCgpIHNvbWV0aW1lIGluIHRoZSBmdXR1cmUgZGVjaWRl
cyB0byBlLmcuIG1lbXNldCgpIGFsbApjb25uZWN0b3IgZmllbGRzIHRvIHplcm9zLCB0aGUgbmV3
bHkgYWRkZWQgZnVuY3Rpb24gZW5zdXJlcyB0aGF0IGF0IGl0cwpjb21wbGV0aW9uIHRoZSBkZGMg
bWVtYmVyIG9mIGNvbm5lY3RvciBpcyBjb3JyZWN0bHkgc2V0LgoKU2lnbmVkLW9mZi1ieTogQW5k
cnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwogaW5jbHVk
ZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICB8ICA1ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rv
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwppbmRleCAwNjhkNGIwNWYxYmUu
LjA2ZmJmYzQ0ZmI0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3Iu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCkBAIC0yOTYsNiArMjk2LDI1
IEBAIGludCBkcm1fY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIH0KIEVY
UE9SVF9TWU1CT0woZHJtX2Nvbm5lY3Rvcl9pbml0KTsKIAoraW50IGRybV9jb25uZWN0b3JfaW5p
dF93aXRoX2RkYyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAorCQkJCXN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IsCisJCQkJY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgKmZ1
bmNzLAorCQkJCWludCBjb25uZWN0b3JfdHlwZSwKKwkJCQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRk
YykKK3sKKwlpbnQgcmV0OworCisJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVj
dG9yLCBmdW5jcywgY29ubmVjdG9yX3R5cGUpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisK
KwkvKiBwcm92aWRlIGRkYyBzeW1saW5rIGluIHN5c2ZzICovCisJY29ubmVjdG9yLT5kZGMgPSBk
ZGM7CisKKwlyZXR1cm4gcmV0OworfQorRVhQT1JUX1NZTUJPTChkcm1fY29ubmVjdG9yX2luaXRf
d2l0aF9kZGMpOworCiAvKioKICAqIGRybV9jb25uZWN0b3JfYXR0YWNoX2VkaWRfcHJvcGVydHkg
LSBhdHRhY2ggZWRpZCBwcm9wZXJ0eS4KICAqIEBjb25uZWN0b3I6IHRoZSBjb25uZWN0b3IKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9j
b25uZWN0b3IuaAppbmRleCAzM2E2ZmZmODVmZGIuLjkzN2ZkYTljMTM3NCAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0
b3IuaApAQCAtMTQxMCw2ICsxNDEwLDExIEBAIGludCBkcm1fY29ubmVjdG9yX2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKIAkJICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IsCiAJCSAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyAqZnVuY3MsCiAJ
CSAgICAgICBpbnQgY29ubmVjdG9yX3R5cGUpOworaW50IGRybV9jb25uZWN0b3JfaW5pdF93aXRo
X2RkYyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAorCQkJCXN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsCisJCQkJY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgKmZ1bmNzLAor
CQkJCWludCBjb25uZWN0b3JfdHlwZSwKKwkJCQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYyk7CiB2
b2lkIGRybV9jb25uZWN0b3JfYXR0YWNoX2VkaWRfcHJvcGVydHkoc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3Rvcik7CiBpbnQgZHJtX2Nvbm5lY3Rvcl9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKTsKIHZvaWQgZHJtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
