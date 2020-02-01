Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC44B14F7BE
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2020 13:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B2C6EA69;
	Sat,  1 Feb 2020 12:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF326EA68
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2020 12:27:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7CDC9AF76;
 Sat,  1 Feb 2020 12:27:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 hdegoede@redhat.com, sam@ravnborg.org
Subject: [PATCH 1/4] drm/vram: Add helpers to validate a display mode's memory
 requirements
Date: Sat,  1 Feb 2020 13:27:41 +0100
Message-Id: <20200201122744.27165-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200201122744.27165-1-tzimmermann@suse.de>
References: <20200201122744.27165-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Devices with low amount of dedicated video memory may not be able
to use all possible display modes, as the framebuffers may not fit
into VRAM. The new helper function drm_vram_helper_mode_valid()
implements a simple test to sort out all display modes that can
not be used in any case. Drivers should call this function from
struct drm_mode_config_funcs.mode_valid.

Calling drm_vram_helper_mode_valid() works best for 32-bit framebuffers;
drivers with framebuffers of different color depth can use
drm_vram_helper_mode_valid_internal() instead.

The functionality was originally implemented by the ast driver, which
is being converted as well.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c        | 24 +--------
 drivers/gpu/drm/drm_gem_vram_helper.c | 76 +++++++++++++++++++++++++++
 include/drm/drm_gem_vram_helper.h     | 14 +++++
 3 files changed, 91 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index b79f484e9bd2..18a0a4ce00f6 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -388,31 +388,9 @@ static int ast_get_dram_info(struct drm_device *dev)
 	return 0;
 }
 
-enum drm_mode_status ast_mode_config_mode_valid(struct drm_device *dev,
-						const struct drm_display_mode *mode)
-{
-	static const unsigned long max_bpp = 4; /* DRM_FORMAT_XRGBA8888 */
-
-	struct ast_private *ast = dev->dev_private;
-	unsigned long fbsize, fbpages, max_fbpages;
-
-	/* To support double buffering, a framebuffer may not
-	 * consume more than half of the available VRAM.
-	 */
-	max_fbpages = (ast->vram_size / 2) >> PAGE_SHIFT;
-
-	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
-	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
-
-	if (fbpages > max_fbpages)
-		return MODE_MEM;
-
-	return MODE_OK;
-}
-
 static const struct drm_mode_config_funcs ast_mode_funcs = {
 	.fb_create = drm_gem_fb_create,
-	.mode_valid = ast_mode_config_mode_valid,
+	.mode_valid = drm_vram_helper_mode_valid,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index a4863326061a..89aebd500655 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1141,3 +1141,79 @@ void drm_vram_helper_release_mm(struct drm_device *dev)
 	dev->vram_mm = NULL;
 }
 EXPORT_SYMBOL(drm_vram_helper_release_mm);
+
+/*
+ * Mode-config helpers
+ */
+
+/**
+ * drm_vram_helper_mode_valid_internal - Tests if a display mode's
+ *	framebuffer fits into the available video memory.
+ * @dev:	the DRM device
+ * @mode:	the mode to test
+ * @max_bpp:	the maximum number of bytes per pixel
+ * Returns:
+ *	MODE_OK the display mode is supported, or an error code of type
+ *	enum drm_mode_status otherwise.
+ *
+ * This function tests if enough video memory is available using the
+ * specified display mode. Atomic modesetting requires importing the
+ * designated framebuffer into video memory before evicting the active
+ * one. Hence, any framebuffer may consume at most half of the available
+ * VRAM. Display modes that require a larger framebuffer can not be used,
+ * even of the CRTC does support them.
+ *
+ * Drivers should call this function from
+ * struct drm_mode_config_funcs.mode_valid. See drm_vram_helper_mode_valid()
+ * for framebuffers that use at most 32-bit color depth.
+ *
+ * Note:
+ *	The function can only test if the display mode is supported in
+ *	general. If you have too many framebuffers pinned to video memory,
+ *	a display mode may still not be usable in practice.
+ */
+enum drm_mode_status
+drm_vram_helper_mode_valid_internal(struct drm_device *dev,
+				    const struct drm_display_mode *mode,
+				    unsigned long max_bpp)
+{
+	struct drm_vram_mm *vmm = dev->vram_mm;
+	unsigned long fbsize, fbpages, max_fbpages;
+
+	if (!dev->vram_mm)
+		return MODE_BAD;
+
+	max_fbpages = (vmm->vram_size / 2) >> PAGE_SHIFT;
+
+	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
+	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
+
+	if (fbpages > max_fbpages)
+		return MODE_MEM;
+
+	return MODE_OK;
+}
+EXPORT_SYMBOL(drm_vram_helper_mode_valid_internal);
+
+/**
+ * drm_vram_helper_mode_valid - Tests if a display mode's
+ *	framebuffer fits into the available video memory.
+ * @dev:	the DRM device
+ * @mode:	the mode to test
+ * Returns:
+ *	MODE_OK the display mode is supported, or an error code of type
+ *	enum drm_mode_status otherwise.
+ *
+ * This function is a variant of drm_vram_helper_mode_valid_internal()
+ * for framebuffers that use at most 32-bit color depth. It can be plugged
+ * directly into struct drm_mode_config_funcs.mode_valid.
+ */
+enum drm_mode_status
+drm_vram_helper_mode_valid(struct drm_device *dev,
+			   const struct drm_display_mode *mode)
+{
+	static const unsigned long max_bpp = 4; /* DRM_FORMAT_XRGBA8888 */
+
+	return drm_vram_helper_mode_valid_internal(dev, mode, max_bpp);
+}
+EXPORT_SYMBOL(drm_vram_helper_mode_valid);
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 573e9fd109bf..e7d9144c79ad 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -6,6 +6,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_modes.h>
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
@@ -205,4 +206,17 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
 	struct drm_device *dev, uint64_t vram_base, size_t vram_size);
 void drm_vram_helper_release_mm(struct drm_device *dev);
 
+/*
+ * Mode-config helpers
+ */
+
+enum drm_mode_status
+drm_vram_helper_mode_valid_internal(struct drm_device *dev,
+				    const struct drm_display_mode *mode,
+				    unsigned long max_bpp);
+
+enum drm_mode_status
+drm_vram_helper_mode_valid(struct drm_device *dev,
+			   const struct drm_display_mode *mode);
+
 #endif
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
