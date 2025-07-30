Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B302DB16061
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 14:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE1110E684;
	Wed, 30 Jul 2025 12:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BenTuPyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC8910E683;
 Wed, 30 Jul 2025 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878840; x=1785414840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lTDc1v4gss98IGsl46XDit4dYxl9qcMXYhxQAM37eQ8=;
 b=BenTuPyzGVagsIjwL20k8fuc0f8ULY7vA7mc1RUavYki1Prw2jlCxDlx
 yjfOJ1TNtLttHw+HsaD//Uzst7jLAG0QMmSUtfLQtf41paFh9VK6L6q9w
 PXAqOuhzP0qwkc8tMXpqoGo0sE9lapDTRCO9A6JQS57qjAz19oVcd6FO3
 wfbZI5CvMJpG5uqguI011BcTp8TMTWTyOg6Zo0GmVOSOJIxrjXTw/N2rq
 OWtn5lAy5IP2ZBWz+AIkWEpMZOfUmXPpLeXAHVzbi4Eo8aRCX37gT8F9y
 5wWeSBhDb4QU2b27Pj9NeMrqXpuhNxKZtIY77SkFen+Xvj9aM/pMyI1CZ w==;
X-CSE-ConnectionGUID: OTIEbzNbQkSlpVX6Pl9BuA==
X-CSE-MsgGUID: Fnxm3XcDTVaxn3eIE4Heqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450101"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450101"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:00 -0700
X-CSE-ConnectionGUID: sdqZiDhgS4q5ocsX7XjUaw==
X-CSE-MsgGUID: Alu8jO+cRmSfnYiWUYFzPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649419"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:33:57 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Caterina Shablia <caterina.shablia@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 01/25] drm/gpuvm: Pass map arguments through a struct
Date: Wed, 30 Jul 2025 18:30:26 +0530
Message-Id: <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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
 - Use drm_gpuva_op_map—same as drm_gpuvm_map_req (Danilo)
 - Rebase changes for drm_gpuvm_sm_map_exec_lock()
 - Fix kernel-docs

Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>

Acked-by: Danilo Krummrich <dakr@kernel.org> (#v4)
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 106 ++++++++++---------------
 drivers/gpu/drm/imagination/pvr_vm.c   |  15 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c      |  33 ++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c  |  13 ++-
 drivers/gpu/drm/xe/xe_vm.c             |  13 ++-
 include/drm/drm_gpuvm.h                |  10 +--
 7 files changed, 112 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..f04d80a3a63b 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -486,13 +486,18 @@
  *				  u64 addr, u64 range,
  *				  struct drm_gem_object *obj, u64 offset)
  *	{
+ *	        struct drm_gpuva_op_map op_map = {
+ *	                 .va.addr = addr,
+ *	                 .va.range = range,
+ *	                 .gem.obj = obj,
+ *	                 .gem.offset = offset,
+ *	           };
  *		struct drm_gpuva_ops *ops;
  *		struct drm_gpuva_op *op
  *		struct drm_gpuvm_bo *vm_bo;
  *
  *		driver_lock_va_space();
- *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
- *						  obj, offset);
+ *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, &op_map);
  *		if (IS_ERR(ops))
  *			return PTR_ERR(ops);
  *
@@ -2054,16 +2059,15 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
 
 static int
 op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
-	  u64 addr, u64 range,
-	  struct drm_gem_object *obj, u64 offset)
+	  const struct drm_gpuva_op_map *req)
 {
 	struct drm_gpuva_op op = {};
 
 	op.op = DRM_GPUVA_OP_MAP;
-	op.map.va.addr = addr;
-	op.map.va.range = range;
-	op.map.gem.obj = obj;
-	op.map.gem.offset = offset;
+	op.map.va.addr = req->va.addr;
+	op.map.va.range = req->va.range;
+	op.map.gem.obj = req->gem.obj;
+	op.map.gem.offset = req->gem.offset;
 
 	return fn->sm_step_map(&op, priv);
 }
