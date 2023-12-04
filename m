Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 609F1803B9E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 18:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C3910E011;
	Mon,  4 Dec 2023 17:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E394210E011
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 17:33:25 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D6199660715D;
 Mon,  4 Dec 2023 17:33:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701711204;
 bh=mgsP3qpc6VeV/BZ/4KxLTONsFvnWQOCxPGm7qADbp58=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bn91nUfFPof50XqcueLa7yMT933tHPRCsEhKHYwLd0VdMyKyuXTT8Jth0n1t7kEfo
 Tu+cOiURCZUXPY0WKiQ7ig5xno6Iago9Zg0rkdEyKiCd7uioUVjFNkwFwC4xG2LYxL
 w6XD5xdG/Hi4lp4V+bVtHrCPU0IAySGO+edpbDarsW/FJMfs/otD9TdyB3r1Yec9F5
 Zql3j2T9V3TUDMWSfFiSkAYFCjowkDastBCEcgp+hu8suyv5K7bu1QVhwbJodUrqL9
 mOsJrIsZTsctXeSUCxV5QS/Q3+yh0UoSUn5gzBpZz5IdJtgU1HYw6zmrqR9wlzfLvo
 oVnh+sbBNSP4Q==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 05/14] drm/panthor: Add GEM logical block
Date: Mon,  4 Dec 2023 18:32:58 +0100
Message-ID: <20231204173313.2098733-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204173313.2098733-1-boris.brezillon@collabora.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Anything relating to GEM object management is placed here. Nothing
particularly interesting here, given the implementation is based on
drm_gem_shmem_object, which is doing most of the work.

v3:
- Add acks for the MIT/GPL2 relicensing
- Provide a panthor_kernel_bo abstraction for buffer objects managed by
  the kernel (will replace panthor_fw_mem and be used everywhere we were
  using panthor_gem_create_and_map() before)
