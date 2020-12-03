Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B862CE9B7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAF86E157;
	Fri,  4 Dec 2020 08:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C43C6E0BE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 09:47:10 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CmrZm1TKNz782q;
 Thu,  3 Dec 2020 17:46:40 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 3 Dec 2020 17:47:04 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/hisilicon: Delete the entire file hibmc_ttm.c
Date: Thu, 3 Dec 2020 17:47:21 +0800
Message-ID: <1606988841-1373-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the entire file hibmc_ttm.c. drmm_vram_helper_init() can be
called directly from hibmc_load(). hibmc_dumb_create() and
hibmc_mode_funcs can go to hibmc_drm_drv.c

v2:
change Deletted to Delete

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/Makefile        |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 21 ++++++++++-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h |  4 --
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c     | 50 -------------------------
 4 files changed, 20 insertions(+), 57 deletions(-)
 delete mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
index 684ef79..d25c75e 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
+++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_ttm.o hibmc_drm_i2c.o
+hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o
 
 obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 5aea2e9..3687753 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -16,6 +16,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_irq.h>
 #include <drm/drm_managed.h>
@@ -43,6 +44,12 @@ static irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
+			     struct drm_mode_create_dumb *args)
+{
+	return drm_gem_vram_fill_create_dumb(file, dev, 0, 128, args);
+}
+
 static const struct drm_driver hibmc_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &hibmc_fops,
@@ -77,6 +84,13 @@ static const struct dev_pm_ops hibmc_pm_ops = {
 				hibmc_pm_resume)
 };
 
+static const struct drm_mode_config_funcs hibmc_mode_funcs = {
+	.mode_valid = drm_vram_helper_mode_valid,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+	.fb_create = drm_gem_fb_create,
+};
+
 static int hibmc_kms_init(struct hibmc_drm_private *priv)
 {
 	struct drm_device *dev = &priv->dev;
@@ -262,9 +276,12 @@ static int hibmc_load(struct drm_device *dev)
 	if (ret)
 		goto err;
 
-	ret = hibmc_mm_init(priv);
-	if (ret)
+	ret = drmm_vram_helper_init(dev, pci_resource_start(dev->pdev, 0),
+				    priv->fb_size);
+	if (ret) {
+		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
 		goto err;
+	}
 
 	ret = hibmc_kms_init(priv);
 	if (ret)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index 2786de5..a49c10e 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -64,10 +64,6 @@ int hibmc_de_init(struct hibmc_drm_private *priv);
 int hibmc_vdac_init(struct hibmc_drm_private *priv);
 
 int hibmc_mm_init(struct hibmc_drm_private *hibmc);
-int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
-		      struct drm_mode_create_dumb *args);
 int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_connector *connector);
 
-extern const struct drm_mode_config_funcs hibmc_mode_funcs;
-
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
deleted file mode 100644
index 892d566..0000000
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ /dev/null
@@ -1,50 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* Hisilicon Hibmc SoC drm driver
- *
- * Based on the bochs drm driver.
- *
- * Copyright (c) 2016 Huawei Limited.
- *
- * Author:
- *	Rongrong Zou <zourongrong@huawei.com>
- *	Rongrong Zou <zourongrong@gmail.com>
- *	Jianhua Li <lijianhua@huawei.com>
- */
-
-#include <linux/pci.h>
-
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_gem.h>
-#include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_gem_vram_helper.h>
-#include <drm/drm_print.h>
-
-#include "hibmc_drm_drv.h"
-
-int hibmc_mm_init(struct hibmc_drm_private *hibmc)
-{
-	int ret;
-	struct drm_device *dev = &hibmc->dev;
-
-	ret = drmm_vram_helper_init(dev, pci_resource_start(dev->pdev, 0),
-				    hibmc->fb_size);
-	if (ret) {
-		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
-		      struct drm_mode_create_dumb *args)
-{
-	return drm_gem_vram_fill_create_dumb(file, dev, 0, 128, args);
-}
-
-const struct drm_mode_config_funcs hibmc_mode_funcs = {
-	.mode_valid = drm_vram_helper_mode_valid,
-	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
-	.fb_create = drm_gem_fb_create,
-};
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
