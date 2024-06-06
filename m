Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8A08FDBB7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 02:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEAA10E829;
	Thu,  6 Jun 2024 00:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="p9owQpHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9788010E502
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 00:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717635279;
 bh=hEey5CQzodSdO9C1gSayn+FYyoljPe1BYlNN8tQfLKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p9owQpHrgPqmNotcahDHfDVCyoEpNA4bddAvRGPiVBdjoL2UTlzpoL0o8F7g9ZJLb
 0op3iOVSaob/yVW2Dh9NiENuI+YwHR4Z9EEHWvOHSMfT0JvuuCzxGDq4ESn975zDAA
 WnRZQxDeuyXooAFDL3F+N4sEqAyhZ9DsNYdjlwQQms02K/HpK2Wi1jitRmoZ2+X5ls
 0vTobG05Ix3zUEMMAfEv4cn/sYCtrtQHROdZhtPi9+WBB0JetDMT4aL1kv+alUGZLj
 ERt9KIVUwngNUlrxMb1qbx8GakoEU+R3jv33snSjV3TvvfwU1UyH4lDzZT4woY9vqD
 1vvhm/vIpNMqw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D6BCE37821C1;
 Thu,  6 Jun 2024 00:54:38 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] drm/panthor: register size of internal objects through
 fdinfo
Date: Thu,  6 Jun 2024 01:49:59 +0100
Message-ID: <20240606005416.1172431-8-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
References: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This includes both DRM objects created to support queues, groups and heaps,
and also objects whose pages are shared between the GPU and the MCU.

However, this doesn't include objects that hold the firmware's binary
regions, since these aren't owned by a render context and are allocated
only once at driver's initialisation time.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  2 +
 drivers/gpu/drm/panthor/panthor_device.h | 13 +++++-
 drivers/gpu/drm/panthor/panthor_drv.c    | 20 ++++++---
 drivers/gpu/drm/panthor/panthor_fw.c     | 16 +++++--
 drivers/gpu/drm/panthor/panthor_fw.h     |  5 ++-
 drivers/gpu/drm/panthor/panthor_gem.c    | 55 ++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_gem.h    | 16 +++++--
 drivers/gpu/drm/panthor/panthor_heap.c   | 23 +++++++---
 drivers/gpu/drm/panthor/panthor_heap.h   |  6 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  8 +++-
 drivers/gpu/drm/panthor/panthor_mmu.h    |  3 +-
 drivers/gpu/drm/panthor/panthor_sched.c  | 19 ++++----
 12 files changed, 147 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 4082c8f2951d..868fa9aba570 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -179,6 +179,8 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
