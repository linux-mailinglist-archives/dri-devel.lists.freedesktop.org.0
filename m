Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797784503ED
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3746EA79;
	Mon, 15 Nov 2021 12:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B4C6EA77
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:01:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1FECC1FD6A;
 Mon, 15 Nov 2021 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636977710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9DtZghpKPDOhmopBq/LMF+Tqa+Vw9X5WmNclG02vUQ=;
 b=L1HkpbUWzfUEfUegtI6cNgRDvielVKlk88v+74QGiwKYZ1e+a1Soqr7YsvYWxcm5MVgoF3
 /UcnwUlXfoS64ukO54GDm6uzXTbQmaCkVr8vyRa/hplsbvQtnOndQmhZz5p0L1i75DxTi+
 BByobYAZ5qYP+eNDK2i7F0FruMDBS44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636977710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9DtZghpKPDOhmopBq/LMF+Tqa+Vw9X5WmNclG02vUQ=;
 b=0IJ0n4z+n3/iyGgl3kEhIC5+825Ythn7Uy9Q3v1b59a5mgGOAtyTnvOTY69L3f/c42RvVM
 KIcK8t1zjVGMZzCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4DCC13E37;
 Mon, 15 Nov 2021 12:01:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0C4AMy1MkmHKVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Nov 2021 12:01:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, emma@anholt.net
Subject: [PATCH 2/3] drm/cma-helper: Export dedicated wrappers for GEM object
 functions
Date: Mon, 15 Nov 2021 13:01:47 +0100
Message-Id: <20211115120148.21766-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115120148.21766-1-tzimmermann@suse.de>
References: <20211115120148.21766-1-tzimmermann@suse.de>
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
Cc: linux-renesas-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wrap GEM CMA functions for struct drm_gem_object_funcs and update
all callers. This will allow for an update of the public interfaces
of the GEM CMA helper library.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_cma_helper.c  | 23 ++++----
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 10 ++--
 drivers/gpu/drm/vc4/vc4_bo.c          |  4 +-
 include/drm/drm_gem_cma_helper.h      | 78 +++++++++++++++++++++++++++
 4 files changed, 94 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 09e2cb80de08..27ccb71e3d66 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -35,11 +35,11 @@
  */
 
 static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
-	.free = drm_gem_cma_free_object,
-	.print_info = drm_gem_cma_print_info,
-	.get_sg_table = drm_gem_cma_get_sg_table,
-	.vmap = drm_gem_cma_vmap,
-	.mmap = drm_gem_cma_mmap,
+	.free = drm_gem_cma_object_free,
+	.print_info = drm_gem_cma_object_print_info,
+	.get_sg_table = drm_gem_cma_object_get_sg_table,
+	.vmap = drm_gem_cma_object_vmap,
+	.mmap = drm_gem_cma_object_mmap,
 	.vm_ops = &drm_gem_cma_vm_ops,
 };
 
