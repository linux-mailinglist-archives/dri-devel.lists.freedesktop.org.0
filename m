Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2CA53FDB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF71610E8BC;
	Thu,  6 Mar 2025 01:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LH7bg53V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5305710E891;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=97VcfDW3VxJ8qIPx+i4Rs33FxXAoqElrkvoCN7sqtJw=;
 b=LH7bg53V7c45ovylVliaa2jweRcK0wJfRJbXSKf1kEIJvu8P8Vc7vpKx
 hHWoeaRynExTRaeCtE8JsSmKDF44lK/9M64l0WyVb7/IZzSq557PEX0xg
 HSGJSl8zVjCiJafrL1jNXt5+wHJ72eemeWuCiEIeskOqFxApxsWwfjFA/
 vnjfuTVaCVxDQ61mtsRCHhMMGPH5YXW57rwSEUPL5dm2sOiCO6jt/pLAr
 BezDOf3l34l0eZA577rfDFV0ZIANPQGcIysKkze6nS7kEpsN+W4u3X0fB
 jTRDa9JQqszkeCcJGsvo4mszk/8BJvpCGUYvWoAYUM/fv6knC/owEUkaW g==;
X-CSE-ConnectionGUID: zVv8qBTWSIOR+fS6KlFJTQ==
X-CSE-MsgGUID: Gt2uShlpSIWYAGkA9l17DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427338"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427338"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
X-CSE-ConnectionGUID: dNmjSYPmRA6AecWhfXEjXQ==
X-CSE-MsgGUID: r3vF7sR0QaOjJzKWMDYy1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063263"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 10/32] drm/xe: Add dma_addr res cursor
Date: Wed,  5 Mar 2025 17:26:35 -0800
Message-Id: <20250306012657.3505757-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
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

Add dma_addr res cursor which walks an array of drm_pagemap_dma_addr.
Useful for SVM ranges and programing page tables.

v3:
 - Better commit message (Thomas)
 - Use new drm_pagemap.h location
v7:
 - Fix kernel doc (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_res_cursor.h | 123 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h        |   4 +
 2 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index dca374b6521c..d1a403cfb628 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -26,6 +26,7 @@
 
 #include <linux/scatterlist.h>
 
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_resource.h>
@@ -34,17 +35,38 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_macros.h"
+#include "xe_svm.h"
 #include "xe_ttm_vram_mgr.h"
 
-/* state back for walking over vram_mgr, stolen_mgr, and gtt_mgr allocations */
+/**
+ * struct xe_res_cursor - state for walking over dma mapping, vram_mgr,
+ * stolen_mgr, and gtt_mgr allocations
+ */
 struct xe_res_cursor {
+	/** @start: Start of cursor */
 	u64 start;
+	/** @size: Size of the current segment. */
 	u64 size;
+	/** @remaining: Remaining bytes in cursor */
 	u64 remaining;
+	/** @node: Opaque point current node cursor */
 	void *node;
+	/** @mem_type: Memory type */
 	u32 mem_type;
+	/** @sgl: Scatterlist for cursor */
 	struct scatterlist *sgl;
+	/** @dma_addr: Current element in a struct drm_pagemap_device_addr array */
+	const struct drm_pagemap_device_addr *dma_addr;
+	/** @mm: Buddy allocator for VRAM cursor */
 	struct drm_buddy *mm;
+	/**
+	 * @dma_start: DMA start address for the current segment.
+	 * This may be different to @dma_addr.addr since elements in
+	 * the array may be coalesced to a single segment.
+	 */
+	u64 dma_start;
+	/** @dma_seg_size: Size of the current DMA segment. */
+	u64 dma_seg_size;
 };
 
 static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
@@ -70,6 +92,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 				struct xe_res_cursor *cur)
 {
 	cur->sgl = NULL;
+	cur->dma_addr = NULL;
 	if (!res)
 		goto fallback;
 
@@ -141,6 +164,36 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
 	cur->sgl = sgl;
 }
 
