Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 650FC7610F1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 12:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6888910E08A;
	Tue, 25 Jul 2023 10:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3D310E08A;
 Tue, 25 Jul 2023 10:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690281222; x=1721817222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fTVtUvuQMYK/PU0kxUt95Ct/UNJ9M9QN1tE6JCwmdPA=;
 b=EYKJO7PosWDCc3Btgqgji3zdlJPnFIAWwrW6XtVbqAlGrdcqagmGhfxU
 oWuFEY7K4ddZ3MHpTH1pmrYi+rmPSWVJTzle6Zw6yRlX6DvC6prPgY59W
 e1OjJIPJe5eUBJtSjL2qiYNFiJP3KV72eanT5rI1p0LAZeoEYyH+aUq6t
 clj4upCg4waaGPIKHi2tRVybOtQwsM40Uwp6y2xPKrpeu18ZQM2fhvcT9
 HPvb6fcGrtcnYVWp7XCqngSTmu+m02kKj0ogdLXmsOMCv+mXMTM7JUdfX
 FafmvZC92/8x3gVt5E3APTILLvJDH4rcPJcutVbL8+zmR7tKVHSNiFrl3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="365143195"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="365143195"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 03:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="849965883"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="849965883"
Received: from kshutemo-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.37.237])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 03:33:40 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH] drm/i915: Replace i915->gt0 with to_gt(i915)
Date: Tue, 25 Jul 2023 12:33:30 +0200
Message-Id: <20230725103330.1041394-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quite surprised to see that around i915 there are still i915->gt0
references. Replace them with the to_gt() helper.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c       | 2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c               | 2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c      | 2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c             | 8 ++++----
 drivers/gpu/drm/i915/selftests/mock_gem_device.c | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 3b094d36a0b04..5b0a5cf9a98a8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -892,7 +892,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	} else {
 		resource_size_t lmem_range;
 
-		lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
+		lmem_range = intel_gt_mcr_read_any(to_gt(i915), XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
 		lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
 		lmem_size *= SZ_1G;
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 9f64d61dd5fcd..02886c1eb0f17 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -887,7 +887,7 @@ static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
 int intel_gt_probe_all(struct drm_i915_private *i915)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
-	struct intel_gt *gt = &i915->gt0;
+	struct intel_gt *gt = to_gt(i915);
 	const struct intel_gt_definition *gtdef;
 	phys_addr_t phys_addr;
 	unsigned int mmio_bar;
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 2a3217e2890fc..f8512aee58a83 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -220,7 +220,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 		resource_size_t lmem_range;
 		u64 tile_stolen, flat_ccs_base;
 
-		lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
+		lmem_range = intel_gt_mcr_read_any(to_gt(i915), XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
 		lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
 		lmem_size *= SZ_1G;
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index bb2e15329f346..38ec754d0ec8e 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -162,8 +162,8 @@ static struct intel_gt *find_gt_for_required_teelink(struct drm_i915_private *i9
 	 * for HuC authentication. For now, its limited to DG2.
 	 */
 	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC) &&
-	    intel_huc_is_loaded_by_gsc(&i915->gt0.uc.huc) && intel_uc_uses_huc(&i915->gt0.uc))
-		return &i915->gt0;
+	    intel_huc_is_loaded_by_gsc(&to_gt(i915)->uc.huc) && intel_uc_uses_huc(&to_gt(i915)->uc))
+		return to_gt(i915);
 
 	return NULL;
 }
@@ -188,8 +188,8 @@ static struct intel_gt *find_gt_for_required_protected_content(struct drm_i915_p
 	 * Else we rely on mei-pxp module but only on legacy platforms
 	 * prior to having separate media GTs and has a valid VDBOX.
 	 */
-	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP) && !i915->media_gt && VDBOX_MASK(&i915->gt0))
-		return &i915->gt0;
+	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP) && !i915->media_gt && VDBOX_MASK(to_gt(i915)))
+		return to_gt(i915);
 
 	return NULL;
 }
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 12aa7fbb07481..da0b269606c51 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -114,7 +114,7 @@ static struct dev_pm_domain pm_domain = {
 
 static void mock_gt_probe(struct drm_i915_private *i915)
 {
-	i915->gt[0] = &i915->gt0;
+	i915->gt[0] = to_gt(i915);
 	i915->gt[0]->name = "Mock GT";
 }
 
-- 
2.40.1