+	drmm_mutex_init(&ptdev->base, &ptdev->private_obj_list_lock);
+
 	/*
 	 * Set the dummy page holding the latest flush to 1. This will cause the
 	 * flush to avoided as we know it isn't necessary if the submission
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index c3ec1e31f8b7..d3abf9700887 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -166,6 +166,9 @@ struct panthor_device {
 	bool profile_mode;
 	unsigned long current_frequency;
 	unsigned long fast_rate;
+
+	/** @private_obj_list_lock: Lock around per-file lists of internal GEM objects */
+	struct mutex private_obj_list_lock;
 };
 
 struct panthor_gpu_usage {
@@ -186,8 +189,14 @@ struct panthor_file {
 	/** @groups: Scheduling group pool attached to this file. */
 	struct panthor_group_pool *groups;
 
-	/** @stats: cycle and timestamp measures for job execution. */
-	struct panthor_gpu_usage stats;
+	/** @fdinfo: Open file tracking information */
+	struct {
+		/** @stats: cycle and timestamp measures for job execution. */
+		struct panthor_gpu_usage stats;
+
+		/** @private_file_list: File's list of private GEM objects. */
+		struct list_head private_file_list;
+	} fdinfo;
 };
 
 int panthor_device_init(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index a2876310856f..20a1add84014 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1048,13 +1048,13 @@ static int panthor_ioctl_tiler_heap_create(struct drm_device *ddev, void *data,
 	if (!vm)
 		return -EINVAL;
 
-	pool = panthor_vm_get_heap_pool(vm, true);
+	pool = panthor_vm_get_heap_pool(vm, true, pfile);
 	if (IS_ERR(pool)) {
 		ret = PTR_ERR(pool);
 		goto out_put_vm;
 	}
 
-	ret = panthor_heap_create(pool,
+	ret = panthor_heap_create(pool, pfile,
 				  args->initial_chunk_count,
 				  args->chunk_size,
 				  args->max_chunks,
@@ -1094,7 +1094,7 @@ static int panthor_ioctl_tiler_heap_destroy(struct drm_device *ddev, void *data,
 	if (!vm)
 		return -EINVAL;
 
-	pool = panthor_vm_get_heap_pool(vm, false);
+	pool = panthor_vm_get_heap_pool(vm, false, NULL);
 	if (IS_ERR(pool)) {
 		ret = PTR_ERR(pool);
 		goto out_put_vm;
@@ -1268,6 +1268,8 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 
 	pfile->ptdev = ptdev;
 
+	INIT_LIST_HEAD(&pfile->fdinfo.private_file_list);
+
 	ret = panthor_vm_pool_create(pfile);
 	if (ret)
 		goto err_free_file;
@@ -1295,6 +1297,12 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
 {
 	struct panthor_file *pfile = file->driver_priv;
 
+	/*
+	 * Group's internal BO's are destroyed asynchronously in a separate worker thread,
+	 * so there's a chance by the time BO release happens, the file is already gone.
+	 */
+	panthor_gem_dettach_internal_bos(pfile);
+
 	panthor_group_pool_destroy(pfile);
 	panthor_vm_pool_destroy(pfile);
 
@@ -1363,10 +1371,10 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
 	if (ptdev->profile_mode) {
 #ifdef CONFIG_ARM_ARCH_TIMER
 		drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
-			   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
+			   DIV_ROUND_UP_ULL((pfile->fdinfo.stats.time * NSEC_PER_SEC),
 					    arch_timer_get_cntfrq()));
 #endif
-		drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
+		drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->fdinfo.stats.cycles);
 	}
 	drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
 	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
@@ -1379,7 +1387,7 @@ static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
 
-	drm_show_memory_stats(p, file);
+	drm_show_memory_stats(p, file, panthor_internal_bos);
 }
 
 static const struct file_operations panthor_drm_driver_fops = {
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 857f3f11258a..a4f24e6c25e0 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -420,6 +420,7 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
 /**
  * panthor_fw_alloc_queue_iface_mem() - Allocate a ring-buffer interfaces.
  * @ptdev: Device.
+ * @pfile: File.
  * @input: Pointer holding the input interface on success.
  * Should be ignored on failure.
  * @output: Pointer holding the output interface on success.
@@ -436,6 +437,7 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
  */
 struct panthor_kernel_bo *
 panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
+				 struct panthor_file *pfile,
 				 struct panthor_fw_ringbuf_input_iface **input,
 				 const struct panthor_fw_ringbuf_output_iface **output,
 				 u32 *input_fw_va, u32 *output_fw_va)
@@ -443,11 +445,12 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
 	struct panthor_kernel_bo *mem;
 	int ret;
 
-	mem = panthor_kernel_bo_create(ptdev, ptdev->fw->vm, SZ_8K,
+	mem = panthor_kernel_bo_create(ptdev, pfile, ptdev->fw->vm, SZ_8K,
 				       DRM_PANTHOR_BO_NO_MMAP,
 				       DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 				       DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
 				       PANTHOR_VM_KERNEL_AUTO_VA);
+
 	if (IS_ERR(mem))
 		return mem;
 
@@ -469,14 +472,18 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
 /**
  * panthor_fw_alloc_suspend_buf_mem() - Allocate a suspend buffer for a command stream group.
  * @ptdev: Device.
+ * @pfile: File.
  * @size: Size of the suspend buffer.
  *
  * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
  */
 struct panthor_kernel_bo *
-panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
+panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev,
+				 struct panthor_file *pfile,
+				 size_t size)
 {
-	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
+	return panthor_kernel_bo_create(ptdev, pfile,
+					panthor_fw_vm(ptdev), size,
 					DRM_PANTHOR_BO_NO_MMAP,
 					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
 					PANTHOR_VM_KERNEL_AUTO_VA);
@@ -596,7 +603,8 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		if (cache_mode != CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED)
 			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
 
-		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
+		section->mem = panthor_kernel_bo_create(ptdev, NULL,
+							panthor_fw_vm(ptdev),
 							section_size,
 							DRM_PANTHOR_BO_NO_MMAP,
 							vm_map_flags, va);
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 22448abde992..ea4746ab381f 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -476,11 +476,14 @@ void panthor_fw_ring_csg_doorbells(struct panthor_device *ptdev, u32 csg_slot);
 
 struct panthor_kernel_bo *
 panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
+				 struct panthor_file *pfile,
 				 struct panthor_fw_ringbuf_input_iface **input,
 				 const struct panthor_fw_ringbuf_output_iface **output,
 				 u32 *input_fw_va, u32 *output_fw_va);
 struct panthor_kernel_bo *
-panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size);
+panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev,
+				 struct panthor_file *pfile,
+				 size_t size);
 
 struct panthor_vm *panthor_fw_vm(struct panthor_device *ptdev);
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index c60b599665d8..5e2cc8d46643 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -1,11 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
+
 /* Copyright 2023 Collabora ltd. */
 
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/mutex.h>
 
 #include <drm/panthor_drm.h>
 
@@ -24,6 +26,20 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 	drm_gem_object_put(vm_root_gem);
 }
 
+void panthor_gem_dettach_internal_bos(struct panthor_file *pfile)
+{
+	struct panthor_kernel_bo *kbo, *tmp;
+
+	mutex_lock(&pfile->ptdev->private_obj_list_lock);
+	list_for_each_entry_safe(kbo, tmp,
+				 &pfile->fdinfo.private_file_list,
+				 private_obj) {
+		list_del(&kbo->private_obj);
+		INIT_LIST_HEAD(&kbo->private_obj);
+	}
+	mutex_unlock(&pfile->ptdev->private_obj_list_lock);
+}
+
 /**
  * panthor_kernel_bo_destroy() - Destroy a kernel buffer object
  * @bo: Kernel buffer object to destroy. If NULL or an ERR_PTR(), the destruction
@@ -31,6 +47,8 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
  */
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 {
+	struct panthor_device *ptdev =
+		container_of(bo->obj->dev, struct panthor_device, base);
 	struct panthor_vm *vm;
 	int ret;
 
@@ -40,6 +58,13 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 	vm = bo->vm;
 	panthor_kernel_bo_vunmap(bo);
 
+	mutex_lock(&ptdev->private_obj_list_lock);
+	if (!list_empty(&bo->private_obj)) {
+		list_del(&bo->private_obj);
+		INIT_LIST_HEAD(&bo->private_obj);
+	}
+	mutex_unlock(&ptdev->private_obj_list_lock);
+
 	if (drm_WARN_ON(bo->obj->dev,
 			to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm)))
 		goto out_free_bo;
@@ -57,6 +82,20 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 	kfree(bo);
 }
 
+void panthor_internal_bos(struct drm_memory_stats *status,
+			  struct drm_file *file)
+{
+	struct panthor_file *pfile = file->driver_priv;
+	struct panthor_kernel_bo *kbo;
+
+	mutex_lock(&pfile->ptdev->private_obj_list_lock);
+	list_for_each_entry(kbo, &pfile->fdinfo.private_file_list, private_obj) {
+		status->resident += kbo->obj->size;
+		status->internal += kbo->obj->size;
+	}
+	mutex_unlock(&pfile->ptdev->private_obj_list_lock);
+}
+
 /**
  * panthor_kernel_bo_create() - Create and map a GEM object to a VM
  * @ptdev: Device.
@@ -72,9 +111,9 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
  * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
  */
 struct panthor_kernel_bo *
-panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
-			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va)
+panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_file *pfile,
+			 struct panthor_vm *vm, size_t size, u32 bo_flags,
+			 u32 vm_map_flags, u64 gpu_va)
 {
 	struct drm_gem_shmem_object *obj;
 	struct panthor_kernel_bo *kbo;
@@ -111,6 +150,16 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
 	drm_gem_object_get(bo->exclusive_vm_root_gem);
 	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
+
+	INIT_LIST_HEAD(&kbo->private_obj);
+
+	/* Only FW regions are not bound to an open file */
+	if (pfile) {
+		mutex_lock(&ptdev->private_obj_list_lock);
+		list_add(&kbo->private_obj, &pfile->fdinfo.private_file_list);
+		mutex_unlock(&ptdev->private_obj_list_lock);
+	}
+
 	return kbo;
 
 err_free_va:
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index e43021cf6d45..007970fea43a 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -12,6 +12,8 @@
 #include <linux/rwsem.h>
 
 struct panthor_vm;
+struct panthor_file;
+struct panthor_device;
 
 /**
  * struct panthor_gem_object - Driver specific GEM object.
@@ -75,8 +77,14 @@ struct panthor_kernel_bo {
 	 * @kmap: Kernel CPU mapping of @gem.
 	 */
 	void *kmap;
+
+	/** @private_node: Link to driver's list of private GEM objects. */
+	struct list_head private_obj;
 };
 
