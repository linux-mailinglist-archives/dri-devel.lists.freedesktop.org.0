Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622CD7FE29B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 23:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93D110E68F;
	Wed, 29 Nov 2023 22:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::b3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F0F10E688
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 22:02:58 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701295377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyUSiWFDJ1Aend2dS2TEeLMsguIUheFpy9zWcbqWa7w=;
 b=eikZqMetgWBGKu/3ZTSNj+TtR6R33Lid0CsfcCi6nTSduEVgfnzcENf8lmzSdnbGM/vwJp
 EAblXcuiWBnM0RYhezVV0UkXTTUBsVvRIpei3zvjcXJZN2PEAIlNuLXQW3vd9rfJSmmrVP
 K70seng3LNpX9y5pu7mLSJIjEEh0dnI=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [etnaviv-next v12 8/8] drm/etnaviv: Support binding multiple GPU
 cores with component
Date: Thu, 30 Nov 2023 06:02:31 +0800
Message-Id: <20231129220231.12763-9-sui.jingfeng@linux.dev>
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
 Sui Jingfeng <sui.jingfeng@linux.dev>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because the JD9230P discrete GPU has two vivante 3D GPU (GC9200) cores,
the LingJiu GP102 discrete GPU has two separated GPU core (one is 3D and
another one is 2D). The etnaviv_create_platform_device() has been revised
to create a virtual platform device as the representation for the single
GPU core. All virtual gpu devices are bind to the real PCI master device
with the help of component.

Tested with LingJiu GP102 GPU:

 etnaviv 0000:05:00.0: LingJiu GP102 has 2 GPU cores
 etnaviv 0000:05:00.0: bound etnaviv-gpu,3d.0 (ops gpu_ops [etnaviv])
 etnaviv 0000:05:00.0: bound etnaviv-gpu,2d.1 (ops gpu_ops [etnaviv])
 etnaviv-gpu etnaviv-gpu,3d.0: model: GC860, revision: 4601
 etnaviv-gpu etnaviv-gpu,2d.0: model: GC300, revision: 2000
 [drm] Initialized etnaviv 1.3.0 20151214 for 0000:05:00.0 on minor 0

Tested with JEMO JD9230P GPU:

 etnaviv 0000:05:00.0: JingJia Micro JD9230P has 2 GPU cores
 etnaviv 0000:05:00.0: bound etnaviv-gpu,3d.0 (ops gpu_ops [etnaviv])
 etnaviv 0000:05:00.0: bound etnaviv-gpu,3d.1 (ops gpu_ops [etnaviv])
 etnaviv-gpu etnaviv-gpu,3d.0: model: GC9200, revision: 6304
 etnaviv-gpu etnaviv-gpu,3d.1: model: GC9200, revision: 6304
 [drm] Initialized etnaviv 1.3.0 20151214 for 0000:05:00.0 on minor 0

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c     |  37 ++++++-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h     |   8 ++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c     |  53 ++++++++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h     |   3 +
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 117 ++++++++++++++++++++--
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h |  19 ++++
 6 files changed, 212 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 4a7a451237d5..3652b3017c94 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -571,6 +571,10 @@ int etnaviv_drm_bind(struct device *dev, bool component)
 	if (ret < 0)
 		goto out_free_priv;
 
+	ret = etnaviv_register_irq_handler(dev, priv);
+	if (ret)
+		goto out_unbind;
+
 	load_gpu(drm);
 
 	ret = drm_dev_register(drm, 0);
@@ -623,7 +627,7 @@ static void etnaviv_master_unbind(struct device *dev)
 	return etnaviv_drm_unbind(dev, true);
 }
 
-static const struct component_master_ops etnaviv_master_ops = {
+const struct component_master_ops etnaviv_master_ops = {
 	.bind = etnaviv_master_bind,
 	.unbind = etnaviv_master_unbind,
 };
@@ -701,16 +705,36 @@ static struct platform_driver etnaviv_platform_driver = {
 	},
 };
 
