Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0EACB0257
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A569610E5EF;
	Tue,  9 Dec 2025 14:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5B310E5DE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:02:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F0025BE34;
 Tue,  9 Dec 2025 14:01:58 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25CB23EA63;
 Tue,  9 Dec 2025 14:01:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OIE1B9UrOGm1OgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:01:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, ogabbay@kernel.org,
 mamin506@gmail.com, lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/13] drm/panthor: Use GEM-UMA helpers for memory management
Date: Tue,  9 Dec 2025 14:42:05 +0100
Message-ID: <20251209140141.94407-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209140141.94407-1-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 4F0025BE34
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Rspamd-Action: no action
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert panthor from GEM-SHMEM to GEM-UMA. The latter is just a copy,
so this change it merely renaming symbols. No functional changes.

GEM-SHMEM will become more self-contained for drivers without specific
memory management. GEM-UMA's interfaces will remain flexible for drivers
with UMA hardware, such as panthor.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/panthor/Kconfig         |  2 +-
 drivers/gpu/drm/panthor/panthor_drv.c   |  2 +-
 drivers/gpu/drm/panthor/panthor_fw.c    |  4 +--
 drivers/gpu/drm/panthor/panthor_gem.c   | 40 ++++++++++++-------------
 drivers/gpu/drm/panthor/panthor_gem.h   |  8 ++---
 drivers/gpu/drm/panthor/panthor_mmu.c   | 10 +++----
 drivers/gpu/drm/panthor/panthor_sched.c |  1 -
 7 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
index 55b40ad07f3b..dc87abc79917 100644
--- a/drivers/gpu/drm/panthor/Kconfig
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -8,7 +8,7 @@ config DRM_PANTHOR
 	depends on MMU
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select DRM_EXEC
-	select DRM_GEM_SHMEM_HELPER
+	select DRM_GEM_UMA_HELPER
 	select DRM_GPUVM
 	select DRM_SCHED
 	select IOMMU_IO_PGTABLE_LPAE
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index d1d4c50da5bf..43d8791e1a47 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1620,7 +1620,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.minor = 5,
 
 	.gem_create_object = panthor_gem_create_object,
-	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
+	.gem_prime_import_sg_table = drm_gem_uma_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = panthor_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 38d87ab92eda..81cc6e2eee23 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -620,7 +620,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		panthor_fw_init_section_mem(ptdev, section);
 
 		bo = to_panthor_bo(section->mem->obj);
-		sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
+		sgt = drm_gem_uma_get_pages_sgt(&bo->base);
 		if (IS_ERR(sgt))
 			return PTR_ERR(sgt);
 
@@ -684,7 +684,7 @@ panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
 			continue;
 
 		panthor_fw_init_section_mem(ptdev, section);
-		sgt = drm_gem_shmem_get_pages_sgt(&to_panthor_bo(section->mem->obj)->base);
+		sgt = drm_gem_uma_get_pages_sgt(&to_panthor_bo(section->mem->obj)->base);
 		if (!drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(sgt)))
 			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
 	}
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 2c12c1c58e2b..68bc36fa70df 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -75,7 +75,7 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 	mutex_destroy(&bo->label.lock);
 
 	drm_gem_free_mmap_offset(&bo->base.base);
-	drm_gem_shmem_free(&bo->base);
+	drm_gem_uma_free(&bo->base);
 	drm_gem_object_put(vm_root_gem);
 }
 
