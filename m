Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786CBBBD83C
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 11:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2563F10E3DD;
	Mon,  6 Oct 2025 09:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AnUZCl6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010042.outbound.protection.outlook.com
 [40.93.198.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9833610E3DD;
 Mon,  6 Oct 2025 09:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJykG7mR8eldNsH/RwNa7I3IwsK3J9ebJg3BgGQEBJgX6NYaAHZ8+Ov0vb71YhuKlwj7WIPjdVPWmljZXPs9eZu9AQ5hRtIlX7Th87K1UjBJkYA58C/6Y5nbRQn3epr+gjbtQGvtZb9LF4T4S1fnVWLDsBQHJQZ4Ub+77IN/yedbjt+OhhSF9frI83bUzwzbyGNRzqDFv5ey2qmRp2ToNXf/Ph8M9udL4iTkEJEScl9GGoTFR7B9Wl0QfMFcvfugVtVnJxp7Hj13XUY4UH1k7dbiiAKOWye5xrzNjtxWJo0D00A9JFUpgSxlP7E96IEsj1XMbU8F6RE/wm+T5lcFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIjrBKm4497k1qcjlWLdwEMGAYB/8ciTfupWnLZtxso=;
 b=OCq732tLMyieGYZQUAvHuUDmMPWtAOSjbxsnT1/tEpPx4+jdGCZEBhI5vw6KUvf0pt9ylIEflEs+4Ec+JuOgxwb8HwaaQkO9twxFWEHZwBBAEqlRFvLsr6lNuYni23eAYRQj2P4UKYDk/ZNFlzfgjm08NYbiWMkv1ZWaJkpwkfTXszn3F/5DIWVfIw0oWP+t+uzkvdmNs4D/FUonkQN3iVGpIvLS1tkj5M1YgyyTJYqFB4q87Lt/6+2QAoxqu6YaIvvLCHsMS9vSWuBbTg5qjOpVOdT3owGVqD1e4UT/EtC0vECpbihZehXf4g9RtrVFHgqQNCqn1pThCdtOgd4nvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIjrBKm4497k1qcjlWLdwEMGAYB/8ciTfupWnLZtxso=;
 b=AnUZCl6y7oSvr0il2XYmkB4HCBPx0C4NGkRZBqQzZGaDuNe+UhCNRDNnln7a8ydqcXcYlhyLYzrbCNOQ/79URv2UAzATkq8p/5ohPct2d4nmGQKZZLvEnaw9Xkt26Ae87CjZxeHZjRSYOEfL2tokff29CowJBHOCHHdcSYgidZI=
Received: from SJ0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:a03:333::32)
 by DS0PR12MB8248.namprd12.prod.outlook.com (2603:10b6:8:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Mon, 6 Oct
 2025 09:53:06 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::4b) by SJ0PR03CA0117.outlook.office365.com
 (2603:10b6:a03:333::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 09:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 09:53:05 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 02:53:01 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <jani.nikula@linux.intel.com>,
 <peterz@infradead.org>, <samuel.pitoiset@gmail.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v8 3/3] drm/buddy: Add KUnit tests for allocator performance
 under fragmentation
