Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6AC7369D6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 12:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3013210E2B3;
	Tue, 20 Jun 2023 10:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A6E310E2B4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:48:16 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Bx7erug5FkdiwHAA--.14781S3;
 Tue, 20 Jun 2023 18:48:14 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxCOXmg5FklJghAA--.28448S7; 
 Tue, 20 Jun 2023 18:48:14 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v10 05/11] drm/etnaviv: Allow bypass component framework
Date: Tue, 20 Jun 2023 18:48:00 +0800
Message-Id: <20230620104806.2236666-6-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230620104806.2236666-1-suijingfeng@loongson.cn>
References: <20230620104806.2236666-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxCOXmg5FklJghAA--.28448S7
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3XFyUAr4kJFy5uw4rGFyUurX_yoWfWw4rpF
 47JayYkr48uayqg34UArn5ZF1akw1Sq34Sy34kK3sakw45JryktF1YyFyjyFnxJFZ5WFW3
 tr1DtrWUCF40yagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
 wI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UVyIUUUUUU=
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

Originally, component frameworks were used to bind multiple GPU cores to a
virtual master. But there are chips that have only one GPU core integrated.
The component framework can be avoided under some circumstances, Another
reason is that usperspace programs such as X server and Mesa will try to
find the PCI device to use by default. Creating a virtual master device
for PCI GPUs cause unnecessary troubles.

This patch add additional code paths to allow bypassing the component
frameworks, platforms with a single GPU core could probably try the
non-component code path also. This patch is for code shaing between the
PCI driver and the platform driver.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 47 ++++++++++-----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 83 +++++++++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  3 +
 3 files changed, 91 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6a048be02857..93ca240cd4c0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -536,10 +536,9 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.minor              = 3,
 };
 
-/*
- * Platform driver:
- */
-static int etnaviv_bind(struct device *dev)
+static struct etnaviv_drm_private *etna_private_ptr;
+
+static int etnaviv_drm_bind(struct device *dev, bool component)
 {
 	struct etnaviv_drm_private *priv;
 	struct drm_device *drm;
@@ -556,12 +555,15 @@ static int etnaviv_bind(struct device *dev)
 	}
 
 	drm->dev_private = priv;
+	etna_private_ptr = priv;
 
 	dma_set_max_seg_size(dev, SZ_2G);
 
-	dev_set_drvdata(dev, drm);
+	if (component)
+		ret = component_bind_all(dev, drm);
+	else
+		ret = etnaviv_gpu_bind(dev, NULL, drm);
 
-	ret = component_bind_all(dev, drm);
 	if (ret < 0)
 		goto out_free_priv;
 
@@ -574,7 +576,10 @@ static int etnaviv_bind(struct device *dev)
 	return 0;
 
 out_unbind:
-	component_unbind_all(dev, drm);
+	if (component)
+		component_unbind_all(dev, drm);
+	else
+		etnaviv_gpu_unbind(dev, NULL, drm);
 out_free_priv:
 	etnaviv_free_private(priv);
 out_put:
@@ -583,14 +588,17 @@ static int etnaviv_bind(struct device *dev)
 	return ret;
 }
 
-static void etnaviv_unbind(struct device *dev)
+static void etnaviv_drm_unbind(struct device *dev, bool component)
 {
-	struct drm_device *drm = dev_get_drvdata(dev);
-	struct etnaviv_drm_private *priv = drm->dev_private;
+	struct etnaviv_drm_private *priv = etna_private_ptr;
+	struct drm_device *drm = priv->drm;
 
 	drm_dev_unregister(drm);
 
-	component_unbind_all(dev, drm);
+	if (component)
+		component_unbind_all(dev, drm);
+	else
+		etnaviv_gpu_unbind(dev, NULL, drm);
 
 	etnaviv_free_private(priv);
 
@@ -599,9 +607,22 @@ static void etnaviv_unbind(struct device *dev)
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
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 5e88fa95dac2..059be8c89c5a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1737,8 +1737,7 @@ static const struct thermal_cooling_device_ops cooling_ops = {
 	.set_cur_state = etnaviv_gpu_cooling_set_cur_state,
 };
 
-static int etnaviv_gpu_bind(struct device *dev, struct device *master,
-	void *data)
+int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
 	struct etnaviv_drm_private *priv = drm->dev_private;
@@ -1769,7 +1768,6 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	if (ret < 0)
 		goto out_sched;
 
-
 	gpu->drm = drm;
 	gpu->fence_context = dma_fence_context_alloc(1);
 	xa_init_flags(&gpu->user_fences, XA_FLAGS_ALLOC);
@@ -1798,8 +1796,7 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	return ret;
 }
 
