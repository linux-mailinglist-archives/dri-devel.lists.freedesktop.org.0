Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F141A5EF482
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 13:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120CD10E5E1;
	Thu, 29 Sep 2022 11:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4D210E5E1;
 Thu, 29 Sep 2022 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664451723; x=1695987723;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h8CW2B0dh/ZVDKt9hnUUTN6yoGvGeyKTdgcq378HQfE=;
 b=RcsSJMsWqXfOQVzUcw7g9XWYTGq22j0L3NwmiMsMzGPYMgMKvOuKFFWZ
 xp9xaUmRJdlJMZ+nJ02VDPSaedqFh9GWBbzrrFLPZYOXyU6DWVu9QLvY5
 MtpA/GE7UUsOEZ0LCGM+6Ar9IicBl5+LejWjb0YePdfBd3TV7xjHpfSAI
 0zDnq+WcMFbl1p/qAg3TY4AuUWDRHrDrunIA+SbQYy2fSO2155v6lIwp1
 6YSFnoIXLQuzdoFCDlbhnPWMv6D49m1X5nxJ56rdttQ9mgeNohqhuw8rO
 O6KtX5XIot728WjdlogTQY77aTdxbacAz3ywEsSuPBUHwEoQWSaLExaES g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="281583141"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="281583141"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 04:42:02 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="624533254"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="624533254"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 04:41:58 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5] drm/i915/mtl: enable local stolen memory
Date: Thu, 29 Sep 2022 17:16:58 +0530
Message-Id: <20220929114658.145287-1-aravind.iddamsetty@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, anshuman.gupta@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As an integrated GPU, MTL does not have local memory and HAS_LMEM()
returns false.  However the platform's stolen memory is presented via
BAR2 (i.e., the BAR we traditionally consider to be the GMADR on IGFX)
and should be managed by the driver the same way that local memory is
on dgpu platforms (which includes setting the "lmem" bit on page table
entries).  We use the term "local stolen memory" to refer to this
model.

The major difference from the traditional BAR2 (GMADR) is that
the stolen area is mapped via the BAR2 while in the former BAR2 is an
aperture into the GTT VA through which access are made into stolen area.

BSPEC: 53098, 63830

v2:
1. dropped is_dsm_invalid, updated valid_stolen_size check from Lucas
(Jani, Lucas)
2. drop lmembar_is_igpu_stolen
3. revert to referring GFXMEM_BAR as GEN12_LMEM_BAR (Lucas)

v3:(Jani)
1. rename get_mtl_gms_size to mtl_get_gms_size
2. define register for MMIO address

v4:(Matt)
1. Use REG_FIELD_GET to read GMS value
2. replace the calculations with SZ_256M/SZ_8M

v5: Include more details to commit message on how it is different from
earlier platforms (Anshuman)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>

Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Original-author: CQ Tang
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 83 ++++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_ggtt.c       |  2 +-
 drivers/gpu/drm/i915/i915_drv.h            |  3 +
 drivers/gpu/drm/i915/i915_reg.h            |  4 ++
 4 files changed, 76 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index c5a4035c99cd..910086974454 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -77,9 +77,9 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
 	mutex_unlock(&i915->mm.stolen_lock);
 }
 
