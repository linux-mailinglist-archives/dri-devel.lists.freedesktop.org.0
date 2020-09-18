Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D42270BFB
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A1B6E1B5;
	Sat, 19 Sep 2020 08:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 18 Sep 2020 11:13:27 UTC
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6589D6ECD3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 11:13:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,274,1596466800"; d="scan'208";a="57634572"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 18 Sep 2020 20:08:24 +0900
Received: from localhost.localdomain (unknown [172.29.53.56])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 15BF540061BB;
 Fri, 18 Sep 2020 20:08:20 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: rcar-du: Fix LVDS dual link mode kernel crash
Date: Fri, 18 Sep 2020 12:08:18 +0100
Message-Id: <20200918110818.11303-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel crash is observed when dual lvds link mode is activated
along with HDMI. For this use case DU0 drives dual lvds output
and DU1 drives hdmi output, but dot clock for DU1 is generated
from lvds1.

[  585.890230] Unable to handle kernel paging request at virtual address ffffffffffffff18
[  585.898534] Mem abort info:
[  586.065713] x1 : 000000000839b680 x0 : ffffffffffffff20
[  586.071038] Call trace:
[  586.073490]  rcar_lvds_clk_enable+0x14/0xd0
[  586.077682]  rcar_du_crtc_atomic_enable+0xe4/0xe8
[  586.082403]  drm_atomic_helper_commit_modeset_enables+0x1f0/0x240
[  586.088508]  rcar_du_atomic_commit_tail+0xac/0xd8
[  586.093224]  commit_tail+0x9c/0x168
[  586.096720]  drm_atomic_helper_commit+0x180/0x198
[  586.101435]  drm_atomic_commit+0x48/0x58
[  586.105370]  drm_client_modeset_commit_atomic+0x250/0x2b0
[  586.110780]  drm_client_modeset_commit_locked+0x54/0x1e8
[  586.116102]  drm_client_modeset_commit+0x2c/0x50
[  586.120733]  __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0x120
[  586.127013]  drm_fb_helper_set_par+0x38/0x70
[  586.131291]  drm_fb_helper_hotplug_event.part.22+0xc4/0xd8
[  586.136789]  drm_fbdev_client_hotplug+0xcc/0x1d8
[  586.141415]  drm_client_dev_hotplug+0x7c/0xc0
[  586.145781]  drm_kms_helper_hotplug_event+0x30/0x40
[  586.150670]  tda998x_detect_work+0x14/0x28
[  586.154781]  process_one_work+0x2a8/0x730

Fixes: a6cc417d3eee ("drm: rcar-du: Turn LVDS clock output on/off for DPAD0
output on D3/E3")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 14 ++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c    |  6 ++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index fe86a3e67757..2440df786b02 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -729,11 +729,16 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
 		struct rcar_du_encoder *encoder =
 			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
+		struct rcar_du_encoder *enc_dual_link =
+			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0];
 		const struct drm_display_mode *mode =
 			&crtc->state->adjusted_mode;
 		struct drm_bridge *bridge;
 
-		bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
+		bridge = drm_bridge_chain_get_first_bridge(&enc_dual_link->base);
+		if (!rcar_lvds_dual_link(bridge))
+			bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
+
 		rcar_lvds_clk_enable(bridge, mode->clock * 1000);
 	}
 
@@ -761,13 +766,18 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
 		struct rcar_du_encoder *encoder =
 			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
+		struct rcar_du_encoder *enc_dual_link =
+			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0];
 		struct drm_bridge *bridge;
 
 		/*
 		 * Disable the LVDS clock output, see
 		 * rcar_du_crtc_atomic_enable().
 		 */
-		bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
+		bridge = drm_bridge_chain_get_first_bridge(&enc_dual_link->base);
+		if (!rcar_lvds_dual_link(bridge))
+			bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
+
 		rcar_lvds_clk_disable(bridge);
 	}
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index ab0d49618cf9..588f2a16b8a5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -373,6 +373,9 @@ int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq)
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 	int ret;
 
+	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
+		lvds = bridge_to_rcar_lvds(lvds->companion);
+
 	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
 		return -ENODEV;
 
@@ -392,6 +395,9 @@ void rcar_lvds_clk_disable(struct drm_bridge *bridge)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
+	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
+		lvds = bridge_to_rcar_lvds(lvds->companion);
+
 	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
 		return;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