@@ -2102,17 +2106,16 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
 static int
 __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		   const struct drm_gpuvm_ops *ops, void *priv,
-		   u64 req_addr, u64 req_range,
-		   struct drm_gem_object *req_obj, u64 req_offset)
+		   const struct drm_gpuva_op_map *req)
 {
 	struct drm_gpuva *va, *next;
-	u64 req_end = req_addr + req_range;
+	u64 req_end = req->va.addr + req->va.range;
 	int ret;
 
-	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
+	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)))
 		return -EINVAL;
 
-	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
+	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req->va.addr, req_end) {
 		struct drm_gem_object *obj = va->gem.obj;
 		u64 offset = va->gem.offset;
 		u64 addr = va->va.addr;
@@ -2120,9 +2123,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		u64 end = addr + range;
 		bool merge = !!va->gem.obj;
 
-		if (addr == req_addr) {
-			merge &= obj == req_obj &&
-				 offset == req_offset;
+		if (addr == req->va.addr) {
+			merge &= obj == req->gem.obj &&
+				 offset == req->gem.offset;
 
 			if (end == req_end) {
 				ret = op_unmap_cb(ops, priv, va, merge);
@@ -2141,9 +2144,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			if (end > req_end) {
 				struct drm_gpuva_op_map n = {
 					.va.addr = req_end,
-					.va.range = range - req_range,
+					.va.range = range - req->va.range,
 					.gem.obj = obj,
-					.gem.offset = offset + req_range,
+					.gem.offset = offset + req->va.range,
 				};
 				struct drm_gpuva_op_unmap u = {
 					.va = va,
@@ -2155,8 +2158,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					return ret;
 				break;
 			}
-		} else if (addr < req_addr) {
-			u64 ls_range = req_addr - addr;
+		} else if (addr < req->va.addr) {
+			u64 ls_range = req->va.addr - addr;
 			struct drm_gpuva_op_map p = {
 				.va.addr = addr,
 				.va.range = ls_range,
@@ -2165,8 +2168,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			};
 			struct drm_gpuva_op_unmap u = { .va = va };
 
-			merge &= obj == req_obj &&
-				 offset + ls_range == req_offset;
+			merge &= obj == req->gem.obj &&
+				 offset + ls_range == req->gem.offset;
 			u.keep = merge;
 
 			if (end == req_end) {
@@ -2189,7 +2192,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.range = end - req_end,
 					.gem.obj = obj,
 					.gem.offset = offset + ls_range +
-						      req_range,
+						      req->va.range,
 				};
 
 				ret = op_remap_cb(ops, priv, &p, &n, &u);
@@ -2197,10 +2200,10 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					return ret;
 				break;
 			}
-		} else if (addr > req_addr) {
-			merge &= obj == req_obj &&
-				 offset == req_offset +
-					   (addr - req_addr);
+		} else if (addr > req->va.addr) {
+			merge &= obj == req->gem.obj &&
+				 offset == req->gem.offset +
+					   (addr - req->va.addr);
 
 			if (end == req_end) {
 				ret = op_unmap_cb(ops, priv, va, merge);
@@ -2236,9 +2239,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		}
 	}
 
-	return op_map_cb(ops, priv,
-			 req_addr, req_range,
-			 req_obj, req_offset);
+	return op_map_cb(ops, priv, req);
 }
 
 static int
@@ -2303,10 +2304,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
  * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
- * @req_addr: the start address of the new mapping
- * @req_range: the range of the new mapping
- * @req_obj: the &drm_gem_object to map
- * @req_offset: the offset within the &drm_gem_object
+ * @req: ptr to drm_gpuva_op_map struct
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the split and merge
@@ -2333,8 +2331,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
  */
 int
 drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
-		 u64 req_addr, u64 req_range,
-		 struct drm_gem_object *req_obj, u64 req_offset)
+		 const struct drm_gpuva_op_map *req)
 {
 	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 
@@ -2343,9 +2340,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 		       ops->sm_step_unmap)))
 		return -EINVAL;
 
