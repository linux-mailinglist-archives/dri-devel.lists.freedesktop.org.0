Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B62CD0F4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D796E983;
	Thu,  3 Dec 2020 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB596EA03
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 09:26:41 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CmD9b5Fn2zhYP4;
 Wed,  2 Dec 2020 17:26:11 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Wed, 2 Dec 2020 17:26:34 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>
Subject: [PATCH drm/hisilicon v2 1/3] drm/hisilicon: Code refactoring for
 hibmc_drm_drv
Date: Wed, 2 Dec 2020 17:26:50 +0800
Message-ID: <1606901212-8214-2-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606901212-8214-1-git-send-email-tiantao6@hisilicon.com>
References: <1606901212-8214-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the devm_drm_dev_alloc provided by the drm framework to alloc
a structure hibmc_drm_private.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 46 +++++++++++-------------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  |  4 +--
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c      |  8 +++--
 5 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index ea962ac..096eea9 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -499,7 +499,7 @@ static const struct drm_crtc_helper_funcs hibmc_crtc_helper_funcs = {
 
 int hibmc_de_init(struct hibmc_drm_private *priv)
 {
-	struct drm_device *dev = priv->dev;
+	struct drm_device *dev = &priv->dev;
 	struct drm_crtc *crtc = &priv->crtc;
 	struct drm_plane *plane = &priv->primary_plane;
 	int ret;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index d845657..13e8a28 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -79,31 +79,32 @@ static const struct dev_pm_ops hibmc_pm_ops = {
 
 static int hibmc_kms_init(struct hibmc_drm_private *priv)
 {
+	struct drm_device *dev = &priv->dev;
 	int ret;
 
-	drm_mode_config_init(priv->dev);
+	drm_mode_config_init(dev);
 	priv->mode_config_initialized = true;
 
-	priv->dev->mode_config.min_width = 0;
-	priv->dev->mode_config.min_height = 0;
-	priv->dev->mode_config.max_width = 1920;
-	priv->dev->mode_config.max_height = 1200;
+	dev->mode_config.min_width = 0;
+	dev->mode_config.min_height = 0;
+	dev->mode_config.max_width = 1920;
+	dev->mode_config.max_height = 1200;
 
-	priv->dev->mode_config.fb_base = priv->fb_base;
-	priv->dev->mode_config.preferred_depth = 32;
-	priv->dev->mode_config.prefer_shadow = 1;
+	dev->mode_config.fb_base = priv->fb_base;
+	dev->mode_config.preferred_depth = 32;
+	dev->mode_config.prefer_shadow = 1;
 
-	priv->dev->mode_config.funcs = (void *)&hibmc_mode_funcs;
+	dev->mode_config.funcs = (void *)&hibmc_mode_funcs;
 
 	ret = hibmc_de_init(priv);
 	if (ret) {
-		drm_err(priv->dev, "failed to init de: %d\n", ret);
+		drm_err(dev, "failed to init de: %d\n", ret);
 		return ret;
 	}
 
 	ret = hibmc_vdac_init(priv);
 	if (ret) {
-		drm_err(priv->dev, "failed to init vdac: %d\n", ret);
+		drm_err(dev, "failed to init vdac: %d\n", ret);
 		return ret;
 	}
 
@@ -113,7 +114,7 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
 static void hibmc_kms_fini(struct hibmc_drm_private *priv)
 {
 	if (priv->mode_config_initialized) {
-		drm_mode_config_cleanup(priv->dev);
+		drm_mode_config_cleanup(&priv->dev);
 		priv->mode_config_initialized = false;
 	}
 }
@@ -202,7 +203,7 @@ static void hibmc_hw_config(struct hibmc_drm_private *priv)
 
 static int hibmc_hw_map(struct hibmc_drm_private *priv)
 {
-	struct drm_device *dev = priv->dev;
+	struct drm_device *dev = &priv->dev;
 	struct pci_dev *pdev = dev->pdev;
 	resource_size_t addr, size, ioaddr, iosize;
 
@@ -258,17 +259,9 @@ static int hibmc_unload(struct drm_device *dev)
 
 static int hibmc_load(struct drm_device *dev)
 {
-	struct hibmc_drm_private *priv;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 	int ret;
 
-	priv = drmm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		drm_err(dev, "no memory to allocate for hibmc_drm_private\n");
-		return -ENOMEM;
-	}
-	dev->dev_private = priv;
-	priv->dev = dev;
-
 	ret = hibmc_hw_init(priv);
 	if (ret)
 		goto err;
@@ -310,6 +303,7 @@ static int hibmc_load(struct drm_device *dev)
 static int hibmc_pci_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
+	struct hibmc_drm_private *priv;
 	struct drm_device *dev;
 	int ret;
 
@@ -318,12 +312,14 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&hibmc_driver, &pdev->dev);
-	if (IS_ERR(dev)) {
+	priv = devm_drm_dev_alloc(&pdev->dev, &hibmc_driver,
+				  struct hibmc_drm_private, dev);
+	if (IS_ERR(priv)) {
 		DRM_ERROR("failed to allocate drm_device\n");
-		return PTR_ERR(dev);
+		return PTR_ERR(priv);
 	}
 
+	dev = &priv->dev;
 	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index f310a83..7e0c756 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -37,7 +37,7 @@ struct hibmc_drm_private {
 	resource_size_t  fb_size;
 
 	/* drm */
-	struct drm_device  *dev;
+	struct drm_device dev;
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
@@ -52,7 +52,7 @@ static inline struct hibmc_connector *to_hibmc_connector(struct drm_connector *c
 
 static inline struct hibmc_drm_private *to_hibmc_drm_private(struct drm_device *dev)
 {
-	return dev->dev_private;
+	return container_of(dev, struct hibmc_drm_private, dev);
 }
 
 void hibmc_set_power_mode(struct hibmc_drm_private *priv,
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 74e26c2..d35548d 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -96,7 +96,7 @@ static const struct drm_encoder_funcs hibmc_encoder_funcs = {
 
 int hibmc_vdac_init(struct hibmc_drm_private *priv)
 {
-	struct drm_device *dev = priv->dev;
+	struct drm_device *dev = &priv->dev;
 	struct hibmc_connector *hibmc_connector = &priv->connector;
 	struct drm_encoder *encoder = &priv->encoder;
 	struct drm_connector *connector = &hibmc_connector->base;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index 602ece1..e84fb81 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -25,7 +25,7 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc)
 {
 	struct drm_vram_mm *vmm;
 	int ret;
-	struct drm_device *dev = hibmc->dev;
+	struct drm_device *dev = &hibmc->dev;
 
 	vmm = drm_vram_helper_alloc_mm(dev,
 				       pci_resource_start(dev->pdev, 0),
@@ -41,10 +41,12 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc)
 
 void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
 {
-	if (!hibmc->dev->vram_mm)
+	struct drm_device *dev = &hibmc->dev;
+
+	if (!dev->vram_mm)
 		return;
 
-	drm_vram_helper_release_mm(hibmc->dev);
+	drm_vram_helper_release_mm(dev);
 }
 
 int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