-static int etnaviv_create_platform_device(const char *name,
-					  struct platform_device **ppdev)
+int etnaviv_create_platform_device(struct device *parent,
+				   const char *name, int id,
+				   struct resource *pres,
+				   void *data,
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
+	if (data) {
+		void *pdata = kmalloc(sizeof(void *), GFP_KERNEL);
+
+		*(void **)pdata = data;
+		pdev->dev.platform_data = pdata;
+	}
+
 	ret = platform_device_add(pdev);
 	if (ret) {
 		platform_device_put(pdev);
@@ -763,7 +787,10 @@ static int __init etnaviv_init(void)
 	if (np) {
 		of_node_put(np);
 
-		ret = etnaviv_create_platform_device("etnaviv", &etnaviv_drm);
+		ret = etnaviv_create_platform_device(NULL, "etnaviv",
+						     PLATFORM_DEVID_NONE,
+						     NULL, NULL,
+						     &etnaviv_drm);
 		if (ret)
 			goto unregister_platform_driver;
 	}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 6c9d934cbcbd..37e2e859856f 100644
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
@@ -98,8 +99,15 @@ bool etnaviv_cmd_validate_one(struct etnaviv_gpu *gpu,
 	u32 *stream, unsigned int size,
 	struct drm_etnaviv_gem_submit_reloc *relocs, unsigned int reloc_size);
 
+int etnaviv_create_platform_device(struct device *parent,
+				   const char *name, int id,
+				   struct resource *pres,
+				   void *data,
+				   struct platform_device **ppdev);
+
 int etnaviv_drm_bind(struct device *dev, bool component);
 void etnaviv_drm_unbind(struct device *dev, bool component);
+extern const struct component_master_ops etnaviv_master_ops;
 
 #ifdef CONFIG_DEBUG_FS
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 070650ac38ed..f69ea8e1751a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -20,6 +20,7 @@
 #include "etnaviv_gpu.h"
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
+#include "etnaviv_pci_drv.h"
 #include "etnaviv_perfmon.h"
 #include "etnaviv_sched.h"
 #include "common.xml.h"
@@ -28,6 +29,7 @@
 #include "cmdstream.xml.h"
 
 static const struct platform_device_id gpu_ids[] = {
+	{ .name = "etnaviv-gpu,3d" },
 	{ .name = "etnaviv-gpu,2d" },
 	{ },
 };
@@ -1871,6 +1873,33 @@ static const struct of_device_id etnaviv_gpu_match[] = {
 };
 MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
 
+/* dev is a pointer which point to the master device */
+int etnaviv_register_irq_handler(struct device *dev,
+				 struct etnaviv_drm_private *priv)
+{
+	int ret;
+	int i;
+
+	if (dev_is_platform(dev)) {
+		for (i = 0; i < priv->num_gpus; i++) {
+			struct etnaviv_gpu *gpu = priv->gpu[i];
+
+			ret = devm_request_irq(dev, gpu->irq, irq_handler, 0,
+					       dev_name(dev), priv);
+			if (ret) {
+				dev_err(dev, "failed to request IRQ handler: %d\n", ret);
+				return ret;
+			}
+
+			dev_info(dev, "GPU IRQ number: %d\n", gpu->irq);
+		}
+	} else if (IS_ENABLED(CONFIG_DRM_ETNAVIV_PCI_DRIVER)) {
+		ret = etnaviv_pci_register_irq_handler(dev, irq_handler, (void *)priv);
+	}
+
+	return ret;
+}
+
 int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
 			      int irq, bool component, bool has_clk)
 {
@@ -1886,16 +1915,7 @@ int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
 	mutex_init(&gpu->lock);
 	mutex_init(&gpu->sched_lock);
 
-	/* Get Interrupt: */
 	gpu->irq = irq;
-	if (gpu->irq < 0)
-		return gpu->irq;
-
-	err = devm_request_irq(dev, irq, irq_handler, 0, dev_name(dev), gpu);
-	if (err) {
-		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
-		return err;
-	}
 
 	/* Get Clocks: */
 	if (has_clk) {
@@ -1989,7 +2009,9 @@ static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
 static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	void **pp = (void **)dev->platform_data;
 	void __iomem *mmio;
+	bool has_clk;
 	int irq;
 
 	/* Map registers: */
@@ -1997,9 +2019,18 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(mmio))
 		return PTR_ERR(mmio);
 
-	irq = platform_get_irq(pdev, 0);
+	if (pp && dev->parent && IS_ENABLED(CONFIG_DRM_ETNAVIV_PCI_DRIVER)) {
+		has_clk = etnaviv_pci_platform_has_clk(dev, *pp);
+		irq = etnaviv_pci_platform_get_irq_line(dev, *pp);
+	} else {
+		has_clk = true;
+		irq = platform_get_irq(pdev, 0);
+	}
+
+	if (irq < 0)
+		return irq;
 
-	return etnaviv_gpu_driver_create(dev, mmio, irq, true, true);
+	return etnaviv_gpu_driver_create(dev, mmio, irq, true, has_clk);
 }
 
 static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 407f3a501b17..2f5e97d2fc85 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -215,6 +215,9 @@ void etnaviv_gpu_pm_put(struct etnaviv_gpu *gpu);
 int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms);
 void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch);
 
