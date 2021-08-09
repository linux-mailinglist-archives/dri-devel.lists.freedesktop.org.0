Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 759793E3DAA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9A6899D4;
	Mon,  9 Aug 2021 01:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FB68997E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:17 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E96B23897;
 Mon,  9 Aug 2021 03:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472916;
 bh=37U/NqmW/gA6HttG+JiwJcwYidGDobdcLNWx3AdK8gM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MSWkC3nDJwb71tzxw6h4zRwC5e1j78Flyrg+COQpJ5ucibf2UYMEycUZ7XZPFkyYN
 Ls4nO+eLsgkMyCgd/7pZ1LkwAlUZOa8n7IMGszYuReGUHP5HXKEEs2vqqyHVI3takS
 yeIjnimFXjtWQz/1cmCon1DSDfS0ahgI60Q+dIY8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 28/36] drm: xlnx: zynqmp_dpsub: Move all DRM init and cleanup
 to zynqmp_kms.c
Date: Mon,  9 Aug 2021 04:34:49 +0300
Message-Id: <20210809013457.11266-29-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Continue the isolation of DRM/KMS code by moving all DRM init and
cleanup from zynqmp_dpsub.c to zynqmp_kms.c.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 120 +-------------------------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |   5 --
 drivers/gpu/drm/xlnx/zynqmp_kms.c   | 126 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xlnx/zynqmp_kms.h   |   5 +-
 4 files changed, 130 insertions(+), 126 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index e98e7e3b37d7..75209272ccb2 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -18,125 +18,15 @@
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_bridge_connector.h>
-#include <drm/drm_device.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
-#include <drm/drm_fourcc.h>
-#include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_mode_config.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
+#include <drm/drm_modeset_helper.h>
 
 #include "zynqmp_disp.h"
 #include "zynqmp_dp.h"
 #include "zynqmp_dpsub.h"
 #include "zynqmp_kms.h"
 
-/* -----------------------------------------------------------------------------
- * Dumb Buffer & Framebuffer Allocation
- */
-
-static int zynqmp_dpsub_dumb_create(struct drm_file *file_priv,
-				    struct drm_device *drm,
-				    struct drm_mode_create_dumb *args)
-{
-	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(drm);
-	unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-
-	/* Enforce the alignment constraints of the DMA engine. */
-	args->pitch = ALIGN(pitch, dpsub->dma_align);
-
-	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
-}
-
-static struct drm_framebuffer *
-zynqmp_dpsub_fb_create(struct drm_device *drm, struct drm_file *file_priv,
-		       const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(drm);
-	struct drm_mode_fb_cmd2 cmd = *mode_cmd;
-	unsigned int i;
-
-	/* Enforce the alignment constraints of the DMA engine. */
-	for (i = 0; i < ARRAY_SIZE(cmd.pitches); ++i)
-		cmd.pitches[i] = ALIGN(cmd.pitches[i], dpsub->dma_align);
-
-	return drm_gem_fb_create(drm, file_priv, &cmd);
-}
-
-static const struct drm_mode_config_funcs zynqmp_dpsub_mode_config_funcs = {
-	.fb_create		= zynqmp_dpsub_fb_create,
-	.atomic_check		= drm_atomic_helper_check,
-	.atomic_commit		= drm_atomic_helper_commit,
-};
-
-/* -----------------------------------------------------------------------------
- * DRM/KMS Driver
- */
-
-DEFINE_DRM_GEM_CMA_FOPS(zynqmp_dpsub_drm_fops);
-
-static const struct drm_driver zynqmp_dpsub_drm_driver = {
-	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
-					  DRIVER_ATOMIC,
-
-	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_create),
-
-	.fops				= &zynqmp_dpsub_drm_fops,
-
-	.name				= "zynqmp-dpsub",
-	.desc				= "Xilinx DisplayPort Subsystem Driver",
-	.date				= "20130509",
-	.major				= 1,
-	.minor				= 0,
-};
-
-static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
-{
-	struct drm_device *drm = &dpsub->drm;
-	int ret;
-
-	/* Initialize mode config, vblank and the KMS poll helper. */
-	ret = drmm_mode_config_init(drm);
-	if (ret < 0)
-		return ret;
-
-	drm->mode_config.funcs = &zynqmp_dpsub_mode_config_funcs;
-	drm->mode_config.min_width = 0;
-	drm->mode_config.min_height = 0;
-	drm->mode_config.max_width = ZYNQMP_DISP_MAX_WIDTH;
-	drm->mode_config.max_height = ZYNQMP_DISP_MAX_HEIGHT;
-
-	ret = drm_vblank_init(drm, 1);
-	if (ret)
-		return ret;
-
-	drm_kms_helper_poll_init(drm);
-
-	ret = zynqmp_dpsub_kms_init(dpsub);
-	if (ret < 0)
-		goto err_poll_fini;
-
-	/* Reset all components and register the DRM device. */
-	drm_mode_config_reset(drm);
-
-	ret = drm_dev_register(drm, 0);
-	if (ret < 0)
-		goto err_poll_fini;
-
-	/* Initialize fbdev generic emulation. */
-	drm_fbdev_generic_setup(drm, 24);
-
-	return 0;
-
-err_poll_fini:
-	drm_kms_helper_poll_fini(drm);
-	return ret;
-}
-
 /* -----------------------------------------------------------------------------
  * Power Management
  */
