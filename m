Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B78B951FD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0ED10E5B8;
	Tue, 23 Sep 2025 09:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ud5072bY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2C410E5B3;
 Tue, 23 Sep 2025 09:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8sdMk81QrJ52VGHUyS6+IPw02nOxy9ne8BnEfKNoRn4h0wuHLTyEibsbsW5SvftHtnGFwI5aPuJQ+/OkDAyeXWrYwr9AjkibS5csKmxsXCN5epLPpixpu+jauFaHUBPDzz/P6Tm4p8N5W+XLTnoBq53znBlS8X9IeW0DIvTO1KE3PTvNIoCNkAY2xQf9MmHqzhT1shuNCfSJUeFr78uVFVbnPrhFDYTgsFMlKsqXYg4atw4bT/B4vgiRFxKf8gqVcx401pQReKNErMbe1sYfARbHfPGQY9JbWxrlEwH1nZt72RETr0kLAA+HEml0O5DtLlTstdUeeOaraFhxy1Saw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaO2TSbV2cSfE+O6WnDquomBLyaI6Cp/1o1rrMiZ/ls=;
 b=PgHQcT2f3RoIeoLmIUDLcgdYwSL1QjozhxKEu+tx2hIhgI5JezvOLpsTvRCWjDQLMGxbVIfPVkAXc3gL7bbCCusCTcFThCCsBKdUe1Snl8JfUj8x6b5syx3xH7ndUo29wzr17wHnAawObp8MZkVJWP3zRAcfZFI/enmCOCr3zGLjjRUFEFXdl8eHIlLklhBHQXfx779A93OXkb4yPdXbtPdunPS3m2yzdlHxsBzk7FPbxTcpwfKCP0HXniECUGoyfq9n3xzKa0KO7HZdQFew4VN8iCNodASR5VCHqD+2VBTPpP8bpH8OCJDPsbsf7B00Y0W+OjA2TWIjoiw31v9Rzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaO2TSbV2cSfE+O6WnDquomBLyaI6Cp/1o1rrMiZ/ls=;
 b=Ud5072bY91KpsCLdYvFf5/k6X9PP0b7PZuw9ZI170FFvl9PDQwBVwteaTIClTt3Ch3TYb0W8zpejYhDIIwH7kg9z0GlH8Hb+BZWCQ/6GbVToIFWfCL0bmTu87b+bW5jD7Df44j2oE8VzX0l5HOulc6dspmrgZfNvY8Upcv2QKBg=
Received: from BN0PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:e7::35)
 by CH3PR12MB9342.namprd12.prod.outlook.com (2603:10b6:610:1cb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 09:04:49 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::32) by BN0PR03CA0060.outlook.office365.com
 (2603:10b6:408:e7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 09:04:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 09:04:49 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 23 Sep
 2025 02:04:40 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <jani.nikula@linux.intel.com>,
 <peterz@infradead.org>, <samuel.pitoiset@gmail.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v7 3/3] drm/buddy: Add KUnit tests for allocator performance
 under fragmentation
