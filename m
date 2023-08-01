Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B0E76B730
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 16:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6E010E407;
	Tue,  1 Aug 2023 14:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE3F10E406;
 Tue,  1 Aug 2023 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690899626; x=1722435626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0pAzvwUDC5+4GsXyKCFQxy37bTStipjnbj8D7IKr+bo=;
 b=UCyZHdB2ZcW/uT3Mbuqvqy59SBAHU852dScTIoHDR8cgNIMjN5/4qimV
 bS3L6dj9SchxasAio9oEjXNEemUPEuifE2mB29LOH6iShX3f5VK6970Kw
 Mi1eJk7Ibc1oDxgzrmUaBZ3vPinjTK7Lkb2ykG4ZGUCmniVOAxVCG8JAs
 X4QIl8BvpH9IouTLG8IJVaWof79ZKqialNtngzUeD6p/puqxfTcBZRT2N
 gT7pwyInLANM+4OZSz9+syKaNFUTWVvXVwhKdRuPejSsHCp6nl6cXleZr
 5wc202HA9eha8IWGmW0dzbjPOUhrwjOCX8TS6BbDD7Z/BipLoyGx9NIHE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="372023408"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="372023408"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="678687267"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="678687267"
Received: from jhajducz-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.37.77])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:20:23 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH 3/4] drm/i915: Invalidate the TLBs on each GT
Date: Tue,  1 Aug 2023 16:19:54 +0200
Message-Id: <20230801141955.383305-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230801141955.383305-1-andi.shyti@linux.intel.com>
References: <20230801141955.383305-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

With multi-GT devices, the object may have been bound on each GT.
Invalidate the TLBs across all GT before releasing the pages
back to the system.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  4 +++-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c        | 13 ++++++++-----
 drivers/gpu/drm/i915/gt/intel_ppgtt.c            |  4 ++--
 drivers/gpu/drm/i915/i915_vma.c                  | 14 +++++++++++---
 4 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 3de7db70f4edb..2292404007c81 100644
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
@@ -675,7 +677,7 @@ struct drm_i915_gem_object {
 		 */
 		bool dirty:1;
 
-		u32 tlb;
+		u32 tlb[I915_MAX_GT];
 	} mm;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 83852f7da1ac5..eae40e8f52ed8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -193,13 +193,16 @@ static void unmap_object(struct drm_i915_gem_object *obj, void *ptr)
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
+			return;
 
-	intel_gt_invalidate_tlb_full(gt, obj->mm.tlb);
-	obj->mm.tlb = 0;
+		intel_gt_invalidate_tlb_full(gt, obj->mm.tlb[id]);
+		obj->mm.tlb[id] = 0;
+	}
 }
 
 struct sg_table *
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 436756bfbb1a4..d07a4f97b9434 100644
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
-		vma_invalidate_tlb(vm, vma_res->tlb);
+	vma_invalidate_tlb(vm, vma_res->tlb);
 }
 
 static unsigned long pd_count(u64 size, int shift)
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 1dae22bc8176a..e52089564d792 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1340,6 +1340,12 @@ I915_SELFTEST_EXPORT int i915_vma_get_pages(struct i915_vma *vma)
 
 void vma_invalidate_tlb(struct i915_address_space *vm, u32 *tlb)
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
@@ -1348,7 +1354,9 @@ void vma_invalidate_tlb(struct i915_address_space *vm, u32 *tlb)
 	 * the most recent TLB invalidation seqno, and if we have not yet
 	 * flushed the TLBs upon release, perform a full invalidation.
 	 */
-	WRITE_ONCE(*tlb, intel_gt_next_invalidate_tlb_full(vm->gt));
+	for_each_gt(gt, vm->i915, id)
+		WRITE_ONCE(tlb[id],
+			   intel_gt_next_invalidate_tlb_full(vm->gt));
 }
 
 static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
@@ -2015,7 +2023,7 @@ struct dma_fence *__i915_vma_evict(struct i915_vma *vma, bool async)
 
 	if (async)
 		unbind_fence = i915_vma_resource_unbind(vma_res,
-							&vma->obj->mm.tlb);
+							vma->obj->mm.tlb);
 	else
 		unbind_fence = i915_vma_resource_unbind(vma_res, NULL);
 
@@ -2032,7 +2040,7 @@ struct dma_fence *__i915_vma_evict(struct i915_vma *vma, bool async)
 			dma_fence_put(unbind_fence);
 			unbind_fence = NULL;
 		}
-		vma_invalidate_tlb(vma->vm, &vma->obj->mm.tlb);
+		vma_invalidate_tlb(vma->vm, vma->obj->mm.tlb);
 	}
 
 	/*
-- 
2.40.1

