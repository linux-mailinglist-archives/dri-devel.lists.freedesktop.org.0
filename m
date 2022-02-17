Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56EA4BA78D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 18:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CCD10E262;
	Thu, 17 Feb 2022 17:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930B010E262;
 Thu, 17 Feb 2022 17:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645120547; x=1676656547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N/nYj+MSG2xPOx6kLLRDL+hVnUU2VMTunUSLTRuBLKU=;
 b=oG5bQBR+IJLTWJNqq6zgVQOZ6bpD40Sn7rPAAOnYICStHBVv5ufNzrZD
 SWpauNZW3oAjsjf6oQJArwaShtSzr6PmzIpMDjbmMurUiV/xpXEkDopIb
 k40/XscaPJuz4PlO8gpepeqKi/8f0BH68W3HkDchQFHEbtf5Sp3sd6eXl
 +A5O1hrrnS7X6eOyS396ZBhjooAE7V0nb3eQso7f+OYdQonGJSTEmXbHm
 eV4FIcYUfz86svudiu1Z+vNOJqyt579KS14l6olk2/nqDPOy0ZmX5GU8j
 V2XpEY1wzZMQNFmgsoOOqSTLqCtqc9CGW7VR8o5g0paQQnwtjumuQ1uzS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="231556914"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="231556914"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:55:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="541286458"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:55:45 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Kill the fake lmem support
Date: Thu, 17 Feb 2022 09:56:34 -0800
Message-Id: <20220217175634.4128754-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was useful for early development of lmem, but it's not used
anymore, so remove it.

v2: Remove unneeded fields from struct intel_memory_region

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.unstable       |   8 --
 drivers/gpu/drm/i915/gt/intel_gt.c          |   2 -
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 112 +-------------------
 drivers/gpu/drm/i915/gt/intel_region_lmem.h |   3 -
 drivers/gpu/drm/i915/i915_driver.c          |  15 ---
 drivers/gpu/drm/i915/i915_params.c          |   5 -
 drivers/gpu/drm/i915/i915_params.h          |   1 -
 drivers/gpu/drm/i915/intel_memory_region.h  |   5 -
 8 files changed, 2 insertions(+), 149 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.unstable b/drivers/gpu/drm/i915/Kconfig.unstable
index 0c2276155c2b..cf151a297ed7 100644
--- a/drivers/gpu/drm/i915/Kconfig.unstable
+++ b/drivers/gpu/drm/i915/Kconfig.unstable
@@ -19,11 +19,3 @@ config DRM_I915_UNSTABLE
 	  Recommended for driver developers _only_.
 
 	  If in the slightest bit of doubt, say "N".
-
-config DRM_I915_UNSTABLE_FAKE_LMEM
-	bool "Enable the experimental fake lmem"
-	depends on DRM_I915_UNSTABLE
-	default n
-	help
-	  Convert some system memory into a fake local memory region for
-	  testing.
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index e8403fa53909..325ac15439eb 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -65,8 +65,6 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
 	int err;
 
 	mem = intel_gt_setup_lmem(gt);
