Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B1D446170
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 10:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB2989830;
	Fri,  5 Nov 2021 09:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263CB896FA;
 Fri,  5 Nov 2021 09:36:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99BA01FD43;
 Fri,  5 Nov 2021 09:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636104961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eILFFGjLT9iaZW85lu+77O/nxgQWyvngQ0+3NqL7z4I=;
 b=B3eVd5HRclOZAg0ts0781GR/vXu9ZQKCfgAnzrqlngaUEj5yoeQeIgc+03umIdSZ7qi4cD
 NnuetIHf7ttCq2yMDStiHsEcpyW/r80N8yqVfbFuTOEqAjS57dA0bXtARuODNBgF8zIZWo
 q/XWA502OYl7VQkMPHWglCmkgoM643Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636104961;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eILFFGjLT9iaZW85lu+77O/nxgQWyvngQ0+3NqL7z4I=;
 b=+hpngLOti9MMZC6iblC6mwfsk9wuFhgqCTKe7HcTbnKNCYz1XtQiMA+onsulFBY+93DV/h
 roqvNEXWDHl6AVCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 54A5313FDB;
 Fri,  5 Nov 2021 09:36:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QO25EwH7hGFTaQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Nov 2021 09:36:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 3/3] drm/shmem-helper: Pass GEM shmem object in public
 interfaces
Date: Fri,  5 Nov 2021 10:35:58 +0100
Message-Id: <20211105093558.5084-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105093558.5084-1-tzimmermann@suse.de>
References: <20211105093558.5084-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change all GEM SHMEM object functions that receive a GEM object
of type struct drm_gem_object to expect an object of type
struct drm_gem_shmem_object instead.

This change reduces the number of upcasts from struct drm_gem_object
by moving them into callers. The C compiler can now verify that the
GEM SHMEM functions are called with the correct type.

For consistency, the patch also renames drm_gem_shmem_free_object to
drm_gem_shmem_free. It further updates documentation for a number of
functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 78 ++++++++-----------
 drivers/gpu/drm/lima/lima_gem.c               | 10 +--
 drivers/gpu/drm/lima/lima_sched.c             |  4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  8 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  5 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  6 +-
 drivers/gpu/drm/v3d/v3d_bo.c                  |  8 +-
 drivers/gpu/drm/virtio/virtgpu_object.c       | 12 +--
 include/drm/drm_gem_shmem_helper.h            | 65 +++++++++-------
 11 files changed, 100 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 72ac263f20be..6521b0604a0f 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -117,15 +117,15 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
 /**
- * drm_gem_shmem_free_object - Free resources associated with a shmem GEM object
- * @obj: GEM object to free
+ * drm_gem_shmem_free - Free resources associated with a shmem GEM object
+ * @shmem: shmem GEM object to free
  *
  * This function cleans up the GEM object state and frees the memory used to
  * store the object itself.
  */
-void drm_gem_shmem_free_object(struct drm_gem_object *obj)
+void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 {
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	struct drm_gem_object *obj = &shmem->base;
 
 	WARN_ON(shmem->vmap_use_count);
 
@@ -149,7 +149,7 @@ void drm_gem_shmem_free_object(struct drm_gem_object *obj)
 	mutex_destroy(&shmem->vmap_lock);
 	kfree(shmem);
 }
