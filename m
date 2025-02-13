Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBB3A33539
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A0710E9D9;
	Thu, 13 Feb 2025 02:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIcu/ZPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DF310E9BF;
 Thu, 13 Feb 2025 02:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412617; x=1770948617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bw8gVSozFbxsW/AtkxNmcomHpshI1390L1rxTZ1MtNA=;
 b=QIcu/ZPPhHRTS//NCe/Cxs0nK0iuXCs584y99aSxqmEgaAxlJPBI/Pri
 v7+xja/yqwVdgTS0VuhqwQAZL2yt7PgGxKQ2Dpxi6szxoQ8ImbhnKMu5w
 2xDvtgaoJvFU/BtYvNaXpFjI5BdD4jnZ5fszDOwl+Qz6atFB0WtYwMmTC
 Q4uBTkYIXeogbLNSr3V12uA5kehymMwRqo3WoWmmnktRQOM5orfKwHXjp
 PV5COTsNenQy2II5JxI4gDDnF3sTSpLLzCLs9y7MvkygsSUnXyMoqFQHj
 cx5kHcXh9yC2Tj31RAxpJhjej8vPt5Mlny4MzvEwp1yt6n2DEspjzmNu4 g==;
X-CSE-ConnectionGUID: ulgy4PO8T/60KBWX+vwOtg==
X-CSE-MsgGUID: 8Y0Gmz/6TqeFivd4GrBzqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65455976"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65455976"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:16 -0800
X-CSE-ConnectionGUID: 76z6aPuUQYiQDV/ZDxkRrg==
X-CSE-MsgGUID: odgMnIP4SpmZPlJb69NlGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945063"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 10/32] drm/xe: Add dma_addr res cursor
Date: Wed, 12 Feb 2025 18:10:50 -0800
Message-Id: <20250213021112.1228481-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_res_cursor.h | 116 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h        |   4 +
 2 files changed, 118 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index dca374b6521c..5d0277403f69 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -26,6 +26,7 @@
 
 #include <linux/scatterlist.h>
 
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_resource.h>
@@ -34,9 +35,13 @@
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
 	u64 start;
 	u64 size;
@@ -44,7 +49,17 @@ struct xe_res_cursor {
 	void *node;
 	u32 mem_type;
 	struct scatterlist *sgl;
+	/** @dma_addr: Current element in a struct drm_pagemap_device_addr array */
+	const struct drm_pagemap_device_addr *dma_addr;
 	struct drm_buddy *mm;
+	/**
+	 * @dma_start: DMA start address for the current segment.
+	 * This may be different to @dma_addr.addr since elements in
+	 * the array may be coalesced to a single segment.
+	 */
+	u64 dma_start;
+	/** @dma_seg_size: Size of the current segment. */
+	u64 dma_seg_size;
 };
 
 static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
@@ -70,6 +85,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 				struct xe_res_cursor *cur)
 {
 	cur->sgl = NULL;
+	cur->dma_addr = NULL;
 	if (!res)
 		goto fallback;
 
@@ -141,6 +157,36 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
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
@@ -160,11 +206,42 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
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
@@ -191,6 +268,12 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
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
@@ -232,6 +315,35 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
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
index 49cfd938aa17..4569931db622 100644
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
 
 int xe_svm_init(struct xe_vm *vm);
-- 
2.34.1

