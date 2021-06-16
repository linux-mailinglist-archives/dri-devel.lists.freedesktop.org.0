Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1D63A9E33
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 16:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7747F89BB3;
	Wed, 16 Jun 2021 14:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0268C89BB3;
 Wed, 16 Jun 2021 14:53:33 +0000 (UTC)
IronPort-SDR: gpfr/nXHUI/IUn/8ZGCCb08Genb6szVvOX0MNv+mzMJHp1CjGvQjlZOCemc0PtvXmsxZQrVIBT
 gLhIp674pYZQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="270039020"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="270039020"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 07:53:33 -0700
IronPort-SDR: 129lPH1nsKZbZnrTBm39GYBeBsEo2tHfv//fCkAN8b+edxldWl8cqMHRiQdy3i8WTbtOh/o8pf
 DHJ1jy0GQOMQ==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="442903082"
Received: from mrapopor-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.236.122])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 07:53:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 2/7] drm/i915/ttm: add i915_sg_from_buddy_resource
Date: Wed, 16 Jun 2021 15:52:54 +0100
Message-Id: <20210616145259.357146-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210616145259.357146-1-matthew.auld@intel.com>
References: <20210616145259.357146-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to be able to build an sg table from our list of buddy blocks,
so that we can later plug this into our ttm backend, and replace our use
of the range manager.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_scatterlist.c | 80 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_scatterlist.h |  5 ++
 2 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index 69e9e6c3135e..4a6712dca838 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -6,6 +6,9 @@
 
 #include "i915_scatterlist.h"
 
+#include "i915_buddy.h"
+#include "i915_ttm_buddy_manager.h"
+
 #include <drm/drm_mm.h>
 
 #include <linux/slab.h>
@@ -104,6 +107,83 @@ struct sg_table *i915_sg_from_mm_node(const struct drm_mm_node *node,
 	return st;
 }
 
+/**
+ * i915_sg_from_buddy_resource - Create an sg_table from a struct
+ * i915_buddy_block list
+ * @res: The struct i915_ttm_buddy_resource.
+ * @region_start: An offset to add to the dma addresses of the sg list.
+ *
+ * Create a struct sg_table, initializing it from struct i915_buddy_block list,
+ * taking a maximum segment length into account, splitting into segments
+ * if necessary.
+ *
+ * Return: A pointer to a kmalloced struct sg_table on success, negative
+ * error code cast to an error pointer on failure.
+ */
+struct sg_table *i915_sg_from_buddy_resource(struct ttm_resource *res,
+					     u64 region_start)
+{
+	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
+	const u64 size = res->num_pages << PAGE_SHIFT;
+	const u64 max_segment = rounddown(UINT_MAX, PAGE_SIZE);
+	struct i915_buddy_mm *mm = bman_res->mm;
+	struct list_head *blocks = &bman_res->blocks;
+	struct i915_buddy_block *block;
+	struct scatterlist *sg;
+	struct sg_table *st;
+	resource_size_t prev_end;
+
+	GEM_BUG_ON(list_empty(blocks));
+
+	st = kmalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return ERR_PTR(-ENOMEM);
+
+	if (sg_alloc_table(st, res->num_pages, GFP_KERNEL)) {
+		kfree(st);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	sg = st->sgl;
+	st->nents = 0;
+	prev_end = (resource_size_t)-1;
+
+	list_for_each_entry(block, blocks, link) {
+		u64 block_size, offset;
+
+		block_size = min_t(u64, size, i915_buddy_block_size(mm, block));
+		offset = i915_buddy_block_offset(block);
+
+		while (block_size) {
+			u64 len;
+
+			if (offset != prev_end || sg->length >= max_segment) {
+				if (st->nents)
+					sg = __sg_next(sg);
+
+				sg_dma_address(sg) = region_start + offset;
+				sg_dma_len(sg) = 0;
+				sg->length = 0;
+				st->nents++;
+			}
+
+			len = min(block_size, max_segment - sg->length);
+			sg->length += len;
+			sg_dma_len(sg) += len;
+
+			offset += len;
+			block_size -= len;
+
+			prev_end = offset;
+		}
+	}
+
+	sg_mark_end(sg);
+	i915_sg_trim(st);
+
+	return st;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/scatterlist.c"
 #endif
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index 5acca45ea981..b8bd5925b03f 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.h
+++ b/drivers/gpu/drm/i915/i915_scatterlist.h
@@ -14,6 +14,7 @@
 #include "i915_gem.h"
 
 struct drm_mm_node;
+struct ttm_resource;
 
 /*
  * Optimised SGL iterator for GEM objects
@@ -145,4 +146,8 @@ bool i915_sg_trim(struct sg_table *orig_st);
 
 struct sg_table *i915_sg_from_mm_node(const struct drm_mm_node *node,
 				      u64 region_start);
+
+struct sg_table *i915_sg_from_buddy_resource(struct ttm_resource *res,
+					     u64 region_start);
+
 #endif
-- 
2.26.3