-EXPORT_SYMBOL_GPL(drm_gem_shmem_free_object);
+EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
 
 static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 {
@@ -244,7 +244,7 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 
 /**
  * drm_gem_shmem_pin - Pin backing pages for a shmem GEM object
- * @obj: GEM object
+ * @shmem: shmem GEM object
  *
  * This function makes sure the backing pages are pinned in memory while the
  * buffer is exported.
@@ -252,10 +252,8 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-int drm_gem_shmem_pin(struct drm_gem_object *obj)
+int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 {
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-
 	WARN_ON(shmem->base.import_attach);
 
 	return drm_gem_shmem_get_pages(shmem);
@@ -264,15 +262,13 @@ EXPORT_SYMBOL(drm_gem_shmem_pin);
 
 /**
  * drm_gem_shmem_unpin - Unpin backing pages for a shmem GEM object
- * @obj: GEM object
+ * @shmem: shmem GEM object
  *
  * This function removes the requirement that the backing pages are pinned in
  * memory.
  */
-void drm_gem_shmem_unpin(struct drm_gem_object *obj)
+void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 {
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-
 	WARN_ON(shmem->base.import_attach);
 
 	drm_gem_shmem_put_pages(shmem);
@@ -346,9 +342,8 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map)
 {
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 	int ret;
 
 	ret = mutex_lock_interruptible(&shmem->vmap_lock);
@@ -394,10 +389,8 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
  * This function hides the differences between dma-buf imported and natively
  * allocated objects.
  */
-void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map)
 {
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-
 	mutex_lock(&shmem->vmap_lock);
 	drm_gem_shmem_vunmap_locked(shmem, map);
 	mutex_unlock(&shmem->vmap_lock);
@@ -432,10 +425,8 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 /* Update madvise status, returns true if not purged, else
  * false or -errno.
  */
-int drm_gem_shmem_madvise(struct drm_gem_object *obj, int madv)
+int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 {
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-
 	mutex_lock(&shmem->pages_lock);
 
 	if (shmem->madv >= 0)
@@ -449,14 +440,14 @@ int drm_gem_shmem_madvise(struct drm_gem_object *obj, int madv)
 }
 EXPORT_SYMBOL(drm_gem_shmem_madvise);
 
-void drm_gem_shmem_purge_locked(struct drm_gem_object *obj)
+void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 {
+	struct drm_gem_object *obj = &shmem->base;
 	struct drm_device *dev = obj->dev;
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
 	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
 
-	dma_unmap_sgtable(obj->dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -475,18 +466,15 @@ void drm_gem_shmem_purge_locked(struct drm_gem_object *obj)
 	 */
 	shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
 
-	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping,
-			0, (loff_t)-1);
+	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
 }
 EXPORT_SYMBOL(drm_gem_shmem_purge_locked);
 
-bool drm_gem_shmem_purge(struct drm_gem_object *obj)
+bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 {
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-
 	if (!mutex_trylock(&shmem->pages_lock))
 		return false;
-	drm_gem_shmem_purge_locked(obj);
+	drm_gem_shmem_purge_locked(shmem);
 	mutex_unlock(&shmem->pages_lock);
 
 	return true;
@@ -594,7 +582,7 @@ static const struct vm_operations_struct drm_gem_shmem_vm_ops = {
 
 /**
  * drm_gem_shmem_mmap - Memory-map a shmem GEM object
- * @obj: gem object
+ * @shmem: shmem GEM object
  * @vma: VMA for the area to be mapped
  *
  * This function implements an augmented version of the GEM DRM file mmap
@@ -603,9 +591,9 @@ static const struct vm_operations_struct drm_gem_shmem_vm_ops = {
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma)
 {
-	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_object *obj = &shmem->base;
 	int ret;
 
 	if (obj->import_attach) {
@@ -616,8 +604,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 		return dma_buf_mmap(obj->dma_buf, vma, 0);
 	}
 
-	shmem = to_drm_gem_shmem_obj(obj);
-
 	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret) {
 		drm_gem_vm_close(vma);
@@ -636,15 +622,13 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
 
 /**
  * drm_gem_shmem_print_info() - Print &drm_gem_shmem_object info for debugfs
+ * @shmem: shmem GEM object
  * @p: DRM printer
  * @indent: Tab indentation level
- * @obj: GEM object
  */
-void drm_gem_shmem_print_info(struct drm_printer *p, unsigned int indent,
-			      const struct drm_gem_object *obj)
+void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
+			      struct drm_printer *p, unsigned int indent)
 {
-	const struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-
 	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
@@ -654,7 +638,7 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
 /**
  * drm_gem_shmem_get_sg_table - Provide a scatter/gather table of pinned
  *                              pages for a shmem GEM object
- * @obj: GEM object
+ * @shmem: shmem GEM object
  *
  * This function exports a scatter/gather table suitable for PRIME usage by
  * calling the standard DMA mapping API.
@@ -665,9 +649,9 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
  * Returns:
  * A pointer to the scatter/gather table of pinned pages or NULL on failure.
  */
-struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_object *obj)
+struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 {
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+	struct drm_gem_object *obj = &shmem->base;
 
 	WARN_ON(shmem->base.import_attach);
 
@@ -678,7 +662,7 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
 /**
  * drm_gem_shmem_get_pages_sgt - Pin pages, dma map them, and return a
  *				 scatter/gather table for a shmem GEM object.
- * @obj: GEM object
+ * @shmem: shmem GEM object
  *
  * This function returns a scatter/gather table suitable for driver usage. If
  * the sg table doesn't exist, the pages are pinned, dma-mapped, and a sg
@@ -691,10 +675,10 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
  * Returns:
  * A pointer to the scatter/gather table of pinned pages or errno on failure.
  */
-struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj)
+struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 {
+	struct drm_gem_object *obj = &shmem->base;
 	int ret;
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 	struct sg_table *sgt;
 
 	if (shmem->sgt)
@@ -706,7 +690,7 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj)
 	if (ret)
 		return ERR_PTR(ret);
 
-	sgt = drm_gem_shmem_get_sg_table(&shmem->base);
+	sgt = drm_gem_shmem_get_sg_table(shmem);
 	if (IS_ERR(sgt)) {
 		ret = PTR_ERR(sgt);
 		goto err_put_pages;
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index a5580bd6522c..2723d333c608 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -127,7 +127,7 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 		if (err)
 			goto out;
 	} else {
-		struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(obj);
+		struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(shmem);
 
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
@@ -151,7 +151,7 @@ static void lima_gem_free_object(struct drm_gem_object *obj)
 	if (!list_empty(&bo->va))
 		dev_err(obj->dev->dev, "lima gem free bo still has va\n");
 
-	drm_gem_shmem_free_object(obj);
+	drm_gem_shmem_free(&bo->base);
 }
 
 static int lima_gem_object_open(struct drm_gem_object *obj, struct drm_file *file)
@@ -179,7 +179,7 @@ static int lima_gem_pin(struct drm_gem_object *obj)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(obj);
+	return drm_gem_shmem_pin(&bo->base);
 }
 
 static int lima_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
@@ -189,7 +189,7 @@ static int lima_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_vmap(obj, map);
+	return drm_gem_shmem_vmap(&bo->base, map);
 }
 
 static int lima_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
@@ -199,7 +199,7 @@ static int lima_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_mmap(obj, vma);
+	return drm_gem_shmem_mmap(&bo->base, vma);
 }
 
 static const struct drm_gem_object_funcs lima_gem_funcs = {
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 99d5f6f1a882..5612d73f238f 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -371,7 +371,7 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 		} else {
 			buffer_chunk->size = lima_bo_size(bo);
 
-			ret = drm_gem_shmem_vmap(&bo->base.base, &map);
+			ret = drm_gem_shmem_vmap(&bo->base, &map);
 			if (ret) {
 				kvfree(et);
 				goto out;
@@ -379,7 +379,7 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 
 			memcpy(buffer_chunk + 1, map.vaddr, buffer_chunk->size);
 
-			drm_gem_shmem_vunmap(&bo->base.base, &map);
+			drm_gem_shmem_vunmap(&bo->base, &map);
 		}
 
 		buffer_chunk = (void *)(buffer_chunk + 1) + buffer_chunk->size;
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 82ad9a67f251..96bb5a465627 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -427,7 +427,7 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 		}
 	}
 
