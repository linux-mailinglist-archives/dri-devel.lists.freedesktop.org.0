Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5764F5BA1E7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 22:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE5310EBD3;
	Thu, 15 Sep 2022 20:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E7410E2C2;
 Thu, 15 Sep 2022 20:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663274381; x=1694810381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2DVYhX3e2bfnrRQmWRHUHBqpal/MpqOQK0IkCx5DnCs=;
 b=Kx8H95tY595m/FWjHA74SmHuMnP2n5tgabey7FF5YTSCBBS0SMhsPb9+
 RDiiDv2fedNWJ8Bo6+SXsg2cvDDIJDv7wYXd8c5j8X3Kbo4bSOKD8Mn5Q
 kOgCy8EsktOeiTrLsnrUbnBzZTT628ZescInHGizld+1zDpE9HTXSlMg+
 J3mHhjB5sRR3yTQZHaWayO2C8cPKGjfiJNPzko560Dz9JtDjwC3uZUuo2
 hoVlgqSUEzg4I1IOn4sZcprct+3N9rb8JVe/uQ9cRnMWi8RBL1ScKBmUx
 XG+51CloRiPfsmlDgluPOkyNp3QCAvoR4y8st4JIWLmNDVPPSIl6zEBQj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="300193625"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="300193625"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 13:39:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="647991382"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 13:39:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 3/4] drm/i915: Split i915_gem_init_stolen()
Date: Thu, 15 Sep 2022 13:39:07 -0700
Message-Id: <20220915-stolen-v1-3-117c5f295bb2@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
References: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-bbe61
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
Cc: tejas.upadhyay@intel.com, aravind.iddamsetty@intel.com,
 dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some helpers: adjust_stolen(), request_smem_stolen_() and
init_reserved_stolen() that are now called by i915_gem_init_stolen() to
initialize each part of the Data Stolen Memory region. Main goal is to
split the reserved part, also known as WOPCM, as its calculation changes
often per platform.

This also fixes a bug in graphics version < 5 (in theory, not tested,
due to no machine available): it would bail out on stolen creation due
to "Stolen reserved area outside stolen memory". Other than that, no
change in behavior.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index c34065fe2ecc..0e57a6d81534 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -77,22 +77,26 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
 	mutex_unlock(&i915->mm.stolen_lock);
 }
 
-static int i915_adjust_stolen(struct drm_i915_private *i915,
-			      struct resource *dsm)
+static bool valid_stolen_size(struct resource *dsm)
+{
+	return dsm->start != 0 && dsm->end > dsm->start;
+}
+
+static int adjust_stolen(struct drm_i915_private *i915,
+			 struct resource *dsm)
 {
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
-	struct resource *r;
 
-	if (dsm->start == 0 || dsm->end <= dsm->start)
+	if (!valid_stolen_size(dsm))
 		return -EINVAL;
 
 	/*
+	 * Make sure we don't clobber the GTT if it's within stolen memory
+	 *
 	 * TODO: We have yet too encounter the case where the GTT wasn't at the
 	 * end of stolen. With that assumption we could simplify this.
 	 */
-
-	/* Make sure we don't clobber the GTT if it's within stolen memory */
 	if (GRAPHICS_VER(i915) <= 4 &&
 	    !IS_G33(i915) && !IS_PINEVIEW(i915) && !IS_G4X(i915)) {
 		struct resource stolen[2] = {*dsm, *dsm};
@@ -131,10 +135,20 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
 		}
 	}
 
+	if (!valid_stolen_size(dsm))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int request_smem_stolen(struct drm_i915_private *i915,
+			       struct resource *dsm)
+{
+	struct resource *r;
+
 	/*
-	 * With stolen lmem, we don't need to check if the address range
-	 * overlaps with the non-stolen system memory range, since lmem is local
-	 * to the gpu.
+	 * With stolen lmem, we don't need to request if the address range
+	 * since lmem is local to the gpu.
 	 */
 	if (HAS_LMEM(i915))
 		return 0;
@@ -392,39 +406,22 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
 	}
 }
 
