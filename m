Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3958B48CA2C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 18:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA98D10E725;
	Wed, 12 Jan 2022 17:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 497E210E725
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 17:46:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; d="scan'208";a="106824718"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9E92C4005E1F;
 Thu, 13 Jan 2022 02:46:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC 11/28] drm: rcar-du: Add num_rpf to struct rcar_du_device_info
Date: Wed, 12 Jan 2022 17:45:55 +0000
Message-Id: <20220112174612.10773-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
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

Number of RPF's VSP is different on R-Car and RZ/G2L
 R-Car Gen3 -> 5 RPF's
 R-Car Gen2 -> 4 RPF's
 RZ/G2L -> 2 RPF's

Add num_rpf to struct rcar_du_device_info to support later
SoC without any code changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 17 +++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c |  6 +-----
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 5a8131ef81d5..5ca7cd085794 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -56,6 +56,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
@@ -78,6 +79,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
@@ -105,6 +107,7 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 			.port = 2,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
@@ -134,6 +137,7 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -164,6 +168,7 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -191,6 +196,7 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 		},
 	},
 	.num_lvds = 2,
+	.num_rpf = 4,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -221,6 +227,7 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -273,6 +280,7 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 		},
 	},
 	.num_lvds = 2,
+	.num_rpf = 4,
 };
 
 /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
@@ -298,6 +306,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7792_info = {
@@ -318,6 +327,7 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
@@ -341,6 +351,7 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
@@ -374,6 +385,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(2) | BIT(1),
 };
 
@@ -404,6 +416,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -434,6 +447,7 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -460,6 +474,7 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
@@ -487,6 +502,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 		},
 	},
 	.num_lvds = 2,
+	.num_rpf = 5,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -506,6 +522,7 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 5,
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 101f42df86ea..9792a77590be 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -69,6 +69,7 @@ struct rcar_du_output_routing {
  * @channels_mask: bit mask of available DU channels
  * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
  * @num_lvds: number of internal LVDS encoders
+ * @num_rpf: max number of rpf's in vsp
  * @dpll_mask: bit mask of DU channels equipped with a DPLL
  * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
  * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
@@ -80,6 +81,7 @@ struct rcar_du_device_info {
 	unsigned int channels_mask;
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
+	unsigned int num_rpf;
 	unsigned int dpll_mask;
 	unsigned int dsi_clk_mask;
 	unsigned int lvds_clk_mask;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index b7fc5b069cbc..cf045a203aa5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -415,11 +415,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 	if (ret < 0)
 		return ret;
 
-	 /*
-	  * The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited to
-	  * 4 RPFs.
-	  */
-	num_planes = rcdu->info->gen >= 3 ? 5 : 4;
+	num_planes = rcdu->info->num_rpf;
 
 	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
 	if (!vsp->planes)
-- 
2.17.1

