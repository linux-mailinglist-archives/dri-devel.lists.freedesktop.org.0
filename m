Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 179435BDDDB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 09:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E13610E29C;
	Tue, 20 Sep 2022 07:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F6910E290;
 Tue, 20 Sep 2022 07:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663658014; x=1695194014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eDv6g+bDUS+igQv1K28Yl644UwAFod41aKoQUDkvz58=;
 b=mPLtr9ylW3hq1bnEMj8aQ6zvDu/1l9cZl4GzKxmLXRyemkAXNWY45aKM
 DmHPSJ1fRyZ/DVCHB/uzqhH3WIxVGthnFz9dPgCfFCTKlLicEnt3AZFWR
 PgDXfy30rF0XaiU5YWt4UIP7LlaC5iJq7aQ/wLbK8Q3KmcIyNILVJwcsa
 Fo0j8WHVBbDAuzIEHFmuM2N1hyCnXaN2Bvsc5WEjuFCyvzy/PZCJMJxUn
 Tmq9ln5K/FDqup14QFIGMB2I0/2Vfisq4aG5h70GYn+X4swK10qhtWnxU
 G4tQceljIyHy9Hlh9ZbasVX9yTzT0ExZukO2q01QxJh1SIf1sO8tBQw7R g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="299609274"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="299609274"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 00:13:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="621155658"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 00:13:32 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915/mtl: enable local stolen memory
Date: Tue, 20 Sep 2022 12:49:40 +0530
Message-Id: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As an integrated GPU, MTL does not have local memory and
HAS_LMEM() returns false.  However the platform's stolen memory
is presented via BAR2 (i.e., the BAR we traditionally consider
to be the LMEM BAR) and should be managed by the driver the same
way that local memory is on dgpu platforms (which includes
setting the "lmem" bit on page table entries).  We use the term
"local stolen memory" to refer to this model.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Original-author: CQ Tang
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 113 +++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_ggtt.c       |   2 +-
 drivers/gpu/drm/i915/i915_drv.h            |   3 +
 3 files changed, 100 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index acc561c0f0aa..bad5250fb764 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -77,6 +77,19 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
 	mutex_unlock(&i915->mm.stolen_lock);
 }
 
+static bool is_dsm_invalid(struct drm_i915_private *i915, struct resource *dsm)
+{
+	if (!HAS_BAR2_SMEM_STOLEN(i915)) {
+		if (dsm->start == 0)
+			return true;
+	}
+
+	if (dsm->end <= dsm->start)
+		return true;
+
+	return false;
+}
+
 static int i915_adjust_stolen(struct drm_i915_private *i915,
 			      struct resource *dsm)
 {
@@ -84,7 +97,7 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
 	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
 	struct resource *r;
 
-	if (dsm->start == 0 || dsm->end <= dsm->start)
+	if (is_dsm_invalid(i915, dsm))
 		return -EINVAL;
 
 	/*
@@ -136,7 +149,7 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
 	 * overlaps with the non-stolen system memory range, since lmem is local
 	 * to the gpu.
 	 */
-	if (HAS_LMEM(i915))
+	if (HAS_LMEM(i915) || HAS_BAR2_SMEM_STOLEN(i915))
 		return 0;
 
 	/*
@@ -371,8 +384,6 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
 
 	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
 
-	*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
-
 	switch (reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK) {
 	case GEN8_STOLEN_RESERVED_1M:
 		*size = 1024 * 1024;
@@ -390,6 +401,12 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
 		*size = 8 * 1024 * 1024;
 		MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
 	}
+
+	if ((GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) && !IS_DGFX(i915))
+		/* the base is initialized to stolen top so subtract size to get base */
+		*base -= *size;
+	else
+		*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
 }
 
 static int i915_gem_init_stolen(struct intel_memory_region *mem)
@@ -423,8 +440,7 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 	if (i915_adjust_stolen(i915, &i915->dsm))
 		return 0;
 
-	GEM_BUG_ON(i915->dsm.start == 0);
-	GEM_BUG_ON(i915->dsm.end <= i915->dsm.start);
+	GEM_BUG_ON(is_dsm_invalid(i915, &i915->dsm));
 
 	stolen_top = i915->dsm.end + 1;
 	reserved_base = stolen_top;
@@ -796,6 +812,46 @@ static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
 	.init_object = _i915_gem_object_stolen_init,
 };
 
