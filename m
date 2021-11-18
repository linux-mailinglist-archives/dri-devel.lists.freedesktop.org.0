Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D845648E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 21:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B946E3B7;
	Thu, 18 Nov 2021 20:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D422D6E2B6;
 Thu, 18 Nov 2021 20:54:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="215005338"
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; d="scan'208";a="215005338"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 12:54:38 -0800
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; d="scan'208";a="605325068"
Received: from aclausch-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.48.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 12:54:37 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5] drm/i915: Re-use i915 macros for checking PTEs
Date: Thu, 18 Nov 2021 12:54:32 -0800
Message-Id: <20211118205432.579910-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118205432.579910-1-michael.cheng@intel.com>
References: <20211118205432.579910-1-michael.cheng@intel.com>
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
Cc: anusha.srivatsa@intel.com, michael.cheng@intel.com, wayne.boyer@intel.com,
 jani.nikula@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, siva.mullati@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Certain gen8 ppgtt/gtt functions are using _PAGE_RW and _PAGE_PRESENT to check
bits 0 and 1 for PTEs. These macros are defined per architectures, and some
architectures do not have these defined (like arm64). This patch replaces these
two macros with their i915 equivalent implementation.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c |  6 +++---
 drivers/gpu/drm/i915/gt/intel_ggtt.c |  2 +-
 drivers/gpu/drm/i915/gvt/gtt.c       | 12 ++++++------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 9966e9dc5218..cc484cc6c26f 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -18,7 +18,7 @@
 static u64 gen8_pde_encode(const dma_addr_t addr,
 			   const enum i915_cache_level level)
 {
-	u64 pde = addr | _PAGE_PRESENT | _PAGE_RW;
+	u64 pde = addr | GEN6_PTE_VALID | BYT_PTE_WRITEABLE;
 
 	if (level != I915_CACHE_NONE)
 		pde |= PPAT_CACHED_PDE;
@@ -32,10 +32,10 @@ static u64 gen8_pte_encode(dma_addr_t addr,
 			   enum i915_cache_level level,
 			   u32 flags)
 {
-	gen8_pte_t pte = addr | _PAGE_PRESENT | _PAGE_RW;
+	gen8_pte_t pte = addr | GEN6_PTE_VALID | BYT_PTE_WRITEABLE;
 
 	if (unlikely(flags & PTE_READ_ONLY))
-		pte &= ~_PAGE_RW;
+		pte &= ~BYT_PTE_WRITEABLE;
 
 	if (flags & PTE_LM)
 		pte |= GEN12_PPGTT_PTE_LM;
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 555111c3bee5..76495deaddc2 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -209,7 +209,7 @@ u64 gen8_ggtt_pte_encode(dma_addr_t addr,
 			 enum i915_cache_level level,
 			 u32 flags)
 {
-	gen8_pte_t pte = addr | _PAGE_PRESENT;
+	gen8_pte_t pte = addr | GEN6_PTE_VALID;
 
 	if (flags & PTE_LM)
 		pte |= GEN12_GGTT_PTE_LM;
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 53d0cb327539..e481b639ba0a 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -446,17 +446,17 @@ static bool gen8_gtt_test_present(struct intel_gvt_gtt_entry *e)
 			|| e->type == GTT_TYPE_PPGTT_ROOT_L4_ENTRY)
 		return (e->val64 != 0);
 	else
-		return (e->val64 & _PAGE_PRESENT);
+		return (e->val64 & GEN6_PTE_VALID);
 }
 
 static void gtt_entry_clear_present(struct intel_gvt_gtt_entry *e)
 {
-	e->val64 &= ~_PAGE_PRESENT;
+	e->val64 &= ~GEN6_PTE_VALID;
 }
 
 static void gtt_entry_set_present(struct intel_gvt_gtt_entry *e)
 {
-	e->val64 |= _PAGE_PRESENT;
+	e->val64 |= GEN6_PTE_VALID;
 }
 
 static bool gen8_gtt_test_64k_splited(struct intel_gvt_gtt_entry *e)
@@ -2439,7 +2439,7 @@ static int alloc_scratch_pages(struct intel_vgpu *vgpu,
 		/* The entry parameters like present/writeable/cache type
 		 * set to the same as i915's scratch page tree.
 		 */
-		se.val64 |= _PAGE_PRESENT | _PAGE_RW;
+		se.val64 |= GEN6_PTE_VALID | BYT_PTE_WRITEABLE;
 		if (type == GTT_TYPE_PPGTT_PDE_PT)
 			se.val64 |= PPAT_CACHED;
 
@@ -2896,7 +2896,7 @@ void intel_gvt_restore_ggtt(struct intel_gvt *gvt)
 		offset = vgpu_aperture_gmadr_base(vgpu) >> PAGE_SHIFT;
 		for (idx = 0; idx < num_low; idx++) {
 			pte = mm->ggtt_mm.host_ggtt_aperture[idx];
-			if (pte & _PAGE_PRESENT)
+			if (pte & GEN6_PTE_VALID)
 				write_pte64(vgpu->gvt->gt->ggtt, offset + idx, pte);
 		}
 
@@ -2904,7 +2904,7 @@ void intel_gvt_restore_ggtt(struct intel_gvt *gvt)
 		offset = vgpu_hidden_gmadr_base(vgpu) >> PAGE_SHIFT;
 		for (idx = 0; idx < num_hi; idx++) {
 			pte = mm->ggtt_mm.host_ggtt_hidden[idx];
-			if (pte & _PAGE_PRESENT)
+			if (pte & GEN6_PTE_VALID)
 				write_pte64(vgpu->gvt->gt->ggtt, offset + idx, pte);
 		}
 	}
-- 
2.25.1

