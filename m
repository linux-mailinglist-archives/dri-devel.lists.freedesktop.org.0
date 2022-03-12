Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8816C4D712D
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 22:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAA310E098;
	Sat, 12 Mar 2022 21:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 84F2510E098
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 21:54:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,177,1643641200"; d="scan'208";a="113308979"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 13 Mar 2022 06:54:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id C90764005E2B;
 Sun, 13 Mar 2022 06:54:30 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/7] drm: rcar-du: Add max_width and max_height to struct
 rcar_du_device_info
Date: Sat, 12 Mar 2022 21:54:13 +0000
Message-Id: <20220312215417.8023-4-biju.das.jz@bp.renesas.com>
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

There are some differences related to max frame size supported by different
R-Car/RZ-G family of SoC's

Max frame size supported by R-Car Gen1 & R-Car Gen2 is 4095x2047
Max frame size supported by R-Car Gen3 is 8190x8190
Max frame size supported by RZ/G2L is 1920x1080

Add max_width and max_height to struct rcar_du_device_info to support later
SoC without any code changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->V1:
 * No Change
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-13-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 36 +++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  4 +++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 17 +++++--------
 3 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 1bc7325aa356..4640c356a532 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -56,6 +56,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
@@ -79,6 +81,8 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
@@ -107,6 +111,8 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
@@ -137,6 +143,8 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -168,6 +176,8 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -196,6 +206,8 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 	},
 	.num_lvds = 2,
 	.num_rpf = 4,
+	.max_width = 8190,
+	.max_height = 8190,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -227,6 +239,8 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -249,6 +263,8 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 			.port = 1,
 		},
 	},
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7790_info = {
@@ -280,6 +296,8 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 	},
 	.num_lvds = 2,
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
@@ -306,6 +324,8 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7792_info = {
@@ -327,6 +347,8 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
@@ -351,6 +373,8 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 		},
 	},
 	.num_rpf = 4,
+	.max_width = 4095,
+	.max_height = 2047,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
@@ -385,6 +409,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(2) | BIT(1),
 };
 
@@ -416,6 +442,8 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -447,6 +475,8 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dpll_mask =  BIT(1),
 };
 
@@ -474,6 +504,8 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
@@ -502,6 +534,8 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 	},
 	.num_lvds = 2,
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -522,6 +556,8 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 		},
 	},
 	.num_rpf = 5,
+	.max_width = 8190,
+	.max_height = 8190,
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 68c5de59d18d..b0553b43363b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -70,6 +70,8 @@ struct rcar_du_output_routing {
  * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
  * @num_lvds: number of internal LVDS encoders
  * @num_rpf: max number of RPFs in VSP
+ * @max_width: max frame width
+ * @max_height: max frame height
  * @dpll_mask: bit mask of DU channels equipped with a DPLL
  * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
  * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
@@ -82,6 +84,8 @@ struct rcar_du_device_info {
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
 	unsigned int num_rpf;
+	unsigned int max_width;
+	unsigned int max_height;
 	unsigned int dpll_mask;
 	unsigned int dsi_clk_mask;
 	unsigned int lvds_clk_mask;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 190dbb7f15dd..5857705aac20 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -834,17 +834,12 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
 	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
 
-	if (rcdu->info->gen < 3) {
-		dev->mode_config.max_width = 4095;
-		dev->mode_config.max_height = 2047;
-	} else {
-		/*
-		 * The Gen3 DU uses the VSP1 for memory access, and is limited
-		 * to frame sizes of 8190x8190.
-		 */
-		dev->mode_config.max_width = 8190;
-		dev->mode_config.max_height = 8190;
-	}
+	/*
+	 * The Gen3 DU uses the VSP1 for memory access, and is limited
+	 * to frame sizes of 8190x8190.
+	 */
+	dev->mode_config.max_width = rcdu->info->max_width;
+	dev->mode_config.max_height = rcdu->info->max_height;
 
 	rcdu->num_crtcs = hweight8(rcdu->info->channels_mask);
 
-- 
2.17.1

