Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D9B262C8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 12:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D062610E842;
	Thu, 14 Aug 2025 10:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boxPDOE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9040D10E842;
 Thu, 14 Aug 2025 10:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755167563; x=1786703563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ITXobWcvlFGs8HAZiR0TtS3skSoACxgxFytR0dInMCU=;
 b=boxPDOE6uiRQTUP2iRc+2fF9nG0SRMQaSYLRpzcDsSIp7jckQMNbvtOg
 65bl5OUDdb/7GW+XIWkcSj25/YX6YPp7kJhzsvBJ7uEhXGFMow/gALo1W
 AWsMmR3BOfmp8rANlxwpdX1SvMiTHplEJa9QrK0FGlQEfFAu0ABQlTZU4
 5FL7rmIzU0TWIArGJM1Xdf4v45ZqQeziDt5AjWGL2QFF5NPLHnkc3ysaH
 R0wT96zQ2ufa7vk7tndv+/plx5gvIc98ISK/PT8p5wKGZ7ydbl0m5PIAZ
 09u1J44rnZqkytJ025StOyaJSMPDSNsYQzpWFW02HQdSLVyCGy102UWZL w==;
X-CSE-ConnectionGUID: 8NQk+fLGRkKLKFIoFGY3Tg==
X-CSE-MsgGUID: NyfcFEkpTP+ZTvi42kiOZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68083730"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68083730"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 03:32:43 -0700
X-CSE-ConnectionGUID: yFUNuAr+RkWqsPYwmVPeHQ==
X-CSE-MsgGUID: SWyKAMo7TA2TBJuhu4GTAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="197579247"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 03:32:40 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Brendan King <Brendan.King@imgtec.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Caterina Shablia <caterina.shablia@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 01/24] drm/gpuvm: Pass map arguments through a struct
Date: Thu, 14 Aug 2025 16:29:27 +0530
Message-Id: <20250814105950.2177480-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
so, before we do that, let's pass arguments through a struct instead
of changing each call site every time a new optional argument is added.

v5
 - Use drm_gpuva_op_map—same as drm_gpuvm_map_req
 - Rebase changes for drm_gpuvm_sm_map_exec_lock()
 - Fix kernel-docs

v6
 - Use drm_gpuvm_map_req (Danilo/Matt)

v7
 - change member name to map instead of op_map
 - use local variable to minize the code changes in _sm_map

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Brendan King <Brendan.King@imgtec.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Danilo Krummrich <dakr@kernel.org> #v4
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v6
---
 drivers/gpu/drm/drm_gpuvm.c            | 74 +++++++++++---------------
 drivers/gpu/drm/imagination/pvr_vm.c   | 15 ++++--
 drivers/gpu/drm/msm/msm_gem_vma.c      | 25 +++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 11 ++--
 drivers/gpu/drm/panthor/panthor_mmu.c  | 13 +++--
 drivers/gpu/drm/xe/xe_vm.c             | 13 +++--
 include/drm/drm_gpuvm.h                | 20 ++++---
 7 files changed, 102 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..6c18cec70f11 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -486,13 +486,18 @@
  *				  u64 addr, u64 range,
  *				  struct drm_gem_object *obj, u64 offset)
  *	{
+ *		struct drm_gpuvm_map_req map_req = {
+ *		        .map.va.addr = addr,
+ *	                .map.va.range = range,
+ *	                .map.gem.obj = obj,
+ *	                .map.gem.offset = offset,
+ *	           };
  *		struct drm_gpuva_ops *ops;
  *		struct drm_gpuva_op *op
  *		struct drm_gpuvm_bo *vm_bo;
  *
  *		driver_lock_va_space();
- *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
- *						  obj, offset);
+ *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, &map_req);
  *		if (IS_ERR(ops))
  *			return PTR_ERR(ops);
  *
@@ -2054,16 +2059,15 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
 
 static int
 op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
-	  u64 addr, u64 range,
-	  struct drm_gem_object *obj, u64 offset)
+	  const struct drm_gpuvm_map_req *req)
 {
 	struct drm_gpuva_op op = {};
 
 	op.op = DRM_GPUVA_OP_MAP;
-	op.map.va.addr = addr;
-	op.map.va.range = range;
-	op.map.gem.obj = obj;
-	op.map.gem.offset = offset;
+	op.map.va.addr = req->map.va.addr;
+	op.map.va.range = req->map.va.range;
+	op.map.gem.obj = req->map.gem.obj;
+	op.map.gem.offset = req->map.gem.offset;
 
 	return fn->sm_step_map(&op, priv);
 }
@@ -2102,10 +2106,14 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
 static int
 __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		   const struct drm_gpuvm_ops *ops, void *priv,
