Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4298C17B7FC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093C96EC8B;
	Fri,  6 Mar 2020 08:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6236EC58
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 03:43:45 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7FCBC9CC80129CB05B7A;
 Fri,  6 Mar 2020 11:43:40 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Fri, 6 Mar 2020 11:43:31 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/hisilicon: Add the load and unload for hibmc_driver
Date: Fri, 6 Mar 2020 11:42:58 +0800
Message-ID: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

using the load and unload function provided by drm framework instead of
doing the same work in the hibmc_pci_probe and do some code cleanup.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 62 +++++++++----------------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h |  2 +
 2 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 79a180a..51f1c70 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -23,7 +23,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
-
+#include <drm/drm_pci.h>
 #include "hibmc_drm_drv.h"
 #include "hibmc_drm_regs.h"
 
@@ -49,6 +49,8 @@ static irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
 
 static struct drm_driver hibmc_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.load			= hibmc_load,
+	.unload			= hibmc_unload,
 	.fops			= &hibmc_fops,
 	.name			= "hibmc",
 	.date			= "20160828",
@@ -232,6 +234,21 @@ static int hibmc_hw_map(struct hibmc_drm_private *priv)
 	return 0;
 }
 
+static void hibmc_hw_unmap(struct hibmc_drm_private *priv)
+{
+	struct drm_device *dev = priv->dev;
+
+	if (priv->mmio) {
+		devm_iounmap(dev->dev, priv->mmio);
+		priv->mmio = NULL;
+	}
+
+	if (priv->fb_map) {
+		devm_iounmap(dev->dev, priv->fb_map);
+		priv->fb_map = NULL;
+	}
+}
+
 static int hibmc_hw_init(struct hibmc_drm_private *priv)
 {
 	int ret;
@@ -245,7 +262,7 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
 	return 0;
 }
 
-static int hibmc_unload(struct drm_device *dev)
+void hibmc_unload(struct drm_device *dev)
 {
 	struct hibmc_drm_private *priv = dev->dev_private;
 
@@ -258,11 +275,12 @@ static int hibmc_unload(struct drm_device *dev)
 
 	hibmc_kms_fini(priv);
 	hibmc_mm_fini(priv);
+	hibmc_hw_unmap(priv);
 	dev->dev_private = NULL;
 	return 0;
 }
 
-static int hibmc_load(struct drm_device *dev)
+int hibmc_load(struct drm_device *dev, unsigned long flags)
 {
 	struct hibmc_drm_private *priv;
 	int ret;
@@ -332,43 +350,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&hibmc_driver, &pdev->dev);
-	if (IS_ERR(dev)) {
-		DRM_ERROR("failed to allocate drm_device\n");
-		return PTR_ERR(dev);
-	}
-
-	dev->pdev = pdev;
-	pci_set_drvdata(pdev, dev);
-
-	ret = pci_enable_device(pdev);
-	if (ret) {
-		DRM_ERROR("failed to enable pci device: %d\n", ret);
-		goto err_free;
-	}
-
-	ret = hibmc_load(dev);
-	if (ret) {
-		DRM_ERROR("failed to load hibmc: %d\n", ret);
-		goto err_disable;
-	}
-
-	ret = drm_dev_register(dev, 0);
-	if (ret) {
-		DRM_ERROR("failed to register drv for userspace access: %d\n",
-			  ret);
-		goto err_unload;
-	}
-	return 0;
-
-err_unload:
-	hibmc_unload(dev);
-err_disable:
-	pci_disable_device(pdev);
-err_free:
-	drm_dev_put(dev);
-
-	return ret;
+	return drm_get_pci_dev(pdev, ent, &hibmc_driver);
 }
 
 static void hibmc_pci_remove(struct pci_dev *pdev)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index 50a0c1f..4e89cd7 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -37,6 +37,8 @@ void hibmc_set_power_mode(struct hibmc_drm_private *priv,
 void hibmc_set_current_gate(struct hibmc_drm_private *priv,
 			    unsigned int gate);
 
+int hibmc_load(struct drm_device *dev, unsigned long flags);
+void hibmc_unload(struct drm_device *dev);
 int hibmc_de_init(struct hibmc_drm_private *priv);
 int hibmc_vdac_init(struct hibmc_drm_private *priv);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
