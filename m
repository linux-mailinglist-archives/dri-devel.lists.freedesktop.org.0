Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9CE99FF70
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201EF10E650;
	Wed, 16 Oct 2024 03:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLHFyGcB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A5A10E65A;
 Wed, 16 Oct 2024 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049101; x=1760585101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0/WMZvPOHopheOFLZcaLkL05mgv9PLVtBY6jcstOOrU=;
 b=YLHFyGcBH6jBuylPhI4yLG4SiZ3ysz54qtCURRNlv9gYGVkAur2BfqTw
 wlQvmnudSvJr77/H5QKJiR6LV1Wv72Z5csakB3rcSxu5zWQMP+Ekncw7g
 QXNDarC5OiRuOZqhT+rMWXFEhxTmCpIIrdudeRxHrJVK8skmEoh/M9O/E
 JYe8Z5z4lh856KrQWfnvooGkqCdOY/VMOYJPC2r+z4YBMm+kSaZngj0vN
 ohREfVsC3Mu/7Kp6UGkF1QNTHWSXlf/js6rLaZ6ky2AG4tZCafDdyJLu7
 E1ACcbqd4DaJcmx03hRbtxF7L5LKVvL9RRLY3UQYr9202FcMn1/kN7s49 Q==;
X-CSE-ConnectionGUID: JOWhFSUFTiaWnmXVAjLU/A==
X-CSE-MsgGUID: 10XpccESQoO1GR3LISsADA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056454"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056454"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: gvFcycOKTdyEFRdY4Hx1jQ==
X-CSE-MsgGUID: Lh07rNieRVuo5bR0oo9FhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930271"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 20/29] drm/xe: Add drm_pagemap ops to SVM
Date: Tue, 15 Oct 2024 20:25:09 -0700
Message-Id: <20241016032518.539495-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
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

Add support for mapping device pages to Xe SVM.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  7 +++++++
 drivers/gpu/drm/xe/xe_svm.c          | 30 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2ac5de7751c9..72264f9f64d7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,8 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "drm_pagemap.h"
+
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_lmtt_types.h"
@@ -106,6 +108,11 @@ struct xe_mem_region {
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
index b33fd42d035b..4f01941b2cc2 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -431,6 +431,32 @@ static const u64 fault_chunk_sizes[] = {
 	SZ_4K,
 };
 
+static struct drm_pagemap_dma_addr
+xe_drm_pagemap_map_dma(struct drm_pagemap *dpagemap,
+		       struct device *dev,
+		       struct page *page,
+		       unsigned int order,
+		       enum dma_data_direction dir)
+{
+	struct device *pgmap_dev = dpagemap->dev;
+	dma_addr_t addr;
+	enum drm_interconnect_protocol prot;
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
 int xe_svm_init(struct xe_vm *vm)
 {
 	spin_lock_init(&vm->svm.garbage_collector.lock);
@@ -572,6 +598,10 @@ int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
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

