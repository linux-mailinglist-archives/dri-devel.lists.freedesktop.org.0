Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092C27FE298
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 23:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA6410E690;
	Wed, 29 Nov 2023 22:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC9010E683
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 22:02:49 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701295367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uALrPyw5sK1q3gGTu+rOKlzfnp32on+TZnMeCDOHzMQ=;
 b=JchTk6iB8ykIx8Dvupk89zfJcAHtr1VHwXzsxf0iHP5aP1zbirqkvM0W6L9Qo7kE+YaG0X
 ToWYuR48Th5r1CZ7rB5WiblfAP+7VeC6KWaK2ySrzx5VYWRNiVUc+tozaztYf5qTdfOuLN
 GfZ2BBsIAFy9necvgAVVgQ/XIXtQYQE=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [etnaviv-next v12 4/8] drm/etnaviv: Support for the vivante GPU core
 attached on PCI(e) device
Date: Thu, 30 Nov 2023 06:02:27 +0800
Message-Id: <20231129220231.12763-5-sui.jingfeng@linux.dev>
In-Reply-To: <20231129220231.12763-1-sui.jingfeng@linux.dev>
References: <20231129220231.12763-1-sui.jingfeng@linux.dev>
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

There is a Vivante GC1000 GPU (v5037) in Loongson LS2K1000 (0x0014:0x7a05)
and LS7A1000 (0x0014:0x7a15), the GPU in these chips is a PCI(e) device,
has only one core with both the 3D pipe and 2D pipe. This patch adds PCI
driver wrapper on the top of what drm/etnaviv already have, since this GPU
has only one GPU core, there no need to bind to anything for now. Hence,
the component framework get bypassed.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/Kconfig           |  8 +++
 drivers/gpu/drm/etnaviv/Makefile          |  2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c     | 10 ++-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h     |  3 +
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 74 +++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h | 18 ++++++
 6 files changed, 113 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h

diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kconfig
index faa7fc68b009..38c251585ec1 100644
--- a/drivers/gpu/drm/etnaviv/Kconfig
+++ b/drivers/gpu/drm/etnaviv/Kconfig
@@ -15,6 +15,14 @@ config DRM_ETNAVIV
 	help
 	  DRM driver for Vivante GPUs.
 
+config DRM_ETNAVIV_PCI_DRIVER
+	bool "enable ETNAVIV PCI driver support"
+	depends on DRM_ETNAVIV
+	depends on PCI
+	help
+	  Compile in support for Vivante GPUs attached via PCI(e).
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
index 0b68c76d117e..8db86120b11d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -23,6 +23,7 @@
 #include "etnaviv_gpu.h"
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
+#include "etnaviv_pci_drv.h"
 #include "etnaviv_perfmon.h"
 
 static struct etnaviv_drm_private *etna_drm_priv_ptr;
@@ -547,7 +548,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.minor              = 3,
 };
 
-static int etnaviv_drm_bind(struct device *dev, bool component)
+int etnaviv_drm_bind(struct device *dev, bool component)
 {
 	struct etnaviv_drm_private *priv;
 	struct drm_device *drm;
@@ -598,7 +599,7 @@ static int etnaviv_drm_bind(struct device *dev, bool component)
 	return ret;
 }
 
-static void etnaviv_drm_unbind(struct device *dev, bool component)
+void etnaviv_drm_unbind(struct device *dev, bool component)
 {
 	struct etnaviv_drm_private *priv = etna_drm_priv_ptr;
 	struct drm_device *drm = priv->drm;
@@ -758,6 +759,10 @@ static int __init etnaviv_init(void)
 	if (ret != 0)
 		goto unregister_gpu_driver;
 
+	ret = etnaviv_register_pci_driver();
+	if (ret != 0)
+		goto unregister_platform_driver;
+
 	/*
 	 * If the DT contains at least one available GPU device, instantiate
 	 * the DRM platform device.
@@ -786,6 +791,7 @@ static void __exit etnaviv_exit(void)
 	etnaviv_destroy_platform_device(&etnaviv_drm);
 	platform_driver_unregister(&etnaviv_platform_driver);
 	platform_driver_unregister(&etnaviv_gpu_driver);
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
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
new file mode 100644
index 000000000000..37de661844d8
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
@@ -0,0 +1,74 @@
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
+	/* PCI bar 0 contain the MMIO registers */
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
2.34.1