-	args->retained = drm_gem_shmem_madvise(gem_obj, args->madv);
+	args->retained = drm_gem_shmem_madvise(&bo->base, args->madv);
 
 	if (args->retained) {
 		if (args->madv == PANFROST_MADV_DONTNEED)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index be1cc6579a71..6d9bdb9180cb 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -49,7 +49,7 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 		kvfree(bo->sgts);
 	}
 
-	drm_gem_shmem_free_object(obj);
+	drm_gem_shmem_free(&bo->base);
 }
 
 struct panfrost_gem_mapping *
@@ -187,10 +187,12 @@ void panfrost_gem_close(struct drm_gem_object *obj, struct drm_file *file_priv)
 
 static int panfrost_gem_pin(struct drm_gem_object *obj)
 {
-	if (to_panfrost_bo(obj)->is_heap)
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+
+	if (bo->is_heap)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(obj);
+	return drm_gem_shmem_pin(&bo->base);
 }
 
 static const struct drm_gem_object_funcs panfrost_gem_funcs = {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index 1b9f68d8e9aa..b0142341e223 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -52,7 +52,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
 		goto unlock_mappings;
 
 	panfrost_gem_teardown_mappings_locked(bo);
-	drm_gem_shmem_purge_locked(obj);
+	drm_gem_shmem_purge_locked(&bo->base);
 	ret = true;
 
 	mutex_unlock(&shmem->pages_lock);
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index f51d3f791a17..39562f2d11a4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -304,7 +304,8 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 {
 	struct panfrost_gem_object *bo = mapping->obj;
-	struct drm_gem_object *obj = &bo->base.base;
+	struct drm_gem_shmem_object *shmem = &bo->base;
+	struct drm_gem_object *obj = &shmem->base;
 	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
 	struct sg_table *sgt;
 	int prot = IOMMU_READ | IOMMU_WRITE;
@@ -315,7 +316,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	if (bo->noexec)
 		prot |= IOMMU_NOEXEC;
 
-	sgt = drm_gem_shmem_get_pages_sgt(obj);
+	sgt = drm_gem_shmem_get_pages_sgt(shmem);
 	if (WARN_ON(IS_ERR(sgt)))
 		return PTR_ERR(sgt);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index e116a4d9b8e5..1d36df5af98d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -105,7 +105,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 		goto err_close_bo;
 	}
 
-	ret = drm_gem_shmem_vmap(&bo->base, &map);
+	ret = drm_gem_shmem_vmap(bo, &map);
 	if (ret)
 		goto err_put_mapping;
 	perfcnt->buf = map.vaddr;
@@ -164,7 +164,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	return 0;
 
 err_vunmap:
-	drm_gem_shmem_vunmap(&bo->base, &map);
+	drm_gem_shmem_vunmap(bo, &map);
 err_put_mapping:
 	panfrost_gem_mapping_put(perfcnt->mapping);
 err_close_bo:
@@ -194,7 +194,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
 
 	perfcnt->user = NULL;
-	drm_gem_shmem_vunmap(&perfcnt->mapping->obj->base.base, &map);
+	drm_gem_shmem_vunmap(&perfcnt->mapping->obj->base, &map);
 	perfcnt->buf = NULL;
 	panfrost_gem_close(&perfcnt->mapping->obj->base.base, file_priv);
 	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index b50677beb6ac..0d9af62f69ad 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -47,7 +47,7 @@ void v3d_free_object(struct drm_gem_object *obj)
 	/* GPU execution may have dirtied any pages in the BO. */
 	bo->base.pages_mark_dirty_on_put = true;
 
-	drm_gem_shmem_free_object(obj);
+	drm_gem_shmem_free(&bo->base);
 }
 
 static const struct drm_gem_object_funcs v3d_gem_funcs = {
@@ -95,7 +95,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 	/* So far we pin the BO in the MMU for its lifetime, so use
 	 * shmem's helper for getting a lifetime sgt.
 	 */
-	sgt = drm_gem_shmem_get_pages_sgt(&bo->base.base);
+	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
 	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);
 
