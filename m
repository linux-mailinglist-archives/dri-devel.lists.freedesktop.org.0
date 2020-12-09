Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6301E2D442B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 15:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5756EA63;
	Wed,  9 Dec 2020 14:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5FD6EA54
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 14:25:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02DE0AD1E;
 Wed,  9 Dec 2020 14:25:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
 sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Subject: [PATCH v3 6/8] drm/shmem-helper: Provide a vmap function for
 short-term mappings
Date: Wed,  9 Dec 2020 15:25:25 +0100
Message-Id: <20201209142527.26415-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209142527.26415-1-tzimmermann@suse.de>
References: <20201209142527.26415-1-tzimmermann@suse.de>
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
Cc: linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implementations of the vmap/vunmap GEM callbacks may perform pinning
of the BO and may acquire the associated reservation object's lock.
Callers that only require a mapping of the contained memory can thus
interfere with other tasks that require exact pinning, such as scanout.
This is less of an issue with private SHMEM buffers, but may happen
with imported ones.

Therefore provide the new interfaces drm_gem_shmem_vmap_local() and
drm_gem_shmem_vunmap_local(), which only perform the vmap/vunmap
operations. Callers have to hold the reservation lock while the mapping
persists.

The affected callers are display updates in cirrus, gm12u320, mgag200
and udl. All are being changed to the new interface.

This patch also connects GEM SHMEM helpers to GEM object functions with
equivalent functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 71 +++++++++++++++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_mode.c | 16 ++++--
 drivers/gpu/drm/tiny/cirrus.c          | 10 +++-
 drivers/gpu/drm/tiny/gm12u320.c        | 14 +++--
 drivers/gpu/drm/udl/udl_modeset.c      | 18 ++++---
 include/drm/drm_gem_shmem_helper.h     |  2 +
 6 files changed, 115 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 9825c378dfa6..41663f48d46a 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -32,6 +32,8 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 	.get_sg_table = drm_gem_shmem_get_sg_table,
 	.vmap = drm_gem_shmem_vmap,
 	.vunmap = drm_gem_shmem_vunmap,
+	.vmap_local = drm_gem_shmem_vmap_local,
+	.vunmap_local = drm_gem_shmem_vunmap_local,
 	.mmap = drm_gem_shmem_mmap,
 };
 
@@ -313,7 +315,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct
 	return ret;
 }
 
-/*
+/**
  * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
  * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
@@ -346,6 +348,44 @@ int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 }
 EXPORT_SYMBOL(drm_gem_shmem_vmap);
 
+/**
+ * drm_gem_shmem_vmap_local - Create a virtual mapping for a shmem GEM object
+ * @shmem: shmem GEM object
+ * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
+ *       store.
+ *
+ * This function makes sure that a contiguous kernel virtual address mapping
+ * exists for the buffer backing the shmem GEM object.
+ *
+ * The function is called with the BO's reservation object locked. Callers must
+ * hold the lock until after unmapping the buffer.
+ *
+ * This function can be used to implement &drm_gem_object_funcs.vmap_local. But
+ * it can also be called by drivers directly, in which case it will hide the
+ * differences between dma-buf imported and natively allocated objects.
+ *
+ * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap_local().
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	int ret;
+
+	dma_resv_assert_held(obj->resv);
+
+	ret = mutex_lock_interruptible(&shmem->vmap_lock);
+	if (ret)
+		return ret;
+	ret = drm_gem_shmem_vmap_locked(shmem, map);
+	mutex_unlock(&shmem->vmap_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_shmem_vmap_local);
+
 static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 					struct dma_buf_map *map)
 {
@@ -366,7 +406,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 	drm_gem_shmem_put_pages(shmem);
 }
 
-/*
+/**
  * drm_gem_shmem_vunmap - Unmap a virtual mapping fo a shmem GEM object
  * @shmem: shmem GEM object
  * @map: Kernel virtual address where the SHMEM GEM object was mapped
@@ -389,6 +429,33 @@ void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 }
 EXPORT_SYMBOL(drm_gem_shmem_vunmap);
 
+/**
+ * drm_gem_shmem_vunmap_local - Unmap a virtual mapping fo a shmem GEM object
+ * @shmem: shmem GEM object
+ * @map: Kernel virtual address where the SHMEM GEM object was mapped
+ *
+ * This function cleans up a kernel virtual address mapping acquired by
+ * drm_gem_shmem_vmap_local(). The mapping is only removed when the use count
+ * drops to zero.
+ *
+ * The function is called with the BO's reservation object locked.
+ *
+ * This function can be used to implement &drm_gem_object_funcs.vmap_local.
+ * But it can also be called by drivers directly, in which case it will hide
+ * the differences between dma-buf imported and natively allocated objects.
+ */
+void drm_gem_shmem_vunmap_local(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	dma_resv_assert_held(obj->resv);
+
+	mutex_lock(&shmem->vmap_lock);
+	drm_gem_shmem_vunmap_locked(shmem, map);
+	mutex_unlock(&shmem->vmap_lock);
+}
+EXPORT_SYMBOL(drm_gem_shmem_vunmap_local);
+
 struct drm_gem_shmem_object *
 drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 				 struct drm_device *dev, size_t size,
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 1dfc42170059..a33e28d4c5e9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1552,22 +1552,32 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
 		      struct drm_rect *clip)
 {
 	struct drm_device *dev = &mdev->base;
+	struct drm_gem_object *obj = fb->obj[0];
 	struct dma_buf_map map;
 	void *vmap;
 	int ret;
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	ret = dma_resv_lock(obj->resv, NULL);
 	if (drm_WARN_ON(dev, ret))
-		return; /* BUG: SHMEM BO should always be vmapped */
+		return;
+	ret = drm_gem_shmem_vmap_local(obj, &map);
+	if (drm_WARN_ON(dev, ret))
+		goto err_dma_resv_unlock; /* BUG: SHMEM BO should always be vmapped */
 	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
 
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
+	drm_gem_shmem_vunmap_local(obj, &map);
+	dma_resv_unlock(obj->resv);
 
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
 	mgag200_set_offset(mdev, fb);
+
+	return;
+
+err_dma_resv_unlock:
+	dma_resv_unlock(obj->resv);
 }
 
 static void
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 561c49d8657a..58c694964148 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -315,6 +315,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 			       struct drm_rect *rect)
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
+	struct drm_gem_object *obj = fb->obj[0];
 	struct dma_buf_map map;
 	void *vmap;
 	int idx, ret;
