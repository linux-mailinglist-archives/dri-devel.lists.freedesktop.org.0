Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65BD8C955F
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 18:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE37510E2D8;
	Sun, 19 May 2024 16:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="T6oBLJen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696F110E2D8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 16:56:22 +0000 (UTC)
X-Envelope-To: l.stach@pengutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716137780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lv5jd6YpkxTgUWKKDJB7a8iSYY106QolNH90JNd3E68=;
 b=T6oBLJen2ATEOekueDtdB73oWxqXFf5EZl9koIGBL+W74DmXuZw+lDsSDG9KLHYJktRSpZ
 5Tn3BJYgPfM8/Q6xVQVE3dRJop+PqnZ3v646/cb+GYObD5wc32uMNwl75UckGGWJFnmle0
 oxTv7rDGEbyuXSO9sudc5PrPo4rG2uA=
X-Envelope-To: linux+etnaviv@armlinux.org.uk
X-Envelope-To: christian.gmeiner@gmail.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: etnaviv@lists.freedesktop.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [etnaviv-next v14 8/8] drm/etnaviv: Add support for vivante GPU cores
 attached via PCIe device
Date: Mon, 20 May 2024 00:53:21 +0800
Message-Id: <20240519165321.2123356-9-sui.jingfeng@linux.dev>
In-Reply-To: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
References: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
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

Previouly, the component framework is being used to bind multiple platform
GPU devices to a virtual master. The virtual master is manually created by
the driver, and is also a platform device. This is fine and works well for
various SoCs, yet there some hardware venders integrate Vivante GPU cores
into PCIe card and the driver lacks the support for PCIe devices.

Create virtual platform devices as a representation for each GPU IP core,
the manually created platform devices are functional as subcomponent, and
all of them are child of the PCIe master device. The master is real for
PCIe devices, as the PCIe device has already been created by the time the
etnaviv.ko is loaded. Hence, bind all of the virtual child to the real
master, this design reflects the hardware layout perfectly and is
extensible.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/Kconfig           |   9 ++
 drivers/gpu/drm/etnaviv/Makefile          |   2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c     |  12 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h     |   2 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c     |  75 ++++++++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h     |   4 +
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 161 ++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h |  44 ++++++
 8 files changed, 293 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h

diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kconfig
index faa7fc68b009..7cb44f72d512 100644
--- a/drivers/gpu/drm/etnaviv/Kconfig
+++ b/drivers/gpu/drm/etnaviv/Kconfig
@@ -15,6 +15,15 @@ config DRM_ETNAVIV
 	help
 	  DRM driver for Vivante GPUs.
 
