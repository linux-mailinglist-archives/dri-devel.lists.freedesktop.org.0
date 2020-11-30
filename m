Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2E2C83CD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8BD6E487;
	Mon, 30 Nov 2020 12:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49A289D7F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:04:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7747BAC91;
 Mon, 30 Nov 2020 12:04:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com
Subject: [PATCH 3/8] drm/vram-helper: Provide drm_gem_vram_vmap_unlocked()
Date: Mon, 30 Nov 2020 13:04:28 +0100
Message-Id: <20201130120433.7205-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130120433.7205-1-tzimmermann@suse.de>
References: <20201130120433.7205-1-tzimmermann@suse.de>
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

The new interface drm_gem_vram_vmap_unlocked() acquires a GEM object's
reservation lock and vmaps the buffer into the kernel address space. In
contract to the existing vmap implementation, it does not pin the buffer.
The function will be helpful for code that needs to vmap and vunmap
single GEM objects.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 52 +++++++++++++++++++++++++++
 include/drm/drm_gem_vram_helper.h     |  4 +++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 02ca22e90290..af54cb52423b 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -486,6 +486,58 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *ma
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
+/**
+ * drm_gem_vram_vmap_unlocked() - Locks a GEM VRAM object and maps it into
+ *                                kernel address space
+ * @gbo: The GEM VRAM object to map
+ * @map: Returns the kernel virtual address of the VRAM GEM object's backing
+ *       store.
+ * @ctx: The locking context.
+ *
+ * This vmap function locks a GEM VRAM object and maps its buffer into kernel
+ * address space. Call drm_gem_vram_vunmap_unlocked() with the returned address
+ * to unmap and unlock the GEM VRAM object.
+ *
+ * Returns:
+ * 0 on success, or a negative error code otherwise.
+ */
+int drm_gem_vram_vmap_unlocked(struct drm_gem_vram_object *gbo, struct dma_buf_map *map,
+			       struct ww_acquire_ctx *ctx)
+{
+	int ret;
+
+	ret = ttm_bo_reserve(&gbo->bo, true, false, ctx);
+	if (ret)
+		return ret;
+
+	ret = drm_gem_vram_kmap_locked(gbo, map);
+	if (ret)
+		goto err_ttm_bo_unreserve;
+
+	return 0;
+
+err_ttm_bo_unreserve:
+	ttm_bo_unreserve(&gbo->bo);
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_vram_vmap_unlocked);
+
+/**
+ * drm_gem_vram_vunmap_unlocked() - Unmaps and unlocks a GEM VRAM object
+ * @gbo: The GEM VRAM object to unmap
+ * @map: Kernel virtual address where the VRAM GEM object was mapped
+ *
+ * A call to drm_gem_vram_vunmap_unlocked() unmaps and unlocks a GEM VRAM
+ * buffer object. See the documentation for drm_gem_vram_vmap_unlocked()
+ * for more information.
+ */
+void drm_gem_vram_vunmap_unlocked(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
+{
+	drm_gem_vram_kunmap_locked(gbo, map);
+	ttm_bo_unreserve(&gbo->bo);
+}
+EXPORT_SYMBOL(drm_gem_vram_vunmap_unlocked);
+
 /**
  * drm_gem_vram_fill_create_dumb() - \
 	Helper for implementing &struct drm_driver.dumb_create
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index a4bac02249c2..2d22888b5754 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -19,6 +19,7 @@ struct drm_plane_state;
 struct drm_simple_display_pipe;
 struct filp;
 struct vm_area_struct;
+struct ww_acquire_ctx;
 
 #define DRM_GEM_VRAM_PL_FLAG_SYSTEM	(1 << 0)
 #define DRM_GEM_VRAM_PL_FLAG_VRAM	(1 << 1)
@@ -99,6 +100,9 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
 int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
+int drm_gem_vram_vmap_unlocked(struct drm_gem_vram_object *gbo, struct dma_buf_map *map,
+			       struct ww_acquire_ctx *ctx);
+void drm_gem_vram_vunmap_unlocked(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
 
 int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct drm_device *dev,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
