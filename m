Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486A2C659E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C546EDAA;
	Fri, 27 Nov 2020 12:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C6B6ECE3;
 Fri, 27 Nov 2020 12:12:50 +0000 (UTC)
IronPort-SDR: kwTPAMvWSLHgbaoDB33OlMHTaPfnMCAoM4PZuvhliXp1dhoGJ8qaRRnK7hfoxvDVAemvxfs+Sx
 wjoX1NDFroLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883899"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883899"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:37 -0800
IronPort-SDR: FR7HKmkB/TR8XEb/FB/8Ds0QFD1UxxDWVw3Rhn6U6DaIngI7hbCFrtn1Kc2Ep9RecMsadHAhc1
 fy7GyEwyzKVQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030088"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:36 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 162/162] drm/i915: drop fake lmem
Date: Fri, 27 Nov 2020 12:07:18 +0000
Message-Id: <20201127120718.454037-163-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c            | 15 ----
 drivers/gpu/drm/i915/i915_params.c         |  5 --
 drivers/gpu/drm/i915/i915_params.h         |  1 -
 drivers/gpu/drm/i915/intel_memory_region.c | 11 +--
 drivers/gpu/drm/i915/intel_region_lmem.c   | 96 ----------------------
 drivers/gpu/drm/i915/intel_region_lmem.h   |  3 -
 6 files changed, 1 insertion(+), 130 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index c41865d5bf1e..ee7272abc2b4 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -836,21 +836,6 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!i915->params.nuclear_pageflip && match_info->gen < 5)
 		i915->drm.driver_features &= ~DRIVER_ATOMIC;
 
-	/*
-	 * Check if we support fake LMEM -- for now we only unleash this for
-	 * the live selftests(test-and-exit).
-	 */
-#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
-	if (IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM)) {
-		if (INTEL_GEN(i915) >= 9 && i915_selftest.live < 0 &&
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
index 9fa58ed76614..819341f77488 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -192,11 +192,6 @@ i915_param_named(enable_gvt, bool, 0400,
 	"Enable support for Intel GVT-g graphics virtualization host support(default:false)");
 #endif
 
-#if IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM)
-i915_param_named_unsafe(fake_lmem_start, ulong, 0400,
-	"Fake LMEM start offset (default: 0)");
-#endif
-
 i915_param_named_unsafe(enable_eviction, uint, 0600,
 	"Enable eviction which does not rely on DMA resv refactoring "
 	"0=disabled, 1=memcpy based only, 2=blt based only, "
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index c835e592ee5f..ea6e99735ff2 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -70,7 +70,6 @@ struct drm_printer;
 	param(int, fastboot, -1, 0600) \
 	param(int, enable_dpcd_backlight, -1, 0600) \
 	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
-	param(unsigned long, fake_lmem_start, 0, 0400) \
 	param(unsigned int, lmem_size, 0, 0400) \
 	param(unsigned int, enable_eviction, 3, 0600) \
 	/* leave bools at the end to not create holes */ \
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 6b26b6cd5958..045efb9b01d9 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -447,16 +447,7 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 			mem = i915_gem_stolen_setup(i915);
 			break;
 		case INTEL_MEMORY_LOCAL:
-#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
-			if (IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM)) {
-				if (INTEL_GEN(i915) >= 9 && i915_selftest.live < 0 &&
-				    i915->params.fake_lmem_start)
-					mem = intel_setup_fake_lmem(i915);
-			}
-#endif
-
-			if (IS_ERR(mem))
-				mem = i915_gem_setup_lmem(i915);
+			mem = i915_gem_setup_lmem(i915);
 			break;
 		}
 
diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
index 1cdb6354b968..e3f5ca619318 100644
--- a/drivers/gpu/drm/i915/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/intel_region_lmem.c
@@ -9,64 +9,9 @@
 #include "gem/i915_gem_region.h"
 #include "intel_region_lmem.h"
 
-static int init_fake_lmem_bar(struct intel_memory_region *mem)
-{
-	struct drm_i915_private *i915 = mem->i915;
-	struct i915_ggtt *ggtt = &i915->ggtt;
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
-	mem->remap_addr = dma_map_resource(&i915->drm.pdev->dev,
-					   mem->region.start,
-					   mem->fake_mappable.size,
-					   PCI_DMA_BIDIRECTIONAL,
-					   DMA_ATTR_FORCE_CONTIGUOUS);
-	if (dma_mapping_error(&i915->drm.pdev->dev, mem->remap_addr)) {
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
-	dma_unmap_resource(&mem->i915->drm.pdev->dev,
-			   mem->remap_addr,
-			   mem->fake_mappable.size,
-			   PCI_DMA_BIDIRECTIONAL,
-			   DMA_ATTR_FORCE_CONTIGUOUS);
-}
-
 static void
 region_lmem_release(struct intel_memory_region *mem)
 {
-	release_fake_lmem_bar(mem);
 	io_mapping_fini(&mem->iomap);
 	intel_memory_region_release_buddy(mem);
 }
@@ -76,11 +21,6 @@ region_lmem_init(struct intel_memory_region *mem)
 {
 	int ret;
 
-	if (mem->i915->params.fake_lmem_start) {
-		ret = init_fake_lmem_bar(mem);
-		GEM_BUG_ON(ret);
-	}
-
 	if (!io_mapping_init_wc(&mem->iomap,
 				mem->io_start,
 				resource_size(&mem->region)))
@@ -101,42 +41,6 @@ const struct intel_memory_region_ops intel_region_lmem_ops = {
 	.create_object = __i915_gem_lmem_object_create,
 };
 
-struct intel_memory_region *
-intel_setup_fake_lmem(struct drm_i915_private *i915)
-{
-	struct pci_dev *pdev = i915->drm.pdev;
-	struct intel_memory_region *mem;
-	resource_size_t mappable_end;
-	resource_size_t io_start;
-	resource_size_t start;
-
-	GEM_BUG_ON(i915_ggtt_has_aperture(&i915->ggtt));
-	GEM_BUG_ON(!i915->params.fake_lmem_start);
-
-	/* Your mappable aperture belongs to me now! */
-	mappable_end = pci_resource_len(pdev, 2);
-	io_start = pci_resource_start(pdev, 2),
-	start = i915->params.fake_lmem_start;
-
-	mem = intel_memory_region_create(i915,
-					 start,
-					 mappable_end,
-					 PAGE_SIZE,
-					 io_start,
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
 static void get_legacy_lowmem_region(struct intel_uncore *uncore,
 				     u64 *start, u32 *size)
 {
diff --git a/drivers/gpu/drm/i915/intel_region_lmem.h b/drivers/gpu/drm/i915/intel_region_lmem.h
index 054e729035c1..6dbed8de3ce3 100644
--- a/drivers/gpu/drm/i915/intel_region_lmem.h
+++ b/drivers/gpu/drm/i915/intel_region_lmem.h
@@ -12,7 +12,4 @@ extern const struct intel_memory_region_ops intel_region_lmem_ops;
 
 struct intel_memory_region *i915_gem_setup_lmem(struct drm_i915_private *i915);
 
-struct intel_memory_region *
-intel_setup_fake_lmem(struct drm_i915_private *i915);
-
 #endif /* !__INTEL_REGION_LMEM_H */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
