Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CFDB4ACE5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8EB10E6DB;
	Tue,  9 Sep 2025 11:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kkHnUUMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497BF10E6E2;
 Tue,  9 Sep 2025 11:53:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPXe4dLjTSxIlohVAtxegyF3aVPvKIfHDNrk0TqDlu3Ez9GiuAeM4H/PI50rO7xBO4XsvDkTSJQ/sZNUScrOKDg81HX5gZqDjX0NauSuLz5EW1SyXpPCp9/sMwtHLTu7c3dBsH5ulda6+eKRLa8VvFxFg3WGb02S6Q8l9cN77XOn5T1HuG2Ah0zYTXddrFHm9AdMjOrdP5Wc+TJdBsDPRgLDXM1a7YRKBZ+ZHHq0TqOJRmrYpJCHkTA2BzX8/LTttxqcyjgLe6msLYZ4dPNnHWDfNA9/HzlGGm72pafN9O8Z7kl+UTzYSZE9RcTvgK0J77wRY8nkbVR5tkCQTLi7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaO2TSbV2cSfE+O6WnDquomBLyaI6Cp/1o1rrMiZ/ls=;
 b=diIlZ4XCqVqOhC2SytIEX++stuVm+P/OQNS5iM6O1m+K29zqH12UES+Jf/+uoWSAMwuc9GQlG+Zib2hM3Vk1gEbR8Bs710Ty8BAwiGoET4U/a9QvPk2QMH6I0rfg/x/utvLstdsga5uwYrapMH5W/EgL7bZw1ejGuxJldzbU3b5Bq2ekDvnd/Ef1o5FASfoXqPpwK1Rbcq3zRZDBklx8AXhmLTqZOZM/rlbypK3waAJTo2ot4PG4Hogo50iGbCeyjcDIHzxObsHP1KH/i4ab4Ln+1eol4rBE0GijSoRXqmJWzYTvpFC0jRgpXZzb8Bx1A+X+p7spBhJmfti3ZfUCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaO2TSbV2cSfE+O6WnDquomBLyaI6Cp/1o1rrMiZ/ls=;
 b=kkHnUUMQ11NC4tmO6gCHbtMT1sZKpfhLnVTqwMi5lZUV88Nfi164pjb+JeOoiQ29qzpgG7O+8capEoppXuqOiC6vuLChLYxijJJtFxjjxvUkF8q+7MbzR5vtxruKygb/sE1T0tozN1jnl2tl2HCsQXZLoTnLOXAnRcWeBpbcS1Q=
Received: from SJ0PR03CA0202.namprd03.prod.outlook.com (2603:10b6:a03:2ef::27)
 by DS0PR12MB9039.namprd12.prod.outlook.com (2603:10b6:8:de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 11:53:07 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::39) by SJ0PR03CA0202.outlook.office365.com
 (2603:10b6:a03:2ef::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Tue,
 9 Sep 2025 11:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 11:53:07 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Sep
 2025 04:53:03 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <jani.nikula@linux.intel.com>, <peterz@infradead.org>,
 <samuel.pitoiset@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v6 3/3] drm/buddy: Add KUnit tests for allocator performance
 under fragmentation
