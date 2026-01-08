Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66820D026AC
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 12:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F19F10E6F6;
	Thu,  8 Jan 2026 11:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2HvGj0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3933210E6F3;
 Thu,  8 Jan 2026 11:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767872043; x=1799408043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O9OKzb82aehrtdtLLN/pGjjQh2VlqlZUawKxMMshgts=;
 b=A2HvGj0XxLL58WZBT++IvLd6e66/L1oLhr+CRB19eMQN2Ped06wgkXEJ
 VZyStl5qQ+Fk5ob1Bo1CwcEqWDy63JWnReWyDpg63pctmPp+5c5NQT61R
 txyL32Jw3ZJrgH9bgmhEtU8t553tJkXfUqCABeTMudeh8Ao/HFaTg6ZfA
 KR7qlNdUg1MMOnYEBV3ct3skUz8GfAHcOpdLKXjeAL2lPtvKPG98f4IkZ
 BpZuNOBMGubTcjEiyNpZeKQhGwQwJ2KzyyeS9UF48ZOs7IVkPdguk+9qI
 ohnFrToJa14tKRej3SHRfibnWWZsjSW1IA/xzrQD3LYPBVaBp8V8ZTLKg w==;
X-CSE-ConnectionGUID: sBQ7JGd/ReyTvkyXuxIKdQ==
X-CSE-MsgGUID: d3B3mku4RHqasSTad6PpCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="71824661"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="71824661"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 03:34:03 -0800
X-CSE-ConnectionGUID: ckJRLKW1RgybaOEVFRcsVg==
X-CSE-MsgGUID: gVuMBuWWQRaboSGc1C6+3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="208024049"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 03:34:01 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/2] drm/tests/drm_buddy: Add tests for allocations
 exceeding max_order
Date: Thu,  8 Jan 2026 17:02:30 +0530
Message-ID: <20260108113227.2101872-6-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108113227.2101872-4-sanjay.kumar.yadav@intel.com>
References: <20260108113227.2101872-4-sanjay.kumar.yadav@intel.com>
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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

