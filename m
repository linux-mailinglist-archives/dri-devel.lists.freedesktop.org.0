Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617652C6537
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E33C6ECEA;
	Fri, 27 Nov 2020 12:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908BC6ECEA;
 Fri, 27 Nov 2020 12:11:07 +0000 (UTC)
IronPort-SDR: NohzWyK+P39a7gLEsUv6H5B2nutJuD38abgxC10mW6NGTETRKN51hHDVlUdAXluxCqDGr+Yi1c
 VZnwNTBMhTHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092840"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092840"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:07 -0800
IronPort-SDR: HLjAWLmcrUY8D9EfDoSpr1xf7p+uf9sth5+eFouWvGdNhTFWDy/L/maXc6YGN4luZijmD8YrF2
 X3VU3yhxpYJg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029657"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:02 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 113/162] drm/i915: Create stolen memory region from local
 memory
Date: Fri, 27 Nov 2020 12:06:29 +0000
Message-Id: <20201127120718.454037-114-matthew.auld@intel.com>
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
	Matthew Brost <matthew.brost@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Sudeep Dutt <sudeep.dutt@intel.com>,
	Chris P Wilson <chris.p.wilson@intel.com>,
	CQ Tang <cq.tang@intel.com>,
	Venkata S Dhanalakota <venkata.s.dhanalakota@intel.com>,
	dri-devel@lists.freedesktop.org, Neel Desai <neel.desai@intel.com>,
	Francesco <francesco.balestrieri@intel.com>,
	Balestrieri@freedesktop.org,
	Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

Add "REGION_STOLEN" device info to dg1, create stolen memory
region from upper portion of local device memory, starting
from DSMBASE.

The memory region is marked with "is_devmem=true".

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Cc: Chris P Wilson <chris.p.wilson@intel.com>
Cc: Balestrieri, Francesco <francesco.balestrieri@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Venkata S Dhanalakota <venkata.s.dhanalakota@intel.com>
Cc: Neel Desai <neel.desai@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: CQ Tang <cq.tang@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c   |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h   |  7 +++
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 56 +++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_pci.c            |  2 +-
 drivers/gpu/drm/i915/i915_reg.h            |  1 +
 drivers/gpu/drm/i915/intel_memory_region.c |  5 ++
 drivers/gpu/drm/i915/intel_memory_region.h |  2 +-
 7 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index 71c07e1f6f26..b2fd2bc862c0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -111,8 +111,8 @@ int i915_gem_object_lmem_pread(struct drm_i915_gem_object *obj,
 	return ret;
 }
 
-static int i915_gem_object_lmem_pwrite(struct drm_i915_gem_object *obj,
-				       const struct drm_i915_gem_pwrite *arg)
+int i915_gem_object_lmem_pwrite(struct drm_i915_gem_object *obj,
+				const struct drm_i915_gem_pwrite *arg)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct intel_runtime_pm *rpm = &i915->runtime_pm;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
index e11e0545e39c..c59aa6c014c7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
@@ -11,9 +11,16 @@
 struct drm_i915_private;
 struct drm_i915_gem_object;
 struct intel_memory_region;
+struct drm_i915_gem_pread;
+struct drm_i915_gem_pwrite;
 
 extern const struct drm_i915_gem_object_ops i915_gem_lmem_obj_ops;
 
+int i915_gem_object_lmem_pread(struct drm_i915_gem_object *obj,
+			       const struct drm_i915_gem_pread *args);
+int i915_gem_object_lmem_pwrite(struct drm_i915_gem_object *obj,
+				const struct drm_i915_gem_pwrite *args);
+
 void __iomem *
 i915_gem_object_lmem_io_map(struct drm_i915_gem_object *obj,
 			    unsigned long n,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 0ddf48e472a0..633745336f40 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -10,6 +10,7 @@
 #include <drm/drm_mm.h>
 #include <drm/i915_drm.h>
 
+#include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
 #include "i915_drv.h"
 #include "i915_gem_stolen.h"
@@ -121,6 +122,14 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
 		}
 	}
 
