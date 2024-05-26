Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F54B8CF5D9
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 21:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5E810F590;
	Sun, 26 May 2024 19:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="TLL53IFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BCA10E8E6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 19:59:26 +0000 (UTC)
X-Envelope-To: maarten.lankhorst@linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716753564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/n4E/8dKss1V53bPmteb/uJoTEVn1ZKT3Z/CMITNyZA=;
 b=TLL53IFBCigsRowjINEAZvZVF9Q649kCLfv0F5sADBu83t1tsabVyXDx0y84ioCpfjE44v
 mEhYfCSfIVf1GSaFb06dTsXv4tRb9mEwTkpPbuOWUUCn1P0ed0wi75nRxvuorr0w6FQqTB
 wKSmceoyR/rQFirFdICWHZ7kf3ZwjD4=
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
Subject: [PATCH v2 3/3] drm/loongson: Add dummy gpu driver as a subcomponent
Date: Mon, 27 May 2024 03:58:26 +0800
Message-Id: <20240526195826.109008-4-sui.jingfeng@linux.dev>
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

Loongson Graphics are PCIe multi-functional devices, the GPU device and
the display controller are two distinct devices. Drivers of them should
loose coupling, but still be able to works togather to provide a unified
service to userspace.

Add a dummy driver for the GPU, it functional as a subcomponent as well.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/loongson/Makefile            |  3 +
 drivers/gpu/drm/loongson/loong_gpu_pci_drv.c | 90 ++++++++++++++++++++
 drivers/gpu/drm/loongson/loong_gpu_pci_drv.h | 27 ++++++
 drivers/gpu/drm/loongson/loongson_module.c   |  9 ++
 drivers/gpu/drm/loongson/loongson_module.h   |  7 ++
 drivers/gpu/drm/loongson/lsdc_drv.c          | 12 ++-
 drivers/gpu/drm/loongson/lsdc_drv.h          |  8 +-
 7 files changed, 149 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/loongson/loong_gpu_pci_drv.c
 create mode 100644 drivers/gpu/drm/loongson/loong_gpu_pci_drv.h

diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
index e15cb9bff378..4f4c1c42bbba 100644
--- a/drivers/gpu/drm/loongson/Makefile
+++ b/drivers/gpu/drm/loongson/Makefile
@@ -17,6 +17,9 @@ loongson-y := \
 	lsdc_probe.o \
 	lsdc_ttm.o
 
+loongson-y += \
+	loong_gpu_pci_drv.o
+
 loongson-y += loongson_device.o \
 	      loongson_module.o
 
diff --git a/drivers/gpu/drm/loongson/loong_gpu_pci_drv.c b/drivers/gpu/drm/loongson/loong_gpu_pci_drv.c
new file mode 100644
index 000000000000..4ae6a5807d1d
--- /dev/null
+++ b/drivers/gpu/drm/loongson/loong_gpu_pci_drv.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/component.h>
+#include <linux/pci.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+
+#include "loongson_module.h"
+#include "loong_gpu_pci_drv.h"
+
+static int loong_gpu_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm = data;
+	struct loong_gpu_device *gpu;
+	u32 hw_info;
+	u8 host_id;
+	u8 revision;
+
+	gpu = devm_kzalloc(dev, sizeof(*gpu), GFP_KERNEL);
+	if (!gpu)
+		return -ENOMEM;
+
+	gpu->reg_base = pcim_iomap(to_pci_dev(dev), 0, 0);
+	if (!gpu->reg_base)
+		return -ENOMEM;
+
+	hw_info = loong_rreg32(gpu, 0x8C);
+
+	gpu->ver_major = (hw_info >> 8) * 0x0F;
+	gpu->ver_minor = (hw_info & 0xF0) >> 4;
+	revision = hw_info & 0x0F;
+	host_id = (hw_info >> 16) & 0xFF;
+
+	drm_info(drm, "Found LoongGPU: LG%x%x0, revision: %x, Host: %s\n",
+		 gpu->ver_major, gpu->ver_minor, revision,
+		 host_id ? "LS2K2000" : "LS7A2000");
+
+	dev_set_drvdata(dev, gpu);
+
+	return 0;
+}
+
+static void loong_gpu_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct loong_gpu_device *gpu = dev_get_drvdata(dev);
+
+	if (gpu) {
+		pcim_iounmap(to_pci_dev(dev), gpu->reg_base);
+		devm_kfree(dev, gpu);
+	}
+}
+
+static const struct component_ops loong_gpu_component_ops = {
+	.bind = loong_gpu_bind,
+	.unbind = loong_gpu_unbind,
+};
+
+static int loong_gpu_pci_probe(struct pci_dev *pdev,
+			       const struct pci_device_id *ent)
+{
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	return component_add(&pdev->dev, &loong_gpu_component_ops);
+}
+
+static void loong_gpu_pci_remove(struct pci_dev *pdev)
+{
+	component_del(&pdev->dev, &loong_gpu_component_ops);
+}
+
+static const struct pci_device_id loong_gpu_pci_id_list[] = {
+	{PCI_VDEVICE(LOONGSON, 0x7a25), CHIP_LS7A2000},
+	{ },
+};
+
+struct pci_driver loong_gpu_pci_driver = {
+	.name = "loong",
+	.id_table = loong_gpu_pci_id_list,
+	.probe = loong_gpu_pci_probe,
+	.remove = loong_gpu_pci_remove,
+};
+
+MODULE_DEVICE_TABLE(pci, loong_gpu_pci_id_list);
diff --git a/drivers/gpu/drm/loongson/loong_gpu_pci_drv.h b/drivers/gpu/drm/loongson/loong_gpu_pci_drv.h
new file mode 100644
index 000000000000..f620820ab263
--- /dev/null
+++ b/drivers/gpu/drm/loongson/loong_gpu_pci_drv.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __LOONG_GPU_PCI_DRV_H__
+#define __LOONG_GPU_PCI_DRV_H__
+
+#include <linux/pci.h>
+
+struct loong_gpu_device {
+	struct pci_dev *pdev;
+	void __iomem *reg_base;
+
+	u32 ver_major;
+	u32 ver_minor;
+	u32 revision;
+};
+
+static inline u32 loong_rreg32(struct loong_gpu_device *ldev, u32 offset)
+{
+	return readl(ldev->reg_base + offset);
+}
+
+static inline void loong_wreg32(struct loong_gpu_device *ldev, u32 offset, u32 val)
+{
+	writel(val, ldev->reg_base + offset);
+}
+
+#endif
diff --git a/drivers/gpu/drm/loongson/loongson_module.c b/drivers/gpu/drm/loongson/loongson_module.c
index 037fa7ffe9c9..d4c0d5cec856 100644
--- a/drivers/gpu/drm/loongson/loongson_module.c
+++ b/drivers/gpu/drm/loongson/loongson_module.c
@@ -29,8 +29,15 @@ static int __init loongson_module_init(void)
 	if (ret)
 		return ret;
 
