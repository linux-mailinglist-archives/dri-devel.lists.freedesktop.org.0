Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAF186C753
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CB510E454;
	Thu, 29 Feb 2024 10:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuFI7eEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD57D10E44D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 10:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709203890; x=1740739890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c1cjwqrGcNmLRPoXfHyhZB0zGFd92NKW+gnn3W832nw=;
 b=TuFI7eEA/Pb67KfnNWUYw9TphN3bMSkcozVIIid9bkn9JMds45YG6YAT
 A5wiZg9L41EQW3NpPeQ5JYVvgKjxuPYYqW2vxzXikETua6MGDYjbkC56B
 nOxmNy2Yd5FH5ULb7y2qLY1x7a00FDrRcDRqMiq2fY5/QVXuOOWS2tbJi
 9UBjbE17fxypE9h9jNevs6JUVi5U/b0JpJzcnjAOhu2IxF6ysOMET0NcX
 K+17Gx+W5viGQByFeVud3DiCP45ECfYzlhQvwpG5Esb8JIp+6HHU+/1tu
 DQRedx5ZGqNUrspRTqImNUNQCa4bhVZvIGqSwaJfNxsk3htltcBCG0cXw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7486700"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7486700"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="38824204"
Received: from mhaehnex-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.3.131])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:51:28 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] drm/tests/buddy: stop using PAGE_SIZE
Date: Thu, 29 Feb 2024 10:51:14 +0000
Message-ID: <20240229105112.250077-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240229105112.250077-3-matthew.auld@intel.com>
References: <20240229105112.250077-3-matthew.auld@intel.com>
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

Gives the wrong impression that min page-size has to be tied to the CPU
PAGE_SIZE.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 42 +++++++++++++-------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index be2d9d7764be..8528f39a84e6 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -329,8 +329,8 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 	 * Eventually we will have a fully 50% fragmented mm.
 	 */
 
-	mm_size = PAGE_SIZE << max_order;
-	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, PAGE_SIZE),
+	mm_size = SZ_4K << max_order;
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, SZ_4K),
 			       "buddy_init failed\n");
 
 	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
@@ -344,7 +344,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 		}
 
 		for (order = top; order--;) {
-			size = get_size(order, PAGE_SIZE);
+			size = get_size(order, mm.chunk_size);
 			KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start,
 									    mm_size, size, size,
 										&tmp, flags),
@@ -358,7 +358,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 		}
 
 		/* There should be one final page for this sub-allocation */
-		size = get_size(0, PAGE_SIZE);
+		size = get_size(0, mm.chunk_size);
 		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
 								    size, size, &tmp, flags),
 							   "buddy_alloc hit -ENOMEM for hole\n");
@@ -368,7 +368,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 
 		list_move_tail(&block->link, &holes);
 
-		size = get_size(top, PAGE_SIZE);
+		size = get_size(top, mm.chunk_size);
 		KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
 								   size, size, &tmp, flags),
 							  "buddy_alloc unexpectedly succeeded at top-order %d/%d, it should be full!",
@@ -379,7 +379,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 
 	/* Nothing larger than blocks of chunk_size now available */
 	for (order = 1; order <= max_order; order++) {
-		size = get_size(order, PAGE_SIZE);
+		size = get_size(order, mm.chunk_size);
 		KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
 								   size, size, &tmp, flags),
 							  "buddy_alloc unexpectedly succeeded at order %d, it should be full!",
@@ -408,14 +408,14 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 	 * page left.
 	 */
 
-	mm_size = PAGE_SIZE << max_order;
-	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, PAGE_SIZE),
+	mm_size = SZ_4K << max_order;
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, SZ_4K),
 			       "buddy_init failed\n");
 
 	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
 
 	for (order = 0; order < max_order; order++) {
-		size = get_size(order, PAGE_SIZE);
+		size = get_size(order, mm.chunk_size);
 		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
 								    size, size, &tmp, flags),
 							   "buddy_alloc hit -ENOMEM with order=%d\n",
