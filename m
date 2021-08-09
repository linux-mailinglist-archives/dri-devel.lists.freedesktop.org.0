Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963773E3DAF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B61689A16;
	Mon,  9 Aug 2021 01:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D1389954
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:17 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8178D17C7;
 Mon,  9 Aug 2021 03:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472915;
 bh=Az0iE2XH3bC6CXifJi2HFqVLiQL5hGqsXXWPVXhY3ME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rez6KnSJnpWfCOI7k08TC/cJ+5A1VYEHH9l05KebQGoIxPGnkHzfrHmP7VEBq3dyB
 y0IgQgKMv4SDRSZqfvd4abJhyNXRWX850Wna3+kLYz+RI+ovF/Stwz/99WFYjTuR3V
 gAUy4YyRexK1Cy2mVEeNy5A4qS6+PGV2frcUtGc8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 27/36] drm: xlnx: zynqmp_dpsub: Manage DP and DISP allocations
 manually
Date: Mon,  9 Aug 2021 04:34:48 +0300
Message-Id: <20210809013457.11266-28-laurent.pinchart@ideasonboard.com>
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

The zynqmp_disp and zynqmp_dp structures are allocated with
drmm_kzalloc(). While this simplifies management of memory, it requires
a DRM device, which will not be available at probe time when the DP
bridge will be used standalone, with a DRM device in the PL. To prepare
for this, switch to manual allocation for zynqmp_disp and zynqmp_dp. The
cleanup still uses the DRM managed infrastructure, but one level up, at
the top level. This will be addressed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 34 +++++++++++++++++++----------
 drivers/gpu/drm/xlnx/zynqmp_disp.h  |  3 +--
 drivers/gpu/drm/xlnx/zynqmp_dp.c    | 30 +++++++++++++++----------
 drivers/gpu/drm/xlnx/zynqmp_dp.h    |  3 +--
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 17 +++++++++++++--
 5 files changed, 57 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index cc07cb2a4d0f..5c39df0fbe59 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -12,7 +12,6 @@
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_managed.h>
 #include <drm/drm_plane.h>
 
 #include <linux/clk.h>
@@ -21,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "zynqmp_disp.h"
 #include "zynqmp_disp_regs.h"
@@ -1220,7 +1220,7 @@ int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
  * Initialization & Cleanup
  */
 
-int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
+int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
 {
 	struct platform_device *pdev = to_platform_device(dpsub->dev);
 	struct zynqmp_disp *disp;
@@ -1228,38 +1228,48 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 	struct resource *res;
 	int ret;
 
-	disp = drmm_kzalloc(drm, sizeof(*disp), GFP_KERNEL);
+	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
 	if (!disp)
 		return -ENOMEM;
 
 	disp->dev = &pdev->dev;
 	disp->dpsub = dpsub;
 
-	dpsub->disp = disp;
-
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "blend");
 	disp->blend.base = devm_ioremap_resource(disp->dev, res);
-	if (IS_ERR(disp->blend.base))
-		return PTR_ERR(disp->blend.base);
+	if (IS_ERR(disp->blend.base)) {
+		ret = PTR_ERR(disp->blend.base);
+		goto error;
+	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "av_buf");
 	disp->avbuf.base = devm_ioremap_resource(disp->dev, res);
-	if (IS_ERR(disp->avbuf.base))
-		return PTR_ERR(disp->avbuf.base);
+	if (IS_ERR(disp->avbuf.base)) {
+		ret = PTR_ERR(disp->avbuf.base);
+		goto error;
+	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aud");
 	disp->audio.base = devm_ioremap_resource(disp->dev, res);
-	if (IS_ERR(disp->audio.base))
-		return PTR_ERR(disp->audio.base);
+	if (IS_ERR(disp->audio.base)) {
+		ret = PTR_ERR(disp->audio.base);
+		goto error;
+	}
 
 	ret = zynqmp_disp_create_layers(disp);
 	if (ret)
-		return ret;
+		goto error;
 
 	layer = &disp->layers[ZYNQMP_DPSUB_LAYER_VID];
 	dpsub->dma_align = 1 << layer->dmas[0].chan->device->copy_align;
 
+	dpsub->disp = disp;
+
 	return 0;
+
+error:
+	kfree(disp);
+	return ret;
 }
 
 void zynqmp_disp_remove(struct zynqmp_dpsub *dpsub)
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index 663f7d67c78f..9b8b202224d9 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -25,7 +25,6 @@
 #define ZYNQMP_DISP_MAX_DMA_BIT				44
 
 struct device;
-struct drm_device;
 struct drm_format_info;
 struct drm_plane_state;
 struct platform_device;
@@ -60,7 +59,7 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 			     struct drm_plane_state *state);
 
