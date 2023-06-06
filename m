Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9737872353F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 04:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5A610E1F1;
	Tue,  6 Jun 2023 02:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A4610E1EB;
 Tue,  6 Jun 2023 02:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686018253; x=1717554253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w+8+29KgPk4xXtCMYP3M0FkIlS/xldXi4NctbaE0/EM=;
 b=ChgrHY7C64EIM2STXiWhgHFw0HAd82ScZl2Y5i12BtdyzhIG3jjiJvrA
 sFKYeAmyTd56M08NIld0e7uVNGZWAx51IgUE9K1iKk3AF1hILto4ylM8z
 GT8y/v2ZHucRFGdu0dWNL/81S9F2iNmMPAk7/xhpuYJttAxJ4tr11O8aV
 11BYfet+qyHUCYKfpX4mmDL8U6N4VuclVn4si072xWwQMSC9mvSjyH466
 xLFK1gpYXNDAQqjGrsUxF8eHnIpQAHSQEtzcShR/ZXKHTkMSJ9v6oXjOf
 64thwQRR0MLPimhF7roodxptIRrZacFhwJer+Jsl5pUJix61I+4rG+WeA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="358995778"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="358995778"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 19:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="712019546"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="712019546"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 19:24:12 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/i915/gsc: fixes and updates for GSC memory
 allocation
Date: Mon,  5 Jun 2023 19:23:58 -0700
Message-Id: <20230606022402.2048235-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230606022402.2048235-1-daniele.ceraolospurio@intel.com>
References: <20230606022402.2048235-1-daniele.ceraolospurio@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few fixes/updates are required around the GSC memory allocation and it
is easier to do them all at the same time. The changes are as follows:

1 - Switch the memory allocation to stolen memory. We need to avoid
accesses from GSC FW to normal memory after the suspend function has
completed and to do so we can either switch to using stolen or make sure
the GSC is gone to sleep before the end of the suspend function. Given
that the GSC waits for a bit before going idle even if there are no
pending operations, it is easier and quicker to just use stolen memory.

2 - Reduce the GSC allocation size to 4MBs, which is the POR requirement.
The 8MBs were needed only for early FW and I had misunderstood that as
being the expected POR size when I sent the original patch.

3 - Perma-map the GSC allocation. This isn't required immediately, but it
will be needed later to be able to quickly extract the GSC logs, which are
inside the allocation. Since the mapping code needs to be rewritten due to
switching to stolen, it makes sense to do the switch immediately to avoid
having to change it again later.

Note that the explicit setting of CACHE_NONE for Wa_22016122933 has been
dropped because that's the default setting for stolen memory on !LLC
platforms.

