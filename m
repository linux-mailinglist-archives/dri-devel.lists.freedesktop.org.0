Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616884D46DC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 13:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038DA10EA62;
	Thu, 10 Mar 2022 12:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C7710EA62;
 Thu, 10 Mar 2022 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646915301; x=1678451301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VUQ6g3lPgSeGsEuxVpZMwS9IXMNC21obaEpwIjwjBck=;
 b=MjxpYjtw+JmSTGKOAuKbXbHsy5UiYi1OpzsNJ93QMt4OyV+QuoXsCnRu
 Ep1kj1syjdnicXRnnvTaBj+Bdt+R6p7iukRYC7AvhDdSzueISrNW/gaWg
 fNjuH7xQdKYTlRb4yynV1wRKGLFR1iFo9VHgAwixTfl+dYvULnSXd2Nv+
 xq8lIk7+aC/YapyT1dGXSJK4udeQGnYRzvoM9eSXnHF+Qgh1823GtQEWt
 hdCILRbPtxAj4cOTxpaaHErU/OgPcoOFICKNP2U/mc4+VV3tVMQH6Ch0F
 wLlA3u9CyluKJAEJyP2UvPYvItx6nDFnq5NEKfL8s5+9TxK+WPKTk2kOd g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="341665152"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="341665152"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:21 -0800
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="496237722"
Received: from tcuddihy-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.1])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:20 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/8] drm/i915/stolen: don't treat small BAR as an error
Date: Thu, 10 Mar 2022 12:27:45 +0000
Message-Id: <20220310122751.89693-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310122751.89693-1-matthew.auld@intel.com>
References: <20220310122751.89693-1-matthew.auld@intel.com>
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
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>

On client platforms with reduced LMEM BAR, we should be able to continue
with driver load with reduced io_size. Instead of using the BAR size to
determine the how large stolen should be, we should instead use the
ADDR_RANGE register to figure this out(at least on platforms like DG2).
For simplicity we don't attempt to support partially mappable stolen.

Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Co-developed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 48 ++++++++++++++++------
 drivers/gpu/drm/i915/i915_reg.h            |  3 ++
 2 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 0bf8f61134af..6df1600708a7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -12,6 +12,8 @@
 
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
+#include "gt/intel_gt.h"
+#include "gt/intel_region_lmem.h"
 #include "i915_drv.h"
 #include "i915_gem_stolen.h"
 #include "i915_reg.h"
@@ -750,9 +752,9 @@ static int init_stolen_lmem(struct intel_memory_region *mem)
 	if (GEM_WARN_ON(resource_size(&mem->region) == 0))
 		return -ENODEV;
 
-	if (!io_mapping_init_wc(&mem->iomap,
-				mem->io_start,
-				mem->io_size))
+	if (mem->io_size && !io_mapping_init_wc(&mem->iomap,
+						mem->io_start,
+						mem->io_size))
 		return -EIO;
 
 	/*
@@ -773,7 +775,8 @@ static int init_stolen_lmem(struct intel_memory_region *mem)
 
 static int release_stolen_lmem(struct intel_memory_region *mem)
 {
-	io_mapping_fini(&mem->iomap);
+	if (mem->io_size)
+		io_mapping_fini(&mem->iomap);
 	i915_gem_cleanup_stolen(mem->i915);
 	return 0;
 }
@@ -790,25 +793,43 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 {
 	struct intel_uncore *uncore = &i915->uncore;
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+	resource_size_t dsm_size, dsm_base, lmem_size;
 	struct intel_memory_region *mem;
+	resource_size_t io_start, io_size;
 	resource_size_t min_page_size;
-	resource_size_t io_start;
-	resource_size_t lmem_size;
-	u64 lmem_base;
 
-	lmem_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
-	if (GEM_WARN_ON(lmem_base >= pci_resource_len(pdev, 2)))
+	if (WARN_ON_ONCE(instance))
 		return ERR_PTR(-ENODEV);
 
-	lmem_size = pci_resource_len(pdev, 2) - lmem_base;
-	io_start = pci_resource_start(pdev, 2) + lmem_base;
+	/* Use DSM base address instead for stolen memory */
+	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
+	if (IS_DG1(uncore->i915)) {
+		lmem_size = pci_resource_len(pdev, 2);
+		if (WARN_ON(lmem_size < dsm_base))
+			return ERR_PTR(-ENODEV);
+	} else {
+		resource_size_t lmem_range;
+
+		lmem_range = intel_gt_read_register(&i915->gt0, XEHPSDV_TILE0_ADDR_RANGE) & 0xFFFF;
+		lmem_size = lmem_range >> XEHPSDV_TILE_LMEM_RANGE_SHIFT;
+		lmem_size *= SZ_1G;
+	}
+
+	dsm_size = lmem_size - dsm_base;
+	if (pci_resource_len(pdev, 2) < lmem_size) {
+		io_start = 0;
+		io_size = 0;
+	} else {
+		io_start = pci_resource_start(pdev, 2) + dsm_base;
+		io_size = dsm_size;
+	}
 
 	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
 						I915_GTT_PAGE_SIZE_4K;
 
-	mem = intel_memory_region_create(i915, lmem_base, lmem_size,
+	mem = intel_memory_region_create(i915, dsm_base, dsm_size,
 					 min_page_size,
-					 io_start, lmem_size,
+					 io_start, io_size,
 					 type, instance,
 					 &i915_region_stolen_lmem_ops);
 	if (IS_ERR(mem))
@@ -822,6 +843,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 
 	drm_dbg(&i915->drm, "Stolen Local memory IO start: %pa\n",
 		&mem->io_start);
+	drm_dbg(&i915->drm, "Stolen Local DSM base: %pa\n", &dsm_base);
 
 	intel_memory_region_set_name(mem, "stolen-local");
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 25ecddc706af..0183823b4c55 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8466,6 +8466,9 @@ enum skl_power_gate {
 #define   SGGI_DIS			REG_BIT(15)
 #define   SGR_DIS			REG_BIT(13)
 
+#define XEHPSDV_TILE0_ADDR_RANGE	_MMIO(0x4900)
+#define   XEHPSDV_TILE_LMEM_RANGE_SHIFT  8
+
 #define XEHPSDV_FLAT_CCS_BASE_ADDR	_MMIO(0x4910)
 #define   XEHPSDV_CCS_BASE_SHIFT	8
 
-- 
2.34.1

