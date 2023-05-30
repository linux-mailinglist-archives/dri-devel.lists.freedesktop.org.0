Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B00716880
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 18:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9AB10E17F;
	Tue, 30 May 2023 16:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52D8D10E39C;
 Tue, 30 May 2023 16:01:29 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxjOvXHXZktKUCAA--.2786S3;
 Wed, 31 May 2023 00:01:27 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxn7PWHXZkp92AAA--.14122S7; 
 Wed, 31 May 2023 00:01:27 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>
Subject: [PATCH v6 5/6] drm/etnaviv: add driver support for the PCI devices
Date: Wed, 31 May 2023 00:01:25 +0800
Message-Id: <20230530160126.2344425-6-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530160126.2344425-1-suijingfeng@loongson.cn>
References: <20230530160126.2344425-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxn7PWHXZkp92AAA--.14122S7
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvAXoWfGF1xGr4DurW5JF15uryrtFb_yoW8WFW7Ko
 WxZrnxXa1rGFZ3t398AF12gFy3ZwsrCa45uan8trs09aykXF15tw13ta13tF1avr1FgrWf
 Zw1jqw15JFyxJFn5n29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
 0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8JVWxJwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
 0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
 GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
 0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
 rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
 4UJbIYCTnIWIevJa73UjIFyTuYvjxUsZqXUUUUU
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
Therefore, component frameworks can be avoided. Because we want to bind the
DRM driver service to the PCI driver manually.
    
We avoid using the component framework because the virtual master device
will not be used without a force override. X server and Mesa will try to
find the PCI device to use by default. Creating a virtual master device
for PCI GPUs cause unnecessary troubles.
    
Using the component framework with a PCI device is still possible; it is
just that the solo PCI device should be the master. A platform with a
single GPU core could also try the non-component code path.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/Kconfig           |  9 +++
 drivers/gpu/drm/etnaviv/Makefile          |  2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c     | 69 +++++++++++++---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h     |  3 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c     | 97 ++++++++++++++++-------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h     | 12 +++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 87 ++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h | 12 +++
 8 files changed, 250 insertions(+), 41 deletions(-)
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
index 56c98711f8e1..052f745cecc0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -21,6 +21,7 @@
 #include "etnaviv_gpu.h"
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
+#include "etnaviv_pci_drv.h"
 #include "etnaviv_perfmon.h"
 
 /*
@@ -525,6 +526,16 @@ static int etnaviv_alloc_private(struct device *dev,
 		return ret;
 	}
 
+	/*
+	 * Loongson Mips and LoongArch CPU(ls3a5000, ls3a4000, ls2k1000la)
+	 * maintain cache coherency by hardware
+	 */
+	if (IS_ENABLED(CONFIG_CPU_LOONGSON64) || IS_ENABLED(CONFIG_LOONGARCH))
+		priv->has_cached_coherent = true;
+
+	dev_info(dev, "Cached coherent mode is %s\n",
+		 priv->has_cached_coherent ? "support" : "not support");
+
 	*ppriv = priv;
 
 	return 0;
@@ -539,10 +550,9 @@ static void etnaviv_free_private(struct etnaviv_drm_private *priv)
 	kfree(priv);
 }
 
-/*
- * Platform driver:
- */
-static int etnaviv_bind(struct device *dev)
+static struct etnaviv_drm_private *etna_private_s;
+
+int etnaviv_drm_bind(struct device *dev, bool component)
 {
 	struct etnaviv_drm_private *priv;
 	struct drm_device *drm;
@@ -558,12 +568,15 @@ static int etnaviv_bind(struct device *dev)
 
 	priv->drm = drm;
 	drm->dev_private = priv;
+	etna_private_s = priv;
 
 	dma_set_max_seg_size(dev, SZ_2G);
 
-	dev_set_drvdata(dev, drm);
+	if (component)
+		ret = component_bind_all(dev, drm);
+	else
+		ret = etnaviv_gpu_bind(dev, NULL, drm);
 
-	ret = component_bind_all(dev, drm);
 	if (ret < 0)
 		goto out_free_priv;
 
@@ -585,14 +598,17 @@ static int etnaviv_bind(struct device *dev)
 	return ret;
 }
 
