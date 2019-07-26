Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE77076FC2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 19:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743E76EDD9;
	Fri, 26 Jul 2019 17:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F786ED3E;
 Fri, 26 Jul 2019 17:24:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 8483428C54D
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 02/24] drm: Add drm_connector_init() variant with ddc
Date: Fri, 26 Jul 2019 19:22:56 +0200
Message-Id: <3915224ae895240fd0973cf7f06b9d453e4d8520.1564161140.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
cnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KQWNrZWQtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fY29ubmVjdG9yLmMgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgfCAgNyArKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwppbmRleCBjYmI1
NDhiMzcwOGYuLmQ0OWUxOWYzZGUzYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
b25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCkBAIC0yOTcs
NiArMjk3LDQxIEBAIGludCBkcm1fY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2Nvbm5lY3Rvcl9pbml0KTsKIAorLyoqCisgKiBkcm1f
Y29ubmVjdG9yX2luaXRfd2l0aF9kZGMgLSBJbml0IGEgcHJlYWxsb2NhdGVkIGNvbm5lY3Rvcgor
ICogQGRldjogRFJNIGRldmljZQorICogQGNvbm5lY3RvcjogdGhlIGNvbm5lY3RvciB0byBpbml0
CisgKiBAZnVuY3M6IGNhbGxiYWNrcyBmb3IgdGhpcyBjb25uZWN0b3IKKyAqIEBjb25uZWN0b3Jf
dHlwZTogdXNlciB2aXNpYmxlIHR5cGUgb2YgdGhlIGNvbm5lY3RvcgorICogQGRkYzogcG9pbnRl
ciB0byB0aGUgYXNzb2NpYXRlZCBkZGMgYWRhcHRlcgorICoKKyAqIEluaXRpYWxpc2VzIGEgcHJl
YWxsb2NhdGVkIGNvbm5lY3Rvci4gQ29ubmVjdG9ycyBzaG91bGQgYmUKKyAqIHN1YmNsYXNzZWQg
YXMgcGFydCBvZiBkcml2ZXIgY29ubmVjdG9yIG9iamVjdHMuCisgKgorICogRW5zdXJlcyB0aGF0
IHRoZSBkZGMgZmllbGQgb2YgdGhlIGNvbm5lY3RvciBpcyBjb3JyZWN0bHkgc2V0LgorICoKKyAq
IFJldHVybnM6CisgKiBaZXJvIG9uIHN1Y2Nlc3MsIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KKyAq
LworaW50IGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAorCQkJCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCisJCQkJY29uc3Qgc3RydWN0
IGRybV9jb25uZWN0b3JfZnVuY3MgKmZ1bmNzLAorCQkJCWludCBjb25uZWN0b3JfdHlwZSwKKwkJ
CQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYykKK3sKKwlpbnQgcmV0OworCisJcmV0ID0gZHJtX2Nv
bm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yLCBmdW5jcywgY29ubmVjdG9yX3R5cGUpOworCWlm
IChyZXQpCisJCXJldHVybiByZXQ7CisKKwkvKiBwcm92aWRlIGRkYyBzeW1saW5rIGluIHN5c2Zz
ICovCisJY29ubmVjdG9yLT5kZGMgPSBkZGM7CisKKwlyZXR1cm4gcmV0OworfQorRVhQT1JUX1NZ
TUJPTChkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMpOworCiAvKioKICAqIGRybV9jb25uZWN0
b3JfYXR0YWNoX2VkaWRfcHJvcGVydHkgLSBhdHRhY2ggZWRpZCBwcm9wZXJ0eS4KICAqIEBjb25u
ZWN0b3I6IHRoZSBjb25uZWN0b3IKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0
b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAppbmRleCAzM2E2ZmZmODVmZGIuLmZj
NWQwODQzODMzMyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCisrKyBi
L2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaApAQCAtMTMxOSw2ICsxMzE5LDggQEAgc3RydWN0
IGRybV9jb25uZWN0b3IgewogCSAqIHRoaXMgZmllbGQsIHRoZW4gYW4gYXBwcm9wcmlhdGUgc3lt
Ym9saWMgbGluayBpcyBjcmVhdGVkIGluIGNvbm5lY3RvcgogCSAqIHN5c2ZzIGRpcmVjdG9yeSB0
byBtYWtlIGl0IGVhc3kgZm9yIHRoZSB1c2VyIHRvIHRlbGwgd2hpY2ggaTJjCiAJICogYWRhcHRl
ciBpcyBmb3IgYSBwYXJ0aWN1bGFyIGRpc3BsYXkuCisJICoKKwkgKiBUaGUgZmllbGQgc2hvdWxk
IGJlIHNldCBieSBjYWxsaW5nIGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygpLgogCSAqLwog
CXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwogCkBAIC0xNDEwLDYgKzE0MTIsMTEgQEAgaW50IGRy
bV9jb25uZWN0b3JfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkgICAgICAgc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAkJICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fY29u
bmVjdG9yX2Z1bmNzICpmdW5jcywKIAkJICAgICAgIGludCBjb25uZWN0b3JfdHlwZSk7CitpbnQg
ZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCisJCQkJ
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKKwkJCQljb25zdCBzdHJ1Y3QgZHJtX2Nv
bm5lY3Rvcl9mdW5jcyAqZnVuY3MsCisJCQkJaW50IGNvbm5lY3Rvcl90eXBlLAorCQkJCXN0cnVj
dCBpMmNfYWRhcHRlciAqZGRjKTsKIHZvaWQgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZWRpZF9wcm9w
ZXJ0eShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsKIGludCBkcm1fY29ubmVjdG9y
X3JlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpOwogdm9pZCBkcm1fY29u
bmVjdG9yX3VucmVnaXN0ZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvcik7Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
