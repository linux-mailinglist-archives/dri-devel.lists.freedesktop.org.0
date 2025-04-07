Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE9A7DA44
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 11:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1250C10E3EC;
	Mon,  7 Apr 2025 09:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLvkp2bt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E554510E3F9;
 Mon,  7 Apr 2025 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019593; x=1775555593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CMH3+AQCxnD9LRUQqAHHT0IT7w8YG91Ukpm3ZA0AGlA=;
 b=RLvkp2bt4FNVOoNlc0z1DIssOPshLO6JjJn+RnVXIlgfYasvmCGQdZZo
 IYrTgi4TlXTRT95iRs+z5eug/T8MjmuMV9piCALAFI5AimK8FIUz8afSC
 M7b3s1BqM1SuQxQ+gNzHK3Gy8o/dCdjYE/8MlQgyrZhVmHDB4YeDlgWYS
 pWA7/5uHQ7d+rfb8YwYfbjG3nk4E6oV842b0Dqbk1ZaNVXkhO7JwBGn7C
 LQTq5b1cHLt+u8BXJrj5bjF3Sh2yKiqyD3t2qvwr/XZhC4AR97g89LLZ+
 QLg/6TIB/sP1ydU8U6O6lG7Zg7i66xjjLjk7RuPgqQiwW6pEJb08fIzaE A==;
X-CSE-ConnectionGUID: DAWwRsjsReK0TnflddifoA==
X-CSE-MsgGUID: KK9oD+dQTU+hc+6xgN/QPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029420"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:13 -0700
X-CSE-ConnectionGUID: 8ewdbNYVSYak/s5R0MyULg==
X-CSE-MsgGUID: o7J0gA1ORoi2pkvhzla8HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778773"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <bbrezillon@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/32] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
Date: Mon,  7 Apr 2025 15:47:03 +0530
Message-Id: <20250407101719.3350996-17-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>

---
RFC Link:
https://lore.kernel.org/intel-xe/20250314080226.2059819-1-himal.prasad.ghimiray@intel.com/T/#mb706bd1c55232110e42dc7d5c05de61946982472
---
 drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
 drivers/gpu/drm/xe/xe_vm.c             |  1 +
 include/drm/drm_gpuvm.h                | 25 ++++++-
 4 files changed, 98 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..9d09d177b9fa 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2102,10 +2102,13 @@ static int
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
@@ -2118,26 +2121,35 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		u64 range = va->va.range;
 		u64 end = addr + range;
 		bool merge = !!va->gem.obj;
+		bool skip_madvise_ops = is_madvise_ops && merge;
 
+		needs_map = false;
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
@@ -2152,6 +2164,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
 				break;
 			}
 		} else if (addr < req_addr) {
@@ -2169,20 +2184,42 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
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
@@ -2194,6 +2231,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, &p, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
 				break;
 			}
 		} else if (addr > req_addr) {
@@ -2202,20 +2242,29 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
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
+				if (is_madvise_ops) {
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
@@ -2230,14 +2279,16 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
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
@@ -2336,15 +2387,15 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
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
 
@@ -2486,6 +2537,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
+ * @drm_gpuvm_sm_map_ops_flag: ops flag determining madvise or not
  * @req_obj: the &drm_gem_object to map
  * @req_offset: the offset within the &drm_gem_object
  *
@@ -2516,6 +2568,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 			    u64 req_addr, u64 req_range,
+			    enum drm_gpuvm_sm_map_ops_flags flags,
 			    struct drm_gem_object *req_obj, u64 req_offset)
 {
 	struct drm_gpuva_ops *ops;
@@ -2535,7 +2588,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
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
index fd98e74485f4..27a8dbe709c2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2314,6 +2314,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	case DRM_XE_VM_BIND_OP_MAP:
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
 		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
+						  DRM_GPUVM_SM_MAP_NOT_MADVISE,
 						  obj, bo_offset_or_userptr);
 		break;
 	case DRM_XE_VM_BIND_OP_UNMAP:
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..6c2452537d4f 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -211,6 +211,27 @@ enum drm_gpuvm_flags {
 	DRM_GPUVM_USERBITS = BIT(1),
 };
 
+/**
+ * enum drm_gpuvm_madvise_flags - flags for drm_gpuvm split/merge ops
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