+int etnaviv_register_irq_handler(struct device *dev,
+				 struct etnaviv_drm_private *priv);
+
 int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data);
 void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
index b55ee6dd723e..ae6a5d931ec4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
@@ -1,11 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/component.h>
 #include <linux/pci.h>
 
 #include "etnaviv_drv.h"
 #include "etnaviv_gpu.h"
 #include "etnaviv_pci_drv.h"
 
+int etnaviv_component = -1;
+MODULE_PARM_DESC(component, "Force to use component subsystem");
+module_param_named(component, etnaviv_component, int, 0644);
+
 enum etnaviv_pci_gpu_chip_id {
 	GC_CORE_UNKNOWN = 0,
 	JM9100 = 1,
@@ -103,11 +108,58 @@ gc_core_plaform_data[GC_CORE_PCI_LAST] = {
 	},
 };
 
+/* dev is a pointer which point to the sub gpu device */
+bool etnaviv_pci_platform_has_clk(struct device *dev, void *data)
+{
+	struct etnaviv_pci_gpu_platform_data *pdata = data;
+
+	if (pdata && pdata->no_clk)
+		return false;
+
+	return true;
+}
+
+/* dev is a pointer which point to the sub gpu device */
+int etnaviv_pci_platform_get_irq_line(struct device *dev, void *data)
+{
+	struct etnaviv_pci_gpu_platform_data *pdata = data;
+
+	if (!dev_is_pci(dev->parent))
+		return -ENODEV;
+
+	if (pdata && pdata->share_irq) {
+		struct pci_dev *parent;
+		int irq;
+
+		parent = to_pci_dev(dev->parent);
+		irq = parent->irq;
+		return irq;
+	}
+
+	return -ENODEV;
+}
+
+/* dev is a pointer which point to the master device */
+int etnaviv_pci_register_irq_handler(struct device *dev,
+				     irqreturn_t (*fn)(int irq, void *data),
+				     void *data)
+{
+	struct pci_dev *pdev;
+
+	if (!dev_is_pci(dev))
+		return -ENODEV;
+
+	pdev = to_pci_dev(dev);
+
+	return devm_request_irq(dev, pdev->irq, fn, 0, dev_name(dev), data);
+}
+
 static int etnaviv_pci_probe(struct pci_dev *pdev,
 			     const struct pci_device_id *ent)
 {
 	enum etnaviv_pci_gpu_chip_id chip_id = ent->driver_data;
 	struct device *dev = &pdev->dev;
+	bool use_component = false;
 	const struct etnaviv_pci_gpu_platform_data *pdata;
 	void __iomem *mmio;
 	int ret;
@@ -126,18 +178,65 @@ static int etnaviv_pci_probe(struct pci_dev *pdev,
 
 	pdata = &gc_core_plaform_data[chip_id];
 
-	/* PCI bar 0 contain the MMIO registers */
-	mmio = pcim_iomap(pdev, pdata->mmio_bar, 0);
-	if (IS_ERR(mmio))
-		return PTR_ERR(mmio);
+	if (etnaviv_component >= 1)
+		use_component = true;
+	else if (etnaviv_component == 0)
+		use_component = false;
+	else
+		use_component = pdata->num_core > 1 ? true : false;
 
-	mmio += pdata->cores[0].offset;
+	if (use_component) {
+		unsigned int n_core = pdata->num_core;
+		struct component_match *matches = NULL;
+		unsigned int i;
 
-	ret = etnaviv_gpu_driver_create(dev, mmio, pdev->irq, false, false);
-	if (ret)
-		return ret;
+		dev_info(dev, "%s has %u GPU cores\n", pdata->name, n_core);
+
+		/* Create a virtual platform device for sub-component core */
+		for (i = 0; i < n_core; i++) {
+			resource_size_t start, offset, size;
+			struct platform_device *sub_gpu_v;
+			struct resource res;
+
+			start = pci_resource_start(pdev, pdata->mmio_bar);
+			offset = pdata->cores[i].offset;
+			size = pdata->cores[i].size;
+
+			memset(&res, 0, sizeof(res));
+			res.flags = IORESOURCE_MEM;
+			res.name = "reg";
+			res.start = start + offset;
+			res.end = start + offset + size - 1;
+
+			ret = etnaviv_create_platform_device(dev,
+							     pdata->cores[i].name,
+							     pdata->cores[i].id,
+							     &res,
+							     (void *)pdata,
+							     &sub_gpu_v);
+			if (ret)
+				return ret;
+
+			component_match_add(dev, &matches, component_compare_dev,
+					    &sub_gpu_v->dev);
+		}
+
+		ret = component_master_add_with_match(dev, &etnaviv_master_ops, matches);
+	} else {
+		mmio = pcim_iomap(pdev, pdata->mmio_bar, 0);
+		if (IS_ERR(mmio))
+			return PTR_ERR(mmio);
+
+		mmio += pdata->cores[0].offset;
+
+		ret = etnaviv_gpu_driver_create(dev, mmio, pdev->irq, false, false);
+		if (ret)
+			return ret;
+
+		ret = etnaviv_drm_bind(dev, false);
+	}
 
-	return etnaviv_drm_bind(dev, false);
+	return ret;
 }
 
 static void etnaviv_pci_remove(struct pci_dev *pdev)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
index 1db559ee5e9b..fd403c22610b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
@@ -3,16 +3,35 @@
 #ifndef __ETNAVIV_PCI_DRV_H__
 #define __ETNAVIV_PCI_DRV_H__
 
+#include <linux/irqreturn.h>
+
 #ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
 
 int etnaviv_register_pci_driver(void);
 void etnaviv_unregister_pci_driver(void);
 
+bool etnaviv_pci_platform_has_clk(struct device *dev, void *data);
+int etnaviv_pci_platform_get_irq_line(struct device *dev, void *data);
+int etnaviv_pci_register_irq_handler(struct device *dev,
+				     irqreturn_t (*fn)(int irq, void *data),
+				     void *data);
+
 #else
 
 static inline int etnaviv_register_pci_driver(void) { return 0; }
 static inline void etnaviv_unregister_pci_driver(void) { }
 
+static inline bool
+etnaviv_pci_platform_has_clk(struct device *dev, void *data) { return true; }
+
+static inline int
+etnaviv_pci_platform_get_irq_line(struct device *dev, void *data) { return 0; }
+
+static inline int
+etnaviv_pci_register_irq_handler(struct device *dev,
+				 irqreturn_t (*fn)(int irq, void *data),
+				 void *data) { return 0; }
+
 #endif
 
 #endif
-- 
2.34.1