+void panthor_internal_bos(struct drm_memory_stats *status,
+			  struct drm_file *file);
+
 static inline
 struct panthor_gem_object *to_panthor_bo(struct drm_gem_object *obj)
 {
@@ -137,10 +145,12 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
 }
 
 struct panthor_kernel_bo *
-panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
-			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va);
+panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_file *pfile,
+			 struct panthor_vm *vm, size_t size, u32 bo_flags,
+			 u32 vm_map_flags, u64 gpu_va);
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
+void panthor_gem_dettach_internal_bos(struct panthor_file *pfile);
+
 #endif /* __PANTHOR_GEM_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 3796a9eb22af..cffd259aae12 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -86,6 +86,9 @@ struct panthor_heap_pool {
 	/** @ptdev: Device. */
 	struct panthor_device *ptdev;
 
+	/** @pfile: Pointer to Panfrost file struct */
+	struct panthor_file *pfile;
+
 	/** @vm: VM this pool is bound to. */
 	struct panthor_vm *vm;
 
@@ -132,6 +135,7 @@ static void panthor_free_heap_chunk(struct panthor_vm *vm,
 }
 
 static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
+				    struct panthor_file *pfile,
 				    struct panthor_vm *vm,
 				    struct panthor_heap *heap,
 				    bool initial_chunk)
