Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498517369DA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 12:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1867210E2B2;
	Tue, 20 Jun 2023 10:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05C2510E2B5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:48:16 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dxh+nvg5FkfCwHAA--.12924S3;
 Tue, 20 Jun 2023 18:48:15 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxCOXmg5FklJghAA--.28448S8; 
 Tue, 20 Jun 2023 18:48:14 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v10 06/11] drm/etnaviv: Add driver support for the PCI devices
Date: Tue, 20 Jun 2023 18:48:01 +0800
Message-Id: <20230620104806.2236666-7-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230620104806.2236666-1-suijingfeng@loongson.cn>
References: <20230620104806.2236666-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxCOXmg5FklJghAA--.28448S8
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKw4UCw4DWr1DGr13XF43Arc_yoWDJr45pF
 4fJFyYkry8Zayjg347JFs5ZFy3K3WxWFyS934DG3sIvws8AFyjqryqkFyDAr9xJrZxGFZx
 trn8Kry7uF4UA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
 wI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU0tC7UUUUU
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds PCI driver support on top of what we already have, take
the GC1000 in LS7A1000/LS2K1000 as the first instance which enjoy the PCI
device driver. There is only one GPU core for the GC1000 in the LS7A1000
and LS2K1000. Therefore, component frameworks can be avoided.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/Kconfig           | 10 +++
 drivers/gpu/drm/etnaviv/Makefile          |  2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c     | 13 +++-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h     |  3 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c     |  8 +--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h     |  6 ++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 75 +++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h | 18 ++++++
 8 files changed, 128 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h

diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kconfig
index faa7fc68b009..1b5b162efb61 100644
--- a/drivers/gpu/drm/etnaviv/Kconfig
+++ b/drivers/gpu/drm/etnaviv/Kconfig
@@ -15,6 +15,16 @@ config DRM_ETNAVIV
 	help
 	  DRM driver for Vivante GPUs.
 
+config DRM_ETNAVIV_PCI_DRIVER
+	bool "enable ETNAVIV PCI driver support"
+	depends on DRM_ETNAVIV
+	depends on PCI
+	default y
+	help
+	  Compile in support for PCI GPUs of Vivante.
+	  For example, the GC1000 in LS7A1000 and LS2K1000.
+	  Say Y if you have such a hardware.
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
index 93ca240cd4c0..0a365e96d371 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -21,6 +21,7 @@
 #include "etnaviv_gpu.h"
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
+#include "etnaviv_pci_drv.h"
 #include "etnaviv_perfmon.h"
 
 /*
@@ -538,7 +539,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 
 static struct etnaviv_drm_private *etna_private_ptr;
 
-static int etnaviv_drm_bind(struct device *dev, bool component)
+int etnaviv_drm_bind(struct device *dev, bool component)
 {
 	struct etnaviv_drm_private *priv;
 	struct drm_device *drm;
@@ -588,7 +589,7 @@ static int etnaviv_drm_bind(struct device *dev, bool component)
 	return ret;
 }
 
-static void etnaviv_drm_unbind(struct device *dev, bool component)
+void etnaviv_drm_unbind(struct device *dev, bool component)
 {
 	struct etnaviv_drm_private *priv = etna_private_ptr;
 	struct drm_device *drm = priv->drm;
@@ -746,6 +747,10 @@ static int __init etnaviv_init(void)
 	if (ret != 0)
 		goto unregister_gpu_driver;
 
+	ret = etnaviv_register_pci_driver();
+	if (ret != 0)
+		goto unregister_platform_driver;
+
 	/*
 	 * If the DT contains at least one available GPU device, instantiate
 	 * the DRM platform device.
@@ -763,7 +768,7 @@ static int __init etnaviv_init(void)
 		break;
 	}
 
-	return 0;
+	return ret;
 
 unregister_platform_driver:
 	platform_driver_unregister(&etnaviv_platform_driver);
@@ -778,6 +783,8 @@ static void __exit etnaviv_exit(void)
 	etnaviv_destroy_platform_device(&etnaviv_platform_device);
 	platform_driver_unregister(&etnaviv_platform_driver);
 	platform_driver_unregister(&etnaviv_gpu_driver);
+
+	etnaviv_unregister_pci_driver();
 }
 module_exit(etnaviv_exit);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index e58f82e698de..9cd72948cfad 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -83,6 +83,9 @@ bool etnaviv_cmd_validate_one(struct etnaviv_gpu *gpu,
 	u32 *stream, unsigned int size,
 	struct drm_etnaviv_gem_submit_reloc *relocs, unsigned int reloc_size);
 
+int etnaviv_drm_bind(struct device *dev, bool component);
+void etnaviv_drm_unbind(struct device *dev, bool component);
+
 #ifdef CONFIG_DEBUG_FS
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
 	struct seq_file *m);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 059be8c89c5a..d6a21e97feb1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1866,8 +1866,8 @@ static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
 
 /* platform independent */
 
