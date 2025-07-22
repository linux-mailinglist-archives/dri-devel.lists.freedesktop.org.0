Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27584B0DA86
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1C010E678;
	Tue, 22 Jul 2025 13:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7+hFUoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CF710E678;
 Tue, 22 Jul 2025 13:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189724; x=1784725724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZV9fXl7bmb0x6wlTP3l+yDfJTTmiz7zUjtKhJ9qi+bs=;
 b=H7+hFUoTK5JktUyGf8f5DfuWCcojLhCppOn1O2VHuJH386dFQmaTM4+C
 KAQgLXRYRGLHgTQGv0sK+bqUJwxCKWoA4ORx9Zm++JaZ6caAlFU9nwwX3
 NH9JzkCE86cDpO0aBSqRMTnhsVh1fXvCTbEkXnXjQfHvDZCv869+babjf
 MW01IAL6whJO6K/5UMCUVVrFiCLdaI05DaoQDzFc/3WKrEc9EEZPOCy33
 hp/YF8fzO7RS2xcNPh23STex2a1KLEYz+00zQ6W0myO3DcZRJq0EQy0bQ
 nREzQcxfMNzTOMkiFC0iwdGWwb15Q6hYYP3Qby9O8Go4v5KmGf/yE7tV9 w==;
X-CSE-ConnectionGUID: 9GVRyMkyQkGzxV2b4jlwLw==
X-CSE-MsgGUID: KojN+2kmRSuXBlKxNQAiFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530340"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530340"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:08:44 -0700
X-CSE-ConnectionGUID: Sx8EEt2ISn+Oz4tW+3EOrg==
X-CSE-MsgGUID: sF+bbTglRk2rPBmJDhEacQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420489"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:08:42 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <bbrezillon@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/23] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
Date: Tue, 22 Jul 2025 19:05:04 +0530
Message-Id: <20250722133526.3550547-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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

- DRM_GPUVM_SM_MAP_NOT_MADVISE: Default sm_map operations for the input
  range.

- DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
  drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
user-provided range and split the existing non-GEM object VMA if the
start or end of the input range lies within it. The operations can
create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to be
used by the Xe driver to assign attributes to GPUVMA's within the
user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
the operation with this flag will never have UNMAPs and
merges, and can be without any final operations.

v2
- use drm_gpuvm_sm_map_ops_create with flags instead of defining new
  ops_create (Danilo)
- Add doc (Danilo)

v3
- Fix doc
- Fix unmapping check

v4
- Fix mapping for non madvise ops

Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
 drivers/gpu/drm/xe/xe_vm.c             |  1 +
 include/drm/drm_gpuvm.h                | 25 ++++++-
 4 files changed, 98 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index e89b932e987c..c7779588ea38 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2103,10 +2103,13 @@ static int
 __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		   const struct drm_gpuvm_ops *ops, void *priv,
 		   u64 req_addr, u64 req_range,