-static void etnaviv_unbind(struct device *dev)
+void etnaviv_drm_unbind(struct device *dev, bool component)
 {
-	struct drm_device *drm = dev_get_drvdata(dev);
-	struct etnaviv_drm_private *priv = drm->dev_private;
+	struct etnaviv_drm_private *priv = etna_private_s;
+	struct drm_device *drm = priv->drm;
 
 	drm_dev_unregister(drm);
 
-	component_unbind_all(dev, drm);
+	if (component)
+		component_unbind_all(dev, drm);
+	else
+		etnaviv_gpu_unbind(dev, NULL, drm);
 
 	etnaviv_free_private(priv);
 
@@ -601,9 +617,22 @@ static void etnaviv_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
+/*
+ * Platform driver:
+ */
+static int etnaviv_master_bind(struct device *dev)
+{
+	return etnaviv_drm_bind(dev, true);
+}
+
+static void etnaviv_master_unbind(struct device *dev)
+{
+	return etnaviv_drm_unbind(dev, true);
+}
+
 static const struct component_master_ops etnaviv_master_ops = {
-	.bind = etnaviv_bind,
-	.unbind = etnaviv_unbind,
+	.bind = etnaviv_master_bind,
+	.unbind = etnaviv_master_unbind,
 };
 
 static int etnaviv_pdev_probe(struct platform_device *pdev)
@@ -727,6 +756,12 @@ static int __init etnaviv_init(void)
 	if (ret != 0)
 		goto unregister_gpu_driver;
 
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+	ret = pci_register_driver(&etnaviv_pci_driver);
+#endif
+	if (ret != 0)
+		goto unregister_platform_driver;
+
 	/*
 	 * If the DT contains at least one available GPU device, instantiate
 	 * the DRM platform device.
@@ -739,13 +774,17 @@ static int __init etnaviv_init(void)
 						     &etnaviv_platform_device);
 		of_node_put(np);
 		if (ret)
-			goto unregister_platform_driver;
+			goto unregister_all_driver;
 
 		break;
 	}
 
 	return 0;
 
+unregister_all_driver:
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+	pci_unregister_driver(&etnaviv_pci_driver);
+#endif
 unregister_platform_driver:
 	platform_driver_unregister(&etnaviv_platform_driver);
 unregister_gpu_driver:
@@ -759,6 +798,10 @@ static void __exit etnaviv_exit(void)
 	etnaviv_destroy_platform_device(&etnaviv_platform_device);
 	platform_driver_unregister(&etnaviv_platform_driver);
 	platform_driver_unregister(&etnaviv_gpu_driver);
+
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+	pci_unregister_driver(&etnaviv_pci_driver);
+#endif
 }
 module_exit(etnaviv_exit);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 87fb52c03c5e..934fc3744389 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -86,6 +86,9 @@ bool etnaviv_cmd_validate_one(struct etnaviv_gpu *gpu,
 	u32 *stream, unsigned int size,
 	struct drm_etnaviv_gem_submit_reloc *relocs, unsigned int reloc_size);
 
+int etnaviv_drm_bind(struct device *dev, bool component);
+void etnaviv_drm_unbind(struct device *dev, bool component);
+
 #ifdef CONFIG_DEBUG_FS
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
 	struct seq_file *m);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 4937580551a5..700f2414b87d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1565,10 +1565,11 @@ static irqreturn_t irq_handler(int irq, void *data)
 	return ret;
 }
 
-static int etnaviv_gpu_clk_get(struct etnaviv_gpu *gpu)
+static int etnaviv_gpu_clk_get(struct etnaviv_gpu *gpu, bool no_clk)
 {
 	struct device *dev = gpu->dev;
 
+	gpu->no_clk = no_clk;
 	if (gpu->no_clk)
 		return 0;
 
@@ -1746,8 +1747,7 @@ static const struct thermal_cooling_device_ops cooling_ops = {
 	.set_cur_state = etnaviv_gpu_cooling_set_cur_state,
 };
 
-static int etnaviv_gpu_bind(struct device *dev, struct device *master,
-	void *data)
+int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
 	struct etnaviv_drm_private *priv = drm->dev_private;
@@ -1778,7 +1778,6 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	if (ret < 0)
 		goto out_sched;
 
-
 	gpu->drm = drm;
 	gpu->fence_context = dma_fence_context_alloc(1);
 	xa_init_flags(&gpu->user_fences, XA_FLAGS_ALLOC);
@@ -1807,8 +1806,7 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	return ret;
 }
 
-static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
-	void *data)
+void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
 
@@ -1878,9 +1876,37 @@ static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
 	return 0;
 }
 
-static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
+static int etnaviv_gpu_plat_drv_init(struct etnaviv_gpu *gpu, bool component)
+{
+	struct device *dev = gpu->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	int err;
+
+	/* Map registers: */
+	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(gpu->mmio))
+		return PTR_ERR(gpu->mmio);
+
+	if (component) {
+		err = component_add(dev, &gpu_ops);
+		if (err < 0) {
+			dev_err(dev, "failed to register component: %d\n", err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static void etnaviv_gpu_plat_drv_fini(struct etnaviv_gpu *gpu, bool component)
+{
+	if (component)
+		component_del(gpu->dev, &gpu_ops);
+}
+
+int etnaviv_gpu_driver_create(struct device *dev, int irq, bool component,
+			      bool no_clk, pfn_gpu_init_t gpu_post_init)
 {
-	struct device *dev = &pdev->dev;
 	struct etnaviv_gpu *gpu;
 	int err;
 
@@ -1888,22 +1914,16 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	if (!gpu)
 		return -ENOMEM;
 
-	gpu->dev = &pdev->dev;
+	gpu->dev = dev;
 	mutex_init(&gpu->lock);
 	mutex_init(&gpu->sched_lock);
 
-	/* Map registers: */
-	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(gpu->mmio))
-		return PTR_ERR(gpu->mmio);
-
 	/* Get Interrupt: */
-	err = etnaviv_gpu_register_irq(gpu,  platform_get_irq(pdev, 0));
+	err = etnaviv_gpu_register_irq(gpu, irq);
 	if (err)
 		return err;
 
-	/* Get Clocks: */
-	err = etnaviv_gpu_clk_get(gpu);
+	err = etnaviv_gpu_clk_get(gpu, no_clk);
 	if (err)
 		return err;
 
@@ -1915,23 +1935,44 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
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
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to register component: %d\n", err);
-		return err;
-	}
+	gpu_post_init(gpu, component);
 
 	return 0;
 }
 
+void etnaviv_gpu_driver_destroy(struct device *dev, bool component,
+				pfn_gpu_fini_t gpu_early_fini)
+{
+	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
+
+	if (!gpu) {
+		dev_err(dev, "device not initialized properly\n");
+		return;
+	}
+
+	gpu_early_fini(gpu, component);
+
+	pm_runtime_disable(dev);
+}
+
+static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int irq = platform_get_irq(pdev, 0);
+
+	return etnaviv_gpu_driver_create(dev, irq, true, false, etnaviv_gpu_plat_drv_init);
+}
+
 static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
 {
-	component_del(&pdev->dev, &gpu_ops);
-	pm_runtime_disable(&pdev->dev);
+	struct device *dev = &pdev->dev;
+
+	etnaviv_gpu_driver_destroy(dev, true, etnaviv_gpu_plat_drv_fini);
+
 	return 0;
 }
 
