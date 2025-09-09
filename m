Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC7B4A917
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3466F10E682;
	Tue,  9 Sep 2025 09:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SbBfHwPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E4E10E67C;
 Tue,  9 Sep 2025 09:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtbPDn/cOQobs4CNGQTZDo+w9m0mw2w6cFABTlj0qjIo17cbLYVl0Zr6CNfwIzzl8xYvqxgz28YdYWlsxzWs568SpguCyckybWAr/z1/s8pjyF3iGWW/nx0+cs9sBt0routdO57rOBHBSYmJecjKZ7xjnn1yKEyVjLw9r4ewzmAUpRzQroO9nxwpCcnaz6dpN1maEPC6o+0zYOnSoveD5KV3cwvXUQQSv7pl8P9osmJyD1O0pATfQDpoj9lW+MlUXCTi6uA3FpXSBWycvs3EYxlUQoZhU9nqk9pwVHIM0fxw3TrPjl0DrtX/c+h8jCJN3rRc9v5PQRcRp+GAJ4MGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaO2TSbV2cSfE+O6WnDquomBLyaI6Cp/1o1rrMiZ/ls=;
 b=uhIcNvIMw9lAvSwvRNwXGUVNjdAjKxJ8MggUo2leHYGvZCmnPy27t4/BOtsS1f4FiuTsHE4YrpKy8BJQLihiqrRKUeDfHsMYBcLhU+UrSoDObN4STkyYpyQh2O2NTnDaoynRA9GGmdfqzfv0rsije9MzD6AicjKLIKfmNxnpPsL8MWd31prhWvduAdw/PzvF9uItlOYpHYd6q/MURTusK7E7Zdn9aI1Td6FGFaeRxCos3GM48Z8tCUszudgyMWrVoJ+HmLXfN5p4GzswyRxbm16S7URUQnoWrTEIqZTZxDT4XzA0v2ALr7zk36eAxQsBgV7xXYAlQ/i1KA5FQFcdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaO2TSbV2cSfE+O6WnDquomBLyaI6Cp/1o1rrMiZ/ls=;
 b=SbBfHwPNM58wXkCUprb+cer2UCVw0hSRz+LPIm0CSALMV6FuXlfmaujRxKvQ5C5uT0g2w/pHKZ+oEspjcwX0iBnFa21L37zHfmOHM9L7LDxmpO1TUVpo7JBPMDzx+XXq6UnK0TYKAanbCtNGTkkOo080b3geJa4RrzLFYdjT47o=
Received: from SN6PR2101CA0010.namprd21.prod.outlook.com
 (2603:10b6:805:106::20) by CYXPR12MB9443.namprd12.prod.outlook.com
 (2603:10b6:930:db::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 09:57:45 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:805:106:cafe::29) by SN6PR2101CA0010.outlook.office365.com
 (2603:10b6:805:106::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.4 via Frontend Transport; Tue, 9
 Sep 2025 09:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 09:57:45 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Sep
 2025 02:57:40 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <jani.nikula@linux.intel.com>, <peterz@infradead.org>,
 <samuel.pitoiset@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v5 3/3] drm/buddy: Add KUnit tests for allocator performance
 under fragmentation
