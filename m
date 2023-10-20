Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA857D0D5E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED3210E5A1;
	Fri, 20 Oct 2023 10:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 421 seconds by postgrey-1.36 at gabe;
 Fri, 20 Oct 2023 10:37:14 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6493310E5A0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:37:14 +0000 (UTC)
Received: from lvc-arm12.ispras.local (unknown [83.149.199.88])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3E6AE40F1DD9;
 Fri, 20 Oct 2023 10:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 3E6AE40F1DD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1697797810;
 bh=IRtFEArw+NnLYbXcC65wfJLbzVU+ZnVP8oeZ6x7qQ9E=;
 h=From:To:Cc:Subject:Date:From;
 b=qFaj/SEY99RErCZiLw8wjcxcv02GiNYSOQZRY1oOceope3TPbPivuqbp0nDlkz/5T
 1lqSl6ewAe0iydXQVmNgr/bvudDSdrj4jOazMfPPyD/4Mw4oKeC8ii1n4b3ypYBPuD
 gzoMSt60a0WIKxJPM01mq568oa39inWyK9Oyfigg=
From: Katya Orlova <e.orlova@ispras.ru>
To: Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [PATCH] drm/stm: Avoid use-after-free issues with crtc and plane
Date: Fri, 20 Oct 2023 13:29:35 +0300
Message-Id: <20231020102935.27634-1-e.orlova@ispras.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Katya Orlova <e.orlova@ispras.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ltdc_load() calls functions drm_crtc_init_with_planes() and
drm_universal_plane_init(). These functions should not be called with
parameters allocated with devm_kzalloc() to avoid use-after-free issues [1].

The patch replaces managed resource allocations with regular ones.

Found by Linux Verification Center (linuxtesting.org).

[1]
https://lore.kernel.org/lkml/u366i76e3qhh3ra5oxrtngjtm2u5lterkekcz6y2jkndhuxzli@diujon4h7qwb/

Signed-off-by: Katya Orlova <e.orlova@ispras.ru>
---
 drivers/gpu/drm/stm/drv.c  | 11 ++++--
 drivers/gpu/drm/stm/ltdc.c | 72 ++++++++++++++++++++++++++------------
 2 files changed, 58 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index cb4404b3ce62..409f26d3e400 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -74,7 +74,7 @@ static int drv_load(struct drm_device *ddev)
 
 	DRM_DEBUG("%s\n", __func__);
 
-	ldev = devm_kzalloc(ddev->dev, sizeof(*ldev), GFP_KERNEL);
+	ldev = kzalloc(sizeof(*ldev), GFP_KERNEL);
 	if (!ldev)
 		return -ENOMEM;
 
@@ -82,7 +82,7 @@ static int drv_load(struct drm_device *ddev)
 
 	ret = drmm_mode_config_init(ddev);
 	if (ret)