@@ -198,8 +198,6 @@ drm_gem_cma_create_with_handle(struct drm_file *file_priv,
  * This function frees the backing memory of the CMA GEM object, cleans up the
  * GEM object state and frees the memory used to store the object itself.
  * If the buffer is imported and the virtual address is set, it is released.
- * Drivers using the CMA helpers should set this as their
- * &drm_gem_object_funcs.free callback.
  */
 void drm_gem_cma_free_object(struct drm_gem_object *gem_obj)
 {
@@ -393,9 +391,8 @@ EXPORT_SYMBOL(drm_gem_cma_print_info);
  *     pages for a CMA GEM object
  * @obj: GEM object
  *
- * This function exports a scatter/gather table by
- * calling the standard DMA mapping API. Drivers using the CMA helpers should
- * set this as their &drm_gem_object_funcs.get_sg_table callback.
+ * This function exports a scatter/gather table by calling the standard
+ * DMA mapping API.
  *
  * Returns:
  * A pointer to the scatter/gather table of pinned pages or NULL on failure.
@@ -475,8 +472,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_import_sg_table);
  * This function maps a buffer into the kernel's
  * virtual address space. Since the CMA buffers are already mapped into the
  * kernel virtual address space this simply returns the cached virtual
- * address. Drivers using the CMA helpers should set this as their DRM
- * driver's &drm_gem_object_funcs.vmap callback.
+ * address.
  *
  * Returns:
  * 0 on success, or a negative error code otherwise.
@@ -498,8 +494,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
  *
  * This function maps a buffer into a userspace process's address space.
  * In addition to the usual GEM VMA setup it immediately faults in the entire
- * object instead of using on-demand faulting. Drivers that use the CMA
- * helpers should set this as their &drm_gem_object_funcs.mmap callback.
+ * object instead of using on-demand faulting.
  *
  * Returns:
  * 0 on success or a negative error code on failure.
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index eacb1f17f747..190dbb7f15dd 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -327,11 +327,11 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
  */
 
 static const struct drm_gem_object_funcs rcar_du_gem_funcs = {
-	.free = drm_gem_cma_free_object,
-	.print_info = drm_gem_cma_print_info,
-	.get_sg_table = drm_gem_cma_get_sg_table,
-	.vmap = drm_gem_cma_vmap,
-	.mmap = drm_gem_cma_mmap,
+	.free = drm_gem_cma_object_free,
+	.print_info = drm_gem_cma_object_print_info,
+	.get_sg_table = drm_gem_cma_object_get_sg_table,
+	.vmap = drm_gem_cma_object_vmap,
+	.mmap = drm_gem_cma_object_mmap,
 	.vm_ops = &drm_gem_cma_vm_ops,
 };
 
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index fddaeb0b09c1..830756b3159e 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -732,8 +732,8 @@ static const struct vm_operations_struct vc4_vm_ops = {
 static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
 	.free = vc4_free_object,
 	.export = vc4_prime_export,
-	.get_sg_table = drm_gem_cma_get_sg_table,
-	.vmap = drm_gem_cma_vmap,
+	.get_sg_table = drm_gem_cma_object_get_sg_table,
+	.vmap = drm_gem_cma_object_vmap,
 	.mmap = vc4_gem_object_mmap,
 	.vm_ops = &vc4_vm_ops,
 };
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index e0fb7a0cf03f..56d2f9fdf9ac 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -48,6 +48,84 @@ struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_object *obj);
 int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
+/*
+ * GEM object functions
+ */
+
+/**
+ * drm_gem_cma_object_free - GEM object function for drm_gem_cma_free_object()
+ * @obj: GEM object to free
+ *
+ * This function wraps drm_gem_cma_free_object(). Drivers that employ the CMA helpers
+ * should use it as their &drm_gem_object_funcs.free handler.
+ */
+static inline void drm_gem_cma_object_free(struct drm_gem_object *obj)
+{
+	drm_gem_cma_free_object(obj);
+}
+
+/**
+ * drm_gem_cma_object_print_info() - Print &drm_gem_cma_object info for debugfs
+ * @p: DRM printer
+ * @indent: Tab indentation level
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_cma_print_info(). Drivers that employ the CMA helpers
+ * should use this function as their &drm_gem_object_funcs.print_info handler.
+ */
+static inline void drm_gem_cma_object_print_info(struct drm_printer *p, unsigned int indent,
+						 const struct drm_gem_object *obj)
+{
+	drm_gem_cma_print_info(p, indent, obj);
+}
+
+/**
+ * drm_gem_cma_object_get_sg_table - GEM object function for drm_gem_cma_get_sg_table()
+ * @obj: GEM object
+ *
+ * This function wraps drm_gem_cma_get_sg_table(). Drivers that employ the CMA helpers should
+ * use it as their &drm_gem_object_funcs.get_sg_table handler.
+ *
+ * Returns:
+ * A pointer to the scatter/gather table of pinned pages or NULL on failure.
+ */
+static inline struct sg_table *drm_gem_cma_object_get_sg_table(struct drm_gem_object *obj)
+{
+	return drm_gem_cma_get_sg_table(obj);
+}
+
+/*
+ * drm_gem_cma_object_vmap - GEM object function for drm_gem_cma_vmap()
+ * @obj: GEM object
+ * @map: Returns the kernel virtual address of the CMA GEM object's backing store.
+ *
+ * This function wraps drm_gem_cma_vmap(). Drivers that employ the CMA helpers should
+ * use it as their &drm_gem_object_funcs.vmap handler.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+static inline int drm_gem_cma_object_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	return drm_gem_cma_vmap(obj, map);
+}
+
+/**
+ * drm_gem_cma_object_mmap - GEM object function for drm_gem_cma_mmap()
+ * @obj: GEM object
+ * @vma: VMA for the area to be mapped
+ *
+ * This function wraps drm_gem_cma_mmap(). Drivers that employ the cma helpers should
+ * use it as their &drm_gem_object_funcs.mmap handler.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+static inline int drm_gem_cma_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	return drm_gem_cma_mmap(obj, vma);
+}
+
 /*
  * Driver ops
  */
-- 
2.33.1