@@ -323,9 +324,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		goto out;
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	ret = dma_resv_lock(obj->resv, NULL);
 	if (ret)
 		goto out_dev_exit;
+	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
+	if (ret)
+		goto out_dma_resv_unlock;
 	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	if (cirrus->cpp == fb->format->cpp[0])
@@ -345,9 +349,11 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	else
 		WARN_ON_ONCE("cpp mismatch");
 
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
 	ret = 0;
 
+	drm_gem_shmem_vunmap_local(obj, &map);
+out_dma_resv_unlock:
+	dma_resv_unlock(obj->resv);
 out_dev_exit:
 	drm_dev_exit(idx);
 out:
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 33f65f4626e5..b0c6e350f2b3 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -265,11 +265,16 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 	y1 = gm12u320->fb_update.rect.y1;
 	y2 = gm12u320->fb_update.rect.y2;
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	ret = dma_resv_lock(fb->obj[0]->resv, NULL);
 	if (ret) {
-		GM12U320_ERR("failed to vmap fb: %d\n", ret);
+		GM12U320_ERR("failed to reserve fb: %d\n", ret);
 		goto put_fb;
 	}
+	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
+	if (ret) {
+		GM12U320_ERR("failed to vmap fb: %d\n", ret);
+		goto unlock_resv;
+	}
 	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	if (fb->obj[0]->import_attach) {
@@ -321,8 +326,11 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 		if (ret)
 			GM12U320_ERR("dma_buf_end_cpu_access err: %d\n", ret);
 	}
+
+unlock_resv:
+	dma_resv_unlock(fb->obj[0]->resv);
 vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
+	drm_gem_shmem_vunmap_local(fb->obj[0], &map);
 put_fb:
 	drm_framebuffer_put(fb);
 	gm12u320->fb_update.fb = NULL;
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 9d34ec9d03f6..46b55b4d03c2 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -290,14 +290,18 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 	else if ((clip.x2 > fb->width) || (clip.y2 > fb->height))
 		return -EINVAL;
 
+	ret = dma_resv_lock(fb->obj[0]->resv, NULL);
+	if (ret)
+		return ret;
+
 	if (import_attach) {
 		ret = dma_buf_begin_cpu_access(import_attach->dmabuf,
 					       DMA_FROM_DEVICE);
 		if (ret)
-			return ret;
+			goto out_dma_resv_unlock;
 	}
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
 	if (ret) {
 		DRM_ERROR("failed to vmap fb\n");
 		goto out_dma_buf_end_cpu_access;
@@ -307,7 +311,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 	urb = udl_get_urb(dev);
 	if (!urb) {
 		ret = -ENOMEM;
-		goto out_drm_gem_shmem_vunmap;
+		goto out_drm_gem_shmem_vunmap_local;
 	}
 	cmd = urb->transfer_buffer;
 
@@ -320,7 +324,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 				       &cmd, byte_offset, dev_byte_offset,
 				       byte_width);
 		if (ret)
-			goto out_drm_gem_shmem_vunmap;
+			goto out_drm_gem_shmem_vunmap_local;
 	}
 
 	if (cmd > (char *)urb->transfer_buffer) {
@@ -336,8 +340,8 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 
 	ret = 0;
 
-out_drm_gem_shmem_vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
+out_drm_gem_shmem_vunmap_local:
+	drm_gem_shmem_vunmap_local(fb->obj[0], &map);
 out_dma_buf_end_cpu_access:
 	if (import_attach) {
 		tmp_ret = dma_buf_end_cpu_access(import_attach->dmabuf,
@@ -345,6 +349,8 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 		if (tmp_ret && !ret)
 			ret = tmp_ret; /* only update ret if not set yet */
 	}
+out_dma_resv_unlock:
+	dma_resv_unlock(fb->obj[0]->resv);
 
 	return ret;
 }
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 434328d8a0d9..3f59bdf749aa 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -114,7 +114,9 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_object *obj);
 void drm_gem_shmem_unpin(struct drm_gem_object *obj);
 int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int drm_gem_shmem_vmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
 void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+void drm_gem_shmem_vunmap_local(struct drm_gem_object *obj, struct dma_buf_map *map);
 
 int drm_gem_shmem_madvise(struct drm_gem_object *obj, int madv);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
