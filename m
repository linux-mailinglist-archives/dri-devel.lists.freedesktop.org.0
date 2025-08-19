Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA3B2C8CD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 17:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA3810E630;
	Tue, 19 Aug 2025 15:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6on35L+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D8510E62F;
 Tue, 19 Aug 2025 15:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755618832; x=1787154832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KdlqkIiwcjkZJVv9LmOHrKWao8HRhuZYEzuEkTycmIs=;
 b=U6on35L+TiemZxzff6DYAAOf8r6bZcL5z5MSiX/AOwxZMj98bexVh1f3
 JCZIfge1il5x15YpMA1K+fRp4aF1mRQrVUDb4xs27UHgh4auZaY2a3+9y
 OY04pVsszAsioujJnLGsWOSgNhvpH2RIbC5jvrxTAOgtcEuhg/WeUIaAp
 gl8GKxWpMcRkqxhyuG9md49Cyv9YdXcs0JSaoBbomjuvjr06V7gxrQQRc
 8dJftNE/2F+5+naZmfCQ/eIHWu7TddMfsJeCKkW8cROBTFo2tbleRSjoT
 OdV60EtdDBpIoYoyHZfQV2MaDnyLFWZHI8HV5TkOeTNtqbAJhr8lcc/0Z g==;
X-CSE-ConnectionGUID: 33V8VCe0Ts+9OS1q6XWAtQ==
X-CSE-MsgGUID: VqIGz4vPTw2XHVuh4GHvdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58015718"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="58015718"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:53:52 -0700
X-CSE-ConnectionGUID: iYt988bqQIiqIge3J9zTtg==
X-CSE-MsgGUID: x7lCJNU3TI6XuNiN4AfI8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167503918"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa009.jf.intel.com with ESMTP; 19 Aug 2025 08:53:50 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH 3/4] drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create
Date: Tue, 19 Aug 2025 21:50:57 +0530
Message-Id: <20250819162058.2777306-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819162058.2777306-1-himal.prasad.ghimiray@intel.com>
References: <20250819162058.2777306-1-himal.prasad.ghimiray@intel.com>
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

This ops is used to iterate over GPUVA's in the user-provided range
and split the existing sparse VMA's if the start or end of the input
range lies within it. The operations can create up to 2 REMAPS and 2 MAPs.

The primary use case is for drivers to assign attributes to GPU VAs in
the specified range without performing unmaps or merging mappings,
supporting fine-grained control over sparse va's.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 225 ++++++++++++++++++++++++++++++------
 include/drm/drm_gpuvm.h     |   3 +
 2 files changed, 191 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index c0e6f9310514..39f934a91a7b 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -420,6 +420,71 @@
  *	 new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
  */
 
