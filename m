Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E0A784705
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D93710E3A9;
	Tue, 22 Aug 2023 16:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A913810E3B0;
 Tue, 22 Aug 2023 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692721327; x=1724257327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w9u6uA82oCy1HGRCatKIP3fciJKy8mwFSrfD4R7ANTw=;
 b=HhGHKPpjn05l7SATEbRwFe6pja/JfPCOOqAhQ7qePY7pUTr5Kk+IQ3xN
 auTKzKGlkHMrk2Y5O41KrMIGFO8uv9S6Z3N20PJQwp1115J5EZdy0F6O9
 HSo7Il8bQh2+WY8C948AeewjWUPl4F4x+e7rLTQhdpGcggkBqYO25kuC2
 pK5JHFAwCWh/XVwGLtNlmWaCdS6YJKqy1hzWahePUDiWOWS2Dq/IoZyN5
 MeDulLRfj/7DMfEJwSw/4vzTIGZ6Sls7fsfpp5r+NSWfScS5BU/paUvXA
 NpsilIUewZELGTty/jaQu8fcx9UoCq82w8oq6BLSwYrRBpHv//yzNg1Tu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354260404"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="354260404"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 09:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826373929"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="826373929"
Received: from kahchuno-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.65])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 09:22:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/xe/uapi: Support pinning of userptr vmas
Date: Tue, 22 Aug 2023 18:21:36 +0200
Message-ID: <20230822162136.25895-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822162136.25895-1-thomas.hellstrom@linux.intel.com>
References: <20230822162136.25895-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support pinning of vmas using XE_VM_BIND_FLAG_PIN, initially for userptr
only. Pinned memory becomes accounted against RLIMIT_MEMLOCK and processes
with CAP_IPC_LOCK will not apply the limit. This is pretty similar to
mlock()'ing userptr memory with the added benefit that the driver is
aware and can ignore some actions in the MMU invalidation notifier.

This will initially become useful for compute VMs on hardware without
mid-thread-preemption capability since with pinned pages, the MMU
invalidation notifier never tries to preempt a running compute kernel.

If that were the only usage we could restrict this to a flag that always
pins userptr VMAs on compute VMs on such hardware, but there are
indications that this may become needed in other situations as well.

From a more general point of view, the usage pattern of a system may be
such that in most cases it only ever runs a single workload per system
and then the sysadmin would want to configure the system to allow
extensive pinning for performance reasons.

Hence we might want to extend the pinning capability to bo-backed VMAs
as well. How that pinning will be accounted remains an open but to build
on the current drm CGROUP work would be an option.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 33 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 include/uapi/drm/xe_drm.h        | 18 +++++++++++++++++
 3 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a645cfa131ca..fdfe5a411386 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -950,6 +950,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 start, u64 end,
 				    bool read_only,
 				    bool is_null,
+				    bool pin,
 				    u8 tile_mask)
 {
 	struct xe_vma *vma;
@@ -981,6 +982,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		vma->gpuva.flags |= XE_VMA_READ_ONLY;
 	if (is_null)
 		vma->gpuva.flags |= DRM_GPUVA_SPARSE;
+	if (pin)
+		vma->gpuva.flags |= XE_VMA_PINNED;
 
 	if (tile_mask) {
 		vma->tile_mask = tile_mask;
@@ -2382,6 +2385,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.read_only =
 				operation & XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = operation & XE_VM_BIND_FLAG_NULL;
+			op->map.pin = operation & XE_VM_BIND_FLAG_PIN;
 		}
 		break;
 	case XE_VM_BIND_OP_UNMAP:
@@ -2446,7 +2450,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u8 tile_mask, bool read_only, bool is_null)
+			      u8 tile_mask, bool read_only, bool is_null,
+			      bool pin)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2462,7 +2467,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, read_only, is_null,
+			    op->va.range - 1, read_only, is_null, pin,
 			    tile_mask);
 	if (bo)
 		xe_bo_unlock(bo, &ww);