-		   u64 req_addr, u64 req_range,
-		   struct drm_gem_object *req_obj, u64 req_offset)
+		   const struct drm_gpuvm_map_req *req)
 {
+	struct drm_gem_object *req_obj = req->map.gem.obj;
 	struct drm_gpuva *va, *next;
+
+	u64 req_offset = req->map.gem.offset;
+	u64 req_range = req->map.va.range;
+	u64 req_addr = req->map.va.addr;
 	u64 req_end = req_addr + req_range;
 	int ret;
 
@@ -2236,9 +2244,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		}
 	}
 
-	return op_map_cb(ops, priv,
-			 req_addr, req_range,
-			 req_obj, req_offset);
+	return op_map_cb(ops, priv, req);
 }
 
 static int
@@ -2303,10 +2309,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
  * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
- * @req_addr: the start address of the new mapping
- * @req_range: the range of the new mapping
- * @req_obj: the &drm_gem_object to map
- * @req_offset: the offset within the &drm_gem_object
+ * @req: ptr to struct drm_gpuvm_map_req
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the split and merge
@@ -2333,8 +2336,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
  */
 int
 drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
-		 u64 req_addr, u64 req_range,
-		 struct drm_gem_object *req_obj, u64 req_offset)
+		 const struct drm_gpuvm_map_req *req)
 {
 	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 
@@ -2343,9 +2345,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 		       ops->sm_step_unmap)))
 		return -EINVAL;
 
-	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
-				  req_addr, req_range,
-				  req_obj, req_offset);
+	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
@@ -2421,10 +2421,7 @@ static const struct drm_gpuvm_ops lock_ops = {
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @exec: the &drm_exec locking context
  * @num_fences: for newly mapped objects, the # of fences to reserve
- * @req_addr: the start address of the range to unmap
- * @req_range: the range of the mappings to unmap
- * @req_obj: the &drm_gem_object to map
- * @req_offset: the offset within the &drm_gem_object
+ * @req: ptr to drm_gpuvm_map_req struct
  *
  * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
  * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
@@ -2445,9 +2442,7 @@ static const struct drm_gpuvm_ops lock_ops = {
  *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
  *                    break;
  *                case DRIVER_OP_MAP:
- *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
- *                                                     op->addr, op->range,
- *                                                     obj, op->obj_offset);
+ *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences, &req);
  *                    break;
  *                }
  *
