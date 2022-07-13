Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A8F5732AA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602ED98AB7;
	Wed, 13 Jul 2022 09:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191DC98A7E;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3548161CD6;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54376C341DE;
 Wed, 13 Jul 2022 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657704622;
 bh=13GXq2zQb7Bxagr/w8vw9akDrkJzNGqiR7Sg4+9Z8Ds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uDR+oj1Uo0dd07KKa07FD91ksV5rjZafhgb75JpGn7nLZpTmaVt2d4I73XcSC1T90
 38YlhonG421daCMfaODah47ilSlJC8NMlpB6YOUCCSlxTXYN3TOEZ5jU/JhP3RE1wI
 t4y21oq+GLPNWcWE4NQjFz4q22qEG3ljPjs6uxe8fXHKCsOCAxUtgp44dN0X9IAIPp
 ix1g/qrc5z7hD+TzOjSQo/2M3AaoTS0J7JafwyPRBarpeiTQSgfXThijjwbKc1hEe1
 A6ZSsy2lcaOeRPJ6QljaCNgGCfBiVvKl1qwYybSLk2IXx483dACp37lVE/WqzbbFQY
 uVr+zS4SQCXnQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBYhH-0050Lo-R1;
 Wed, 13 Jul 2022 10:30:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 13/21] drm/i915: Invalidate the TLBs on each GT
Date: Wed, 13 Jul 2022 10:30:10 +0100
Message-Id: <5b44379c3ec1960000a11b30215d22ff1e286df6.1657703926.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657703926.git.mchehab@kernel.org>
References: <cover.1657703926.git.mchehab@kernel.org>
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
Cc: Fei Yang <fei.yang@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Matthew Brost <matthew.brost@intel.com>,
 Michael Cheng <michael.cheng@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

With multi-GT devices, the object may have been bound on each GT.
Invalidate the TLBs across all GT before releasing the pages
back to the system.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/21] at: https://lore.kernel.org/all/cover.1657703926.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  4 +++-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c        | 13 ++++++++-----
 drivers/gpu/drm/i915/gt/intel_engine.h           |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.h   |  3 ++-
 drivers/gpu/drm/i915/gt/intel_gt_defines.h       | 11 +++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h         |  4 +++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c            |  4 ++--
 drivers/gpu/drm/i915/i915_drv.h                  |  1 -
 drivers/gpu/drm/i915/i915_vma.c                  | 14 +++++++++++---
 drivers/gpu/drm/i915/i915_vma.h                  |  2 +-
 10 files changed, 42 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_defines.h

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 9f6b14ec189a..3c1d0b750a67 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -17,6 +17,8 @@
 #include "i915_selftest.h"
 #include "i915_vma_resource.h"
 
+#include "gt/intel_gt_defines.h"
+
 struct drm_i915_gem_object;
 struct intel_fronbuffer;
 struct intel_memory_region;
@@ -616,7 +618,7 @@ struct drm_i915_gem_object {
 		 */
 		bool dirty:1;
 
-		u32 tlb;
+		u32 tlb[I915_MAX_GT];
 	} mm;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 1cd76cc5d9f3..4a6a2f2e8148 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -194,13 +194,16 @@ static void unmap_object(struct drm_i915_gem_object *obj, void *ptr)
 static void flush_tlb_invalidate(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct intel_gt *gt = to_gt(i915);
+	struct intel_gt *gt;
+	int id;
 
-	if (!obj->mm.tlb)
-		return;
+	for_each_gt(gt, i915, id) {
+		if (!obj->mm.tlb[id])
+			continue;
 
-	intel_gt_invalidate_tlb_full(gt, obj->mm.tlb);
-	obj->mm.tlb = 0;
+		intel_gt_invalidate_tlb_full(gt, obj->mm.tlb[id]);
+		obj->mm.tlb[id] = 0;
+	}
 }
 
 struct sg_table *
diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 04e435bce79b..fe1dc55bf8f7 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -18,6 +18,7 @@
 #include "intel_gt_types.h"
 #include "intel_timeline.h"
 #include "intel_workarounds.h"
+#include "uc/intel_guc_submission.h"
 
 struct drm_printer;
 struct intel_context;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.h b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.h
index 487b8a5520f1..8d41cf0c937a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.h
@@ -11,8 +11,9 @@
 #include "i915_active.h"
 #include "intel_gt_buffer_pool_types.h"
 
-struct intel_gt;
+enum i915_map_type;
 struct i915_request;
