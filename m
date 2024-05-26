Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB4C8CF5D7
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 21:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1228610E8E6;
	Sun, 26 May 2024 19:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ECKxfimC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6585F10E8E6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 19:59:23 +0000 (UTC)
X-Envelope-To: maarten.lankhorst@linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716753561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vxl1w9mtqDkyZD04DnulPgGkGBzNIZLutabN9Rr9Q2I=;
 b=ECKxfimC7g/ZqW3qDT1fTw+i95pPXZ3ApwmUE12jcwSN+pQVcrTbYObO6X/kGHZwejw7u7
 S23u2UxIjRlVn4rgpmZOCc/+rNJFPAn5lsGmZRXAZGoGj7gf/MV8GdJyIA7fZhol89TZVc
 nUzo6udPtguG8JeZR0tsWG6enwuPDFo=
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: markus.elfring@web.de
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Elfring <Markus.Elfring@web.de>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v2 2/3] drm/loongson: Introduce component framework support
Date: Mon, 27 May 2024 03:58:25 +0800
Message-Id: <20240526195826.109008-3-sui.jingfeng@linux.dev>
In-Reply-To: <20240526195826.109008-1-sui.jingfeng@linux.dev>
References: <20240526195826.109008-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hardware units come with PCIe are actually all ready to be driven, but
there has some board specific modules could return '-EPROBE_DEFER'.
However, the driver needs all of the subcompoments ready to use before
it can register the drm service to userspace.

Introduce the component framework to tackle such problems, move DRM
device related code into loongson_drm_master_bind() function. Move
output related things into subdriver. Display controller and GPIO-I2C
goes with the PCIe master, sinch they has no dependency on exterinal
modules.

While the outputs drivers, such as encoders and conectors, may has some
dependency on exterinal modules. Those hardware units are relatively
independent hardware IPs from the CRTC. Hence, offload them to submodules.
This design allows subdriver return '-EPROBE_DEFER' to the driver core
if it need to do so, the master drvier won't bind until all submodules
are ready.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/loongson/Makefile             |   1 +
 drivers/gpu/drm/loongson/loongson_module.c    |  17 +-
 drivers/gpu/drm/loongson/loongson_module.h    |   1 +
 drivers/gpu/drm/loongson/lsdc_drv.c           | 205 +++++++++++-------
 drivers/gpu/drm/loongson/lsdc_drv.h           |  31 +--
 drivers/gpu/drm/loongson/lsdc_i2c.c           |   5 +-
 drivers/gpu/drm/loongson/lsdc_i2c.h           |   3 -
 drivers/gpu/drm/loongson/lsdc_output.c        | 176 +++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h        |  38 +++-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c |   3 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  17 +-
 11 files changed, 367 insertions(+), 130 deletions(-)
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c

diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
index 91e72bd900c1..e15cb9bff378 100644
--- a/drivers/gpu/drm/loongson/Makefile
+++ b/drivers/gpu/drm/loongson/Makefile
@@ -9,6 +9,7 @@ loongson-y := \
 	lsdc_gfxpll.o \
 	lsdc_i2c.o \
 	lsdc_irq.o \
+	lsdc_output.o \
 	lsdc_output_7a1000.o \
 	lsdc_output_7a2000.o \
 	lsdc_plane.o \
diff --git a/drivers/gpu/drm/loongson/loongson_module.c b/drivers/gpu/drm/loongson/loongson_module.c
index d2a51bd395f6..037fa7ffe9c9 100644
--- a/drivers/gpu/drm/loongson/loongson_module.c
+++ b/drivers/gpu/drm/loongson/loongson_module.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 
 #include <video/nomodeset.h>
 