-static int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
-				     int irq, bool component, bool has_clk)
+int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
+			      int irq, bool component, bool has_clk)
 {
 	struct etnaviv_gpu *gpu;
 	int err;
@@ -1916,7 +1916,7 @@ static int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
 	return 0;
 }
 
-static void etnaviv_gpu_driver_destroy(struct device *dev, bool component)
+void etnaviv_gpu_driver_destroy(struct device *dev, bool component)
 {
 	if (component)
 		component_del(dev, &gpu_ops);
@@ -1967,7 +1967,7 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
+const struct dev_pm_ops etnaviv_gpu_pm_ops = {
 	RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume, NULL)
 };
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 1ec829a649b5..8d9833996ed7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -209,6 +209,12 @@ void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch);
 int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data);
 void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data);
 
+int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
+			      int irq, bool component, bool has_clk);
+
+void etnaviv_gpu_driver_destroy(struct device *dev, bool component);
+
 extern struct platform_driver etnaviv_gpu_driver;
+extern const struct dev_pm_ops etnaviv_gpu_pm_ops;
 
 #endif /* __ETNAVIV_GPU_H__ */
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
new file mode 100644
index 000000000000..78e44a28d30c
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/pci.h>
+
+#include "etnaviv_drv.h"
+#include "etnaviv_gpu.h"
+#include "etnaviv_pci_drv.h"
+
+static int etnaviv_pci_probe(struct pci_dev *pdev,
+			     const struct pci_device_id *ent)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *mmio;
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		dev_err(dev, "failed to enable\n");
+		return ret;
+	}
+
+	pci_set_master(pdev);
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
+	/* Map registers, assume the PCI bar 0 contain the registers */
+	mmio = pcim_iomap(pdev, 0, 0);
+	if (IS_ERR(mmio))
+		return PTR_ERR(mmio);
+
+	ret = etnaviv_gpu_driver_create(dev, mmio, pdev->irq, false, false);
+	if (ret)
+		return ret;
+
+	return etnaviv_drm_bind(dev, false);
+}
+
+static void etnaviv_pci_remove(struct pci_dev *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	etnaviv_drm_unbind(dev, false);
+
+	etnaviv_gpu_driver_destroy(dev, false);
+
+	pci_clear_master(pdev);
+}
+
+static const struct pci_device_id etnaviv_pci_id_lists[] = {
+	{PCI_VDEVICE(LOONGSON, 0x7a15)},
+	{PCI_VDEVICE(LOONGSON, 0x7a05)},
+	{ }
+};
+
+static struct pci_driver etnaviv_pci_driver = {
+	.name = "etnaviv",
+	.id_table = etnaviv_pci_id_lists,
+	.probe = etnaviv_pci_probe,
+	.remove = etnaviv_pci_remove,
+	.driver.pm = pm_ptr(&etnaviv_gpu_pm_ops),
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
+MODULE_DEVICE_TABLE(pci, etnaviv_pci_id_lists);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
new file mode 100644
index 000000000000..1db559ee5e9b
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ETNAVIV_PCI_DRV_H__
+#define __ETNAVIV_PCI_DRV_H__
+
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
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
2.25.1

