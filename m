Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75D7B6808
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 13:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D48110E28E;
	Tue,  3 Oct 2023 11:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id E769F10E276;
 Tue,  3 Oct 2023 11:34:01 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxJugm_BtlF80uAA--.30629S3;
 Tue, 03 Oct 2023 19:33:58 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx7y8k_Btl7JAXAA--.48472S5; 
 Tue, 03 Oct 2023 19:33:58 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v11 3/5] drm/etnaviv: Allow bypass component framework
Date: Tue,  3 Oct 2023 19:33:54 +0800
Message-Id: <20231003113356.645394-4-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003113356.645394-1-suijingfeng@loongson.cn>
References: <20231003113356.645394-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx7y8k_Btl7JAXAA--.48472S5
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jr48ZF4UtryUCF4fJrW8AFc_yoWftFWDpF
 47JFyYkrW8uayqg34DArn5ZF1akw1Sq34Iy34kK3sa9ws8JryktFyYyFyjyrnxJFZ5WFW3
 tr1DtrWUAF40y3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
 14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=
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
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Component framework is used to bind multiple GPU cores to a virtual master,
but there are SoC/chipset that contain only one GPU core. In those case,
component framework can be avoided. The reason is that usperspace programs
(such as X server and Mesa) will search the PCI device to use precedently.
Creating a virtual master device for PCI(e) GPUs is unnecessary and
incurring troubles.

This patch add additional code paths to allow bypassing the component
frameworks, which pave the way for us to introduce the PCI device driver
wrapper. The goal is to share the code between the PCI driver and the
platform driver as much as possible. Platforms with a single GPU core could
also try non-component code path.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 48 +++++++++++-----
 drivers/gpu/drm/etnaviv/etnaviv_drv.h |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 83 +++++++++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  7 +++
 4 files changed, 96 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 41ef7a8b7839..0b68c76d117e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -25,6 +25,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+static struct etnaviv_drm_private *etna_drm_priv_ptr;
+
 /*
  * DRM operations:
  */
@@ -545,10 +547,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.minor              = 3,
 };
 
-/*
- * Platform driver:
- */
-static int etnaviv_bind(struct device *dev)
+static int etnaviv_drm_bind(struct device *dev, bool component)
 {
 	struct etnaviv_drm_private *priv;
 	struct drm_device *drm;
@@ -564,13 +563,17 @@ static int etnaviv_bind(struct device *dev)
 		goto out_put;
 	}
 
+	priv->drm = drm;
 	drm->dev_private = priv;
+	etna_drm_priv_ptr = priv;
 
 	dma_set_max_seg_size(dev, SZ_2G);
 
-	dev_set_drvdata(dev, drm);
+	if (component)
+		ret = component_bind_all(dev, drm);
+	else
+		ret = etnaviv_gpu_bind(dev, NULL, drm);
 
-	ret = component_bind_all(dev, drm);
 	if (ret < 0)
 		goto out_free_priv;
 
@@ -583,7 +586,10 @@ static int etnaviv_bind(struct device *dev)
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
@@ -592,14 +598,17 @@ static int etnaviv_bind(struct device *dev)
 	return ret;
 }
 
-static void etnaviv_unbind(struct device *dev)
+static void etnaviv_drm_unbind(struct device *dev, bool component)
 {
-	struct drm_device *drm = dev_get_drvdata(dev);
-	struct etnaviv_drm_private *priv = drm->dev_private;
+	struct etnaviv_drm_private *priv = etna_drm_priv_ptr;
+	struct drm_device *drm = priv->drm;
 
 	drm_dev_unregister(drm);
 
-	component_unbind_all(dev, drm);
+	if (component)
+		component_unbind_all(dev, drm);
+	else
+		etnaviv_gpu_unbind(dev, NULL, drm);
 
 	etnaviv_free_private(priv);
 
@@ -608,9 +617,22 @@ static void etnaviv_unbind(struct device *dev)
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
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index b3eb1662e90c..e58f82e698de 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -35,6 +35,7 @@ struct etnaviv_file_private {
 };
 
 struct etnaviv_drm_private {
+	struct drm_device *drm;
 	int num_gpus;
 	struct etnaviv_gpu *gpu[ETNA_MAX_PIPES];
 	gfp_t shm_gfp_mask;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 4aa7c59ae581..330f8a272184 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1756,8 +1756,7 @@ static const struct thermal_cooling_device_ops cooling_ops = {
 	.set_cur_state = etnaviv_gpu_cooling_set_cur_state,
 };
 
-static int etnaviv_gpu_bind(struct device *dev, struct device *master,
-	void *data)
+int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
 	struct etnaviv_drm_private *priv = drm->dev_private;
@@ -1812,8 +1811,7 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	return ret;
 }
 
-static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
-	void *data)
+void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
 
@@ -1858,9 +1856,9 @@ static const struct of_device_id etnaviv_gpu_match[] = {
 };
 MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
 
-static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
+int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
+			      int irq, bool component, bool has_clk)
 {
-	struct device *dev = &pdev->dev;
 	struct etnaviv_gpu *gpu;
 	int err;
 
@@ -1868,31 +1866,28 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
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
-	gpu->irq = platform_get_irq(pdev, 0);
+	gpu->irq = irq;
 	if (gpu->irq < 0)
 		return gpu->irq;
 
-	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
-			       dev_name(gpu->dev), gpu);
+	err = devm_request_irq(dev, irq, irq_handler, 0, dev_name(dev), gpu);
 	if (err) {
 		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
 		return err;
 	}
 
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
@@ -1902,24 +1897,27 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
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
+void etnaviv_gpu_driver_destroy(struct device *dev, bool component)
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
@@ -1973,6 +1971,31 @@ static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
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
index 197e0037732e..407f3a501b17 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -215,6 +215,13 @@ void etnaviv_gpu_pm_put(struct etnaviv_gpu *gpu);
 int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms);
 void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch);
 
+int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data);
+void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data);
+
+int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
+			      int irq, bool component, bool has_clk);
+void etnaviv_gpu_driver_destroy(struct device *dev, bool component);
+
 extern struct platform_driver etnaviv_gpu_driver;
 
 #endif /* __ETNAVIV_GPU_H__ */
-- 
2.34.1