@@ -319,14 +209,8 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 static int zynqmp_dpsub_remove(struct platform_device *pdev)
 {
 	struct zynqmp_dpsub *dpsub = platform_get_drvdata(pdev);
-	struct drm_device *drm = &dpsub->drm;
 
-	if (dpsub->connector)
-		drm_bridge_connector_disable_hpd(dpsub->connector);
-
-	drm_dev_unregister(drm);
-	drm_atomic_helper_shutdown(drm);
-	drm_kms_helper_poll_fini(drm);
+	zynqmp_dpsub_drm_cleanup(dpsub);
 
 	zynqmp_disp_remove(dpsub);
 	zynqmp_dp_remove(dpsub);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index cfd4a2a5cfae..1778092e0829 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -74,11 +74,6 @@ struct zynqmp_dpsub {
 	unsigned int dma_align;
 };
 
-static inline struct zynqmp_dpsub *to_zynqmp_dpsub(struct drm_device *drm)
-{
-	return container_of(drm, struct zynqmp_dpsub, drm);
-}
-
 bool zynqmp_dpsub_audio_enabled(struct zynqmp_dpsub *dpsub);
 unsigned int zynqmp_dpsub_get_audio_clk_rate(struct zynqmp_dpsub *dpsub);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 51903bc1de2b..7b6af07baad4 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -15,12 +15,19 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_mode_config.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -34,6 +41,11 @@
 #include "zynqmp_dpsub.h"
 #include "zynqmp_kms.h"
 
+static inline struct zynqmp_dpsub *to_zynqmp_dpsub(struct drm_device *drm)
+{
+	return container_of(drm, struct zynqmp_dpsub, drm);
+}
+
 /* -----------------------------------------------------------------------------
  * DRM Planes
  */
@@ -338,10 +350,65 @@ void zynqmp_dpsub_handle_vblank(struct zynqmp_dpsub *dpsub)
 }
 
 /* -----------------------------------------------------------------------------
- * Initialization
+ * Dumb Buffer & Framebuffer Allocation
  */
 
