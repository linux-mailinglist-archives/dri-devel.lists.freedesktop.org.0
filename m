Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4B5777A5
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 19:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9BE914D0;
	Sun, 17 Jul 2022 17:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162338D08E
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 17:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=s+/PjTNqyYmpEcNmfZriFAlvBGd84NJkEF+Q3a7qslc=;
 b=qjEDcuaoSr76+r/j9HYYkyumPDe6D9/KE/Wu6qYodgdiQoHstOPt59Q/4j7R9rptgf2r74SVd8p11
 qUHuyAqHY6iKgOM/tib3Fs8WulBopsJ+37pFeIsnkxM+oQHiEGhIthL18V87Wo4rOfJ7tNLskhuf4H
 2K/Y6hvHRKU+vV3aJWgLgKT1Y7UiTLA36YsyrT0oBTnPCCUP9NQB/ykhfbNgNa/V8ex5FtZmOBeqCw
 gRC9MU7knL8BRK23zTv+DAoUlZ3GTTeIjH/BfhRvBrGGn/U5z769omAytqBJFdhMOTeYsBdfa2q7Tq
 0RTXJKfYlThtiIWT7zZGUNe99K3Abpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=s+/PjTNqyYmpEcNmfZriFAlvBGd84NJkEF+Q3a7qslc=;
 b=4b4u/5GgsckUncPGlqb7pCwa1nBsdQZTe9Szqe0r5EA04IjHkagekoZwE+72FLdiZ8g3O/8uEgZ4g
 U/PbaNGAQ==
X-HalOne-Cookie: 829284897e10912949ceddc418dae9e9939d39de
X-HalOne-ID: 08e0e86d-05fa-11ed-be7f-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 08e0e86d-05fa-11ed-be7f-d0431ea8bb03;
 Sun, 17 Jul 2022 17:58:17 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v1 10/12] drm/omapdrm: Use drm_bridge_funcs.atomic_check
Date: Sun, 17 Jul 2022 19:57:59 +0200
Message-Id: <20220717175801.78668-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 chrome-platform@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Philip Chen <philipchen@chromium.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the deprecated drm_bridge_funcs.mode_fixup() with
drm_bridge_funcs.atomic_check().

drm_bridge_funcs.atomic_check() requires the atomic state operations,
update these to the default implementations.
Likewise update enable/disable to their atomic variants.

With these changes omapdrm now implement the full bridge atomic API.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Cai Huoqing <cai.huoqing@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c  | 31 ++++++++++++++++++------------
 drivers/gpu/drm/omapdrm/dss/sdi.c  | 31 ++++++++++++++++++------------
 drivers/gpu/drm/omapdrm/dss/venc.c | 28 +++++++++++++++++----------
 3 files changed, 56 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 030f997eccd0..0a0b49750eca 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -21,6 +21,7 @@
 #include <linux/string.h>
 #include <linux/sys_soc.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 
 #include "dss.h"
