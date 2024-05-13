Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8238C3990
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 02:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A6B10E36C;
	Mon, 13 May 2024 00:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="L2mxGOdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0274C10E36C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 00:15:10 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715559309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XbDiO6YYPaxcwxyfcwVmQMdXR79Kjj4cVz9n6WrUp1M=;
 b=L2mxGOdEz+jQRt8fTYjOeoF1UAJeRplykNvp7J/m1n2aRZh9bCqiWKGnRsgCrumJjtFcYb
 ksQ70enxxITvy/WlN1N9f4aY+BR7dpCNUEZKxYU9/J1/cjCixPL5FEGUpQAiU5e5qnfr9G
 HYfB533lRcVHqEbuX9S6h/g8pveDSkU=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 3/3] drm/loongson: Refactor lsdc device initialize and the
 output port
Date: Mon, 13 May 2024 08:12:43 +0800
Message-Id: <20240513001243.1739336-4-sui.jingfeng@linux.dev>
In-Reply-To: <20240513001243.1739336-1-sui.jingfeng@linux.dev>
References: <20240513001243.1739336-1-sui.jingfeng@linux.dev>
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

Move drm related device initialization into loongson_drm_master_bind(),
As we need to wait all other submodules ready before we could register
the drm device to userspace. Move output related things into subdriver,
fullfill the implement under the new framework.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/loongson/lsdc_drv.c           | 187 +++++++++---------
 drivers/gpu/drm/loongson/lsdc_drv.h           |  22 +--
 drivers/gpu/drm/loongson/lsdc_output.c        |  41 ++++
 drivers/gpu/drm/loongson/lsdc_output.h        |  16 +-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c |   3 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  15 +-
 6 files changed, 152 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index 45c30e3d178f..796da5c3c2ee 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -69,31 +69,6 @@ static int lsdc_modeset_init(struct lsdc_device *ldev,
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
 
@@ -189,30 +164,17 @@ static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
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
@@ -220,36 +182,25 @@ lsdc_create_device(struct pci_dev *pdev,
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
 
-	ret = lsdc_mode_config_init(ddev, descp);
-	if (ret)
-		return ERR_PTR(ret);
-
-	ret = lsdc_modeset_init(ldev, descp->num_of_crtc, descp->funcs,
-				loongson_vblank);
-	if (ret)
-		return ERR_PTR(ret);
-
-	drm_mode_config_reset(ddev);
-
-	return ldev;
+	return 0;
 }
 
 /* For multiple GPU driver instance co-exixt in the system */
@@ -261,20 +212,64 @@ static unsigned int lsdc_vga_set_decode(struct pci_dev *pdev, bool state)
 
 static int loongson_drm_master_bind(struct device *dev)
 {
+	struct lsdc_device *ldev = dev_get_drvdata(dev);
+	const struct lsdc_desc *descp = ldev->descp;
+	struct drm_device *ddev = &ldev->base;
 	int ret;
 
-	ret = component_bind_all(dev, NULL);
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
+	ret = lsdc_mode_config_init(ddev, descp);
+	if (ret)
+		return ret;
+
+	ret = component_bind_all(dev, ddev);
 	if (ret) {
 		dev_err(dev, "master bind all failed: %d\n", ret);
 		return ret;
 	}
 
+	ret = lsdc_modeset_init(ldev, descp->num_of_crtc, descp->funcs,
+				loongson_vblank);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(ddev);
+
+	drm_kms_helper_poll_init(ddev);
+
+	ret = drm_dev_register(ddev, 0);
+	if (ret)
+		return ret;
+
+	drm_fbdev_ttm_setup(ddev, 32);
+
 	return 0;
 }
 
 static void loongson_drm_master_unbind(struct device *dev)
 {
-	component_unbind_all(dev, NULL);
+	struct lsdc_device *ldev = dev_get_drvdata(dev);
+	struct drm_device *ddev = &ldev->base;
+
+	component_unbind_all(dev, ddev);
 
 	return;
 }
@@ -288,7 +283,6 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct component_match *matches = NULL;
 	const struct lsdc_desc *descp;
-	struct drm_device *ddev;
 	struct lsdc_device *ldev;
 	int ret;
 	int i;
@@ -310,10 +304,31 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	dev_info(&pdev->dev, "Found %s, revision: %u",
 		 to_loongson_gfx(descp)->model, pdev->revision);
 
-	ldev = lsdc_create_device(pdev, descp, &lsdc_drm_driver);
+	ldev = devm_drm_dev_alloc(&pdev->dev, &lsdc_drm_driver,
+				  struct lsdc_device, base);
 	if (IS_ERR(ldev))
 		return PTR_ERR(ldev);
 
+	pci_set_drvdata(pdev, ldev);
+
+	ldev->dc = pdev;
+	ldev->descp = descp;
+
+	loongson_gfxpll_create(&ldev->base, &ldev->gfxpll);
+
+	ret = lsdc_device_init(ldev, descp, &lsdc_drm_driver);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < descp->num_of_crtc; ++i) {
+		struct lsdc_display_pipe *dispipe = &ldev->dispipe[i];
+		const struct lsdc_kms_funcs *funcs = descp->funcs;
+
+		ret = funcs->create_i2c(&ldev->base, dispipe, i);
+		if (ret)
+			return ret;
+	}
+
 	for (i = 0; i < descp->num_of_crtc; ++i) {
 		ret = lsdc_output_preinit(&pdev->dev, descp, i,
 					  &ldev->childs[i]);
@@ -333,44 +348,15 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	dev_info(&pdev->dev, "loongson add component: %u\n", ret);
 
-	ddev = &ldev->base;
-
-	pci_set_drvdata(pdev, ddev);
-
 	vga_client_register(pdev, lsdc_vga_set_decode);
 
-	drm_kms_helper_poll_init(ddev);
-
-	if (loongson_vblank) {
-		ret = drm_vblank_init(ddev, descp->num_of_crtc);
-		if (ret)
-			return ret;
-
-		ret = devm_request_irq(&pdev->dev, pdev->irq,
-				       descp->funcs->irq_handler,
-				       IRQF_SHARED,
-				       dev_name(&pdev->dev), ddev);
-		if (ret) {
-			drm_err(ddev, "Failed to register interrupt: %d\n", ret);
-			return ret;
-		}
-
-		drm_info(ddev, "registered irq: %u\n", pdev->irq);
-	}
-
-	ret = drm_dev_register(ddev, 0);
-	if (ret)
-		return ret;
-
-	drm_fbdev_ttm_setup(ddev, 32);
-
 	return 0;
 }
 
 static void lsdc_pci_remove(struct pci_dev *pdev)
 {
-	struct drm_device *ddev = pci_get_drvdata(pdev);
-	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+	struct drm_device *ddev = &ldev->base;
 	unsigned int i;
 
 	drm_dev_unregister(ddev);
@@ -388,7 +374,10 @@ static void lsdc_pci_remove(struct pci_dev *pdev)
 
 static void lsdc_pci_shutdown(struct pci_dev *pdev)
 {
-	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+	struct drm_device *ddev = &ldev->base;
+
+	drm_atomic_helper_shutdown(ddev);
 }
 
 static int lsdc_drm_freeze(struct drm_device *ddev)
@@ -442,7 +431,8 @@ static int lsdc_drm_freeze(struct drm_device *ddev)
 static int lsdc_drm_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *ddev = pci_get_drvdata(pdev);
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+	struct drm_device *ddev = &ldev->base;
 
 	return drm_mode_config_helper_resume(ddev);
 }