-int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
+static int zynqmp_dpsub_dumb_create(struct drm_file *file_priv,
+				    struct drm_device *drm,
+				    struct drm_mode_create_dumb *args)
+{
+	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(drm);
+	unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+
+	/* Enforce the alignment constraints of the DMA engine. */
+	args->pitch = ALIGN(pitch, dpsub->dma_align);
+
+	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
+}
+
+static struct drm_framebuffer *
+zynqmp_dpsub_fb_create(struct drm_device *drm, struct drm_file *file_priv,
+		       const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(drm);
+	struct drm_mode_fb_cmd2 cmd = *mode_cmd;
+	unsigned int i;
+
+	/* Enforce the alignment constraints of the DMA engine. */
+	for (i = 0; i < ARRAY_SIZE(cmd.pitches); ++i)
+		cmd.pitches[i] = ALIGN(cmd.pitches[i], dpsub->dma_align);
+
+	return drm_gem_fb_create(drm, file_priv, &cmd);
+}
+
+static const struct drm_mode_config_funcs zynqmp_dpsub_mode_config_funcs = {
+	.fb_create		= zynqmp_dpsub_fb_create,
+	.atomic_check		= drm_atomic_helper_check,
+	.atomic_commit		= drm_atomic_helper_commit,
+};
+
+/* -----------------------------------------------------------------------------
+ * DRM/KMS Driver
+ */
+
+DEFINE_DRM_GEM_CMA_FOPS(zynqmp_dpsub_drm_fops);
+
+const struct drm_driver zynqmp_dpsub_drm_driver = {
+	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
+					  DRIVER_ATOMIC,
+
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_create),
+
+	.fops				= &zynqmp_dpsub_drm_fops,
+
+	.name				= "zynqmp-dpsub",
+	.desc				= "Xilinx DisplayPort Subsystem Driver",
+	.date				= "20130509",
+	.major				= 1,
+	.minor				= 0,
+};
+
+static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 {
 	struct drm_encoder *encoder = &dpsub->encoder;
 	struct drm_connector *connector;
@@ -387,3 +454,58 @@ int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 
 	return 0;
 }
+
+int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
+{
+	struct drm_device *drm = &dpsub->drm;
+	int ret;
+
+	/* Initialize mode config, vblank and the KMS poll helper. */
+	ret = drmm_mode_config_init(drm);
+	if (ret < 0)
+		return ret;
+
+	drm->mode_config.funcs = &zynqmp_dpsub_mode_config_funcs;
+	drm->mode_config.min_width = 0;
+	drm->mode_config.min_height = 0;
+	drm->mode_config.max_width = ZYNQMP_DISP_MAX_WIDTH;
+	drm->mode_config.max_height = ZYNQMP_DISP_MAX_HEIGHT;
+
+	ret = drm_vblank_init(drm, 1);
+	if (ret)
+		return ret;
+
+	drm_kms_helper_poll_init(drm);
+
+	ret = zynqmp_dpsub_kms_init(dpsub);
+	if (ret < 0)
+		goto err_poll_fini;
+
+	/* Reset all components and register the DRM device. */
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret < 0)
+		goto err_poll_fini;
+
+	/* Initialize fbdev generic emulation. */
+	drm_fbdev_generic_setup(drm, 24);
+
+	return 0;
+
+err_poll_fini:
+	drm_kms_helper_poll_fini(drm);
+	return ret;
+}
+
+void zynqmp_dpsub_drm_cleanup(struct zynqmp_dpsub *dpsub)
+{
+	struct drm_device *drm = &dpsub->drm;
+
+	if (dpsub->connector)
+		drm_bridge_connector_disable_hpd(dpsub->connector);
+
+	drm_dev_unregister(drm);
+	drm_atomic_helper_shutdown(drm);
+	drm_kms_helper_poll_fini(drm);
+}
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.h b/drivers/gpu/drm/xlnx/zynqmp_kms.h
index a8934b1abb05..8074148fd429 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.h
@@ -14,8 +14,11 @@
 
 struct zynqmp_dpsub;
 
+extern const struct drm_driver zynqmp_dpsub_drm_driver;
+
 void zynqmp_dpsub_handle_vblank(struct zynqmp_dpsub *dpsub);
 
-int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub);
+int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub);
+void zynqmp_dpsub_drm_cleanup(struct zynqmp_dpsub *dpsub);
 
 #endif /* _ZYNQMP_KMS_H_ */
-- 
Regards,

Laurent Pinchart

