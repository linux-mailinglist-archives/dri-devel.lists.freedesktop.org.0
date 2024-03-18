Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C2E87F25D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 22:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CFA10EBBE;
	Mon, 18 Mar 2024 21:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2ydSDqyW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B73A10E79D;
 Mon, 18 Mar 2024 21:41:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZay6wPxw5eh0tH0VU2NtumXlJLYjdSZww3+5Eo0Hdoj06vqj4b4bFRkeL3v4RU9sFjQBXp2I8z+paCChGMJR1Vxl9Qg/PRBzJ1uWBQbrsYn0KumqzDaQwDjtds8cGeDNvGlNtPX5rsnjfXUXLC9V6F/chfSd7+bCrME2bBktZVelXvsSN+VQPp8IS4qM45LoCN+/7jsDUVB+W3YcyE2lZD6vJX87Ue/uyBoYG8i7NWqRn2pMq7wKk5gLCDOVRBT+qZKgw+VK9+M4NHUhyDMsJQ29E2nwA6nZUuOJ4y6DoMwHZZbFiwENOhtQtgixk3f578e320LdLVqDx+OoIx38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/G8OS3564RszDils/+3O/zjOb2wOUR4YcAZRCwlpEI=;
 b=huXTaOVZkdzJ/yrNCFEsgwbD3Nkz0C4zSMYsjDWZoCOwrawy42DbtBfd7mdUe0jBYdRsXZfeTQzN8r7VlX2XYDua1LfRRS6qVh4TSkC92U6j+qPKP40ZDstEpZYAeLNDcTQLhuNJaNurriJHLHJGqrqXxfuxq7Ce8olt0lT5EOviIrLHPaWQzqUGXjG4C0cWlNrHMUJ/5FpNi9BcQ6QVNE0ncctiEhwTsay1qiuU5zyqYfdRwRX5OvXPShKI9KGEn/rRLgBQS0CbUoFxkn3s5CdtB3xhPZLBHW7WJOq+RPPbecwsuXivURVwoC5RvOtw4qodMWagI7gyITwqTpCaaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/G8OS3564RszDils/+3O/zjOb2wOUR4YcAZRCwlpEI=;
 b=2ydSDqyWDHbjdJ0z4eoHr8raxPN4jiHGvVaiQ35F/Z6DwlO6UodzWXL4liD2qYzBURwKkucAZmpsTyFRPAtnWVuTBOMbbHK3PtoBWfI2bLy9vpXEpbhzmDqEHYPpCMcQcJ6R5DI2bOF8rOi/K05Ja+slO/Zcr3/G+ycdVOW4y00=
Received: from PH0P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::18)
 by SA3PR12MB7857.namprd12.prod.outlook.com (2603:10b6:806:31e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Mon, 18 Mar
 2024 21:41:26 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::e9) by PH0P220CA0025.outlook.office365.com
 (2603:10b6:510:d3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Mon, 18 Mar 2024 21:41:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 21:41:25 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 16:41:22 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <mario.limonciello@amd.com>,
 <felix.kuehling@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v9 3/3] drm/tests: Add a test case for drm buddy clear
 allocation
Date: Tue, 19 Mar 2024 03:10:58 +0530
Message-ID: <20240318214058.2014-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|SA3PR12MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: e3579ca4-9057-4ed6-b780-08dc479429ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p5PDjZuh3NHZySNMy1wmwb7qkg5EO18MRAczZPgDqW3q10oz3ZS+bGoxba65zvqK+MsGHhn8T4QHjPK6vk5jbhFw0lImZr2zWt+DLkPqrfyDeofFlHd7I3SIz566stW891nG9iNlsisOgNPJ+OeQWbeLANdrtCqhmLADlGdxhj8kJFS80QaVm7HN7dbStex6G0t8IPBoFOAxe67PIZQnEVtbHqd6VbrVBZmdPaS3DGwh8FATNE9YdS6n1uzDYEcPSUsbr04qWQppFVMTBQjauDyAA1aCtQsoZmls9YIAD7pRZcwy3HrxgrrINRite+98K54lT/DrsLx4SChcftK72zgGZlWPtSkYGszCvreRy7FrncH4uEGOkJXdxrregwntQPQF2IUvOzLJgLJHdo24N7PcFIHJaXhKGuD6NoMNYxuUyhdRR3EtvrGgVwbaSnRVgk1UDjVj6wH7ISV9I1ZUAzme5kKOTlYl5OEi0s2HFP1WWGiYijiZ60+1W15ndLX7oUa+f4eox/KnwMB4uVlO47HTgn4GErhLzk2S6DI2S9Mxs9wpQtEvCA/17kxsHa60w7vsdUzyVFQCpsUJbjrHX3aZB5RuQUubz/uIfmIdU7vVcKz6OpVwSXF0tWbrW9agDdLNNJ8wROc76rJi658gEJJzAiiDQ1DsbLNweJY56UawOVOTfv9qjyfbfEo++1vGd8AG/D28oU9R29Pnk5S/QUUAdTtH2JYP8K5XkgZeDvyOZVUnS3TpoxnnpYFTeuar
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 21:41:25.8994 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3579ca4-9057-4ed6-b780-08dc479429ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7857
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

