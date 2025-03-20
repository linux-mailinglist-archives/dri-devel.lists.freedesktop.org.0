Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE19EA6A385
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E663F10E5CF;
	Thu, 20 Mar 2025 10:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6BC10E5CF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:22:58 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZJM9X0fLMz27h6Z;
 Thu, 20 Mar 2025 18:23:28 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 8717514013B;
 Thu, 20 Mar 2025 18:22:51 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 20 Mar 2025 18:22:50 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 drm-dp 8/9] drm/hisilicon/hibmc: Add MSI irq getting and
 requesting for HPD
Date: Thu, 20 Mar 2025 18:14:54 +0800
Message-ID: <20250320101455.2538835-9-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250320101455.2538835-1-shiyongbang@huawei.com>
References: <20250320101455.2538835-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500013.china.huawei.com (7.221.188.12)
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

From: Baihan Li <libaihan@huawei.com>

To realize HPD feature, request irq for HPD , add its handler function.
We use pci_alloc_irq_vectors() to get our msi irq, because we have two
interrupts now.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
ChangeLog:
v4 -> v5:
  - remove pci_disable_msi() in hibmc_unload()
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  3 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 74 +++++++++++++++----
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  3 +
 3 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
index 5614b727a710..394b1e933c3a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
@@ -99,6 +99,9 @@
 
 #define HIBMC_DP_TIMING_SYNC_CTRL		0xFF0
 
+#define HIBMC_DP_INTSTAT			0x1e0724
+#define HIBMC_DP_INTCLR				0x1e0728
+
 /* dp serdes reg */
 #define HIBMC_DP_HOST_OFFSET		0x10000
 #define HIBMC_DP_LANE0_RATE_OFFSET	0x4
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 98b01c8aee8e..768b97f9e74a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -32,6 +32,8 @@
 
 DEFINE_DRM_GEM_FOPS(hibmc_fops);
 
+static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "vblank", "hpd" };
+
 static irqreturn_t hibmc_interrupt(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
@@ -49,6 +51,22 @@ static irqreturn_t hibmc_interrupt(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t hibmc_dp_interrupt(int irq, void *arg)
+{
+	struct drm_device *dev = (struct drm_device *)arg;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
+	u32 status;
+
+	status = readl(priv->mmio + HIBMC_DP_INTSTAT);
+	if (status) {
+		priv->dp.irq_status = status;
+		writel(status, priv->mmio + HIBMC_DP_INTCLR);
+		return IRQ_WAKE_THREAD;
+	}
+
+	return IRQ_HANDLED;
+}
+
 static int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 			     struct drm_mode_create_dumb *args)
 {
@@ -251,15 +269,48 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
 	return 0;
 }
 
-static int hibmc_unload(struct drm_device *dev)
+static void hibmc_unload(struct drm_device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-
 	drm_atomic_helper_shutdown(dev);
+}
 
-	free_irq(pdev->irq, dev);
+static int hibmc_msi_init(struct drm_device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	char name[32] = {0};
+	int valid_irq_num;
+	int irq;
+	int ret;
 
-	pci_disable_msi(to_pci_dev(dev->dev));
+	ret = pci_alloc_irq_vectors(pdev, HIBMC_MIN_VECTORS,
+				    HIBMC_MAX_VECTORS, PCI_IRQ_MSI);
+	if (ret < 0) {
+		drm_err(dev, "enabling MSI failed: %d\n", ret);
+		return ret;
+	}
+
+	valid_irq_num = ret;
+
+	for (int i = 0; i < valid_irq_num; i++) {
+		snprintf(name, ARRAY_SIZE(name) - 1, "%s-%s-%s",
+			 dev->driver->name, pci_name(pdev), g_irqs_names_map[i]);
+
+		irq = pci_irq_vector(pdev, i);
+
+		if (i)
+			/* PCI devices require shared interrupts. */
+			ret = devm_request_threaded_irq(&pdev->dev, irq,
+							hibmc_dp_interrupt,
+							hibmc_dp_hpd_isr,
+							IRQF_SHARED, name, dev);
+		else
+			ret = devm_request_irq(&pdev->dev, irq, hibmc_interrupt,
+					       IRQF_SHARED, name, dev);
+		if (ret) {
+			drm_err(dev, "install irq failed: %d\n", ret);
+			return ret;
+		}
+	}
 
 	return 0;
 }
@@ -291,15 +342,10 @@ static int hibmc_load(struct drm_device *dev)
 		goto err;
 	}
 
-	ret = pci_enable_msi(pdev);
+	ret = hibmc_msi_init(dev);
 	if (ret) {
-		drm_warn(dev, "enabling MSI failed: %d\n", ret);
-	} else {
-		/* PCI devices require shared interrupts. */
-		ret = request_irq(pdev->irq, hibmc_interrupt, IRQF_SHARED,
-				  dev->driver->name, dev);
-		if (ret)
-			drm_warn(dev, "install irq failed: %d\n", ret);
+		drm_err(dev, "hibmc msi init failed, ret:%d\n", ret);
+		goto err;
 	}
 
 	/* reset all the states of crtc/plane/encoder/connector */
@@ -375,7 +421,7 @@ static void hibmc_pci_remove(struct pci_dev *pdev)
 
 static void hibmc_pci_shutdown(struct pci_dev *pdev)
 {
-	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
+	hibmc_pci_remove(pdev);
 }
 
 static const struct pci_device_id hibmc_pci_table[] = {
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index daed1330b961..274feabe7df0 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -22,6 +22,9 @@
 
 #include "dp/dp_hw.h"
 
+#define HIBMC_MIN_VECTORS	1
+#define HIBMC_MAX_VECTORS	2
+
 struct hibmc_vdac {
 	struct drm_device *dev;
 	struct drm_encoder encoder;
-- 
2.33.0

