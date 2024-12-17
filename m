Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 199539F5A7E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE1110EAC9;
	Tue, 17 Dec 2024 23:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzKaV5sL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3973910EA8A;
 Tue, 17 Dec 2024 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478393; x=1766014393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K7dp6BODpL1ehhiS/+SyzjJQ/tv1tKiuHsVmGUjXv5U=;
 b=XzKaV5sLVFvyj2vrUDIN7tLr3z0fR+mzMBN1Ys9mtpmUOsSabi90OjcO
 E8SXj/3tni3/5VWB2Z/b0O12ntzs1mVcxHh69cWcZyv3jwEQmZpRXG8hA
 BY7Li0S1QGb7iQQZbg8FYlmJij7PfKbWZLFkFaKvG8fEKWuYjbFdaTVDD
 IcM2jhQzppPgIxt0Z/5R2mBlE0jTsBVY31FfEMR30YMctz7XlwWXN23l9
 bV2jquhldE0tsgHcm0ZW+Jrb0kEHkMM9Dq7xOm5cc6rHUeaA31Cb9XZEK
 KplbBnoHViXpNScnSrPKvaGUMMmOma4Q2WNlo5Gbpg5Z1hIYDsFnS9C2m w==;
X-CSE-ConnectionGUID: NYz6Um3zRxqEiwTr2HJbTw==
X-CSE-MsgGUID: ePH6XsJDQwm23yNaXXPT6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517451"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:12 -0800
X-CSE-ConnectionGUID: HSdyOzH/T3KEGQwTr757HQ==
X-CSE-MsgGUID: rZZ/W/ZQSPe9a5ZtkbJDQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273452"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 21/30] drm/xe: Add drm_pagemap ops to SVM
Date: Tue, 17 Dec 2024 15:33:39 -0800
Message-Id: <20241217233348.3519726-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_device_types.h |  7 +++++++
 drivers/gpu/drm/xe/xe_svm.c          | 30 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b949a960cebb..b76d08df13ef 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,8 +10,10 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
+
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_lmtt_types.h"
@@ -104,6 +106,11 @@ struct xe_mem_region {
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
index 2860e54bb035..faeacf0ccdaa 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -449,6 +449,32 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 }
 
 #if IS_ENABLED(CONFIG_XE_DEVMEM_MIRROR)
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
 /**
  * xe_devm_add: Remap and provide memmap backing for device memory
  * @tile: tile that the memory region belongs to
@@ -481,6 +507,10 @@ int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
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