Date: Mon, 6 Oct 2025 15:21:24 +0530
Message-ID: <20251006095124.1663-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006095124.1663-1-Arunpravin.PaneerSelvam@amd.com>
References: <20251006095124.1663-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|DS0PR12MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf4ee2e-d667-40d3-a360-08de04be25a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r01tkH3b80xrfz+c0DIG1J4QMijPXmBs2oS+KYYvwK7X0wOEnWwCXPiyvV5E?=
 =?us-ascii?Q?Jf63AVFQBI1QFx4QE3z+SYXr5F834+ulDIdvqtbPYxDKigb/0lYUGfNZcfca?=
 =?us-ascii?Q?gUXZFW+FMu7n+yIoZiFmHC0yslCCUFHgJ3AZRiohFOfGvjMLerc2n9AnSGN3?=
 =?us-ascii?Q?JmUJUWb/XUr3yhcXYrT2K8IEu5KZzVqjC6XSkQGgjLte84iOOR+9BS25sm4L?=
 =?us-ascii?Q?gpBcTYs5qcLXhLeSuXOdoyanFoDAnRdFWOVO8f8+UykxcWuZ36pEimOo4BUr?=
 =?us-ascii?Q?+aY41QJN6o+yPfAKyVjBDja24is12CumOsVVTgAUQ3daGUodFixLzr5edELI?=
 =?us-ascii?Q?Ezc0V6awaI/iGUKwNKsGsjnD9/QqWqpyIYfAWcjQNOfUD/ECk5wEvKaTqGxV?=
 =?us-ascii?Q?EIMLXAZ3iW8YzwiJkpK5FhHlTBfPIRiYQq7oulppe9wUpxd1gQtPMo/XNswz?=
 =?us-ascii?Q?+ZkbojAA93/dmfmJabSxH9bco8iL9hjlhcEjNECw+WZmoprbBeCFWciL2raT?=
 =?us-ascii?Q?RoDnne/qgL7pZAiJi8g7rEXav589g8Nw49Wytp9MRVZ28CwVrRYBe1z4GALs?=
 =?us-ascii?Q?4Fc1XWV2QRk51FwWos+wgVxnicuAyF1XQNPseYGhppc1P4bgbCZ5NSZv6yYJ?=
 =?us-ascii?Q?kS1A282hp9jmFDsKkfk4ady+9Vq5tQYPjBbS6PSUWwkRS2Y8Oda10j/vmGjC?=
 =?us-ascii?Q?TMIKQN1rwu81hNrJCC1J+jZC/WN6vLMJ85XcGKeXiQoIUXqb0/HER5sgewQ+?=
 =?us-ascii?Q?aMMzFHG3OR8QeyhWFZeuaSSdMszYmAZaj0+DFSGadE1KtebieIS1hWQpqX5C?=
 =?us-ascii?Q?4SkP5EVXHC0QLEQs77F5stys+rMtXiiExNWkb+Yi6YGAGXJ5bMC1K7/vyDRj?=
 =?us-ascii?Q?mrSPM6SUnJZmdr5nEIDrfe7wg5GtWDcpx3CKBxioZDlDyx1t6UJ0VQgsWCky?=
 =?us-ascii?Q?puyVdJY+N7z755+CI6PU3piFppJiWt3QvmOccbEm8Clfcw2dKGNALbn2g4tK?=
 =?us-ascii?Q?bP35q6PaFcj9VnixkeIjXp1+CqLju25wwJPKP2LYKbNcALAnT9I8wnaKWR+b?=
 =?us-ascii?Q?kjE/hM8I2Xj1x7rm3gQBg/NZKOkWfbuK8OfBNyqNzaXvSN8/K1rn0WEJ6fLL?=
 =?us-ascii?Q?GHIiGmeJTYfMqSwoeX23GtZN/YEYnOL7A+lCw2odeBcKKGGgTGdo7r/HSK3x?=
 =?us-ascii?Q?bsG7oY7tnTewWoRIpBT5xls8/kXMFNEj9L+3N8yhVw5/sbQy483QH4/lnJlc?=
 =?us-ascii?Q?K3Vq2mbUVEyNFnaDI504Cl6jpk4+cYZ0XU9DCw1RhjwcCrN3t1VTdlqx2Yg9?=
 =?us-ascii?Q?PkIDH8JzLoQr7tgpAY1EOfxu0S17kbr2ttqX62SPnJbLh69183xr3zWV4yEG?=
 =?us-ascii?Q?KchfFmMwSD9caBTOpHz5rPNNYMIeKs9260ngtwEHwdPDP9ePI3GpsCLNG13L?=
 =?us-ascii?Q?fRcamllhEERAoFBhhUwMg4PoyN6j6tWCJC+u0vLwKVDZfZdymV2R9h40TrXn?=
 =?us-ascii?Q?ZVCFLrgx0LZ9u1iDXwUC+9MJtyoDd2IJVaWcVl5MxjZFaTpw5FSTYvjnSD5n?=
 =?us-ascii?Q?FkUW8O4FHTE2RIvrecQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 09:53:05.3429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf4ee2e-d667-40d3-a360-08de04be25a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8248
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 105 +++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 7a0e523651f0..5f40b5343bd8 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -21,6 +21,110 @@ static inline u64 get_size(int order, u64 chunk_size)
 	return (1 << order) * chunk_size;
 }
 
+static void drm_test_buddy_fragmentation_performance(struct kunit *test)
+{
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
+
+	kunit_info(test, "Fragmented allocation took %lu ms\n", elapsed_ms);
+
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
+	kunit_info(test, "Reverse-ordered free took %lu ms\n", elapsed_ms);
+
+	drm_buddy_fini(&mm);
+}
+
 static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 {
 	u32 mm_size, size, ps, bias_size, bias_start, bias_end, bias_rem;
@@ -772,6 +876,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
 	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
+	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
 	{}
 };
 
-- 
2.34.1