-static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
-	void *data)
+void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
 
@@ -1867,9 +1864,11 @@ static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
 	return 0;
 }
 
-static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
+/* platform independent */
+
+static int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
+				     int irq, bool component, bool has_clk)
 {
-	struct device *dev = &pdev->dev;
 	struct etnaviv_gpu *gpu;
 	int err;
 
@@ -1877,24 +1876,22 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	if (!gpu)
 		return -ENOMEM;
 
-	gpu->dev = &pdev->dev;
+	gpu->dev = dev;
+	gpu->mmio = mmio;
 	mutex_init(&gpu->lock);
 	mutex_init(&gpu->sched_lock);
 
-	/* Map registers: */
-	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(gpu->mmio))
-		return PTR_ERR(gpu->mmio);
-
 	/* Get Interrupt: */
-	err = etnaviv_gpu_register_irq(gpu, platform_get_irq(pdev, 0));
+	err = etnaviv_gpu_register_irq(gpu, irq);
 	if (err)
 		return err;
 
 	/* Get Clocks: */
-	err = etnaviv_gpu_clk_get(gpu);
-	if (err)
-		return err;
+	if (has_clk) {
+		err = etnaviv_gpu_clk_get(gpu);
+		if (err)
+			return err;
+	}
 
 	/* TODO: figure out max mapped size */
 	dev_set_drvdata(dev, gpu);
@@ -1904,24 +1901,27 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	 * autosuspend delay is rather arbitary: no measurements have
 	 * yet been performed to determine an appropriate value.
 	 */
-	pm_runtime_use_autosuspend(gpu->dev);
-	pm_runtime_set_autosuspend_delay(gpu->dev, 200);
-	pm_runtime_enable(gpu->dev);
-
-	err = component_add(&pdev->dev, &gpu_ops);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to register component: %d\n", err);
-		return err;
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 200);
+	pm_runtime_enable(dev);
+
+	if (component) {
+		err = component_add(dev, &gpu_ops);
+		if (err < 0) {
+			dev_err(dev, "failed to register component: %d\n", err);
+			return err;
+		}
 	}
 
 	return 0;
 }
 
-static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
+static void etnaviv_gpu_driver_destroy(struct device *dev, bool component)
 {
-	component_del(&pdev->dev, &gpu_ops);
-	pm_runtime_disable(&pdev->dev);
-	return 0;
+	if (component)
+		component_del(dev, &gpu_ops);
+
+	pm_runtime_disable(dev);
 }
 
 static int etnaviv_gpu_rpm_suspend(struct device *dev)
@@ -1971,6 +1971,31 @@ static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
 	RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume, NULL)
 };
 
+static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *mmio;
+	int irq;
+
+	/* Map registers: */
+	mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mmio))
+		return PTR_ERR(mmio);
+
+	irq = platform_get_irq(pdev, 0);
+
+	return etnaviv_gpu_driver_create(dev, mmio, irq, true, true);
+}
+
+static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	etnaviv_gpu_driver_destroy(dev, true);
+
+	return 0;
+}
+
 struct platform_driver etnaviv_gpu_driver = {
 	.driver = {
 		.name = "etnaviv-gpu",
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 98c6f9c320fc..1ec829a649b5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -206,6 +206,9 @@ void etnaviv_gpu_pm_put(struct etnaviv_gpu *gpu);
 int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms);
 void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch);
 
+int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data);
+void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data);
+
 extern struct platform_driver etnaviv_gpu_driver;
 
 #endif /* __ETNAVIV_GPU_H__ */
-- 
2.25.1

