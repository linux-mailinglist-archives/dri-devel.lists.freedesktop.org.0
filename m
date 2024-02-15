Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9BE856B73
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5AA10E4DD;
	Thu, 15 Feb 2024 17:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EM2IK+wI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386A610E377;
 Thu, 15 Feb 2024 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708019208; x=1739555208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5+bP2KSgpt3/5xNowTMTbYJb8sytVAr2fC/pbuFQ3CA=;
 b=EM2IK+wIM60jjzhGuG7//wJ5UXLqn927yfWj2qnugSzDT1sG9lgBKqML
 kGY/05O73yXdBAvB6nbHuZ01z8iLCxqXDsGxZN1+5ZdX4nkhFhKL+sZAw
 Fs97/rXWEON8mZzxf/QEo2NgBuinwOZXJ7AaCI79HwL7CURGJ84JtsUSG
 XsLKu7tvmW3VvnD9hzHYqli031htzycugktu07WVRjw8iCiVw2yeo0m5l
 IeBjbsMvQIBToivt1C6KxEBL8QPImXwL686+n3peSfjphuij9y2Cc2dXY
 cBINxYI1CBMMLMiZ7vaCmiVb5xfJchkhcKmLsIGQ0sX5IygU4VOMnkNqW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13514016"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13514016"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:46:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3892107"
Received: from dhalpin-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.158])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:46:44 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 4/6] drm/tests/drm_buddy: add alloc_range_bias test
Date: Thu, 15 Feb 2024 17:44:35 +0000
Message-ID: <20240215174431.285069-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215174431.285069-7-matthew.auld@intel.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
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

Sanity check range bias with DRM_BUDDY_RANGE_ALLOCATION.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 218 +++++++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index edacc1adb28f..3d4b29686132 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -14,11 +14,216 @@
 
 #include "../lib/drm_random.h"
 
+static unsigned int random_seed;
+
 static inline u64 get_size(int order, u64 chunk_size)
 {
 	return (1 << order) * chunk_size;
 }
 
