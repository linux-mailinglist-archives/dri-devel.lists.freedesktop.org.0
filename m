Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DA146EFDD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDA810E72F;
	Thu,  9 Dec 2021 16:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2832C89179;
 Thu,  9 Dec 2021 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639064792; x=1670600792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZjZKL71fdV+1+E/ZvT8ZQXILUKWicxMJ0ws1f3obak=;
 b=WXkaDvTjiS0i+aFonIZ8j+RMls1lgJnqP0I0asny95ZFOBNaxqQzVBAq
 r3Hfa/iXjxsH5ab31AtMNWqRpu1PNpOUI9DhLaQKvlWjvxoa/prLwEdxg
 xmNZWL7DIXNl14+gX5lk0jxOVuoSmUf9LYoOMB/LKY6AHBo8X8358g5Vk
 fy58JtEhXySGQgNzdtiq7iD7aquyvU2ZO30YO02Htpp80Pddwqz0/kCox
 5yjD13x7iF9UMMZbekiiWMtTFbaIxhckrI77tHu/MorXj0LSqNI6CAX4f
 sM7JJcYibVfUUuIn3bKP8Cjkr6Iy0k5F9jE8HFPb47ZExzAqSABQmUBSc g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298917021"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="298917021"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503535210"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:14 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 09/16] drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
Date: Thu,  9 Dec 2021 21:15:26 +0530
Message-Id: <20211209154533.4084-10-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209154533.4084-1-ramalingam.c@intel.com>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
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
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
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
index 5db11d8f7c7a..b6e9bfecb023 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -728,13 +728,56 @@ static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
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
@@ -937,7 +980,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
 
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

