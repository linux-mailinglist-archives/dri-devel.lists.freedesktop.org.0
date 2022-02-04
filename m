Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBADD4A920F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 02:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3643D10ECBD;
	Fri,  4 Feb 2022 01:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6733310ECBD;
 Fri,  4 Feb 2022 01:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643938564; x=1675474564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MFGO+LfJ9RbLhjrziphx7JNkg3GkJSLX5Qj4KFXRapE=;
 b=gQ67KxP2iMCZQKZFtYkfLl8PgMKYPgm5VsyC854uRlvxC8B8bH5O2I2E
 bv/3Hbysara0YGoYCrgrl5BOg1foSoysM5udDed4oMB+iL8gAr9FiD648
 +3e6p+ILcLNDXgiX+2Od4JKoHrjLDf9u5jxMUI4n06jvkHH87W7i+1Md8
 AflIiY0A1jdDBlCu6aFKnVD9CMfeuGRwbZ3zxLukRE1VuuIroO7m2lkT/
 aoCCKbnD677n9rLAp+X7Spd0+GSZLU49L8ejHGyoNBA0gSltEj7yf4BFz
 czV0cTBDk8y5UR5sAQl2n5d8o92p3jfm5YrvJFcfz++/OQmiA2PWCqGMq A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="334685683"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="334685683"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 17:36:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="583995613"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 17:35:58 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/mm: Add an iterator to optimally walk over holes for
 an allocation (v2)
Date: Thu,  3 Feb 2022 17:19:39 -0800
Message-Id: <20220204011939.1517070-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ed22efe9-4cd8-cf71-beb7-66af7161c518@linux.intel.com>
References: <ed22efe9-4cd8-cf71-beb7-66af7161c518@linux.intel.com>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This iterator relies on drm_mm_first_hole() and drm_mm_next_hole()
functions to identify suitable holes for an allocation of a given
size by efficiently traversing the rbtree associated with the given
allocator.

It replaces the for loop in drm_mm_insert_node_in_range() and can
also be used by drm drivers to quickly identify holes of a certain
size within a given range.

v2: (Tvrtko)
- Prepend a double underscore for the newly exported first/next_hole
- s/each_best_hole/each_suitable_hole/g
- Mask out DRM_MM_INSERT_ONCE from the mode before calling
  first/next_hole and elsewhere.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/drm_mm.c | 38 ++++++++++++++++++--------------------
 include/drm/drm_mm.h     | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8257f9d4f619..b6da1dffcfcb 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -352,10 +352,10 @@ static struct drm_mm_node *find_hole_addr(struct drm_mm *mm, u64 addr, u64 size)
 	return node;
 }
 
-static struct drm_mm_node *
-first_hole(struct drm_mm *mm,
-	   u64 start, u64 end, u64 size,
-	   enum drm_mm_insert_mode mode)
+struct drm_mm_node *
+__drm_mm_first_hole(struct drm_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    enum drm_mm_insert_mode mode)
 {
 	switch (mode) {
 	default:
@@ -374,6 +374,7 @@ first_hole(struct drm_mm *mm,
 						hole_stack);
 	}
 }
