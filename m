Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F91C737D23
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E1C10E417;
	Wed, 21 Jun 2023 08:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D4110E3F9;
 Wed, 21 Jun 2023 08:10:57 +0000 (UTC)
Received: from uno.lan (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61B5C10FE;
 Wed, 21 Jun 2023 10:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687335021;
 bh=cUuBguMATEha6mgxhe66vUlSq0MV+gqW6ALG/cofuEQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YixKUSUeY7/pe0j50m+pyFA/LHYyJTTMmyHRsJPmKrCCvMbufpIxMH5lweFmUFvXn
 yc+beU3c5aWAXzph3JrHBKoUWHx5uXsThDEFFvFsILaae5QHFGvPc4xovTBgkbVa2D
 oOSlvOXjPQMcmvubpaxQwmBSpESZH3KOdX/3M7dw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC 6/9] drm: rcar-du: cmm: Refactor LUT configuration
Date: Wed, 21 Jun 2023 10:10:28 +0200
Message-Id: <20230621081031.7876-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
References: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
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
Cc: Victoria Brekenfeld <victoria@system76.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, mdaenzer@redhat.com,
 aleixpol@kde.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, tzimmermann@suse.de, sunpeng.li@amd.com,
 Sebastian Wick <sebastian.wick@redhat.com>, mripard@kernel.org,
 Melissa Wen <mwen@igalia.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Xinhui.Pan@amd.com,
 xaver.hugl@gmail.com, linux-renesas-soc@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

To prepare for CLU support, expend the CMM API exposed to the DU driver
to separate the LUT table pointer from the LUT update decision. This
will be required, as we will need to update the LUT and CLU
independently.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_cmm.c     | 60 ++++++++++++--------------
 drivers/gpu/drm/rcar-du/rcar_cmm.h     | 19 +++++---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 22 +++++++---
 3 files changed, 55 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
index e2a67dda4658..df768a9afb72 100644
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
+
+	if (rcmm->lut.enabled != enable) {
+		rcar_cmm_write(rcmm, CM2_LUT_CTRL,
+			       enable ? CM2_LUT_CTRL_LUT_EN : 0);
+		rcmm->lut.enabled = enable;
+	}
 
-	for (i = 0; i < CM2_LUT_SIZE; ++i) {
-		u32 entry = drm_color_lut_extract(drm_lut[i].red, 8) << 16
-			  | drm_color_lut_extract(drm_lut[i].green, 8) << 8
-			  | drm_color_lut_extract(drm_lut[i].blue, 8);
+	if (table) {
+		unsigned int i;
 
-		rcar_cmm_write(rcmm, CM2_LUT_TBL(i), entry);
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
index 628072acc98b..375a3b9c3db3 100644
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
index d6d29be6b4f4..a2d477dc5a51 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -537,17 +537,23 @@ static int rcar_du_cmm_check(struct drm_crtc *crtc,
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
@@ -794,7 +800,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * after the DU channel has been activated. Investigate the impact
 	 * of this restriction on the first displayed frame.
 	 */
-	rcar_du_cmm_setup(crtc);
+	rcar_du_cmm_setup(rcrtc, NULL, crtc->state);
 }
 
 static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -844,6 +850,8 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
+	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
+									 crtc);
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 
 	WARN_ON(!crtc->state->enable);
@@ -864,7 +872,7 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	/* If the active state changed, we let .atomic_enable handle CMM. */
 	if (crtc->state->color_mgmt_changed && !crtc->state->active_changed)
-		rcar_du_cmm_setup(crtc);
+		rcar_du_cmm_setup(rcrtc, old_state, crtc->state);
 
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_atomic_begin(rcrtc);
-- 
2.40.1

