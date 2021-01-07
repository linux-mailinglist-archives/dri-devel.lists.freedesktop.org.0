Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B903E2ECB7C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEC26E41A;
	Thu,  7 Jan 2021 08:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0CA6E409;
 Thu,  7 Jan 2021 08:07:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5013AE9A;
 Thu,  7 Jan 2021 08:07:56 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Subject: [PATCH v3 3/8] drm/hibmc: Remove references to struct drm_device.pdev
Date: Thu,  7 Jan 2021 09:07:43 +0100
Message-Id: <20210107080748.4768-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107080748.4768-1-tzimmermann@suse.de>
References: <20210107080748.4768-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Xinliang Liu <xinliang.liu@linaro.org>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen Feng <puck.chen@hisilicon.com>, Tian Tao <tiantao6@hisilicon.com>,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using struct drm_device.pdev is deprecated. Convert hibmc to struct
drm_device.dev. No functional changes.

v3:
	* rebased

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tian Tao <tiantao6@hisilicon.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao  <tiantao6@hisilicon.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 13 ++--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   | 61 +++++++++++++++++++
 3 files changed, 68 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 0d4e9023f54d..0a2edc7b754a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -210,8 +210,8 @@ static void hibmc_hw_config(struct hibmc_drm_private *priv)
 
 static int hibmc_hw_map(struct hibmc_drm_private *priv)
 {
-	struct drm_device *dev = &priv->dev;
 	struct pci_dev *pdev = dev->pdev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	resource_size_t addr, size, ioaddr, iosize;
 
 	ioaddr = pci_resource_start(pdev, 1);
@@ -255,13 +255,14 @@ static int hibmc_unload(struct drm_device *dev)
 	if (dev->irq_enabled)
 		drm_irq_uninstall(dev);
 
-	pci_disable_msi(dev->pdev);
+	pci_disable_msi(to_pci_dev(dev->dev));
 
 	return 0;
 }
 
 static int hibmc_load(struct drm_device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 	int ret;
 
@@ -269,8 +270,7 @@ static int hibmc_load(struct drm_device *dev)
 	if (ret)
 		goto err;
 
-	ret = drmm_vram_helper_init(dev, pci_resource_start(dev->pdev, 0),
-				    priv->fb_size);
+	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0), priv->fb_size);
 	if (ret) {
 		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
 		goto err;
@@ -286,11 +286,11 @@ static int hibmc_load(struct drm_device *dev)
 		goto err;
 	}
 
-	ret = pci_enable_msi(dev->pdev);
+	ret = pci_enable_msi(pdev);
 	if (ret) {
 		drm_warn(dev, "enabling MSI failed: %d\n", ret);
 	} else {
-		ret = drm_irq_install(dev, dev->pdev->irq);
+		ret = drm_irq_install(dev, pdev->irq);
 		if (ret)
 			drm_warn(dev, "install irq failed: %d\n", ret);
 	}
@@ -326,7 +326,6 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 	}
 
 	dev = &priv->dev;
-	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
 	ret = pcim_enable_device(pdev);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
index 86d712090d87..410bd019bb35 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
@@ -83,7 +83,7 @@ int hibmc_ddc_create(struct drm_device *drm_dev,
 	connector->adapter.owner = THIS_MODULE;
 	connector->adapter.class = I2C_CLASS_DDC;
 	snprintf(connector->adapter.name, I2C_NAME_SIZE, "HIS i2c bit bus");
-	connector->adapter.dev.parent = &drm_dev->pdev->dev;
+	connector->adapter.dev.parent = drm_dev->dev;
 	i2c_set_adapdata(&connector->adapter, connector);
 	connector->adapter.algo_data = &connector->bit_data;
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
new file mode 100644
index 000000000000..77f075075db2
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Hisilicon Hibmc SoC drm driver
+ *
+ * Based on the bochs drm driver.
+ *
+ * Copyright (c) 2016 Huawei Limited.
+ *
+ * Author:
+ *	Rongrong Zou <zourongrong@huawei.com>
+ *	Rongrong Zou <zourongrong@gmail.com>
+ *	Jianhua Li <lijianhua@huawei.com>
+ */
+
+#include <linux/pci.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_print.h>
+
+#include "hibmc_drm_drv.h"
+
+int hibmc_mm_init(struct hibmc_drm_private *hibmc)
+{
+	struct drm_vram_mm *vmm;
+	int ret;
+	struct drm_device *dev = hibmc->dev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+
+	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(pdev, 0),
+				       hibmc->fb_size);
+	if (IS_ERR(vmm)) {
+		ret = PTR_ERR(vmm);
+		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
+{
+	if (!hibmc->dev->vram_mm)
+		return;
+
+	drm_vram_helper_release_mm(hibmc->dev);
+}
+
+int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
+		      struct drm_mode_create_dumb *args)
+{
+	return drm_gem_vram_fill_create_dumb(file, dev, 0, 128, args);
+}
+
+const struct drm_mode_config_funcs hibmc_mode_funcs = {
+	.mode_valid = drm_vram_helper_mode_valid,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+	.fb_create = drm_gem_fb_create,
+};
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