-int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm);
+int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub);
 void zynqmp_disp_remove(struct zynqmp_dpsub *dpsub);
 
 #endif /* _ZYNQMP_DISP_H_ */
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 360175b8fc1f..25cde59b1e05 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -14,7 +14,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_managed.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 
@@ -26,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/phy/phy.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 
 #include "zynqmp_disp.h"
 #include "zynqmp_dp.h"
@@ -1609,7 +1609,7 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
  * Initialization & Cleanup
  */
 
-int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
+int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 {
 	struct platform_device *pdev = to_platform_device(dpsub->dev);
 	struct drm_bridge *bridge;
@@ -1617,7 +1617,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 	struct resource *res;
 	int ret;
 
-	dp = drmm_kzalloc(drm, sizeof(*dp), GFP_KERNEL);
+	dp = kzalloc(sizeof(*dp), GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
 
@@ -1627,29 +1627,32 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 
 	INIT_DELAYED_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
 
-	dpsub->dp = dp;
-
 	/* Acquire all resources (IOMEM, IRQ and PHYs). */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dp");
 	dp->iomem = devm_ioremap_resource(dp->dev, res);
-	if (IS_ERR(dp->iomem))
-		return PTR_ERR(dp->iomem);
+	if (IS_ERR(dp->iomem)) {
+		ret = PTR_ERR(dp->iomem);
+		goto err_free;
+	}
 
 	dp->irq = platform_get_irq(pdev, 0);
-	if (dp->irq < 0)
-		return dp->irq;
+	if (dp->irq < 0) {
+		ret = dp->irq;
+		goto err_free;
+	}
 
 	dp->reset = devm_reset_control_get(dp->dev, NULL);
 	if (IS_ERR(dp->reset)) {
 		if (PTR_ERR(dp->reset) != -EPROBE_DEFER)
 			dev_err(dp->dev, "failed to get reset: %ld\n",
 				PTR_ERR(dp->reset));
-		return PTR_ERR(dp->reset);
+		ret = PTR_ERR(dp->reset);
+		goto err_free;
 	}
 
 	ret = zynqmp_dp_reset(dp, false);
 	if (ret < 0)
-		return ret;
+		goto err_free;
 
 	ret = zynqmp_dp_phy_probe(dp);
 	if (ret)
@@ -1699,6 +1702,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 	if (ret < 0)
 		goto err_phy_exit;
 
+	dpsub->dp = dp;
+
 	dev_dbg(dp->dev, "ZynqMP DisplayPort Tx probed with %u lanes\n",
 		dp->num_lanes);
 
@@ -1708,7 +1713,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 	zynqmp_dp_phy_exit(dp);
 err_reset:
 	zynqmp_dp_reset(dp, true);
-
+err_free:
+	kfree(dp);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.h b/drivers/gpu/drm/xlnx/zynqmp_dp.h
index 736d810fa16f..f077d7fbd0ad 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.h
@@ -12,7 +12,6 @@
 #ifndef _ZYNQMP_DP_H_
 #define _ZYNQMP_DP_H_
 
-struct drm_device;
 struct platform_device;
 struct zynqmp_dp;
 struct zynqmp_dpsub;
@@ -20,7 +19,7 @@ struct zynqmp_dpsub;
 void zynqmp_dp_enable_vblank(struct zynqmp_dp *dp);
 void zynqmp_dp_disable_vblank(struct zynqmp_dp *dp);
 
-int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm);
+int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub);
 void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub);
 
 #endif /* _ZYNQMP_DP_H_ */
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 6f4e78b2a7c0..e98e7e3b37d7 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -15,6 +15,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
@@ -246,6 +247,14 @@ static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
 	return 0;
 }
 
+static void zynqmp_dpsub_release(struct drm_device *drm, void *res)
+{
+	struct zynqmp_dpsub *dpsub = res;
+
+	kfree(dpsub->disp);
+	kfree(dpsub->dp);
+}
+
 static int zynqmp_dpsub_probe(struct platform_device *pdev)
 {
 	struct zynqmp_dpsub *dpsub;
@@ -257,6 +266,10 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	if (IS_ERR(dpsub))
 		return PTR_ERR(dpsub);
 
+	ret = drmm_add_action(&dpsub->drm, zynqmp_dpsub_release, dpsub);
+	if (ret < 0)
+		return ret;
+
 	dpsub->dev = &pdev->dev;
 	platform_set_drvdata(pdev, dpsub);
 
@@ -275,11 +288,11 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	 * DP should be probed first so that the zynqmp_disp can set the output
 	 * format accordingly.
 	 */
-	ret = zynqmp_dp_probe(dpsub, &dpsub->drm);
+	ret = zynqmp_dp_probe(dpsub);
 	if (ret)
 		goto err_pm;
 
-	ret = zynqmp_disp_probe(dpsub, &dpsub->drm);
+	ret = zynqmp_disp_probe(dpsub);
 	if (ret)
 		goto err_dp;
 
-- 
Regards,

Laurent Pinchart

