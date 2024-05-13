Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8182C8C398E
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 02:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C253E10E330;
	Mon, 13 May 2024 00:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="WTOYWcRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F5110E330
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 00:14:46 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715559284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FosN8AJZZ0vwxsKhagS4hdt1OIJWrMoEgJv1L3If2Xc=;
 b=WTOYWcRXo2/DrRgqvmrfr2EhotGBYpufsq8/9YOnoqSVGjZ5WjWeRKMeeiq8X581oy/oOn
 WoTQNfpBh8cRQ5Q5fqIQuba54/7occZT2GfpBxsE6sqo89804hJybyZCaE9htN8a5qimPv
 BGGVf/uhT9CRwclxE0HJrYtoEs5gEd4=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 2/3] drm/loongson: Introduce component framework support
Date: Mon, 13 May 2024 08:12:42 +0800
Message-Id: <20240513001243.1739336-3-sui.jingfeng@linux.dev>
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

Introduce the component framework to bind childs and siblings, for better
modularity and paper over the deferral probe problems if it need to attach
exterinal module someday. Hardware units come with PCI(e) are actually all
ready to drive, but there has some board specific modules will return
-EPROBE_DEFER. We need all other submodules ready to attach before we can
register the drm device to userspace.

The idea is to devide the exterinal module dependent part and exterinal
module independent part clearly, for example, the display controller and
the builtin GPIO-I2C just belong to exterinal module independent part.
While the output is belong to exterinal module dependent part.

Also for better reflecting the hardware, we intend to abstract the output
ports as child devices. The output ports may consists of encoder phy and
level shift, while the GPU and VPU are standalone siblings. As those units
are relative separate hardware units from display controller itself.

By design, the display controller PCI(e) is selected as the component
master, gpio-i2c go with master. The manually created virtual child device
are functional as agents for the master, it could return the -EPROBE_DEFER
back to the component core. This allows the master don't have to tear down
everything, the majority setups work can be preserved. The potential cyclic
dependency problem can be solved with such framework.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/loongson/Makefile          |   1 +
 drivers/gpu/drm/loongson/loongson_module.c |  17 ++-
 drivers/gpu/drm/loongson/loongson_module.h |   1 +
 drivers/gpu/drm/loongson/lsdc_drv.c        |  59 +++++++++
 drivers/gpu/drm/loongson/lsdc_drv.h        |   6 +-
 drivers/gpu/drm/loongson/lsdc_output.c     | 142 +++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h     |  22 +++-
 7 files changed, 241 insertions(+), 7 deletions(-)
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
index adc7344d2f80..45c30e3d178f 100644
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
@@ -257,12 +259,39 @@ static unsigned int lsdc_vga_set_decode(struct pci_dev *pdev, bool state)
 	return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
 }
 
+static int loongson_drm_master_bind(struct device *dev)
+{
+	int ret;
+
+	ret = component_bind_all(dev, NULL);
+	if (ret) {
+		dev_err(dev, "master bind all failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void loongson_drm_master_unbind(struct device *dev)
+{
+	component_unbind_all(dev, NULL);
+
+	return;
+}
+
+const struct component_master_ops loongson_drm_master_ops = {
+	.bind = loongson_drm_master_bind,
+	.unbind = loongson_drm_master_unbind,
+};
+
 static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
+	struct component_match *matches = NULL;
 	const struct lsdc_desc *descp;
 	struct drm_device *ddev;
 	struct lsdc_device *ldev;
 	int ret;
+	int i;
 
 	descp = lsdc_device_probe(pdev, ent->driver_data);
 	if (IS_ERR_OR_NULL(descp))
@@ -285,6 +314,25 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(ldev))
 		return PTR_ERR(ldev);
 
+	for (i = 0; i < descp->num_of_crtc; ++i) {
+		ret = lsdc_output_preinit(&pdev->dev, descp, i,
+					  &ldev->childs[i]);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < descp->num_of_crtc; ++i) {
+		component_match_add(&pdev->dev, &matches,
+				    component_compare_dev,
+				    &ldev->childs[i]->dev);
+	}
+
+	ret = component_master_add_with_match(&pdev->dev,
+					      &loongson_drm_master_ops,
+					      matches);
+
+	dev_info(&pdev->dev, "loongson add component: %u\n", ret);
+
 	ddev = &ldev->base;
 
 	pci_set_drvdata(pdev, ddev);
@@ -322,9 +370,20 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 static void lsdc_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *ddev = pci_get_drvdata(pdev);
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	unsigned int i;
 
 	drm_dev_unregister(ddev);
 	drm_atomic_helper_shutdown(ddev);
+
+	component_master_del(&pdev->dev, &loongson_drm_master_ops);
+
+	for (i = 0; i < ldev->descp->num_of_crtc; ++i) {
+		if (ldev->childs[i]) {
+			platform_device_unregister(ldev->childs[i]);
+			ldev->childs[i] = NULL;
+		}
+	}
 }
 
 static void lsdc_pci_shutdown(struct pci_dev *pdev)
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
index a2c6b496a69f..86061207851d 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.h
+++ b/drivers/gpu/drm/loongson/lsdc_drv.h
@@ -173,11 +173,6 @@ struct lsdc_cursor {
 	struct lsdc_device *ldev;
 };
 
-struct lsdc_output {
-	struct drm_encoder encoder;
-	struct drm_connector connector;
-};
-
 static inline struct lsdc_output *
 connector_to_lsdc_output(struct drm_connector *connector)
 {
@@ -290,6 +285,7 @@ struct lsdc_device {
 	resource_size_t gtt_size;
 
 	struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
+	struct platform_device *childs[LSDC_NUM_CRTC];
 
 	struct lsdc_gem gem;
 
diff --git a/drivers/gpu/drm/loongson/lsdc_output.c b/drivers/gpu/drm/loongson/lsdc_output.c
new file mode 100644
index 000000000000..b1a9c6123615
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_output.c
@@ -0,0 +1,142 @@
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
+ * dev stand for the port@0, port@1, ..., port@n of the dispplay controller
+ */
+static int lsdc_output_port_bind(struct device *dev,
+				 struct device *master,
+				 void *data)
+{
+	return 0;
+}
+
+static void lsdc_output_port_unbind(struct device *dev,
+				    struct device *master,
+				    void *data)
+{
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
index 097789051a1d..195b74da194d 100644
--- a/drivers/gpu/drm/loongson/lsdc_output.h
+++ b/drivers/gpu/drm/loongson/lsdc_output.h
@@ -6,7 +6,22 @@
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
 
 int ls7a1000_output_init(struct drm_device *ddev,
 			 struct lsdc_display_pipe *dispipe,
@@ -18,4 +33,9 @@ int ls7a2000_output_init(struct drm_device *ldev,
 			 struct i2c_adapter *ddc,
 			 unsigned int index);
 
+int lsdc_output_preinit(struct device *parent,
+			const struct lsdc_desc *descp,
+			unsigned int index,
+			struct platform_device **ppdev);
+
 #endif
-- 
2.34.1