@@ -2478,18 +2473,17 @@ static const struct drm_gpuvm_ops lock_ops = {
 int
 drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
 			   struct drm_exec *exec, unsigned int num_fences,
-			   u64 req_addr, u64 req_range,
-			   struct drm_gem_object *req_obj, u64 req_offset)
+			   struct drm_gpuvm_map_req *req)
 {
+	struct drm_gem_object *req_obj = req->map.gem.obj;
+
 	if (req_obj) {
 		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
 		if (ret)
 			return ret;
 	}
 
-	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
-				  req_addr, req_range,
-				  req_obj, req_offset);
+	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec, req);
 
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
@@ -2611,10 +2605,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
 /**
  * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
- * @req_addr: the start address of the new mapping
- * @req_range: the range of the new mapping
- * @req_obj: the &drm_gem_object to map
- * @req_offset: the offset within the &drm_gem_object
+ * @req: map request arguments
  *
  * This function creates a list of operations to perform splitting and merging
  * of existent mapping(s) with the newly requested one.
@@ -2642,8 +2633,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
  */
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
-			    u64 req_addr, u64 req_range,
-			    struct drm_gem_object *req_obj, u64 req_offset)
+			    const struct drm_gpuvm_map_req *req)
 {
 	struct drm_gpuva_ops *ops;
 	struct {
@@ -2661,9 +2651,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 	args.vm = gpuvm;
 	args.ops = ops;
 
-	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
-				 req_addr, req_range,
-				 req_obj, req_offset);
+	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req);
 	if (ret)
 		goto err_free_ops;
 
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 2896fa7501b1..3d97990170bf 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -185,12 +185,17 @@ struct pvr_vm_bind_op {
 static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
 {
 	switch (bind_op->type) {
-	case PVR_VM_BIND_TYPE_MAP:
+	case PVR_VM_BIND_TYPE_MAP: {
+		const struct drm_gpuvm_map_req map_req = {
+			.map.va.addr = bind_op->device_addr,
+			.map.va.range = bind_op->size,
+			.map.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
+			.map.gem.offset = bind_op->offset,
+		};
+
 		return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
-					bind_op, bind_op->device_addr,
-					bind_op->size,
-					gem_from_pvr_gem(bind_op->pvr_obj),
-					bind_op->offset);
+					bind_op, &map_req);
+	}
 
 	case PVR_VM_BIND_TYPE_UNMAP:
 		return drm_gpuvm_sm_unmap(&bind_op->vm_ctx->gpuvm_mgr,
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 3cd8562a5109..e106428369ef 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1172,10 +1172,17 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
 				break;
 			case MSM_VM_BIND_OP_MAP:
 			case MSM_VM_BIND_OP_MAP_NULL:
-				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1,
-							    op->iova, op->range,
-							    op->obj, op->obj_offset);
+			{
+				struct drm_gpuvm_map_req map_req = {
+					.map.va.addr = op->iova,
+					.map.va.range = op->range,
+					.map.gem.obj = op->obj,
+					.map.gem.offset = op->obj_offset,
+				};
+
+				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
 				break;
+			}
 			default:
 				/*
 				 * lookup_op() should have already thrown an error for
@@ -1283,9 +1290,17 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
 				arg.flags |= MSM_VMA_DUMP;
 			fallthrough;
 		case MSM_VM_BIND_OP_MAP_NULL:
-			ret = drm_gpuvm_sm_map(job->vm, &arg, op->iova,
-					       op->range, op->obj, op->obj_offset);
+		{
+			struct drm_gpuvm_map_req map_req = {
+				.map.va.addr = op->iova,
+				.map.va.range = op->range,
+				.map.gem.obj = op->obj,
+				.map.gem.offset = op->obj_offset,
+			};
+
+			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
 			break;
+		}
 		default:
 			/*
 			 * lookup_op() should have already thrown an error for
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index ddfc46bc1b3e..d94a85509176 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1276,6 +1276,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 			break;
 		case OP_MAP: {
 			struct nouveau_uvma_region *reg;
+			struct drm_gpuvm_map_req map_req = {
+				.map.va.addr = op->va.addr,
+				.map.va.range = op->va.range,
+				.map.gem.obj = op->gem.obj,
+				.map.gem.offset = op->gem.offset,
+			};
 
 			reg = nouveau_uvma_region_find_first(uvmm,
 							     op->va.addr,
@@ -1301,10 +1307,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 			}
 
 			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
-							      op->va.addr,
-							      op->va.range,
-							      op->gem.obj,
-							      op->gem.offset);
+							      &map_req);
 			if (IS_ERR(op->ops)) {
 				ret = PTR_ERR(op->ops);
 				goto unwind_continue;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 4140f697ba5a..e3cdaa73fd38 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2169,15 +2169,22 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 	mutex_lock(&vm->op_lock);
 	vm->op_ctx = op;
 	switch (op_type) {
-	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
+	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
+		const struct drm_gpuvm_map_req map_req = {
+			.map.va.addr = op->va.addr,
+			.map.va.range = op->va.range,
+			.map.gem.obj = op->map.vm_bo->obj,
+			.map.gem.offset = op->map.bo_offset,
+		};
+
 		if (vm->unusable) {
 			ret = -EINVAL;
 			break;
 		}
 
-		ret = drm_gpuvm_sm_map(&vm->base, vm, op->va.addr, op->va.range,
-				       op->map.vm_bo->obj, op->map.bo_offset);
+		ret = drm_gpuvm_sm_map(&vm->base, vm, &map_req);
 		break;
+	}
 
 	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
 		ret = drm_gpuvm_sm_unmap(&vm->base, vm, op->va.addr, op->va.range);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d40d2d43c041..15359ee738e6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2337,10 +2337,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 	switch (operation) {
 	case DRM_XE_VM_BIND_OP_MAP:
-	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
-		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
-						  obj, bo_offset_or_userptr);
+	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
+		struct drm_gpuvm_map_req map_req = {
+			.map.va.addr = addr,
+			.map.va.range = range,
+			.map.gem.obj = obj,
+			.map.gem.offset = bo_offset_or_userptr,
+		};
+
+		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
 		break;
+	}
 	case DRM_XE_VM_BIND_OP_UNMAP:
 		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
 		break;
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 274532facfd6..a9fa44148e0c 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1058,10 +1058,20 @@ struct drm_gpuva_ops {
  */
 #define drm_gpuva_next_op(op) list_next_entry(op, entry)
 
+/**
+ * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_create]()
+ */
+struct drm_gpuvm_map_req {
+	/**
+	 * @op_map: struct drm_gpuva_op_map
+	 */
+	struct drm_gpuva_op_map map;
+};
+
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
-			    u64 addr, u64 range,
-			    struct drm_gem_object *obj, u64 offset);
+			    const struct drm_gpuvm_map_req *req);
+
 struct drm_gpuva_ops *
 drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
 			      u64 addr, u64 range);
@@ -1205,16 +1215,14 @@ struct drm_gpuvm_ops {
 };
 
 int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
-		     u64 addr, u64 range,
-		     struct drm_gem_object *obj, u64 offset);
+		     const struct drm_gpuvm_map_req *req);
 
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
 
 int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
 			  struct drm_exec *exec, unsigned int num_fences,
-			  u64 req_addr, u64 req_range,
-			  struct drm_gem_object *obj, u64 offset);
+			  struct drm_gpuvm_map_req *req);
 
 int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
 				 u64 req_addr, u64 req_range);
-- 
2.34.1

