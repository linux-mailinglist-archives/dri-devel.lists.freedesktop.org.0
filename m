Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4757765A3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 18:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB3310E478;
	Wed,  9 Aug 2023 16:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FA110E46C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 16:53:38 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D2D496607218;
 Wed,  9 Aug 2023 17:53:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691600017;
 bh=KC+nLtq4h74wiKszLn85zFXhEG7xwv7NmNWnYIGLJtc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QLyFtJdi+GwzKBRCPndqJP9aHXJw69Rv7nCGrYZfcwFGjmUyy/4MyMiYnBZjSC42U
 X2xm4ruBHgeovqPq+GRnbPGrtNTEweNgKhaUFE83q2nT3vqCY4+usMdZ8zzx3TkA9b
 +Plm7vI/m8j1i1E25ENC0vGch/Hg3y+SSrQvChEYLlcvIv9AsQfYY9kJDT744w7xiC
 AQW8jdXk6By3/AlF9sZMaK+1pbRYap61lgyDVwBAGVG4O3O20Er3yTXoTpV70PilIs
 QCHnh13nyRVGeC9vTdoDTPbEkNdgLe6i8W6Q4pllubiy9Y+BkuS9Vi8tLtwl9MAlHB
 GQuX3m7M22CSg==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/15] drm/panthor: Add GEM logical block
Date: Wed,  9 Aug 2023 18:53:19 +0200
Message-ID: <20230809165330.2451699-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809165330.2451699-1-boris.brezillon@collabora.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Anything relating to GEM object management is placed here. Nothing
particularly interesting here, given the implementation is based on
drm_gem_shmem_object, which is doing most of the work.

