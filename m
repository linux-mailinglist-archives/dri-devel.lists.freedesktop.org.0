Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D700720F96
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 12:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A52A10E261;
	Sat,  3 Jun 2023 10:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D97E10E25B;
 Sat,  3 Jun 2023 10:48:52 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxPeuUGntk+uoDAA--.4012S3;
 Sat, 03 Jun 2023 18:48:52 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx87SSGntkOjOHAA--.20866S8; 
 Sat, 03 Jun 2023 18:48:51 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v7 6/7] drm/etnaviv: add driver support for the PCI devices
Date: Sat,  3 Jun 2023 18:48:49 +0800
Message-Id: <20230603104850.3042011-7-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230603104850.3042011-1-suijingfeng@loongson.cn>
References: <20230603104850.3042011-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx87SSGntkOjOHAA--.20866S8
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxtw1furyxZry7GF4xAw1kXwb_yoWfuw1DpF
 43JFyjkrW8Za1jg347JFs5ZFy3K3WIgFyS934DK3sIvw45AFyUJryqkFyDAr9xJrZxGr9x
 trn8Kry7ZF4UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 ba8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFc
 xC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVW8Xw0E3s1lYx0Ex4A2jsIE14v26r4U
 JVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y40E4IxF1VCIxc
 xG6Fyj6r4UJwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWDJVCq3wCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
 0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZE
 Xa7IUYfsqJUUUUU==
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds PCI driver support on top of what already have. Take the
GC1000 in LS7A1000/LS2K1000 as the first instance of the PCI device driver.
There is only one GPU core for the GC1000 in the LS7A1000 and LS2K1000.
Therefore, component frameworks can be avoided.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/Kconfig           |  9 +++
 drivers/gpu/drm/etnaviv/Makefile          |  2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c     | 20 +++++-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h     |  3 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c     |  8 +--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h     |  6 ++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 75 +++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h |  9 +++
 8 files changed, 125 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h

diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kconfig
index faa7fc68b009..dbf948f99976 100644
--- a/drivers/gpu/drm/etnaviv/Kconfig
+++ b/drivers/gpu/drm/etnaviv/Kconfig
@@ -15,6 +15,15 @@ config DRM_ETNAVIV
 	help
 	  DRM driver for Vivante GPUs.
 
+config DRM_ETNAVIV_PCI_DRIVER
+	bool "enable ETNAVIV PCI driver support"
+	depends on DRM_ETNAVIV
+	depends on PCI
+	default y
+	help
+	  Compile in support for PCI GPUs of Vivante.
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
index 93ca240cd4c0..033afe542a3a 100644
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
  * etnaviv private data construction and destructions:
  */
@@ -538,7 +542,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 
 static struct etnaviv_drm_private *etna_private_ptr;
 
-static int etnaviv_drm_bind(struct device *dev, bool component)
+int etnaviv_drm_bind(struct device *dev, bool component)
 {
 	struct etnaviv_drm_private *priv;
 	struct drm_device *drm;
@@ -588,7 +592,7 @@ static int etnaviv_drm_bind(struct device *dev, bool component)
 	return ret;
 }
 
-static void etnaviv_drm_unbind(struct device *dev, bool component)
+void etnaviv_drm_unbind(struct device *dev, bool component)
 {
 	struct etnaviv_drm_private *priv = etna_private_ptr;
 	struct drm_device *drm = priv->drm;
@@ -746,6 +750,12 @@ static int __init etnaviv_init(void)
 	if (ret != 0)
 		goto unregister_gpu_driver;
 
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+	ret = etnaviv_register_pci_driver();
+	if (ret != 0)
+		goto unregister_platform_driver;
+#endif
+
 	/*
 	 * If the DT contains at least one available GPU device, instantiate
 	 * the DRM platform device.
@@ -763,7 +773,7 @@ static int __init etnaviv_init(void)
 		break;
 	}
 
-	return 0;
+	return ret;
 
 unregister_platform_driver:
 	platform_driver_unregister(&etnaviv_platform_driver);
@@ -778,6 +788,10 @@ static void __exit etnaviv_exit(void)
 	etnaviv_destroy_platform_device(&etnaviv_platform_device);
 	platform_driver_unregister(&etnaviv_platform_driver);
 	platform_driver_unregister(&etnaviv_gpu_driver);
+
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+	etnaviv_unregister_pci_driver();
+#endif
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
index 126f0409aaed..f0eb808496e2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1868,8 +1868,8 @@ static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
 
 /* platform independent */
 
-static int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
-				     int irq, bool component, bool has_clk)
+int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
+			      int irq, bool component, bool has_clk)
 {
 	struct etnaviv_gpu *gpu;
 	int err;
@@ -1917,7 +1917,7 @@ static int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
 	return 0;
 }
 
-static void etnaviv_gpu_driver_destroy(struct device *dev, bool component)
+void etnaviv_gpu_driver_destroy(struct device *dev, bool component)
 {
 	if (component)
 		component_del(dev, &gpu_ops);
@@ -1968,7 +1968,7 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
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
index 000000000000..5de3e218274a
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
+		dev_err(&pdev->dev, "failed to enable\n");
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
+	{PCI_VENDOR_ID_LOONGSON, 0x7a15, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{PCI_VENDOR_ID_LOONGSON, 0x7a05, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
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
index 000000000000..25d07bdd2ea0
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ETNAVIV_PCI_DRV_H__
+#define __ETNAVIV_PCI_DRV_H__
+
+int etnaviv_register_pci_driver(void);
+void etnaviv_unregister_pci_driver(void);
+
+#endif
-- 
2.25.1