@@ -1978,7 +2019,7 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
+const struct dev_pm_ops etnaviv_gpu_pm_ops = {
 	RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume, NULL)
 };
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 6da5209a7d64..cfcdc5dde9d9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -207,6 +207,18 @@ void etnaviv_gpu_pm_put(struct etnaviv_gpu *gpu);
 int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms);
 void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch);
 
+typedef int (*pfn_gpu_init_t)(struct etnaviv_gpu *gpu, bool component);
+typedef void (*pfn_gpu_fini_t)(struct etnaviv_gpu *gpu, bool component);
+
+int etnaviv_gpu_driver_create(struct device *dev, int irq, bool component,
+			      bool no_clk, pfn_gpu_init_t post_init);
+void etnaviv_gpu_driver_destroy(struct device *dev, bool component,
+				pfn_gpu_fini_t early_fini);
+
+int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data);
+void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data);
+
 extern struct platform_driver etnaviv_gpu_driver;
+extern const struct dev_pm_ops etnaviv_gpu_pm_ops;
 
 #endif /* __ETNAVIV_GPU_H__ */
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
new file mode 100644
index 000000000000..d0bb6615c434
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/pci.h>
+
+#include "etnaviv_drv.h"
+#include "etnaviv_gpu.h"
+#include "etnaviv_pci_drv.h"
+
+enum etnaviv_pci_gpu_family {
+	GC1000_IN_LS7A1000 = 0,
+	GC1000_IN_LS2K1000 = 1,
+};
+
+static int etnaviv_gpu_pci_init(struct etnaviv_gpu *gpu, bool component)
+{
+	struct pci_dev *pdev = to_pci_dev(gpu->dev);
+
+	/* Map registers, assume the PCI bar 0 contain the registers */
+	gpu->mmio = pcim_iomap(pdev, 0, 0);
+	if (IS_ERR(gpu->mmio))
+		return PTR_ERR(gpu->mmio);
+
+	gpu->no_clk = true;
+
+	return 0;
+}
+
+static void etnaviv_gpu_pci_fini(struct etnaviv_gpu *gpu, bool component)
+{
+	struct pci_dev *pdev = to_pci_dev(gpu->dev);
+
+	pci_clear_master(pdev);
+
+	dev_dbg(gpu->dev, "component %s\n", component ? "enabled" : "disabled");
+}
+
+static int etnaviv_pci_probe(struct pci_dev *pdev,
+			     const struct pci_device_id *ent)
+{
+	struct device *dev = &pdev->dev;
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
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
+	/* Create a GPU driver instance for the PCI device itself */
+	ret = etnaviv_gpu_driver_create(dev, pdev->irq, false, true,
+					etnaviv_gpu_pci_init);
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
+	etnaviv_gpu_driver_destroy(dev, false, etnaviv_gpu_pci_fini);
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
+	.driver.pm = pm_ptr(&etnaviv_gpu_pm_ops),
+};
+
+MODULE_DEVICE_TABLE(pci, etnaviv_pci_id_lists);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
new file mode 100644
index 000000000000..e4f8183c5558
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ETNAVIV_PCI_DRV_H__
+#define __ETNAVIV_PCI_DRV_H__
+
+#include <linux/pci.h>
+
+#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
+extern struct pci_driver etnaviv_pci_driver;
+#endif
+
+#endif
-- 
2.25.1

