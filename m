Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2762D714ED7
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 19:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D61B10E2C6;
	Mon, 29 May 2023 17:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id E823610E2CB;
 Mon, 29 May 2023 17:14:19 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dx+fFq3XRkrEkCAA--.5387S3;
 Tue, 30 May 2023 01:14:18 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxD79p3XRkLUJ_AA--.10654S7; 
 Tue, 30 May 2023 01:14:18 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 5/6] drm/etnaviv: expand driver support for the PCI devices
Date: Tue, 30 May 2023 01:14:16 +0800
Message-Id: <20230529171417.2146323-6-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529171417.2146323-1-suijingfeng@loongson.cn>
References: <20230529171417.2146323-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxD79p3XRkLUJ_AA--.10654S7
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvAXoWfGF1xGr4UZrW8tF4kZFW8JFb_yoW8Xw4xuo
 WxZrnxXa1rGFZ3t398AF12gFy3Zw4DC3s8C3Z8tws09ayvqF15tw13G3W3tF1Yvr1FgrWf
 Zw1Utw1rJF4xJFn5n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
 0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8JVWxJwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
 0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
 GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
 0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
 rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
 4UJbIYCTnIWIevJa73UjIFyTuYvjxUsrcTUUUUU
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
Cc: loongson-kernel@lists.loongnix.cn, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org
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
 drivers/gpu/drm/etnaviv/Makefile          |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c     | 62 ++++++++++++---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h     |  3 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c     | 97 ++++++++++++++++-------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h     | 12 +++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 88 ++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h | 10 +++
 7 files changed, 232 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h

diff --git a/drivers/gpu/drm/etnaviv/Makefile b/drivers/gpu/drm/etnaviv/Makefile
index 46e5ffad69a6..3f8b99664a58 100644
--- a/drivers/gpu/drm/etnaviv/Makefile
+++ b/drivers/gpu/drm/etnaviv/Makefile
@@ -13,6 +13,7 @@ etnaviv-y := \
 	etnaviv_iommu_v2.o \
 	etnaviv_iommu.o \
 	etnaviv_mmu.o \
+	etnaviv_pci_drv.o \
 	etnaviv_perfmon.o \
 	etnaviv_sched.o
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 56c98711f8e1..7ff795c5cc79 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -7,6 +7,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
+#include <linux/pci.h>
 #include <linux/uaccess.h>
 
 #include <drm/drm_debugfs.h>
@@ -21,6 +22,7 @@
 #include "etnaviv_gpu.h"
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
+#include "etnaviv_pci_drv.h"
 #include "etnaviv_perfmon.h"
 
 /*
@@ -525,6 +527,16 @@ static int etnaviv_alloc_private(struct device *dev,
 		return ret;
 	}
 
+	/*
+	 * Loongson Mips and LoongArch CPU(ls3a5000, ls3c5000, ls2k1000la)
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
@@ -539,10 +551,9 @@ static void etnaviv_free_private(struct etnaviv_drm_private *priv)
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
@@ -558,12 +569,15 @@ static int etnaviv_bind(struct device *dev)
 
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
 
@@ -585,14 +599,17 @@ static int etnaviv_bind(struct device *dev)
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
 
@@ -601,9 +618,22 @@ static void etnaviv_unbind(struct device *dev)
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
@@ -723,10 +753,14 @@ static int __init etnaviv_init(void)
 	if (ret != 0)
 		return ret;
 
-	ret = platform_driver_register(&etnaviv_platform_driver);
+	ret = pci_register_driver(&etnaviv_pci_driver);
 	if (ret != 0)
 		goto unregister_gpu_driver;
 
+	ret = platform_driver_register(&etnaviv_platform_driver);
+	if (ret != 0)
+		goto unregister_pci_driver;
+
 	/*
 	 * If the DT contains at least one available GPU device, instantiate
 	 * the DRM platform device.
@@ -748,6 +782,8 @@ static int __init etnaviv_init(void)
 
 unregister_platform_driver:
 	platform_driver_unregister(&etnaviv_platform_driver);
+unregister_pci_driver:
+	pci_unregister_driver(&etnaviv_pci_driver);
 unregister_gpu_driver:
 	platform_driver_unregister(&etnaviv_gpu_driver);
 	return ret;
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
index 000000000000..e64a03061d09
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
@@ -0,0 +1,88 @@
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
+	dev_dbg(gpu->dev, "component is %s\n",
+		component ? "enabled" : "disabled");
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
index 000000000000..6e50ec5f32b7
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ETNAVIV_PCI_DRV_H__
+#define __ETNAVIV_PCI_DRV_H__
+
+#include <linux/pci.h>
+
+extern struct pci_driver etnaviv_pci_driver;
+
+#endif
-- 
2.25.1

