Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 035424C5DD8
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 18:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0FA10E327;
	Sun, 27 Feb 2022 17:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B72810E17A;
 Sun, 27 Feb 2022 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645983967; x=1677519967;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YtHxtF8ygnKr81m+D8ND/S3fUe8XCAEzcdvmrUTMkbE=;
 b=Wo/PxeXZNlsGDW8oSA8TJlPXdNqA9+X92jd0Sm3XmY+ti75NkrRjU6qQ
 UW9tkSjnmhzUQRJLJZZoTVmbWRAldNfhthswynFubooP+bywTzzkR4zO/
 PG4TwRLkGNFQ+EP3l6FV/s2u3sTyApusxl5YBtynAdaU4LGxPQvs8Ewuc
 W0ZtwSJWP9JbdOsMS9cHMRaqJUDpL7kSSDVfJ8QfbupjOZvcjyTjq7L1C
 2j5s1H+SYQJ1mn3RBuIO82U6yfmsnkgGjzqSWEn7u1j5XKtgRjFQGW+MD
 HsTWYknfPeVe8ZpPnUojvXXXOe47tnnJWrIQeQrREnOeRtjNyR7nor2Vq Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="313469106"
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; d="scan'208";a="313469106"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 09:46:07 -0800
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; d="scan'208";a="549940405"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 09:46:06 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [CI 1/2] drm/mm: Add an iterator to optimally walk over holes for an
 allocation (v4)
Date: Sun, 27 Feb 2022 09:29:56 -0800
Message-Id: <20220227172957.1208890-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220227172957.1208890-1-vivek.kasireddy@intel.com>
References: <20220227172957.1208890-1-vivek.kasireddy@intel.com>
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

v3: (Tvrtko)
- Reduce the number of hunks by retaining the "mode" variable name

v4:
- Typo: s/__drm_mm_next_hole(.., hole/__drm_mm_next_hole(.., pos

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/drm_mm.c | 32 +++++++++++++++-----------------
 include/drm/drm_mm.h     | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8257f9d4f619..8efea548ae9f 100644
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
@@ -516,11 +518,11 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
 				u64 size, u64 alignment,
 				unsigned long color,
 				u64 range_start, u64 range_end,
-				enum drm_mm_insert_mode mode)
+				enum drm_mm_insert_mode caller_mode)
 {
 	struct drm_mm_node *hole;
 	u64 remainder_mask;
-	bool once;
+	enum drm_mm_insert_mode mode = caller_mode & ~DRM_MM_INSERT_ONCE;
 
 	DRM_MM_BUG_ON(range_start > range_end);
 
@@ -533,13 +535,9 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
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
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index ac33ba1b18bc..dff6db627807 100644
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
+	     NULL : __drm_mm_next_hole(mm, pos, size, \
+				       mode & ~DRM_MM_INSERT_ONCE))
+
 /*
  * Basic range manager support (drm_mm.c)
  */
-- 
2.34.1