@@ -454,21 +455,22 @@ dpi_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static bool dpi_bridge_mode_fixup(struct drm_bridge *bridge,
-				   const struct drm_display_mode *mode,
-				   struct drm_display_mode *adjusted_mode)
+static int dpi_bridge_atomic_check(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
 {
 	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
-	unsigned long clock = mode->clock * 1000;
+	unsigned long clock = crtc_state->mode.clock * 1000;
 	int ret;
 
 	ret = dpi_clock_update(dpi, &clock);
 	if (ret < 0)
-		return false;
+		return ret;
 
-	adjusted_mode->clock = clock / 1000;
+	crtc_state->adjusted_mode.clock = clock / 1000;
 
-	return true;
+	return 0;
 }
 
 static void dpi_bridge_mode_set(struct drm_bridge *bridge,
@@ -480,7 +482,8 @@ static void dpi_bridge_mode_set(struct drm_bridge *bridge,
 	dpi->pixelclock = adjusted_mode->clock * 1000;
 }
 
-static void dpi_bridge_enable(struct drm_bridge *bridge)
+static void dpi_bridge_atomic_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
 {
 	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
 	int r;
@@ -531,7 +534,8 @@ static void dpi_bridge_enable(struct drm_bridge *bridge)
 		regulator_disable(dpi->vdds_dsi_reg);
 }
 
-static void dpi_bridge_disable(struct drm_bridge *bridge)
+static void dpi_bridge_atomic_disable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_bridge_state)
 {
 	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
 
@@ -552,10 +556,13 @@ static void dpi_bridge_disable(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs dpi_bridge_funcs = {
 	.attach = dpi_bridge_attach,
 	.mode_valid = dpi_bridge_mode_valid,
-	.mode_fixup = dpi_bridge_mode_fixup,
+	.atomic_check = dpi_bridge_atomic_check,
 	.mode_set = dpi_bridge_mode_set,
-	.enable = dpi_bridge_enable,
-	.disable = dpi_bridge_disable,
+	.atomic_enable = dpi_bridge_atomic_enable,
+	.atomic_disable = dpi_bridge_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static void dpi_bridge_init(struct dpi_data *dpi)
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 91eaae3b9481..73b728722c2f 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -15,6 +15,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 
 #include "dss.h"
@@ -159,12 +160,13 @@ sdi_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static bool sdi_bridge_mode_fixup(struct drm_bridge *bridge,
-				  const struct drm_display_mode *mode,
-				  struct drm_display_mode *adjusted_mode)
+static int sdi_bridge_atomic_check(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
 {
 	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
-	unsigned long pixelclock = mode->clock * 1000;
+	unsigned long pixelclock = crtc_state->mode.clock * 1000;
 	struct dispc_clock_info dispc_cinfo;
 	unsigned long fck;
 	unsigned long pck;
@@ -172,7 +174,7 @@ static bool sdi_bridge_mode_fixup(struct drm_bridge *bridge,
 
 	ret = sdi_calc_clock_div(sdi, pixelclock, &fck, &dispc_cinfo);
 	if (ret < 0)
-		return false;
+		return ret;
 
 	pck = fck / dispc_cinfo.lck_div / dispc_cinfo.pck_div;
 
@@ -181,9 +183,9 @@ static bool sdi_bridge_mode_fixup(struct drm_bridge *bridge,
 			"pixel clock adjusted from %lu Hz to %lu Hz\n",
 			pixelclock, pck);
 
-	adjusted_mode->clock = pck / 1000;
+	crtc_state->adjusted_mode.clock = pck / 1000;
 
-	return true;
+	return 0;
 }
 
 static void sdi_bridge_mode_set(struct drm_bridge *bridge,
@@ -195,7 +197,8 @@ static void sdi_bridge_mode_set(struct drm_bridge *bridge,
 	sdi->pixelclock = adjusted_mode->clock * 1000;
 }
 
-static void sdi_bridge_enable(struct drm_bridge *bridge)
+static void sdi_bridge_atomic_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
 {
 	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
 	struct dispc_clock_info dispc_cinfo;
@@ -258,7 +261,8 @@ static void sdi_bridge_enable(struct drm_bridge *bridge)
 	regulator_disable(sdi->vdds_sdi_reg);
 }
 
-static void sdi_bridge_disable(struct drm_bridge *bridge)
+static void sdi_bridge_atomic_disable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_bridge_state)
 {
 	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
 
@@ -274,10 +278,13 @@ static void sdi_bridge_disable(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs sdi_bridge_funcs = {
 	.attach = sdi_bridge_attach,
 	.mode_valid = sdi_bridge_mode_valid,
-	.mode_fixup = sdi_bridge_mode_fixup,
+	.atomic_check = sdi_bridge_atomic_check,
 	.mode_set = sdi_bridge_mode_set,
-	.enable = sdi_bridge_enable,
-	.disable = sdi_bridge_disable,
+	.atomic_enable = sdi_bridge_atomic_enable,
+	.atomic_disable = sdi_bridge_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static void sdi_bridge_init(struct sdi_device *sdi)
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 4480b69ab5a7..994e6399d574 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -25,6 +25,7 @@
 #include <linux/component.h>
 #include <linux/sys_soc.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 
 #include "omapdss.h"
@@ -564,11 +565,13 @@ venc_bridge_mode_valid(struct drm_bridge *bridge,
 	}
 }
 
-static bool venc_bridge_mode_fixup(struct drm_bridge *bridge,
-				   const struct drm_display_mode *mode,
-				   struct drm_display_mode *adjusted_mode)
+static int venc_bridge_atomic_check(struct drm_bridge *bridge,
+				    struct drm_bridge_state *bridge_state,
+				    struct drm_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state)
 {
 	const struct drm_display_mode *venc_mode;
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 
 	switch (venc_get_videomode(adjusted_mode)) {
 	case VENC_MODE_PAL:
@@ -580,14 +583,14 @@ static bool venc_bridge_mode_fixup(struct drm_bridge *bridge,
 		break;
 
 	default:
-		return false;
+		return -EINVAL;
 	}
 
 	drm_mode_copy(adjusted_mode, venc_mode);
 	drm_mode_set_crtcinfo(adjusted_mode, CRTC_INTERLACE_HALVE_V);
 	drm_mode_set_name(adjusted_mode);
 
-	return true;
+	return 0;
 }
 
 static void venc_bridge_mode_set(struct drm_bridge *bridge,
@@ -613,14 +616,16 @@ static void venc_bridge_mode_set(struct drm_bridge *bridge,
 	dispc_set_tv_pclk(venc->dss->dispc, 13500000);
 }
 
-static void venc_bridge_enable(struct drm_bridge *bridge)
+static void venc_bridge_atomic_enable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_bridge_state)
 {
 	struct venc_device *venc = drm_bridge_to_venc(bridge);
 
 	venc_power_on(venc);
 }
 
-static void venc_bridge_disable(struct drm_bridge *bridge)
+static void venc_bridge_atomic_disable(struct drm_bridge *bridge,
+				       struct drm_bridge_state *old_bridge_state)
 {
 	struct venc_device *venc = drm_bridge_to_venc(bridge);
 
@@ -654,11 +659,14 @@ static int venc_bridge_get_modes(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs venc_bridge_funcs = {
 	.attach = venc_bridge_attach,
 	.mode_valid = venc_bridge_mode_valid,
-	.mode_fixup = venc_bridge_mode_fixup,
+	.atomic_check = venc_bridge_atomic_check,
 	.mode_set = venc_bridge_mode_set,
-	.enable = venc_bridge_enable,
-	.disable = venc_bridge_disable,
+	.atomic_enable = venc_bridge_atomic_enable,
+	.atomic_disable = venc_bridge_atomic_disable,
 	.get_modes = venc_bridge_get_modes,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static void venc_bridge_init(struct venc_device *venc)
-- 
2.34.1

