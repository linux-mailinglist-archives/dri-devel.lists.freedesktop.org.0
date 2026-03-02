Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJr+An2opWmpDgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:10:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D531DB82E
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8163710E068;
	Mon,  2 Mar 2026 15:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsUbhPlG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9A410E045;
 Mon,  2 Mar 2026 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772464249; x=1804000249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EoqTsk/E62r3ys5VvD40GGl5AX1bEyjIl0bpZmmEgAc=;
 b=dsUbhPlGEpLdQF6XxMSUmOmQvMmM/y+V5QvWSHF6uAEg5ZWntQhe85BR
 XKJ12Sp9Sm3kiPXQO5G3PqDfI/zCvXKTUVBVpOSvVozT/GEXKgqcxwkGJ
 jjNLWfgMxMT0czeA8QRjKgb3Cv1s+/tDiQRfWQ8d9W6TjumPJ/VpqnVjS
 T4Y9WRWZAbpFYeT02ZnFRhvPZn3dc9iiJPzjT9IoqDl6je4+8QO/wyi4D
 gG7GLiZALKY+OKTo0PxCc/z4R/5Rc+GsKONRtMfuMK7z2XGGE/e8nNnKQ
 i17bPRVTPI4ZB/dcIV2yBsyn64/dnwwX3xZFGiW9+R+4wozY7eslItcVa w==;
X-CSE-ConnectionGUID: QH5Rfdy0TJumQ5HVq5KTVA==
X-CSE-MsgGUID: bhSmnaOVQv25+EN6gBP5wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="72672457"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="72672457"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 07:10:49 -0800
X-CSE-ConnectionGUID: ljUTpfIITSe8oDvbtGqkow==
X-CSE-MsgGUID: 9hVHehVhQBOP89Gv2jP9og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="215307293"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 07:10:47 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] gpu/tests/gpu_buddy: Add gpu_test_buddy_alloc_range for
 exact-range allocation
Date: Mon,  2 Mar 2026 20:39:46 +0530
Message-ID: <20260302150947.47535-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Queue-Id: 57D531DB82E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action

Add a new kunit test gpu_test_buddy_alloc_range() that exercises the
__gpu_buddy_alloc_range() exact-range allocation path, triggered when
start + size == end with flags=0.

The test covers:
- Basic exact-range allocation of the full mm
- Exact-range allocation of equal sub-ranges (quarters)
- Minimum chunk-size exact ranges at start, middle, and end offsets
- Non power-of-two mm size with multiple roots, including cross-root
  exact-range allocation
- Randomized exact-range allocations of N contiguous page-aligned
  slices in random order
- Negative: partially allocated range must reject overlapping exact
  alloc
- Negative: checkerboard allocation pattern rejects exact range over
  partially occupied pairs
- Negative: misaligned start, unaligned size, and out-of-bounds end
- Free and re-allocate the same exact range across multiple iterations
- Various power-of-two exact ranges at natural alignment

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/tests/gpu_buddy_test.c | 327 +++++++++++++++++++++++++++++
 1 file changed, 327 insertions(+)

diff --git a/drivers/gpu/tests/gpu_buddy_test.c b/drivers/gpu/tests/gpu_buddy_test.c
index 5429010f34d3..9738fd09518f 100644
--- a/drivers/gpu/tests/gpu_buddy_test.c
+++ b/drivers/gpu/tests/gpu_buddy_test.c
@@ -362,6 +362,332 @@ static void gpu_test_buddy_alloc_range_bias(struct kunit *test)
 	gpu_buddy_fini(&mm);
 }
 
