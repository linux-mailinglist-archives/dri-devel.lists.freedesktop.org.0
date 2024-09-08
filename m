Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D0F970630
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E05410E254;
	Sun,  8 Sep 2024 09:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="bHmQnty2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BFF10E253
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:45:01 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725788700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xL8O+BCjEwAY358CybSYLbXcE/FjxfNFOcSD6SvUCu4=;
 b=bHmQnty2wqaFTmKM88ZMVF+T62tGYFjkyz2wcjKfEyIZYjCzKBAc389h5qOun6Fh43QZ8e
 L4Gc4tUUIzC4VMQFnQJZWYpQAfPUIwfVWoZy61BrzalFoUVWEXXUjxWchP3/+UvBj4haVR
 V2BGL9TgpQFH5Sdl/BZNgLTh0P326tA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v15 13/19] drm/etnaviv: Add support for vivante GPU cores
 attached via PCIe device
Date: Sun,  8 Sep 2024 17:43:51 +0800
Message-ID: <20240908094357.291862-14-sui.jingfeng@linux.dev>
In-Reply-To: <20240908094357.291862-1-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
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

Previously, component framework is being used to bind multiple platform
(DT) devices to a virtual master. The virtual master is manually created
during probe time. This is fine and works well for embedded SoCs, yet
there have some hardware venders that integrate Vivante GPU IP cores
into their PCIe card. This driver lacks support for PCI(e) devices.

Creating platform device as logical denotation for each GPU IP core, the
manually created platform devices are functional as subcomponen. To
reflects the actual hardware layout, make all of them be child of the PCIe
master device. The master is real for PCIe devices, which is working at
background and spread the device seeds out.

Creating yet an another platform device as component master, offload the
component binding/unbinding affairs to it. The virtual component master
works at foreground, the PCIe device behind it works at background.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/Kconfig           |   9 ++
 drivers/gpu/drm/etnaviv/Makefile          |   2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c     |  45 +++++-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h     |  11 ++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c     |  73 +++++++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h     |   4 +
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 185 ++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h |  48 ++++++
 8 files changed, 355 insertions(+), 22 deletions(-)
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
index 18686b573d77..7fc654f051a3 100644
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
@@ -670,16 +675,32 @@ static struct platform_driver etnaviv_platform_driver = {
 	},
 };
 