Date: Tue, 9 Sep 2025 15:27:19 +0530
Message-ID: <20250909095719.489869-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fe99ac-004e-44a1-3da3-08ddef875359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H4aBYQiGjmxhUpxvaVmxQ8G9lTIvDrwq3tpftCLy+91xHnGLmrFyqyQ18cC9?=
 =?us-ascii?Q?7urh8zWXINb4WrFUBuvMZKkBcNOgPE7mHKRHiW2gxRv9JwGx50aXTBILLdrY?=
 =?us-ascii?Q?GNc75SGg8qDwwNitBUJbiQEvKszAqt6k+/oaZsUkVZ5+4ybgOhkFqhEfqhnN?=
 =?us-ascii?Q?d+SBF4W+vNfZ8PCXwh5MZzhD4wHNJj+/AAoV4ko7u7onACn7jaNmv8nqrgr5?=
 =?us-ascii?Q?25TnaNLUs06QvcIyh+1CaKsaKh8QD6m8wLQrEwsL5NVjwpz0Q7jkWCKhr0OX?=
 =?us-ascii?Q?zWpiHxiktky4NgGXYZh8AAb7m6iCrPYoj6QvTnCvFPbbJ5kQXEhRD41Kh+eb?=
 =?us-ascii?Q?knMA6uyOga7OddleSOPkVRRujC7FWyZajmUS3/ULa+xpadtGbc/GIiz8OLTh?=
 =?us-ascii?Q?k+DvvhFx1PxHLTEHhd68nVlIvuSv1vltkWtFWNmalO1ipszvuYHtc9tbwyEH?=
 =?us-ascii?Q?zeKoPc58g0VNu+UBMpvXwF6VeR5NxH6Hmjw1lmCBGi119MLjaoHRt38oURqm?=
 =?us-ascii?Q?K0PyNzsGYSM3LBKiQ0Ddu8CAuiMTWMrWbdRu9xOidGC8/NJ9ak9r9VtN565V?=
 =?us-ascii?Q?de30v4br3+1GCCrAhtcRFtYDHqepsuho944RnUQpiwp5ZXUKJyiVA2T0i2ok?=
 =?us-ascii?Q?sV1CWapEczAyjJWm0Lowd/xibaoUTDPR8Gsh0+pzfGekhza4hhaYan2whupM?=
 =?us-ascii?Q?zEjl+GI7CMLuEWB8dwOtrhYPbWboyi42mI+8czr8c0f8Ge/3PH+EwiBO/rLq?=
 =?us-ascii?Q?uh2HgS+qpZ20ShZNdaPuO4ahqTBFHC4sxcE7qEe1DMaW0kqigubFAP4uOBSo?=
 =?us-ascii?Q?c1ZtE3nHKMs95DpjddQ08cbcTI1XEVrk3Bv/ylFAa6InduE6QPusrjMuhLW7?=
 =?us-ascii?Q?NkhuwjoF9NbhnkZmZjZAlRz3Ue5h5VBBhT9I2QSeIm7Hsj1AtmTzCDPgbRZB?=
 =?us-ascii?Q?UxUwwpC1RKPccOSncPEltSHq+CHmV7VCtGpoErZ2SQqwLoUYQleZPeFL3hJ3?=
 =?us-ascii?Q?TWg/z6P5fVH9dSVKtDoaVSo0lFariM+RtJ7UgTAnFWboIgUpTrPyuJYfI+ND?=
 =?us-ascii?Q?bwMIHJBYchPXdUYntcRJ0zh0hTxke1C3vOdb0pOmv0Y8SrJNNMCo4TzRVm41?=
 =?us-ascii?Q?n6aWUIJILZB68XfgLQymD11YhoM0Jj8C0w5EPJjICpxG7omAbbgRlq0qNRE8?=
 =?us-ascii?Q?NQWxSA/PPJhCUlqW3K3ess4bfoMLkHLK8c3lBmCSTNVvqr6vjB6DhHni0B0p?=
 =?us-ascii?Q?yRqSp01amYCScjBgYC49IxtMGS+h1DnmlKySl1uIzGxJjUJEvUCfIR5Exyov?=
 =?us-ascii?Q?W88npQLuBTautJIcn5iZEBGGzryZGaXI1iMuZ/eZTh2Uq+Ribix6Tx3xQUm6?=
 =?us-ascii?Q?0cq/cGSv/WEY/lQrrMOEFz7GmqvTbUCUuYGjhFUjVmUSmcPuLAqsqYUj5p+/?=
 =?us-ascii?Q?4l1ySZ+kmtqOOEPNop5siy8xIOiMCqrtGQhLVFQrwxQPCJuq6YRU600LhLOU?=
 =?us-ascii?Q?BePWqwA/RvZKSwSM8KE8O+dsgw7EMbiO4rYh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 09:57:45.3844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fe99ac-004e-44a1-3da3-08ddef875359
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443
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

Add KUnit test cases that create severe memory fragmentation and
measure allocation/free performance.

The tests simulate two scenarios -

1. Allocation under severe fragmentation
   - Allocate the entire 4 GiB space as 8 KiB blocks with 64 KiB alignment,
     split them into two groups and free with mixed flags to block coalescing.
   - Repeatedly allocate and free 64 KiB blocks while timing the loop.
   - Freelist runtime: 76475 ms(76.5 seconds), soft-lockup triggered.
     RB-tree runtime: 186 ms.

2. Reverse free order under fragmentation
   - Create a similarly fragmented space, free half the blocks, reverse
     the order of the remainder, and release them with the cleared flag.
   - Freelist runtime: 85620 ms(85.6 seconds).
     RB-tree runtime: 114 ms.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 110 +++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 7a0e523651f0..19b49fb6ec19 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -21,6 +21,115 @@ static inline u64 get_size(int order, u64 chunk_size)
 	return (1 << order) * chunk_size;
 }
 
