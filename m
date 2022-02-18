Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF04BBFE1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AA210E8D5;
	Fri, 18 Feb 2022 18:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEAE10E8C8;
 Fri, 18 Feb 2022 18:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645210087; x=1676746087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mbuRJ0e7nK525gI4ZD7nkJZtF2bVkOJgOdvwDTzxYXI=;
 b=SwyjGoX/Q/FWFjFg9Pca40vGec6zEqEBwoHb8BTrhP+1GHKnQwRhglcg
 MoRTmOOv0wUx6D72XwEDjKBrZkQ7/QA/GWoj9MkhR379Yy7wgPnv+9rIy
 GJFYXAyI8zL4ykQIwf4HYGVvCoXP/JAVfUxgS9ODuXw9SgjagC4t4pTMI
 amOUnbeHpcPW7gD+R1o79YvOdEbxxB5Y2b/7BOunVtBFep2V5K+Ee5U9S
 uhi5/TTyH6DxlXcUmIB1vRm68gxyp8aLVZpmn5+ojRBuRwTo+AgNPtt+F
 oBUZyrHqR1TjkpswU4Uyx9kFIgAR6jB5knn2RjypbYeNbo1UBmugMZnIe g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238593008"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238593008"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:48:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="489642292"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:48:05 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/15] drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
Date: Sat, 19 Feb 2022 00:17:47 +0530
Message-Id: <20220218184752.7524-11-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220218184752.7524-1-ramalingam.c@intel.com>
References: <20220218184752.7524-1-ramalingam.c@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 lucas.demarchi@intel.com, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

If this is LMEM then we get a 32 entry PT, with each PTE pointing to
some 64K block of memory, otherwise it's just the usual 512 entry PT.
This very much assumes the caller knows what they are doing.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 50 ++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 62471730266c..f574da00eff1 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -715,13 +715,56 @@ static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
 		gen8_pdp_for_page_index(vm, idx);
 	struct i915_page_directory *pd =
 		i915_pd_entry(pdp, gen8_pd_index(idx, 2));
+	struct i915_page_table *pt = i915_pt_entry(pd, gen8_pd_index(idx, 1));
 	gen8_pte_t *vaddr;
 
-	vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
+	GEM_BUG_ON(pt->is_compact);
+
+	vaddr = px_vaddr(pt);
 	vaddr[gen8_pd_index(idx, 0)] = gen8_pte_encode(addr, level, flags);
 	clflush_cache_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
 }
 
+static void __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,
+					    dma_addr_t addr,
+					    u64 offset,
+					    enum i915_cache_level level,
+					    u32 flags)
+{
+	u64 idx = offset >> GEN8_PTE_SHIFT;
+	struct i915_page_directory * const pdp =
+		gen8_pdp_for_page_index(vm, idx);
+	struct i915_page_directory *pd =
+		i915_pd_entry(pdp, gen8_pd_index(idx, 2));
+	struct i915_page_table *pt = i915_pt_entry(pd, gen8_pd_index(idx, 1));
+	gen8_pte_t *vaddr;
+
+	GEM_BUG_ON(!IS_ALIGNED(addr, SZ_64K));
+	GEM_BUG_ON(!IS_ALIGNED(offset, SZ_64K));
+
+	if (!pt->is_compact) {
+		vaddr = px_vaddr(pd);
+		vaddr[gen8_pd_index(idx, 1)] |= GEN12_PDE_64K;
+		pt->is_compact = true;
+	}
+
+	vaddr = px_vaddr(pt);
+	vaddr[gen8_pd_index(idx, 0) / 16] = gen8_pte_encode(addr, level, flags);
+}
+
+static void xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,
+				       dma_addr_t addr,
+				       u64 offset,
+				       enum i915_cache_level level,
+				       u32 flags)
+{
+	if (flags & PTE_LM)
+		return __xehpsdv_ppgtt_insert_entry_lm(vm, addr, offset,
+						       level, flags);
+
+	return gen8_ppgtt_insert_entry(vm, addr, offset, level, flags);
+}
+
 static int gen8_init_scratch(struct i915_address_space *vm)
 {
 	u32 pte_flags;
@@ -921,7 +964,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
 
 	ppgtt->vm.bind_async_flags = I915_VMA_LOCAL_BIND;
 	ppgtt->vm.insert_entries = gen8_ppgtt_insert;
-	ppgtt->vm.insert_page = gen8_ppgtt_insert_entry;
+	if (HAS_64K_PAGES(gt->i915))
+		ppgtt->vm.insert_page = xehpsdv_ppgtt_insert_entry;
+	else
+		ppgtt->vm.insert_page = gen8_ppgtt_insert_entry;
 	ppgtt->vm.allocate_va_range = gen8_ppgtt_alloc;
 	ppgtt->vm.clear_range = gen8_ppgtt_clear;
 	ppgtt->vm.foreach = gen8_ppgtt_foreach;
-- 
2.20.1