+/**
+ * __xe_res_dma_next() - Advance the cursor when end-of-segment is reached
+ * @cur: The cursor
+ */
+static inline void __xe_res_dma_next(struct xe_res_cursor *cur)
+{
+	const struct drm_pagemap_device_addr *addr = cur->dma_addr;
+	u64 start = cur->start;
+
+	while (start >= cur->dma_seg_size) {
+		start -= cur->dma_seg_size;
+		addr++;
+		cur->dma_seg_size = PAGE_SIZE << addr->order;
+	}
+	cur->dma_start = addr->addr;
+
+	/* Coalesce array_elements */
+	while (cur->dma_seg_size - start < cur->remaining) {
+		if (cur->dma_start + cur->dma_seg_size != addr[1].addr ||
+		    addr->proto != addr[1].proto)
+			break;
+		addr++;
+		cur->dma_seg_size += PAGE_SIZE << addr->order;
+	}
+
+	cur->dma_addr = addr;
+	cur->start = start;
+	cur->size = cur->dma_seg_size - start;
+}
+
 /**
  * xe_res_first_sg - initialize a xe_res_cursor with a scatter gather table
  *
@@ -160,11 +213,42 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 	cur->start = start;
 	cur->remaining = size;
 	cur->size = 0;
+	cur->dma_addr = NULL;
 	cur->sgl = sg->sgl;
 	cur->mem_type = XE_PL_TT;
 	__xe_res_sg_next(cur);
 }
 
+/**
+ * xe_res_first_dma - initialize a xe_res_cursor with dma_addr array
+ *
+ * @dma_addr: struct drm_pagemap_device_addr array to walk
+ * @start: Start of the range
+ * @size: Size of the range
+ * @cur: cursor object to initialize
+ *
+ * Start walking over the range of allocations between @start and @size.
+ */
+static inline void xe_res_first_dma(const struct drm_pagemap_device_addr *dma_addr,
+				    u64 start, u64 size,
+				    struct xe_res_cursor *cur)
+{
+	XE_WARN_ON(!dma_addr);
+	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
+		   !IS_ALIGNED(size, PAGE_SIZE));
+
+	cur->node = NULL;
+	cur->start = start;
+	cur->remaining = size;
+	cur->dma_seg_size = PAGE_SIZE << dma_addr->order;
+	cur->dma_start = 0;
+	cur->size = 0;
+	cur->dma_addr = dma_addr;
+	__xe_res_dma_next(cur);
+	cur->sgl = NULL;
+	cur->mem_type = XE_PL_TT;
+}
+
 /**
  * xe_res_next - advance the cursor
  *
@@ -191,6 +275,12 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 		return;
 	}
 
+	if (cur->dma_addr) {
+		cur->start += size;
+		__xe_res_dma_next(cur);
+		return;
+	}
+
 	if (cur->sgl) {
 		cur->start += size;
 		__xe_res_sg_next(cur);
@@ -232,6 +322,35 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
  */
 static inline u64 xe_res_dma(const struct xe_res_cursor *cur)
 {
-	return cur->sgl ? sg_dma_address(cur->sgl) + cur->start : cur->start;
+	if (cur->dma_addr)
+		return cur->dma_start + cur->start;
+	else if (cur->sgl)
+		return sg_dma_address(cur->sgl) + cur->start;
+	else
+		return cur->start;
+}
+
+/**
+ * xe_res_is_vram() - Whether the cursor current dma address points to
+ * same-device VRAM
+ * @cur: The cursor.
+ *
+ * Return: true iff the address returned by xe_res_dma() points to internal vram.
+ */
+static inline bool xe_res_is_vram(const struct xe_res_cursor *cur)
+{
+	if (cur->dma_addr)
+		return cur->dma_addr->proto == XE_INTERCONNECT_VRAM;
+
+	switch (cur->mem_type) {
+	case XE_PL_STOLEN:
+	case XE_PL_VRAM0:
+	case XE_PL_VRAM1:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
 }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index ac79b208304d..d361a78a6839 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -6,6 +6,10 @@
 #ifndef _XE_SVM_H_
 #define _XE_SVM_H_
 
+#include <drm/drm_pagemap.h>
+
+#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
+
 struct xe_vm;
 
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
-- 
2.34.1

