Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2CA4D712B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 22:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C20D10E093;
	Sat, 12 Mar 2022 21:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E72610E092
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 21:54:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,177,1643641200"; d="scan'208";a="113308973"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 13 Mar 2022 06:54:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id CEC8D4007521;
 Sun, 13 Mar 2022 06:54:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/7] drm: rcar-du: Add num_rpf to struct rcar_du_device_info
Date: Sat, 12 Mar 2022 21:54:12 +0000
Message-Id: <20220312215417.8023-3-biju.das.jz@bp.renesas.com>
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

Number of RPF's VSP is different on R-Car and RZ/G2L
 R-Car Gen3 -> 5 RPFs
 R-Car Gen2 -> 4 RPFs
 RZ/G2L -> 2 RPFs

Add num_rpf to struct rcar_du_device_info to support later
SoC without any code changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v1:
 * Fixed the comment for num_rpf s/rpf's/RPFs/ and s/vsp/VSP/
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-12-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 17 +++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c |  6 +-----
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 957ea97541d5..1bc7325aa356 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -55,6 +55,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
@@ -77,6 +78,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
@@ -104,6 +106,7 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 			.port = 2,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
@@ -133,6 +136,7 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -163,6 +167,7 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -190,6 +195,7 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 		},
 	},
 	.num_lvds = 2,
+	.num_rpf = 4,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -220,6 +226,7 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -272,6 +279,7 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 		},
 	},
 	.num_lvds = 2,
+	.num_rpf = 4,
 };
 
 /* M2-W (r8a7791) and M2-N (r8a7793) are identical */
@@ -297,6 +305,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7792_info = {
@@ -317,6 +326,7 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7794_info = {
@@ -340,6 +350,7 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 4,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7795_info = {
@@ -373,6 +384,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(2) | BIT(1),
 };
 
@@ -403,6 +415,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -433,6 +446,7 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 	.dpll_mask =  BIT(1),
 };
 
@@ -459,6 +473,7 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 		},
 	},
 	.num_lvds = 1,
+	.num_rpf = 5,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
@@ -486,6 +501,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 		},
 	},
 	.num_lvds = 2,
+	.num_rpf = 5,
 	.lvds_clk_mask =  BIT(1) | BIT(0),
 };
 
@@ -505,6 +521,7 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 			.port = 1,
 		},
 	},
+	.num_rpf = 5,
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 101f42df86ea..68c5de59d18d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -69,6 +69,7 @@ struct rcar_du_output_routing {
  * @channels_mask: bit mask of available DU channels
  * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
  * @num_lvds: number of internal LVDS encoders
+ * @num_rpf: max number of RPFs in VSP
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