-	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
-				  req_addr, req_range,
-				  req_obj, req_offset);
+	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
@@ -2421,10 +2416,7 @@ static const struct drm_gpuvm_ops lock_ops = {
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @exec: the &drm_exec locking context
  * @num_fences: for newly mapped objects, the # of fences to reserve
- * @req_addr: the start address of the range to unmap
- * @req_range: the range of the mappings to unmap
- * @req_obj: the &drm_gem_object to map
- * @req_offset: the offset within the &drm_gem_object
+ * @op: ptr to drm_gpuva_op_map struct
  *
  * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
  * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
@@ -2442,12 +2434,10 @@ static const struct drm_gpuvm_ops lock_ops = {
  *            for_each_vm_bind_operation {
  *                switch (op->op) {
  *                case DRIVER_OP_UNMAP:
- *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
+ *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->va.addr, op->va.range);
  *                    break;
  *                case DRIVER_OP_MAP:
- *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
- *                                                     op->addr, op->range,
- *                                                     obj, op->obj_offset);
+ *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences, op);
  *                    break;
  *                }
  *
@@ -2478,18 +2468,16 @@ static const struct drm_gpuvm_ops lock_ops = {
 int
 drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
 			   struct drm_exec *exec, unsigned int num_fences,
-			   u64 req_addr, u64 req_range,
-			   struct drm_gem_object *req_obj, u64 req_offset)
+			   struct drm_gpuva_op_map *req)
 {
-	if (req_obj) {
-		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
+	if (req->gem.obj) {
+		int ret = drm_exec_prepare_obj(exec, req->gem.obj, num_fences);
 		if (ret)
 			return ret;
 	}
 
 	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
-				  req_addr, req_range,
-				  req_obj, req_offset);
+				  req);
 
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
@@ -2611,10 +2599,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
 /**
  * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
- * @req_addr: the start address of the new mapping
- * @req_range: the range of the new mapping
- * @req_obj: the &drm_gem_object to map
- * @req_offset: the offset within the &drm_gem_object
+ * @req: ptr to drm_gpuva_op_map struct
  *
  * This function creates a list of operations to perform splitting and merging
  * of existent mapping(s) with the newly requested one.
@@ -2642,8 +2627,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
  */
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
-			    u64 req_addr, u64 req_range,
-			    struct drm_gem_object *req_obj, u64 req_offset)
+			    const struct drm_gpuva_op_map *req)
 {
 	struct drm_gpuva_ops *ops;
 	struct {
@@ -2661,9 +2645,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 	args.vm = gpuvm;
 	args.ops = ops;
 
-	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
-				 req_addr, req_range,
-				 req_obj, req_offset);
+	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req);
 	if (ret)
 		goto err_free_ops;
 
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 2896fa7501b1..57116709de81 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -185,12 +185,17 @@ struct pvr_vm_bind_op {
 static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
 {
 	switch (bind_op->type) {
-	case PVR_VM_BIND_TYPE_MAP:
+	case PVR_VM_BIND_TYPE_MAP: {
+		const struct drm_gpuva_op_map map_req = {
+			.va.addr = bind_op->device_addr,
+			.va.range = bind_op->size,
+			.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
+			.gem.offset = bind_op->offset,
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
index 3cd8562a5109..59a9b41bc967 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -371,6 +371,12 @@ struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end)
 {
+	struct drm_gpuva_op_map op_map = {
+		.va.addr = range_start,
+		.va.range = range_end - range_start,
+		.gem.obj = obj,
+		.gem.offset = offset,
+	};
 	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
 	struct drm_gpuvm_bo *vm_bo;
 	struct msm_gem_vma *vma;
@@ -399,7 +405,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	if (obj)
 		GEM_WARN_ON((range_end - range_start) > obj->size);
 
-	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
+	drm_gpuva_init_from_op(&vma->base, &op_map);
 	vma->mapped = false;
 
 	ret = drm_gpuva_insert(&vm->base, &vma->base);
@@ -1172,10 +1178,17 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
 				break;
 			case MSM_VM_BIND_OP_MAP:
 			case MSM_VM_BIND_OP_MAP_NULL:
-				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1,
-							    op->iova, op->range,
-							    op->obj, op->obj_offset);
+			{
+				struct drm_gpuva_op_map map_req = {
+					.va.addr = op->iova,
+					.va.range = op->range,
+					.gem.obj = op->obj,
+					.gem.offset = op->obj_offset,
+				};
+
+				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
 				break;
+			}
 			default:
 				/*
 				 * lookup_op() should have already thrown an error for
@@ -1283,9 +1296,17 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
 				arg.flags |= MSM_VMA_DUMP;
 			fallthrough;
 		case MSM_VM_BIND_OP_MAP_NULL:
-			ret = drm_gpuvm_sm_map(job->vm, &arg, op->iova,
-					       op->range, op->obj, op->obj_offset);
+		{
+			struct drm_gpuva_op_map map_req = {
+				.va.addr = op->iova,
+				.va.range = op->range,
+				.gem.obj = op->obj,
+				.gem.offset = op->obj_offset,
+			};
+
+			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
 			break;
+		}
 		default:
 			/*
 			 * lookup_op() should have already thrown an error for
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index ddfc46bc1b3e..b74054b0a476 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1276,6 +1276,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 			break;
 		case OP_MAP: {
 			struct nouveau_uvma_region *reg;
+			struct drm_gpuva_op_map map_req = {
+				.va.addr = op->va.addr,
+				.va.range = op->va.range,
+				.gem.obj = op->gem.obj,
+				.gem.offset = op->gem.offset,
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
index 4140f697ba5a..5fd4245a57b9 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2169,15 +2169,22 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 	mutex_lock(&vm->op_lock);
 	vm->op_ctx = op;
 	switch (op_type) {
-	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
+	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
+		const struct drm_gpuva_op_map map_req = {
+			.va.addr = op->va.addr,
+			.va.range = op->va.range,
+			.gem.obj = op->map.vm_bo->obj,
+			.gem.offset = op->map.bo_offset,
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
index 432ea325677d..4b3e78745363 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2316,10 +2316,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 	switch (operation) {
 	case DRM_XE_VM_BIND_OP_MAP:
-	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
-		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
-						  obj, bo_offset_or_userptr);
+	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
+		struct drm_gpuva_op_map map_req = {
+			.va.addr = addr,
+			.va.range = range,
+			.gem.obj = obj,
+			.gem.offset = bo_offset_or_userptr,
+		};
+
+		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
 		break;
+	}
 	case DRM_XE_VM_BIND_OP_UNMAP:
 		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
 		break;
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 274532facfd6..892ffe75a62f 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1060,8 +1060,8 @@ struct drm_gpuva_ops {
 
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
-			    u64 addr, u64 range,
-			    struct drm_gem_object *obj, u64 offset);
+			    const struct drm_gpuva_op_map *req);
+
 struct drm_gpuva_ops *
 drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
 			      u64 addr, u64 range);
@@ -1205,16 +1205,14 @@ struct drm_gpuvm_ops {
 };
 
 int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
-		     u64 addr, u64 range,
-		     struct drm_gem_object *obj, u64 offset);
+		     const struct drm_gpuva_op_map *req);
 
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
 
 int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
 			  struct drm_exec *exec, unsigned int num_fences,
-			  u64 req_addr, u64 req_range,
-			  struct drm_gem_object *obj, u64 offset);
+			  struct drm_gpuva_op_map *req);
 
 int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
 				 u64 req_addr, u64 req_range);
-- 
2.34.1