+struct intel_gt;
 
 struct intel_gt_buffer_pool_node *
 intel_gt_get_buffer_pool(struct intel_gt *gt, size_t size,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_defines.h b/drivers/gpu/drm/i915/gt/intel_gt_defines.h
new file mode 100644
index 000000000000..7c711726d663
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_defines.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#ifndef __INTEL_GT_DEFINES__
+#define __INTEL_GT_DEFINES__
+
+#define I915_MAX_GT 4
+
+#endif
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 3804a583382b..b857c3972251 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -19,7 +19,6 @@
 #include "uc/intel_uc.h"
 #include "intel_gsc.h"
 
-#include "i915_vma.h"
 #include "intel_engine_types.h"
 #include "intel_gt_buffer_pool_types.h"
 #include "intel_hwconfig.h"
@@ -31,8 +30,11 @@
 #include "intel_wakeref.h"
 #include "pxp/intel_pxp_types.h"
 
+#include "intel_gt_defines.h"
+
 struct drm_i915_private;
 struct i915_ggtt;
+struct i915_vma;
 struct intel_engine_cs;
 struct intel_uncore;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 2da6c82a8bd2..f764d250e929 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -8,6 +8,7 @@
 #include "gem/i915_gem_lmem.h"
 
 #include "i915_trace.h"
+#include "intel_gt.h"
 #include "intel_gtt.h"
 #include "gen6_ppgtt.h"
 #include "gen8_ppgtt.h"
@@ -210,8 +211,7 @@ void ppgtt_unbind_vma(struct i915_address_space *vm,
 		return;
 
 	vm->clear_range(vm, vma_res->start, vma_res->vma_size);
-	if (vma_res->tlb)
-		vma_invalidate_tlb(vm, *vma_res->tlb);
+	vma_invalidate_tlb(vm, vma_res->tlb);
 }
 
 static unsigned long pd_count(u64 size, int shift)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index d25647be25d1..f1f70257dbe0 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -711,7 +711,6 @@ struct drm_i915_private {
 	/*
 	 * i915->gt[0] == &i915->gt0
 	 */
-#define I915_MAX_GT 4
 	struct intel_gt *gt[I915_MAX_GT];
 
 	struct kobject *sysfs_gt;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index fe947d1456d5..5edc745dcc51 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1309,8 +1309,14 @@ I915_SELFTEST_EXPORT int i915_vma_get_pages(struct i915_vma *vma)
 	return err;
 }
 
-void vma_invalidate_tlb(struct i915_address_space *vm, u32 tlb)
+void vma_invalidate_tlb(struct i915_address_space *vm, u32 *tlb)
 {
+	struct intel_gt *gt;
+	int id;
+
+	if (!tlb)
+		return;
+
 	/*
 	 * Before we release the pages that were bound by this vma, we
 	 * must invalidate all the TLBs that may still have a reference
@@ -1319,7 +1325,9 @@ void vma_invalidate_tlb(struct i915_address_space *vm, u32 tlb)
 	 * the most recent TLB invalidation seqno, and if we have not yet
 	 * flushed the TLBs upon release, perform a full invalidation.
 	 */
-	WRITE_ONCE(tlb, intel_gt_next_invalidate_tlb_full(vm->gt));
+	for_each_gt(gt, vm->i915, id)
+		WRITE_ONCE(tlb[id],
+			   intel_gt_next_invalidate_tlb_full(vm->gt));
 }
 
 static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
@@ -1955,7 +1963,7 @@ struct dma_fence *__i915_vma_evict(struct i915_vma *vma, bool async)
 
 	if (async)
 		unbind_fence = i915_vma_resource_unbind(vma_res,
-							&vma->obj->mm.tlb);
+							vma->obj->mm.tlb);
 	else
 		unbind_fence = i915_vma_resource_unbind(vma_res, NULL);
 
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 5048eed536da..33a58f605d75 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -213,7 +213,7 @@ bool i915_vma_misplaced(const struct i915_vma *vma,
 			u64 size, u64 alignment, u64 flags);
 void __i915_vma_set_map_and_fenceable(struct i915_vma *vma);
 void i915_vma_revoke_mmap(struct i915_vma *vma);
-void vma_invalidate_tlb(struct i915_address_space *vm, u32 tlb);
+void vma_invalidate_tlb(struct i915_address_space *vm, u32 *tlb);
 struct dma_fence *__i915_vma_evict(struct i915_vma *vma, bool async);
 int __i915_vma_unbind(struct i915_vma *vma);
 int __must_check i915_vma_unbind(struct i915_vma *vma);
-- 
2.36.1