-static int etnaviv_create_platform_device(const char *name,
-					  struct platform_device **ppdev)
+int etnaviv_create_platform_device(struct device *parent,
+				   const char *name, int id,
+				   struct resource *pres,
+				   void *pdata, unsigned int ndata,
+				   struct platform_device **ppdev)
 {
 	struct platform_device *pdev;
 	int ret;
 
-	pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
+	pdev = platform_device_alloc(name, id);
 	if (!pdev)
 		return -ENOMEM;
 
+	pdev->dev.parent = parent;
+
+	if (pres) {
+		ret = platform_device_add_resources(pdev, pres, 1);
+		if (ret) {
+			platform_device_put(pdev);
+			return ret;
+		}
+	}
+
+	if (pdata && ndata)
+		platform_device_add_data(pdev, pdata, ndata);
+
 	ret = platform_device_add(pdev);
 	if (ret) {
 		platform_device_put(pdev);
@@ -691,7 +712,7 @@ static int etnaviv_create_platform_device(const char *name,
 	return 0;
 }
 
-static void etnaviv_destroy_platform_device(struct platform_device **ppdev)
+void etnaviv_destroy_platform_device(struct platform_device **ppdev)
 {
 	struct platform_device *pdev = *ppdev;
 
@@ -703,7 +724,7 @@ static void etnaviv_destroy_platform_device(struct platform_device **ppdev)
 	*ppdev = NULL;
 }
 
-static struct platform_device *etnaviv_drm;
+struct platform_device *etnaviv_drm;
 
 static int __init etnaviv_init(void)
 {
@@ -720,6 +741,10 @@ static int __init etnaviv_init(void)
 	if (ret != 0)
 		goto unregister_gpu_driver;
 
+	ret = etnaviv_register_pci_driver();
+	if (ret)
+		goto unregister_platform_driver;
+
 	/*
 	 * If the DT contains at least one available GPU device, instantiate
 	 * the DRM platform device.
@@ -728,13 +753,18 @@ static int __init etnaviv_init(void)
 	if (np) {
 		of_node_put(np);
 
-		ret = etnaviv_create_platform_device("etnaviv", &etnaviv_drm);
+		ret = etnaviv_create_platform_device(NULL, "etnaviv",
+						     PLATFORM_DEVID_NONE,
+						     NULL, NULL, 0,
+						     &etnaviv_drm);
 		if (ret)
-			goto unregister_platform_driver;
+			goto unregister_pci_driver;
 	}
 
 	return 0;
 
+unregister_pci_driver:
+	etnaviv_unregister_pci_driver();
 unregister_platform_driver:
 	platform_driver_unregister(&etnaviv_platform_driver);
 unregister_gpu_driver:
@@ -746,6 +776,7 @@ module_init(etnaviv_init);
 static void __exit etnaviv_exit(void)
 {
 	etnaviv_destroy_platform_device(&etnaviv_drm);
+	etnaviv_unregister_pci_driver();
 	platform_driver_unregister(&etnaviv_platform_driver);
 	platform_driver_unregister(&etnaviv_gpu_driver);
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 02d706b34752..84f2e79f0a53 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/mm_types.h>
+#include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/time64.h>
 #include <linux/types.h>
@@ -26,6 +27,8 @@ struct etnaviv_gem_object;
 struct etnaviv_gem_submit;
 struct etnaviv_iommu_global;
 
+extern struct platform_device *etnaviv_drm;
+
 #define ETNAVIV_SOFTPIN_START_ADDRESS	SZ_4M /* must be >= SUBALLOC_SIZE */
 
 struct etnaviv_file_private {
@@ -98,6 +101,14 @@ bool etnaviv_cmd_validate_one(struct etnaviv_gpu *gpu,
 	u32 *stream, unsigned int size,
 	struct drm_etnaviv_gem_submit_reloc *relocs, unsigned int reloc_size);
 
+int etnaviv_create_platform_device(struct device *parent,
+				   const char *name, int id,
+				   struct resource *pres,
+				   void *data, unsigned int ndata,
+				   struct platform_device **ppdev);
+
+void etnaviv_destroy_platform_device(struct platform_device **ppdev);
+
 #ifdef CONFIG_DEBUG_FS
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
 	struct seq_file *m);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 89fb36aee779..3cfeacc49489 100644
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
 
@@ -1546,15 +1548,23 @@ static void dump_mmu_fault(struct etnaviv_gpu *gpu)
 
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
 		ktime_t now = ktime_get();
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
@@ -1885,10 +1895,42 @@ static const struct of_device_id etnaviv_gpu_match[] = {
 };
 MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
 
+/*
+ * dev point to the component master.
+ */
+int etnaviv_register_irq_handler(struct device *dev,
+				 struct etnaviv_drm_private *priv)
+{
+	int ret = 0;
+
+	if (dev->parent && dev_is_pci(dev->parent)) {
+		struct pci_dev *pdev = to_pci_dev(dev->parent);
+
+		ret = request_irq(pdev->irq, irq_handler, IRQF_SHARED,
+				  dev_name(dev->parent), priv);
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
@@ -1904,22 +1946,23 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
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
index 31322195b9e4..1162572843d9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -204,6 +204,10 @@ static inline u32 gpu_read_power(struct etnaviv_gpu *gpu, u32 reg)
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
index 000000000000..f13f3208120f
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+
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
+		.ip_block = {{0, 0x00900000, 0x00004000, "etnaviv-gpu,3d"},},
+		.has_dedicated_vram = true,
+		.has_display = true,
+		.market_name = "JingJia Micro JM9100",
+	},
+	{
+		.chip_id = JD9230P,
+		.num_core = 2,
+		.num_vram = 2,
+		.vram_bars = {0, 2},
+		.mmio_bar = 1,
+		.ip_block = {{0, 0x00900000, 0x00004000, "etnaviv-gpu,3d"},
+			     {1, 0x00910000, 0x00004000, "etnaviv-gpu,3d"},},
+		.has_dedicated_vram = true,
+		.has_display = true,
+		.market_name = "JingJia Micro JD9230P",
+	},
+	{
+		.chip_id = GP102,
+		.num_core = 2,
+		.num_vram = 1,
+		.vram_bars = {0,},
+		.mmio_bar = 2,
+		.ip_block = {{0, 0x00040000, 0x00004000, "etnaviv-gpu,3d"},
+			     {0, 0x000C0000, 0x00004000, "etnaviv-gpu,2d"},},
+		.has_dedicated_vram = true,
+		.has_display = true,
+		.market_name = "LingJiu GP102",
+	},
+	{
+		.chip_id = GC1000_IN_LS7A1000,
+		.num_core = 1,
+		.num_vram = 1,
+		.vram_bars = {2,},
+		.mmio_bar = 0,
+		.ip_block = {{0, 0, 0x00004000, "etnaviv-gpu,3d"},},
+		.has_dedicated_vram = true,
+		.has_display = false,
+		.market_name = "GC1000 in LS7A1000",
+	},
+};
+
+static const char *match_names[ETNA_MAX_IP_BLOCK] = {0};
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
+static void platform_device_remove_callback(void *data)
+{
+	struct platform_device *pdev = (struct platform_device *)data;
+
+	etnaviv_destroy_platform_device(&pdev);
+}
+
+static int etnaviv_pci_probe(struct pci_dev *pdev,
+			     const struct pci_device_id *ent)
+{
+	const struct etnaviv_pci_gpu_data *pdata;
+	struct device *dev = &pdev->dev;
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
+		res.name = "registers";
+		res.start = start + pblock->offset;
+		res.end = start + pblock->offset + pblock->size - 1;
+
+		ret = etnaviv_create_platform_device(dev,
+						     pblock->compatible,
+						     pblock->id,
+						     &res,
+						     (void *)pdata,
+						     sizeof(*pdata),
+						     &virtual_child);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev,
+					       platform_device_remove_callback,
+					       virtual_child);
+		if (ret)
+			return ret;
+
+		match_names[i] = dev_name(&virtual_child->dev);
+	}
+
+	for (i = 0; i < num_core; i++)
+		dev_info(dev, "ip block %u: %s\n", i, match_names[i]);
+
+	ret = etnaviv_create_platform_device(dev, "etnaviv",
+					     PLATFORM_DEVID_NONE,
+					     NULL, match_names,
+					     sizeof(match_names),
+					     &etnaviv_drm);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void etnaviv_pci_remove(struct pci_dev *pdev)
+{
+
+}
+
+static const struct pci_device_id etnaviv_pci_id_list[] = {
+	{0x0731, 0x9100, PCI_ANY_ID, PCI_ANY_ID, 0, 0, JM9100},
+	{0x0731, 0x9230, PCI_ANY_ID, PCI_ANY_ID, 0, 0, JD9230P},
+	{0x0709, 0x0001, PCI_ANY_ID, PCI_ANY_ID, 0, 0, GP102},
+	{0x0014, 0x7A15, PCI_ANY_ID, PCI_ANY_ID, 0, 0, GC1000_IN_LS7A1000},
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
index 000000000000..eae8cdea5674
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ETNAVIV_PCI_DRV_H__
+#define __ETNAVIV_PCI_DRV_H__
+
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+
+#define ETNA_MAX_IP_BLOCK          4
+
+enum etnaviv_pci_chip_id {
+	GCCORE_PCI_CHIP_ID_UNKNOWN = 0,
+	JM9100 = 1,
+	JD9230P = 2,
+	GP102 = 3,
+	GC1000_IN_LS7A1000 = 4,
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
+	struct vivante_gc_ip_block ip_block[ETNA_MAX_IP_BLOCK];
+	bool has_dedicated_vram;
+	bool has_display;
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
2.43.0