+static void gpu_test_buddy_alloc_range(struct kunit *test)
+{
+	GPU_RND_STATE(prng, random_seed);
+	struct gpu_buddy_block *block;
+	struct gpu_buddy mm;
+	u32 mm_size, total;
+	LIST_HEAD(blocks);
+	LIST_HEAD(tmp);
+	u32 ps = SZ_4K;
+	int ret;
+
+	mm_size = SZ_16M;
+
+	KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_init(&mm, mm_size, ps),
+			       "buddy_init failed\n");
+
+	/*
+	 * Basic exact-range allocation.
+	 * Allocate the entire mm as one exact range (start + size == end).
+	 * This is the simplest case exercising __gpu_buddy_alloc_range.
+	 */
+	ret = gpu_buddy_alloc_blocks(&mm, 0, mm_size, mm_size, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ_MSG(test, ret, 0,
+			    "exact-range alloc of full mm failed\n");
+
+	total = 0;
+	list_for_each_entry(block, &blocks, link) {
+		u64 offset = gpu_buddy_block_offset(block);
+		u64 bsize = gpu_buddy_block_size(&mm, block);
+
+		KUNIT_EXPECT_TRUE_MSG(test, offset + bsize <= (u64)mm_size,
+				      "block [%llx, %llx) outside mm\n", offset, offset + bsize);
+		total += (u32)bsize;
+	}
+	KUNIT_EXPECT_EQ(test, total, mm_size);
+	KUNIT_EXPECT_EQ(test, mm.avail, 0ULL);
+
+	/* Full mm should be exhausted */
+	ret = gpu_buddy_alloc_blocks(&mm, 0, ps, ps, ps, &tmp, 0);
+	KUNIT_EXPECT_NE_MSG(test, ret, 0, "alloc should fail when mm is full\n");
+
+	gpu_buddy_free_list(&mm, &blocks, 0);
+	KUNIT_EXPECT_EQ(test, mm.avail, (u64)mm_size);
+	gpu_buddy_fini(&mm);
+
+	/*
+	 * Exact-range allocation of sub-ranges.
+	 * Split the mm into four equal quarters and allocate each as an exact
+	 * range. Validates splitting and non-overlapping exact allocations.
+	 */
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+
+	{
+		u32 quarter = mm_size / 4;
+		int i;
+
+		for (i = 0; i < 4; i++) {
+			u32 start = i * quarter;
+			u32 end = start + quarter;
+
+			ret = gpu_buddy_alloc_blocks(&mm, start, end, quarter, ps, &blocks, 0);
+			KUNIT_ASSERT_EQ_MSG(test, ret, 0,
+					    "exact-range alloc quarter %d [%x, %x) failed\n",
+					    i, start, end);
+		}
+		KUNIT_EXPECT_EQ(test, mm.avail, 0ULL);
+		gpu_buddy_free_list(&mm, &blocks, 0);
+	}
+
+	gpu_buddy_fini(&mm);
+
+	/*
+	 * Minimum chunk-size exact range at various offsets.
+	 * Allocate single-page exact ranges at the start, middle and end.
+	 */
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+
+	ret = gpu_buddy_alloc_blocks(&mm, 0, ps, ps, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = gpu_buddy_alloc_blocks(&mm, mm_size / 2, mm_size / 2 + ps, ps, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = gpu_buddy_alloc_blocks(&mm, mm_size - ps, mm_size, ps, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	total = 0;
+	list_for_each_entry(block, &blocks, link)
+		total += (u32)gpu_buddy_block_size(&mm, block);
+	KUNIT_EXPECT_EQ(test, total, 3 * ps);
+
+	gpu_buddy_free_list(&mm, &blocks, 0);
+	gpu_buddy_fini(&mm);
+
+	/*
+	 * Non power-of-two mm size (multiple roots).
+	 * Exact-range allocations that span root boundaries must still work.
+	 */
+	mm_size = SZ_4M + SZ_2M + SZ_1M; /* 7 MiB, three roots */
+
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+	KUNIT_EXPECT_GT(test, mm.n_roots, 1U);
+
+	/* Allocate first 4M root exactly */
+	ret = gpu_buddy_alloc_blocks(&mm, 0, SZ_4M, SZ_4M, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Allocate second root (4M-6M) exactly */
+	ret = gpu_buddy_alloc_blocks(&mm, SZ_4M, SZ_4M + SZ_2M, SZ_2M, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Allocate third root (6M-7M) exactly */
+	ret = gpu_buddy_alloc_blocks(&mm, SZ_4M + SZ_2M, mm_size, SZ_1M, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, mm.avail, 0ULL);
+	gpu_buddy_free_list(&mm, &blocks, 0);
+
+	/* Cross-root exact-range: the entire non-pot mm */
+	ret = gpu_buddy_alloc_blocks(&mm, 0, mm_size, mm_size, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, mm.avail, 0ULL);
+
+	gpu_buddy_free_list(&mm, &blocks, 0);
+	gpu_buddy_fini(&mm);
+
+	/*
+	 * Randomized exact-range allocations.
+	 * Divide the mm into N random-sized, contiguous, page-aligned slices
+	 * and allocate each as an exact range in random order.
+	 */
+	mm_size = SZ_16M;
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+
+	{
+#define N_RAND_RANGES 16
+		u32 ranges[N_RAND_RANGES + 1]; /* boundaries */
+		u32 order_arr[N_RAND_RANGES];
+		u32 remaining = mm_size;
+		int i;
+
+		ranges[0] = 0;
+		for (i = 0; i < N_RAND_RANGES - 1; i++) {
+			u32 max_chunk = remaining - (N_RAND_RANGES - 1 - i) * ps;
+			u32 sz = max(round_up(prandom_u32_state(&prng) % max_chunk, ps), ps);
+
+			ranges[i + 1] = ranges[i] + sz;
+			remaining -= sz;
+		}
+		ranges[N_RAND_RANGES] = mm_size;
+
+		/* Create a random order */
+		for (i = 0; i < N_RAND_RANGES; i++)
+			order_arr[i] = i;
+		for (i = N_RAND_RANGES - 1; i > 0; i--) {
+			u32 j = prandom_u32_state(&prng) % (i + 1);
+			u32 tmp_val = order_arr[i];
+
+			order_arr[i] = order_arr[j];
+			order_arr[j] = tmp_val;
+		}
+
+		for (i = 0; i < N_RAND_RANGES; i++) {
+			u32 idx = order_arr[i];
+			u32 start = ranges[idx];
+			u32 end = ranges[idx + 1];
+			u32 sz = end - start;
+
+			ret = gpu_buddy_alloc_blocks(&mm, start, end, sz, ps, &blocks, 0);
+			KUNIT_ASSERT_EQ_MSG(test, ret, 0,
+					    "random exact-range [%x, %x) sz=%x failed\n",
+					    start, end, sz);
+		}
+
+		KUNIT_EXPECT_EQ(test, mm.avail, 0ULL);
+		gpu_buddy_free_list(&mm, &blocks, 0);
+#undef N_RAND_RANGES
+	}
+
+	gpu_buddy_fini(&mm);
+
+	/*
+	 * Negative case - partially allocated range.
+	 * Allocate the first half, then try to exact-range allocate the full
+	 * mm. This must fail because the first half is already occupied.
+	 */
+	mm_size = SZ_16M;
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+
+	ret = gpu_buddy_alloc_blocks(&mm, 0, mm_size / 2, mm_size / 2, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = gpu_buddy_alloc_blocks(&mm, 0, mm_size, mm_size, ps, &tmp, 0);
+	KUNIT_EXPECT_NE_MSG(test, ret, 0,
+			    "exact-range alloc should fail when range is partially used\n");
+
+	/* Also try the already-occupied sub-range directly */
+	ret = gpu_buddy_alloc_blocks(&mm, 0, mm_size / 2, mm_size / 2, ps, &tmp, 0);
+	KUNIT_EXPECT_NE_MSG(test, ret, 0,
+			    "double alloc of same exact range should fail\n");
+
+	/* The free second half should still be allocatable */
+	ret = gpu_buddy_alloc_blocks(&mm, mm_size / 2, mm_size, mm_size / 2, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, mm.avail, 0ULL);
+	gpu_buddy_free_list(&mm, &blocks, 0);
+	gpu_buddy_fini(&mm);
+
+	/*
+	 * Negative case - checkerboard partial allocation.
+	 * Allocate every other page-sized chunk in a small mm, then try to
+	 * exact-range allocate a range covering two pages (one allocated, one
+	 * free). This must fail.
+	 */
+	mm_size = SZ_64K;
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+
+	{
+		u32 off;
+
+		for (off = 0; off < mm_size; off += 2 * ps) {
+			ret = gpu_buddy_alloc_blocks(&mm, off, off + ps, ps, ps, &blocks, 0);
+			KUNIT_ASSERT_EQ(test, ret, 0);
+		}
+
+		/* Try exact range over a pair [allocated, free] */
+		ret = gpu_buddy_alloc_blocks(&mm, 0, 2 * ps, 2 * ps, ps, &tmp, 0);
+		KUNIT_EXPECT_NE_MSG(test, ret, 0,
+				    "exact-range over partially allocated pair should fail\n");
+
+		/* The free pages individually should still work */
+		ret = gpu_buddy_alloc_blocks(&mm, ps, 2 * ps, ps, ps, &blocks, 0);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		gpu_buddy_free_list(&mm, &blocks, 0);
+	}
+
+	gpu_buddy_fini(&mm);
+
+	/* Negative case - misaligned start/end/size */
+	mm_size = SZ_16M;
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+
+	/* start not aligned to chunk_size */
+	ret = gpu_buddy_alloc_blocks(&mm, ps / 2, ps / 2 + ps, ps, ps, &tmp, 0);
+	KUNIT_EXPECT_NE(test, ret, 0);
+
+	/* size not aligned */
+	ret = gpu_buddy_alloc_blocks(&mm, 0, ps + 1, ps + 1, ps, &tmp, 0);
+	KUNIT_EXPECT_NE(test, ret, 0);
+
+	/* end exceeds mm size */
+	ret = gpu_buddy_alloc_blocks(&mm, mm_size, mm_size + ps, ps, ps, &tmp, 0);
+	KUNIT_EXPECT_NE(test, ret, 0);
+
+	gpu_buddy_fini(&mm);
+
+	/*
+	 * Free and re-allocate the same exact range.
+	 * This exercises merge-on-free followed by exact-range re-split.
+	 */
+	mm_size = SZ_16M;
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+
+	{
+		int i;
+
+		for (i = 0; i < 5; i++) {
+			ret = gpu_buddy_alloc_blocks(&mm, SZ_4M, SZ_4M + SZ_2M,
+						     SZ_2M, ps, &blocks, 0);
+			KUNIT_ASSERT_EQ_MSG(test, ret, 0,
+					    "re-alloc iteration %d failed\n", i);
+
+			total = 0;
+			list_for_each_entry(block, &blocks, link) {
+				u64 offset = gpu_buddy_block_offset(block);
+				u64 bsize = gpu_buddy_block_size(&mm, block);
+
+				KUNIT_EXPECT_GE(test, offset, (u64)SZ_4M);
+				KUNIT_EXPECT_LE(test, offset + bsize, (u64)(SZ_4M + SZ_2M));
+				total += (u32)bsize;
+			}
+			KUNIT_EXPECT_EQ(test, total, SZ_2M);
+
+			gpu_buddy_free_list(&mm, &blocks, 0);
+		}
+
+		KUNIT_EXPECT_EQ(test, mm.avail, (u64)mm_size);
+	}
+
+	gpu_buddy_fini(&mm);
+
+	/*
+	 * Various power-of-two exact ranges within a large mm.
+	 * Allocate non-overlapping power-of-two exact ranges at their natural
+	 * alignment, validating that the allocator handles different orders.
+	 */
+	mm_size = SZ_16M;
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+
+	/* Allocate 4K at offset 0 */
+	ret = gpu_buddy_alloc_blocks(&mm, 0, SZ_4K, SZ_4K, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Allocate 64K at offset 64K */
+	ret = gpu_buddy_alloc_blocks(&mm, SZ_64K, SZ_64K + SZ_64K, SZ_64K, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Allocate 1M at offset 1M */
+	ret = gpu_buddy_alloc_blocks(&mm, SZ_1M, SZ_1M + SZ_1M, SZ_1M, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Allocate 4M at offset 4M */
+	ret = gpu_buddy_alloc_blocks(&mm, SZ_4M, SZ_4M + SZ_4M, SZ_4M, ps, &blocks, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	total = 0;
+	list_for_each_entry(block, &blocks, link)
+		total += (u32)gpu_buddy_block_size(&mm, block);
+	KUNIT_EXPECT_EQ(test, total, SZ_4K + SZ_64K + SZ_1M + SZ_4M);
+
+	gpu_buddy_free_list(&mm, &blocks, 0);
+	gpu_buddy_fini(&mm);
+}
+
 static void gpu_test_buddy_alloc_clear(struct kunit *test)
 {
 	unsigned long n_pages, total, i = 0;
@@ -909,6 +1235,7 @@ static struct kunit_case gpu_buddy_tests[] = {
 	KUNIT_CASE(gpu_test_buddy_alloc_pathological),
 	KUNIT_CASE(gpu_test_buddy_alloc_contiguous),
 	KUNIT_CASE(gpu_test_buddy_alloc_clear),
+	KUNIT_CASE(gpu_test_buddy_alloc_range),
 	KUNIT_CASE(gpu_test_buddy_alloc_range_bias),
 	KUNIT_CASE_SLOW(gpu_test_buddy_fragmentation_performance),
 	KUNIT_CASE(gpu_test_buddy_alloc_exceeds_max_order),
-- 
2.52.0

