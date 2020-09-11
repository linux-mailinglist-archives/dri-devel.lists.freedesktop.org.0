Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA498265AFA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 09:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116146E366;
	Fri, 11 Sep 2020 07:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED826E366
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 07:59:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00E6BAFE6;
 Fri, 11 Sep 2020 07:59:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/vboxvideo: Use drm_gem_vram_vmap() interfaces
Date: Fri, 11 Sep 2020 09:59:22 +0200
Message-Id: <20200911075922.19317-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
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

VRAM helpers support ref counting for pin and vmap operations, no need
to avoid these operations, by employing the internal kmap interface. Just
use drm_gem_vram_vmap() and let it handle the details.

Also unexport the kmap interfaces from VRAM helpers. Vboxvideo was the
last user of these internal functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 56 +--------------------------
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 10 +++--
 include/drm/drm_gem_vram_helper.h     |  3 --
 3 files changed, 8 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 07447abb4134..0e3cdc40379c 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -97,8 +97,8 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * hardware's draing engine.
  *
  * To access a buffer object's memory from the DRM driver, call
- * drm_gem_vram_kmap(). It (optionally) maps the buffer into kernel address
- * space and returns the memory address. Use drm_gem_vram_kunmap() to
+ * drm_gem_vram_vmap(). It maps the buffer into kernel address
+ * space and returns the memory address. Use drm_gem_vram_vunmap() to
  * release the mapping.
  */
 
@@ -436,39 +436,6 @@ static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
 	return kmap->virtual;
 }
 
-/**
- * drm_gem_vram_kmap() - Maps a GEM VRAM object into kernel address space
- * @gbo:	the GEM VRAM object
- * @map:	establish a mapping if necessary
- * @is_iomem:	returns true if the mapped memory is I/O memory, or false \
-	otherwise; can be NULL
- *
- * This function maps the buffer object into the kernel's address space
- * or returns the current mapping. If the parameter map is false, the
- * function only queries the current mapping, but does not establish a
- * new one.
- *
- * Returns:
- * The buffers virtual address if mapped, or
- * NULL if not mapped, or
- * an ERR_PTR()-encoded error code otherwise.
- */
-void *drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
-			bool *is_iomem)
-{
-	int ret;
-	void *virtual;
-
-	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
-	if (ret)
-		return ERR_PTR(ret);
-	virtual = drm_gem_vram_kmap_locked(gbo, map, is_iomem);
-	ttm_bo_unreserve(&gbo->bo);
-
-	return virtual;
-}
-EXPORT_SYMBOL(drm_gem_vram_kmap);
-
 static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
 {
 	if (WARN_ON_ONCE(!gbo->kmap_use_count))
@@ -484,22 +451,6 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
 	 */
 }
 
-/**
- * drm_gem_vram_kunmap() - Unmaps a GEM VRAM object
- * @gbo:	the GEM VRAM object
- */
-void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo)
-{
-	int ret;
-
-	ret = ttm_bo_reserve(&gbo->bo, false, false, NULL);
-	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
-		return;
-	drm_gem_vram_kunmap_locked(gbo);
-	ttm_bo_unreserve(&gbo->bo);
-}
-EXPORT_SYMBOL(drm_gem_vram_kunmap);
-
 /**
  * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
  *                       space
@@ -511,9 +462,6 @@ EXPORT_SYMBOL(drm_gem_vram_kunmap);
  * permanently. Call drm_gem_vram_vunmap() with the returned address to
  * unmap and unpin the GEM VRAM object.
  *
- * If you have special requirements for the pinning or mapping operations,
- * call drm_gem_vram_pin() and drm_gem_vram_kmap() directly.
- *
  * Returns:
  * The buffer's virtual address on success, or
  * an ERR_PTR()-encoded error code otherwise.
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index d9a5af62af89..4fcc0a542b8a 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -397,11 +397,13 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 
 	vbox_crtc->cursor_enabled = true;
 
-	/* pinning is done in prepare/cleanup framebuffer */
-	src = drm_gem_vram_kmap(gbo, true, NULL);
+	src = drm_gem_vram_vmap(gbo);
 	if (IS_ERR(src)) {
+		/*
+		 * BUG: we should have pinned the BO in prepare_fb().
+		 */
 		mutex_unlock(&vbox->hw_mutex);
-		DRM_WARN("Could not kmap cursor bo, skipping update\n");
+		DRM_WARN("Could not map cursor bo, skipping update\n");
 		return;
 	}
 
@@ -414,7 +416,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	data_size = width * height * 4 + mask_size;
 
 	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
-	drm_gem_vram_kunmap(gbo);
+	drm_gem_vram_vunmap(gbo, src);
 
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 035332f3723f..b34f1da89cc7 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -101,9 +101,6 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
 int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
-void *drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
-			bool *is_iomem);
-void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo);
 void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo);
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
