Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7152DA1FC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 21:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CC66E169;
	Mon, 14 Dec 2020 20:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBFF6E160
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 20:52:23 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A7F796;
 Mon, 14 Dec 2020 21:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607979140;
 bh=nGIxzYLY21pksPOUf+bYXHmoQSLt0OohYTM+Xe+reHs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M33NS4BTPVMI+Cfg/s1RUx140KtND/nn4rjLdtUuh8HvsUT+0lLv1XKmAktEQkUuc
 KSmt+8yknU7NYY8HIW1BDKlWQC/eQK2o7eBlfBGVkUKYdL7ifeTBXJbDEZHjfdQ04s
 Xxp53F5Pm8wsGBquQv4EtLg693CkoxuXjzneNIic=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm: rcar-du: Embed drm_device in rcar_du_device
Date: Mon, 14 Dec 2020 22:52:05 +0200
Message-Id: <20201214205208.10248-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
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

Embedding drm_device in rcar_du_device allows usage of the DRM managed
API to allocate both structures in one go, simplifying error handling.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c      |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c       | 33 +++++++++------------
 drivers/gpu/drm/rcar-du/rcar_du_drv.h       |  5 ++--
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c   |  4 +--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c       |  4 +--
 drivers/gpu/drm/rcar-du/rcar_du_plane.c     |  6 ++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c       |  6 ++--
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c |  2 +-
 8 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index e23b9c7b4afe..9a099c0fe1d4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1251,7 +1251,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 	else
 		primary = &rgrp->planes[swindex % 2].plane;
 