v2:
- Rename the driver (pancsf -> panthor)
- Change the license (GPL2 -> MIT + GPL2)
- Split the driver addition commit
- Document the code

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 229 ++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h |  96 +++++++++++
 2 files changed, 325 insertions(+)
 create mode 100644 drivers/gpu/drm/panthor/panthor_gem.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_gem.h

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
new file mode 100644
index 000000000000..a441a68822ca
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -0,0 +1,229 @@
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
+
+	if (drm_WARN_ON(obj->dev, bo->va_node))
+		panthor_vm_free_va(bo->exclusive_vm, bo->va_node);
+
+	panthor_vm_put(bo->exclusive_vm);
+	drm_gem_free_mmap_offset(&bo->base.base);
+	mutex_destroy(&bo->gpuva_list_lock);
+	drm_gem_shmem_free(&bo->base);
+}
+
+/**
+ * panthor_gem_unmap_and_put() - Unmap and drop the reference on a GEM object
+ * @vm: VM to unmap the GEM from.
+ * @bo: GEM object to unmap/release.
+ * @gpu_va: GPU/MCU virtual address the GEM object was mapped at.
+ * @cpu_va: kernel mapping of the GEM object.
+ * Can be NULL if the GEM was not CPU mapped.
+ *
+ * Should be called to undo what was done in panthor_gem_create_and_map().
+ */
+void panthor_gem_unmap_and_put(struct panthor_vm *vm,
+			       struct panthor_gem_object *bo,
+			       u64 gpu_va, void *cpu_va)
+{
+	if (cpu_va) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(cpu_va);
+
+		drm_gem_vunmap_unlocked(&bo->base.base, &map);
+	}
+
+	drm_WARN_ON(bo->base.base.dev, panthor_vm_unmap_range(vm, gpu_va, bo->base.base.size));
+	panthor_vm_free_va(vm, bo->va_node);
+	bo->va_node = NULL;
+	drm_gem_object_put(&bo->base.base);
+}
+
+/**
+ * panthor_gem_create_and_map() - Create and map a GEM object to a VM
+ * @ptdev: Device.
+ * @vm: VM to map the GEM to.
+ * @bo_flags: Combination of drm_panthor_bo_flags flags.
+ * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
+ * that are related to map operations).
+ * @gpu_va: Pointer holding the GPU address assigned when mapping to the VM.
+ * If *gpu_va == PANTHOR_GEM_ALLOC_VA, a virtual address range will be allocated
+ * and the allocated address returned, otherwise *gpu_va is used directly.
+ * @cpu_va: Pointer holding the kernel CPU mapping. If NULL, the GEM object
+ * is not CPU-mapped.
+ *
+ * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
+ */
+struct panthor_gem_object *
+panthor_gem_create_and_map(struct panthor_device *ptdev, struct panthor_vm *vm,
+			   size_t size, u32 bo_flags, u32 vm_map_flags,
+			   u64 *gpu_va, void **cpu_va)
+{
+	struct drm_gem_shmem_object *obj;
+	struct panthor_gem_object *bo;
+	int ret;
+
+	obj = drm_gem_shmem_create(&ptdev->base, size);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	bo = to_panthor_bo(&obj->base);
+	bo->flags = bo_flags;
+	bo->exclusive_vm = panthor_vm_get(vm);
+	bo->base.base.resv = panthor_vm_resv(vm);
+
+	if (*gpu_va == PANTHOR_GEM_ALLOC_VA) {
+		bo->va_node = panthor_vm_alloc_va(vm, obj->base.size);
+
+		if (IS_ERR(bo->va_node)) {
+			ret = PTR_ERR(bo->va_node);
+			bo->va_node = NULL;
+			goto err_put_obj;
+		}
+
+		*gpu_va = bo->va_node->start;
+	}
+
+	ret = panthor_vm_map_bo_range(vm, bo, 0, obj->base.size, *gpu_va, vm_map_flags);
+	if (ret)
+		goto err_put_obj;
+
+	if (cpu_va) {
+		struct iosys_map map;
+		int ret;
+
+		ret = drm_gem_vmap_unlocked(&obj->base, &map);
+		if (ret)
+			goto err_vm_unmap_range;
+
+		*cpu_va = map.vaddr;
+	}
+
+	return bo;
+
+err_vm_unmap_range:
+	panthor_vm_unmap_range(vm, *gpu_va, obj->base.size);
+
+err_put_obj:
+	drm_gem_object_put(&obj->base);
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
+	if (to_panthor_bo(obj)->exclusive_vm)
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
+ * @dev: DRM device
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
+ * Return: A valid pointer on success, an ERR_PTR() otherwise.
+ */
+struct panthor_gem_object *
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
+		return ERR_CAST(shmem);
+
+	bo = to_panthor_bo(&shmem->base);
+	bo->flags = flags;
+
+	if (exclusive_vm) {
+		bo->exclusive_vm = panthor_vm_get(exclusive_vm);
+		bo->base.base.resv = panthor_vm_resv(exclusive_vm);
+	}
+
+	/*
+	 * Allocate an id of idr table where the obj is registered
+	 * and handle has the id what user can see.
+	 */
+	ret = drm_gem_handle_create(file, &shmem->base, handle);
+	/* drop reference from allocate - handle holds it now. */
+	drm_gem_object_put(&shmem->base);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return bo;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
new file mode 100644
index 000000000000..07babadc7623
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -0,0 +1,96 @@
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
+	 * @va_node: VA space allocated to this GEM.
+	 *
+	 * Should be NULL for all GEM objects managed by userspace.
+	 *
+	 * Not NULL when %PANTHOR_GEM_ALLOC_VA is passed as an address, in
+	 * which case the GEM logic will auto-allocate a VA range before mapping
+	 * to the VM.
+	 *
+	 * @exclusive_vm must be != NULL.
+	 */
+	struct drm_mm_node *va_node;
+
+	/**
+	 * @exclusive_vm: Exclusive VM this GEM object can be mapped to.
+	 *
+	 * If @exclusive_vm != NULL, any attempt to bind the GEM to a different
+	 * VM will fail.
+	 *
+	 * All FW memory objects have this field set to the MCU VM.
+	 */
+	struct panthor_vm *exclusive_vm;
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
+struct panthor_gem_object *
+panthor_gem_create_with_handle(struct drm_file *file,
+			       struct drm_device *ddev,
+			       struct panthor_vm *exclusive_vm,
+			       size_t size,
+			       u32 flags,
+			       uint32_t *handle);
+
+void panthor_gem_unmap_and_put(struct panthor_vm *vm, struct panthor_gem_object *bo,
+			       u64 gpu_va, void *cpu_va);
+
+/*
+ * PANTHOR_GEM_ALLOC_VA: Use this magic address when you want the GEM
+ * logic to auto-allocate the virtual address in the reserved kernel VA range.
+ */
+#define PANTHOR_GEM_ALLOC_VA		~0ull
+
+struct panthor_gem_object *
+panthor_gem_create_and_map(struct panthor_device *ptdev, struct panthor_vm *vm,
+			   size_t size, u32 bo_flags, u32 vm_map_flags,
+			   u64 *gpu_va, void **cpu_va);
+
+#endif /* __PANTHOR_GEM_H__ */
-- 
2.41.0