Date: Tue, 23 Sep 2025 14:32:42 +0530
Message-ID: <20250923090242.60649-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|CH3PR12MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: 1644f8ce-c5b5-48b0-1e04-08ddfa80403f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xcrHgyy+baPjmH1vaSum+ouxM8yG8umc6b+wziDvY+3sK3TkubAN5FAykYSm?=
 =?us-ascii?Q?PKPyOCf+zfAjBvSDnkPG7fC1CPnCCg1znRFX0TQcuR2Rth1nvRGq4/jPT/po?=
 =?us-ascii?Q?WkmZLcGFsYZuSWw3C0c5JxLhlg83dWJFoc6oPbUHNsUaQWHkxEazEfNQzUBC?=
 =?us-ascii?Q?EQklc+MbwCaKlLUQgapzuHyFbNF2iNEzHaIRT1wf57EjDHDSzqvug1oRaMmu?=
 =?us-ascii?Q?wx9elduwwjczYHeEGepA4ND+q4EYdoK2BAqA5A4MulfQFfRgkP5KPdgjul1v?=
 =?us-ascii?Q?SF54sI0hQJNjWtIwctpLcZDnE594BQr7ZEFN+ROvymWS5LKK1vFblWB8ilV3?=
 =?us-ascii?Q?7roZTbkSzLLXnoDr+Ye2Qq/AgTzfdlqbQU0NYOv/EaAMXhqfWyo93aE2PqsB?=
 =?us-ascii?Q?4oaBfVzoP8w1isjWDYEZy35EZrBZBz53/O0l6r6jUmbhh8HUaX5lVeJMldNX?=
 =?us-ascii?Q?NFaOW6i8tvjjX/jt2wUJBnPmkmmEDMZSkfYO+AuPGYh/URFnCnzZUcjRC5sY?=
 =?us-ascii?Q?fBURRCTRJMTn7gj4XzMtv/bn2TbeXWM2M4SzVPR1I2KUvOulzxFpXZdCMCnh?=
 =?us-ascii?Q?Jz7sCWP2yiVpvAW1Eliyy5EUgYir5Cpd5t2xqcXNIj8YQq2GCSHAlI4M81pb?=
 =?us-ascii?Q?N477p9gVZMrOc3qGEBA/BVhg6pAN60l9zta0BqDegPL3PCcEwsSfH8M02lc0?=
 =?us-ascii?Q?cm5RydjKkzd47EFC+M+H9FHyx/1RU7ax8RYpIw+bPAKBdb8V1dbBAIB0Tdot?=
 =?us-ascii?Q?FPxDYI3repk/DIsQvbzPKPNQTN6fG9XUIDkU+dItPz9YGmNE/X0potdwseQJ?=
 =?us-ascii?Q?nYk12udLQtBdpDcJDmPTj1EV4/QE8F4XVyxjHlFa34tcdQrOx+UVAZJbbVNp?=
 =?us-ascii?Q?jbOCcgTRAX4licWNAOYpz5J9FBqdVRYInqUAahiegmfqMndpxFFKHKlepkAs?=
 =?us-ascii?Q?D0otZARS++W2E6raXu2257yRHpejxvw8iR6iG9r2ZehZUms4H4oqD78pOa1K?=
 =?us-ascii?Q?wwy/JxNsVp2ep4QW7sqtMzvVy41wnQY3SHF4u9rAKvAqPxJSX6SppaEOD0N3?=
 =?us-ascii?Q?qHF24Ky/qtyyWi6qEqz6vlUPb76vdIhNuVOybO4Pp/ETOdwUJICU1Re0YaOq?=
 =?us-ascii?Q?fQ0TE7gL852V31K1668HrDzQh/QCszb2z14wrrlrPYY8Yd5kvqe6/QjS/JzM?=
 =?us-ascii?Q?pwVCYbI8mih/g6rgnvRTW0hZ7nDg5h5fggDyQINbB0TlN6esp0AX9hQ6i3lI?=
 =?us-ascii?Q?4PTf/zHBJMs9SytxAC2VBNXw6qrl+Sp4fLPqcsCS6QCXlUn1qSqpavtRQKmr?=
 =?us-ascii?Q?+9VGeTd9scYFjPVAJJjvhB6wcWy1pXekFXhvIc+S3/DLp5p4heh+MpG5bHZf?=
 =?us-ascii?Q?nySvtN7kY7h4KBzmsw25QKfhBbQmPWsl4mq5h/jM3StLPOqE+scGerME3jYg?=
 =?us-ascii?Q?chgXW4vbybnATtpnEdUSGVeJTAkrC15N5r/vgddoe4ARCJAQN/TZUSVysP94?=
 =?us-ascii?Q?mjUzKiFbgjnSqdKwyTEuQDt+hcp9yprO6M4q?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 09:04:49.6689 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1644f8ce-c5b5-48b0-1e04-08ddfa80403f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9342
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