- Adjust things to match drm_gpuvm changes
- Change return of panthor_gem_create_with_handle() to int

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora
---
 drivers/gpu/drm/panthor/panthor_gem.c | 227 ++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h | 144 ++++++++++++++++
 2 files changed, 371 insertions(+)
 create mode 100644 drivers/gpu/drm/panthor/panthor_gem.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_gem.h

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
new file mode 100644
index 000000000000..4d676dd09956
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
+/* Copyright 2023 Collabora ltd. */
+
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+
+#include <drm/panthor_drm.h>
+
+#include "panthor_device.h"
+#include "panthor_gem.h"
+#include "panthor_mmu.h"
+
+static void panthor_gem_free_object(struct drm_gem_object *obj)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+	struct drm_gem_object *vm_root_gem = bo->exclusive_vm_root_gem;
+
+	drm_gem_free_mmap_offset(&bo->base.base);
+	mutex_destroy(&bo->gpuva_list_lock);
+	drm_gem_shmem_free(&bo->base);
+	drm_gem_object_put(vm_root_gem);
+}
+
+/**
+ * panthor_kernel_bo_destroy() - Destroy a kernel buffer object
+ * @vm: The VM this BO was mapped to.
+ * @bo: Kernel buffer object to destroy.
+ */
+void panthor_kernel_bo_destroy(struct panthor_vm *vm,
+			       struct panthor_kernel_bo *bo)
+{
+	int ret;
+
+	panthor_kernel_bo_vunmap(bo);
+
+	if (drm_WARN_ON(bo->obj->dev,
+			to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm)))
+		goto out_free_bo;
+
+	if (!vm)
+		goto out_free_bo;
+
+	ret = panthor_vm_unmap_range(vm, bo->va_node.start,
+				     panthor_kernel_bo_size(bo));
+	if (ret)
+		goto out_free_bo;
+
+	panthor_vm_free_va(vm, &bo->va_node);
+	drm_gem_object_put(bo->obj);
+
+out_free_bo:
+	kfree(bo);
+}
+
+/**
+ * panthor_kernel_bo_create() - Create and map a GEM object to a VM
+ * @ptdev: Device.
+ * @vm: VM to map the GEM to. If NULL, the kernel object is not GPU mapped.
+ * @size: Size of the buffer object.
+ * @bo_flags: Combination of drm_panthor_bo_flags flags.
+ * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
+ * that are related to map operations).
+ * @gpu_va: GPU address assigned when mapping to the VM.
+ * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
+ * automatically allocated.
+ *
+ * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
+ */
+struct panthor_kernel_bo *
+panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
+			 size_t size, u32 bo_flags, u32 vm_map_flags,
+			 u64 gpu_va)
+{
+	struct drm_gem_shmem_object *obj;
+	struct panthor_kernel_bo *kbo;
+	struct panthor_gem_object *bo;
+	int ret;
+
+	kbo = kzalloc(sizeof(*kbo), GFP_KERNEL);
+	if (!kbo)
+		return ERR_PTR(-ENOMEM);
+
+	obj = drm_gem_shmem_create(&ptdev->base, size);
+	if (IS_ERR(obj)) {
+		ret = PTR_ERR(obj);
+		goto err_free_bo;
+	}
+
+	bo = to_panthor_bo(&obj->base);
+	size = obj->base.size;
+	kbo->obj = &obj->base;
+	bo->flags = bo_flags;
+
+	if (!vm)
+		return 0;
+
+	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
+	if (ret)
+		goto err_put_obj;
+
+	ret = panthor_vm_map_bo_range(vm, bo, 0, size, kbo->va_node.start, vm_map_flags);
+	if (ret)
+		goto err_free_va;
+
+	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
+	drm_gem_object_get(bo->exclusive_vm_root_gem);
+	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
+	return kbo;
+
+err_free_va:
+	panthor_vm_free_va(vm, &kbo->va_node);
+
+err_put_obj:
+	drm_gem_object_put(&obj->base);
+
+err_free_bo:
+	kfree(kbo);
+	return ERR_PTR(ret);
+}
+
+static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+
+	/* Don't allow mmap on objects that have the NO_MMAP flag set. */
+	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
+		return -EINVAL;
+
+	return drm_gem_shmem_object_mmap(obj, vma);
+}
+
+static struct dma_buf *
+panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
+{
+	/* We can't export GEMs that have an exclusive VM. */
+	if (to_panthor_bo(obj)->exclusive_vm_root_gem)
+		return ERR_PTR(-EINVAL);
+
+	return drm_gem_prime_export(obj, flags);
+}
+
+static const struct drm_gem_object_funcs panthor_gem_funcs = {
+	.free = panthor_gem_free_object,
+	.print_info = drm_gem_shmem_object_print_info,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = panthor_gem_mmap,
+	.export = panthor_gem_prime_export,
+	.vm_ops = &drm_gem_shmem_vm_ops,
+};
+
+/**
+ * panthor_gem_create_object - Implementation of driver->gem_create_object.
+ * @ddev: DRM device
+ * @size: Size in bytes of the memory the object will reference
+ *
+ * This lets the GEM helpers allocate object structs for us, and keep
+ * our BO stats correct.
+ */
+struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size)
+{
+	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
+	struct panthor_gem_object *obj;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj->base.base.funcs = &panthor_gem_funcs;
+	obj->base.map_wc = !ptdev->coherent;
+	mutex_init(&obj->gpuva_list_lock);
+	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
+
+	return &obj->base.base;
+}
+
+/**
+ * panthor_gem_create_with_handle() - Create a GEM object and attach it to a handle.
+ * @file: DRM file.
+ * @ddev: DRM device.
+ * @exclusive_vm: Exclusive VM. Not NULL if the GEM object can't be shared.
+ * @size: Size of the GEM object to allocate.
+ * @flags: Combination of drm_panthor_bo_flags flags.
+ * @handle: Pointer holding the handle pointing to the new GEM object.
+ *
+ * Return: Zero on success
+ */
+int
+panthor_gem_create_with_handle(struct drm_file *file,
+			       struct drm_device *ddev,
+			       struct panthor_vm *exclusive_vm,
+			       size_t size,
+			       u32 flags, u32 *handle)
+{
+	int ret;
+	struct drm_gem_shmem_object *shmem;
+	struct panthor_gem_object *bo;
+
+	shmem = drm_gem_shmem_create(ddev, size);
+	if (IS_ERR(shmem))
+		return PTR_ERR(shmem);
+
+	bo = to_panthor_bo(&shmem->base);
+	bo->flags = flags;
+
+	if (exclusive_vm) {
+		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
+		drm_gem_object_get(bo->exclusive_vm_root_gem);
+		bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
+	}
+
+	/*
+	 * Allocate an id of idr table where the obj is registered
+	 * and handle has the id what user can see.
+	 */
+	ret = drm_gem_handle_create(file, &shmem->base, handle);
+	/* drop reference from allocate - handle holds it now. */
+	drm_gem_object_put(&shmem->base);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
new file mode 100644
index 000000000000..6c8010ceb641
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
+/* Copyright 2023 Collabora ltd. */
+
+#ifndef __PANTHOR_GEM_H__
+#define __PANTHOR_GEM_H__
+
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_mm.h>
+
+#include <linux/iosys-map.h>
+#include <linux/rwsem.h>
+
+struct panthor_vm;
+
+/**
+ * struct panthor_gem_object - Driver specific GEM object.
+ */
+struct panthor_gem_object {
+	/** @base: Inherit from drm_gem_shmem_object. */
+	struct drm_gem_shmem_object base;
+
+	/**
+	 * @exclusive_vm_root_gem: Root GEM of the exclusive VM this GEM object
+	 * is attached to.
+	 *
+	 * If @exclusive_vm_root_gem != NULL, any attempt to bind the GEM to a
+	 * different VM will fail.
+	 *
+	 * All FW memory objects have this field set to the root GEM of the MCU
+	 * VM.
+	 */
+	struct drm_gem_object *exclusive_vm_root_gem;
+
+	/**
+	 * @gpuva_list_lock: Custom GPUVA lock.
+	 *
+	 * Used to protect insertion of drm_gpuva elements to the
+	 * drm_gem_object.gpuva.list list.
+	 *
+	 * We can't use the GEM resv for that, because drm_gpuva_link() is
+	 * called in a dma-signaling path, where we're not allowed to take
+	 * resv locks.
+	 */
+	struct mutex gpuva_list_lock;
+
+	/** @flags: Combination of drm_panthor_bo_flags flags. */
+	u32 flags;
+};
+
+/**
+ * struct panthor_kernel_bo - Kernel buffer object.
+ *
+ * These objects are only manipulated by the kernel driver and not
+ * directly exposed to the userspace. The GPU address of a kernel
+ * BO might be passed to userspace though.
+ */
+struct panthor_kernel_bo {
+	/**
+	 * @obj: The GEM object backing this kernel buffer object.
+	 */
+	struct drm_gem_object *obj;
+
+	/**
+	 * @va_node: VA space allocated to this GEM.
+	 */
+	struct drm_mm_node va_node;
+
+	/**
+	 * @kmap: Kernel CPU mapping of @gem.
+	 */
+	void *kmap;
+};
+
+static inline
+struct panthor_gem_object *to_panthor_bo(struct drm_gem_object *obj)
+{
+	return container_of(to_drm_gem_shmem_obj(obj), struct panthor_gem_object, base);
+}
+
+struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size);
+
+struct drm_gem_object *
+panthor_gem_prime_import_sg_table(struct drm_device *ddev,
+				  struct dma_buf_attachment *attach,
+				  struct sg_table *sgt);
+
+int
+panthor_gem_create_with_handle(struct drm_file *file,
+			       struct drm_device *ddev,
+			       struct panthor_vm *exclusive_vm,
+			       size_t size,
+			       u32 flags,
+			       uint32_t *handle);
+
+static inline u64
+panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
+{
+	return bo->va_node.start;
+}
+
+static inline size_t
+panthor_kernel_bo_size(struct panthor_kernel_bo *bo)
+{
+	return bo->obj->size;
+}
+
+static inline int
+panthor_kernel_bo_vmap(struct panthor_kernel_bo *bo)
+{
+	struct iosys_map map;
+	int ret;
+
+	if (bo->kmap)
+		return 0;
+
+	ret = drm_gem_vmap_unlocked(bo->obj, &map);
+	if (ret)
+		return ret;
+
+	bo->kmap = map.vaddr;
+	return 0;
+}
+
+static inline void
+panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
+{
+	if (bo->kmap) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(bo->kmap);
+
+		drm_gem_vunmap_unlocked(bo->obj, &map);
+		bo->kmap = NULL;
+	}
+}
+
+struct panthor_kernel_bo *
+panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
+			 size_t size, u32 bo_flags, u32 vm_map_flags,
+			 u64 gpu_va);
+
+void panthor_kernel_bo_destroy(struct panthor_vm *vm,
+			       struct panthor_kernel_bo *bo);
+
+#endif /* __PANTHOR_GEM_H__ */
-- 
2.43.0

