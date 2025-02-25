Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB1AA4344F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A551510E575;
	Tue, 25 Feb 2025 04:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTYxHjq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E25B10E54F;
 Tue, 25 Feb 2025 04:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458535; x=1771994535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1jMNmkpmhWLkCJX4fbu54jL5j5Smzlm89LWnT/fZTuE=;
 b=XTYxHjq2TUQTXQww20ttAGpiGBlO0DQ8cbaDerVHh5tCwLlhc5qacScF
 Q86EMoFmhS+wsH6yOoYI0RM2Yiia5AjRJ3GOC+QC80youzmhKsv0m4sNj
 HnL8GWIg0wC1mk7Z7fugcEDHlfGK8WeefaRdH8/ydnMtlM2l1cL+I+YiO
 ZgkAirpsD2YylIYfTnoL77seKvpUEvfQAyEO0MHOJGstLBJyVTZRtzHwV
 oRDN6c1H/ni4dECHDnKLaOzS5Mo10AIliQx6B6YbPbgopLlCyBFpKCZx4
 +b+BEXBGnMgD05idAjIAqF0/AUpL1aXKFHdg9lekFl3VE1m8oPkQZBUIc Q==;
X-CSE-ConnectionGUID: LX4uuytTRh+8jLCrPuLyFA==
X-CSE-MsgGUID: gu64PyYiR3mvD0NxUkX8hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885042"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885042"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:15 -0800
X-CSE-ConnectionGUID: 8Tt5boorSReOJ+SQ30j1Ug==
X-CSE-MsgGUID: GJMyM6aMQgaplhKzJgeWSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290314"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 23/32] drm/xe: Add drm_pagemap ops to SVM
Date: Mon, 24 Feb 2025 20:43:02 -0800
Message-Id: <20250225044311.3178695-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Add support for mapping device pages to Xe SVM by attaching drm_pagemap
to a memory region, which is then linked to a GPU SVM devmem allocation.
This enables GPU SVM to derive the device page address.

v3:
 - Better commit message (Thomas)
 - New drm_pagemap.h location
v5:
 - s/xe_mem_region/xe_vram_region (Rebase)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  6 +++
 drivers/gpu/drm/xe/xe_svm.c          | 57 ++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 325cb453167e..6b31a290ae09 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
@@ -108,6 +109,11 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
+	/**
+	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
+	 * pages of this tile.
+	 */
+	struct drm_pagemap dpagemap;
 	/**
 	 * @hpa_base: base host physical address
 	 *
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index f5854fa6e415..7a6e12377f05 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -288,6 +288,33 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 	up_write(&vm->lock);
 }
 
+static struct xe_vram_region *page_to_vr(struct page *page)
+{
+	return container_of(page->pgmap, struct xe_vram_region, pagemap);
+}
+
+static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
+{
+	return container_of(vr, struct xe_tile, mem.vram);
+}
+
+static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
+				     struct page *page)
+{
+	u64 dpa;
+	struct xe_tile *tile = vr_to_tile(vr);
+	u64 pfn = page_to_pfn(page);
+	u64 offset;
+
+	xe_tile_assert(tile, is_device_private_page(page));
+	xe_tile_assert(tile, (pfn << PAGE_SHIFT) >= vr->hpa_base);
+
+	offset = (pfn << PAGE_SHIFT) - vr->hpa_base;
+	dpa = vr->dpa_base + offset;
+
+	return dpa;
+}
+
 static const struct drm_gpusvm_ops gpusvm_ops = {
 	.range_alloc = xe_svm_range_alloc,
 	.range_free = xe_svm_range_free,
@@ -456,6 +483,32 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+static struct drm_pagemap_device_addr
+xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
+			  struct device *dev,
+			  struct page *page,
+			  unsigned int order,
+			  enum dma_data_direction dir)
+{
+	struct device *pgmap_dev = dpagemap->dev;
+	enum drm_interconnect_protocol prot;
+	dma_addr_t addr;
+
+	if (pgmap_dev == dev) {
+		addr = xe_vram_region_page_to_dpa(page_to_vr(page), page);
+		prot = XE_INTERCONNECT_VRAM;
+	} else {
+		addr = DMA_MAPPING_ERROR;
+		prot = 0;
+	}
+
+	return drm_pagemap_device_addr_encode(addr, prot, order, dir);
+}
+
+static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
+	.device_map = xe_drm_pagemap_device_map,
+};
+
 /**
  * xe_devm_add: Remap and provide memmap backing for device memory
  * @tile: tile that the memory region belongs to
@@ -488,6 +541,10 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 	vr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
 	vr->pagemap.owner = xe_svm_devm_owner(xe);
 	addr = devm_memremap_pages(dev, &vr->pagemap);
+
+	vr->dpagemap.dev = dev;
+	vr->dpagemap.ops = &xe_drm_pagemap_ops;
+
 	if (IS_ERR(addr)) {
 		devm_release_mem_region(dev, res->start, resource_size(res));
 		ret = PTR_ERR(addr);
-- 
2.34.1

