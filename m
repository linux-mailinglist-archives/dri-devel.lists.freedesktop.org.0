Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA64F1326
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 12:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA9E10EDFB;
	Mon,  4 Apr 2022 10:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id B028C10EDFB;
 Mon,  4 Apr 2022 10:31:14 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:33812.235363298
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 0CA6310028A;
 Mon,  4 Apr 2022 18:31:12 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 70e9acd5097745769af33dd612376fdc for l.stach@pengutronix.de; 
 Mon, 04 Apr 2022 18:31:14 CST
X-Transaction-ID: 70e9acd5097745769af33dd612376fdc
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] drm/etnaviv: add pci device driver support
Date: Mon,  4 Apr 2022 18:31:06 +0800
Message-Id: <20220404103106.1970456-3-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404103106.1970456-1-15330273260@189.cn>
References: <20220404103106.1970456-1-15330273260@189.cn>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  There is a Vivante GC1000(V5037)in LS2K1000 and LS7A1000,
  the gpu in these chips is a PCI device. This patch provide PCI
  device driver support.
                                                             __  AMDGPU
                                  LS7A1000 Bridge Chip        |__________
    +------+            +----------------------------------+  |    ***  |
    | DDR4 |            |  +---------------+  PCIe Bridge  |  |--____--_|
    +------+            |  | PCIe Root Bus |--------------------++++++++-->
       || MC0           |  +--+--------+---+  Gen 2.2 x 8  | PCIe x8 Slot
       ||               |     | ______________________     |
  +----------+  HT 3.0  |     ||       0x7a06         |    |
  | LS3A4000 |<-------->| +---++---+  +------+   +---------+   +------+
  |   CPU    |<-------->| | GC1000 |  | LSDC |<->| DDR3 MC |<->| VRAM |
  +----------+          | +--------+  +-+--+-+   +---------+   +------+
       ||               |   0x7a15      |  |               |
       || MC1           +---------------|--|---------------+
    +------+                            |  |
    | DDR4 |          +---------+  DVO0 |  | DVO1  +--------+
    +------+   VGA <--| GM7123C |<------+  +------>| LT8618 |---> HDMI
                      +---------+                  +--------+

  LS7A1000 is a bridge chip, this bridge chip typically use
  with LS3A4000 (4 core 1.8gHz, Mips64r5) and LS3A5000 (4 core
  loongarch 2.5Ghz). While LS2K1000 is a double core 1.0Ghz
  Mips64r2 SoC.

  LS7A1000/LS2K1000 has a display controller integrated, named lsdc.
  After apply this patch, the etnaviv driver can be used on our mips
  platform.

Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 drivers/gpu/drm/etnaviv/Kconfig           | 10 +++
 drivers/gpu/drm/etnaviv/Makefile          |  2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c     | 30 ++++++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c     | 65 ++++++++++++------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h     |  4 ++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 83 +++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h | 15 ++++
 7 files changed, 182 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h

diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kconfig
index faa7fc68b009..4b7f630bb990 100644
--- a/drivers/gpu/drm/etnaviv/Kconfig
+++ b/drivers/gpu/drm/etnaviv/Kconfig
@@ -15,6 +15,16 @@ config DRM_ETNAVIV
 	help
 	  DRM driver for Vivante GPUs.
 
+config DRM_ETNAVIV_PCI_DRIVER
+	bool "Enable support for PCI GPU core In LS7A1000/LS2K1000"
+	depends on DRM_ETNAVIV
+	depends on PCI
+	depends on MACH_LOONGSON64
+	default y
+	help
+	  DRM PCI driver for Vivante GC1000 GPU in LS7A1000 bridge chip
+	  and LS2K1000 SoC. If in doubt, say "n".
+
 config DRM_ETNAVIV_THERMAL
 	bool "enable ETNAVIV thermal throttling"
 	depends on DRM_ETNAVIV
diff --git a/drivers/gpu/drm/etnaviv/Makefile b/drivers/gpu/drm/etnaviv/Makefile
index 46e5ffad69a6..6829e1ebf2db 100644
--- a/drivers/gpu/drm/etnaviv/Makefile
+++ b/drivers/gpu/drm/etnaviv/Makefile
@@ -16,4 +16,6 @@ etnaviv-y := \
 	etnaviv_perfmon.o \
 	etnaviv_sched.o
 
+etnaviv-$(CONFIG_DRM_ETNAVIV_PCI_DRIVER) += etnaviv_pci_drv.o
+
 obj-$(CONFIG_DRM_ETNAVIV)	+= etnaviv.o
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 69d879e623b8..3f612e1a56ff 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -23,6 +23,10 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+#include "etnaviv_pci_drv.h"
+#endif
+
 /*
  * DRM operations:
  */
