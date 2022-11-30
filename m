Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6092463E5F2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 00:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FE310E512;
	Wed, 30 Nov 2022 23:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E387C10E4F1;
 Wed, 30 Nov 2022 23:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669852721; x=1701388721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w4d9R+2WWbQZ3YKWO4mh8rbn6Smq+a+m4PU/PbRULSA=;
 b=Z895rmUeqoQPVVPFulgkeLYU4F4hnjrsFtAEIE2RqledswbDDA2ocvAq
 yhUvRrxNXnOChBtDm8iO4DerZvjuVc5S6l3Drtou2BVaP7UA2SNx/OHf3
 uGcenoF0S1X2Mq8+s7wSli7FNKOj88oheN11VB4KQXdwZMr2MykikEZBr
 NwLkO8ZYWA6IMt4K1WbPR6r7N24a+5JjzHmFNLqKlIZ/v7qyVT4KlPXVA
 KeotrsIZixox3MLsdComaNJ0prBdn8OpdqxTVU0qQF+mGYbTN+EkoN1QP
 7JO6Avfoq6qljbQiOq7AST2fXTa4aPWUn2J/y33j8psNVFXnCgyWzhywR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="313168877"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="313168877"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 15:58:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="750560926"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="750560926"
Received: from freibold-ivm1.ger.corp.intel.com (HELO intel.com)
 ([10.252.52.161])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 15:58:37 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/5] drm/i915: Refine VT-d scanout workaround
Date: Thu,  1 Dec 2022 00:58:04 +0100
Message-Id: <20221130235805.221010-5-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130235805.221010-1-andi.shyti@linux.intel.com>
References: <20221130235805.221010-1-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Shawn Lee <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

VT-d may cause overfetch of the scanout PTE, both before and after the
vma (depending on the scanout orientation). bspec recommends that we
provide a tile-row in either directions, and suggests using 168 PTE,
warning that the accesses will wrap around the ends of the GGTT.
Currently, we fill the entire GGTT with scratch pages when using VT-d to
always ensure there are valid entries around every vma, including
scanout. However, writing every PTE is slow as on recent devices we
perform 8MiB of uncached writes, incurring an extra 100ms during resume.

If instead we focus on only putting guard pages around scanout, we can
avoid touching the whole GGTT. To avoid having to introduce extra nodes
around each scanout vma, we adjust the scanout drm_mm_node to be smaller
than the allocated space, and fixup the extra PTE during dma binding.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 13 +++++++++++
 drivers/gpu/drm/i915/gt/intel_ggtt.c       | 25 +---------------------
 2 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 850776a783ac7..9969e687ad857 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -17,6 +17,8 @@
 #include "i915_gem_object.h"
 #include "i915_vma.h"
 
+#define VTD_GUARD (168u * I915_GTT_PAGE_SIZE) /* 168 or tile-row PTE padding */
+
 static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
@@ -424,6 +426,17 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 	if (ret)
 		return ERR_PTR(ret);
 
+	/* VT-d may overfetch before/after the vma, so pad with scratch */
+	if (intel_scanout_needs_vtd_wa(i915)) {
+		unsigned int guard = VTD_GUARD;
+
+		if (i915_gem_object_is_tiled(obj))
+			guard = max(guard,
+				    i915_gem_object_get_tile_row_size(obj));
+
+		flags |= PIN_OFFSET_GUARD | guard;
+	}
+
 	/*
 	 * As the user may map the buffer once pinned in the display plane
 	 * (e.g. libkms for the bootup splash), we have to ensure that we
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 784d4a8c43ba9..fa96d925c2596 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -376,27 +376,6 @@ static void nop_clear_range(struct i915_address_space *vm,
 {
 }
 
-static void gen8_ggtt_clear_range(struct i915_address_space *vm,
-				  u64 start, u64 length)
-{
-	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
-	unsigned int first_entry = start / I915_GTT_PAGE_SIZE;
-	unsigned int num_entries = length / I915_GTT_PAGE_SIZE;
-	const gen8_pte_t scratch_pte = vm->scratch[0]->encode;
-	gen8_pte_t __iomem *gtt_base =
-		(gen8_pte_t __iomem *)ggtt->gsm + first_entry;
-	const int max_entries = ggtt_total_entries(ggtt) - first_entry;
-	int i;
-
-	if (WARN(num_entries > max_entries,
-		 "First entry = %d; Num entries = %d (max=%d)\n",
-		 first_entry, num_entries, max_entries))
-		num_entries = max_entries;
-
-	for (i = 0; i < num_entries; i++)
-		gen8_set_pte(&gtt_base[i], scratch_pte);
-}
-
 static void bxt_vtd_ggtt_wa(struct i915_address_space *vm)
 {
 	/*
@@ -968,8 +947,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 	ggtt->vm.cleanup = gen6_gmch_remove;
 	ggtt->vm.insert_page = gen8_ggtt_insert_page;
 	ggtt->vm.clear_range = nop_clear_range;
-	if (intel_scanout_needs_vtd_wa(i915))
-		ggtt->vm.clear_range = gen8_ggtt_clear_range;
 
 	ggtt->vm.insert_entries = gen8_ggtt_insert_entries;
 
@@ -1128,7 +1105,7 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
 	ggtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
 	ggtt->vm.clear_range = nop_clear_range;
-	if (!HAS_FULL_PPGTT(i915) || intel_scanout_needs_vtd_wa(i915))
+	if (!HAS_FULL_PPGTT(i915))
 		ggtt->vm.clear_range = gen6_ggtt_clear_range;
 	ggtt->vm.insert_page = gen6_ggtt_insert_page;
 	ggtt->vm.insert_entries = gen6_ggtt_insert_entries;
-- 
2.38.1

