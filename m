Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D05459C022
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 15:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075D58A1F5;
	Mon, 22 Aug 2022 13:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4AA2BF64
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:05:32 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 698A36D4;
 Mon, 22 Aug 2022 15:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661173530;
 bh=7R8Hf0umbfWe0usPPFyjHCFuDnIfJ1jmMTIHW0D13hA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H6wWcBRloiWcBq+ReaFtz3AILcFv9nUIQyi39glZDQnvdoR5xmC7ut0pwIpZu+9JY
 Q1CaIB3ehTykB4CqJwVnEoJk8Heg8ANztOsTs/CT39z3HfLzh2lHUbV4HSWZYITDrp
 FCSVKIKwOkoNkbQwVwrDTpBsyl4nc0zAF+OFVpsM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] drm: rcar-du: lvds: Rename pclk enable/disable
 functions
Date: Mon, 22 Aug 2022 16:05:12 +0300
Message-Id: <20220822130513.119029-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
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

Rename LVDS pclk enable/disable functions to match what we use for DSI.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  4 ++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c    |  4 ++--
 drivers/gpu/drm/rcar-du/rcar_lvds.h    | 10 +++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 31e33270e6db..3619e1ddeb62 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -745,7 +745,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 		const struct drm_display_mode *mode =
 			&crtc->state->adjusted_mode;
 
-		rcar_lvds_clk_enable(bridge, mode->clock * 1000);
+		rcar_lvds_pclk_enable(bridge, mode->clock * 1000);
 	}
 
 	/*
@@ -790,7 +790,7 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 		 * Disable the LVDS clock output, see
 		 * rcar_du_crtc_atomic_enable().
 		 */
-		rcar_lvds_clk_disable(bridge);
+		rcar_lvds_pclk_disable(bridge);
 	}
 
 	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index d85aa4bc7f84..f438d7d858c7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -306,7 +306,7 @@ static void rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds, unsigned int freq)
  * Clock - D3/E3 only
  */
 
-int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq)
+int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 	int ret;
@@ -326,7 +326,7 @@ int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq)
 }
 EXPORT_SYMBOL_GPL(rcar_lvds_clk_enable);
 
-void rcar_lvds_clk_disable(struct drm_bridge *bridge)
+void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/rcar-du/rcar_lvds.h
index 3097bf749bec..bee7033b60d6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.h
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.h
@@ -13,17 +13,17 @@
 struct drm_bridge;
 
 #if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
-int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq);
-void rcar_lvds_clk_disable(struct drm_bridge *bridge);
+int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq);
+void rcar_lvds_pclk_disable(struct drm_bridge *bridge);
 bool rcar_lvds_dual_link(struct drm_bridge *bridge);
 bool rcar_lvds_is_connected(struct drm_bridge *bridge);
 #else
-static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
-				       unsigned long freq)
+static inline int rcar_lvds_pclk_enable(struct drm_bridge *bridge,
+					unsigned long freq)
 {
 	return -ENOSYS;
 }
-static inline void rcar_lvds_clk_disable(struct drm_bridge *bridge) { }
+static inline void rcar_lvds_pclk_disable(struct drm_bridge *bridge) { }
 static inline bool rcar_lvds_dual_link(struct drm_bridge *bridge)
 {
 	return false;
-- 
2.34.1

