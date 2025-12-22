Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C8CD4D43
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 07:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD47510E536;
	Mon, 22 Dec 2025 06:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etekvd1y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7194910E533;
 Mon, 22 Dec 2025 06:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766386573; x=1797922573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gqK5JH1LopAo8ubn0A3zNCf0f5MlxhtwSa6aHJrss7o=;
 b=etekvd1ywAA/AB8a41MXp/YRmftHhPBeyKu5pnaBO9ZTUgxgnoYxwpj3
 SotVVt5hg5uzOfaopxWIhtWK+tdlzCDrGnjR23fWzJ4pnq0Risd/TkTUr
 EVrOKTy7Zam6KGnI8/QX9KD7ypN4bDgfAARE8d3lXg2cWFoJ8KWp27avk
 /ItE/L5TuwTgxwXyVRZtehHTD76a1e5KcSlvUCxIXOaGlK6drojPlbkm/
 wKKgGkxm2xBg295uM7+pcgvvttGbZPVBqUiQa6PscVkCf+O9IIkDjr2B9
 niNSfQStcqSMlqA4CWKOApO9FSenYoitN8j2BVRvPx4ZCbSZ7fK004+0k g==;
X-CSE-ConnectionGUID: TyKl67dPQUWBgy1guJ1A+w==
X-CSE-MsgGUID: Io+fXze/R4m4JyrfWoMYTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="55814296"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="55814296"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 22:56:13 -0800
X-CSE-ConnectionGUID: SxMA4LiyRqCVXmuDaR2Udg==
X-CSE-MsgGUID: Lrhewht8Rw6xLTzVpz20cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; d="scan'208";a="198688091"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 22:56:12 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 2/2] drm/tests/drm_buddy: Add tests for allocations exceeding
 max_order
Date: Mon, 22 Dec 2025 12:22:41 +0530
Message-ID: <20251222065238.1661415-6-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222065238.1661415-4-sanjay.kumar.yadav@intel.com>
References: <20251222065238.1661415-4-sanjay.kumar.yadav@intel.com>
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

Add kunit tests that exercise edge cases where allocation requests
exceed mm->max_order after rounding. This can happen with
non-power-of-two VRAM sizes when the allocator rounds up requests.

For example, with 10G VRAM (8G + 2G roots), mm->max_order represents
the 8G block. A 9G allocation can round up to 16G in multiple ways:
CONTIGUOUS allocation rounds to next power-of-two, or non-CONTIGUOUS
with 8G min_block_size rounds to next alignment boundary.

The test validates CONTIGUOUS and RANGE flag combinations, ensuring that
only CONTIGUOUS-alone allocations use try_harder fallback, while other
combinations return -EINVAL when rounded size exceeds memory, preventing
BUG_ON assertions.

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 5f40b5343bd8..e6f8459c6c54 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -857,6 +857,40 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 	drm_buddy_fini(&mm);
 }
 
+static void drm_test_buddy_alloc_exceeds_max_order(struct kunit *test)
+{
+	u64 mm_size = SZ_8G + SZ_2G, size = SZ_8G + SZ_1G, min_block_size = SZ_8G;
+	struct drm_buddy mm;
+	LIST_HEAD(blocks);
+	int err;
+
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, SZ_4K),
+			       "buddy_init failed\n");
+
+	/* CONTIGUOUS allocation should succeed via try_harder fallback */
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size, size,
+							    SZ_4K, &blocks,
+							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc hit an error size=%llu\n", size);
+	drm_buddy_free_list(&mm, &blocks, 0);
+
+	/* Non-CONTIGUOUS with large min_block_size should return -EINVAL */
+	err = drm_buddy_alloc_blocks(&mm, 0, mm_size, size, min_block_size, &blocks, 0);
+	KUNIT_EXPECT_EQ(test, err, -EINVAL);
+
+	/* Non-CONTIGUOUS + RANGE with large min_block_size should return -EINVAL */
+	err = drm_buddy_alloc_blocks(&mm, 0, mm_size, size, min_block_size, &blocks,
+				     DRM_BUDDY_RANGE_ALLOCATION);
+	KUNIT_EXPECT_EQ(test, err, -EINVAL);
+
+	/* CONTIGUOUS + RANGE should return -EINVAL (no try_harder for RANGE) */
+	err = drm_buddy_alloc_blocks(&mm, 0, mm_size, size, SZ_4K, &blocks,
+				     DRM_BUDDY_CONTIGUOUS_ALLOCATION | DRM_BUDDY_RANGE_ALLOCATION);
+	KUNIT_EXPECT_EQ(test, err, -EINVAL);
+
+	drm_buddy_fini(&mm);
+}
+
 static int drm_buddy_suite_init(struct kunit_suite *suite)
 {
 	while (!random_seed)
@@ -877,6 +911,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
 	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
+	KUNIT_CASE(drm_test_buddy_alloc_exceeds_max_order),
 	{}
 };
 
-- 
2.52.0

