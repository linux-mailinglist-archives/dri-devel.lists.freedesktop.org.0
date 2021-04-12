Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D1335BF7F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD57E6E079;
	Mon, 12 Apr 2021 09:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178DF89F5F;
 Mon, 12 Apr 2021 09:09:23 +0000 (UTC)
IronPort-SDR: sBbioArNEmqrVZ5/fYi26DfunvTmgpfbIMoFW4DKrOIvzOJ1+Hz5rVGwqEiPvLsaW9guq5URrR
 5LD3YmTxX4FA==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="193709705"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="193709705"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:22 -0700
IronPort-SDR: csC9CE3pBlhYt21b5lLNLtGW1CSJYoOlC4CSzZYxuvN6lE0XieutwqGF/5apLXxIh9wWtxNC/I
 cFBrz2jOmMLg==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423712610"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.5.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:21 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/19] drm/i915: Create stolen memory region from local memory
Date: Mon, 12 Apr 2021 10:05:10 +0100
Message-Id: <20210412090526.30547-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412090526.30547-1-matthew.auld@intel.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

Add "REGION_STOLEN" device info to dg1, create stolen memory
region from upper portion of local device memory, starting
from DSMBASE.

v2:
    - s/drm_info/drm_dbg; userspace likely doesn't care about stolen.
    - mem->type is only setup after the region probe, so setting the name
      as stolen-local or stolen-system based on this value won't work. Split
      system vs local stolen setup to fix this.
    - kill all the region->devmem/is_devmem stuff. We already differentiate
      the different types of stolen so such things shouldn't be needed
      anymore.

Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 99 +++++++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h |  3 +
 drivers/gpu/drm/i915/i915_pci.c            |  2 +-
 drivers/gpu/drm/i915/i915_reg.h            |  1 +
 drivers/gpu/drm/i915/intel_memory_region.c |  6 ++
 drivers/gpu/drm/i915/intel_memory_region.h |  5 +-
 6 files changed, 102 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index b0597de206de..56dd58bef5ee 100644
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
@@ -374,8 +383,9 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
 	}
 }
 
-static int i915_gem_init_stolen(struct drm_i915_private *i915)
+static int i915_gem_init_stolen(struct intel_memory_region *mem)
 {
+	struct drm_i915_private *i915 = mem->i915;
 	struct intel_uncore *uncore = &i915->uncore;
 	resource_size_t reserved_base, stolen_top;
 	resource_size_t reserved_total, reserved_size;
@@ -396,10 +406,10 @@ static int i915_gem_init_stolen(struct drm_i915_private *i915)
 		return 0;
 	}
 
-	if (resource_size(&intel_graphics_stolen_res) == 0)
+	if (resource_size(&mem->region) == 0)
 		return 0;
 
-	i915->dsm = intel_graphics_stolen_res;
+	i915->dsm = mem->region;
 
 	if (i915_adjust_stolen(i915, &i915->dsm))
 		return 0;
@@ -684,23 +694,36 @@ static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
 	return ret;
 }
 
+struct intel_memory_region *i915_stolen_region(struct drm_i915_private *i915)
+{
+	if (HAS_LMEM(i915))
+		return i915->mm.regions[INTEL_REGION_STOLEN_LMEM];
+
+	return i915->mm.regions[INTEL_REGION_STOLEN_SMEM];
+}
+
 struct drm_i915_gem_object *
 i915_gem_object_create_stolen(struct drm_i915_private *i915,
 			      resource_size_t size)
 {
-	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_STOLEN_SMEM],
+	return i915_gem_object_create_region(i915_stolen_region(i915),
 					     size, I915_BO_ALLOC_CONTIGUOUS);
 }
 
 static int init_stolen(struct intel_memory_region *mem)
 {
-	intel_memory_region_set_name(mem, "stolen");
+	if (HAS_LMEM(mem->i915)) {
+		if (!io_mapping_init_wc(&mem->iomap,
+					mem->io_start,
+					resource_size(&mem->region)))
+			return -EIO;
+	}
 
 	/*
 	 * Initialise stolen early so that we may reserve preallocated
 	 * objects for the BIOS to KMS transition.
 	 */
-	return i915_gem_init_stolen(mem->i915);
+	return i915_gem_init_stolen(mem);
 }
 
 static void release_stolen(struct intel_memory_region *mem)
@@ -714,13 +737,65 @@ static const struct intel_memory_region_ops i915_region_stolen_ops = {
 	.init_object = _i915_gem_object_stolen_init,
 };
 
