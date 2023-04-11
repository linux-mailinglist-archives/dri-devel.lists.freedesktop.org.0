Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9166DD9D0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 13:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7C610E490;
	Tue, 11 Apr 2023 11:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3B6E10E496
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 11:43:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; d="scan'208";a="159045249"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 11 Apr 2023 20:43:53 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 936CA4000A93;
 Tue, 11 Apr 2023 20:43:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v7 14/17] drm: rcar-du: Add rcar_du_lib_mode_cfg_helper_get()
Date: Tue, 11 Apr 2023 12:42:32 +0100
Message-Id: <20230411114235.366042-15-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
References: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add rcar_du_lib_mode_cfg_helper_get() in RCar DU kms lib to get the
pointer to rcar_du_mode_config_helper, so that both rcar_du_atomic_
commit_tail() and rcar_du_mode_config_helper can be reused by
rcar_du_modeset_init() and rzg2l_du_modeset_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Rebased to drm-tip.
v1->v6:
 * Rebased on drm-misc-next and DU-next.
v1:
 * Created the lib suggested by Laurent.
Ref:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220316131100.30685-6-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 46 +-----------------
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 59 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  3 ++
 3 files changed, 63 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 74845d8bad9d..b0b40b1cc37d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -7,9 +7,7 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
-#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
@@ -61,52 +59,10 @@ static int rcar_du_atomic_check(struct drm_device *dev,
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
@@ -412,7 +368,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	dev->mode_config.min_height = 0;
 	dev->mode_config.normalize_zpos = true;
 	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
-	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
+	dev->mode_config.helper_private = rcar_du_lib_mode_cfg_helper_get();
 
 	if (rcdu->info->gen < 3) {
 		dev->mode_config.max_width = 4095;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index f092d8e4aa16..13d033009c9f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -7,6 +7,9 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -476,3 +479,59 @@ rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 
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
+rcar_du_lib_mode_cfg_helper_get(void)
+{
+	return &rcar_du_mode_config_helper;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index f264e0415d53..be36b98b2d5d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -42,4 +42,7 @@ struct drm_framebuffer *
 rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		      const struct drm_mode_fb_cmd2 *mode_cmd);
 
+const struct drm_mode_config_helper_funcs *
+rcar_du_lib_mode_cfg_helper_get(void);
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