+		   enum drm_gpuvm_sm_map_ops_flags flags,
 		   struct drm_gem_object *req_obj, u64 req_offset)
 {
 	struct drm_gpuva *va, *next;
 	u64 req_end = req_addr + req_range;
+	bool is_madvise_ops = (flags == DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE);
+	bool needs_map = !is_madvise_ops;
 	int ret;
 
 	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
@@ -2119,26 +2122,35 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		u64 range = va->va.range;
 		u64 end = addr + range;
 		bool merge = !!va->gem.obj;
+		bool skip_madvise_ops = is_madvise_ops && merge;
 
+		needs_map = !is_madvise_ops;
 		if (addr == req_addr) {
 			merge &= obj == req_obj &&
 				 offset == req_offset;
 
 			if (end == req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
 				break;
 			}
 
 			if (end < req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
 				continue;
 			}
 
 			if (end > req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				struct drm_gpuva_op_map n = {
 					.va.addr = req_end,
 					.va.range = range - req_range,
@@ -2153,6 +2165,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
 				break;
 			}
 		} else if (addr < req_addr) {
@@ -2170,20 +2185,42 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			u.keep = merge;
 
 			if (end == req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				ret = op_remap_cb(ops, priv, &p, NULL, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
+
 				break;
 			}
 
 			if (end < req_end) {
+				if (skip_madvise_ops)
+					continue;
+
 				ret = op_remap_cb(ops, priv, &p, NULL, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops) {
+					ret = op_map_cb(ops, priv, req_addr,
+							min(end - req_addr, req_end - end),
+							NULL, req_offset);
+					if (ret)
+						return ret;
+				}
+
 				continue;
 			}
 
 			if (end > req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				struct drm_gpuva_op_map n = {
 					.va.addr = req_end,
 					.va.range = end - req_end,
@@ -2195,6 +2232,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, &p, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
 				break;
 			}
 		} else if (addr > req_addr) {
@@ -2203,20 +2243,29 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					   (addr - req_addr);
 
 			if (end == req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
+
 				break;
 			}
 
 			if (end < req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
+
 				continue;
 			}
 
 			if (end > req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				struct drm_gpuva_op_map n = {
 					.va.addr = req_end,
 					.va.range = end - req_end,
@@ -2231,14 +2280,16 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					return op_map_cb(ops, priv, addr,
+							(req_end - addr), NULL, req_offset);
 				break;
 			}
 		}
 	}
-
-	return op_map_cb(ops, priv,
-			 req_addr, req_range,
-			 req_obj, req_offset);
+	return needs_map ? op_map_cb(ops, priv, req_addr,
+			   req_range, req_obj, req_offset) : 0;
 }
 
 static int
@@ -2337,15 +2388,15 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 		 struct drm_gem_object *req_obj, u64 req_offset)
 {
 	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	enum drm_gpuvm_sm_map_ops_flags flags = DRM_GPUVM_SM_MAP_NOT_MADVISE;
 
 	if (unlikely(!(ops && ops->sm_step_map &&
 		       ops->sm_step_remap &&
 		       ops->sm_step_unmap)))
 		return -EINVAL;
 
-	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
-				  req_addr, req_range,
-				  req_obj, req_offset);
+	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req_addr, req_range,
+				  flags, req_obj, req_offset);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
@@ -2487,6 +2538,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
+ * @drm_gpuvm_sm_map_ops_flag: ops flag determining madvise or not
  * @req_obj: the &drm_gem_object to map
  * @req_offset: the offset within the &drm_gem_object
  *
@@ -2517,6 +2569,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 			    u64 req_addr, u64 req_range,
+			    enum drm_gpuvm_sm_map_ops_flags flags,
 			    struct drm_gem_object *req_obj, u64 req_offset)
 {
 	struct drm_gpuva_ops *ops;
@@ -2536,7 +2589,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 	args.ops = ops;
 
 	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
-				 req_addr, req_range,
+				 req_addr, req_range, flags,
 				 req_obj, req_offset);
 	if (ret)
 		goto err_free_ops;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42..26e13fcdbdb8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1303,6 +1303,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
 							      op->va.addr,
 							      op->va.range,
+							      DRM_GPUVM_SM_MAP_NOT_MADVISE,
 							      op->gem.obj,
 							      op->gem.offset);
 			if (IS_ERR(op->ops)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2035604121e6..b2ed99551b6e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2318,6 +2318,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	case DRM_XE_VM_BIND_OP_MAP:
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
 		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
+						  DRM_GPUVM_SM_MAP_NOT_MADVISE,
 						  obj, bo_offset_or_userptr);
 		break;
 	case DRM_XE_VM_BIND_OP_UNMAP:
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..c589b886a4fd 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -211,6 +211,27 @@ enum drm_gpuvm_flags {
 	DRM_GPUVM_USERBITS = BIT(1),
 };
 
+/**
+ * enum drm_gpuvm_sm_map_ops_flags - flags for drm_gpuvm split/merge ops
+ */
+enum drm_gpuvm_sm_map_ops_flags {
+	/**
+	 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
+	 */
+	DRM_GPUVM_SM_MAP_NOT_MADVISE = 0,
+
+	/**
+	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
+	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
+	 * user-provided range and split the existing non-GEM object VMA if the
+	 * start or end of the input range lies within it. The operations can
+	 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
+	 * in default mode, the operation with this flag will never have UNMAPs and
+	 * merges, and can be without any final operations.
+	 */
+	DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE = BIT(0),
+};
+
 /**
  * struct drm_gpuvm - DRM GPU VA Manager
  *
@@ -1059,8 +1080,8 @@ struct drm_gpuva_ops {
 #define drm_gpuva_next_op(op) list_next_entry(op, entry)
 
 struct drm_gpuva_ops *
-drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
-			    u64 addr, u64 range,
+drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm, u64 addr, u64 range,
+			    enum drm_gpuvm_sm_map_ops_flags flags,
 			    struct drm_gem_object *obj, u64 offset);
 struct drm_gpuva_ops *
 drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
-- 
2.34.1