v2: only memset the memory we're not overwriting (Alan)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 29 ++-------
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c | 77 ++++++++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h |  1 +
 3 files changed, 75 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index f46eb17a7a98..445995e55d87 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -3,6 +3,7 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include "gem/i915_gem_lmem.h"
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_gt.h"
@@ -109,38 +110,21 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
 {
 	struct intel_gt *gt = gsc_uc_to_gt(gsc);
 	struct drm_i915_private *i915 = gt->i915;
-	struct drm_i915_gem_object *obj;
-	void *src, *dst;
+	void *src;
 
 	if (!gsc->local)
 		return -ENODEV;
 
-	obj = gsc->local->obj;
-
-	if (obj->base.size < gsc->fw.size)
+	if (gsc->local->size < gsc->fw.size)
 		return -ENOSPC;
 
-	/*
-	 * Wa_22016122933: For MTL the shared memory needs to be mapped
-	 * as WC on CPU side and UC (PAT index 2) on GPU side
-	 */
-	if (IS_METEORLAKE(i915))
-		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
-
-	dst = i915_gem_object_pin_map_unlocked(obj,
-					       i915_coherent_map_type(i915, obj, true));
-	if (IS_ERR(dst))
-		return PTR_ERR(dst);
-
 	src = i915_gem_object_pin_map_unlocked(gsc->fw.obj,
 					       i915_coherent_map_type(i915, gsc->fw.obj, true));
-	if (IS_ERR(src)) {
-		i915_gem_object_unpin_map(obj);
+	if (IS_ERR(src))
 		return PTR_ERR(src);
-	}
 
-	memset(dst, 0, obj->base.size);
-	memcpy(dst, src, gsc->fw.size);
+	memcpy_toio(gsc->local_vaddr, src, gsc->fw.size);
+	memset_io(gsc->local_vaddr + gsc->fw.size, 0, gsc->local->size - gsc->fw.size);
 
 	/*
 	 * Wa_22016122933: Making sure the data in dst is
@@ -149,7 +133,6 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
 	intel_guc_write_barrier(&gt->uc.guc);
 
 	i915_gem_object_unpin_map(gsc->fw.obj);
-	i915_gem_object_unpin_map(obj);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index c659cc01f32f..4fe639a80564 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -133,26 +133,85 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
 	}
 }
 
+static int gsc_allocate_and_map_vma(struct intel_gsc_uc *gsc, u32 size)
+{
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+	struct drm_i915_gem_object *obj;
+	struct i915_vma *vma;
+	void __iomem *vaddr;
+	int ret = 0;
+
+	/*
+	 * The GSC FW doesn't immediately suspend after becoming idle, so there
+	 * is a chance that it could still be awake after we successfully
+	 * return from the  pci suspend function, even if there are no pending
+	 * operations.
+	 * The FW might therefore try to access memory for its suspend operation
+	 * after the kernel has completed the HW suspend flow; this can cause
+	 * issues if the FW is mapped in normal RAM memory, as some of the
+	 * involved HW units might've already lost power.
+	 * The driver must therefore avoid this situation and the recommended
+	 * way to do so is to use stolen memory for the GSC memory allocation,
+	 * because stolen memory takes a different path in HW and it is
+	 * guaranteed to always work as long as the GPU itself is awake (which
+	 * it must be if the GSC is awake).
+	 */
+	obj = i915_gem_object_create_stolen(gt->i915, size);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	vma = i915_gem_object_ggtt_pin(obj, NULL, 0, 0, 0);
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
+		goto err;
+	}
+
+	vaddr = i915_vma_pin_iomap(vma);
+	i915_vma_unpin(vma);
+	if (IS_ERR(vaddr)) {
+		ret = PTR_ERR(vaddr);
+		goto err;
+	}
+
+	i915_vma_make_unshrinkable(vma);
+
+	gsc->local = vma;
+	gsc->local_vaddr = vaddr;
+
+	return 0;
+
+err:
+	i915_gem_object_put(obj);
+	return ret;
+}
+
+static void gsc_unmap_and_free_vma(struct intel_gsc_uc *gsc)
+{
+	struct i915_vma *vma = fetch_and_zero(&gsc->local);
+
+	if (!vma)
+		return;
+
+	gsc->local_vaddr = NULL;
+	i915_vma_unpin_iomap(vma);
+	i915_gem_object_put(vma->obj);
+}
+
 int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
 {
 	static struct lock_class_key gsc_lock;
 	struct intel_gt *gt = gsc_uc_to_gt(gsc);
 	struct intel_engine_cs *engine = gt->engine[GSC0];
 	struct intel_context *ce;
-	struct i915_vma *vma;
 	int err;
 
 	err = intel_uc_fw_init(&gsc->fw);
 	if (err)
 		goto out;
 
-	vma = intel_guc_allocate_vma(&gt->uc.guc, SZ_8M);
-	if (IS_ERR(vma)) {
-		err = PTR_ERR(vma);
+	err = gsc_allocate_and_map_vma(gsc, SZ_4M);
+	if (err)
 		goto out_fw;
-	}
-
-	gsc->local = vma;
 
 	ce = intel_engine_create_pinned_context(engine, engine->gt->vm, SZ_4K,
 						I915_GEM_HWS_GSC_ADDR,
@@ -173,7 +232,7 @@ int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
 	return 0;
 
 out_vma:
-	i915_vma_unpin_and_release(&gsc->local, 0);
+	gsc_unmap_and_free_vma(gsc);
 out_fw:
 	intel_uc_fw_fini(&gsc->fw);
 out:
@@ -197,7 +256,7 @@ void intel_gsc_uc_fini(struct intel_gsc_uc *gsc)
 	if (gsc->ce)
 		intel_engine_destroy_pinned_context(fetch_and_zero(&gsc->ce));
 
-	i915_vma_unpin_and_release(&gsc->local, 0);
+	gsc_unmap_and_free_vma(gsc);
 
 	intel_uc_fw_fini(&gsc->fw);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
index a2a0813b8a76..c01286dddbdb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
@@ -18,6 +18,7 @@ struct intel_gsc_uc {
 
 	/* GSC-specific additions */
 	struct i915_vma *local; /* private memory for GSC usage */
+	void __iomem *local_vaddr; /* pointer to access the private memory */
 	struct intel_context *ce; /* for submission to GSC FW via GSC engine */
 
 	/* for delayed load and proxy handling */
-- 
2.40.0

