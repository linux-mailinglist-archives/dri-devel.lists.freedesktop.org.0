Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3204F39F137
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3B56EB42;
	Tue,  8 Jun 2021 08:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994196EB3E;
 Tue,  8 Jun 2021 08:45:03 +0000 (UTC)
IronPort-SDR: K2/QWP3+1v7FWav3yCTOVZMX+D7+yGQ9RioeheFLSTLNcQqiH0Wuk7xLEJBY4Q6bG+PmLxFk4x
 NmMjPeX39XSw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202943824"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="202943824"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:45:03 -0700
IronPort-SDR: S4anKoU4zt77KhIlrtZrNUDQ8HAJx6F1WW9dIJ3fdq13zFiQD6eTvWiszL8ouxaQX56QJ7w/8E
 Bb8yMq36fKSQ==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="440381992"
Received: from mrahim1x-mobl.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.215.170.251])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:45:00 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/i915/ttm: add i915_sg_from_buddy_resource
Date: Tue,  8 Jun 2021 09:44:24 +0100
Message-Id: <20210608084428.142676-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608084428.142676-1-matthew.auld@intel.com>
References: <20210608084428.142676-1-matthew.auld@intel.com>
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
index 69e9e6c3135e..0959fe3efbbb 100644
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
+ * @res: The i915_ttm_buddy_resource.
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
+	struct i915_buddy_mm *mm = bman_res->mm;
+	const u64 size = res->num_pages << PAGE_SHIFT;
+	const u64 max_segment = UINT_MAX;
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
+	if (sg_alloc_table(st, size >> PAGE_SHIFT, GFP_KERNEL)) {
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

