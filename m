Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2DE9CF4A4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 20:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EEF10E108;
	Fri, 15 Nov 2024 19:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="jYUlFeCC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C60310E108
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 19:14:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1731698085; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Uq/e9j8eq0HMrt9xiqAtH/8/0zfi3H90xTqX7GvNNvAX2/1m2YHmWBRw1sxk99pV4SmLV0CRYmaO13L56N9S2JAgVImy99PG/SvEGRHBNNfsx6AgxrHHGXVkyAPdh2157st8ESM2PqOnscGzlv+QdtkLZT75z/tNBei3WqMJ/HM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1731698085;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jMzqbsE1Y0NZAjkPHPSz6a6xjvTC+JKAI7L6oPb/vF0=; 
 b=kA0vis3My7PoMYub1Gwn4X1VQkydRD2pUEjcfpibNdzt+p631tT2IBQ9rpmTCzN573XF0JWPZuCbU2rqKFG+6GgSTjLb5fXF2i6vW4FFGcqGR/nzaH9AkddAHtiwBDkkNQXU6U4AWQhOiFG60tnchnTJl1Z5JgyfO3TMX/MqIcs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731698085; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=jMzqbsE1Y0NZAjkPHPSz6a6xjvTC+JKAI7L6oPb/vF0=;
 b=jYUlFeCCwTCzEKEhjvzkiQPI/WGrqVJ81x2LrfIM1A+ECv01k1oN84AEkIs+Yyz+
 t6eFZ0Ojs32RNbKDYENDIrUCjrrwuiy+4+APFi4csnFhdIMzeCm28tpNG0ZdP5RHzqV
 m6xmcOww/RwZGbwuHWia/i2s3da6IQb7YZaCJVq4=
Received: by mx.zohomail.com with SMTPS id 1731698083214270.67764713734925;
 Fri, 15 Nov 2024 11:14:43 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panthor: register size of internal objects through
 fdinfo
Date: Fri, 15 Nov 2024 19:14:18 +0000
Message-ID: <20241115191426.3101123-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
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

This will display four key:value pairs which exist beyond the drm fdinfo
standard, and that record the sizes of internal objects:

drm-total-internal, drm-shared-internal, drm-active-internal and
drm-resident-internal.

