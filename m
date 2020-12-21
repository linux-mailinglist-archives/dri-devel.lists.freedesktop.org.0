Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB12DF78F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 02:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D776E422;
	Mon, 21 Dec 2020 01:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBD66E422
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 01:57:44 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11629FCF;
 Mon, 21 Dec 2020 02:57:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608515862;
 bh=4C9omZCWTzgtsEilyyAY4ckA+LRF1CMS8OwFvq3KbJc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fxVX5g15fLVqAPZ8Kz6uzQbbqr9QRFkQRITprIoHwA1EZYT/ejXAUZh0XReXzNxFj
 E/XeKfAAtV2n4XxkM8/dhmmDVBBlqSUpp3TLVprUcuBgIFCyibulHMq4sbmNdWHgKu
 iXlNxJtkkpsqk8Y5EDTWX4qHwsrlALTDjnwccQeQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm: rcar-du: cmm: Refactor LUT configuration
Date: Mon, 21 Dec 2020 03:57:27 +0200
Message-Id: <20201221015730.28333-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To prepare for CLU support, expend the CMM API exposed to the DU driver
to separate the LUT table pointer from the LUT update decision. This
will be required, as we will need to update the LUT and CLU
independently.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_cmm.c     | 60 ++++++++++++--------------
 drivers/gpu/drm/rcar-du/rcar_cmm.h     | 19 +++++---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 22 +++++++---
 3 files changed, 55 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
index 382d53f8a22e..ccc8c8b03bac 100644
--- a/drivers/gpu/drm/rcar-du/rcar_cmm.c
+++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
@@ -42,23 +42,33 @@ static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32 data)
 	iowrite32(data, rcmm->base + reg);
 }
 
-/*
- * rcar_cmm_lut_write() - Scale the DRM LUT table entries to hardware precision
- *			  and write to the CMM registers
- * @rcmm: Pointer to the CMM device
- * @drm_lut: Pointer to the DRM LUT table
- */
-static void rcar_cmm_lut_write(struct rcar_cmm *rcmm,
-			       const struct drm_color_lut *drm_lut)
+static void rcar_cmm_lut_configure(struct rcar_cmm *rcmm,
+				   const struct drm_color_lut *table)
 {
-	unsigned int i;
+	bool enable = !!table;
 
-	for (i = 0; i < CM2_LUT_SIZE; ++i) {
-		u32 entry = drm_color_lut_extract(drm_lut[i].red, 8) << 16
-			  | drm_color_lut_extract(drm_lut[i].green, 8) << 8
-			  | drm_color_lut_extract(drm_lut[i].blue, 8);
+	if (rcmm->lut.enabled != enable) {
+		rcar_cmm_write(rcmm, CM2_LUT_CTRL,
+			       enable ? CM2_LUT_CTRL_LUT_EN : 0);
+		rcmm->lut.enabled = enable;
+	}
 
-		rcar_cmm_write(rcmm, CM2_LUT_TBL(i), entry);
+	if (table) {
+		unsigned int i;
+
+		/*
+		 * Scale the DRM LUT table entries to the hardware precision
+		 * and program it.
+		 */
+		for (i = 0; i < CM2_LUT_SIZE; ++i) {
+			const struct drm_color_lut *lut = &table[i];
+
+			u32 entry = drm_color_lut_extract(lut->red, 8) << 16
+				  | drm_color_lut_extract(lut->green, 8) << 8
+				  | drm_color_lut_extract(lut->blue, 8);
+
+			rcar_cmm_write(rcmm, CM2_LUT_TBL(i), entry);
+		}
 	}
 }
 
@@ -83,23 +93,8 @@ int rcar_cmm_setup(struct platform_device *pdev,
 {
 	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
 
-	/* Disable LUT if no table is provided. */
-	if (!config->lut.table) {
-		if (rcmm->lut.enabled) {
-			rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
-			rcmm->lut.enabled = false;
-		}
-
-		return 0;
-	}
-
-	/* Enable LUT and program the new gamma table values. */
-	if (!rcmm->lut.enabled) {
-		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_LUT_EN);
-		rcmm->lut.enabled = true;
-	}
-
-	rcar_cmm_lut_write(rcmm, config->lut.table);
+	if (config->lut.update)
+		rcar_cmm_lut_configure(rcmm, config->lut.table);
 
 	return 0;
 }
@@ -144,8 +139,7 @@ void rcar_cmm_disable(struct platform_device *pdev)
 {
 	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
 
-	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
-	rcmm->lut.enabled = false;
+	rcar_cmm_lut_configure(rcmm, NULL);
 
 	pm_runtime_put(&pdev->dev);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/rcar-du/rcar_cmm.h
index b5f7ec6db04a..f4b16535ec16 100644
--- a/drivers/gpu/drm/rcar-du/rcar_cmm.h
+++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
@@ -13,16 +13,23 @@
 struct drm_color_lut;
 struct platform_device;
 
+/**
+ * struct rcar_cmm_table_config - CMM LUT configuration
+ * @update: When true, update the LUT configuration.
+ * @table: Table data. The LUT is enabled if non-NULL, and disabled
+ *	otherwise. The value is ignored if @update is false.
+ */
+struct rcar_cmm_table_config {
+	bool update;
+	struct drm_color_lut *table;
+};
+
 /**
  * struct rcar_cmm_config - CMM configuration
- *
- * @lut:	1D-LUT configuration
- * @lut.table:	1D-LUT table entries. Disable LUT operations when NULL
+ * @lut: 1D-LUT configuration
  */
 struct rcar_cmm_config {
-	struct {
-		struct drm_color_lut *table;
-	} lut;
+	struct rcar_cmm_table_config lut;
 };
 
 #if IS_ENABLED(CONFIG_DRM_RCAR_CMM)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 9a099c0fe1d4..426b1870b3cb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -500,17 +500,23 @@ static int rcar_du_cmm_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static void rcar_du_cmm_setup(struct drm_crtc *crtc)
+static void rcar_du_cmm_setup(struct rcar_du_crtc *rcrtc,
+			      const struct drm_crtc_state *old_state,
+			      const struct drm_crtc_state *new_state)
 {
-	struct drm_property_blob *drm_lut = crtc->state->gamma_lut;
-	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 	struct rcar_cmm_config cmm_config = {};
 
 	if (!rcrtc->cmm)
 		return;
 
-	if (drm_lut)
-		cmm_config.lut.table = (struct drm_color_lut *)drm_lut->data;
+	if (!old_state ||
+	    !old_state->gamma_lut != !new_state->gamma_lut ||
+	    (old_state->gamma_lut && new_state->gamma_lut &&
+	     old_state->gamma_lut->base.id != new_state->gamma_lut->base.id)) {
+		cmm_config.lut.update = true;
+		cmm_config.lut.table = new_state->gamma_lut
+				     ? new_state->gamma_lut->data : NULL;
+	}
 
 	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
 }
@@ -744,7 +750,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * after the DU channel has been activated. Investigate the impact
 	 * of this restriction on the first displayed frame.
 	 */
-	rcar_du_cmm_setup(crtc);
+	rcar_du_cmm_setup(rcrtc, NULL, crtc->state);
 }
 
 static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -781,6 +787,8 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
+	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
+									 crtc);
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 
 	WARN_ON(!crtc->state->enable);
@@ -801,7 +809,7 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	/* If the active state changed, we let .atomic_enable handle CMM. */
 	if (crtc->state->color_mgmt_changed && !crtc->state->active_changed)
-		rcar_du_cmm_setup(crtc);
+		rcar_du_cmm_setup(rcrtc, old_state, crtc->state);
 
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_atomic_begin(rcrtc);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