@@ -19,15 +20,29 @@ module_param_named(vblank, loongson_vblank, int, 0400);
 
 static int __init loongson_module_init(void)
 {
+	int ret;
+
 	if (!loongson_modeset || video_firmware_drivers_only())
 		return -ENODEV;
 
-	return pci_register_driver(&lsdc_pci_driver);
+	ret = platform_driver_register(&lsdc_output_port_platform_driver);
+	if (ret)
+		return ret;
+
+	ret = pci_register_driver(&lsdc_pci_driver);
+	if (ret) {
+		platform_driver_unregister(&lsdc_output_port_platform_driver);
+		return ret;
+	}
+
+	return 0;
 }
 module_init(loongson_module_init);
 
 static void __exit loongson_module_exit(void)
 {
 	pci_unregister_driver(&lsdc_pci_driver);
+
+	platform_driver_unregister(&lsdc_output_port_platform_driver);
 }
 module_exit(loongson_module_exit);
diff --git a/drivers/gpu/drm/loongson/loongson_module.h b/drivers/gpu/drm/loongson/loongson_module.h
index 931c17521bf0..8dc71b98f5cc 100644
--- a/drivers/gpu/drm/loongson/loongson_module.h
+++ b/drivers/gpu/drm/loongson/loongson_module.h
@@ -8,5 +8,6 @@
 
 extern int loongson_vblank;
 extern struct pci_driver lsdc_pci_driver;
+extern struct platform_driver lsdc_output_port_platform_driver;
 
 #endif
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index adc7344d2f80..02429c95bd1a 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -3,7 +3,9 @@
  * Copyright (C) 2023 Loongson Technology Corporation Limited
  */
 
+#include <linux/component.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/vgaarb.h>
 
 #include <drm/drm_aperture.h>
@@ -67,31 +69,6 @@ static int lsdc_modeset_init(struct lsdc_device *ldev,
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < num_crtc; i++) {
-		dispipe = &ldev->dispipe[i];
-
-		/* We need an index before crtc is initialized */
-		dispipe->index = i;
-
-		ret = funcs->create_i2c(ddev, dispipe, i);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < num_crtc; i++) {
-		struct i2c_adapter *ddc = NULL;
-
-		dispipe = &ldev->dispipe[i];
-		if (dispipe->li2c)
-			ddc = &dispipe->li2c->adapter;
-
-		ret = funcs->output_init(ddev, dispipe, ddc, i);
-		if (ret)
-			return ret;
-
-		ldev->num_output++;
-	}
-
 	for (i = 0; i < num_crtc; i++) {
 		dispipe = &ldev->dispipe[i];
 
@@ -187,30 +164,17 @@ static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
 	return (size > SZ_1M) ? 0 : -ENODEV;
 }
 
