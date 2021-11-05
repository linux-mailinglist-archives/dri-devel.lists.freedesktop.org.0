Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D1844616F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 10:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8B589722;
	Fri,  5 Nov 2021 09:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF976896EC;
 Fri,  5 Nov 2021 09:36:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E1E5218A4;
 Fri,  5 Nov 2021 09:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636104961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBpZiKTO8juIKTgHtk9Ii4DW6k3Fw2vpew+rYPZsleo=;
 b=LQlzdPVS5u49FBIpfGepfJd20mQRZWzBXcg0ZsodkcOyFaD22oONpv8zPjfHKisFxvnO1h
 SOlX7Gs+sud/X/aP6YT8SPRp4qaC25ygcqgSh2hSJRZlR7v4TOBPuDT1Xmtvu/sR6Xoz+U
 ryLU3DnrECaRrVZaiXih+pogTz/pGlY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636104961;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBpZiKTO8juIKTgHtk9Ii4DW6k3Fw2vpew+rYPZsleo=;
 b=azNCD1johrnti6BDwh/fOrdasWXc/SgTORKVkKdvKnhS60k1wB9sTeB+H5arQs+gTFGb+x
 vRqairUWxhM+eoAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EAC713B97;
 Fri,  5 Nov 2021 09:36:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ONGZAgH7hGFTaQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Nov 2021 09:36:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 2/3] drm/shmem-helper: Export dedicated wrappers for GEM
 object functions
Date: Fri,  5 Nov 2021 10:35:57 +0100
Message-Id: <20211105093558.5084-3-tzimmermann@suse.de>
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

Wrap GEM SHMEM functions for struct drm_gem_object_funcs and update
all callers. This will allow for an update of the public interfaces
of the GEM SHMEM helper library.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c  |  45 ++++-----
 drivers/gpu/drm/lima/lima_gem.c         |   8 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  12 +--
 drivers/gpu/drm/v3d/v3d_bo.c            |  14 +--
 drivers/gpu/drm/virtio/virtgpu_object.c |  15 ++-
 include/drm/drm_gem_shmem_helper.h      | 120 ++++++++++++++++++++++++
 6 files changed, 161 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index cd93e91b3487..72ac263f20be 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -30,14 +30,14 @@
  */
 
 static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
-	.free = drm_gem_shmem_free_object,
-	.print_info = drm_gem_shmem_print_info,
-	.pin = drm_gem_shmem_pin,
-	.unpin = drm_gem_shmem_unpin,
-	.get_sg_table = drm_gem_shmem_get_sg_table,
-	.vmap = drm_gem_shmem_vmap,
-	.vunmap = drm_gem_shmem_vunmap,
-	.mmap = drm_gem_shmem_mmap,
+	.free = drm_gem_shmem_object_free,
+	.print_info = drm_gem_shmem_object_print_info,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = drm_gem_shmem_object_mmap,
 };
 
 static struct drm_gem_shmem_object *
@@ -121,8 +121,7 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
  * @obj: GEM object to free
  *
  * This function cleans up the GEM object state and frees the memory used to
