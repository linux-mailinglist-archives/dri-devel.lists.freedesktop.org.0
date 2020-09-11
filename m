Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3688F266074
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30136EA52;
	Fri, 11 Sep 2020 13:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CE06EA39
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:39:13 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjGh-0005Is-2G; Fri, 11 Sep 2020 15:39:11 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 21/21] drm/imx: ipuv3-crtc: use drm managed resources
Date: Fri, 11 Sep 2020 15:38:55 +0200
Message-Id: <20200911133855.29801-21-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911133855.29801-1-p.zabel@pengutronix.de>
References: <20200911133855.29801-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drmm_kzalloc() to align crtc memory lifetime with the drm device,
and use drmm_add_action_or_reset() to make sure IPU resources are
released and drm_crtc_cleanup() is called before the memory is freed.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/imx/ipuv3-crtc.c | 77 ++++++++++++++------------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
index 8076ab272637..f284e4ea6d5f 100644
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@ -20,6 +20,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -161,7 +162,6 @@ static void ipu_disable_vblank(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs ipu_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = drm_crtc_cleanup,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = imx_drm_crtc_reset,
 	.atomic_duplicate_state = imx_drm_crtc_duplicate_state,
@@ -318,37 +318,42 @@ static const struct drm_crtc_helper_funcs ipu_helper_funcs = {
 	.atomic_enable = ipu_crtc_atomic_enable,
 };
 
-static void ipu_put_resources(struct ipu_crtc *ipu_crtc)
+static void ipu_put_resources(struct drm_device *dev, void *ptr)
 {
+	struct ipu_crtc *ipu_crtc = ptr;
+
 	if (!IS_ERR_OR_NULL(ipu_crtc->dc))
 		ipu_dc_put(ipu_crtc->dc);
 	if (!IS_ERR_OR_NULL(ipu_crtc->di))
 		ipu_di_put(ipu_crtc->di);
 }
 
-static int ipu_get_resources(struct ipu_crtc *ipu_crtc,
-		struct ipu_client_platformdata *pdata)
+static int ipu_get_resources(struct drm_device *dev, struct ipu_crtc *ipu_crtc,
+			     struct ipu_client_platformdata *pdata)
 {
 	struct ipu_soc *ipu = dev_get_drvdata(ipu_crtc->dev->parent);
 	int ret;
 
 	ipu_crtc->dc = ipu_dc_get(ipu, pdata->dc);
-	if (IS_ERR(ipu_crtc->dc)) {
-		ret = PTR_ERR(ipu_crtc->dc);
-		goto err_out;
-	}
+	if (IS_ERR(ipu_crtc->dc))
+		return PTR_ERR(ipu_crtc->dc);
+
+	ret = drmm_add_action_or_reset(dev, ipu_put_resources, ipu_crtc);
+	if (ret)
+		return ret;
 
 	ipu_crtc->di = ipu_di_get(ipu, pdata->di);
-	if (IS_ERR(ipu_crtc->di)) {
-		ret = PTR_ERR(ipu_crtc->di);
-		goto err_out;
-	}
+	if (IS_ERR(ipu_crtc->di))
+		return PTR_ERR(ipu_crtc->di);
 
 	return 0;
-err_out:
-	ipu_put_resources(ipu_crtc);
+}
 
-	return ret;
+static void ipu_crtc_cleanup(struct drm_device *drm, void *ptr)
+{
+	struct drm_crtc *crtc = ptr;
+
+	drm_crtc_cleanup(crtc);
 }
 
 static int ipu_crtc_init(struct ipu_crtc *ipu_crtc,
@@ -359,7 +364,7 @@ static int ipu_crtc_init(struct ipu_crtc *ipu_crtc,
 	int dp = -EINVAL;
 	int ret;
 
-	ret = ipu_get_resources(ipu_crtc, pdata);
+	ret = ipu_get_resources(drm, ipu_crtc, pdata);
 	if (ret) {
 		dev_err(ipu_crtc->dev, "getting resources failed with %d.\n",
 				ret);
@@ -372,13 +377,19 @@ static int ipu_crtc_init(struct ipu_crtc *ipu_crtc,
 					    DRM_PLANE_TYPE_PRIMARY);
 	if (IS_ERR(ipu_crtc->plane[0])) {
 		ret = PTR_ERR(ipu_crtc->plane[0]);
-		goto err_put_resources;
+		return ret;
 	}
 
 	crtc->port = pdata->of_node;
 	drm_crtc_helper_add(crtc, &ipu_helper_funcs);
-	drm_crtc_init_with_planes(drm, crtc, &ipu_crtc->plane[0]->base, NULL,
-				  &ipu_crtc_funcs, NULL);
+	ret = drm_crtc_init_with_planes(drm, crtc, &ipu_crtc->plane[0]->base,
+					NULL, &ipu_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(drm, ipu_crtc_cleanup, crtc);
+	if (ret)
+		return ret;
 
 	/* If this crtc is using the DP, add an overlay plane */
 	if (pdata->dp >= 0 && pdata->dma[1] > 0) {
@@ -395,17 +406,12 @@ static int ipu_crtc_init(struct ipu_crtc *ipu_crtc,
 			"imx_drm", ipu_crtc);
 	if (ret < 0) {
 		dev_err(ipu_crtc->dev, "irq request failed with %d.\n", ret);
-		goto err_put_resources;
+		return ret;
 	}
 	/* Only enable IRQ when we actually need it to trigger work. */
 	disable_irq(ipu_crtc->irq);
 
 	return 0;
-
-err_put_resources:
-	ipu_put_resources(ipu_crtc);
-
-	return ret;
 }
 
 static int ipu_drm_bind(struct device *dev, struct device *master, void *data)
@@ -414,31 +420,22 @@ static int ipu_drm_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = data;
 	struct ipu_crtc *ipu_crtc;
 
-	ipu_crtc = dev_get_drvdata(dev);
-	memset(ipu_crtc, 0, sizeof(*ipu_crtc));
+	ipu_crtc = drmm_kzalloc(drm, sizeof(*ipu_crtc), GFP_KERNEL);
+	if (!ipu_crtc)
+		return -ENOMEM;
 
 	ipu_crtc->dev = dev;
 
 	return ipu_crtc_init(ipu_crtc, pdata, drm);
 }
 
-static void ipu_drm_unbind(struct device *dev, struct device *master,
-	void *data)
-{
-	struct ipu_crtc *ipu_crtc = dev_get_drvdata(dev);
-
-	ipu_put_resources(ipu_crtc);
-}
-
 static const struct component_ops ipu_crtc_ops = {
 	.bind = ipu_drm_bind,
-	.unbind = ipu_drm_unbind,
 };
 
 static int ipu_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct ipu_crtc *ipu_crtc;
 	int ret;
 
 	if (!dev->platform_data)
@@ -448,12 +445,6 @@ static int ipu_drm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ipu_crtc = devm_kzalloc(dev, sizeof(*ipu_crtc), GFP_KERNEL);
-	if (!ipu_crtc)
-		return -ENOMEM;
-
-	dev_set_drvdata(dev, ipu_crtc);
-
 	return component_add(dev, &ipu_crtc_ops);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