Add a new test case for the drm buddy clear and dirty
allocation.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 127 +++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 454ad9952f56..d355a6e61893 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -19,6 +19,132 @@ static inline u64 get_size(int order, u64 chunk_size)
 	return (1 << order) * chunk_size;
 }
 
+static void drm_test_buddy_alloc_clear(struct kunit *test)
+{
+	unsigned long n_pages, total, i = 0;
+	const unsigned long ps = SZ_4K;
+	struct drm_buddy_block *block;
+	const int max_order = 12;
+	LIST_HEAD(allocated);
+	struct drm_buddy mm;
+	unsigned int order;
+	u64 mm_size, size;
+	LIST_HEAD(dirty);
+	LIST_HEAD(clean);
+
+	mm_size = PAGE_SIZE << max_order;
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
+
+	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
+
+	/**
+	 * Idea is to allocate and free some random portion of the address space,
+	 * returning those pages as non-dirty and randomly alternate between
+	 * requesting dirty and non-dirty pages (not going over the limit
+	 * we freed as non-dirty), putting that into two separate lists.
+	 * Loop over both lists at the end checking that the dirty list
+	 * is indeed all dirty pages and vice versa. Free it all again,
+	 * keeping the dirty/clear status.
+	 */
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							    5 * ps, ps, &allocated,
+							    DRM_BUDDY_TOPDOWN_ALLOCATION),
+				"buddy_alloc hit an error size=%u\n", 5 * ps);
+	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
+
+	n_pages = 10;
+	do {
+		unsigned long flags;
+		struct list_head *list;
+		int slot = i % 2;
+
+		if (slot == 0) {
+			list = &dirty;
+			flags = 0;
+		} else if (slot == 1) {
+			list = &clean;
+			flags = DRM_BUDDY_CLEAR_ALLOCATION;
+		}
+
+		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+								    ps, ps, list,
+								    flags),
+					"buddy_alloc hit an error size=%u\n", ps);
+	} while (++i < n_pages);
+
+	list_for_each_entry(block, &clean, link)
+		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), true);
+
+	list_for_each_entry(block, &dirty, link)
+		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
+
+	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
+
+	/**
+	 * Trying to go over the clear limit for some allocation.
+	 * The allocation should never fail with reasonable page-size.
+	 */
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							    10 * ps, ps, &clean,
+							    DRM_BUDDY_CLEAR_ALLOCATION),
+				"buddy_alloc hit an error size=%u\n", 10 * ps);
+
+	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
+	drm_buddy_free_list(&mm, &dirty, 0);
+	drm_buddy_fini(&mm);
+
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
+
+	/**
+	 * Create a new mm. Intentionally fragment the address space by creating
+	 * two alternating lists. Free both lists, one as dirty the other as clean.
+	 * Try to allocate double the previous size with matching min_page_size. The
+	 * allocation should never fail as it calls the force_merge. Also check that
+	 * the page is always dirty after force_merge. Free the page as dirty, then
+	 * repeat the whole thing, increment the order until we hit the max_order.
+	 */
+
+	order = 1;
+	do {
+		size = PAGE_SIZE << order;
+		i = 0;
+		n_pages = mm_size / ps;
+		do {
+			struct list_head *list;
+			int slot = i % 2;
+
+			if (slot == 0)
+				list = &dirty;
+			else if (slot == 1)
+				list = &clean;
+
+			KUNIT_ASSERT_FALSE_MSG(test,
+					       drm_buddy_alloc_blocks(&mm, 0, mm_size,
+								      ps, ps, list, 0),
+					       "buddy_alloc hit an error size=%u\n",
+					       ps);
+		} while (++i < n_pages);
+
+		drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
+		drm_buddy_free_list(&mm, &dirty, 0);
+
+		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+								    size, size, &allocated,
+								    DRM_BUDDY_CLEAR_ALLOCATION),
+					"buddy_alloc hit an error size=%u\n", size);
+		total = 0;
+		list_for_each_entry(block, &allocated, link) {
+			KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
+			total += drm_buddy_block_size(&mm, block);
+		}
+		KUNIT_EXPECT_EQ(test, total, size);
+
+		drm_buddy_free_list(&mm, &allocated, 0);
+	} while (++order <= max_order);
+
+	drm_buddy_fini(&mm);
+}
+
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 {
 	const unsigned long ps = SZ_4K, mm_size = 16 * 3 * SZ_4K;
@@ -368,6 +494,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pathological),
 	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
+	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	{}
 };
 
-- 
2.25.1