+EXPORT_SYMBOL(__drm_mm_first_hole);
 
 /**
  * DECLARE_NEXT_HOLE_ADDR - macro to declare next hole functions
@@ -410,11 +411,11 @@ static struct drm_mm_node *name(struct drm_mm_node *entry, u64 size)	\
 DECLARE_NEXT_HOLE_ADDR(next_hole_high_addr, rb_left, rb_right)
 DECLARE_NEXT_HOLE_ADDR(next_hole_low_addr, rb_right, rb_left)
 
-static struct drm_mm_node *
-next_hole(struct drm_mm *mm,
-	  struct drm_mm_node *node,
-	  u64 size,
-	  enum drm_mm_insert_mode mode)
+struct drm_mm_node *
+__drm_mm_next_hole(struct drm_mm *mm,
+		   struct drm_mm_node *node,
+		   u64 size,
+		   enum drm_mm_insert_mode mode)
 {
 	switch (mode) {
 	default:
@@ -432,6 +433,7 @@ next_hole(struct drm_mm *mm,
 		return &node->hole_stack == &mm->hole_stack ? NULL : node;
 	}
 }
+EXPORT_SYMBOL(__drm_mm_next_hole);
 
 /**
  * drm_mm_reserve_node - insert an pre-initialized node
@@ -520,7 +522,6 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 {
 	struct drm_mm_node *hole;
 	u64 remainder_mask;
-	bool once;
 
 	DRM_MM_BUG_ON(range_start > range_end);
 
@@ -533,22 +534,19 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 	if (alignment <= 1)
 		alignment = 0;
 
-	once = mode & DRM_MM_INSERT_ONCE;
-	mode &= ~DRM_MM_INSERT_ONCE;
-
 	remainder_mask = is_power_of_2(alignment) ? alignment - 1 : 0;
-	for (hole = first_hole(mm, range_start, range_end, size, mode);
-	     hole;
-	     hole = once ? NULL : next_hole(mm, hole, size, mode)) {
+	drm_mm_for_each_suitable_hole(hole, mm, range_start, range_end,
+				      size, mode) {
 		u64 hole_start = __drm_mm_hole_node_start(hole);
 		u64 hole_end = hole_start + hole->hole_size;
 		u64 adj_start, adj_end;
 		u64 col_start, col_end;
+		enum drm_mm_insert_mode placement = mode & ~DRM_MM_INSERT_ONCE;
 
-		if (mode == DRM_MM_INSERT_LOW && hole_start >= range_end)
+		if (placement == DRM_MM_INSERT_LOW && hole_start >= range_end)
 			break;
 
-		if (mode == DRM_MM_INSERT_HIGH && hole_end <= range_start)
+		if (placement == DRM_MM_INSERT_HIGH && hole_end <= range_start)
 			break;
 
 		col_start = hole_start;
@@ -562,7 +560,7 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 		if (adj_end <= adj_start || adj_end - adj_start < size)
 			continue;
 
-		if (mode == DRM_MM_INSERT_HIGH)
+		if (placement == DRM_MM_INSERT_HIGH)
 			adj_start = adj_end - size;
 
 		if (alignment) {
@@ -574,7 +572,7 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 				div64_u64_rem(adj_start, alignment, &rem);
 			if (rem) {
 				adj_start -= rem;
-				if (mode != DRM_MM_INSERT_HIGH)
+				if (placement != DRM_MM_INSERT_HIGH)
 					adj_start += alignment;
 
 				if (adj_start < max(col_start, range_start) ||
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index ac33ba1b18bc..777f659f9692 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -400,6 +400,42 @@ static inline u64 drm_mm_hole_node_end(const struct drm_mm_node *hole_node)
 	     1 : 0; \
 	     pos = list_next_entry(pos, hole_stack))
 
+struct drm_mm_node *
+__drm_mm_first_hole(struct drm_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    enum drm_mm_insert_mode mode);
+
+struct drm_mm_node *
+__drm_mm_next_hole(struct drm_mm *mm,
+		   struct drm_mm_node *node,
+		   u64 size,
+		   enum drm_mm_insert_mode mode);
+
+/**
+ * drm_mm_for_each_suitable_hole - iterator to optimally walk over all
+ * holes that can fit an allocation of the given @size.
+ * @pos: &drm_mm_node used internally to track progress
+ * @mm: &drm_mm allocator to walk
+ * @range_start: start of the allowed range for the allocation
+ * @range_end: end of the allowed range for the allocation
+ * @size: size of the allocation
+ * @mode: fine-tune the allocation search
+ *
+ * This iterator walks over all holes suitable for the allocation of given
+ * @size in a very efficient manner. It is implemented by calling
+ * drm_mm_first_hole() and drm_mm_next_hole() which identify the
+ * appropriate holes within the given range by efficiently traversing the
+ * rbtree associated with @mm.
+ */
+#define drm_mm_for_each_suitable_hole(pos, mm, range_start, range_end, \
+				      size, mode) \
+	for (pos = __drm_mm_first_hole(mm, range_start, range_end, size, \
+				       mode & ~DRM_MM_INSERT_ONCE); \
+	     pos; \
+	     pos = mode & DRM_MM_INSERT_ONCE ? \
+	     NULL : __drm_mm_next_hole(mm, hole, size, \
+				       mode & ~DRM_MM_INSERT_ONCE))
+
 /*
  * Basic range manager support (drm_mm.c)
  */
-- 
2.34.1