@@ -141,7 +141,7 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 	return bo;
 
 free_obj:
-	drm_gem_shmem_free_object(&shmem_obj->base);
+	drm_gem_shmem_free(shmem_obj);
 	return ERR_PTR(ret);
 }
 
@@ -159,7 +159,7 @@ v3d_prime_import_sg_table(struct drm_device *dev,
 
 	ret = v3d_bo_create_finish(obj);
 	if (ret) {
-		drm_gem_shmem_free_object(obj);
+		drm_gem_shmem_free(&to_v3d_bo(obj)->base);
 		return ERR_PTR(ret);
 	}
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 698431d233b8..187e10da2f17 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -79,10 +79,10 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 			sg_free_table(shmem->pages);
 			kfree(shmem->pages);
 			shmem->pages = NULL;
-			drm_gem_shmem_unpin(&bo->base.base);
+			drm_gem_shmem_unpin(&bo->base);
 		}
 
-		drm_gem_shmem_free_object(&bo->base.base);
+		drm_gem_shmem_free(&bo->base);
 	} else if (virtio_gpu_is_vram(bo)) {
 		struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
 
@@ -156,7 +156,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	struct scatterlist *sg;
 	int si, ret;
 
-	ret = drm_gem_shmem_pin(&bo->base.base);
+	ret = drm_gem_shmem_pin(&bo->base);
 	if (ret < 0)
 		return -EINVAL;
 
@@ -166,9 +166,9 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	 * dma-ops. This is discouraged for other drivers, but should be fine
 	 * since virtio_gpu doesn't support dma-buf import from other devices.
 	 */
-	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
+	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base);
 	if (!shmem->pages) {
-		drm_gem_shmem_unpin(&bo->base.base);
+		drm_gem_shmem_unpin(&bo->base);
 		return -EINVAL;
 	}
 