-	if (mem == ERR_PTR(-ENODEV))
-		mem = intel_gt_setup_fake_lmem(gt);
 	if (IS_ERR(mem)) {
 		err = PTR_ERR(mem);
 		if (err == -ENODEV)
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index cb3f66707b21..df3856e09598 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -13,60 +13,6 @@
 #include "gem/i915_gem_ttm.h"
 #include "gt/intel_gt.h"
 
-static int init_fake_lmem_bar(struct intel_memory_region *mem)
-{
-	struct drm_i915_private *i915 = mem->i915;
-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
-	unsigned long n;
-	int ret;
-
-	/* We want to 1:1 map the mappable aperture to our reserved region */
-
-	mem->fake_mappable.start = 0;
-	mem->fake_mappable.size = resource_size(&mem->region);
-	mem->fake_mappable.color = I915_COLOR_UNEVICTABLE;
-
-	ret = drm_mm_reserve_node(&ggtt->vm.mm, &mem->fake_mappable);
-	if (ret)
-		return ret;
-
-	mem->remap_addr = dma_map_resource(i915->drm.dev,
-					   mem->region.start,
-					   mem->fake_mappable.size,
-					   DMA_BIDIRECTIONAL,
-					   DMA_ATTR_FORCE_CONTIGUOUS);
-	if (dma_mapping_error(i915->drm.dev, mem->remap_addr)) {
-		drm_mm_remove_node(&mem->fake_mappable);
-		return -EINVAL;
-	}
-
-	for (n = 0; n < mem->fake_mappable.size >> PAGE_SHIFT; ++n) {
-		ggtt->vm.insert_page(&ggtt->vm,
-				     mem->remap_addr + (n << PAGE_SHIFT),
-				     n << PAGE_SHIFT,
-				     I915_CACHE_NONE, 0);
-	}
-
-	mem->region = (struct resource)DEFINE_RES_MEM(mem->remap_addr,
-						      mem->fake_mappable.size);
-
-	return 0;
-}
-
-static void release_fake_lmem_bar(struct intel_memory_region *mem)
-{
-	if (!drm_mm_node_allocated(&mem->fake_mappable))
-		return;
-
-	drm_mm_remove_node(&mem->fake_mappable);
-
-	dma_unmap_resource(mem->i915->drm.dev,
-			   mem->remap_addr,
-			   mem->fake_mappable.size,
-			   DMA_BIDIRECTIONAL,
-			   DMA_ATTR_FORCE_CONTIGUOUS);
-}
-
 static int
 region_lmem_release(struct intel_memory_region *mem)
 {
@@ -74,7 +20,6 @@ region_lmem_release(struct intel_memory_region *mem)
 
 	ret = intel_region_ttm_fini(mem);
 	io_mapping_fini(&mem->iomap);
-	release_fake_lmem_bar(mem);
 
 	return ret;
 }
@@ -84,17 +29,10 @@ region_lmem_init(struct intel_memory_region *mem)
 {
 	int ret;
 
-	if (mem->i915->params.fake_lmem_start) {
-		ret = init_fake_lmem_bar(mem);
-		GEM_BUG_ON(ret);
-	}
-
 	if (!io_mapping_init_wc(&mem->iomap,
 				mem->io_start,
-				resource_size(&mem->region))) {
-		ret = -EIO;
-		goto out_no_io;
-	}
+				resource_size(&mem->region)))
+		return -EIO;
 
 	ret = intel_region_ttm_init(mem);
 	if (ret)
@@ -104,8 +42,6 @@ region_lmem_init(struct intel_memory_region *mem)
 
 out_no_buddy:
 	io_mapping_fini(&mem->iomap);
-out_no_io:
-	release_fake_lmem_bar(mem);
 
 	return ret;
 }
@@ -116,50 +52,6 @@ static const struct intel_memory_region_ops intel_region_lmem_ops = {
 	.init_object = __i915_gem_ttm_object_init,
 };
 
-struct intel_memory_region *
-intel_gt_setup_fake_lmem(struct intel_gt *gt)
-{
-	struct drm_i915_private *i915 = gt->i915;
-	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
-	struct intel_memory_region *mem;
-	resource_size_t mappable_end;
-	resource_size_t io_start;
-	resource_size_t start;
-
-	if (!HAS_LMEM(i915))
-		return ERR_PTR(-ENODEV);
-
-	if (!i915->params.fake_lmem_start)
-		return ERR_PTR(-ENODEV);
-
-	GEM_BUG_ON(i915_ggtt_has_aperture(to_gt(i915)->ggtt));
-
-	/* Your mappable aperture belongs to me now! */
-	mappable_end = pci_resource_len(pdev, 2);
-	io_start = pci_resource_start(pdev, 2);
-	start = i915->params.fake_lmem_start;
-
-	mem = intel_memory_region_create(i915,
-					 start,
-					 mappable_end,
-					 PAGE_SIZE,
-					 io_start,
-					 INTEL_MEMORY_LOCAL,
-					 0,
-					 &intel_region_lmem_ops);
-	if (!IS_ERR(mem)) {
-		drm_info(&i915->drm, "Intel graphics fake LMEM: %pR\n",
-			 &mem->region);
-		drm_info(&i915->drm,
-			 "Intel graphics fake LMEM IO start: %llx\n",
-			(u64)mem->io_start);
-		drm_info(&i915->drm, "Intel graphics fake LMEM size: %llx\n",
-			 (u64)resource_size(&mem->region));
-	}
-
-	return mem;
-}
-
 static bool get_legacy_lowmem_region(struct intel_uncore *uncore,
 				     u64 *start, u32 *size)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.h b/drivers/gpu/drm/i915/gt/intel_region_lmem.h