-		return ret;
+		goto err;
 
 	/*
 	 * set max width and height as default value.
@@ -98,7 +98,7 @@ static int drv_load(struct drm_device *ddev)
 
 	ret = ltdc_load(ddev);
 	if (ret)
-		return ret;
+		goto err;
 
 	drm_mode_config_reset(ddev);
 	drm_kms_helper_poll_init(ddev);
@@ -106,6 +106,9 @@ static int drv_load(struct drm_device *ddev)
 	platform_set_drvdata(pdev, ddev);
 
 	return 0;
+err:
+	kfree(ldev);
+	return ret;
 }
 
 static void drv_unload(struct drm_device *ddev)
@@ -114,6 +117,8 @@ static void drv_unload(struct drm_device *ddev)
 
 	drm_kms_helper_poll_fini(ddev);
 	ltdc_unload(ddev);
+	kfree(ddev->dev_private);
+	ddev->dev_private = NULL;
 }
 
 static __maybe_unused int drv_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index b8be4c1db423..ec3bc3637a63 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1120,6 +1120,12 @@ static const struct drm_crtc_helper_funcs ltdc_crtc_helper_funcs = {
 	.get_scanout_position = ltdc_crtc_get_scanout_position,
 };
 
+static void ltdc_crtc_destroy(struct drm_crtc *crtc)
+{
+	drm_crtc_cleanup(crtc);
+	kfree(crtc);
+}
+
 static int ltdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
@@ -1200,7 +1206,7 @@ static void ltdc_crtc_atomic_print_state(struct drm_printer *p,
 }
 
 static const struct drm_crtc_funcs ltdc_crtc_funcs = {
-	.destroy = drm_crtc_cleanup,
+	.destroy = ltdc_crtc_destroy,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = drm_atomic_helper_crtc_reset,
@@ -1213,7 +1219,7 @@ static const struct drm_crtc_funcs ltdc_crtc_funcs = {
 };
 
 static const struct drm_crtc_funcs ltdc_crtc_with_crc_support_funcs = {
-	.destroy = drm_crtc_cleanup,
+	.destroy = ltdc_crtc_destroy,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = drm_atomic_helper_crtc_reset,
@@ -1543,10 +1549,16 @@ static void ltdc_plane_atomic_print_state(struct drm_printer *p,
 	fpsi->counter = 0;
 }
 
+static void ltdc_plane_destroy(struct drm_plane *plane)
+{
+	drm_plane_cleanup(plane);
+	kfree(plane);
+}
+
 static const struct drm_plane_funcs ltdc_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = drm_plane_cleanup,
+	.destroy = ltdc_plane_destroy,
 	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
@@ -1565,7 +1577,6 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
 {
 	unsigned long possible_crtcs = CRTC_MASK;
 	struct ltdc_device *ldev = ddev->dev_private;
-	struct device *dev = ddev->dev;
 	struct drm_plane *plane;
 	unsigned int i, nb_fmt = 0;
 	u32 *formats;
@@ -1576,7 +1587,7 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
 	int ret;
 
 	/* Allocate the biggest size according to supported color formats */
-	formats = devm_kzalloc(dev, (ldev->caps.pix_fmt_nb +
+	formats = kzalloc((ldev->caps.pix_fmt_nb +
 			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_cp) +
 			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_sp) +
 			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_fp)) *
@@ -1614,15 +1625,20 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
 		}
 	}
 
-	plane = devm_kzalloc(dev, sizeof(*plane), GFP_KERNEL);
-	if (!plane)
+	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
+	if (!plane) {
+		kfree(formats);
 		return NULL;
+	}
 
 	ret = drm_universal_plane_init(ddev, plane, possible_crtcs,
 				       &ltdc_plane_funcs, formats, nb_fmt,
 				       modifiers, type, NULL);
-	if (ret < 0)
+	kfree(formats);
+	if (ret < 0) {
+		kfree(plane);
 		return NULL;
+	}
 
 	if (ldev->caps.ycbcr_input) {
 		if (val & (LXCR_C1R_YIA | LXCR_C1R_YSPA | LXCR_C1R_YFPA))
@@ -1650,7 +1666,7 @@ static void ltdc_plane_destroy_all(struct drm_device *ddev)
 
 	list_for_each_entry_safe(plane, plane_temp,
 				 &ddev->mode_config.plane_list, head)
-		drm_plane_cleanup(plane);
+		ltdc_plane_destroy(plane);
 }
 
 static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
@@ -1936,7 +1952,7 @@ int ltdc_load(struct drm_device *ddev)
 	if (!nb_endpoints)
 		return -ENODEV;
 
-	ldev->pixel_clk = devm_clk_get(dev, "lcd");
+	ldev->pixel_clk = clk_get(dev, "lcd");
 	if (IS_ERR(ldev->pixel_clk)) {
 		if (PTR_ERR(ldev->pixel_clk) != -EPROBE_DEFER)
 			DRM_ERROR("Unable to get lcd clock\n");
@@ -1982,7 +1998,7 @@ int ltdc_load(struct drm_device *ddev)
 		}
 	}
 
-	rstc = devm_reset_control_get_exclusive(dev, NULL);
+	rstc = reset_control_get_exclusive(dev, NULL);
 
 	mutex_init(&ldev->err_lock);
 
