Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 074F84D80A8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 12:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06AB10E5F9;
	Mon, 14 Mar 2022 11:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AFD10E614;
 Mon, 14 Mar 2022 11:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647257350; x=1678793350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7+3hGW2SIaFdMSq0P5WtUyUyzYDLuO2CneEgF1eF48E=;
 b=en5zeF5rgAaXcOA8svubcVmtJi8JcZ08t9iqYbO1NQTpOVHqe84ulYiu
 njzZzwqvxvPclRjTM17h8HyaUJPyIj53cuz0ztjtPJvyE6NHi5e2e9BZY
 TXtV+S7+/T3w2eFpNUf6y3iQidR20wGpAc5pog2i+AhmKZpfF0u36iMTT
 x5NnN0XtZhv9TU9W2lWtfNHw+jl0P+lOnXGrlqkPSlyBpWbKhL13fD+CK
 Qh8RciDR23x9siXPYikGyxG4doEqA940JPmnrR0j+BXIBvp8WqJlqhpWb
 HQlf4NqJzmLheYQ/9sLMR+V/V0f9WUHcHq6YvqZFL2DK4O9tda7piEZW+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="243448271"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="243448271"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 04:29:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="556374370"
Received: from znagyx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.7.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 04:29:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/i915: fixup the initial fb base on DGFX
Date: Mon, 14 Mar 2022 11:28:37 +0000
Message-Id: <20220314112837.352931-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314112837.352931-1-matthew.auld@intel.com>
References: <20220314112837.352931-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On integrated it looks like the GGTT base should always 1:1 maps to
somewhere within DSM. On discrete the base seems to be pre-programmed with
a normal lmem address, and is not 1:1 mapped with the base address. On
such devices probe the lmem address directly from the PTE.

v2(Ville):
  - The base is actually the pre-programmed GGTT address, which is then
    meant to 1:1 map to somewhere inside dsm. In the case of dgpu the
    base looks to just be some offset within lmem, but this also happens
    to be the exact dsm start, on dg1. Therefore we should only need to
    fudge the physical address, before allocating from stolen.
  - Bail if it's not located in dsm.
v3:
  - Scratch that. There doesn't seem to be any relationship with the
    base and PTE address, on at least DG1. Let's instead just grab the
    lmem address from the PTE itself.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 .../drm/i915/display/intel_plane_initial.c    | 50 ++++++++++++++++---
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index f797fcef18fc..7979929bb632 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -47,17 +47,55 @@ static struct i915_vma *
 initial_plane_vma(struct drm_i915_private *i915,
 		  struct intel_initial_plane_config *plane_config)
 {
-	struct intel_memory_region *mem = i915->mm.stolen_region;
+	struct intel_memory_region *mem;
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
+	resource_size_t phys_base;
 	u32 base, size;
 	u64 pinctl;
 
-	if (!mem || plane_config->size == 0)
+	if (plane_config->size == 0)
+		return NULL;
+
+	base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
+	if (IS_DGFX(i915)) {
+		gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
+		gen8_pte_t pte;
+
+		gte += base / I915_GTT_PAGE_SIZE;
+
+		pte = ioread64(gte);
+		if (!(pte & GEN12_GGTT_PTE_LM)) {
+			drm_err(&i915->drm,
+				"Initial plane programming missing PTE_LM bit\n");
+			return NULL;
+		}
+
+		phys_base = pte & I915_GTT_PAGE_MASK;
+		mem = i915->mm.regions[INTEL_REGION_LMEM];
+
+		/*
+		 * We don't currently expect this to ever be placed in the
+		 * stolen portion.
+		 */
+		if (phys_base >= resource_size(&mem->region)) {
+			drm_err(&i915->drm,
+				"Initial plane programming using invalid range, phys_base=%pa\n",
+				&phys_base);
+			return NULL;
+		}
+
+		drm_dbg(&i915->drm,
+			"Using phys_base=%pa, based on initial plane programming\n",
+			&phys_base);
+	} else {
+		phys_base = base;
+		mem = i915->mm.stolen_region;
+	}
+
+	if (!mem)
 		return NULL;
 
-	base = round_down(plane_config->base,
-			  I915_GTT_MIN_ALIGNMENT);
 	size = round_up(plane_config->base + plane_config->size,
 			mem->min_page_size);
 	size -= base;
@@ -68,11 +106,11 @@ initial_plane_vma(struct drm_i915_private *i915,
 	 * features.
 	 */
 	if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
+	    mem == i915->mm.stolen_region &&
 	    size * 2 > i915->stolen_usable_size)
 		return NULL;
 
-	obj = i915_gem_object_create_region_at(i915->mm.stolen_region,
-					       base, size, 0);
+	obj = i915_gem_object_create_region_at(mem, phys_base, size, 0);
 	if (IS_ERR(obj))
 		return NULL;
 
-- 
2.34.1

