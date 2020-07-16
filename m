Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAB52222F2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 14:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534496EC57;
	Thu, 16 Jul 2020 12:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFB96EC55
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:53:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF9BFADC4;
 Thu, 16 Jul 2020 12:53:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, noralf@tronnes.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 1/6] drm/vram-helper: Managed vram helpers
Date: Thu, 16 Jul 2020 14:53:48 +0200
Message-Id: <20200716125353.31512-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716125353.31512-1-tzimmermann@suse.de>
References: <20200716125353.31512-1-tzimmermann@suse.de>
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

Calling drmm_vram_helper_init() sets up a managed instance of
VRAM MM. Releasing the DRM device also frees the memory manager.

The patch also updates the DRM documentation for VRAM helpers. The
tutorial now describes the new managed interface. The old interfaces
are deprecated and should not be used in new code.

v2:
	* rename init function to drmm_vram_helper_init()
	* return errno code from init function; caller does not
	  need vram_mm anyway
	* update documentation and remove docs for deprecated
	  un-managed functions

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 84 +++++++++++++++------------
 include/drm/drm_gem_vram_helper.h     |  3 +
 2 files changed, 51 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index ad096600d89f..c96d54f7c180 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -10,6 +10,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_prime.h>
@@ -40,12 +41,11 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * the frame's scanout buffer or the cursor image. If there's no more space
  * left in VRAM, inactive GEM objects can be moved to system memory.
  *
- * The easiest way to use the VRAM helper library is to call
- * drm_vram_helper_alloc_mm(). The function allocates and initializes an
- * instance of &struct drm_vram_mm in &struct drm_device.vram_mm . Use
- * &DRM_GEM_VRAM_DRIVER to initialize &struct drm_driver and
- * &DRM_VRAM_MM_FILE_OPERATIONS to initialize &struct file_operations;
- * as illustrated below.
+ * To initialize the VRAM helper library call drmm_vram_helper_alloc_mm().
+ * The function allocates and initializes an instance of &struct drm_vram_mm
+ * in &struct drm_device.vram_mm . Use &DRM_GEM_VRAM_DRIVER to initialize
+ * &struct drm_driver and  &DRM_VRAM_MM_FILE_OPERATIONS to initialize
+ * &struct file_operations; as illustrated below.
  *
  * .. code-block:: c
  *
@@ -69,7 +69,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  *		// setup device, vram base and size
  *		// ...
  *
- *		ret = drm_vram_helper_alloc_mm(dev, vram_base, vram_size);
+ *		ret = drmm_vram_helper_alloc_mm(dev, vram_base, vram_size);
  *		if (ret)
  *			return ret;
  *		return 0;
@@ -81,20 +81,12 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * manages an area of video RAM with VRAM MM and provides GEM VRAM objects
  * to userspace.
  *
- * To clean up the VRAM memory management, call drm_vram_helper_release_mm()
- * in the driver's clean-up code.
+ * You don't have to clean up the instance of VRAM MM.
+ * drmm_vram_helper_alloc_mm() is a managed interface that installs a
+ * clean-up handler to run during the DRM device's release.
  *
- * .. code-block:: c
- *
- *	void fini_drm_driver()
- *	{
- *		struct drm_device *dev = ...;
- *
- *		drm_vram_helper_release_mm(dev);
- *	}
- *
- * For drawing or scanout operations, buffer object have to be pinned in video
- * RAM. Call drm_gem_vram_pin() with &DRM_GEM_VRAM_PL_FLAG_VRAM or
+ * For drawing or scanout operations, rsp. buffer objects have to be pinned
+ * in video RAM. Call drm_gem_vram_pin() with &DRM_GEM_VRAM_PL_FLAG_VRAM or
  * &DRM_GEM_VRAM_PL_FLAG_SYSTEM to pin a buffer object in video RAM or system
  * memory. Call drm_gem_vram_unpin() to release the pinned object afterwards.
  *
@@ -1176,17 +1168,7 @@ static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
  * Helpers for integration with struct drm_device
  */
 
-/**
- * drm_vram_helper_alloc_mm - Allocates a device's instance of \
-	&struct drm_vram_mm
- * @dev:	the DRM device
- * @vram_base:	the base address of the video memory
- * @vram_size:	the size of the video memory in bytes
- *
- * Returns:
- * The new instance of &struct drm_vram_mm on success, or
- * an ERR_PTR()-encoded errno code otherwise.
- */
+/* deprecated; use drmm_vram_mm_init() */
 struct drm_vram_mm *drm_vram_helper_alloc_mm(
 	struct drm_device *dev, uint64_t vram_base, size_t vram_size)
 {
@@ -1212,11 +1194,6 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
 }
 EXPORT_SYMBOL(drm_vram_helper_alloc_mm);
 
-/**
- * drm_vram_helper_release_mm - Releases a device's instance of \
-	&struct drm_vram_mm
- * @dev:	the DRM device
- */
 void drm_vram_helper_release_mm(struct drm_device *dev)
 {
 	if (!dev->vram_mm)
@@ -1228,6 +1205,41 @@ void drm_vram_helper_release_mm(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_vram_helper_release_mm);
 
+static void drm_vram_mm_release(struct drm_device *dev, void *ptr)
+{
+	drm_vram_helper_release_mm(dev);
+}
+
+/**
+ * drmm_vram_helper_init - Initializes a device's instance of
+ *                         &struct drm_vram_mm
+ * @dev:	the DRM device
+ * @vram_base:	the base address of the video memory
+ * @vram_size:	the size of the video memory in bytes
+ *
+ * Creates a new instance of &struct drm_vram_mm and stores it in
+ * struct &drm_device.vram_mm. The instance is auto-managed and cleaned
+ * up as part of device cleanup. Calling this function multiple times
+ * will generate an error message.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drmm_vram_helper_init(struct drm_device *dev, uint64_t vram_base,
+			  size_t vram_size)
+{
+	struct drm_vram_mm *vram_mm;
+
+	if (drm_WARN_ON_ONCE(dev, dev->vram_mm))
+		return 0;
+
+	vram_mm = drm_vram_helper_alloc_mm(dev, vram_base, vram_size);
+	if (IS_ERR(vram_mm))
+		return PTR_ERR(vram_mm);
+	return drmm_add_action_or_reset(dev, drm_vram_mm_release, NULL);
+}
+EXPORT_SYMBOL(drmm_vram_helper_init);
+
 /*
  * Mode-config helpers
  */
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index b63bcd1b996d..035332f3723f 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -206,6 +206,9 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
 	struct drm_device *dev, uint64_t vram_base, size_t vram_size);
 void drm_vram_helper_release_mm(struct drm_device *dev);
 
+int drmm_vram_helper_init(struct drm_device *dev, uint64_t vram_base,
+			  size_t vram_size);
+
 /*
  * Mode-config helpers
  */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