Currently, drm-shared-internal and drm-active-internal are unutilised, but
in a future revision of the patch 'drm-shared-internal' could register the
size of the firmware regions (since they aren't specific to a single render
context), and 'drm-active-internal' could be updated every time a group is
made active by the GPU scheduler or a queue has jobs ready for execution.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  2 +
 drivers/gpu/drm/panthor/panthor_device.h |  6 +++
 drivers/gpu/drm/panthor/panthor_drv.c    | 15 +++++--
 drivers/gpu/drm/panthor/panthor_fw.c     | 14 ++++--
 drivers/gpu/drm/panthor/panthor_fw.h     |  6 ++-
 drivers/gpu/drm/panthor/panthor_gem.c    | 57 ++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_gem.h    | 13 +++++-
 drivers/gpu/drm/panthor/panthor_heap.c   | 20 ++++++---
 drivers/gpu/drm/panthor/panthor_heap.h   |  6 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  7 ++-
 drivers/gpu/drm/panthor/panthor_mmu.h    |  3 +-
 drivers/gpu/drm/panthor/panthor_sched.c  | 19 ++++----
 12 files changed, 136 insertions(+), 32 deletions(-)

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
index 0e68f5a70d20..414822b35a23 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -190,6 +190,9 @@ struct panthor_device {
 
 	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
 	unsigned long fast_rate;
+
+	/** @private_obj_list_lock: Lock around per-file lists of internal GEM objects */
+	struct mutex private_obj_list_lock;
 };
 
 struct panthor_gpu_usage {
@@ -212,6 +215,9 @@ struct panthor_file {
 
 	/** @stats: cycle and timestamp measures for job execution. */
 	struct panthor_gpu_usage stats;
+
+	/** @private_file_list: File's list of private GEM objects. */
+	struct list_head private_file_list;
 };
 
 int panthor_device_init(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ac7e53f6e3f0..1b86f4110e32 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1128,13 +1128,13 @@ static int panthor_ioctl_tiler_heap_create(struct drm_device *ddev, void *data,
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
@@ -1174,7 +1174,7 @@ static int panthor_ioctl_tiler_heap_destroy(struct drm_device *ddev, void *data,
 	if (!vm)
 		return -EINVAL;
 
-	pool = panthor_vm_get_heap_pool(vm, false);
+	pool = panthor_vm_get_heap_pool(vm, false, NULL);
 	if (IS_ERR(pool)) {
 		ret = PTR_ERR(pool);
 		goto out_put_vm;
@@ -1348,6 +1348,8 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 
 	pfile->ptdev = ptdev;
 
+	INIT_LIST_HEAD(&pfile->private_file_list);
+
 	ret = panthor_vm_pool_create(pfile);
 	if (ret)
 		goto err_free_file;
@@ -1375,6 +1377,12 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
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
 
@@ -1465,6 +1473,7 @@ static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
 
 	drm_show_memory_stats(p, file);
+	panthor_show_internal_memory_stats(p, file);
 }
 
 static const struct file_operations panthor_drm_driver_fops = {
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index ecca5565ce41..40505bf77729 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -449,6 +449,7 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
  */
 struct panthor_kernel_bo *
 panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
+				 struct panthor_file *pfile,
 				 struct panthor_fw_ringbuf_input_iface **input,
 				 const struct panthor_fw_ringbuf_output_iface **output,
 				 u32 *input_fw_va, u32 *output_fw_va)
@@ -456,11 +457,12 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
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
 
@@ -487,9 +489,12 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
  * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
  */
 struct panthor_kernel_bo *
-panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
+panthor_fw_alloc_suspend_buf_mem(struct panthor_file *pfile,
+				 struct panthor_device *ptdev,
+				 size_t size)
 {
-	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
+	return panthor_kernel_bo_create(ptdev, pfile,
+					panthor_fw_vm(ptdev), size,
 					DRM_PANTHOR_BO_NO_MMAP,
 					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
 					PANTHOR_VM_KERNEL_AUTO_VA);
@@ -609,7 +614,8 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		if (cache_mode != CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED)
 			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
 
-		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
+		section->mem = panthor_kernel_bo_create(ptdev, NULL,
+							panthor_fw_vm(ptdev),
 							section_size,
 							DRM_PANTHOR_BO_NO_MMAP,
 							vm_map_flags, va);
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 22448abde992..552db0e03e7b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -7,6 +7,7 @@
 #include <linux/types.h>
 
 struct panthor_device;
+struct panthor_file;
 struct panthor_kernel_bo;
 
 #define MAX_CSGS				31
@@ -476,11 +477,14 @@ void panthor_fw_ring_csg_doorbells(struct panthor_device *ptdev, u32 csg_slot);
 
 struct panthor_kernel_bo *
 panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
+				 struct panthor_file *pfile,
 				 struct panthor_fw_ringbuf_input_iface **input,
 				 const struct panthor_fw_ringbuf_output_iface **output,
 				 u32 *input_fw_va, u32 *output_fw_va);
 struct panthor_kernel_bo *
-panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size);
+panthor_fw_alloc_suspend_buf_mem(struct panthor_file *pfile,
+				 struct panthor_device *ptdev,
+				 size_t size);
 
 struct panthor_vm *panthor_fw_vm(struct panthor_device *ptdev);
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 8244a4e6c2a2..76e8e5bb11b0 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -5,6 +5,7 @@
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 
 #include <drm/panthor_drm.h>
@@ -24,6 +25,20 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 	drm_gem_object_put(vm_root_gem);
 }
 
+void panthor_gem_dettach_internal_bos(struct panthor_file *pfile)
+{
+	struct panthor_kernel_bo *kbo, *tmp;
+
+	mutex_lock(&pfile->ptdev->private_obj_list_lock);
+	list_for_each_entry_safe(kbo, tmp,
+				 &pfile->private_file_list,
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
@@ -31,12 +46,22 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
  */
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 {
+	struct panthor_device *ptdev;
 	struct panthor_vm *vm;
 	int ret;
 
 	if (IS_ERR_OR_NULL(bo))
 		return;
 
+	ptdev = container_of(bo->obj->dev, struct panthor_device, base);
+
+	mutex_lock(&ptdev->private_obj_list_lock);
+	if (!list_empty(&bo->private_obj)) {
+		list_del(&bo->private_obj);
+		INIT_LIST_HEAD(&bo->private_obj);
+	}
+	mutex_unlock(&ptdev->private_obj_list_lock);
+
 	vm = bo->vm;
 	panthor_kernel_bo_vunmap(bo);
 
@@ -56,6 +81,22 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 	kfree(bo);
 }
 
+void panthor_show_internal_memory_stats(struct drm_printer *p, struct drm_file *file)
+{
+	struct panthor_file *pfile = file->driver_priv;
+	struct drm_memory_stats status = {0};
+	struct panthor_kernel_bo *kbo;
+
+	mutex_lock(&pfile->ptdev->private_obj_list_lock);
+	list_for_each_entry(kbo, &pfile->private_file_list, private_obj) {
+		status.resident += kbo->obj->size;
+		status.private += kbo->obj->size;
+	}
+	mutex_unlock(&pfile->ptdev->private_obj_list_lock);
+
+	drm_print_memory_stats(p, &status, DRM_GEM_OBJECT_RESIDENT, "internal");
+}
+
 /**
  * panthor_kernel_bo_create() - Create and map a GEM object to a VM
  * @ptdev: Device.
@@ -71,9 +112,9 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
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
@@ -116,6 +157,16 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
 	drm_gem_object_get(bo->exclusive_vm_root_gem);
 	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
+
+	INIT_LIST_HEAD(&kbo->private_obj);
+
+	/* Only FW regions are not bound to an open file */
+	if (pfile) {
+		mutex_lock(&ptdev->private_obj_list_lock);
+		list_add(&kbo->private_obj, &pfile->private_file_list);
+		mutex_unlock(&ptdev->private_obj_list_lock);
+	}
+
 	return kbo;
 
 err_free_va:
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index e43021cf6d45..b308680859d0 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -12,6 +12,8 @@
 #include <linux/rwsem.h>
 
 struct panthor_vm;
+struct panthor_file;
+struct panthor_device;
 
 /**
  * struct panthor_gem_object - Driver specific GEM object.
@@ -75,6 +77,9 @@ struct panthor_kernel_bo {
 	 * @kmap: Kernel CPU mapping of @gem.
 	 */
 	void *kmap;
+
+	/** @private_node: Link to driver's list of private GEM objects. */
+	struct list_head private_obj;
 };
 
 static inline
@@ -137,10 +142,14 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
 }
 
 struct panthor_kernel_bo *
-panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
-			 size_t size, u32 bo_flags, u32 vm_map_flags,
+panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_file *pfile,
+			 struct panthor_vm *vm, size_t size,
+			 u32 bo_flags, u32 vm_map_flags,
 			 u64 gpu_va);
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
+void panthor_show_internal_memory_stats(struct drm_printer *p, struct drm_file *file);
+void panthor_gem_dettach_internal_bos(struct panthor_file *pfile);
+
 #endif /* __PANTHOR_GEM_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 3796a9eb22af..fd68257061ae 100644
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
@@ -265,6 +270,7 @@ int panthor_heap_destroy(struct panthor_heap_pool *pool, u32 handle)
  * Return: a positive handle on success, a negative error otherwise.
  */
 int panthor_heap_create(struct panthor_heap_pool *pool,
+			struct panthor_file *pfile,
 			u32 initial_chunk_count,
 			u32 chunk_size,
 			u32 max_chunks,
@@ -308,7 +314,7 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	heap->max_chunks = max_chunks;
 	heap->target_in_flight = target_in_flight;
 
-	ret = panthor_alloc_heap_chunks(pool->ptdev, vm, heap,
+	ret = panthor_alloc_heap_chunks(pool->ptdev, pfile, vm, heap,
 					initial_chunk_count);
 	if (ret)
 		goto err_free_heap;
@@ -466,7 +472,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 	 * further jobs in this queue fail immediately instead of having to
 	 * wait for the job timeout.
 	 */
-	ret = panthor_alloc_heap_chunk(pool->ptdev, pool->vm, heap, false);
+	ret = panthor_alloc_heap_chunk(pool->ptdev, pool->pfile, pool->vm, heap, false);
 	if (ret)
 		goto out_unlock;
 
@@ -526,7 +532,9 @@ panthor_heap_pool_get(struct panthor_heap_pool *pool)
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
@@ -547,7 +555,7 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
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
index 8ca85526491e..67cc112451a7 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1914,16 +1914,19 @@ struct panthor_vm *panthor_vm_get(struct panthor_vm *vm)
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
index 8d21e83d8aba..ceb31e7045ae 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -14,6 +14,7 @@ struct panthor_heap_pool;
 struct panthor_vm;
 struct panthor_vma;
 struct panthor_mmu;
+struct panthor_file;
 
 int panthor_mmu_init(struct panthor_device *ptdev);
 void panthor_mmu_unplug(struct panthor_device *ptdev);
@@ -35,7 +36,7 @@ int panthor_vm_as(struct panthor_vm *vm);
 int panthor_vm_flush_all(struct panthor_vm *vm);
 
 struct panthor_heap_pool *
-panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
+panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create, struct panthor_file *pfile);
 
 struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
 void panthor_vm_put(struct panthor_vm *vm);
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ef4bec7ff9c7..5a537a4ca281 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1435,7 +1435,7 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
 		struct panthor_fw_cs_iface *cs_iface;
 
 		cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
-		heaps = panthor_vm_get_heap_pool(group->vm, false);
+		heaps = panthor_vm_get_heap_pool(group->vm, false, NULL);
 		heap_address = cs_iface->output->heap_address;
 		vt_start = cs_iface->output->heap_vt_start;
 		vt_end = cs_iface->output->heap_vt_end;
@@ -3268,7 +3268,8 @@ static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
 }
 
 static struct panthor_queue *
-group_create_queue(struct panthor_group *group,
+group_create_queue(struct panthor_file *pfile,
+		   struct panthor_group *group,
 		   const struct drm_panthor_queue_create *args)
 {
 	struct drm_gpu_scheduler *drm_sched;
@@ -3295,7 +3296,7 @@ group_create_queue(struct panthor_group *group,
 
 	queue->priority = args->priority;
 
-	queue->ringbuf = panthor_kernel_bo_create(group->ptdev, group->vm,
+	queue->ringbuf = panthor_kernel_bo_create(group->ptdev, pfile, group->vm,
 						  args->ringbuf_size,
 						  DRM_PANTHOR_BO_NO_MMAP,
 						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
@@ -3310,7 +3311,7 @@ group_create_queue(struct panthor_group *group,
 	if (ret)
 		goto err_free_queue;
 
-	queue->iface.mem = panthor_fw_alloc_queue_iface_mem(group->ptdev,
+	queue->iface.mem = panthor_fw_alloc_queue_iface_mem(group->ptdev, pfile,
 							    &queue->iface.input,
 							    &queue->iface.output,
 							    &queue->iface.input_fw_va,
@@ -3324,7 +3325,7 @@ group_create_queue(struct panthor_group *group,
 		calc_profiling_ringbuf_num_slots(group->ptdev, args->ringbuf_size);
 
 	queue->profiling.slots =
-		panthor_kernel_bo_create(group->ptdev, group->vm,
+		panthor_kernel_bo_create(group->ptdev, pfile, group->vm,
 					 queue->profiling.slot_count *
 					 sizeof(struct panthor_job_profiling_data),
 					 DRM_PANTHOR_BO_NO_MMAP,
@@ -3427,7 +3428,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 
 	suspend_size = csg_iface->control->suspend_size;
-	group->suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, suspend_size);
+	group->suspend_buf = panthor_fw_alloc_suspend_buf_mem(pfile, ptdev, suspend_size);
 	if (IS_ERR(group->suspend_buf)) {
 		ret = PTR_ERR(group->suspend_buf);
 		group->suspend_buf = NULL;
@@ -3435,14 +3436,14 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 
 	suspend_size = csg_iface->control->protm_suspend_size;
-	group->protm_suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, suspend_size);
+	group->protm_suspend_buf = panthor_fw_alloc_suspend_buf_mem(pfile, ptdev, suspend_size);
 	if (IS_ERR(group->protm_suspend_buf)) {
 		ret = PTR_ERR(group->protm_suspend_buf);
 		group->protm_suspend_buf = NULL;
 		goto err_put_group;
 	}
 
-	group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
+	group->syncobjs = panthor_kernel_bo_create(ptdev, pfile, group->vm,
 						   group_args->queues.count *
 						   sizeof(struct panthor_syncobj_64b),
 						   DRM_PANTHOR_BO_NO_MMAP,
@@ -3462,7 +3463,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	       group_args->queues.count * sizeof(struct panthor_syncobj_64b));
 
 	for (i = 0; i < group_args->queues.count; i++) {
-		group->queues[i] = group_create_queue(group, &queue_args[i]);
+		group->queues[i] = group_create_queue(pfile, group, &queue_args[i]);
 		if (IS_ERR(group->queues[i])) {
 			ret = PTR_ERR(group->queues[i]);
 			group->queues[i] = NULL;
-- 
2.46.2

