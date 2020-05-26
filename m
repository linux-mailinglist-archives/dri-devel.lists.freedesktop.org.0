Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB261C8552
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 11:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0066E95C;
	Thu,  7 May 2020 09:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CCA6E958
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 09:03:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 664F3AE2B;
 Thu,  7 May 2020 09:03:22 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH v2 4/6] drm/mgag200: Use managed mode-config initialization
Date: Thu,  7 May 2020 11:03:13 +0200
Message-Id: <20200507090315.21274-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200507090315.21274-1-tzimmermann@suse.de>
References: <20200507090315.21274-1-tzimmermann@suse.de>
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
Cc: John Donnelly <John.p.donnelly@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mode configuration is now cleanued up automatically. While at it,
move all mode-config code into mgag200_mode.c. Done in preparation
of switching mgag200 to simple-KMS helpers.

v2:
	* improve commit message (Sam)
	* rebased during cherry pick
	* also move bpp_shift initialization

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 -
 drivers/gpu/drm/mgag200/mgag200_main.c | 28 ++-------------------
 drivers/gpu/drm/mgag200/mgag200_mode.c | 34 ++++++++++++++++++++++----
 3 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 93e2d232931af..65d7096cad889 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -201,7 +201,6 @@ mgag200_flags_from_driver_data(kernel_ulong_t driver_data)
 
 				/* mgag200_mode.c */
 int mgag200_modeset_init(struct mga_device *mdev);
-void mgag200_modeset_fini(struct mga_device *mdev);
 
 				/* mgag200_main.c */
 int mgag200_driver_load(struct drm_device *dev, unsigned long flags);
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 186197b8ffd35..fd651eda6f012 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -10,15 +10,8 @@
 
 #include <linux/pci.h>
 
-#include <drm/drm_crtc_helper.h>
-#include <drm/drm_gem_framebuffer_helper.h>
-
 #include "mgag200_drv.h"
 
-static const struct drm_mode_config_funcs mga_mode_funcs = {
-	.fb_create = drm_gem_fb_create
-};
-
 static int mga_probe_vram(struct mga_device *mdev, void __iomem *mem)
 {
 	int offset;
@@ -135,27 +128,14 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		return ret;
 
-	mdev->bpp_shifts[0] = 0;
-	mdev->bpp_shifts[1] = 1;
-	mdev->bpp_shifts[2] = 0;
-	mdev->bpp_shifts[3] = 2;
-
 	ret = mgag200_mm_init(mdev);
 	if (ret)
 		goto err_mm;
 
-	drm_mode_config_init(dev);
-	dev->mode_config.funcs = (void *)&mga_mode_funcs;
-	if (IS_G200_SE(mdev) && mdev->vram_fb_available < (2048*1024))
-		dev->mode_config.preferred_depth = 16;
-	else
-		dev->mode_config.preferred_depth = 32;
-	dev->mode_config.prefer_shadow = 1;
-
 	ret = mgag200_modeset_init(mdev);
 	if (ret) {
 		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
-		goto err_modeset;
+		goto err_mgag200_mm_fini;
 	}
 
 	ret = mgag200_cursor_init(mdev);
@@ -164,9 +144,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 
 	return 0;
 
-err_modeset:
-	drm_mode_config_cleanup(dev);
-	mgag200_cursor_fini(mdev);
+err_mgag200_mm_fini:
 	mgag200_mm_fini(mdev);
 err_mm:
 	dev->dev_private = NULL;
@@ -179,8 +157,6 @@ void mgag200_driver_unload(struct drm_device *dev)
 
 	if (mdev == NULL)
 		return;
-	mgag200_modeset_fini(mdev);
-	drm_mode_config_cleanup(dev);
 	mgag200_cursor_fini(mdev);
 	mgag200_mm_fini(mdev);
 	dev->dev_private = NULL;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index aaa73b29b04f0..7dad386913261 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -1615,6 +1616,17 @@ static struct drm_connector *mga_vga_init(struct drm_device *dev)
 	return connector;
 }
 
+static const struct drm_mode_config_funcs mgag200_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create
+};
+
+static unsigned int mgag200_preferred_depth(struct mga_device *mdev)
+{
+	if (IS_G200_SE(mdev) && mdev->vram_fb_available < (2048*1024))
+		return 16;
+	else
+		return 32;
+}
 
 int mgag200_modeset_init(struct mga_device *mdev)
 {
@@ -1623,13 +1635,30 @@ int mgag200_modeset_init(struct mga_device *mdev)
 	struct drm_connector *connector;
 	int ret;
 
+	mdev->bpp_shifts[0] = 0;
+	mdev->bpp_shifts[1] = 1;
+	mdev->bpp_shifts[2] = 0;
+	mdev->bpp_shifts[3] = 2;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret) {
+		drm_err(dev, "drmm_mode_config_init() failed, error %d\n",
+			ret);
+		return ret;
+	}
+
 	mdev->mode_info.mode_config_initialized = true;
 
 	dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
 	dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
 
+	dev->mode_config.preferred_depth = mgag200_preferred_depth(mdev);
+	dev->mode_config.prefer_shadow = 1;
+
 	dev->mode_config.fb_base = mdev->mc.vram_base;
 
+	dev->mode_config.funcs = &mgag200_mode_config_funcs;
+
 	mga_crtc_init(mdev);
 
 	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
@@ -1651,8 +1680,3 @@ int mgag200_modeset_init(struct mga_device *mdev)
 
 	return 0;
 }
-
-void mgag200_modeset_fini(struct mga_device *mdev)
-{
-
-}
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
