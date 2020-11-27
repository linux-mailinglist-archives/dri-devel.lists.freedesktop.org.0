Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BA12C652E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7B36ECD5;
	Fri, 27 Nov 2020 12:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB6C6ECC6;
 Fri, 27 Nov 2020 12:10:47 +0000 (UTC)
IronPort-SDR: HGxpSpwHM34dJjWe8PyYn8y3bc/vEKGJI0+hqik4QIc2QDVnBtFdP7hxVE2wLD0zsRJ6QTzwYb
 gMfJ5NhsIzFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092788"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092788"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:34 -0800
IronPort-SDR: QxGEm1LV/I2MhDPSenSfOO17NjeRvZ1k16Se4YIapdUKjJGbepV8tM1ioj2qlpYdcuv7LL2KDc
 fLh13ISHp/Pw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029445"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:31 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 101/162] drm/i915/gtt/dg1: add PTE_LM plumbing for PPGTT
Date: Fri, 27 Nov 2020 12:06:17 +0000
Message-Id: <20201127120718.454037-102-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the PTEs we get an LM bit, to signal whether the page resides in
SMEM or LMEM.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c  | 35 ++++++++++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gtt.h   |  3 +++
 drivers/gpu/drm/i915/gt/intel_ppgtt.c |  4 +++
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index e2f1dfc48d43..b6fcebeef02a 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -5,6 +5,7 @@
 
 #include <linux/log2.h>
 
+#include "gem/i915_gem_lmem.h"
 #include "gen8_ppgtt.h"
 #include "i915_scatterlist.h"
 #include "i915_trace.h"
@@ -50,6 +51,21 @@ static u64 gen8_pte_encode(dma_addr_t addr,
 	return pte;
 }
 
+static u64 gen12_pte_encode(dma_addr_t addr,
+			    enum i915_cache_level level,
+			    u32 flags)
+{
+	gen8_pte_t pte = addr | _PAGE_PRESENT | _PAGE_RW;
+
+	if (unlikely(flags & PTE_READ_ONLY))
+		pte &= ~_PAGE_RW;
+
+	if (flags & PTE_LM)
+		pte |= GEN12_PPGTT_PTE_LM;
+
+	return pte;
+}
+
 static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool create)
 {
 	struct drm_i915_private *i915 = ppgtt->vm.i915;
@@ -365,7 +381,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 		      u32 flags)
 {
 	struct i915_page_directory *pd;
-	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
+	const gen8_pte_t pte_encode = ppgtt->vm.pte_encode(0, cache_level, flags);
 	gen8_pte_t *vaddr;
 	bool needs_flush;
 
@@ -413,7 +429,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 				   enum i915_cache_level cache_level,
 				   u32 flags)
 {
-	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
+	const gen8_pte_t pte_encode = vma->vm->pte_encode(0, cache_level, flags);
 	unsigned int rem = sg_dma_len(iter->sg);
 	u64 start = vma->node.start;
 	bool needs_flush;
@@ -558,6 +574,7 @@ static void gen8_ppgtt_insert(struct i915_address_space *vm,
 
 static int gen8_init_scratch(struct i915_address_space *vm)
 {
+	u32 pte_flags = vm->has_read_only;
 	int ret;
 	int i;
 
@@ -581,9 +598,12 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 	if (ret)
 		return ret;
 
+	if (i915_gem_object_is_lmem(vm->scratch[0]))
+		pte_flags |= PTE_LM;
+
 	vm->scratch[0]->encode =
-		gen8_pte_encode(px_dma(vm->scratch[0]),
-				I915_CACHE_LLC, vm->has_read_only);
+		vm->pte_encode(px_dma(vm->scratch[0]),
+			       I915_CACHE_LLC, pte_flags);
 
 	for (i = 1; i <= vm->top; i++) {
 		struct drm_i915_gem_object *obj;
@@ -713,6 +733,11 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
 	else
 		ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
 
+	if (INTEL_GEN(gt->i915) >= 12)
+		ppgtt->vm.pte_encode = gen12_pte_encode;
+	else
+		ppgtt->vm.pte_encode = gen8_pte_encode;
+
 	err = gen8_init_scratch(&ppgtt->vm);
 	if (err)
 		goto err_free;
@@ -734,8 +759,6 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
 	ppgtt->vm.allocate_va_range = gen8_ppgtt_alloc;
 	ppgtt->vm.clear_range = gen8_ppgtt_clear;
 
-	ppgtt->vm.pte_encode = gen8_pte_encode;
-
 	if (intel_vgpu_active(gt->i915))
 		gen8_ppgtt_notify_vgt(ppgtt, true);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index d96bd19d1b47..f47899ef36f4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -85,6 +85,8 @@ typedef u64 gen8_pte_t;
 #define BYT_PTE_SNOOPED_BY_CPU_CACHES	REG_BIT(2)
 #define BYT_PTE_WRITEABLE		REG_BIT(1)
 
+#define GEN12_PPGTT_PTE_LM (1 << 11)
+
 /*
  * Cacheability Control is a 4-bit value. The low three bits are stored in bits
  * 3:1 of the PTE, while the fourth bit is stored in bit 11 of the PTE.
@@ -268,6 +270,7 @@ struct i915_address_space {
 			  enum i915_cache_level level,
 			  u32 flags); /* Create a valid PTE */
 #define PTE_READ_ONLY	BIT(0)
+#define PTE_LM          BIT(1)
 
 	void (*allocate_va_range)(struct i915_address_space *vm,
 				  struct i915_vm_pt_stash *stash,
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 2d74ae950e4b..731d8730fa5f 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -7,6 +7,8 @@
 
 #include "i915_trace.h"
 #include "intel_gtt.h"
+#include "gem/i915_gem_lmem.h"
+#include "gem/i915_gem_region.h"
 #include "gen6_ppgtt.h"
 #include "gen8_ppgtt.h"
 
@@ -193,6 +195,8 @@ void ppgtt_bind_vma(struct i915_address_space *vm,
 	pte_flags = 0;
 	if (i915_gem_object_is_readonly(vma->obj))
 		pte_flags |= PTE_READ_ONLY;
+	if (i915_gem_object_is_lmem(vma->obj))
+		pte_flags |= PTE_LM;
 
 	vm->insert_entries(vm, vma, cache_level, pte_flags);
 	wmb();
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