@@ -276,6 +276,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 err_put_id:
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 err_free_gem:
-	drm_gem_shmem_free_object(&shmem_obj->base);
+	drm_gem_shmem_free(shmem_obj);
 	return ret;
 }
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index efc59dd4aeeb..d829cb3e0b98 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -107,16 +107,17 @@ struct drm_gem_shmem_object {
 	container_of(obj, struct drm_gem_shmem_object, base)
 
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
-void drm_gem_shmem_free_object(struct drm_gem_object *obj);
+void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
 int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
-int drm_gem_shmem_pin(struct drm_gem_object *obj);
-void drm_gem_shmem_unpin(struct drm_gem_object *obj);
-int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
-void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
+void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
+int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map);
+void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map);
+int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
 
-int drm_gem_shmem_madvise(struct drm_gem_object *obj, int madv);
+int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
 
 static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
 {
@@ -125,18 +126,14 @@ static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem
 		!shmem->base.dma_buf && !shmem->base.import_attach;
 }
 
-void drm_gem_shmem_purge_locked(struct drm_gem_object *obj);
-bool drm_gem_shmem_purge(struct drm_gem_object *obj);
+void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
+bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
 
-int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
-			      struct drm_mode_create_dumb *args);
-
-int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
-
-void drm_gem_shmem_print_info(struct drm_printer *p, unsigned int indent,
-			      const struct drm_gem_object *obj);
+struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
+struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
 
-struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_object *obj);
+void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
+			      struct drm_printer *p, unsigned int indent);
 
 /*
  * GEM object functions
@@ -151,7 +148,9 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_object *obj);
  */
 static inline void drm_gem_shmem_object_free(struct drm_gem_object *obj)
 {
-	drm_gem_shmem_free_object(obj);
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	drm_gem_shmem_free(shmem);
 }
 
 /**
@@ -166,7 +165,9 @@ static inline void drm_gem_shmem_object_free(struct drm_gem_object *obj)
 static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsigned int indent,
 						   const struct drm_gem_object *obj)
 {
-	drm_gem_shmem_print_info(p, indent, obj);
+	const struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	drm_gem_shmem_print_info(shmem, p, indent);
 }
 
 /**
@@ -178,7 +179,9 @@ static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsign
  */
 static inline int drm_gem_shmem_object_pin(struct drm_gem_object *obj)
 {
-	return drm_gem_shmem_pin(obj);
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	return drm_gem_shmem_pin(shmem);
 }
 
 /**
@@ -190,7 +193,9 @@ static inline int drm_gem_shmem_object_pin(struct drm_gem_object *obj)
  */
 static inline void drm_gem_shmem_object_unpin(struct drm_gem_object *obj)
 {
-	drm_gem_shmem_unpin(obj);
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	drm_gem_shmem_unpin(shmem);
 }
 
 /**
@@ -205,7 +210,9 @@ static inline void drm_gem_shmem_object_unpin(struct drm_gem_object *obj)
  */
 static inline struct sg_table *drm_gem_shmem_object_get_sg_table(struct drm_gem_object *obj)
 {
-	return drm_gem_shmem_get_sg_table(obj);
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	return drm_gem_shmem_get_sg_table(shmem);
 }
 
 /*
@@ -221,7 +228,9 @@ static inline struct sg_table *drm_gem_shmem_object_get_sg_table(struct drm_gem_
  */
 static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
-	return drm_gem_shmem_vmap(obj, map);
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	return drm_gem_shmem_vmap(shmem, map);
 }
 
 /*
@@ -234,7 +243,9 @@ static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj, struct d
  */
 static inline void drm_gem_shmem_object_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
-	drm_gem_shmem_vunmap(obj, map);
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	drm_gem_shmem_vunmap(shmem, map);
 }
 
 /**
@@ -250,7 +261,9 @@ static inline void drm_gem_shmem_object_vunmap(struct drm_gem_object *obj, struc
  */
 static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
-	return drm_gem_shmem_mmap(obj, vma);
+	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
+
+	return drm_gem_shmem_mmap(shmem, vma);
 }
 
 /*
@@ -261,8 +274,8 @@ struct drm_gem_object *
 drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 				    struct dma_buf_attachment *attach,
 				    struct sg_table *sgt);
-
-struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj);
+int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
+			      struct drm_mode_create_dumb *args);
 
 /**
  * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
-- 
2.33.1

