Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1645A0140
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A854B7901;
	Wed, 24 Aug 2022 18:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9020392E69
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:28:22 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC67A56D;
 Wed, 17 Aug 2022 15:28:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1660742901;
 bh=isXcyL+hCIy1H1joimjTOXQlpx5PdBX8l2etzmqa9gM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PR3P2D5e0ot1QuoNw8VH0yg+rb5y6lWKK+6u/Efo75gUqgtQMziu54KpQIh/WfTUZ
 fwsen7wM/WlnZ3QMStLNM7gqu/FIJ0xt0zqzR5wpIEsEgFYA+hk7uwOxoibxagCB1J
 5mWRT/wtgCb+UC9hHcTCS8LF4UE7iqa3b1M9MD6Y=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] drm: rcar-du: fix DSI enable & disable sequence
Date: Wed, 17 Aug 2022 16:28:03 +0300
Message-Id: <20220817132803.85373-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817132803.85373-1-tomi.valkeinen@ideasonboard.com>
References: <20220817132803.85373-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

The rcar crtc depends on the clock provided from the rcar DSI bridge.
When the DSI bridge is disabled, the clock is stopped, which causes the
crtc disable to timeout.

Also, while I have no issue with the enable, the documentation suggests
to enable the DSI before the crtc so that the crtc has its clock enabled
at enable time. This is also not done by the current driver.

To fix this, we need to keep the DSI bridge enabled until the crtc has
disabled itself, and enable the DSI bridge before crtc enables itself.

Add functions (rcar_mipi_dsi_atomic_early_enable and
rcar_mipi_dsi_atomic_late_disable) to the rcar DSI bridge driver which
the rcar driver can use to enable/disable the DSI clock when needed.
This is similar to what is already done with the rcar LVDS bridge.

Also add a new function, rcar_mipi_dsi_stop_video(), called from
rcar_mipi_dsi_atomic_enable so that the DSI TX gets disabled at the
correct time, even if the clocks are still kept enabled.

And, while possibly not strictly needed, clear clock related enable bits
in rcar_mipi_dsi_atomic_late_disable to mirror the sequence done in
rcar_mipi_dsi_startup() (via rcar_mipi_dsi_atomic_early_enable).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 25 +++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c   | 63 +++++++++++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h   | 32 ++++++++++++
 5 files changed, 121 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index fd3b94649a01..51fd1d99f4e8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -29,6 +29,7 @@
 #include "rcar_du_regs.h"
 #include "rcar_du_vsp.h"
 #include "rcar_lvds.h"
+#include "rcar_mipi_dsi.h"
 
 static u32 rcar_du_crtc_read(struct rcar_du_crtc *rcrtc, u32 reg)
 {
@@ -733,6 +734,18 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 		rcar_cmm_enable(rcrtc->cmm);
 	rcar_du_crtc_get(rcrtc);
 
+	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
+	    (rstate->outputs &
+	     (BIT(RCAR_DU_OUTPUT_DSI0) | BIT(RCAR_DU_OUTPUT_DSI1)))) {
+		struct drm_bridge *bridge = rcdu->dsi[rcrtc->index];
+
+		/*
+		 * Enable the DSI clock output.
+		 */
+
+		rcar_mipi_dsi_atomic_early_enable(bridge, state);
+	}
+
 	/*
 	 * On D3/E3 the dot clock is provided by the LVDS encoder attached to
 	 * the DU channel. We need to enable its clock output explicitly if
@@ -769,6 +782,18 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 	rcar_du_crtc_stop(rcrtc);
 	rcar_du_crtc_put(rcrtc);
 
+	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
+	    (rstate->outputs &
+	     (BIT(RCAR_DU_OUTPUT_DSI0) | BIT(RCAR_DU_OUTPUT_DSI1)))) {
+		struct drm_bridge *bridge = rcdu->dsi[rcrtc->index];
+
+		/*
+		 * Disable the DSI clock output.
+		 */
+
+		rcar_mipi_dsi_atomic_late_disable(bridge);
+	}
+
 	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
 	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
 		struct drm_bridge *bridge = rcdu->lvds[rcrtc->index];
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 712389c7b3d0..5cfa2bb7ad93 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -92,6 +92,7 @@ struct rcar_du_device_info {
 #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
 #define RCAR_DU_MAX_VSPS		4
 #define RCAR_DU_MAX_LVDS		2
+#define RCAR_DU_MAX_DSI			2
 
 struct rcar_du_device {
 	struct device *dev;
@@ -108,6 +109,7 @@ struct rcar_du_device {
 	struct platform_device *cmms[RCAR_DU_MAX_CRTCS];
 	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
 	struct drm_bridge *lvds[RCAR_DU_MAX_LVDS];
+	struct drm_bridge *dsi[RCAR_DU_MAX_DSI];
 
 	struct {
 		struct drm_property *colorkey;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 60d6be78323b..ac93e08e8af4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -84,6 +84,10 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		if (output == RCAR_DU_OUTPUT_LVDS0 ||
 		    output == RCAR_DU_OUTPUT_LVDS1)
 			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
+
+		if (output == RCAR_DU_OUTPUT_DSI0 ||
+		    output == RCAR_DU_OUTPUT_DSI1)
+			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = bridge;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 62f7eb84ab01..1ec40e40fd08 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -542,6 +542,34 @@ static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *dsi)
 	return 0;
 }
 
+static void rcar_mipi_dsi_stop_video(struct rcar_mipi_dsi *dsi)
+{
+	u32 status;
+	int ret;
+
+	/* Disable transmission in video mode. */
+	rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_EN_VIDEO);
+
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				!(status & TXVMSR_ACT),
+				2000, 100000, false, dsi, TXVMSR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Failed to disable video transmission\n");
+		return;
+	}
+
+	/* Assert video FIFO clear. */
+	rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_VFCLR);
+
+	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
+				!(status & TXVMSR_VFRDY),
+				2000, 100000, false, dsi, TXVMSR);
+	if (ret < 0) {
+		dev_err(dsi->dev, "Failed to assert video FIFO clear\n");
+		return;
+	}
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge
  */