@@ -606,11 +610,13 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 						   compare_of, core_node);
 		}
 	} else {
-		char **names = dev->platform_data;
+		char **names = (char **)dev->platform_data;
 		unsigned i;
 
-		for (i = 0; names[i]; i++)
+		for (i = 0; names[i]; i++) {
 			component_match_add(dev, &match, compare_str, names[i]);
+			dev_info(dev, "component match %s added\n", names[i]);
+		}
 	}
 
 	/*
@@ -625,9 +631,9 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	 * bit to make sure we are allocating the command buffers and
 	 * TLBs in the lower 4 GiB address space.
 	 */
-	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(40)) ||
-	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32))) {
-		dev_dbg(&pdev->dev, "No suitable DMA available\n");
+	if (dma_set_mask(dev, DMA_BIT_MASK(40)) ||
+	    dma_set_coherent_mask(dev, DMA_BIT_MASK(32))) {
+		dev_dbg(dev, "No suitable DMA available\n");
 		return -ENODEV;
 	}
 
@@ -637,7 +643,7 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	 * GPUs in the system share the same DMA constraints.
 	 */
 	if (first_node)
-		of_dma_configure(&pdev->dev, first_node, true);
+		of_dma_configure(dev, first_node, true);
 
 	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
 }
@@ -704,6 +710,12 @@ static int __init etnaviv_init(void)
 	if (ret != 0)
 		goto unregister_gpu_driver;
 
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+	ret = pci_register_driver(&etnaviv_pci_driver);
+	if (ret != 0)
+		goto unregister_platform_driver;
+#endif
+
 	/*
 	 * If the DT contains at least one available GPU device, instantiate
 	 * the DRM platform device.
@@ -724,6 +736,9 @@ static int __init etnaviv_init(void)
 	return 0;
 
 unregister_platform_driver:
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+	pci_unregister_driver(&etnaviv_pci_driver);
+#endif
 	platform_driver_unregister(&etnaviv_platform_driver);
 unregister_gpu_driver:
 	platform_driver_unregister(&etnaviv_gpu_driver);
@@ -734,6 +749,9 @@ module_init(etnaviv_init);
 static void __exit etnaviv_exit(void)
 {
 	platform_device_unregister(etnaviv_drm);
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+	pci_unregister_driver(&etnaviv_pci_driver);
+#endif
 	platform_driver_unregister(&etnaviv_platform_driver);
 	platform_driver_unregister(&etnaviv_gpu_driver);
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index d607be474aeb..d8ea8c3eea19 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1800,19 +1800,10 @@ static const struct of_device_id etnaviv_gpu_match[] = {
 };
 MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
 
-static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
+static int etnaviv_gpu_platform_constructor(struct etnaviv_gpu *gpu,
+					    struct device *dev)
 {
-	struct device *dev = &pdev->dev;
-	struct etnaviv_gpu *gpu;
-	int err;
-
-	gpu = devm_kzalloc(dev, sizeof(*gpu), GFP_KERNEL);
-	if (!gpu)
-		return -ENOMEM;
-
-	gpu->dev = &pdev->dev;
-	mutex_init(&gpu->lock);
-	mutex_init(&gpu->fence_lock);
+	struct platform_device *pdev = to_platform_device(dev);
 
 	/* Map registers: */
 	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
@@ -1824,7 +1815,28 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	if (gpu->irq < 0)
 		return gpu->irq;
 
-	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
+	return 0;
+}
+
+int etnaviv_gpu_probe(struct device *dev,
+		      int (*pfn)(struct etnaviv_gpu *gpu, struct device *dev))
+{
+	struct etnaviv_gpu *gpu;
+	int err;
+
+	gpu = devm_kzalloc(dev, sizeof(*gpu), GFP_KERNEL);
+	if (!gpu)
+		return -ENOMEM;
+
+	gpu->dev = dev;
+	mutex_init(&gpu->lock);
+	mutex_init(&gpu->fence_lock);
+
+	err = pfn(gpu, dev);
+	if (err)
+		return err;
+
+	err = devm_request_irq(dev, gpu->irq, irq_handler, 0,
 			       dev_name(gpu->dev), gpu);
 	if (err) {
 		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
@@ -1842,26 +1854,37 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	 * autosuspend delay is rather arbitary: no measurements have
 	 * yet been performed to determine an appropriate value.
 	 */
-	pm_runtime_use_autosuspend(gpu->dev);
-	pm_runtime_set_autosuspend_delay(gpu->dev, 200);
-	pm_runtime_enable(gpu->dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 200);
+	pm_runtime_enable(dev);
 
-	err = component_add(&pdev->dev, &gpu_ops);
+	err = component_add(dev, &gpu_ops);
 	if (err < 0) {
-		dev_err(&pdev->dev, "failed to register component: %d\n", err);
+		dev_err(dev, "failed to register component: %d\n", err);
 		return err;
 	}
 
 	return 0;
 }
 
-static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
+static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 {
-	component_del(&pdev->dev, &gpu_ops);
-	pm_runtime_disable(&pdev->dev);
+	return etnaviv_gpu_probe(&pdev->dev, etnaviv_gpu_platform_constructor);
+}
+
+int etnaviv_gpu_remove(struct device *dev)
+{
+	component_del(dev, &gpu_ops);
+	pm_runtime_disable(dev);
+
 	return 0;
 }
 
+static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
+{
+	return etnaviv_gpu_remove(&pdev->dev);
+}
+
 #ifdef CONFIG_PM
 static int etnaviv_gpu_rpm_suspend(struct device *dev)
 {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 85eddd492774..4d0554cc1945 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -181,6 +181,10 @@ void etnaviv_gpu_pm_put(struct etnaviv_gpu *gpu);
 int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms);
 void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch);
 