+	/*
+	 * With device local memory, we don't need to check the address range,
+	 * this is device memory physical address, could overlap with system
+	 * memory.
+	 */
+	if (HAS_LMEM(i915))
+		return 0;
+
 	/*
 	 * Verify that nothing else uses this physical address. Stolen
 	 * memory should be reserved by the BIOS and hidden from the
@@ -607,7 +616,7 @@ static void i915_gem_object_put_pages_stolen(struct drm_i915_gem_object *obj,
 	kfree(pages);
 }
 
-static const struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
+static struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
 	.name = "i915_gem_object_stolen",
 	.get_pages = i915_gem_object_get_pages_stolen,
 	.put_pages = i915_gem_object_put_pages_stolen,
@@ -716,7 +725,19 @@ i915_gem_object_create_stolen(struct drm_i915_private *i915,
 
 static int init_stolen(struct intel_memory_region *mem)
 {
-	intel_memory_region_set_name(mem, "stolen");
+	if (mem->type == INTEL_MEMORY_STOLEN_SYSTEM)
+		intel_memory_region_set_name(mem, "stolen-system");
+	else
+		intel_memory_region_set_name(mem, "stolen-local");
+
+	if (HAS_LMEM(mem->i915)) {
+		i915_gem_object_stolen_ops.pread = i915_gem_object_lmem_pread;
+		i915_gem_object_stolen_ops.pwrite = i915_gem_object_lmem_pwrite;
+		if (!io_mapping_init_wc(&mem->iomap,
+					mem->io_start,
+					resource_size(&mem->region)))
+			return -EIO;
+	}
 
 	/*
 	 * Initialise stolen early so that we may reserve preallocated
@@ -736,8 +757,39 @@ static const struct intel_memory_region_ops i915_region_stolen_ops = {
 	.create_object = i915_gem_object_create_stolen_region,
 };
 
+static
+struct intel_memory_region *setup_lmem_stolen(struct drm_i915_private *i915)
+{
+	struct intel_uncore *uncore = &i915->uncore;
+	struct pci_dev *pdev = i915->drm.pdev;
+	struct intel_memory_region *mem;
+	resource_size_t io_start;
+	resource_size_t lmem_size;
+	u64 lmem_base;
+
+	lmem_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
+	lmem_size = pci_resource_len(pdev, 2) - lmem_base;
+	io_start = pci_resource_start(pdev, 2) + lmem_base;
+
+	mem = intel_memory_region_create(i915, lmem_base, lmem_size,
+					 I915_GTT_PAGE_SIZE_4K, io_start,
+					 &i915_region_stolen_ops);
+	if (!IS_ERR(mem)) {
+		DRM_INFO("Intel graphics stolen LMEM: %pR\n", &mem->region);
+		DRM_INFO("Intel graphics stolen LMEM IO start: %llx\n",
+			 (u64)mem->io_start);
+		/* this is real device memory */
+		mem->is_devmem = true;
+	}
+
+	return mem;
+}
+
 struct intel_memory_region *i915_gem_stolen_setup(struct drm_i915_private *i915)
 {
+	if (HAS_LMEM(i915))
+		return setup_lmem_stolen(i915);
+
 	return intel_memory_region_create(i915,
 					  intel_graphics_stolen_res.start,
 					  resource_size(&intel_graphics_stolen_res),
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 8243178a56f9..c3d9b36ef651 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -907,7 +907,7 @@ static const struct intel_device_info rkl_info = {
 
 #define GEN12_DGFX_FEATURES \
 	GEN12_FEATURES, \
-	.memory_regions = REGION_SMEM | REGION_LMEM, \
+	.memory_regions = REGION_SMEM | REGION_LMEM | REGION_STOLEN_LMEM, \
 	.has_master_unit_irq = 1, \
 	.has_llc = 0, \
 	.has_snoop = 1, \
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 0e01ea0cb0a4..3c8350f108e4 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -12067,6 +12067,7 @@ enum skl_power_gate {
 #define   LMEM_ENABLE			(1 << 31)
 
 #define GEN12_GSMBASE			_MMIO(0x108100)
+#define GEN12_DSMBASE			_MMIO(0x1080C0)
 
 /* gamt regs */
 #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 043541d409bd..c7a1d84e7ee8 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -19,6 +19,10 @@ const struct intel_memory_region_info intel_region_map[] = {
                .class = INTEL_MEMORY_STOLEN_SYSTEM,
                .instance = 0,
        },
+       [INTEL_REGION_STOLEN_LMEM] = {
+	       .class = INTEL_MEMORY_STOLEN_LOCAL,
+	       .instance = 0,
+       },
 };
 
 struct intel_memory_region *
@@ -311,6 +315,7 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 		case INTEL_MEMORY_SYSTEM:
 			mem = i915_gem_shmem_setup(i915);
 			break;
+		case INTEL_MEMORY_STOLEN_LOCAL: /* fallthrough */
 		case INTEL_MEMORY_STOLEN_SYSTEM:
 			mem = i915_gem_stolen_setup(i915);
 			break;
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index b7a9e34faaf1..8da82cb2afe3 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -93,7 +93,7 @@ struct intel_memory_region {
 	u16 type;
 	u16 instance;
 	enum intel_region_id id;
-	char name[8];
+	char name[16];
 	struct intel_gt *gt; /* GT closest to this region. */
 	bool is_devmem;	/* true for device memory */
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