@@ -123,7 +123,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 			 size_t size, u32 bo_flags, u32 vm_map_flags,
 			 u64 gpu_va, const char *name)
 {
-	struct drm_gem_shmem_object *obj;
+	struct drm_gem_uma_object *obj;
 	struct panthor_kernel_bo *kbo;
 	struct panthor_gem_object *bo;
 	u32 debug_flags = PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL;
@@ -136,7 +136,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	if (!kbo)
 		return ERR_PTR(-ENOMEM);
 
-	obj = drm_gem_shmem_create(&ptdev->base, size);
+	obj = drm_gem_uma_create(&ptdev->base, size);
 	if (IS_ERR(obj)) {
 		ret = PTR_ERR(obj);
 		goto err_free_bo;
@@ -207,16 +207,16 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
 
 static const struct drm_gem_object_funcs panthor_gem_funcs = {
 	.free = panthor_gem_free_object,
-	.print_info = drm_gem_shmem_object_print_info,
-	.pin = drm_gem_shmem_object_pin,
-	.unpin = drm_gem_shmem_object_unpin,
-	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
+	.print_info = drm_gem_uma_object_print_info,
+	.pin = drm_gem_uma_object_pin,
+	.unpin = drm_gem_uma_object_unpin,
+	.get_sg_table = drm_gem_uma_object_get_sg_table,
+	.vmap = drm_gem_uma_object_vmap,
+	.vunmap = drm_gem_uma_object_vunmap,
+	.mmap = drm_gem_uma_object_mmap,
 	.status = panthor_gem_status,
 	.export = panthor_gem_prime_export,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.vm_ops = &drm_gem_uma_vm_ops,
 };
 
 /**
@@ -263,14 +263,14 @@ panthor_gem_create_with_handle(struct drm_file *file,
 			       u64 *size, u32 flags, u32 *handle)
 {
 	int ret;
-	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_uma_object *uma;
 	struct panthor_gem_object *bo;
 
-	shmem = drm_gem_shmem_create(ddev, *size);
-	if (IS_ERR(shmem))
-		return PTR_ERR(shmem);
+	uma = drm_gem_uma_create(ddev, *size);
+	if (IS_ERR(uma))
+		return PTR_ERR(uma);
 
-	bo = to_panthor_bo(&shmem->base);
+	bo = to_panthor_bo(&uma->base);
 	bo->flags = flags;
 
 	if (exclusive_vm) {
@@ -288,10 +288,10 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	 * FIXME: Ideally this should be done when pages are allocated, not at
 	 * BO creation time.
 	 */
-	if (shmem->map_wc) {
+	if (uma->map_wc) {
 		struct sg_table *sgt;
 
-		sgt = drm_gem_shmem_get_pages_sgt(shmem);
+		sgt = drm_gem_uma_get_pages_sgt(uma);
 		if (IS_ERR(sgt)) {
 			ret = PTR_ERR(sgt);
 			goto out_put_gem;
@@ -302,13 +302,13 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	 * Allocate an id of idr table where the obj is registered
 	 * and handle has the id what user can see.
 	 */
-	ret = drm_gem_handle_create(file, &shmem->base, handle);
+	ret = drm_gem_handle_create(file, &uma->base, handle);
 	if (!ret)
 		*size = bo->base.base.size;
 
 out_put_gem:
 	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put(&shmem->base);
+	drm_gem_object_put(&uma->base);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 80c6e24112d0..032b14a32b28 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -5,7 +5,7 @@
 #ifndef __PANTHOR_GEM_H__
 #define __PANTHOR_GEM_H__
 
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_uma_helper.h>
 #include <drm/drm_mm.h>
 
 #include <linux/iosys-map.h>
@@ -64,8 +64,8 @@ struct panthor_gem_debugfs {
  * struct panthor_gem_object - Driver specific GEM object.
  */
 struct panthor_gem_object {
-	/** @base: Inherit from drm_gem_shmem_object. */
-	struct drm_gem_shmem_object base;
+	/** @base: Inherit from drm_gem_uma_object. */
+	struct drm_gem_uma_object base;
 
 	/**
 	 * @exclusive_vm_root_gem: Root GEM of the exclusive VM this GEM object
@@ -133,7 +133,7 @@ struct panthor_kernel_bo {
 static inline
 struct panthor_gem_object *to_panthor_bo(struct drm_gem_object *obj)
 {
-	return container_of(to_drm_gem_shmem_obj(obj), struct panthor_gem_object, base);
+	return container_of(to_drm_gem_uma_obj(obj), struct panthor_gem_object, base);
 }
 
 struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size);
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 478ea98db95c..f51619cea679 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1073,7 +1073,7 @@ static void panthor_vm_bo_free(struct drm_gpuvm_bo *vm_bo)
 	struct panthor_gem_object *bo = to_panthor_bo(vm_bo->obj);
 
 	if (!drm_gem_is_imported(&bo->base.base))
-		drm_gem_shmem_unpin(&bo->base);
+		drm_gem_uma_unpin(&bo->base);
 	kfree(vm_bo);
 }
 
@@ -1218,15 +1218,15 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 		 * once we have successfully called drm_gpuvm_bo_create(),
 		 * GPUVM will take care of dropping the pin for us.
 		 */
-		ret = drm_gem_shmem_pin(&bo->base);
+		ret = drm_gem_uma_pin(&bo->base);
 		if (ret)
 			goto err_cleanup;
 	}
 
-	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
+	sgt = drm_gem_uma_get_pages_sgt(&bo->base);
 	if (IS_ERR(sgt)) {
 		if (!drm_gem_is_imported(&bo->base.base))
-			drm_gem_shmem_unpin(&bo->base);
+			drm_gem_uma_unpin(&bo->base);
 
 		ret = PTR_ERR(sgt);
 		goto err_cleanup;
@@ -1237,7 +1237,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base.base);
 	if (!preallocated_vm_bo) {
 		if (!drm_gem_is_imported(&bo->base.base))
-			drm_gem_shmem_unpin(&bo->base);
+			drm_gem_uma_unpin(&bo->base);
 
 		ret = -ENOMEM;
 		goto err_cleanup;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e74ca071159d..d8a3f6aa9aaa 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3,7 +3,6 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
-- 
2.52.0