+static void drm_test_buddy_fragmentation_performance(struct kunit *test)
+{
+	const unsigned long max_acceptable_time_ms = 1000;
+	struct drm_buddy_block *block, *tmp;
+	int num_blocks, i, ret, count = 0;
+	LIST_HEAD(allocated_blocks);
+	unsigned long elapsed_ms;
+	LIST_HEAD(reverse_list);
+	LIST_HEAD(test_blocks);
+	LIST_HEAD(clear_list);
+	LIST_HEAD(dirty_list);
+	LIST_HEAD(free_list);
+	struct drm_buddy mm;
+	u64 mm_size = SZ_4G;
+	ktime_t start, end;
+
+	/*
+	 * Allocation under severe fragmentation
+	 *
+	 * Create severe fragmentation by allocating the entire 4 GiB address space
+	 * as tiny 8 KiB blocks but forcing a 64 KiB alignment. The resulting pattern
+	 * leaves many scattered holes. Split the allocations into two groups and
+	 * return them with different flags to block coalescing, then repeatedly
+	 * allocate and free 64 KiB blocks while timing the loop. This stresses how
+	 * quickly the allocator can satisfy larger, aligned requests from a pool of
+	 * highly fragmented space.
+	 */
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, SZ_4K),
+			       "buddy_init failed\n");
+
+	num_blocks = mm_size / SZ_64K;
+
+	start = ktime_get();
+	/* Allocate with maximum fragmentation - 8K blocks with 64K alignment */
+	for (i = 0; i < num_blocks; i++)
+		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size, SZ_8K, SZ_64K,
+								    &allocated_blocks, 0),
+					"buddy_alloc hit an error size=%u\n", SZ_8K);
+
+	list_for_each_entry_safe(block, tmp, &allocated_blocks, link) {
+		if (count % 4 == 0 || count % 4 == 3)
+			list_move_tail(&block->link, &clear_list);
+		else
+			list_move_tail(&block->link, &dirty_list);
+		count++;
+	}
+
+	/* Free with different flags to ensure no coalescing */
+	drm_buddy_free_list(&mm, &clear_list, DRM_BUDDY_CLEARED);
+	drm_buddy_free_list(&mm, &dirty_list, 0);
+
+	for (i = 0; i < num_blocks; i++)
+		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size, SZ_64K, SZ_64K,
+								    &test_blocks, 0),
+					"buddy_alloc hit an error size=%u\n", SZ_64K);
+	drm_buddy_free_list(&mm, &test_blocks, 0);
+
+	end = ktime_get();
+	elapsed_ms = ktime_to_ms(ktime_sub(end, start));
+	/* Performance validation */
+	KUNIT_EXPECT_LT_MSG(test, elapsed_ms, max_acceptable_time_ms,
+			    "Fragmented allocation took %lu ms (max acceptable: %lu ms)",
+			    elapsed_ms, max_acceptable_time_ms);
+	drm_buddy_fini(&mm);
+
+	/*
+	 * Reverse free order under fragmentation
+	 *
+	 * Construct a fragmented 4 GiB space by allocating every 8 KiB block with
+	 * 64 KiB alignment, creating a dense scatter of small regions. Half of the
+	 * blocks are selectively freed to form sparse gaps, while the remaining
+	 * allocations are preserved, reordered in reverse, and released back with
+	 * the cleared flag. This models a pathological reverse-ordered free pattern
+	 * and measures how quickly the allocator can merge and reclaim space when
+	 * deallocation occurs in the opposite order of allocation, exposing the
+	 * cost difference between a linear freelist scan and an ordered tree lookup.
+	 */
+	ret = drm_buddy_init(&mm, mm_size, SZ_4K);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	start = ktime_get();
+	/* Allocate maximum fragmentation */
+	for (i = 0; i < num_blocks; i++)
+		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size, SZ_8K, SZ_64K,
+								    &allocated_blocks, 0),
+					"buddy_alloc hit an error size=%u\n", SZ_8K);
+
+	list_for_each_entry_safe(block, tmp, &allocated_blocks, link) {
+		if (count % 2 == 0)
+			list_move_tail(&block->link, &free_list);
+		count++;
+	}
+	drm_buddy_free_list(&mm, &free_list, DRM_BUDDY_CLEARED);
+
+	list_for_each_entry_safe_reverse(block, tmp, &allocated_blocks, link)
+		list_move(&block->link, &reverse_list);
+	drm_buddy_free_list(&mm, &reverse_list, DRM_BUDDY_CLEARED);
+
+	end = ktime_get();
+	elapsed_ms = ktime_to_ms(ktime_sub(end, start));
+
+	/* Performance validation */
+	KUNIT_EXPECT_LT_MSG(test, elapsed_ms, max_acceptable_time_ms,
+			    "Reverse-ordered free took %lu ms (max acceptable: %lu ms)",
+			    elapsed_ms, max_acceptable_time_ms);
+
+	drm_buddy_fini(&mm);
+}
+
 static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 {
 	u32 mm_size, size, ps, bias_size, bias_start, bias_end, bias_rem;
@@ -772,6 +881,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
 	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
+	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
 	{}
 };
 
-- 
2.34.1