-static struct lsdc_device *
-lsdc_create_device(struct pci_dev *pdev,
-		   const struct lsdc_desc *descp,
-		   const struct drm_driver *driver)
+static int lsdc_device_init(struct lsdc_device *ldev,
+			    const struct lsdc_desc *descp,
+			    const struct drm_driver *driver)
 {
-	struct lsdc_device *ldev;
-	struct drm_device *ddev;
+	struct drm_device *ddev = &ldev->base;
 	int ret;
 
-	ldev = devm_drm_dev_alloc(&pdev->dev, driver, struct lsdc_device, base);
-	if (IS_ERR(ldev))
-		return ldev;
-
-	ldev->dc = pdev;
-	ldev->descp = descp;
-
-	ddev = &ldev->base;
-
-	loongson_gfxpll_create(ddev, &ldev->gfxpll);
-
-	ret = lsdc_get_dedicated_vram(ldev, pdev, descp);
+	ret = lsdc_get_dedicated_vram(ldev, ldev->dc, ldev->descp);
 	if (ret) {
 		drm_err(ddev, "Init VRAM failed: %d\n", ret);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
 	ret = drm_aperture_remove_conflicting_framebuffers(ldev->vram_base,
@@ -218,51 +182,110 @@ lsdc_create_device(struct pci_dev *pdev,
 							   driver);
 	if (ret) {
 		drm_err(ddev, "Remove firmware framebuffers failed: %d\n", ret);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
 	ret = lsdc_ttm_init(ldev);
 	if (ret) {
 		drm_err(ddev, "Memory manager init failed: %d\n", ret);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
 	lsdc_gem_init(ddev);
 
 	/* Bar 0 of the DC device contains the MMIO register's base address */
-	ldev->reg_base = pcim_iomap(pdev, 0, 0);
+	ldev->reg_base = pcim_iomap(ldev->dc, 0, 0);
 	if (!ldev->reg_base)
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 
 	spin_lock_init(&ldev->reglock);
 
+	return 0;
+}
+
+/* For multiple GPU driver instance co-exixt in the system */
+
+static unsigned int lsdc_vga_set_decode(struct pci_dev *pdev, bool state)
+{
+	return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
+}
+
+static int loongson_drm_master_bind(struct device *dev)
+{
+	struct lsdc_device *ldev = dev_get_drvdata(dev);
+	const struct lsdc_desc *descp = ldev->descp;
+	struct drm_device *ddev = &ldev->base;
+	int ret;
+
+	if (loongson_vblank) {
+		struct pci_dev *pdev = to_pci_dev(dev);
+
+		ret = drm_vblank_init(ddev, descp->num_of_crtc);
+		if (ret)
+			return ret;
+
+		ret = devm_request_irq(dev, pdev->irq,
+				       descp->funcs->irq_handler,
+				       IRQF_SHARED,
+				       dev_name(dev), ddev);
+		if (ret) {
+			drm_err(ddev, "Failed to register interrupt: %d\n", ret);
+			return ret;
+		}
+
+		drm_info(ddev, "registered irq: %u\n", pdev->irq);
+	}
+
 	ret = lsdc_mode_config_init(ddev, descp);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
+
+	ret = component_bind_all(dev, ddev);
+	if (ret) {
+		dev_err(dev, "master bind all failed: %d\n", ret);
+		return ret;
+	}
 
 	ret = lsdc_modeset_init(ldev, descp->num_of_crtc, descp->funcs,
 				loongson_vblank);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
 
 	drm_mode_config_reset(ddev);
 
-	return ldev;
-}
+	drm_kms_helper_poll_init(ddev);
 
-/* For multiple GPU driver instance co-exixt in the system */
+	ret = drm_dev_register(ddev, 0);
+	if (ret)
+		return ret;
 
-static unsigned int lsdc_vga_set_decode(struct pci_dev *pdev, bool state)
+	drm_fbdev_ttm_setup(ddev, 32);
+
+	return 0;
+}
+
+static void loongson_drm_master_unbind(struct device *dev)
 {
-	return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
+	struct lsdc_device *ldev = dev_get_drvdata(dev);
+	struct drm_device *ddev = &ldev->base;
+
+	component_unbind_all(dev, ddev);
+
+	return;
 }
 
+static const struct component_master_ops loongson_drm_master_ops = {
+	.bind = loongson_drm_master_bind,
+	.unbind = loongson_drm_master_unbind,
+};
+
 static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
+	struct component_match *matches = NULL;
 	const struct lsdc_desc *descp;
-	struct drm_device *ddev;
 	struct lsdc_device *ldev;
 	int ret;
+	int i;
 
 	descp = lsdc_device_probe(pdev, ent->driver_data);
 	if (IS_ERR_OR_NULL(descp))
@@ -281,55 +304,77 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	dev_info(&pdev->dev, "Found %s, revision: %u",
 		 to_loongson_gfx(descp)->model, pdev->revision);
 
-	ldev = lsdc_create_device(pdev, descp, &lsdc_drm_driver);
+	ldev = devm_drm_dev_alloc(&pdev->dev, &lsdc_drm_driver,
+				  struct lsdc_device, base);
 	if (IS_ERR(ldev))
 		return PTR_ERR(ldev);
 
-	ddev = &ldev->base;
+	pci_set_drvdata(pdev, ldev);
 
-	pci_set_drvdata(pdev, ddev);
+	ldev->dc = pdev;
+	ldev->descp = descp;
 
-	vga_client_register(pdev, lsdc_vga_set_decode);
+	loongson_gfxpll_create(&ldev->base, &ldev->gfxpll);
 
-	drm_kms_helper_poll_init(ddev);
+	ret = lsdc_device_init(ldev, descp, &lsdc_drm_driver);
+	if (ret)
+		return ret;
 
-	if (loongson_vblank) {
-		ret = drm_vblank_init(ddev, descp->num_of_crtc);
+	for (i = 0; i < descp->num_of_crtc; ++i) {
+		ret = descp->funcs->create_i2c(&ldev->base, i);
 		if (ret)
 			return ret;
+	}
 
-		ret = devm_request_irq(&pdev->dev, pdev->irq,
-				       descp->funcs->irq_handler,
-				       IRQF_SHARED,
-				       dev_name(&pdev->dev), ddev);
-		if (ret) {
-			drm_err(ddev, "Failed to register interrupt: %d\n", ret);
+	for (i = 0; i < descp->num_of_crtc; ++i) {
+		ret = lsdc_output_preinit(&pdev->dev, descp, i,
+					  &ldev->child[i]);
+		if (ret)
 			return ret;
-		}
+	}
 
-		drm_info(ddev, "registered irq: %u\n", pdev->irq);
+	for (i = 0; i < descp->num_of_crtc; ++i) {
+		component_match_add(&pdev->dev, &matches,
+				    component_compare_dev,
+				    &ldev->child[i]->dev);
 	}
 
-	ret = drm_dev_register(ddev, 0);
-	if (ret)
-		return ret;
+	ret = component_master_add_with_match(&pdev->dev,
+					      &loongson_drm_master_ops,
+					      matches);
 
-	drm_fbdev_ttm_setup(ddev, 32);
+	dev_info(&pdev->dev, "loongson add component: %u\n", ret);
+
+	vga_client_register(pdev, lsdc_vga_set_decode);
 
 	return 0;
 }
 
 static void lsdc_pci_remove(struct pci_dev *pdev)
 {
-	struct drm_device *ddev = pci_get_drvdata(pdev);
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+	struct drm_device *ddev = &ldev->base;
+	unsigned int i;
 
 	drm_dev_unregister(ddev);
 	drm_atomic_helper_shutdown(ddev);
+
+	component_master_del(&pdev->dev, &loongson_drm_master_ops);
+
+	for (i = 0; i < ldev->descp->num_of_crtc; ++i) {
+		if (ldev->child[i]) {
+			platform_device_unregister(ldev->child[i]);
+			ldev->child[i] = NULL;
+		}
+	}
 }
 
 static void lsdc_pci_shutdown(struct pci_dev *pdev)
 {
-	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+	struct drm_device *ddev = &ldev->base;
+
+	drm_atomic_helper_shutdown(ddev);
 }
 
 static int lsdc_drm_freeze(struct drm_device *ddev)
@@ -383,7 +428,8 @@ static int lsdc_drm_freeze(struct drm_device *ddev)
 static int lsdc_drm_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *ddev = pci_get_drvdata(pdev);
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+	struct drm_device *ddev = &ldev->base;
 
 	return drm_mode_config_helper_resume(ddev);
 }
@@ -391,7 +437,8 @@ static int lsdc_drm_resume(struct device *dev)
 static int lsdc_pm_freeze(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *ddev = pci_get_drvdata(pdev);
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+	struct drm_device *ddev = &ldev->base;
 
 	return lsdc_drm_freeze(ddev);
 }
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
index a2c6b496a69f..267fcba74572 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.h
+++ b/drivers/gpu/drm/loongson/lsdc_drv.h
@@ -173,47 +173,22 @@ struct lsdc_cursor {
 	struct lsdc_device *ldev;
 };
 
-struct lsdc_output {
-	struct drm_encoder encoder;
-	struct drm_connector connector;
-};
-
-static inline struct lsdc_output *
-connector_to_lsdc_output(struct drm_connector *connector)
-{
-	return container_of(connector, struct lsdc_output, connector);
-}
-
-static inline struct lsdc_output *
-encoder_to_lsdc_output(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct lsdc_output, encoder);
-}
-
 struct lsdc_display_pipe {
 	struct lsdc_crtc crtc;
 	struct lsdc_primary primary;
 	struct lsdc_cursor cursor;
-	struct lsdc_output output;
-	struct lsdc_i2c *li2c;
+	struct lsdc_output *output;
 	unsigned int index;
 };
 
-static inline struct lsdc_display_pipe *
-output_to_display_pipe(struct lsdc_output *output)
-{
-	return container_of(output, struct lsdc_display_pipe, output);
-}
-
 struct lsdc_kms_funcs {
 	irqreturn_t (*irq_handler)(int irq, void *arg);
 
 	int (*create_i2c)(struct drm_device *ddev,
-			  struct lsdc_display_pipe *dispipe,
 			  unsigned int index);
 
 	int (*output_init)(struct drm_device *ddev,
-			   struct lsdc_display_pipe *dispipe,
+			   struct lsdc_output *output,
 			   struct i2c_adapter *ddc,
 			   unsigned int index);
 
@@ -290,6 +265,8 @@ struct lsdc_device {
 	resource_size_t gtt_size;
 
 	struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
+	struct platform_device *child[LSDC_NUM_CRTC];
+	struct i2c_adapter *i2c[LSDC_NUM_CRTC];
 
 	struct lsdc_gem gem;
 
diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.c b/drivers/gpu/drm/loongson/lsdc_i2c.c
index ce90c25536d2..f10416b856af 100644
--- a/drivers/gpu/drm/loongson/lsdc_i2c.c
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.c
@@ -115,7 +115,6 @@ static void lsdc_destroy_i2c(struct drm_device *ddev, void *data)
  * @index: output channel index, 0 for PIPE0, 1 for PIPE1
  */
 int lsdc_create_i2c_chan(struct drm_device *ddev,
-			 struct lsdc_display_pipe *dispipe,
 			 unsigned int index)
 {
 	struct lsdc_device *ldev = to_lsdc(ddev);
@@ -127,8 +126,6 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
 	if (!li2c)
 		return -ENOMEM;
 
-	dispipe->li2c = li2c;
-
 	if (index == 0) {
 		li2c->sda = 0x01;  /* pin 0 */
 		li2c->scl = 0x02;  /* pin 1 */
@@ -171,6 +168,8 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
 	if (ret)
 		return ret;
 
+	ldev->i2c[index] = adapter;
+
 	drm_info(ddev, "%s(sda pin mask=%u, scl pin mask=%u) created\n",
 		 adapter->name, li2c->sda, li2c->scl);
 
diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.h b/drivers/gpu/drm/loongson/lsdc_i2c.h
index 88cd1a1817a5..17636c09f7e7 100644
--- a/drivers/gpu/drm/loongson/lsdc_i2c.h
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.h
@@ -20,10 +20,7 @@ struct lsdc_i2c {
 	u8 scl;
 };
 
-struct lsdc_display_pipe;
-
 int lsdc_create_i2c_chan(struct drm_device *ddev,
-			 struct lsdc_display_pipe *dispipe,
 			 unsigned int index);
 
 #endif
diff --git a/drivers/gpu/drm/loongson/lsdc_output.c b/drivers/gpu/drm/loongson/lsdc_output.c
new file mode 100644
index 000000000000..d447534e1150
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_output.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/delay.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_output.h"
+
+static struct lsdc_output_desc ls7a1000_output_port_desc[2] = {
+	{
+		.pipe = 0,
+		.type = "DVO-0",
+	},
+	{
+		.pipe = 1,
+		.type = "DVO-1",
+	},
+};
+
+static struct lsdc_output_desc ls7a2000_output_port_desc[2] = {
+	{
+		.pipe = 0,
+		.type = "HDMI-or-VGA-0",
+	},
+	{
+		.pipe = 1,
+		.type = "HDMI-1",
+	},
+};
+
+int lsdc_output_preinit(struct device *parent,
+			const struct lsdc_desc *descp,
+			unsigned int index,
+			struct platform_device **ppdev)
+{
+	struct lsdc_output_desc *output_port_info;
+	int ret;
+
+	switch (to_loongson_gfx(descp)->chip_id) {
+	case CHIP_LS7A1000:
+		output_port_info = &ls7a1000_output_port_desc[index];
+		break;
+	case CHIP_LS7A2000:
+		output_port_info = &ls7a2000_output_port_desc[index];
+		break;
+	default:
+		output_port_info = NULL;
+		break;
+	};
+
+	ret = loongson_create_platform_device(parent,
+					      "lsdc-output-port",
+					      index,
+					      NULL,
+					      (void *)output_port_info,
+					      ppdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * @dev: pointer to the port@0, port@1, ..., port@n of the dispplay controller
+ * @master: pointer to the component master
+ * @data: pointer to the drm device control structure
+ */
+static int lsdc_output_port_bind(struct device *dev,
+				 struct device *master,
+				 void *data)
+{
+	struct drm_device *drm = data;
+	struct lsdc_device *ldev = to_lsdc(drm);
+	const struct lsdc_kms_funcs *kms_funcs = ldev->descp->funcs;
+	struct lsdc_output *output = dev_get_drvdata(dev);
+	struct lsdc_display_pipe *dispipe;
+	unsigned int pipe;
+	int ret;
+
+	if (!output->descp)
+		return -ENODEV;
+
+	pipe = output->descp->pipe;
+	dispipe = &ldev->dispipe[pipe];
+
+	ret = kms_funcs->output_init(drm, output, ldev->i2c[pipe], pipe);
+	if (ret)
+		return ret;
+
+	dispipe->output = output;
+
+	ldev->num_output++;
+
+	drm_info(drm, "Output port-%d bound, type: %s\n",
+		 pipe, output->descp->type);
+
+	return 0;
+}
+
+static void lsdc_output_port_unbind(struct device *dev,
+				    struct device *master,
+				    void *data)
+{
+	struct drm_device *drm = data;
+	struct lsdc_device *ldev = to_lsdc(drm);
+	struct lsdc_output *output = dev_get_drvdata(dev);
+	unsigned int pipe;
+
+	pipe = output->descp->pipe;
+	ldev->dispipe[pipe].output = NULL;
+}
+
+static const struct component_ops lsdc_output_port_component_ops = {
+	.bind = lsdc_output_port_bind,
+	.unbind = lsdc_output_port_unbind,
+};
+
+static int lsdc_output_port_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lsdc_output *output;
+	struct lsdc_output_desc *descp;
+	int ret;
+
+	descp = *(void **)dev->platform_data;
+	if (!descp) {
+		dev_err(dev, "No platform specific data for output port\n");
+		return -ENODEV;
+	}
+
+	output = devm_kzalloc(dev, sizeof(*output), GFP_KERNEL);
+	if (!output)
+		return -ENOMEM;
+
+	output->dev = dev;
+	output->descp = descp;
+
+	ret = component_add(dev, &lsdc_output_port_component_ops);
+	if (ret) {
+		devm_kfree(dev, output);
+		dev_err(dev, "failed to register component: %d\n", ret);
+		return ret;
+	}
+
+	dev_set_drvdata(dev, output);
+
+	return 0;
+}
+
+static void lsdc_output_port_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lsdc_output *output;
+
+	component_del(dev, &lsdc_output_port_component_ops);
+
+	output = dev_get_drvdata(dev);
+	if (output)
+		devm_kfree(dev, output);
+}
+
+static const struct platform_device_id lsdc_output_port_ids[] = {
+	{ .name = "lsdc-output-port" },
+	{ },
+};
+
+struct platform_driver lsdc_output_port_platform_driver = {
+	.driver = {
+		.name = "lsdc-output-port",
+	},
+	.probe = lsdc_output_port_probe,
+	.remove_new = lsdc_output_port_remove,
+	.id_table = lsdc_output_port_ids,
+};
diff --git a/drivers/gpu/drm/loongson/lsdc_output.h b/drivers/gpu/drm/loongson/lsdc_output.h
index 097789051a1d..684a5b19bc70 100644
--- a/drivers/gpu/drm/loongson/lsdc_output.h
+++ b/drivers/gpu/drm/loongson/lsdc_output.h
@@ -6,16 +6,48 @@
 #ifndef __LSDC_OUTPUT_H__
 #define __LSDC_OUTPUT_H__
 
-#include "lsdc_drv.h"
+#include <drm/drm_encoder.h>
+#include <drm/drm_connector.h>
+
+struct lsdc_desc;
+
+struct lsdc_output_desc {
+	u32 pipe;
+	const char type[32];
+};
+
+struct lsdc_output {
+	struct device *dev;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	struct lsdc_output_desc *descp;
+};
+
+static inline struct lsdc_output *
+connector_to_lsdc_output(struct drm_connector *connector)
+{
+	return container_of(connector, struct lsdc_output, connector);
+}
+
+static inline struct lsdc_output *
+encoder_to_lsdc_output(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct lsdc_output, encoder);
+}
 
 int ls7a1000_output_init(struct drm_device *ddev,
-			 struct lsdc_display_pipe *dispipe,
+			 struct lsdc_output *output,
 			 struct i2c_adapter *ddc,
 			 unsigned int index);
 
 int ls7a2000_output_init(struct drm_device *ldev,
-			 struct lsdc_display_pipe *dispipe,
+			 struct lsdc_output *output,
 			 struct i2c_adapter *ddc,
 			 unsigned int index);
 
+int lsdc_output_preinit(struct device *parent,
+			const struct lsdc_desc *descp,
+			unsigned int index,
+			struct platform_device **ppdev);
+
 #endif
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
index 6fc8dd1c7d9a..f331c198e3d4 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
@@ -140,11 +140,10 @@ static const struct drm_encoder_funcs ls7a1000_encoder_funcs[2] = {
 };
 
 int ls7a1000_output_init(struct drm_device *ddev,
-			 struct lsdc_display_pipe *dispipe,
+			 struct lsdc_output *output,
 			 struct i2c_adapter *ddc,
 			 unsigned int index)
 {
-	struct lsdc_output *output = &dispipe->output;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_connector *connector = &output->connector;
 	int ret;
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
index ce3dabec887e..2a51ad214394 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
@@ -284,8 +284,7 @@ static int ls7a2000_hdmi_set_avi_infoframe(struct drm_encoder *encoder,
 					   struct drm_display_mode *mode)
 {
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->descp->pipe;
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct hdmi_avi_infoframe infoframe;
@@ -335,8 +334,7 @@ static void ls7a2000_hdmi_atomic_disable(struct drm_encoder *encoder,
 					 struct drm_atomic_state *state)
 {
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->descp->pipe;
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	u32 val;
@@ -360,8 +358,7 @@ static void ls7a2000_hdmi_atomic_enable(struct drm_encoder *encoder,
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->descp->pipe;
 	u32 val;
 
 	/* datasheet say it should larger than 48 */
@@ -482,8 +479,7 @@ static void ls7a2000_hdmi_atomic_mode_set(struct drm_encoder *encoder,
 					  struct drm_connector_state *conn_state)
 {
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->descp->pipe;
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct drm_display_mode *mode = &crtc_state->mode;
@@ -512,11 +508,10 @@ static const struct drm_encoder_helper_funcs ls7a2000_encoder_helper_funcs = {
  * writing hdmi register do no harms.
  */
 int ls7a2000_output_init(struct drm_device *ddev,
-			 struct lsdc_display_pipe *dispipe,
+			 struct lsdc_output *output,
 			 struct i2c_adapter *ddc,
 			 unsigned int pipe)
 {
-	struct lsdc_output *output = &dispipe->output;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_connector *connector = &output->connector;
 	int ret;
@@ -536,8 +531,6 @@ int ls7a2000_output_init(struct drm_device *ddev,
 	if (ret)
 		return ret;
 
-	drm_info(ddev, "display pipe-%u has HDMI %s\n", pipe, pipe ? "" : "and/or VGA");
-
 	drm_connector_helper_add(connector, &ls7a2000_connector_helpers);
 
 	drm_connector_attach_encoder(connector, encoder);
-- 
2.34.1

