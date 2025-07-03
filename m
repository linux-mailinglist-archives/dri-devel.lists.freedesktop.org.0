Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362DBAF7C20
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 17:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2E710E89D;
	Thu,  3 Jul 2025 15:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cUEgw4o+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C698610E8A4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751556699;
 bh=6J+m7sJfFYde+NRfy6nf+kjWVxfONpUpn9vTU0wAjGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cUEgw4o+x7+TQMzUT+EEBJOHHUlpwpAGIoTOYkpgAJj1CL6CvUGHold3QYlhigRMG
 KGY3tzVey6WXKynmgGt0c8zeQVdGZuYMNP0npcRU3Beyr7ZANGkLh8KmD1FLRSWLqr
 A0WoGUE9Jl4/ZZyBPQb/D5ZuntD7iJ3NvJsqUpN/b9cug5awmQiPHvS4BDWWUvGv8U
 ueqeMz8wO9/juT4EbxYul6e8gLbA+11yIqP0NCnRzsg7jW6mt90EBY9AXHiHAnQNCa
 db3ilOjkUZFPkGJiHzseDKsvy7Z8EH0DagQlmzpIKf6fuu8cW9i32UwNgYv9dFNGWX
 NwFcYY4CPx28A==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nanokatze)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CCB2617E09C6;
 Thu,  3 Jul 2025 17:31:38 +0200 (CEST)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, Caterina Shablia <caterina.shablia@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] drm/panthor: Add support for repeated mappings
Date: Thu,  3 Jul 2025 15:29:00 +0000
Message-ID: <20250703152908.16702-9-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250703152908.16702-2-caterina.shablia@collabora.com>
References: <20250703152908.16702-2-caterina.shablia@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Boris Brezillon <boris.brezillon@collabora.com>

This allows us to optimize mapping of a relatively small
portion of a BO over and over in a large VA range, which
is useful to support Vulkan sparse bindings in an efficient
way.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Caterina Shablia <caterina.shablia@collabora.com>
Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c |  3 +-
 drivers/gpu/drm/panthor/panthor_mmu.c | 78 ++++++++++++++++++++++++---
 include/uapi/drm/panthor_drm.h        | 23 ++++++++
 3 files changed, 95 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 1116f2d2826e..585c07b07c42 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1608,6 +1608,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
  * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
  * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
