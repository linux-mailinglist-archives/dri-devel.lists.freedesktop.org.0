Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D842B582A63
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 18:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10001ADBD6;
	Wed, 27 Jul 2022 16:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61C9F9094B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 16:08:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,195,1654527600"; d="scan'208";a="127555152"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 28 Jul 2022 01:08:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.195])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 655C94018932;
 Thu, 28 Jul 2022 01:08:17 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 05/10] drm: rcar-du: Add rcar_du_lib_mode_cfg_helper_fns()
Date: Wed, 27 Jul 2022 17:07:48 +0100
Message-Id: <20220727160753.1774761-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
References: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
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

Add rcar_du_lib_mode_cfg_helper_fns() in RCar DU kms lib to get the
pointer to rcar_du_mode_config_helper, so that both rcar_du_atomic_
commit_tail() and rcar_du_mode_config_helper can be reused by
rcar_du_modeset_init() and rzg2l_du_modeset_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 44 +-----------------
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 56 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  3 ++
 3 files changed, 60 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 9d65a7d6d96e..ed8d14701178 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -64,52 +64,10 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 	return rcar_du_atomic_check_planes(dev, state);
 }
 
-static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
-{
-	struct drm_device *dev = old_state->dev;
-	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
-	struct drm_crtc_state *crtc_state;
-	struct drm_crtc *crtc;
-	unsigned int i;
-
-	/*
-	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
-	 * when starting the CRTCs.
-	 */
-	rcdu->dpad1_source = -1;
-
-	for_each_new_crtc_in_state(old_state, crtc, crtc_state, i) {
-		struct rcar_du_crtc_state *rcrtc_state =
-			to_rcar_crtc_state(crtc_state);
-		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
-
-		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD0))
-			rcdu->dpad0_source = rcrtc->index;
-
-		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD1))
-			rcdu->dpad1_source = rcrtc->index;
-	}
-
-	/* Apply the atomic update. */
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
-	drm_atomic_helper_commit_planes(dev, old_state,
-					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
-
-	drm_atomic_helper_commit_hw_done(old_state);
-	drm_atomic_helper_wait_for_flip_done(dev, old_state);
-
-	drm_atomic_helper_cleanup_planes(dev, old_state);
-}
-
 /* -----------------------------------------------------------------------------
  * Initialization
  */
 
-static const struct drm_mode_config_helper_funcs rcar_du_mode_config_helper = {
-	.atomic_commit_tail = rcar_du_atomic_commit_tail,
-};
-
 static const struct drm_mode_config_funcs rcar_du_mode_config_funcs = {
 	.fb_create = rcar_du_fb_create,
 	.atomic_check = rcar_du_atomic_check,
@@ -415,7 +373,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	dev->mode_config.min_height = 0;
 	dev->mode_config.normalize_zpos = true;
 	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
-	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
+	dev->mode_config.helper_private = rcar_du_lib_mode_cfg_helper_fns();
 
 	if (rcdu->info->gen < 3) {
 		dev->mode_config.max_width = 4095;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index d8f778a7b6db..a1027436cfe3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -461,3 +461,59 @@ rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 
 	return drm_gem_fb_create(dev, file_priv, mode_cmd);
 }
+
+/* -----------------------------------------------------------------------------
+ * Atomic Check and Update
+ */
+
+static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
+{
+	struct drm_device *dev = old_state->dev;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	/*
+	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
+	 * when starting the CRTCs.
+	 */
+	rcdu->dpad1_source = -1;
+
+	for_each_new_crtc_in_state(old_state, crtc, crtc_state, i) {
+		struct rcar_du_crtc_state *rcrtc_state =
+			to_rcar_crtc_state(crtc_state);
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD0))
+			rcdu->dpad0_source = rcrtc->index;
+
+		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD1))
+			rcdu->dpad1_source = rcrtc->index;
+	}
+
+	/* Apply the atomic update. */
+	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	drm_atomic_helper_commit_planes(dev, old_state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+
+	drm_atomic_helper_commit_hw_done(old_state);
+	drm_atomic_helper_wait_for_flip_done(dev, old_state);
+
+	drm_atomic_helper_cleanup_planes(dev, old_state);
+}
+
+/* -----------------------------------------------------------------------------
+ * Initialization
+ */
+
+static const struct drm_mode_config_helper_funcs rcar_du_mode_config_helper = {
+	.atomic_commit_tail = rcar_du_atomic_commit_tail,
+};
+
+const struct drm_mode_config_helper_funcs *
+rcar_du_lib_mode_cfg_helper_fns(void)
+{
+	return &rcar_du_mode_config_helper;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index 160928dc68b8..8a689ac6c83f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -43,4 +43,7 @@ struct drm_framebuffer *
 rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		      const struct drm_mode_fb_cmd2 *mode_cmd);
 
+const struct drm_mode_config_helper_funcs *
+rcar_du_lib_mode_cfg_helper_fns(void);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

