Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC004D7130
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 22:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D30E10E0A2;
	Sat, 12 Mar 2022 21:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 19EA010E095
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 21:54:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,177,1643641200"; d="scan'208";a="113308987"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 13 Mar 2022 06:54:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6AC924005E2B;
 Sun, 13 Mar 2022 06:54:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/7] drm: rcar-du: Factorise rcar_du_{atomic_check,
 modeset_init}
Date: Sat, 12 Mar 2022 21:54:15 +0000
Message-Id: <20220312215417.8023-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220312215417.8023-1-biju.das.jz@bp.renesas.com>
References: <20220312215417.8023-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RZ/G2L SoC's does not have group/plane registers compared to RCar, hence it
needs a different CRTC implementation. Factorise rcar_du_{atomic_check,
modeset_init} by adding struct rcar_du_crtc_helper_funcs to struct
rcar_du_device_info, so that it can support later SoC without any code
changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v1:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h | 16 ++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c |  6 +++---
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index f6e234dafb72..2b2c0653b0fe 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -34,6 +34,12 @@
  * Device Information
  */
 
+static struct rcar_du_crtc_helper_funcs crtc_helper_funcs = {
+	.du_planes_init = rcar_du_planes_init,
+	.du_crtc_create = rcar_du_crtc_create,
+	.du_atomic_check_planes = rcar_du_atomic_check_planes,
+};
+
 static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 	.gen = 2,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
@@ -58,6 +64,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 	.num_rpf = 4,
 	.max_width = 4095,
 	.max_height = 2047,
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
@@ -83,6 +90,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 	.num_rpf = 4,
 	.max_width = 4095,
 	.max_height = 2047,
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
@@ -113,6 +121,7 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 	.num_rpf = 4,
 	.max_width = 4095,
 	.max_height = 2047,
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
@@ -146,6 +155,7 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 	.max_width = 8190,
 	.max_height = 8190,
 	.dpll_mask =  BIT(1),
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
@@ -179,6 +189,7 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 	.max_width = 8190,
 	.max_height = 8190,
 	.dpll_mask =  BIT(1),
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
@@ -209,6 +220,7 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 	.max_width = 8190,
 	.max_height = 8190,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
@@ -242,6 +254,7 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 	.max_width = 8190,
 	.max_height = 8190,
 	.dpll_mask =  BIT(1),
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7779_info = {
@@ -265,6 +278,7 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 	},
 	.max_width = 4095,
 	.max_height = 2047,
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7790_info = {
@@ -298,6 +312,7 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 	.num_rpf = 4,
 	.max_width = 4095,
 	.max_height = 2047,
+	.fns = &crtc_helper_funcs,
 };
 
 /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
@@ -326,6 +341,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 	.num_rpf = 4,
 	.max_width = 4095,
 	.max_height = 2047,
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7792_info = {
@@ -349,6 +365,7 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 	.num_rpf = 4,
 	.max_width = 4095,
 	.max_height = 2047,
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
@@ -375,6 +392,7 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 	.num_rpf = 4,
 	.max_width = 4095,
 	.max_height = 2047,
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
@@ -412,6 +430,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	.max_width = 8190,
 	.max_height = 8190,
 	.dpll_mask =  BIT(2) | BIT(1),
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7796_info = {
@@ -445,6 +464,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	.max_width = 8190,
 	.max_height = 8190,
 	.dpll_mask =  BIT(1),
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a77965_info = {
@@ -478,6 +498,7 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 	.max_width = 8190,
 	.max_height = 8190,
 	.dpll_mask =  BIT(1),
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a77970_info = {
@@ -506,6 +527,7 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 	.num_rpf = 5,
 	.max_width = 8190,
 	.max_height = 8190,
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
@@ -537,6 +559,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 	.max_width = 8190,
 	.max_height = 8190,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
@@ -559,6 +582,7 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 	.max_width = 8190,
 	.max_height = 8190,
 	.dsi_clk_mask =  BIT(1) | BIT(0),
+	.fns = &crtc_helper_funcs,
 };
 
 static const struct of_device_id rcar_du_of_table[] = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index b0553b43363b..164cd9854aaf 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -61,6 +61,20 @@ struct rcar_du_output_routing {
 	unsigned int port;
 };
 
+/*
+ * struct rcar_du_crtc_helper_funcs - CRTC helper functions
+ * @du_planes_init: pointer to du_plane_init function
+ * @du_crtc_create: pointer to du_crtc_create function
+ * @du_atomic_check_planes: pointer to du_atomic_check_planes function
+ */
+struct rcar_du_crtc_helper_funcs {
+	int (*du_planes_init)(struct rcar_du_group *rgrp);
+	int (*du_crtc_create)(struct rcar_du_group *rgrp, unsigned int swindex,
+			      unsigned int hwindex);
+	int (*du_atomic_check_planes)(struct drm_device *dev,
+				      struct drm_atomic_state *state);
+};
+
 /*
  * struct rcar_du_device_info - DU model-specific information
  * @gen: device generation (2 or 3)
@@ -75,6 +89,7 @@ struct rcar_du_output_routing {
  * @dpll_mask: bit mask of DU channels equipped with a DPLL
  * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
  * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
+ * @fns: SoC specific CRTC helper functions
  */
 struct rcar_du_device_info {
 	unsigned int gen;
@@ -89,6 +104,7 @@ struct rcar_du_device_info {
 	unsigned int dpll_mask;
 	unsigned int dsi_clk_mask;
 	unsigned int lvds_clk_mask;
+	struct rcar_du_crtc_helper_funcs *fns;
 };
 
 #define RCAR_DU_MAX_CRTCS		4
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 5857705aac20..a74417510894 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -478,7 +478,7 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
 		return 0;
 
-	return rcar_du_atomic_check_planes(dev, state);
+	return rcdu->info->fns->du_atomic_check_planes(dev, state);
 }
 
 static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
@@ -882,7 +882,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 				   : 0;
 
 		if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE)) {
-			ret = rcar_du_planes_init(rgrp);
+			ret = rcdu->info->fns->du_planes_init(rgrp);
 			if (ret < 0)
 				return ret;
 		}
@@ -910,7 +910,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 		rgrp = &rcdu->groups[hwindex / 2];
 
-		ret = rcar_du_crtc_create(rgrp, swindex++, hwindex);
+		ret = rcdu->info->fns->du_crtc_create(rgrp, swindex++, hwindex);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.17.1