+ * - 1.6 - adds DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT flag
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1621,7 +1622,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 5,
+	.minor = 6,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index a7852485e638..adea26985c31 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -202,6 +202,9 @@ struct panthor_vm_op_ctx {
 		/** @map.bo_offset: Offset in the buffer object. */
 		u64 bo_offset;
 
+		/** @bo_repeat_range: Repeated BO range. */
+		u32 bo_repeat_range;
+
 		/**
 		 * @map.sgt: sg-table pointing to pages backing the GEM object.
 		 *
@@ -1007,6 +1010,26 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
 	return 0;
 }
 
+static int
+panthor_vm_repeated_map_pages(struct panthor_vm *vm, u64 iova, int prot,
+			      struct sg_table *sgt, u64 offset, u64 size,
+			      u64 count)
+{
+	/* FIXME: we really need to optimize this at the io_pgtable level. */
+	for (u64 i = 0; i < count; i++) {
+		int ret;
+
+		ret = panthor_vm_map_pages(vm, iova + (size * i), prot,
+					   sgt, offset, size);
+		if (ret) {
+			panthor_vm_unmap_pages(vm, iova, size * (i - 1));
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int flags_to_prot(u32 flags)
 {
 	int prot = 0;
@@ -1203,12 +1226,14 @@ panthor_vm_op_ctx_prealloc_vmas(struct panthor_vm_op_ctx *op_ctx)
 	(DRM_PANTHOR_VM_BIND_OP_MAP_READONLY | \
 	 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC | \
 	 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED | \
+	 DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT | \
 	 DRM_PANTHOR_VM_BIND_OP_TYPE_MASK)
 
 static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 					 struct panthor_vm *vm,
 					 struct panthor_gem_object *bo,
 					 u64 offset,
+					 u32 repeat_range,
 					 u64 size, u64 va,
 					 u32 flags)
 {
@@ -1224,9 +1249,22 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	    (flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) != DRM_PANTHOR_VM_BIND_OP_TYPE_MAP)
 		return -EINVAL;
 
-	/* Make sure the VA and size are aligned and in-bounds. */
-	if (size > bo->base.base.size || offset > bo->base.base.size - size)
-		return -EINVAL;
+	if (!(flags & DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT)) {
+		/* Make sure the VA and size are aligned and in-bounds. */
+		if (size > bo->base.base.size || offset > bo->base.base.size - size)
+			return -EINVAL;
+	} else {
+		/* Make sure the repeat_range is in-bounds. */
+		if (repeat_range > bo->base.base.size || offset > bo->base.base.size - repeat_range)
+			return -EINVAL;
+
+		/* Make sure size is a multiple of repeat_range */
+
+		u64 repeat_count = size;
+
+		if (do_div(repeat_count, repeat_range))
+			return -EINVAL;
+	}
 
 	/* If the BO has an exclusive VM attached, it can't be mapped to other VMs. */
 	if (bo->exclusive_vm_root_gem &&
@@ -1295,6 +1333,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 		drm_gem_shmem_unpin(&bo->base);
 
 	op_ctx->map.bo_offset = offset;
+	op_ctx->map.bo_repeat_range = repeat_range;
 
 	/* L1, L2 and L3 page tables.
 	 * We could optimize L3 allocation by iterating over the sgt and merging
@@ -2112,9 +2151,22 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 
 	panthor_vma_init(vma, op_ctx->flags & PANTHOR_VM_MAP_FLAGS);
 
-	ret = panthor_vm_map_pages(vm, op->map.va.addr, flags_to_prot(vma->flags),
-				   op_ctx->map.sgt, op->map.gem.offset,
-				   op->map.va.range);
+	if (op_ctx->flags & DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT) {
+		u64 repeat_count = op->map.va.range;
+
+		do_div(repeat_count, op->map.gem.range);
+		ret = panthor_vm_repeated_map_pages(vm, op->map.va.addr,
+						    flags_to_prot(vma->flags),
+						    op_ctx->map.sgt,
+						    op->map.gem.offset,
+						    op->map.gem.range,
+						    repeat_count);
+	} else {
+		ret = panthor_vm_map_pages(vm, op->map.va.addr,
+					   flags_to_prot(vma->flags),
+					   op_ctx->map.sgt, op->map.gem.offset,
+					   op->map.va.range);
+	}
 	if (ret)
 		return ret;
 
@@ -2237,7 +2289,7 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 
 	switch (op_type) {
 	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
-		const struct drm_gpuvm_map_req map_req = {
+		struct drm_gpuvm_map_req map_req = {
 			.va.addr = op->va.addr,
 			.va.range = op->va.range,
 			.gem.obj = op->map.vm_bo->obj,
@@ -2249,6 +2301,11 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 			break;
 		}
 
+		if (op->flags & DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT) {
+			map_req.flags |= DRM_GPUVA_REPEAT;
+			map_req.gem.range = op->map.bo_repeat_range;
+		}
+
 		ret = drm_gpuvm_sm_map(&vm->base, vm, &map_req);
 		break;
 	}
@@ -2497,6 +2554,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
 		ret = panthor_vm_prepare_map_op_ctx(op_ctx, vm,
 						    gem ? to_panthor_bo(gem) : NULL,
 						    op->bo_offset,
+						    op->bo_repeat_range,
 						    op->size,
 						    op->va,
 						    op->flags);
@@ -2698,7 +2756,11 @@ int panthor_vm_map_bo_range(struct panthor_vm *vm, struct panthor_gem_object *bo
 	struct panthor_vm_op_ctx op_ctx;
 	int ret;
 
-	ret = panthor_vm_prepare_map_op_ctx(&op_ctx, vm, bo, offset, size, va, flags);
+	/* TODO: would be nice to replace with assert instead */
+	if (flags & DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT)
+		return -EINVAL;
+
+	ret = panthor_vm_prepare_map_op_ctx(&op_ctx, vm, bo, offset, 0, size, va, flags);
 	if (ret)
 		return ret;
 
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e1f43deb7eca..ad278bc234b0 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -496,6 +496,17 @@ enum drm_panthor_vm_bind_op_flags {
 	 */
 	DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED = 1 << 2,
 
+	/**
+	 * @DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT: Repeat a BO range
+	 *
+	 * Only valid with DRM_PANTHOR_VM_BIND_OP_TYPE_MAP.
+	 *
+	 * When this is set, a BO range is repeated over the VA range.
+	 * drm_panthor_vm_bind_op::bo_repeat_range defines the size of the
+	 * BO range to repeat.
+	 */
+	DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT = 1 << 3,
+
 	/**
 	 * @DRM_PANTHOR_VM_BIND_OP_TYPE_MASK: Mask used to determine the type of operation.
 	 */
@@ -560,6 +571,18 @@ struct drm_panthor_vm_bind_op {
 	 */
 	struct drm_panthor_obj_array syncs;
 
+	/**
+	 * @bo_repeat_range: The size of the range to be repeated.
+	 *
+	 * Must be zero if DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT is not set in
+	 * flags.
+	 *
+	 * Size must be a multiple of bo_repeat_range.
+	 */
+	__u32 bo_repeat_range;
+
+	/** @pad: Padding field. MBZ. */
+	__u32 pad;
 };
 
 /**
-- 
2.47.2

