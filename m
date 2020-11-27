Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74D32C6563
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5E46ED23;
	Fri, 27 Nov 2020 12:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6F76ED16;
 Fri, 27 Nov 2020 12:11:50 +0000 (UTC)
IronPort-SDR: sD73h9JEILHCLWgQhKjqKB3+Q15QfzSAozZEzUXqcFgUcUDOw5l6Hvb0Jh46qRZMnvxdtO+Dk/
 AfLrlrA/9sHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092953"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092953"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:50 -0800
IronPort-SDR: OL4cnQI1SgYbkTM1vaomcOB3BQI7jOexcmukqC4bgoPLl0w9+1xDxd/xzvlcKq7BKsQxwqZdAB
 22FFoeoqBsEw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029892"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:48 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 135/162] drm/i915: define intel_partial_pages_for_sg_table
Date: Fri, 27 Nov 2020 12:06:51 +0000
Message-Id: <20201127120718.454037-136-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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

From: Ramalingam C <ramalingam.c@intel.com>

Function to retrieve the partial pages from the object, from mentioned
offset(pages). This is created as a subset of intel_partial pages to be
used for window blt copy feature which is introduced in forthcoming
patches.

This takes the sg_table to be filled in with pages and also passes out
the ptr to last scatterlist used. sg_table is trimmed based on the
parameter.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 59 +++++++++++++++++-----------
 drivers/gpu/drm/i915/gt/intel_gtt.h  |  4 ++
 2 files changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index eed5b640e493..21804c4cef9c 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -1383,25 +1383,17 @@ intel_remap_pages(struct intel_remapped_info *rem_info,
 	return ERR_PTR(ret);
 }
 
-static noinline struct sg_table *
-intel_partial_pages(const struct i915_ggtt_view *view,
-		    struct drm_i915_gem_object *obj)
+void intel_partial_pages_for_sg_table(struct drm_i915_gem_object *obj,
+				      struct sg_table *st,
+				      u32 obj_offset, u32 page_count,
+				      struct scatterlist **sgl)
 {
-	struct sg_table *st;
 	struct scatterlist *sg, *iter;
-	unsigned int count = view->partial.size;
 	unsigned int offset;
-	int ret = -ENOMEM;
 
-	st = kmalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		goto err_st_alloc;
+	GEM_BUG_ON(!st);
 
-	ret = sg_alloc_table(st, count, GFP_KERNEL);
-	if (ret)
-		goto err_sg_alloc;
-
-	iter = i915_gem_object_get_sg_dma(obj, view->partial.offset, &offset, true);
+	iter = i915_gem_object_get_sg_dma(obj, obj_offset, &offset, true);
 	GEM_BUG_ON(!iter);
 
 	sg = st->sgl;
@@ -1410,30 +1402,51 @@ intel_partial_pages(const struct i915_ggtt_view *view,
 		unsigned int len;
 
 		len = min(sg_dma_len(iter) - (offset << PAGE_SHIFT),
-			  count << PAGE_SHIFT);
+			  page_count << PAGE_SHIFT);
+
 		sg_set_page(sg, NULL, len, 0);
 		sg_dma_address(sg) =
 			sg_dma_address(iter) + (offset << PAGE_SHIFT);
 		sg_dma_len(sg) = len;
 
 		st->nents++;
-		count -= len >> PAGE_SHIFT;
-		if (count == 0) {
+		page_count -= len >> PAGE_SHIFT;
+		if (page_count == 0) {
 			sg_mark_end(sg);
-			i915_sg_trim(st); /* Drop any unused tail entries. */
+			if (sgl)
+				*sgl = sg;
 
-			return st;
+			return;
 		}
 
 		sg = __sg_next(sg);
 		iter = __sg_next(iter);
 		offset = 0;
 	} while (1);
+}
 
-err_sg_alloc:
-	kfree(st);
-err_st_alloc:
-	return ERR_PTR(ret);
+static noinline struct sg_table *
+intel_partial_pages(const struct i915_ggtt_view *view,
+		    struct drm_i915_gem_object *obj)
+{
+	struct sg_table *st;
+	int ret;
+
+	st = kmalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return ERR_PTR(-ENOMEM);
+
+	ret = sg_alloc_table(st, view->partial.size, GFP_KERNEL);
+	if (ret) {
+		kfree(st);
+		return ERR_PTR(ret);
+	}
+
+	intel_partial_pages_for_sg_table(obj, st, view->partial.offset,
+					 view->partial.size, NULL);
+	i915_sg_trim(st);
+
+	return st;
 }
 
 static int
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index db3626c0ee20..37d2c692c0af 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -506,6 +506,10 @@ static inline bool i915_ggtt_has_aperture(const struct i915_ggtt *ggtt)
 	return ggtt->mappable_end > 0;
 }
 
+void intel_partial_pages_for_sg_table(struct drm_i915_gem_object *obj,
+				      struct sg_table *st,
+				      u32 obj_offset, u32 page_count,
+				      struct scatterlist **sgl);
 int i915_ppgtt_init_hw(struct intel_gt *gt);
 
 struct i915_ppgtt *i915_ppgtt_create(struct intel_gt *gt);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