@@ -450,7 +440,8 @@ static int lsdc_drm_resume(struct device *dev)
 static int lsdc_pm_freeze(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *ddev = pci_get_drvdata(pdev);
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+	struct drm_device *ddev = &ldev->base;
 
 	return lsdc_drm_freeze(ddev);
 }
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
index 86061207851d..2a291a4a0827 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.h
+++ b/drivers/gpu/drm/loongson/lsdc_drv.h
@@ -173,33 +173,15 @@ struct lsdc_cursor {
 	struct lsdc_device *ldev;
 };
 
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
+	struct lsdc_output *output;
 	struct lsdc_i2c *li2c;
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
 
@@ -208,7 +190,7 @@ struct lsdc_kms_funcs {
 			  unsigned int index);
 
 	int (*output_init)(struct drm_device *ddev,
-			   struct lsdc_display_pipe *dispipe,
+			   struct lsdc_output *output,
 			   struct i2c_adapter *ddc,
 			   unsigned int index);
 
diff --git a/drivers/gpu/drm/loongson/lsdc_output.c b/drivers/gpu/drm/loongson/lsdc_output.c
index b1a9c6123615..28639a1e4407 100644
--- a/drivers/gpu/drm/loongson/lsdc_output.c
+++ b/drivers/gpu/drm/loongson/lsdc_output.c
@@ -62,6 +62,30 @@ int lsdc_output_preinit(struct device *parent,
 	return 0;
 }
 
+static int lsdc_output_postinit(struct lsdc_output *output,
+				struct drm_device *ddev,
+				struct lsdc_display_pipe *dispipe,
+				unsigned int pipe)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_kms_funcs *kms_funcs = ldev->descp->funcs;
+	struct i2c_adapter *ddc = NULL;
+	int ret;
+
+	if (dispipe->li2c)
+		ddc = &dispipe->li2c->adapter;
+
+	pipe = output->descp->pipe;
+
+	ret = kms_funcs->output_init(&ldev->base, output, ddc, pipe);
+	if (ret)
+		return ret;
+
+	dispipe->output = output;
+
+	return 0;
+}
+
 /*
  * dev stand for the port@0, port@1, ..., port@n of the dispplay controller
  */
@@ -69,6 +93,23 @@ static int lsdc_output_port_bind(struct device *dev,
 				 struct device *master,
 				 void *data)
 {
+	struct lsdc_output *output = dev_get_drvdata(dev);
+	struct drm_device *ddev = data;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	unsigned int pipe;
+	int ret;
+
+	pipe = output->descp->pipe;
+
+	ret = lsdc_output_postinit(output, ddev, &ldev->dispipe[pipe], pipe);
+	if (ret)
+		return ret;
+
+	ldev->num_output++;
+
+	drm_info(ddev, "Output port-%d bound, type: %s\n",
+		 pipe, output->descp->type);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/loongson/lsdc_output.h b/drivers/gpu/drm/loongson/lsdc_output.h
index 195b74da194d..684a5b19bc70 100644
--- a/drivers/gpu/drm/loongson/lsdc_output.h
+++ b/drivers/gpu/drm/loongson/lsdc_output.h
@@ -23,13 +23,25 @@ struct lsdc_output {
 	struct lsdc_output_desc *descp;
 };
 
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
+
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
index ce3dabec887e..a81852939d23 100644
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
-- 
2.34.1