index 062d0542ae34..1438576b527a 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.h
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.h
@@ -10,7 +10,4 @@ struct intel_gt;
 
 struct intel_memory_region *intel_gt_setup_lmem(struct intel_gt *gt);
 
-struct intel_memory_region *
-intel_gt_setup_fake_lmem(struct intel_gt *gt);
-
 #endif /* !__INTEL_REGION_LMEM_H */
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 1c67ff735f18..62b3f332bbf5 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -835,21 +835,6 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!i915->params.nuclear_pageflip && match_info->graphics.ver < 5)
 		i915->drm.driver_features &= ~DRIVER_ATOMIC;
 
-	/*
-	 * Check if we support fake LMEM -- for now we only unleash this for
-	 * the live selftests(test-and-exit).
-	 */
-#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
-	if (IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM)) {
-		if (GRAPHICS_VER(i915) >= 9 && i915_selftest.live < 0 &&
-		    i915->params.fake_lmem_start) {
-			mkwrite_device_info(i915)->memory_regions =
-				REGION_SMEM | REGION_LMEM | REGION_STOLEN_SMEM;
-			GEM_BUG_ON(!HAS_LMEM(i915));
-		}
-	}
-#endif
-
 	ret = pci_enable_device(pdev);
 	if (ret)
 		goto out_fini;
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 525ae832aa9a..eea355c2fc28 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -195,11 +195,6 @@ i915_param_named(enable_gvt, bool, 0400,
 	"Enable support for Intel GVT-g graphics virtualization host support(default:false)");
 #endif
 
-#if IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM)
-i915_param_named_unsafe(fake_lmem_start, ulong, 0400,
-	"Fake LMEM start offset (default: 0)");
-#endif
-
 #if CONFIG_DRM_I915_REQUEST_TIMEOUT
 i915_param_named_unsafe(request_timeout_ms, uint, 0600,
 			"Default request/fence/batch buffer expiration timeout.");
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index c9d53ff910a0..c779a6f85c7e 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -72,7 +72,6 @@ struct drm_printer;
 	param(int, fastboot, -1, 0600) \
 	param(int, enable_dpcd_backlight, -1, 0600) \
 	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
-	param(unsigned long, fake_lmem_start, 0, IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM) ? 0400 : 0) \
 	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT, CONFIG_DRM_I915_REQUEST_TIMEOUT ? 0600 : 0) \
 	/* leave bools at the end to not create holes */ \
 	param(bool, enable_hangcheck, true, 0600) \
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 5625c9c38993..06464b8865fc 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -67,9 +67,6 @@ struct intel_memory_region {
 	struct io_mapping iomap;
 	struct resource region;
 
-	/* For fake LMEM */
-	struct drm_mm_node fake_mappable;
-
 	resource_size_t io_start;
 	resource_size_t min_page_size;
 	resource_size_t total;
@@ -81,8 +78,6 @@ struct intel_memory_region {
 	char name[16];
 	bool private; /* not for userspace */
 
-	dma_addr_t remap_addr;
-
 	struct {
 		struct mutex lock; /* Protects access to objects */
 		struct list_head list;
-- 
2.35.1