-static int i915_gem_init_stolen(struct intel_memory_region *mem)
+/*
+ * Initialize i915->dsm_reserved to contain the reserved space within the Data
+ * Stolen Memory. This is a range on the top of DSM that is reserved, not to
+ * be used by driver, so must be excluded from the region passed to the
+ * allocator later. In the spec this is also called as WOPCM.
+ *
+ * Our expectation is that the reserved space is at the top of the stolen
+ * region, as it has been the case for every platform, and *never* at the
+ * bottom, so the calculation here can be simplified.
+ */
+static int init_reserved_stolen(struct drm_i915_private *i915)
 {
-	struct drm_i915_private *i915 = mem->i915;
 	struct intel_uncore *uncore = &i915->uncore;
 	resource_size_t reserved_base, stolen_top;
-	resource_size_t reserved_total, reserved_size;
-
-	mutex_init(&i915->mm.stolen_lock);
-
-	if (intel_vgpu_active(i915)) {
-		drm_notice(&i915->drm,
-			   "%s, disabling use of stolen memory\n",
-			   "iGVT-g active");
-		return 0;
-	}
-
-	if (i915_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
-		drm_notice(&i915->drm,
-			   "%s, disabling use of stolen memory\n",
-			   "DMAR active");
-		return 0;
-	}
-
-	if (resource_size(&mem->region) == 0)
-		return 0;
-
-	if (i915_adjust_stolen(i915, &mem->region))
-		return 0;
-
-	GEM_BUG_ON(i915->dsm.start == 0);
-	GEM_BUG_ON(i915->dsm.end <= i915->dsm.start);
-
-	i915->dsm = mem->region;
+	resource_size_t reserved_size;
+	int ret = 0;
 
 	stolen_top = i915->dsm.end + 1;
 	reserved_base = stolen_top;
@@ -453,19 +450,17 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 	} else if (GRAPHICS_VER(i915) >= 5 || IS_G4X(i915)) {
 		g4x_get_stolen_reserved(i915, uncore,
 					&reserved_base, &reserved_size);
+	} else {
+		/* No reserved region */
+		goto bail_out;
 	}
 
-	/*
-	 * Our expectation is that the reserved space is at the top of the
-	 * stolen region and *never* at the bottom. If we see !reserved_base,
-	 * it likely means we failed to read the registers correctly.
-	 */
-	if (!reserved_base) {
+	if (!reserved_base || reserved_base == stolen_top) {
 		drm_err(&i915->drm,
 			"inconsistent reservation %pa + %pa; ignoring\n",
 			&reserved_base, &reserved_size);
-		reserved_base = stolen_top;
-		reserved_size = 0;
+		ret = -EINVAL;
+		goto bail_out;
 	}
 
 	i915->dsm_reserved =
@@ -475,19 +470,55 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 		drm_err(&i915->drm,
 			"Stolen reserved area %pR outside stolen memory %pR\n",
 			&i915->dsm_reserved, &i915->dsm);
+		ret = -EINVAL;
+		goto bail_out;
+	}
+
+	return 0;
+
+bail_out:
+	i915->dsm_reserved =
+		(struct resource)DEFINE_RES_MEM(reserved_base, 0);
+
+	return ret;
+}
+
+static int i915_gem_init_stolen(struct intel_memory_region *mem)
+{
+	struct drm_i915_private *i915 = mem->i915;
+
+	mutex_init(&i915->mm.stolen_lock);
+
+	if (intel_vgpu_active(i915)) {
+		drm_notice(&i915->drm,
+			   "%s, disabling use of stolen memory\n",
+			   "iGVT-g active");
+		return 0;
+	}
+
+	if (i915_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
+		drm_notice(&i915->drm,
+			   "%s, disabling use of stolen memory\n",
+			   "DMAR active");
 		return 0;
 	}
 
+	if (adjust_stolen(i915, &mem->region))
+		return 0;
+
+	if (request_smem_stolen(i915, &mem->region))
+		return 0;
+
+	i915->dsm = mem->region;
+
+	if (init_reserved_stolen(i915))
+		return 0;
+
 	/* Exclude the reserved region from driver use */
-	mem->region.end = reserved_base - 1;
+	mem->region.end = i915->dsm_reserved.start - 1;
 	mem->io_size = min(mem->io_size, resource_size(&mem->region));
 
-	/* It is possible for the reserved area to end before the end of stolen
-	 * memory, so just consider the start. */
-	reserved_total = stolen_top - reserved_base;
-
-	i915->stolen_usable_size =
-		resource_size(&i915->dsm) - reserved_total;
+	i915->stolen_usable_size = resource_size(&mem->region);
 
 	drm_dbg(&i915->drm,
 		"Memory reserved for graphics device: %lluK, usable: %lluK\n",
@@ -759,11 +790,6 @@ static int init_stolen_lmem(struct intel_memory_region *mem)
 	if (GEM_WARN_ON(resource_size(&mem->region) == 0))
 		return -ENODEV;
 
-	/*
-	 * TODO: For stolen lmem we mostly just care about populating the dsm
-	 * related bits and setting up the drm_mm allocator for the range.
-	 * Perhaps split up i915_gem_init_stolen() for this.
-	 */
 	err = i915_gem_init_stolen(mem);
 	if (err)
 		return err;

-- 
b4 0.10.0-dev-bbe61