@@ -558,7 +586,22 @@ static int rcar_mipi_dsi_attach(struct drm_bridge *bridge,
 static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 					struct drm_bridge_state *old_bridge_state)
 {
-	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
+
+	rcar_mipi_dsi_start_video(dsi);
+}
+
+static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
+{
+	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
+
+	rcar_mipi_dsi_stop_video(dsi);
+}
+
+void rcar_mipi_dsi_atomic_early_enable(struct drm_bridge *bridge,
+				       struct drm_atomic_state *state)
+{
 	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
@@ -586,8 +629,6 @@ static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 	if (ret < 0)
 		goto err_dsi_start_hs;
 
-	rcar_mipi_dsi_start_video(dsi);
-
 	return;
 
 err_dsi_start_hs:
@@ -595,15 +636,27 @@ static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 err_dsi_startup:
 	rcar_mipi_dsi_clk_disable(dsi);
 }
+EXPORT_SYMBOL_GPL(rcar_mipi_dsi_atomic_early_enable);
 
-static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
-					 struct drm_bridge_state *old_bridge_state)
+void rcar_mipi_dsi_atomic_late_disable(struct drm_bridge *bridge)
 {
 	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 
+	rcar_mipi_dsi_clr(dsi, VCLKEN, VCLKEN_CKEN);
+
+	/* Disable DOT clock */
+	rcar_mipi_dsi_clr(dsi, VCLKSET, VCLKSET_CKEN);
+
+	/* CFGCLK disable */
+	rcar_mipi_dsi_clr(dsi, CFGCLKSET, CFGCLKSET_CKEN);
+
+	/* LPCLK disable */
+	rcar_mipi_dsi_clr(dsi, LPCLKSET, LPCLKSET_CKEN);
+
 	rcar_mipi_dsi_shutdown(dsi);
 	rcar_mipi_dsi_clk_disable(dsi);
 }
+EXPORT_SYMBOL_GPL(rcar_mipi_dsi_atomic_late_disable);
 
 static enum drm_mode_status
 rcar_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
new file mode 100644
index 000000000000..1764abf65a34
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * R-Car DSI Encoder
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ *
+ * Contact: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ */
+
+#ifndef __RCAR_MIPI_DSI_H__
+#define __RCAR_MIPI_DSI_H__
+
+struct drm_bridge;
+struct drm_atomic_state;
+
+#if IS_ENABLED(CONFIG_DRM_RCAR_MIPI_DSI)
+void rcar_mipi_dsi_atomic_early_enable(struct drm_bridge *bridge,
+				       struct drm_atomic_state *state);
+void rcar_mipi_dsi_atomic_late_disable(struct drm_bridge *bridge);
+#else
+static inline void
+rcar_mipi_dsi_atomic_early_enable(struct drm_bridge *bridge,
+				  struct drm_atomic_state *state)
+{
+}
+
+void rcar_mipi_dsi_atomic_late_disable(struct drm_bridge *bridge)
+{
+}
+#endif /* CONFIG_DRM_RCAR_MIPI_DSI */
+
+#endif /* __RCAR_MIPI_DSI_H__ */
-- 
2.34.1