@@ -1993,25 +2009,25 @@ int ltdc_load(struct drm_device *ddev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ldev->regs = devm_ioremap_resource(dev, res);
+	ldev->regs = ioremap(res->start, resource_size(res));
 	if (IS_ERR(ldev->regs)) {
 		DRM_ERROR("Unable to get ltdc registers\n");
 		ret = PTR_ERR(ldev->regs);
 		goto err;
 	}
 
-	ldev->regmap = devm_regmap_init_mmio(&pdev->dev, ldev->regs, &stm32_ltdc_regmap_cfg);
+	ldev->regmap = regmap_init_mmio(&pdev->dev, ldev->regs, &stm32_ltdc_regmap_cfg);
 	if (IS_ERR(ldev->regmap)) {
 		DRM_ERROR("Unable to regmap ltdc registers\n");
 		ret = PTR_ERR(ldev->regmap);
-		goto err;
+		goto err_iounmap;
 	}
 
 	ret = ltdc_get_caps(ddev);
 	if (ret) {
 		DRM_ERROR("hardware identifier (0x%08x) not supported!\n",
 			  ldev->caps.hw_version);
-		goto err;
+		goto err_regmap_exit;
 	}
 
 	/* Disable interrupts */
@@ -2034,49 +2050,57 @@ int ltdc_load(struct drm_device *ddev)
 		irq = platform_get_irq(pdev, i);
 		if (irq < 0) {
 			ret = irq;
-			goto err;
+			goto err_regmap_exit;
 		}
 
-		ret = devm_request_threaded_irq(dev, irq, ltdc_irq,
+		ret = request_threaded_irq(irq, ltdc_irq,
 						ltdc_irq_thread, IRQF_ONESHOT,
 						dev_name(dev), ddev);
 		if (ret) {
 			DRM_ERROR("Failed to register LTDC interrupt\n");
-			goto err;
+			goto err_regmap_exit;
 		}
 	}
 
-	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
+	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
 	if (!crtc) {
 		DRM_ERROR("Failed to allocate crtc\n");
 		ret = -ENOMEM;
-		goto err;
+		goto err_regmap_exit;
 	}
 
 	ret = ltdc_crtc_init(ddev, crtc);
 	if (ret) {
 		DRM_ERROR("Failed to init crtc\n");
-		goto err;
+		goto free_crtc;
 	}
 
 	ret = drm_vblank_init(ddev, NB_CRTC);
 	if (ret) {
 		DRM_ERROR("Failed calling drm_vblank_init()\n");
-		goto err;
+		goto free_crtc;
 	}
 
 	clk_disable_unprepare(ldev->pixel_clk);
+	clk_put(ldev->pixel_clk);
 
 	pinctrl_pm_select_sleep_state(ddev->dev);
 
 	pm_runtime_enable(ddev->dev);
 
 	return 0;
+free_crtc:
+	kfree(crtc);
+err_regmap_exit:
+	regmap_exit(ldev->regmap);
+err_iounmap:
+	iounmap(ldev->regs);
 err:
 	for (i = 0; i < nb_endpoints; i++)
 		drm_of_panel_bridge_remove(ddev->dev->of_node, 0, i);
 
 	clk_disable_unprepare(ldev->pixel_clk);
+	clk_put(ldev->pixel_clk);
 
 	return ret;
 }
@@ -2084,6 +2108,7 @@ int ltdc_load(struct drm_device *ddev)
 void ltdc_unload(struct drm_device *ddev)
 {
 	struct device *dev = ddev->dev;
+	struct ltdc_device *ldev = ddev->dev_private;
 	int nb_endpoints, i;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -2094,6 +2119,9 @@ void ltdc_unload(struct drm_device *ddev)
 		drm_of_panel_bridge_remove(ddev->dev->of_node, 0, i);
 
 	pm_runtime_disable(ddev->dev);
+
+	regmap_exit(ldev->regmap);
+	iounmap(ldev->regs);
 }
 
 MODULE_AUTHOR("Philippe Cornu <philippe.cornu@st.com>");
-- 
2.30.2