@@ -428,7 +428,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 	}
 
 	/* And now the last remaining block available */
-	size = get_size(0, PAGE_SIZE);
+	size = get_size(0, mm.chunk_size);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
 							    size, size, &tmp, flags),
 						   "buddy_alloc hit -ENOMEM on final alloc\n");
@@ -440,7 +440,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 
 	/* Should be completely full! */
 	for (order = max_order; order--;) {
-		size = get_size(order, PAGE_SIZE);
+		size = get_size(order, mm.chunk_size);
 		KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
 								   size, size, &tmp, flags),
 							  "buddy_alloc unexpectedly succeeded, it should be full!");
@@ -456,7 +456,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 		list_del(&block->link);
 		drm_buddy_free_block(&mm, block);
 
-		size = get_size(order, PAGE_SIZE);
+		size = get_size(order, mm.chunk_size);
 		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
 								    size, size, &tmp, flags),
 							   "buddy_alloc hit -ENOMEM with order=%d\n",
@@ -471,7 +471,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 	}
 
 	/* To confirm, now the whole mm should be available */
-	size = get_size(max_order, PAGE_SIZE);
+	size = get_size(max_order, mm.chunk_size);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
 							    size, size, &tmp, flags),
 						   "buddy_alloc (realloc) hit -ENOMEM with order=%d\n",
@@ -502,15 +502,15 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
 	 * try to allocate them all.
 	 */
 
-	mm_size = PAGE_SIZE * ((1 << (max_order + 1)) - 1);
+	mm_size = SZ_4K * ((1 << (max_order + 1)) - 1);
 
-	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, PAGE_SIZE),
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, SZ_4K),
 			       "buddy_init failed\n");
 
 	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
 
 	for (order = 0; order <= max_order; order++) {
-		size = get_size(order, PAGE_SIZE);
+		size = get_size(order, mm.chunk_size);
 		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
 								    size, size, &tmp, flags),
 							   "buddy_alloc hit -ENOMEM with order=%d\n",
@@ -523,7 +523,7 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
 	}
 
 	/* Should be completely full! */
-	size = get_size(0, PAGE_SIZE);
+	size = get_size(0, mm.chunk_size);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, start, mm_size,
 							   size, size, &tmp, flags),
 						  "buddy_alloc unexpectedly succeeded, it should be full!");
@@ -540,7 +540,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 	LIST_HEAD(allocated);
 	struct drm_buddy mm;
 
-	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, size, PAGE_SIZE));
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, size, SZ_4K));
 
 	KUNIT_EXPECT_EQ_MSG(test, mm.max_order, DRM_BUDDY_MAX_ORDER,
 			    "mm.max_order(%d) != %d\n", mm.max_order,
@@ -548,7 +548,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 
 	size = mm.chunk_size << mm.max_order;
 	KUNIT_EXPECT_FALSE(test, drm_buddy_alloc_blocks(&mm, start, size, size,
-							PAGE_SIZE, &allocated, flags));
+							mm.chunk_size, &allocated, flags));
 
 	block = list_first_entry_or_null(&allocated, struct drm_buddy_block, link);
 	KUNIT_EXPECT_TRUE(test, block);
@@ -558,10 +558,10 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 						drm_buddy_block_order(block), mm.max_order);
 
 	KUNIT_EXPECT_EQ_MSG(test, drm_buddy_block_size(&mm, block),
-			    BIT_ULL(mm.max_order) * PAGE_SIZE,
+			    BIT_ULL(mm.max_order) * mm.chunk_size,
 						"block size(%llu) != %llu\n",
 						drm_buddy_block_size(&mm, block),
-						BIT_ULL(mm.max_order) * PAGE_SIZE);
+						BIT_ULL(mm.max_order) * mm.chunk_size);
 
 	drm_buddy_free_list(&mm, &allocated);
 	drm_buddy_fini(&mm);
-- 
2.43.2