+static void drm_test_buddy_alloc_range_bias(struct kunit *test)
+{
+	u32 mm_size, ps, bias_size, bias_start, bias_end, bias_rem;
+	DRM_RND_STATE(prng, random_seed);
+	unsigned int i, count, *order;
+	struct drm_buddy mm;
+	LIST_HEAD(allocated);
+
+	bias_size = SZ_1M;
+	ps = roundup_pow_of_two(prandom_u32_state(&prng) % bias_size);
+	ps = max(SZ_4K, ps);
+	mm_size = (SZ_8M-1) & ~(ps-1); /* Multiple roots */
+
+	kunit_info(test, "mm_size=%u, ps=%u\n", mm_size, ps);
+
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, ps),
+			       "buddy_init failed\n");
+
+	count = mm_size / bias_size;
+	order = drm_random_order(count, &prng);
+	KUNIT_EXPECT_TRUE(test, order);
+
+	/*
+	 * Idea is to split the address space into uniform bias ranges, and then
+	 * in some random order allocate within each bias, using various
+	 * patterns within. This should detect if allocations leak out from a
+	 * given bias, for example.
+	 */
+
+	for (i = 0; i < count; i++) {
+		LIST_HEAD(tmp);
+		u64 size;
+
+		bias_start = order[i] * bias_size;
+		bias_end = bias_start + bias_size;
+		bias_rem = bias_size;
+
+		/* internal round_up too big */
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      drm_buddy_alloc_blocks(&mm, bias_start,
+							     bias_end, bias_size + ps, bias_size,
+							     &allocated,
+							     DRM_BUDDY_RANGE_ALLOCATION),
+				      "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
+				      bias_start, bias_end, bias_size, bias_size);
+
+		/* size too big */
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      drm_buddy_alloc_blocks(&mm, bias_start,
+							     bias_end, bias_size + ps, ps,
+							     &allocated,
+							     DRM_BUDDY_RANGE_ALLOCATION),
+				      "buddy_alloc didn't fail with bias(%x-%x), size=%u, ps=%u\n",
+				      bias_start, bias_end, bias_size + ps, ps);
+
+		/* bias range too small for size */
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      drm_buddy_alloc_blocks(&mm, bias_start + ps,
+							     bias_end, bias_size, ps,
+							     &allocated,
+							     DRM_BUDDY_RANGE_ALLOCATION),
+				      "buddy_alloc didn't fail with bias(%x-%x), size=%u, ps=%u\n",
+				      bias_start + ps, bias_end, bias_size, ps);
+
+		/* bias misaligned */
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      drm_buddy_alloc_blocks(&mm, bias_start + ps,
+							     bias_end - ps,
+							     bias_size >> 1, bias_size >> 1,
+							     &allocated,
+							     DRM_BUDDY_RANGE_ALLOCATION),
+				      "buddy_alloc h didn't fail with bias(%x-%x), size=%u, ps=%u\n",
+				      bias_start + ps, bias_end - ps, bias_size >> 1, bias_size >> 1);
+
+		/* single big page */
+		KUNIT_ASSERT_FALSE_MSG(test,
+				       drm_buddy_alloc_blocks(&mm, bias_start,
+							      bias_end, bias_size, bias_size,
+							      &tmp,
+							      DRM_BUDDY_RANGE_ALLOCATION),
+				       "buddy_alloc i failed with bias(%x-%x), size=%u, ps=%u\n",
+				       bias_start, bias_end, bias_size, bias_size);
+		drm_buddy_free_list(&mm, &tmp);
+
+		/* single page with internal round_up */
+		KUNIT_ASSERT_FALSE_MSG(test,
+				       drm_buddy_alloc_blocks(&mm, bias_start,
+							      bias_end, ps, bias_size,
+							      &tmp,
+							      DRM_BUDDY_RANGE_ALLOCATION),
+				       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
+				       bias_start, bias_end, ps, bias_size);
+		drm_buddy_free_list(&mm, &tmp);
+
+		/* random size within */
+		size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
+		if (size)
+			KUNIT_ASSERT_FALSE_MSG(test,
+					       drm_buddy_alloc_blocks(&mm, bias_start,
+								      bias_end, size, ps,
+								      &tmp,
+								      DRM_BUDDY_RANGE_ALLOCATION),
+					       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
+					       bias_start, bias_end, size, ps);
+
+		bias_rem -= size;
+		/* too big for current avail */
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      drm_buddy_alloc_blocks(&mm, bias_start,
+							     bias_end, bias_rem + ps, ps,
+							     &allocated,
+							     DRM_BUDDY_RANGE_ALLOCATION),
+				      "buddy_alloc didn't fail with bias(%x-%x), size=%u, ps=%u\n",
+				      bias_start, bias_end, bias_rem + ps, ps);
+
+		if (bias_rem) {
+			/* random fill of the remainder */
+			size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
+			size = max(size, ps);
+
+			KUNIT_ASSERT_FALSE_MSG(test,
+					       drm_buddy_alloc_blocks(&mm, bias_start,
+								      bias_end, size, ps,
+								      &allocated,
+								      DRM_BUDDY_RANGE_ALLOCATION),
+					       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
+					       bias_start, bias_end, size, ps);
+			/*
+			 * Intentionally allow some space to be left
+			 * unallocated, and ideally not always on the bias
+			 * boundaries.
+			 */
+			drm_buddy_free_list(&mm, &tmp);
+		} else {
+			list_splice_tail(&tmp, &allocated);
+		}
+	}
+
+	kfree(order);
+	drm_buddy_free_list(&mm, &allocated);
+	drm_buddy_fini(&mm);
+
+	/*
+	 * Something more free-form. Idea is to pick a random starting bias
+	 * range within the address space and then start filling it up. Also
+	 * randomly grow the bias range in both directions as we go along. This
+	 * should give us bias start/end which is not always uniform like above,
+	 * and in some cases will require the allocator to jump over already
+	 * allocated nodes in the middle of the address space.
+	 */
+
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, ps),
+			       "buddy_init failed\n");
+
+	bias_start = round_up(prandom_u32_state(&prng) % (mm_size - ps), ps);
+	bias_end = round_up(bias_start + prandom_u32_state(&prng) % (mm_size - bias_start), ps);
+	bias_end = max(bias_end, bias_start + ps);
+	bias_rem = bias_end - bias_start;
+
+	do {
+		u64 size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
+
+		KUNIT_ASSERT_FALSE_MSG(test,
+				       drm_buddy_alloc_blocks(&mm, bias_start,
+							      bias_end, size, ps,
+							      &allocated,
+							      DRM_BUDDY_RANGE_ALLOCATION),
+				       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
+				       bias_start, bias_end, size);
+		bias_rem -= size;
+
+		/*
+		 * Try to randomly grow the bias range in both directions, or
+		 * only one, or perhaps don't grow at all.
+		 */
+		do {
+			u64 old_bias_start = bias_start;
+			u64 old_bias_end = bias_end;
+
+			if (bias_start)
+				bias_start -= round_up(prandom_u32_state(&prng) % bias_start, ps);
+			if (bias_end != mm_size)
+				bias_end += round_up(prandom_u32_state(&prng) % (mm_size - bias_end), ps);
+
+			bias_rem += old_bias_start - bias_start;
+			bias_rem += bias_end - old_bias_end;
+		} while (!bias_rem && (bias_start || bias_end != mm_size));
+	} while (bias_rem);
+
+	KUNIT_ASSERT_EQ(test, bias_start, 0);
+	KUNIT_ASSERT_EQ(test, bias_end, mm_size);
+	KUNIT_ASSERT_TRUE_MSG(test,
+			      drm_buddy_alloc_blocks(&mm, bias_start, bias_end,
+						     ps, ps,
+						     &allocated,
+						     DRM_BUDDY_RANGE_ALLOCATION),
+			      "buddy_alloc passed with bias(%x-%x), size=%u\n",
+			      bias_start, bias_end, ps);
+
+	drm_buddy_free_list(&mm, &allocated);
+	drm_buddy_fini(&mm);
+}
+
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 {
 	u32 mm_size, ps = SZ_4K, i, n_pages, total;
@@ -363,17 +568,30 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 	drm_buddy_fini(&mm);
 }
 
+static int drm_buddy_suite_init(struct kunit_suite *suite)
+{
+	while (!random_seed)
+		random_seed = get_random_u32();
+
+	kunit_info(suite, "Testing DRM buddy manager, with random_seed=0x%x\n",
+		   random_seed);
+
+	return 0;
+}
+
 static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_limit),
 	KUNIT_CASE(drm_test_buddy_alloc_optimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pathological),
 	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
+	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
 	{}
 };
 
 static struct kunit_suite drm_buddy_test_suite = {
 	.name = "drm_buddy",
+	.suite_init = drm_buddy_suite_init,
 	.test_cases = drm_buddy_tests,
 };
 
-- 
2.43.0