Date: Tue, 9 Sep 2025 17:22:37 +0530
Message-ID: <20250909115237.2644-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909115237.2644-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250909115237.2644-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|DS0PR12MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: c0655216-8aa9-4b51-1e54-08ddef97711e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wB4CG7pw/HMdpQ8R3XEgThi7Ryl8wc7gYjPX1ijUVDE4L6ij5KwxTVGPrEOu?=
 =?us-ascii?Q?5adSWOhiWqc1/QVZBxOZ9ivVR/JfsCT10yuM93TGPwAKi+URmtWkRAFAozLS?=
 =?us-ascii?Q?S94HIND7A3fwNyNShhnyrpv+DDQzZMVMvTEh11hQvmzFfsRnjYgTiYH97mYw?=
 =?us-ascii?Q?PWIg8GsgfGrdhlSDiNv/q+fRbTM77kotywfI2wlwnDzdPH0q8aRTBajo6aNe?=
 =?us-ascii?Q?ul7zX+zRBTCoXOWTNWA0dNeFdO4vbi6cNSI31J7+Ya8gbhd3Cg71p00kmU+5?=
 =?us-ascii?Q?TeCz6qe72wXFe1uCi8r2GWmhxET9NoBRljZa4arajkcD50CSoBES0WlGkJVS?=
 =?us-ascii?Q?D0O/FJLiswGAmIkQytMxKmXMEYokwT7CKDsm3/QWZOVD0fCq4jrMkMzW1YqF?=
 =?us-ascii?Q?rT7i7NB7QGrN5Vlbc+FGMxCQQ++7KzoYlzKvrE105Vj0ytE0+wLF+c0BOSNG?=
 =?us-ascii?Q?0mCXqqsYA5CRQrpMrcGUzpucZLIXWAcRscECSINsa9LYU30FyPmBBh7oxmFz?=
 =?us-ascii?Q?NjUKJRLG/J8l1j6Lv4J0u00V8D6mfc67IRRauNqmk9jbmouJ+4fBcTP/XYgm?=
 =?us-ascii?Q?aV+ippx3BG2l4FunjdfgVkI4PX6he6jZgYK6kJjzp2piPvfmUXzi/Uuk8E4s?=
 =?us-ascii?Q?xNnSIerXaeelY+cVqg7+tFZgnDtOtjD13U6WcSqA0n3ZR29eHAkdMQH38XJf?=
 =?us-ascii?Q?y+uDwTvfM9of7IP+2FM26Q4AEdB/jjyMy4KeQc9cjvJrX5FxznRw2+Lq0x7Y?=
 =?us-ascii?Q?p760b6wNUaBdqFBOHWwVnUOBrZhpnAMm1ZjJvP3ImXrMUCoDaQyin33ssm6U?=
 =?us-ascii?Q?LZdG5eubRqzxw/hAu619TkuxTWubJXS5ty8t/tB9v1hlK+8KffM6gw5V9wMX?=
 =?us-ascii?Q?cLJC+KdUmX4bRIV3lwfLZ+Edidorxvjl5aEz4VCi0VBvuirAAK1daCqWkIkU?=
 =?us-ascii?Q?DEDS8s9P3iPFrqmcndI2CcfGRxW/1Pn8JkM5WJudoo7GtBXOjcSM+rTM6K/B?=
 =?us-ascii?Q?cUGYza+PxqtvhpAy8uM+wl7TMNTsuYTAlzOZH5mQ5O4IY/XdAZQ5iMUf9D/J?=
 =?us-ascii?Q?xbNrDnfgTlhGz1rxNVKdAgcIt4xHqCy09QZ7XCNhQ59Rhh8XJC+Z5c6gJRft?=
 =?us-ascii?Q?IPhMtwhFDkwnkxCvEkvxrnPAERDP/kfjDkwlWL8koBuQ6LZVbM6Ddp/qaJhb?=
 =?us-ascii?Q?WoNCD+16w5en/zr7lpkzpgcOGYs961zCeR3KvIiO17osVEF9PzyyEG1VJp8v?=
 =?us-ascii?Q?DWQo1Yj7RgN+TZheQH3RmMnXq3KaKd1ckJvwpwBUIXyoVzPIJ+VBUiJRNcyn?=
 =?us-ascii?Q?csJY1+N/G3H+QxG8Zds8vdzuo5J/QFDYYqGV8Zs8O+EpcAwyLugQDc2ek0HX?=
 =?us-ascii?Q?EPogoAiTboC5+6XrLVPIH3K8+2UJ1yQa57UOBn+8cdf2j56mxs0y2Y7OkTUF?=
 =?us-ascii?Q?OVAmh1+txSY9eds6mFeeVpnqCi9GyjppgcYgaHK0zlBmDQPLVEMmYdbXR7LN?=
 =?us-ascii?Q?V71uQkS82mgMKmegPHI5UsVdVWax8dkRSOsT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 11:53:07.2042 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0655216-8aa9-4b51-1e54-08ddef97711e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9039
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