@@ -144,7 +148,7 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	if (!chunk)
 		return -ENOMEM;
 
-	chunk->bo = panthor_kernel_bo_create(ptdev, vm, heap->chunk_size,
+	chunk->bo = panthor_kernel_bo_create(ptdev, pfile, vm, heap->chunk_size,
 					     DRM_PANTHOR_BO_NO_MMAP,
 					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
 					     PANTHOR_VM_KERNEL_AUTO_VA);
@@ -201,6 +205,7 @@ static void panthor_free_heap_chunks(struct panthor_vm *vm,
 }
 
 static int panthor_alloc_heap_chunks(struct panthor_device *ptdev,
+				     struct panthor_file *pfile,
 				     struct panthor_vm *vm,
 				     struct panthor_heap *heap,
 				     u32 chunk_count)
@@ -209,7 +214,7 @@ static int panthor_alloc_heap_chunks(struct panthor_device *ptdev,
 	u32 i;
 
 	for (i = 0; i < chunk_count; i++) {
-		ret = panthor_alloc_heap_chunk(ptdev, vm, heap, true);
+		ret = panthor_alloc_heap_chunk(ptdev, pfile, vm, heap, true);
 		if (ret)
 			return ret;
 	}
@@ -251,6 +256,7 @@ int panthor_heap_destroy(struct panthor_heap_pool *pool, u32 handle)
 /**
  * panthor_heap_create() - Create a heap context
  * @pool: Pool to instantiate the heap context from.
+ * @pfile: File.
  * @initial_chunk_count: Number of chunk allocated at initialization time.
  * Must be at least 1.
  * @chunk_size: The size of each chunk. Must be page-aligned and lie in the
@@ -265,6 +271,7 @@ int panthor_heap_destroy(struct panthor_heap_pool *pool, u32 handle)
  * Return: a positive handle on success, a negative error otherwise.
  */
 int panthor_heap_create(struct panthor_heap_pool *pool,
+			struct panthor_file *pfile,
 			u32 initial_chunk_count,
 			u32 chunk_size,
 			u32 max_chunks,
@@ -308,8 +315,8 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	heap->max_chunks = max_chunks;
 	heap->target_in_flight = target_in_flight;
 
-	ret = panthor_alloc_heap_chunks(pool->ptdev, vm, heap,
-					initial_chunk_count);
+	ret = panthor_alloc_heap_chunks(pool->ptdev, pfile, vm,
+					heap, initial_chunk_count);
 	if (ret)
 		goto err_free_heap;
 
@@ -466,7 +473,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 	 * further jobs in this queue fail immediately instead of having to
 	 * wait for the job timeout.
 	 */
-	ret = panthor_alloc_heap_chunk(pool->ptdev, pool->vm, heap, false);
+	ret = panthor_alloc_heap_chunk(pool->ptdev, pool->pfile, pool->vm, heap, false);
 	if (ret)
 		goto out_unlock;
 
@@ -526,7 +533,9 @@ panthor_heap_pool_get(struct panthor_heap_pool *pool)
  * Return: A valid pointer on success, a negative error code otherwise.
  */
 struct panthor_heap_pool *
-panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
+panthor_heap_pool_create(struct panthor_device *ptdev,
+			 struct panthor_vm *vm,
+			 struct panthor_file *pfile)
 {
 	size_t bosize = ALIGN(MAX_HEAPS_PER_POOL *
 			      panthor_heap_ctx_stride(ptdev),
@@ -547,7 +556,7 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
 	xa_init_flags(&pool->xa, XA_FLAGS_ALLOC);
 	kref_init(&pool->refcount);
 
-	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, vm, bosize,
+	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, pfile, vm, bosize,
 						      DRM_PANTHOR_BO_NO_MMAP,
 						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
 						      PANTHOR_VM_KERNEL_AUTO_VA);
diff --git a/drivers/gpu/drm/panthor/panthor_heap.h b/drivers/gpu/drm/panthor/panthor_heap.h
index 25a5f2bba445..1d1b409064e3 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.h
+++ b/drivers/gpu/drm/panthor/panthor_heap.h
@@ -9,8 +9,10 @@
 struct panthor_device;
 struct panthor_heap_pool;
 struct panthor_vm;
+struct panthor_file;
 
 int panthor_heap_create(struct panthor_heap_pool *pool,
+			struct panthor_file *pfile,
 			u32 initial_chunk_count,
 			u32 chunk_size,
 			u32 max_chunks,
@@ -20,7 +22,9 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 int panthor_heap_destroy(struct panthor_heap_pool *pool, u32 handle);
 
 struct panthor_heap_pool *
-panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm);
+panthor_heap_pool_create(struct panthor_device *ptdev,
+			 struct panthor_vm *vm,
+			 struct panthor_file *pfile);
 void panthor_heap_pool_destroy(struct panthor_heap_pool *pool);
 
 struct panthor_heap_pool *
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index fa0a002b1016..15977779292b 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1872,6 +1872,7 @@ struct panthor_vm *panthor_vm_get(struct panthor_vm *vm)
  * panthor_vm_get_heap_pool() - Get the heap pool attached to a VM
  * @vm: VM to query the heap pool on.
  * @create: True if the heap pool should be created when it doesn't exist.
+ * @pfile: File.
  *
  * Heap pools are per-VM. This function allows one to retrieve the heap pool
  * attached to a VM.
@@ -1882,16 +1883,19 @@ struct panthor_vm *panthor_vm_get(struct panthor_vm *vm)
  *
  * Return: A valid pointer on success, an ERR_PTR() otherwise.
  */
-struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create)
+struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create,
+						   struct panthor_file *pfile)
 {
 	struct panthor_heap_pool *pool;
 
+	drm_WARN_ON(&vm->ptdev->base, (!create && pfile));
+
 	mutex_lock(&vm->heaps.lock);
 	if (!vm->heaps.pool && create) {
 		if (vm->destroyed)
 			pool = ERR_PTR(-EINVAL);
 		else
-			pool = panthor_heap_pool_create(vm->ptdev, vm);
+			pool = panthor_heap_pool_create(vm->ptdev, vm, pfile);
 
 		if (!IS_ERR(pool))
 			vm->heaps.pool = panthor_heap_pool_get(pool);
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index f3c1ed19f973..d950128b7b50 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -14,6 +14,7 @@ struct panthor_heap_pool;
 struct panthor_vm;
 struct panthor_vma;
 struct panthor_mmu;
+struct panthor_file;
 
 int panthor_mmu_init(struct panthor_device *ptdev);
 void panthor_mmu_unplug(struct panthor_device *ptdev);
@@ -33,7 +34,7 @@ void panthor_vm_idle(struct panthor_vm *vm);
 int panthor_vm_as(struct panthor_vm *vm);
 
 struct panthor_heap_pool *
-panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
+panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create, struct panthor_file *pfile);
 
 struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
 void panthor_vm_put(struct panthor_vm *vm);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 4fb6fc5c2314..c24b09933bfa 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1414,7 +1414,7 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
 		struct panthor_fw_cs_iface *cs_iface;
 
 		cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
-		heaps = panthor_vm_get_heap_pool(group->vm, false);
+		heaps = panthor_vm_get_heap_pool(group->vm, false, NULL);
 		heap_address = cs_iface->output->heap_address;
 		vt_start = cs_iface->output->heap_vt_start;
 		vt_end = cs_iface->output->heap_vt_end;
@@ -3154,7 +3154,8 @@ static const struct drm_sched_backend_ops panthor_queue_sched_ops = {
 };
 
 static struct panthor_queue *
-group_create_queue(struct panthor_group *group,
+group_create_queue(struct panthor_file *pfile,
+		   struct panthor_group *group,
 		   const struct drm_panthor_queue_create *args,
 		   unsigned int slots_so_far)
 {
@@ -3182,7 +3183,7 @@ group_create_queue(struct panthor_group *group,
 
 	queue->priority = args->priority;
 
-	queue->ringbuf = panthor_kernel_bo_create(group->ptdev, group->vm,
+	queue->ringbuf = panthor_kernel_bo_create(group->ptdev, pfile, group->vm,
 						  args->ringbuf_size,
 						  DRM_PANTHOR_BO_NO_MMAP,
 						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
@@ -3197,7 +3198,7 @@ group_create_queue(struct panthor_group *group,
 	if (ret)
 		goto err_free_queue;
 
-	queue->iface.mem = panthor_fw_alloc_queue_iface_mem(group->ptdev,
+	queue->iface.mem = panthor_fw_alloc_queue_iface_mem(group->ptdev, pfile,
 							    &queue->iface.input,
 							    &queue->iface.output,
 							    &queue->iface.input_fw_va,
@@ -3298,7 +3299,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 
 	suspend_size = csg_iface->control->suspend_size;
-	group->suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, suspend_size);
+	group->suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, pfile, suspend_size);
 	if (IS_ERR(group->suspend_buf)) {
 		ret = PTR_ERR(group->suspend_buf);
 		group->suspend_buf = NULL;
@@ -3306,7 +3307,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 
 	suspend_size = csg_iface->control->protm_suspend_size;
-	group->protm_suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, suspend_size);
+	group->protm_suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, pfile, suspend_size);
 	if (IS_ERR(group->protm_suspend_buf)) {
 		ret = PTR_ERR(group->protm_suspend_buf);
 		group->protm_suspend_buf = NULL;
@@ -3353,7 +3354,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	 *
 	 */
 
-	group->syncobjs.bo = panthor_kernel_bo_create(ptdev, group->vm,
+	group->syncobjs.bo = panthor_kernel_bo_create(ptdev, pfile, group->vm,
 						      syncobj_bo_size,
 						      DRM_PANTHOR_BO_NO_MMAP,
 						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
@@ -3374,7 +3375,7 @@ int panthor_group_create(struct panthor_file *pfile,
 		group_args->queues.count * sizeof(struct panthor_syncobj_64b);
 
 	for (i = 0, total_slots = 0; i < group_args->queues.count; i++) {
-		group->queues[i] = group_create_queue(group, &queue_args[i], total_slots);
+		group->queues[i] = group_create_queue(pfile, group, &queue_args[i], total_slots);
 		if (IS_ERR(group->queues[i])) {
 			ret = PTR_ERR(group->queues[i]);
 			group->queues[i] = NULL;
@@ -3402,7 +3403,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 	mutex_unlock(&sched->reset.lock);
 
-	group->fdinfo.data = &pfile->stats;
+	group->fdinfo.data = &pfile->fdinfo.stats;
 	mutex_init(&group->fdinfo.lock);
 
 	return gid;
-- 
2.45.1

