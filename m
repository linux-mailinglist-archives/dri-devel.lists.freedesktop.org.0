Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EDF780E9F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 17:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B2610E53E;
	Fri, 18 Aug 2023 15:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A583110E53A;
 Fri, 18 Aug 2023 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692371408; x=1723907408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v90Ib/kJ8DKC8sZ0/kZtpmnx7LiJ/Ou5+DKlfr6W+i0=;
 b=bDzIetmfADFbbJiLKmKcX6r33rgn1keY9P1yVtHX8B2Dx9MoClNry9/4
 iFQZhG8h/P3ttLejgMKV7l6FDk9RQNU0veQH2FSxSMle1bNO83m0JfDcL
 B6in2UfSuvHU71kAzcL2HlsZB3ZlPUmmW78zgioApxm3vqz9+yavMJE/2
 otRjvlWR7WFO125Xw8FzASfU4MmaX7UTOsa8RJKOKAJd2g6dT4i7HN9Vp
 jxOwm87rom1xwYkOwptBqK2vnUj71ddOLn7tDqqTItjAlv6L2m1tfkBkh
 ZAwRC9MhMZooLElmBH5pWWAZSwYx730U2opIF+lxnxBrYfSW5M3Aux/Fj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="363276862"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="363276862"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 08:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="1065774217"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="1065774217"
Received: from kjeldbeg-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.202])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 08:09:37 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe/uapi: Support pinning of userptr vmas
Date: Fri, 18 Aug 2023 17:08:45 +0200
Message-ID: <20230818150845.96679-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
References: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
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
---
 drivers/gpu/drm/xe/xe_vm.c       | 33 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 include/uapi/drm/xe_drm.h        | 18 +++++++++++++++++
 3 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d9c000689002..3832f1f21def 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -936,6 +936,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 start, u64 end,
 				    bool read_only,
 				    bool is_null,
+				    bool pin,
 				    u8 tile_mask)
 {
 	struct xe_vma *vma;
@@ -967,6 +968,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		vma->gpuva.flags |= XE_VMA_READ_ONLY;
 	if (is_null)
 		vma->gpuva.flags |= DRM_GPUVA_SPARSE;
+	if (pin)
+		vma->gpuva.flags |= XE_VMA_PINNED;
 
 	if (tile_mask) {
 		vma->tile_mask = tile_mask;
@@ -2367,6 +2370,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.read_only =
 				operation & XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = operation & XE_VM_BIND_FLAG_NULL;
+			op->map.pin = operation & XE_VM_BIND_FLAG_PIN;
 		}
 		break;
 	case XE_VM_BIND_OP_UNMAP:
@@ -2431,7 +2435,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u8 tile_mask, bool read_only, bool is_null)
+			      u8 tile_mask, bool read_only, bool is_null,
+			      bool pin)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2447,7 +2452,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, read_only, is_null,
+			    op->va.range - 1, read_only, is_null, pin,
 			    tile_mask);
 	if (bo)
 		xe_bo_unlock(bo, &ww);
@@ -2562,7 +2567,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 				vma = new_vma(vm, &op->base.map,
 					      op->tile_mask, op->map.read_only,
-					      op->map.is_null);
+					      op->map.is_null, op->map.pin);
 				if (IS_ERR(vma)) {
 					err = PTR_ERR(vma);
 					goto free_fence;
@@ -2587,10 +2592,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
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
@@ -2623,10 +2631,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
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
@@ -3131,11 +3142,12 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
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
 
@@ -3205,6 +3217,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
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