-static bool valid_stolen_size(struct resource *dsm)
+static bool valid_stolen_size(struct drm_i915_private *i915, struct resource *dsm)
 {
-	return dsm->start != 0 && dsm->end > dsm->start;
+	return (dsm->start != 0 || HAS_BAR2_SMEM_STOLEN(i915)) && dsm->end > dsm->start;
 }
 
 static int adjust_stolen(struct drm_i915_private *i915,
@@ -88,7 +88,7 @@ static int adjust_stolen(struct drm_i915_private *i915,
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
 
-	if (!valid_stolen_size(dsm))
+	if (!valid_stolen_size(i915, dsm))
 		return -EINVAL;
 
 	/*
@@ -135,7 +135,7 @@ static int adjust_stolen(struct drm_i915_private *i915,
 		}
 	}
 
-	if (!valid_stolen_size(dsm))
+	if (!valid_stolen_size(i915, dsm))
 		return -EINVAL;
 
 	return 0;
@@ -149,8 +149,11 @@ static int request_smem_stolen(struct drm_i915_private *i915,
 	/*
 	 * With stolen lmem, we don't need to request system memory for the
 	 * address range since it's local to the gpu.
+	 *
+	 * Starting MTL, in IGFX devices the stolen memory is exposed via
+	 * BAR2 and shall be considered similar to stolen lmem.
 	 */
-	if (HAS_LMEM(i915))
+	if (HAS_LMEM(i915) || HAS_BAR2_SMEM_STOLEN(i915))
 		return 0;
 
 	/*
@@ -385,8 +388,6 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
 
 	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
 
-	*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
-
 	switch (reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK) {
 	case GEN8_STOLEN_RESERVED_1M:
 		*size = 1024 * 1024;
@@ -404,6 +405,12 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
 		*size = 8 * 1024 * 1024;
 		MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
 	}
+
+	if (HAS_BAR2_SMEM_STOLEN(i915))
+		/* the base is initialized to stolen top so subtract size to get base */
+		*base -= *size;
+	else
+		*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
 }
 
 /*
@@ -833,6 +840,29 @@ static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
 	.init_object = _i915_gem_object_stolen_init,
 };
 
+static int mtl_get_gms_size(struct intel_uncore *uncore)
+{
+	u16 ggc, gms;
+
+	ggc = intel_uncore_read16(uncore, GGC);
+
+	/* check GGMS, should be fixed 0x3 (8MB) */
+	if ((ggc & GGMS_MASK) != GGMS_MASK)
+		return -EIO;
+
+	/* return valid GMS value, -EIO if invalid */
+	gms = REG_FIELD_GET(GMS_MASK, ggc);
+	switch (gms) {
+	case 0x0 ... 0x04:
+		return gms * 32;
+	case 0xf0 ... 0xfe:
+		return (gms - 0xf0 + 1) * 4;
+	default:
+		MISSING_CASE(gms);
+		return -EIO;
+	}
+}
+
 struct intel_memory_region *
 i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 			   u16 instance)
@@ -843,6 +873,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	struct intel_memory_region *mem;
 	resource_size_t io_start, io_size;
 	resource_size_t min_page_size;
+	int ret;
 
 	if (WARN_ON_ONCE(instance))
 		return ERR_PTR(-ENODEV);
@@ -850,12 +881,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
 		return ERR_PTR(-ENXIO);
 
-	/* Use DSM base address instead for stolen memory */
-	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
-	if (IS_DG1(uncore->i915)) {
+	if (HAS_BAR2_SMEM_STOLEN(i915) || IS_DG1(i915)) {
 		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
-		if (WARN_ON(lmem_size < dsm_base))
-			return ERR_PTR(-ENODEV);
 	} else {
 		resource_size_t lmem_range;
 
@@ -864,13 +891,39 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 		lmem_size *= SZ_1G;
 	}
 
-	dsm_size = lmem_size - dsm_base;
-	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
+	if (HAS_BAR2_SMEM_STOLEN(i915)) {
+		/*
+		 * MTL dsm size is in GGC register.
+		 * Also MTL uses offset to DSMBASE in ptes, so i915
+		 * uses dsm_base = 0 to setup stolen region.
+		 */
+		ret = mtl_get_gms_size(uncore);
+		if (ret < 0) {
+			drm_err(&i915->drm, "invalid MTL GGC register setting\n");
+			return ERR_PTR(ret);
+		}
+
+		dsm_base = 0;
+		dsm_size = (resource_size_t)(ret * SZ_1M);
+
+		GEM_BUG_ON(pci_resource_len(pdev, GEN12_LMEM_BAR) != SZ_256M);
+		GEM_BUG_ON((dsm_size + SZ_8M) > lmem_size);
+	} else {
+		/* Use DSM base address instead for stolen memory */
+		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
+		if (WARN_ON(lmem_size < dsm_base))
+			return ERR_PTR(-ENODEV);
+		dsm_size = lmem_size - dsm_base;
+	}
+
+	io_size = dsm_size;
+	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < dsm_size) {
 		io_start = 0;
 		io_size = 0;
+	} else if (HAS_BAR2_SMEM_STOLEN(i915)) {
+		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + SZ_8M;
 	} else {
 		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
-		io_size = dsm_size;
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
index 84a2f6b16f57..90ed8e6db2fe 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -974,6 +974,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
 
+#define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
+				    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+
 /* intel_device_info.c */
 static inline struct intel_device_info *
 mkwrite_device_info(struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 5003a5ffbc6a..2126e441199d 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7967,6 +7967,10 @@ enum skl_power_gate {
 							   _ICL_PIPE_DSS_CTL2_PB, \
 							   _ICL_PIPE_DSS_CTL2_PC)
 
+#define GGC				_MMIO(0x108040)
+#define   GMS_MASK			REG_GENMASK(15, 8)
+#define   GGMS_MASK			REG_GENMASK(7, 6)
+
 #define GEN12_GSMBASE			_MMIO(0x108100)
 #define GEN12_DSMBASE			_MMIO(0x1080C0)
 #define   GEN12_BDSM_MASK		REG_GENMASK64(63, 20)
-- 
2.25.1