- * store the object itself. It should be used to implement
- * &drm_gem_object_funcs.free.
+ * store the object itself.
  */
 void drm_gem_shmem_free_object(struct drm_gem_object *obj)
 {
@@ -248,8 +247,7 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
  * @obj: GEM object
  *
  * This function makes sure the backing pages are pinned in memory while the
- * buffer is exported. It should only be used to implement
- * &drm_gem_object_funcs.pin.
+ * buffer is exported.
  *
  * Returns:
  * 0 on success or a negative error code on failure.
@@ -269,7 +267,7 @@ EXPORT_SYMBOL(drm_gem_shmem_pin);
  * @obj: GEM object
  *
  * This function removes the requirement that the backing pages are pinned in
- * memory. It should only be used to implement &drm_gem_object_funcs.unpin.
+ * memory.
  */
 void drm_gem_shmem_unpin(struct drm_gem_object *obj)
 {
@@ -340,11 +338,8 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct
  *       store.
  *
  * This function makes sure that a contiguous kernel virtual address mapping
- * exists for the buffer backing the shmem GEM object.
- *
- * This function can be used to implement &drm_gem_object_funcs.vmap. But it can
- * also be called by drivers directly, in which case it will hide the
- * differences between dma-buf imported and natively allocated objects.
+ * exists for the buffer backing the shmem GEM object. It hides the differences
+ * between dma-buf imported and natively allocated objects.
  *
  * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap().
  *
@@ -396,9 +391,8 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
  * drm_gem_shmem_vmap(). The mapping is only removed when the use count drops to
  * zero.
  *
- * This function can be used to implement &drm_gem_object_funcs.vmap. But it can
- * also be called by drivers directly, in which case it will hide the
- * differences between dma-buf imported and natively allocated objects.
+ * This function hides the differences between dma-buf imported and natively
+ * allocated objects.
  */
 void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 {
@@ -604,8 +598,7 @@ static const struct vm_operations_struct drm_gem_shmem_vm_ops = {
  * @vma: VMA for the area to be mapped
  *
  * This function implements an augmented version of the GEM DRM file mmap
- * operation for shmem objects. Drivers which employ the shmem helpers should
- * use this function as their &drm_gem_object_funcs.mmap handler.
+ * operation for shmem objects.
  *
  * Returns:
  * 0 on success or a negative error code on failure.
@@ -646,8 +639,6 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
  * @p: DRM printer
  * @indent: Tab indentation level
  * @obj: GEM object
- *
- * This implements the &drm_gem_object_funcs.info callback.
  */
 void drm_gem_shmem_print_info(struct drm_printer *p, unsigned int indent,
 			      const struct drm_gem_object *obj)
@@ -666,9 +657,7 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
  * @obj: GEM object
  *
  * This function exports a scatter/gather table suitable for PRIME usage by
- * calling the standard DMA mapping API. Drivers should not call this function
- * directly, instead it should only be used as an implementation for
- * &drm_gem_object_funcs.get_sg_table.
+ * calling the standard DMA mapping API.
  *
  * Drivers who need to acquire an scatter/gather table for objects need to call
  * drm_gem_shmem_get_pages_sgt() instead.
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 640acc060467..a5580bd6522c 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -206,12 +206,12 @@ static const struct drm_gem_object_funcs lima_gem_funcs = {
 	.free = lima_gem_free_object,
 	.open = lima_gem_object_open,
 	.close = lima_gem_object_close,
-	.print_info = drm_gem_shmem_print_info,
+	.print_info = drm_gem_shmem_object_print_info,
 	.pin = lima_gem_pin,
-	.unpin = drm_gem_shmem_unpin,
-	.get_sg_table = drm_gem_shmem_get_sg_table,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
 	.vmap = lima_gem_vmap,
-	.vunmap = drm_gem_shmem_vunmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = lima_gem_mmap,
 };
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 23377481f4e3..be1cc6579a71 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -197,13 +197,13 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.free = panfrost_gem_free_object,
 	.open = panfrost_gem_open,
 	.close = panfrost_gem_close,
-	.print_info = drm_gem_shmem_print_info,
+	.print_info = drm_gem_shmem_object_print_info,
 	.pin = panfrost_gem_pin,
-	.unpin = drm_gem_shmem_unpin,
-	.get_sg_table = drm_gem_shmem_get_sg_table,
-	.vmap = drm_gem_shmem_vmap,
-	.vunmap = drm_gem_shmem_vunmap,
-	.mmap = drm_gem_shmem_mmap,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = drm_gem_shmem_object_mmap,
 };
 
 /**
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 6a8731ab9d7d..b50677beb6ac 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -52,13 +52,13 @@ void v3d_free_object(struct drm_gem_object *obj)
 
 static const struct drm_gem_object_funcs v3d_gem_funcs = {
 	.free = v3d_free_object,
-	.print_info = drm_gem_shmem_print_info,
-	.pin = drm_gem_shmem_pin,
-	.unpin = drm_gem_shmem_unpin,
-	.get_sg_table = drm_gem_shmem_get_sg_table,
-	.vmap = drm_gem_shmem_vmap,
-	.vunmap = drm_gem_shmem_vunmap,
-	.mmap = drm_gem_shmem_mmap,
+	.print_info = drm_gem_shmem_object_print_info,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = drm_gem_shmem_object_mmap,
 };
 
 /* gem_create_object function for allocating a BO struct and doing
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index f648b0e24447..698431d233b8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -116,15 +116,14 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.free = virtio_gpu_free_object,
 	.open = virtio_gpu_gem_object_open,
 	.close = virtio_gpu_gem_object_close,
-
-	.print_info = drm_gem_shmem_print_info,
+	.print_info = drm_gem_shmem_object_print_info,
 	.export = virtgpu_gem_prime_export,
-	.pin = drm_gem_shmem_pin,
-	.unpin = drm_gem_shmem_unpin,
-	.get_sg_table = drm_gem_shmem_get_sg_table,
-	.vmap = drm_gem_shmem_vmap,
-	.vunmap = drm_gem_shmem_vunmap,
-	.mmap = drm_gem_shmem_mmap,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = drm_gem_shmem_object_mmap,
 };
 
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 6b47eb7d9f76..efc59dd4aeeb 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -137,6 +137,126 @@ void drm_gem_shmem_print_info(struct drm_printer *p, unsigned int indent,
 			      const struct drm_gem_object *obj);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_object *obj);
+
+/*
+ * GEM object functions
+ */
+
+/**
+ * drm_gem_shmem_object_free - GEM object function for drm_gem_shmem_free_object()
+ * @obj: GEM object to free
+ *
+ * This function wraps drm_gem_shmem_free_object(). Drivers that employ the shmem helpers
+ * should use it as their &drm_gem_object_funcs.free handler.
+ */
+static inline void drm_gem_shmem_object_free(struct drm_gem_object *obj)
+{
+	drm_gem_shmem_free_object(obj);
+}
+
+/**
+ * drm_gem_shmem_print_info() - Print &drm_gem_shmem_object info for debugfs
+ * @p: DRM printer
+ * @indent: Tab indentation level
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_shmem_mmap(). Drivers that employ the shmem helpers should
+ * use this function as their &drm_gem_object_funcs.mmap handler.
+ */
+static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsigned int indent,
+						   const struct drm_gem_object *obj)
+{
+	drm_gem_shmem_print_info(p, indent, obj);
+}
+
+/**
+ * drm_gem_shmem_object_pin - GEM object function for drm_gem_shmem_pin()
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_shmem_pin(). Drivers that employ the shmem helpers should
+ * use it as their &drm_gem_object_funcs.pin handler.
+ */
+static inline int drm_gem_shmem_object_pin(struct drm_gem_object *obj)
+{
+	return drm_gem_shmem_pin(obj);
+}
+
+/**
+ * drm_gem_shmem_object_unpin - GEM object function for drm_gem_shmem_unpin()
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_shmem_unpin(). Drivers that employ the shmem helpers should
+ * use it as their &drm_gem_object_funcs.unpin handler.
+ */
+static inline void drm_gem_shmem_object_unpin(struct drm_gem_object *obj)
+{
+	drm_gem_shmem_unpin(obj);
+}
+
+/**
+ * drm_gem_shmem_object_get_sg_table - GEM object function for drm_gem_shmem_get_sg_table()
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_shmem_get_sg_table(). Drivers that employ the shmem helpers should
+ * use it as their &drm_gem_object_funcs.get_sg_table handler.
+ *
+ * Returns:
+ * A pointer to the scatter/gather table of pinned pages or NULL on failure.
+ */
+static inline struct sg_table *drm_gem_shmem_object_get_sg_table(struct drm_gem_object *obj)
+{
+	return drm_gem_shmem_get_sg_table(obj);
+}
+
+/*
+ * drm_gem_shmem_object_vmap - GEM object function for drm_gem_shmem_vmap()
+ * @obj: GEM object
+ * @map: Returns the kernel virtual address of the SHMEM GEM object's backing store.
+ *
+ * This function wraps drm_gem_shmem_vmap(). Drivers that employ the shmem helpers should
+ * use it as their &drm_gem_object_funcs.vmap handler.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	return drm_gem_shmem_vmap(obj, map);
+}
+
+/*
+ * drm_gem_shmem_object_vunmap - GEM object function for drm_gem_shmem_vunmap()
+ * @obj: GEM object
+ * @map: Kernel virtual address where the SHMEM GEM object was mapped
+ *
+ * This function wraps drm_gem_shmem_vunmap(). Drivers that employ the shmem helpers should
+ * use it as their &drm_gem_object_funcs.vunmap handler.
+ */
+static inline void drm_gem_shmem_object_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	drm_gem_shmem_vunmap(obj, map);
+}
+
+/**
+ * drm_gem_shmem_object_mmap - GEM object function for drm_gem_shmem_mmap()
+ * @obj: GEM object
+ * @vma: VMA for the area to be mapped
+ *
+ * This function wraps drm_gem_shmem_mmap(). Drivers that employ the shmem helpers should
+ * use it as their &drm_gem_object_funcs.mmap handler.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	return drm_gem_shmem_mmap(obj, vma);
+}
+
+/*
+ * Driver ops
+ */
+
 struct drm_gem_object *
 drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 				    struct dma_buf_attachment *attach,
-- 
2.33.1