+static struct intel_memory_region *
+setup_lmem_stolen(struct drm_i915_private *i915)
+{
+	struct intel_uncore *uncore = &i915->uncore;
+	struct pci_dev *pdev = i915->drm.pdev;
+	struct intel_memory_region *mem;
+	resource_size_t io_start;
+	resource_size_t lmem_size;
+	u64 lmem_base;
+
+	if (!IS_DGFX(i915))
+		return ERR_PTR(-ENODEV);
+
+	lmem_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
+	lmem_size = pci_resource_len(pdev, 2) - lmem_base;
+	io_start = pci_resource_start(pdev, 2) + lmem_base;
+
+	mem = intel_memory_region_create(i915, lmem_base, lmem_size,
+					 I915_GTT_PAGE_SIZE_4K, io_start,
+					 &i915_region_stolen_ops);
+	if (IS_ERR(mem))
+		return mem;
+
+	drm_dbg(&i915->drm, "Stolen Local memory: %pR\n", &mem->region);
+	drm_dbg(&i915->drm, "Stolen Local memory IO start: %pa\n",
+		&mem->io_start);
+
+	intel_memory_region_set_name(mem, "stolen-local");
+
+	return mem;
+}
+
+static struct intel_memory_region*
+setup_smem_stolen(struct drm_i915_private *i915)
+{
+	struct intel_memory_region *mem;
+
+	mem = intel_memory_region_create(i915,
+					 intel_graphics_stolen_res.start,
+					 resource_size(&intel_graphics_stolen_res),
+					 PAGE_SIZE, 0,
+					 &i915_region_stolen_ops);
+	if (IS_ERR(mem))
+		return mem;
+
+	intel_memory_region_set_name(mem, "stolen-system");
+
+	return mem;
+}
+
 struct intel_memory_region *i915_gem_stolen_setup(struct drm_i915_private *i915)
 {
-	return intel_memory_region_create(i915,
-					  intel_graphics_stolen_res.start,
-					  resource_size(&intel_graphics_stolen_res),
-					  PAGE_SIZE, 0,
-					  &i915_region_stolen_ops);
+	struct intel_memory_region *mem;
+
+	mem = setup_lmem_stolen(i915);
+	if (mem == ERR_PTR(-ENODEV))
+		mem = setup_smem_stolen(i915);
+
+	return mem;
 }
 
 struct drm_i915_gem_object *
@@ -728,7 +803,7 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 					       resource_size_t stolen_offset,
 					       resource_size_t size)
 {
-	struct intel_memory_region *mem = i915->mm.regions[INTEL_REGION_STOLEN_SMEM];
+	struct intel_memory_region *mem = i915_stolen_region(i915);
 	struct drm_i915_gem_object *obj;
 	struct drm_mm_node *stolen;
 	int ret;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
index b03489706796..2d1ce7fec61c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
@@ -22,6 +22,9 @@ int i915_gem_stolen_insert_node_in_range(struct drm_i915_private *dev_priv,
 void i915_gem_stolen_remove_node(struct drm_i915_private *dev_priv,
 				 struct drm_mm_node *node);
 struct intel_memory_region *i915_gem_stolen_setup(struct drm_i915_private *i915);
+
+struct intel_memory_region *i915_stolen_region(struct drm_i915_private *i915);
+
 struct drm_i915_gem_object *
 i915_gem_object_create_stolen(struct drm_i915_private *dev_priv,
 			      resource_size_t size);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 480553746794..53f5d1e6daef 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -906,7 +906,7 @@ static const struct intel_device_info rkl_info = {
 
 #define GEN12_DGFX_FEATURES \
 	GEN12_FEATURES, \
-	.memory_regions = REGION_SMEM | REGION_LMEM, \
+	.memory_regions = REGION_SMEM | REGION_LMEM | REGION_STOLEN_LMEM, \
 	.has_master_unit_irq = 1, \
 	.has_llc = 0, \
 	.has_snoop = 1, \
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e087bcd21911..4108f2a7ebfa 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -12191,6 +12191,7 @@ enum skl_power_gate {
 #define GEN12_GLOBAL_MOCS(i)	_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
 
 #define GEN12_GSMBASE			_MMIO(0x108100)
+#define GEN12_DSMBASE			_MMIO(0x1080C0)
 
 /* gamt regs */
 #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index bf837b6bb185..ac90b76a3fa0 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -22,6 +22,10 @@ static const struct {
 		.class = INTEL_MEMORY_STOLEN_SYSTEM,
 		.instance = 0,
 	},
+	[INTEL_REGION_STOLEN_LMEM] = {
+		.class = INTEL_MEMORY_STOLEN_LOCAL,
+		.instance = 0,
+	},
 };
 
 struct intel_memory_region *
@@ -278,6 +282,8 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 		case INTEL_MEMORY_SYSTEM:
 			mem = i915_gem_shmem_setup(i915);
 			break;
+		case INTEL_MEMORY_STOLEN_LOCAL:
+			fallthrough;
 		case INTEL_MEMORY_STOLEN_SYSTEM:
 			mem = i915_gem_stolen_setup(i915);
 			break;
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index edd49067c8ca..4c8ec15af55f 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -26,18 +26,21 @@ enum intel_memory_type {
 	INTEL_MEMORY_SYSTEM = 0,
 	INTEL_MEMORY_LOCAL,
 	INTEL_MEMORY_STOLEN_SYSTEM,
+	INTEL_MEMORY_STOLEN_LOCAL,
 };
 
 enum intel_region_id {
 	INTEL_REGION_SMEM = 0,
 	INTEL_REGION_LMEM,
 	INTEL_REGION_STOLEN_SMEM,
+	INTEL_REGION_STOLEN_LMEM,
 	INTEL_REGION_UNKNOWN, /* Should be last */
 };
 
 #define REGION_SMEM     BIT(INTEL_REGION_SMEM)
 #define REGION_LMEM     BIT(INTEL_REGION_LMEM)
 #define REGION_STOLEN_SMEM   BIT(INTEL_REGION_STOLEN_SMEM)
+#define REGION_STOLEN_LMEM   BIT(INTEL_REGION_STOLEN_LMEM)
 
 #define I915_ALLOC_MIN_PAGE_SIZE  BIT(0)
 #define I915_ALLOC_CONTIGUOUS     BIT(1)
@@ -82,7 +85,7 @@ struct intel_memory_region {
 	u16 type;
 	u16 instance;
 	enum intel_region_id id;
-	char name[8];
+	char name[16];
 
 	struct list_head reserved;
 
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