@@ -2577,7 +2582,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 				vma = new_vma(vm, &op->base.map,
 					      op->tile_mask, op->map.read_only,
-					      op->map.is_null);
+					      op->map.is_null, op->map.pin);
 				if (IS_ERR(vma)) {
 					err = PTR_ERR(vma);
 					goto free_fence;
@@ -2602,10 +2607,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					bool is_null =
 						op->base.remap.unmap->va->flags &
 						DRM_GPUVA_SPARSE;
+					bool pin =
+						op->base.remap.unmap->va->flags &
+						XE_VMA_PINNED;
 
 					vma = new_vma(vm, op->base.remap.prev,
 						      op->tile_mask, read_only,
-						      is_null);
+						      is_null, pin);
 					if (IS_ERR(vma)) {
 						err = PTR_ERR(vma);
 						goto free_fence;
@@ -2638,10 +2646,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					bool is_null =
 						op->base.remap.unmap->va->flags &
 						DRM_GPUVA_SPARSE;
+					bool pin =
+						op->base.remap.unmap->va->flags &
+						XE_VMA_PINNED;
 
 					vma = new_vma(vm, op->base.remap.next,
 						      op->tile_mask, read_only,
-						      is_null);
+						      is_null, pin);
 					if (IS_ERR(vma)) {
 						err = PTR_ERR(vma);
 						goto free_fence;
@@ -3146,11 +3157,12 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 #define SUPPORTED_FLAGS	\
 	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
 	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
-	 XE_VM_BIND_FLAG_NULL | 0xffff)
+	 XE_VM_BIND_FLAG_NULL | XE_VM_BIND_FLAG_PIN | 0xffff)
 #else
 #define SUPPORTED_FLAGS	\
 	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
-	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | 0xffff)
+	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | \
+	 XE_VM_BIND_FLAG_PIN | 0xffff)
 #endif
 #define XE_64K_PAGE_MASK 0xffffull
 
@@ -3220,6 +3232,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 			goto free_bind_ops;
 		}
 
+		/* TODO: Support OP_PREFETCH, OP_MAP */
+		if (XE_IOCTL_DBG(xe, (op & XE_VM_BIND_FLAG_PIN) &&
+				 VM_BIND_OP(op) != XE_VM_BIND_OP_MAP_USERPTR)) {
+			err = -EINVAL;
+			goto free_bind_ops;
+		}
+
 		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
 				 XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, op & ~SUPPORTED_FLAGS) ||
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 9b90e649cd69..024ccabadd12 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -360,6 +360,8 @@ struct xe_vma_op_map {
 	bool read_only;
 	/** @is_null: is NULL binding */
 	bool is_null;
+	/** @pin: pin underlying memory */
+	bool pin;
 };
 
 /** struct xe_vma_op_remap - VMA remap operation */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 86f16d50e9cc..fc3d9cd4f8d0 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -631,6 +631,24 @@ struct drm_xe_vm_bind_op {
 	 * intended to implement VK sparse bindings.
 	 */
 #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
+	 /*
+	  * When the PIN flag is set, the user requests the underlying
+	  * backing store of the vma to be pinned, that is, it will be
+	  * resident while bound and the underlying physical memory
+	  * will not change. For userptr VMAs this means that if the
+	  * user performs an operation that changes the underlying
+	  * pages of the CPU virtual space, the corresponding pinned
+	  * GPU virtual space will not pick up the new memory unless
+	  * an OP_UNMAP followed by a OP_MAP_USERPTR is performed.
+	  * Pinned userptr memory is accounted in the same way as
+	  * mlock(2), and if pinning fails the following error codes
+	  * may be returned:
+	  * -EINVAL: The memory region does not support pinning.
+	  * -EPERM: The process is not permitted to pin.
+	  * -ENOMEM: The pinning limit does not allow pinning.
+	  * For userptr memory, CAP_IPC_LOCK will bypass the limit checking.
+	  */
+#define XE_VM_BIND_FLAG_PIN		(0x1 << 20)
 	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
 	__u32 op;
 
-- 
2.41.0