+	ret = pci_register_driver(&loong_gpu_pci_driver);
+	if (ret) {
+		platform_driver_unregister(&lsdc_output_port_platform_driver);
+		return ret;
+	}
+
 	ret = pci_register_driver(&lsdc_pci_driver);
 	if (ret) {
+		pci_unregister_driver(&loong_gpu_pci_driver);
 		platform_driver_unregister(&lsdc_output_port_platform_driver);
 		return ret;
 	}
@@ -43,6 +50,8 @@ static void __exit loongson_module_exit(void)
 {
 	pci_unregister_driver(&lsdc_pci_driver);
 
+	pci_unregister_driver(&loong_gpu_pci_driver);
+
 	platform_driver_unregister(&lsdc_output_port_platform_driver);
 }
 module_exit(loongson_module_exit);
diff --git a/drivers/gpu/drm/loongson/loongson_module.h b/drivers/gpu/drm/loongson/loongson_module.h
index 8dc71b98f5cc..ac4ff8ea50ca 100644
--- a/drivers/gpu/drm/loongson/loongson_module.h
+++ b/drivers/gpu/drm/loongson/loongson_module.h
@@ -6,8 +6,15 @@
 #ifndef __LOONGSON_MODULE_H__
 #define __LOONGSON_MODULE_H__
 
+enum loongson_chip_id {
+	CHIP_LS7A1000 = 0,
+	CHIP_LS7A2000 = 1,
+	CHIP_LS_LAST,
+};
+
 extern int loongson_vblank;
 extern struct pci_driver lsdc_pci_driver;
+extern struct pci_driver loong_gpu_pci_driver;
 extern struct platform_driver lsdc_output_port_platform_driver;
 
 #endif
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index 02429c95bd1a..ab258de6a264 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -154,9 +154,10 @@ static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
 	base = pci_resource_start(pdev_gpu, 2);
 	size = pci_resource_len(pdev_gpu, 2);
 
+	pci_dev_put(pdev_gpu);
+
 	ldev->vram_base = base;
 	ldev->vram_size = size;
-	ldev->gpu = pdev_gpu;
 
 	drm_info(ddev, "Dedicated vram start: 0x%llx, size: %uMiB\n",
 		 (u64)base, (u32)(size >> 20));
@@ -281,6 +282,7 @@ static const struct component_master_ops loongson_drm_master_ops = {
 
 static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
+	struct pci_dev *gpu = NULL;
 	struct component_match *matches = NULL;
 	const struct lsdc_desc *descp;
 	struct lsdc_device *ldev;
@@ -339,6 +341,14 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 				    &ldev->child[i]->dev);
 	}
 
+	gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7a25, NULL);
+	if (gpu) {
+		component_match_add(&pdev->dev, &matches,
+				    component_compare_dev,
+				    &gpu->dev);
+		pci_dev_put(gpu);
+	}
+
 	ret = component_master_add_with_match(&pdev->dev,
 					      &loongson_drm_master_ops,
 					      matches);
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
index 267fcba74572..770c7819caa2 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.h
+++ b/drivers/gpu/drm/loongson/lsdc_drv.h
@@ -16,6 +16,8 @@
 #include <drm/drm_plane.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "loongson_module.h"
+
 #include "lsdc_i2c.h"
 #include "lsdc_irq.h"
 #include "lsdc_gfxpll.h"
@@ -38,12 +40,6 @@
  * display pipe 1 = crtc1 + dvo1 + encoder1 + connectro1 + cursor1 + primary1
  */
 
-enum loongson_chip_id {
-	CHIP_LS7A1000 = 0,
-	CHIP_LS7A2000 = 1,
-	CHIP_LS_LAST,
-};
-
 const struct lsdc_desc *
 lsdc_device_probe(struct pci_dev *pdev, enum loongson_chip_id chip);
 
-- 
2.34.1