-	ret = drm_crtc_init_with_planes(rcdu->ddev, crtc, primary, NULL,
+	ret = drm_crtc_init_with_planes(&rcdu->ddev, crtc, primary, NULL,
 					rcdu->info->gen <= 2 ?
 					&crtc_funcs_gen2 : &crtc_funcs_gen3,
 					NULL);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 1490ec182646..4ab99ac49891 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -18,10 +18,11 @@
 #include <linux/wait.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_drv.h>
 #include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
 #include "rcar_du_drv.h"
@@ -529,14 +530,14 @@ static int rcar_du_pm_suspend(struct device *dev)
 {
 	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
 
-	return drm_mode_config_helper_suspend(rcdu->ddev);
+	return drm_mode_config_helper_suspend(&rcdu->ddev);
 }
 
 static int rcar_du_pm_resume(struct device *dev)
 {
 	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
 
-	return drm_mode_config_helper_resume(rcdu->ddev);
+	return drm_mode_config_helper_resume(&rcdu->ddev);
 }
 #endif
 
@@ -551,7 +552,7 @@ static const struct dev_pm_ops rcar_du_pm_ops = {
 static int rcar_du_remove(struct platform_device *pdev)
 {
 	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
-	struct drm_device *ddev = rcdu->ddev;
+	struct drm_device *ddev = &rcdu->ddev;
 
 	drm_dev_unregister(ddev);
 
@@ -565,14 +566,14 @@ static int rcar_du_remove(struct platform_device *pdev)
 static int rcar_du_probe(struct platform_device *pdev)
 {
 	struct rcar_du_device *rcdu;
-	struct drm_device *ddev;
 	struct resource *mem;
 	int ret;
 
 	/* Allocate and initialize the R-Car device structure. */
-	rcdu = devm_kzalloc(&pdev->dev, sizeof(*rcdu), GFP_KERNEL);
-	if (rcdu == NULL)
-		return -ENOMEM;
+	rcdu = devm_drm_dev_alloc(&pdev->dev, &rcar_du_driver,
+				  struct rcar_du_device, ddev);
+	if (IS_ERR(rcdu))
+		return PTR_ERR(rcdu);
 
 	rcdu->dev = &pdev->dev;
 	rcdu->info = of_device_get_match_data(rcdu->dev);
@@ -586,12 +587,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 		return PTR_ERR(rcdu->mmio);
 
 	/* DRM/KMS objects */
-	ddev = drm_dev_alloc(&rcar_du_driver, &pdev->dev);
-	if (IS_ERR(ddev))
-		return PTR_ERR(ddev);
-
-	rcdu->ddev = ddev;
-	ddev->dev_private = rcdu;
+	rcdu->ddev.dev_private = rcdu;
 
 	ret = rcar_du_modeset_init(rcdu);
 	if (ret < 0) {
@@ -601,25 +597,24 @@ static int rcar_du_probe(struct platform_device *pdev)
 		goto error;
 	}
 
-	ddev->irq_enabled = 1;
+	rcdu->ddev.irq_enabled = 1;
 
 	/*
 	 * Register the DRM device with the core and the connectors with
 	 * sysfs.
 	 */
-	ret = drm_dev_register(ddev, 0);
+	ret = drm_dev_register(&rcdu->ddev, 0);
 	if (ret)
 		goto error;
 
 	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
 
-	drm_fbdev_generic_setup(ddev, 32);
+	drm_fbdev_generic_setup(&rcdu->ddev, 32);
 
 	return 0;
 
 error:
-	rcar_du_remove(pdev);
-
+	drm_kms_helper_poll_fini(&rcdu->ddev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 3597a179bfb7..0b1726fd7bdb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -13,6 +13,8 @@
 #include <linux/kernel.h>
 #include <linux/wait.h>
 
+#include <drm/drm_device.h>
+
 #include "rcar_cmm.h"
 #include "rcar_du_crtc.h"
 #include "rcar_du_group.h"
@@ -21,7 +23,6 @@
 struct clk;
 struct device;
 struct drm_bridge;
-struct drm_device;
 struct drm_property;
 struct rcar_du_device;
 
@@ -79,7 +80,7 @@ struct rcar_du_device {
 
 	void __iomem *mmio;
 
-	struct drm_device *ddev;
+	struct drm_device ddev;
 
 	struct rcar_du_crtc crtcs[RCAR_DU_MAX_CRTCS];
 	unsigned int num_crtcs;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 55a0ecf45ebb..3afaf106d750 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -119,12 +119,12 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		}
 	}
 
-	ret = drm_encoder_init(rcdu->ddev, encoder, &rcar_du_encoder_funcs,
+	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_encoder_funcs,
 			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0)
 		goto error;
 
-	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_encoder_release,
+	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_encoder_release,
 				       renc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 72dda446355f..57bb0dc22807 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -583,7 +583,7 @@ static int rcar_du_properties_init(struct rcar_du_device *rcdu)
 	 * or enable source color keying (1).
 	 */
 	rcdu->props.colorkey =
-		drm_property_create_range(rcdu->ddev, 0, "colorkey",
+		drm_property_create_range(&rcdu->ddev, 0, "colorkey",
 					  0, 0x01ffffff);
 	if (rcdu->props.colorkey == NULL)
 		return -ENOMEM;
@@ -752,7 +752,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 		DU0_REG_OFFSET, DU2_REG_OFFSET
 	};
 
-	struct drm_device *dev = rcdu->ddev;
+	struct drm_device *dev = &rcdu->ddev;
 	struct drm_encoder *encoder;
 	unsigned int dpad0_sources;
 	unsigned int num_encoders;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index a0021fc25b27..5f69ff4502c1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -773,9 +773,9 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
 
 		plane->group = rgrp;
 
-		ret = drm_universal_plane_init(rcdu->ddev, &plane->plane, crtcs,
-					       &rcar_du_plane_funcs, formats,
-					       ARRAY_SIZE(formats),
+		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
+					       crtcs, &rcar_du_plane_funcs,
+					       formats, ARRAY_SIZE(formats),
 					       NULL, type, NULL);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 78a886651d9f..53221d8473c1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -375,7 +375,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 
 	vsp->vsp = &pdev->dev;
 
-	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_vsp_cleanup, vsp);
+	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_vsp_cleanup, vsp);
 	if (ret < 0)
 		return ret;
 
@@ -402,8 +402,8 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		plane->vsp = vsp;
 		plane->index = i;
 
-		ret = drm_universal_plane_init(rcdu->ddev, &plane->plane, crtcs,
-					       &rcar_du_vsp_plane_funcs,
+		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
+					       crtcs, &rcar_du_vsp_plane_funcs,
 					       rcar_du_vsp_formats,
 					       ARRAY_SIZE(rcar_du_vsp_formats),
 					       NULL, type, NULL);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
index 04efa78d70b6..c79d1259e49b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
@@ -204,7 +204,7 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(rcdu->ddev, wb_conn,
+	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
 					    &rcar_du_wb_conn_funcs,
 					    &rcar_du_wb_enc_helper_funcs,
 					    writeback_formats,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