+int etnaviv_gpu_probe(struct device *dev,
+		      int (*pfn)(struct etnaviv_gpu *gpu, struct device *dev));
+int etnaviv_gpu_remove(struct device *dev);
+
 extern struct platform_driver etnaviv_gpu_driver;
 
 #endif /* __ETNAVIV_GPU_H__ */
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
new file mode 100644
index 000000000000..8843edd0597b
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015-2018 Etnaviv Project
+ */
+
+#include <linux/pci.h>
+
+#include "etnaviv_drv.h"
+#include "etnaviv_gpu.h"
+#include "etnaviv_pci_drv.h"
+
+static const char *gpu_device_names[] = {
+	0,
+	0,  /* MUST end with a NULL here */
+};
+
+static int etnaviv_gpu_pci_constructor(struct etnaviv_gpu *gpu,
+				       struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	/* gpu bar 0 contain registers */
+	gpu->mmio = devm_ioremap_resource(dev, &pdev->resource[0]);
+	if (IS_ERR(gpu->mmio))
+		return PTR_ERR(gpu->mmio);
+
+	gpu->irq = pdev->irq;
+
+	dev_info(&pdev->dev, "%s:irq=%d\n", __func__, gpu->irq);
+
+	return 0;
+}
+
+static int etnaviv_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	struct device * const dev = &pdev->dev;
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		dev_err(dev, "failed to enable this PCI device\n");
+		return ret;
+	}
+
+	pci_set_master(pdev);
+
+	ret = etnaviv_gpu_probe(dev, etnaviv_gpu_pci_constructor);
+	if (ret) {
+		dev_err(dev, "failed to create GPU instance\n");
+		return ret;
+	}
+
+	/* It's 0000:00:06.0 for GC1000 in LS7A1000 */
+	dev_dbg(dev, "name = %s\n", dev_name(dev));
+
+	/* It seems that we have only one gpu core */
+	gpu_device_names[0] = dev_name(dev);
+
+	/* Instantiate the DRM platform device */
+	return etnaviv_create_platform_device("etnaviv",
+					      gpu_device_names,
+					      ARRAY_SIZE(gpu_device_names));
+}
+
+static void etnaviv_pci_remove(struct pci_dev *pdev)
+{
+	etnaviv_gpu_remove(&pdev->dev);
+}
+
+static const struct pci_device_id etnaviv_pci_id_lists[] = {
+	{0x0014, 0x7a15, PCI_ANY_ID, PCI_ANY_ID, 0, 0, GC1000_IN_LS7A1000},
+	{0x0014, 0x7a05, PCI_ANY_ID, PCI_ANY_ID, 0, 0, GC1000_IN_LS2K1000},
+	{0, 0, 0, 0, 0, 0, 0}
+};
+
+struct pci_driver etnaviv_pci_driver = {
+	.name = "etnaviv",
+	.id_table = etnaviv_pci_id_lists,
+	.probe = etnaviv_pci_probe,
+	.remove = etnaviv_pci_remove,
+};
+
+MODULE_DEVICE_TABLE(pci, etnaviv_pci_id_lists);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
new file mode 100644
index 000000000000..5aa54340bff3
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ETNAVIV_PCI_DRV_H__
+#define __ETNAVIV_PCI_DRV_H__
+
+#include <linux/pci.h>
+
+enum vivante_pci_gpu_family {
+	GC1000_IN_LS7A1000 = 0,
+	GC1000_IN_LS2K1000 = 1,
+	CHIP_LAST,
+};
+
+extern struct pci_driver etnaviv_pci_driver;
+#endif
-- 
2.25.1

