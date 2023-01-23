Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E49166780D5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EA410E4EC;
	Mon, 23 Jan 2023 16:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B17D10E1E4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 10:48:01 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6842710B;
 Mon, 23 Jan 2023 11:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674470879;
 bh=+JXekmAURtAs7Is3U4JBWPY+yYQzq5YGA/QwsCqwis8=;
 h=From:To:Cc:Subject:Date:From;
 b=BmiEcKOP3YlC3WuNRlkGAQmh+ktrHZQqFB9ddqjArliWHeBzAK19jR2mKD+BawO6I
 xRq2Uc5ejp9NPA242n8gBYVLuE3ApDOl+w7WFwKUS4bh/pOotBxUPWwtodWcIka12m
 QAvxpmrllRzFWLlPRfjBgnBcrBk2HVM7ePQaw4m8=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/7] drm: rcar-du: Misc patches
Date: Mon, 23 Jan 2023 12:47:35 +0200
Message-Id: <20230123104742.227460-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Jan 2023 16:04:33 +0000
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Hi,

Diff to v2:
- Depend on PM in Kconfig to ensure runtime PM works
- Fix access to DEFR7 in "drm: rcar-du: Stop accessing non-existant
  registers on gen4"
- Use pm_runtime_put_sync() instead of pm_runtime_put()
- Add missing line feed
- Fix lvsd typo in commit message

 Tomi

Koji Matsuoka (1):
  drm: rcar-du: lvds: Fix stop sequence

Tomi Valkeinen (6):
  drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
  drm: rcar-du: lvds: Add runtime PM
  drm: rcar-du: lvds: Add reset control
  drm: rcar-du: Add quirk for H3 ES1.x pclk workaround
  drm: rcar-du: Fix setting a reserved bit in DPLLCR
  drm: rcar-du: Stop accessing non-existant registers on gen4

 drivers/gpu/drm/rcar-du/Kconfig         |  3 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 39 +++++++----
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 49 ++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 24 ++++---
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  8 +--
 drivers/gpu/drm/rcar-du/rcar_lvds.c     | 87 +++++++++++++++++++++++--
 7 files changed, 177 insertions(+), 35 deletions(-)

Interdiff against v2:
diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 151e400b996d..742f6f2c8de8 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -39,6 +39,7 @@ config DRM_RCAR_USE_LVDS
 config DRM_RCAR_LVDS
 	def_tristate DRM_RCAR_DU
 	depends on DRM_RCAR_USE_LVDS
+	depends on PM
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select OF_FLATTREE
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index c2209d427bb7..152602236377 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -151,14 +151,16 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	if (rcdu->info->gen < 4)
 		rcar_du_group_setup_pins(rgrp);
 
-	/*
-	 * TODO: Handle routing of the DU output to CMM dynamically, as we
-	 * should bypass CMM completely when no color management feature is
-	 * used.
-	 */
-	defr7 |= (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
-		 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
-	rcar_du_group_write(rgrp, DEFR7, defr7);
+	if (rcdu->info->gen < 4) {
+		/*
+		 * TODO: Handle routing of the DU output to CMM dynamically, as
+		 * we should bypass CMM completely when no color management
+		 * feature is used.
+		 */
+		defr7 |= (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
+			 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
+		rcar_du_group_write(rgrp, DEFR7, defr7);
+	}
 
 	if (rcdu->info->gen >= 2) {
 		if (rcdu->info->gen < 4)
@@ -194,13 +196,10 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
  */
 int rcar_du_group_get(struct rcar_du_group *rgrp)
 {
-	struct rcar_du_device *rcdu = rgrp->dev;
-
 	if (rgrp->use_count)
 		goto done;
 
-	if (rcdu->info->gen < 4)
-		rcar_du_group_setup(rgrp);
+	rcar_du_group_setup(rgrp);
 
 done:
 	rgrp->use_count++;
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 8fa5f7400179..8cd86a3d65a5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -345,7 +345,7 @@ void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
 
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
-	pm_runtime_put(lvds->dev);
+	pm_runtime_put_sync(lvds->dev);
 }
 EXPORT_SYMBOL_GPL(rcar_lvds_pclk_disable);
 
@@ -580,7 +580,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 		lvds->companion->funcs->atomic_disable(lvds->companion,
 						       old_bridge_state);
 
-	pm_runtime_put(lvds->dev);
+	pm_runtime_put_sync(lvds->dev);
 }
 
 static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
@@ -877,6 +877,7 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	if (IS_ERR(lvds->rstc))
 		return dev_err_probe(&pdev->dev, PTR_ERR(lvds->rstc),
 				     "failed to get cpg reset\n");
+
 	pm_runtime_enable(&pdev->dev);
 
 	drm_bridge_add(&lvds->bridge);
-- 
2.34.1

