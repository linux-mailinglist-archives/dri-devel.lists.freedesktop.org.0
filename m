Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2B884E350
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 15:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E323C10E833;
	Thu,  8 Feb 2024 14:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdrjA7Dc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF62210E833
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707403060; x=1738939060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qLk819BIk9SDpySjLPM5WMTvncZ0hzc27kQLovmlWt4=;
 b=BdrjA7DcIl3hDkRWYMO/t6rSgtE/aXETULrB0r/tZbhXL1rkmovHOzwc
 cuGIeAq29NxjZ2GrZMhCcMBrlH2BxP/8tj+lUVrunXbK/fteD3w/qzd5Q
 fN/tDk5QrFofKBVJqCu6wCm592CO0KINVmFaWFstw1fcKye1vayfgoOLX
 JdHqVGcpkiMKpp3X+LoQinNQ1Gjs6iA8Qulkyu+ongEs8bA97N4gEECZg
 2bE7FUP/HUIDUABX6KP+Sj08eqMe+sOnLGOpoCX7bxzEu//yztKwbDq+A
 Ix64EDnl8UbxpQTXEO+uIa9Xyoy/WABTX9/kxZU601M/C7mEI+zuTzeYD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="436364382"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="436364382"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="32735699"
Received: from pkawa-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.20.188])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:37:39 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/tests/drm_buddy: add alloc_contiguous test
Date: Thu,  8 Feb 2024 14:36:19 +0000
Message-ID: <20240208143618.247048-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
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

Sanity check DRM_BUDDY_CONTIGUOUS_ALLOCATION.

References: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Limonciello <mario.limonciello@amd.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 89 ++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index ea2af6bd9abe..4215d8b5fcf0 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -8,6 +8,7 @@
 
 #include <linux/prime_numbers.h>
 #include <linux/sched/signal.h>
+#include <linux/sizes.h>
 
 #include <drm/drm_buddy.h>
 
@@ -18,6 +19,93 @@ static inline u64 get_size(int order, u64 chunk_size)
 	return (1 << order) * chunk_size;
 }
 
+static void drm_test_buddy_alloc_contiguous(struct kunit *test)
+{
+	u64 mm_size, ps = SZ_4K, i, n_pages, total;
+	struct drm_buddy_block *block;
+	struct drm_buddy mm;
+	LIST_HEAD(left);
+	LIST_HEAD(middle);
+	LIST_HEAD(right);
+	LIST_HEAD(allocated);
+
+	mm_size = 16 * 3 * SZ_4K;
+
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
+
+	/*
+	 * Idea is to fragment the address space by alternating block
+	 * allocations between three different lists; one for left, middle and
+	 * right. We can then free a list to simulate fragmentation. In
+	 * particular we want to exercise the DRM_BUDDY_CONTIGUOUS_ALLOCATION,
+	 * including the try_harder path.
+	 */
+
+	i = 0;
+	n_pages = mm_size / ps;
+	do {
+		struct list_head *list;
+		int slot = i % 3;
+
+		if (slot == 0)
+			list = &left;
+		else if (slot == 1)
+			list = &middle;
+		else
+			list = &right;
+		KUNIT_ASSERT_FALSE_MSG(test,
+				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							      ps, ps, list, 0),
+				       "buddy_alloc hit an error size=%d\n",
+				       ps);
+	} while (++i < n_pages);
+
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							   3 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc didn't error size=%d\n", 3 * ps);
+
+	drm_buddy_free_list(&mm, &middle);
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							   3 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							   2 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
+
+	drm_buddy_free_list(&mm, &right);
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							   3 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
+	/*
+	 * At this point we should have enough contiguous space for 2 blocks,
+	 * however they are never buddies (since we freed middle and right) so
+	 * will require the try_harder logic to find them.
+	 */
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							   2 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc hit an error size=%d\n", 2 * ps);
+
+	drm_buddy_free_list(&mm, &left);
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							   3 * ps, ps, &allocated,
+							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
+			       "buddy_alloc hit an error size=%d\n", 3 * ps);
+
+	total = 0;
+	list_for_each_entry(block, &allocated, link)
+		total += drm_buddy_block_size(&mm, block);
+
+	KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
+
+	drm_buddy_free_list(&mm, &allocated);
+	drm_buddy_fini(&mm);
+}
+
 static void drm_test_buddy_alloc_pathological(struct kunit *test)
 {
 	u64 mm_size, size, start = 0;
@@ -280,6 +368,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_optimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pathological),
+	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
 	{}
 };
 
-- 
2.43.0

