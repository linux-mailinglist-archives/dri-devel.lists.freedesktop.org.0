Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEC72C651D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92486ECD3;
	Fri, 27 Nov 2020 12:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB3B6ECC6;
 Fri, 27 Nov 2020 12:10:48 +0000 (UTC)
IronPort-SDR: RoZrsrJ6DuNInzBmuYdtDSYl0e0/58qK8vm9ysKKTCGRNhFd0VNoLnKDJtJiHyTvaLDLLXtb94
 IcjYz9NWdY1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092791"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092791"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:36 -0800
IronPort-SDR: ZLA1D2lZlES2Ok+6nxCcs2kVCvI2gUkQIl6uiYbZ6dDgAAo3CuuDpnUeU8+jcBguAJ0I8dKGXP
 jwwn2xiSrv9g==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029455"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:34 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 102/162] drm/i915/gtt/dg1: add PTE_LM plumbing for GGTT
Date: Fri, 27 Nov 2020 12:06:18 +0000
Message-Id: <20201127120718.454037-103-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on a patch from Michel Thierry.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 24 ++++++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gtt.h  |  3 ++-
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 4560e03067a7..26aa5debd7e9 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -10,6 +10,7 @@
 
 #include <drm/i915_drm.h>
 
+#include "gem/i915_gem_lmem.h"
 #include "intel_gt.h"
 #include "i915_drv.h"
 #include "i915_scatterlist.h"
@@ -180,7 +181,12 @@ static u64 gen8_ggtt_pte_encode(dma_addr_t addr,
 				enum i915_cache_level level,
 				u32 flags)
 {
-	return addr | _PAGE_PRESENT;
+	gen8_pte_t pte = addr | _PAGE_PRESENT;
+
+	if (flags & PTE_LM)
+		pte |= GEN12_GGTT_PTE_LM;
+
+	return pte;
 }
 
 static void gen8_set_pte(void __iomem *addr, gen8_pte_t pte)
@@ -192,13 +198,13 @@ static void gen8_ggtt_insert_page(struct i915_address_space *vm,
 				  dma_addr_t addr,
 				  u64 offset,
 				  enum i915_cache_level level,
-				  u32 unused)
+				  u32 flags)
 {
 	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
 	gen8_pte_t __iomem *pte =
 		(gen8_pte_t __iomem *)ggtt->gsm + offset / I915_GTT_PAGE_SIZE;
 
-	gen8_set_pte(pte, gen8_ggtt_pte_encode(addr, level, 0));
+	gen8_set_pte(pte, gen8_ggtt_pte_encode(addr, level, flags));
 
 	ggtt->invalidate(ggtt);
 }
@@ -208,7 +214,7 @@ static void gen8_ggtt_insert_entries(struct i915_address_space *vm,
 				     enum i915_cache_level level,
 				     u32 flags)
 {
-	const gen8_pte_t pte_encode = gen8_ggtt_pte_encode(0, level, 0);
+	const gen8_pte_t pte_encode = gen8_ggtt_pte_encode(0, level, flags);
 	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
 	gen8_pte_t __iomem *gte;
 	gen8_pte_t __iomem *end;
@@ -448,8 +454,10 @@ static void ggtt_bind_vma(struct i915_address_space *vm,
 
 	/* Applicable to VLV (gen8+ do not support RO in the GGTT) */
 	pte_flags = 0;
-	if (i915_gem_object_is_readonly(obj))
+	if (vma->vm->has_read_only && i915_gem_object_is_readonly(obj))
 		pte_flags |= PTE_READ_ONLY;
+	if (i915_gem_object_is_lmem(obj))
+		pte_flags |= PTE_LM;
 
 	vm->insert_entries(vm, vma, cache_level, pte_flags);
 	vma->page_sizes.gtt = I915_GTT_PAGE_SIZE;
@@ -765,6 +773,7 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 	struct drm_i915_private *i915 = ggtt->vm.i915;
 	struct pci_dev *pdev = i915->drm.pdev;
 	phys_addr_t phys_addr;
+	u32 pte_flags = 0;
 	int ret;
 
 	/* For Modern GENs the PTEs and register space are split in the BAR */
@@ -794,9 +803,12 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 		return ret;
 	}
 
+	if (i915_gem_object_is_lmem(ggtt->vm.scratch[0]))
+		pte_flags |= PTE_LM;
+
 	ggtt->vm.scratch[0]->encode =
 		ggtt->vm.pte_encode(px_dma(ggtt->vm.scratch[0]),
-				    I915_CACHE_NONE, 0);
+				    I915_CACHE_NONE, pte_flags);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index f47899ef36f4..db3626c0ee20 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -85,7 +85,8 @@ typedef u64 gen8_pte_t;
 #define BYT_PTE_SNOOPED_BY_CPU_CACHES	REG_BIT(2)
 #define BYT_PTE_WRITEABLE		REG_BIT(1)
 
-#define GEN12_PPGTT_PTE_LM (1 << 11)
+#define GEN12_GGTT_PTE_LM	(1 << 1)
+#define GEN12_PPGTT_PTE_LM	(1 << 11)
 
 /*
  * Cacheability Control is a 4-bit value. The low three bits are stored in bits
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
