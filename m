Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E517385FA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE57110E48A;
	Wed, 21 Jun 2023 13:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
 by gabe.freedesktop.org (Postfix) with ESMTP id A0D2110E2A5;
 Tue, 20 Jun 2023 10:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=MZJD1JGo73M2rqhodnSM1buRH6WTw9SSjxkFyiG3jOA=;
 b=Hz93RxdetHQYVG4Y3muSBhLdAzjHA8bCHeq37Ff9lJ8fHIlqwDXsFImuIwbq0I
 dhwWBrgLoOcR8B/n5J24McrYmbfS4okOrTt1axNU7Lzf9og0KzfaeIcKnUaWg11I
 VB06mw9mZKw0FuL8DGui4KUjGhrPXPxnDKKiQJj4HPxZY=
Received: from openarena.loongson.cn (unknown [114.242.206.180])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wAXg3CldZFkB8yiAQ--.11241S7;
 Tue, 20 Jun 2023 17:47:18 +0800 (CST)
From: Sui Jingfeng <18949883232@163.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v10 05/11] drm/etnaviv: Allow bypass component framework
Date: Tue, 20 Jun 2023 17:47:10 +0800
Message-Id: <20230620094716.2231414-6-18949883232@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230620094716.2231414-1-18949883232@163.com>
References: <20230620094716.2231414-1-18949883232@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXg3CldZFkB8yiAQ--.11241S7
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr1UAFyfXr4UZr4UXr17GFg_yoWfAry8pF
 47JayYkr48uayqg34UArn5ZF13Cw1Sq34Iy34kK3sakws8JryktF1YyFyjyFnxJFZ5WFW3
 tr1DtrWUCF40y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9VycUUUUU=
X-Originating-IP: [114.242.206.180]
X-CM-SenderInfo: jprymkizyyjjits6il2tof0z/1tbiEwmU0WE17eMXkQAAsD
X-Mailman-Approved-At: Wed, 21 Jun 2023 13:58:32 +0000
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

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