+static int get_mtl_gms_size(struct intel_uncore *uncore)
+{
+	u16 ggc, gms;
+
+	ggc = intel_uncore_read16(uncore, _MMIO(0x108040));
+
+	/* check GGMS, should be fixed 0x3 (8MB) */
+	if ((ggc & 0xc0) != 0xc0)
+		return -EIO;
+
+	/* return valid GMS value, -EIO if invalid */
+	gms = ggc >> 8;
+	switch (gms) {
+	case 0x0 ... 0x10:
+		return gms * 32;
+	case 0x20:
+		return 1024;
+	case 0x30:
+		return 1536;
+	case 0x40:
+		return 2048;
+	case 0xf0 ... 0xfe:
+		return (gms - 0xf0 + 1) * 4;
+	default:
+		return -EIO;
+	}
+}
+
+static inline bool lmembar_is_igpu_stolen(struct drm_i915_private *i915)
+{
+	u32 regions = RUNTIME_INFO(i915)->memory_regions;
+
+	if (regions & REGION_LMEM)
+		return false;
+
+	drm_WARN_ON(&i915->drm, (regions & REGION_STOLEN_LMEM) == 0);
+
+	return true;
+}
+
 struct intel_memory_region *
 i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 			   u16 instance)
@@ -806,19 +862,16 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	struct intel_memory_region *mem;
 	resource_size_t io_start, io_size;
 	resource_size_t min_page_size;
+	int ret;
 
 	if (WARN_ON_ONCE(instance))
 		return ERR_PTR(-ENODEV);
 
-	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
+	if (!i915_pci_resource_valid(pdev, GFXMEM_BAR))
 		return ERR_PTR(-ENXIO);
 
-	/* Use DSM base address instead for stolen memory */
-	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
-	if (IS_DG1(uncore->i915)) {
-		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
-		if (WARN_ON(lmem_size < dsm_base))
-			return ERR_PTR(-ENODEV);
+	if (lmembar_is_igpu_stolen(i915) || IS_DG1(i915)) {
+		lmem_size = pci_resource_len(pdev, GFXMEM_BAR);
 	} else {
 		resource_size_t lmem_range;
 
@@ -827,13 +880,39 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 		lmem_size *= SZ_1G;
 	}
 
-	dsm_size = lmem_size - dsm_base;
-	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
+	if (HAS_BAR2_SMEM_STOLEN(i915)) {
+		/*
+		 * MTL dsm size is in GGC register, not the bar size.
+		 * also MTL uses offset to DSMBASE in ptes, so i915
+		 * uses dsm_base = 0 to setup stolen region.
+		 */
+		ret = get_mtl_gms_size(uncore);
+		if (ret < 0) {
+			drm_err(&i915->drm, "invalid MTL GGC register setting\n");
+			return ERR_PTR(ret);
+		}
+
+		dsm_base = 0;
+		dsm_size = (resource_size_t)(ret * SZ_1M);
+
+		GEM_BUG_ON(pci_resource_len(pdev, GFXMEM_BAR) != 256 * SZ_1M);
+		GEM_BUG_ON((dsm_size + 8 * SZ_1M) > lmem_size);
+	} else {
+		/* Use DSM base address instead for stolen memory */
+		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
+		if (WARN_ON(lmem_size < dsm_base))
+			return ERR_PTR(-ENODEV);
+		dsm_size = lmem_size - dsm_base;
+	}
+
+	io_size = dsm_size;
+	if (pci_resource_len(pdev, GFXMEM_BAR) < dsm_size) {
 		io_start = 0;
 		io_size = 0;
+	} else if (HAS_BAR2_SMEM_STOLEN(i915)) {
+		io_start = pci_resource_start(pdev, GFXMEM_BAR) + 8 * SZ_1M;
 	} else {
-		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
-		io_size = dsm_size;
+		io_start = pci_resource_start(pdev, GFXMEM_BAR) + dsm_base;
 	}
 
 	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 30cf5c3369d9..b31fe0fb013f 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -931,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 	unsigned int size;
 	u16 snb_gmch_ctl;
 
-	if (!HAS_LMEM(i915)) {
+	if (!HAS_LMEM(i915) && !HAS_BAR2_SMEM_STOLEN(i915)) {
 		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
 			return -ENXIO;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 134fc1621821..ef3120322077 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -973,6 +973,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
 
+#define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
+				    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+
 /* intel_device_info.c */
 static inline struct intel_device_info *
 mkwrite_device_info(struct drm_i915_private *dev_priv)
-- 
2.25.1

