Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10C4A224C3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99EC10E8BC;
	Wed, 29 Jan 2025 19:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/a2lAhl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5841110E899;
 Wed, 29 Jan 2025 19:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180285; x=1769716285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n6Uk3SWMTbmpi00IRp+epcZBXK1EnB559Dv4RCewWIA=;
 b=T/a2lAhltz+RyWkEiAlb0BkQi1UloekmVtE+YR/X7693Za/3pW5fCIz2
 Nqm0VINEylK+v6uCMRpnO+iQDbtNowUIUE59nefohwvMa0O/gnQ8S55uq
 Ua8X/ETX+AH/OkyThRUJd6js4zjgV6URP1S+rOCGMu0hB0iT6MQy+dNBU
 Q/KG28/6aixmUvFe6NV9aM4jPJ1v8r51IEFy+z971lfKuE7qCs38iWXgA
 1J7m5fcyVQ6FPYkgmPOyLk/Z8Io6iuvRKEd/SXrBT5VaH/ZFBrPjQ0YDi
 8/at/FhF//Sddk4Fjk9w9By26VT+uCc14UisBmbvieAn/NPphvEcYarma g==;
X-CSE-ConnectionGUID: n1Pg6LCaSq+NRia19Ji6eA==
X-CSE-MsgGUID: /8jfem0QSLOhQPmh8NlhGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132847"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132847"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:25 -0800
X-CSE-ConnectionGUID: N6U7nzg4QOC2AzKIa39JAg==
X-CSE-MsgGUID: QDmEEasTSby1WoTgJvH5xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392177"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 23/33] drm/xe: Add drm_pagemap ops to SVM
Date: Wed, 29 Jan 2025 11:52:02 -0800
Message-Id: <20250129195212.745731-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_svm.c          | 31 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index da5bf145324b..eb3702db5c17 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
@@ -106,6 +107,11 @@ struct xe_mem_region {
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
index 985ac20c5b07..869a155fc9f7 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -450,6 +450,33 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+static struct drm_pagemap_dma_addr
+xe_drm_pagemap_map_dma(struct drm_pagemap *dpagemap,
+		       struct device *dev,
+		       struct page *page,
+		       unsigned int order,
+		       enum dma_data_direction dir)
+{
+	struct device *pgmap_dev = dpagemap->dev;
+	enum drm_interconnect_protocol prot;
+	dma_addr_t addr;
+
+	if (pgmap_dev == dev) {
+		addr = xe_mem_region_page_to_dpa(page_to_mr(page), page);
+		prot = XE_INTERCONNECT_VRAM;
+	} else {
+		addr = DMA_MAPPING_ERROR;
+		prot = 0;
+	}
+
+	return drm_pagemap_dma_addr_encode(addr, prot, order, dir);
+}
+
+static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
+	.map_dma = xe_drm_pagemap_map_dma,
+};
+
+>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)
 /**
  * xe_devm_add: Remap and provide memmap backing for device memory
  * @tile: tile that the memory region belongs to
@@ -482,6 +509,10 @@ int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
 	mr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
 	mr->pagemap.owner = xe_svm_devm_owner(xe);
 	addr = devm_memremap_pages(dev, &mr->pagemap);
+
+	mr->dpagemap.dev = dev;
+	mr->dpagemap.ops = &xe_drm_pagemap_ops;
+
 	if (IS_ERR(addr)) {
 		devm_release_mem_region(dev, res->start, resource_size(res));
 		ret = PTR_ERR(addr);
-- 
2.34.1