+/**
+ * DOC: Madvise Logic - Splitting and Traversal
+ *
+ * This logic handles GPU VA range updates by generating remap and map operations
+ * without performing unmaps or merging existing mappings.
+ *
+ * 1) The requested range lies entirely within a single drm_gpuva. The logic splits
+ * the existing mapping at the start and end boundaries and inserts a new map.
+ *
+ * ::
+ *              a      start    end     b
+ *         pre: |-----------------------|
+ *                     drm_gpuva1
+ *
+ *              a      start    end     b
+ *         new: |-----|=========|-------|
+ *               remap   map      remap
+ *
+ * one REMAP and one MAP : Same behaviour as SPLIT and MERGE
+ *
+ * 2) The requested range spans multiple drm_gpuva regions. The logic traverses
+ * across boundaries, remapping the start and end segments, and inserting two
+ * map operations to cover the full range.
+ *
+ * ::           a       start      b              c        end       d
+ *         pre: |------------------|--------------|------------------|
+ *                    drm_gpuva1      drm_gpuva2         drm_gpuva3
+ *
+ *              a       start      b              c        end       d
+ *         new: |-------|==========|--------------|========|---------|
+ *                remap1   map1       drm_gpuva2    map2     remap2
+ *
+ * two REMAPS and two MAPS
+ *
+ * 3) Either start or end lies within a drm_gpuva. A single remap and map operation
+ * are generated to update the affected portion.
+ *
+ *
+ * ::           a/start            b              c        end       d
+ *         pre: |------------------|--------------|------------------|
+ *                    drm_gpuva1      drm_gpuva2         drm_gpuva3
+ *
+ *              a/start            b              c        end       d
+ *         new: |------------------|--------------|========|---------|
+ *                drm_gpuva1         drm_gpuva2     map1     remap1
+ *
+ * ::           a       start      b              c/end              d
+ *         pre: |------------------|--------------|------------------|
+ *                    drm_gpuva1      drm_gpuva2         drm_gpuva3
+ *
+ *              a       start      b              c/end              d
+ *         new: |-------|==========|--------------|------------------|
+ *                remap1   map1       drm_gpuva2        drm_gpuva3
+ *
+ * one REMAP and one MAP
+ *
+ * 4) Both start and end align with existing drm_gpuva boundaries. No operations
+ * are needed as the range is already covered.
+ *
+ * 5) No existing drm_gpuvas. No operations.
+ *
+ * Unlike drm_gpuvm_sm_map_ops_create, this logic avoids unmaps and merging,
+ * focusing solely on remap and map operations for efficient traversal and update.
+ */
+
 /**
  * DOC: Locking
  *
@@ -2063,6 +2128,9 @@ op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
 {
 	struct drm_gpuva_op op = {};
 
+	if (!req)
+		return 0;
+
 	op.op = DRM_GPUVA_OP_MAP;
 	op.map.va.addr = req->map.va.addr;
 	op.map.va.range = req->map.va.range;
@@ -2092,10 +2160,13 @@ op_remap_cb(const struct drm_gpuvm_ops *fn, void *priv,
 
 static int
 op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
-	    struct drm_gpuva *va, bool merge)
+	    struct drm_gpuva *va, bool merge, bool madvise)
 {
 	struct drm_gpuva_op op = {};
 
+	if (madvise)
+		return 0;
+
 	op.op = DRM_GPUVA_OP_UNMAP;
 	op.unmap.va = va;
 	op.unmap.keep = merge;
@@ -2106,11 +2177,12 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
 static int
 __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		   const struct drm_gpuvm_ops *ops, void *priv,
-		   const struct drm_gpuvm_map_req *req)
+		   const struct drm_gpuvm_map_req *req,
+		   bool madvise)
 {
 	struct drm_gem_object *req_obj = req->map.gem.obj;
+	const struct drm_gpuvm_map_req *op_map = madvise ? NULL : req;
 	struct drm_gpuva *va, *next;
-
 	u64 req_offset = req->map.gem.offset;
 	u64 req_range = req->map.va.range;
 	u64 req_addr = req->map.va.addr;
@@ -2128,19 +2200,22 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		u64 end = addr + range;
 		bool merge = !!va->gem.obj;
 
+		if (madvise && obj)
+			continue;
+
 		if (addr == req_addr) {
 			merge &= obj == req_obj &&
 				 offset == req_offset;
 
 			if (end == req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
+				ret = op_unmap_cb(ops, priv, va, merge, madvise);
 				if (ret)
 					return ret;
 				break;
 			}
 
 			if (end < req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
+				ret = op_unmap_cb(ops, priv, va, merge, madvise);
 				if (ret)
 					return ret;
 				continue;
@@ -2161,6 +2236,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (madvise)
+					op_map = req;
 				break;
 			}
 		} else if (addr < req_addr) {
@@ -2181,6 +2259,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, &p, NULL, &u);
 				if (ret)
 					return ret;
+
+				if (madvise)
+					op_map = req;
 				break;
 			}
 
@@ -2188,6 +2269,18 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, &p, NULL, &u);
 				if (ret)
 					return ret;
+
+				if (madvise) {
+					struct drm_gpuvm_map_req map_req = {
+						.map.va.addr =  req_addr,
+						.map.va.range = end - req_addr,
+					};
+
+					ret = op_map_cb(ops, priv, &map_req);
+					if (ret)
+						return ret;
+				}
+
 				continue;
 			}
 
@@ -2203,6 +2296,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, &p, &n, &u);
 				if (ret)
 					return ret;
+
+				if (madvise)
+					op_map = req;
 				break;
 			}
 		} else if (addr > req_addr) {
@@ -2211,16 +2307,18 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					   (addr - req_addr);
 
 			if (end == req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
+				ret = op_unmap_cb(ops, priv, va, merge, madvise);
 				if (ret)
 					return ret;
+
 				break;
 			}
 
 			if (end < req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
+				ret = op_unmap_cb(ops, priv, va, merge, madvise);
 				if (ret)
 					return ret;
+
 				continue;
 			}
 
@@ -2239,12 +2337,20 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (madvise) {
+					struct drm_gpuvm_map_req map_req = {
+						.map.va.addr =  addr,
+						.map.va.range = req_end - addr,
+					};
+
+					return op_map_cb(ops, priv, &map_req);
+				}
 				break;
 			}
 		}
 	}
-
-	return op_map_cb(ops, priv, req);
+	return op_map_cb(ops, priv, op_map);
 }
 
 static int
@@ -2296,7 +2402,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 			if (ret)
 				return ret;
 		} else {
-			ret = op_unmap_cb(ops, priv, va, false);
+			ret = op_unmap_cb(ops, priv, va, false, false);
 			if (ret)
 				return ret;
 		}
@@ -2345,7 +2451,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 		       ops->sm_step_unmap)))
 		return -EINVAL;
 
-	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req);
+	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req, false);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
@@ -2485,7 +2591,7 @@ drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
 			return ret;
 	}
 
-	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec, req);
+	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec, req, false);
 
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
@@ -2604,6 +2710,38 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
 	.sm_step_unmap = drm_gpuva_sm_step,
 };
 
+static struct drm_gpuva_ops *
+__drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
+			      const struct drm_gpuvm_map_req *req,
+			      bool madvise)
+{
+	struct drm_gpuva_ops *ops;
+	struct {
+		struct drm_gpuvm *vm;
+		struct drm_gpuva_ops *ops;
+	} args;
+	int ret;
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (unlikely(!ops))
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ops->list);
+
+	args.vm = gpuvm;
+	args.ops = ops;
+
+	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req, madvise);
+	if (ret)
+		goto err_free_ops;
+
+	return ops;
+
+err_free_ops:
+	drm_gpuva_ops_free(gpuvm, ops);
+	return ERR_PTR(ret);
+}
+
 /**
  * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
@@ -2637,34 +2775,47 @@ struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 			    const struct drm_gpuvm_map_req *req)
 {
-	struct drm_gpuva_ops *ops;
-	struct {
-		struct drm_gpuvm *vm;
-		struct drm_gpuva_ops *ops;
-	} args;
-	int ret;
-
-	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
-	if (unlikely(!ops))
-		return ERR_PTR(-ENOMEM);
-
-	INIT_LIST_HEAD(&ops->list);
-
-	args.vm = gpuvm;
-	args.ops = ops;
-
-	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req);
-	if (ret)
-		goto err_free_ops;
-
-	return ops;
-
-err_free_ops:
-	drm_gpuva_ops_free(gpuvm, ops);
-	return ERR_PTR(ret);
+	return __drm_gpuvm_sm_map_ops_create(gpuvm, req, false);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_ops_create);
 
+/**
+ * drm_gpuvm_madvise_ops_create() - creates the &drm_gpuva_ops to split
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @req: map request arguments
+ *
+ * This function creates a list of operations to perform splitting
+ * of existent mapping(s) at start or end, based on the request map.
+ *
+ * The list can be iterated with &drm_gpuva_for_each_op and must be processed
+ * in the given order. It can contain map and remap operations, but it
+ * also can be empty if no operation is required, e.g. if the requested mapping
+ * already exists is the exact same way.
+ *
+ * There will be no unmap operations, a maximum of two remap operations and two
+ * map operations. The two map operations correspond to: one from start to the
+ * end of drm_gpuvaX, and another from the start of drm_gpuvaY to end.
+ *
+ * Note that before calling this function again with another mapping request it
+ * is necessary to update the &drm_gpuvm's view of the GPU VA space. The
+ * previously obtained operations must be either processed or abandoned. To
+ * update the &drm_gpuvm's view of the GPU VA space drm_gpuva_insert(),
+ * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
+ * used.
+ *
+ * After the caller finished processing the returned &drm_gpuva_ops, they must
+ * be freed with &drm_gpuva_ops_free.
+ *
+ * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
+ */
+struct drm_gpuva_ops *
+drm_gpuvm_madvise_ops_create(struct drm_gpuvm *gpuvm,
+			     const struct drm_gpuvm_map_req *req)
+{
+	return __drm_gpuvm_sm_map_ops_create(gpuvm, req, true);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_madvise_ops_create);
+
 /**
  * drm_gpuvm_sm_unmap_ops_create() - creates the &drm_gpuva_ops to split on
  * unmap
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 05347ac6cc73..4a22b9d848f7 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1062,6 +1062,9 @@ struct drm_gpuvm_map_req {
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 			    const struct drm_gpuvm_map_req *req);
+struct drm_gpuva_ops *
+drm_gpuvm_madvise_ops_create(struct drm_gpuvm *gpuvm,
+			     const struct drm_gpuvm_map_req *req);
 
 struct drm_gpuva_ops *
 drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
-- 
2.34.1