+config DRM_ETNAVIV_PCI_DRIVER
+	bool "enable ETNAVIV PCI driver support"
+	depends on DRM_ETNAVIV
+	depends on PCI
+	default n
+	help
+	  Compile in support for Vivante GPUs attached via PCIe card.
+	  Say Y if you have such hardwares.
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
index dc3556aad134..90ee60b00c24 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -24,6 +24,7 @@
 #include "etnaviv_gpu.h"
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
+#include "etnaviv_pci_drv.h"
 #include "etnaviv_perfmon.h"
 
 /*
@@ -568,6 +569,10 @@ static int etnaviv_bind(struct device *dev)
 	if (ret < 0)
 		goto out_free_priv;
 
+	ret = etnaviv_register_irq_handler(dev, priv);
+	if (ret)
+		goto out_unbind;
+
 	load_gpu(drm);
 
 	ret = drm_dev_register(drm, 0);
@@ -596,7 +601,7 @@ static void etnaviv_unbind(struct device *dev)
 	etnaviv_private_fini(priv);
 }
 
-static const struct component_master_ops etnaviv_master_ops = {
+const struct component_master_ops etnaviv_master_ops = {
 	.bind = etnaviv_bind,
 	.unbind = etnaviv_unbind,
 };
@@ -740,6 +745,10 @@ static int __init etnaviv_init(void)
 	if (ret != 0)
 		goto unregister_gpu_driver;
 
+	ret = etnaviv_register_pci_driver();
+	if (ret)
+		goto unregister_platform_driver;
+
 	/*
 	 * If the DT contains at least one available GPU device, instantiate
 	 * the DRM platform device.
@@ -769,6 +778,7 @@ module_init(etnaviv_init);
 static void __exit etnaviv_exit(void)
 {
 	etnaviv_destroy_platform_device(&etnaviv_drm);
+	etnaviv_unregister_pci_driver();
 	platform_driver_unregister(&etnaviv_platform_driver);
 	platform_driver_unregister(&etnaviv_gpu_driver);
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 4612843ff9f6..6db26d384cbe 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -27,6 +27,8 @@ struct etnaviv_gem_object;
 struct etnaviv_gem_submit;
 struct etnaviv_iommu_global;
 
+extern const struct component_master_ops etnaviv_master_ops;
+
 #define ETNAVIV_SOFTPIN_START_ADDRESS	SZ_4M /* must be >= SUBALLOC_SIZE */
 
 struct etnaviv_file_private {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 3a14e187388a..2b5955693fbb 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -10,6 +10,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -29,6 +30,7 @@
 
 static const struct platform_device_id gpu_ids[] = {
 	{ .name = "etnaviv-gpu,2d" },
+	{ .name = "etnaviv-gpu,3d" },
 	{ },
 };
 
@@ -1543,14 +1545,22 @@ static void dump_mmu_fault(struct etnaviv_gpu *gpu)
 
 static irqreturn_t irq_handler(int irq, void *data)
 {
-	struct etnaviv_gpu *gpu = data;
+	struct etnaviv_drm_private *priv = data;
 	irqreturn_t ret = IRQ_NONE;
+	int i;
 
-	u32 intr = gpu_read(gpu, VIVS_HI_INTR_ACKNOWLEDGE);
-
-	if (intr != 0) {
+	for (i = 0; i < priv->num_gpus; i++) {
+		struct etnaviv_gpu *gpu = priv->gpu[i];
+		u32 intr;
 		int event;
 
+		if (!gpu)
+			continue;
+
+		intr = gpu_read(gpu, VIVS_HI_INTR_ACKNOWLEDGE);
+		if (!intr)
+			continue;
+
 		pm_runtime_mark_last_busy(gpu->dev);
 
 		dev_dbg(gpu->dev, "intr 0x%08x\n", intr);
@@ -1881,10 +1891,44 @@ static const struct of_device_id etnaviv_gpu_match[] = {
 };
 MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
 
+/*
+ * dev point to the master. For platform device, it is virtual.
+ * For PCI(e) device, it is real.
+ */
+int etnaviv_register_irq_handler(struct device *dev,
+				 struct etnaviv_drm_private *priv)
+{
+	bool is_pci = dev_is_pci(dev);
+	int ret = 0;
+
+	if (is_pci) {
+		struct pci_dev *pdev = to_pci_dev(dev);
+
+		ret = request_irq(pdev->irq, irq_handler, IRQF_SHARED,
+				  dev_name(dev), priv);
+	} else {
+		int i;
+
+		for (i = 0; i < priv->num_gpus; i++) {
+			struct etnaviv_gpu *gpu = priv->gpu[i];
+
+			ret = devm_request_irq(gpu->dev, gpu->irq, irq_handler,
+					       0, dev_name(dev), priv);
+			if (ret) {
+				dev_err(dev, "failed to request IRQ handler: %d\n", ret);
+				break;
+			}
+		}
+	}
+
+	return ret;
+}
+
 static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct etnaviv_gpu *gpu;
+	bool is_pci;
 	int err;
 
 	gpu = devm_kzalloc(dev, sizeof(*gpu), GFP_KERNEL);
@@ -1900,22 +1944,23 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(gpu->mmio))
 		return PTR_ERR(gpu->mmio);
 
+	is_pci = dev->parent ? dev_is_pci(dev->parent) : false;
+
 	/* Get Interrupt: */
-	gpu->irq = platform_get_irq(pdev, 0);
+	if (is_pci)
+		gpu->irq = to_pci_dev(dev->parent)->irq;
+	else
+		gpu->irq = platform_get_irq(pdev, 0);
+
 	if (gpu->irq < 0)
 		return gpu->irq;
 
-	err = devm_request_irq(dev, gpu->irq, irq_handler, 0,
-			       dev_name(dev), gpu);
-	if (err) {
-		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
-		return err;
-	}
-
 	/* Get Clocks: */
-	err = etnaviv_gpu_clk_get(gpu);
-	if (err)
-		return err;
+	if (!is_pci) {
+		err = etnaviv_gpu_clk_get(gpu);
+		if (err)
+			return err;
+	}
 
 	/* TODO: figure out max mapped size */
 	dev_set_drvdata(dev, gpu);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 197e0037732e..78222f62725f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -196,6 +196,10 @@ static inline u32 gpu_read_power(struct etnaviv_gpu *gpu, u32 reg)
 int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value);
 
 int etnaviv_gpu_init(struct etnaviv_gpu *gpu);
+
+int etnaviv_register_irq_handler(struct device *dev,
+				 struct etnaviv_drm_private *priv);
+
 bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu);
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
new file mode 100644
index 000000000000..9d505bfead1f
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/component.h>
+#include <linux/pci.h>
+
+#include "etnaviv_drv.h"
+#include "etnaviv_pci_drv.h"
+
+static const struct etnaviv_pci_gpu_data
+gccore_platform_data[GCCORE_PCI_CHIP_ID_LAST] = {
+	{
+		.chip_id = GCCORE_PCI_CHIP_ID_UNKNOWN,
+	},
+	{
+		.chip_id = JM9100,
+		.num_core = 1,
+		.num_vram = 2,
+		.vram_bars = {0, 2},
+		.mmio_bar = 1,
+		.ip_block = {{0, 0x00900000, 0x00010000, "etnaviv-gpu,3d"},},
+		.has_dedicated_vram = true,
+		.market_name = "JingJia Micro JM9100",
+	},
+	{
+		.chip_id = JD9230P,
+		.num_core = 2,
+		.num_vram = 2,
+		.vram_bars = {0, 2},
+		.mmio_bar = 1,
+		.ip_block = {{0, 0x00900000, 0x00010000, "etnaviv-gpu,3d"},
+			     {1, 0x00910000, 0x00010000, "etnaviv-gpu,3d"},},
+		.has_dedicated_vram = true,
+		.market_name = "JingJia Micro JD9230P",
+	},
+	{
+		.chip_id = GP102,
+		.num_core = 2,
+		.num_vram = 1,
+		.vram_bars = {0,},
+		.mmio_bar = 2,
+		.ip_block = {{0, 0x00040000, 0x00010000, "etnaviv-gpu,3d"},
+			     {0, 0x000C0000, 0x00010000, "etnaviv-gpu,2d"},},
+		.has_dedicated_vram = true,
+		.market_name = "LingJiu GP102",
+	},
+};
+
+static const struct etnaviv_pci_gpu_data *
+etnaviv_pci_get_platform_data(const struct pci_device_id *entity)
+{
+	enum etnaviv_pci_chip_id chip_id = entity->driver_data;
+
+	if (chip_id == GCCORE_PCI_CHIP_ID_UNKNOWN ||
+	    chip_id >= GCCORE_PCI_CHIP_ID_LAST)
+		return NULL;
+
+	return &gccore_platform_data[chip_id];
+}
+
+static int etnaviv_pci_probe(struct pci_dev *pdev,
+			     const struct pci_device_id *ent)
+{
+	const struct etnaviv_pci_gpu_data *pdata;
+	struct device *dev = &pdev->dev;
+	struct component_match *matches = NULL;
+	unsigned int i;
+	unsigned int num_core;
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
+	pdata = etnaviv_pci_get_platform_data(ent);
+	if (!pdata)
+		return -ENODEV;
+
+	num_core = pdata->num_core;
+
+	dev_info(dev, "%s has %u GPU cores\n", pdata->market_name, num_core);
+
+	for (i = 0; i < num_core; i++) {
+		const struct vivante_gc_ip_block *pblock = &pdata->ip_block[i];
+		struct platform_device *virtual_child;
+		resource_size_t start;
+		struct resource res;
+
+		start = pci_resource_start(pdev, pdata->mmio_bar);
+		memset(&res, 0, sizeof(res));
+		res.flags = IORESOURCE_MEM;
+		res.name = "register";
+		res.start = start + pblock->offset;
+		res.end = start + pblock->offset + pblock->size - 1;
+
+		ret = etnaviv_create_platform_device(dev,
+						     pblock->compatible,
+						     pblock->id,
+						     &res,
+						     (void *)pdata,
+						     &virtual_child);
+		if (ret)
+			return ret;
+
+		component_match_add(dev, &matches, component_compare_dev,
+				    &virtual_child->dev);
+	}
+
+	return component_master_add_with_match(dev, &etnaviv_master_ops, matches);
+}
+
+static int platform_device_remove_callback(struct device *dev, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	etnaviv_destroy_platform_device(&pdev);
+
+	return 0;
+}
+
+static void etnaviv_pci_remove(struct pci_dev *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	component_master_del(dev, &etnaviv_master_ops);
+
+	device_for_each_child(dev, NULL, platform_device_remove_callback);
+
+	pci_clear_master(pdev);
+}
+
+static const struct pci_device_id etnaviv_pci_id_list[] = {
+	{0x0731, 0x9100, PCI_ANY_ID, PCI_ANY_ID, 0, 0, JM9100},
+	{0x0731, 0x9230, PCI_ANY_ID, PCI_ANY_ID, 0, 0, JD9230P},
+	{0x0709, 0x0001, PCI_ANY_ID, PCI_ANY_ID, 0, 0, GP102},
+	{ }
+};
+
+static struct pci_driver etnaviv_pci_driver = {
+	.name = "etnaviv",
+	.id_table = etnaviv_pci_id_list,
+	.probe = etnaviv_pci_probe,
+	.remove = etnaviv_pci_remove,
+};
+
+int etnaviv_register_pci_driver(void)
+{
+	return pci_register_driver(&etnaviv_pci_driver);
+}
+
+void etnaviv_unregister_pci_driver(void)
+{
+	pci_unregister_driver(&etnaviv_pci_driver);
+}
+
+MODULE_DEVICE_TABLE(pci, etnaviv_pci_id_list);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
new file mode 100644
index 000000000000..6782481a0c0b
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ETNAVIV_PCI_DRV_H__
+#define __ETNAVIV_PCI_DRV_H__
+
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+
+enum etnaviv_pci_chip_id {
+	GCCORE_PCI_CHIP_ID_UNKNOWN = 0,
+	JM9100 = 1,
+	JD9230P = 2,
+	GP102 = 3,
+	GCCORE_PCI_CHIP_ID_LAST,
+};
+
+struct vivante_gc_ip_block {
+	u32 id;
+	u32 offset;
+	u32 size;
+	char compatible[20];
+};
+
+struct etnaviv_pci_gpu_data {
+	enum etnaviv_pci_chip_id chip_id;
+	u32 num_core;
+	u32 num_vram;
+	u32 vram_bars[2];
+	u32 mmio_bar;
+	struct vivante_gc_ip_block ip_block[ETNA_MAX_PIPES];
+	bool has_dedicated_vram;
+	char market_name[24];
+};
+
+int etnaviv_register_pci_driver(void);
+void etnaviv_unregister_pci_driver(void);
+
+#else
+
+static inline int etnaviv_register_pci_driver(void) { return 0; }
+static inline void etnaviv_unregister_pci_driver(void) { }
+
+#endif
+
+#endif
-- 
2.34.1

