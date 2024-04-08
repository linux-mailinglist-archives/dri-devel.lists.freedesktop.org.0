Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CCC89C7FA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 17:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99AD1126F0;
	Mon,  8 Apr 2024 15:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XJyvRlCU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D521126EC;
 Mon,  8 Apr 2024 15:16:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pkedo7GpwGb99EGCLb0EjRLO/xFPVVTEgxONEZSQd0qD+DTCQDg2c7NRVr60A/YYEOxGSxbN8j6we89MeKx+De5MnnenEl7V+J+P5vD6H9NA5an6APVI4sIOIT79oQ681JdhYFdNO+AsmCQCgxkytnoRHQ1ZH/RwjszboDoWkl1TMZViu7Y1ruIlxi02caBLWKvVs/7nK6Wi0CvGzTiWdwCKq6BDB1CJarSFAZQhcDF+tFC4Y43i9VDl+qZ3NQF1jNPxdjf0FaK7ThBnswQaSk9gYe2eaz42f6BR5JzUd2Ce6Rg8SG6HKsrF3S+BRLx8nuuw+8M/jpb00mX5XpaPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bO5kYInkZhD05sBCD9HSo/RufgIFZG2/4fKzHrXj/Hs=;
 b=b5qmVPQi/m8aHaS5hTulsqwF52C70yXZH56qgEgXxPOzwAHKqh0YZ8P25pftEAaRVFCTs9MPodD9gJJHQ8UfaHW5M7fngQWpMu1O3RtOcrL3eH+KLbRbJD1OgWsc4p090wPnvTjlMxwumbweRCGi321j9dLKDXykhWtMHp3B9BHmVKe1FrGHhGSC2qrPPtiginQwrvXsX2ydxcLr4PXt07/nOpq9FxwdnKjjNs7r3GIQlIjOoyEincV3Cg3zwXNBVqLKMnkEjylE0M8/BQUeEMJ/KDofsUvosepPDlBZxVPZ+lPFoY+UQ/03qlNdf0UMoiEwRjcFbA8WP2hvMhGApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO5kYInkZhD05sBCD9HSo/RufgIFZG2/4fKzHrXj/Hs=;
 b=XJyvRlCUzhPhdHQBD3x6By5WXXT/+x4QrCgWkEgSgq0LTcT/ieVjsT1LcMTgonlLJRgVtkgVQEQOeW9SY4f0HlMPh99ZeklV0fVkUKKPNQUwU/3dqQWW7E8Peg1LrZizGZfHQN1NFPlpmFe8QwM899RSDSFiSyCujgldG+Thn6A=
Received: from BY5PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:1d0::13)
 by CY8PR12MB8195.namprd12.prod.outlook.com (2603:10b6:930:77::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.48; Mon, 8 Apr
 2024 15:16:52 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::7a) by BY5PR04CA0003.outlook.office365.com
 (2603:10b6:a03:1d0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Mon, 8 Apr 2024 15:16:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 15:16:51 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 10:16:48 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <mario.limonciello@amd.com>,
 <felix.kuehling@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v10 3/3] drm/tests: Add a test case for drm buddy clear
 allocation
Date: Mon, 8 Apr 2024 20:46:20 +0530
Message-ID: <20240408151620.528163-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408151620.528163-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240408151620.528163-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|CY8PR12MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: a928c41c-a746-49d8-a1c0-08dc57deeafd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSv22mIctTXxJS1bbzOvketbEeRgaZXvUBm1RNODbPKQxyv44uOwQYtiJqNNYkG3nQ7qdKTtsE7by95SxEw5i1ury9hadcODdcGrQYejZIZ9bntASUxdRdrdriRnb24EnkoREyzFxx3WyQJir38o4KMJNiphiGH+MO8PLvetWLpPG61cU3BlBi6KeUWafqP8+hQnovqqf7D+PmNWR8xIfUWgK+IAHaWAygX6Ktzus4nKY63sqt5D7rE9D8QtDMcxOxOGSiqIGYwhIkZp7Ke5bwFDEXYXfOTjJpoF3S5e7+YNrS0RSwbmqXZ0047kT+fCkzud4p1mYq29cow1D7K7NmlGST1tlaoxBQxBPLcW3aVjATP3P0XOUGTEYDwTS9aNt70VNuwl30M9HQNXEVzX7hFfeeUj0ux/jLDD5YBX5vLbZPkn8CnxJdpM+udub67GGKYs6H/T//4IIRpyWXE/RJ9B+QVrU71wAuDSumOIdfVuPphAwLewvdaY+GFmyuEWlot5MBF0d2UhPGMWRDuyaRpG+iA/D9EH8CEmYzBAooLRatmcquahJSRghazqvlmKTAExdWNs1Z9kiK+6XXM2RZARIlexf+/aMwyi2S95jMB0mwhYjF4i2oR3i5xd2W4XZK1rjE+ik4ilqOI4SahvGTvMkAQQsGjifafpvWzqoR5WO++6Ht+smNQqEt6psdAfNqSx0TOOw147vjT8JDKkaA6+HPk40fERgTUn9yQxlTWCBtP5dG1ZEtdU17sKZvTb
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 15:16:51.4739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a928c41c-a746-49d8-a1c0-08dc57deeafd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8195
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

v2:(Matthew)
  - make size as u32
  - rename PAGE_SIZE with SZ_4K
  - dont fragment the address space for all the order allocation
    iterations. we can do it once and just increment and allocate
    the size.
  - create new mm with non power-of-two size to ensure the multi-root
    force_merge during fini.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 141 +++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 4621a860cb05..b07f132f2835 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -224,6 +224,146 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 	drm_buddy_fini(&mm);
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
+	u32 mm_size, size;
+	LIST_HEAD(dirty);
+	LIST_HEAD(clean);
+
+	mm_size = SZ_4K << max_order;
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
+
+	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
+
+	/*
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
+				"buddy_alloc hit an error size=%lu\n", 5 * ps);
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
+		} else {
+			list = &clean;
+			flags = DRM_BUDDY_CLEAR_ALLOCATION;
+		}
+
+		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+								    ps, ps, list,
+								    flags),
+					"buddy_alloc hit an error size=%lu\n", ps);
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
+	/*
+	 * Trying to go over the clear limit for some allocation.
+	 * The allocation should never fail with reasonable page-size.
+	 */
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							    10 * ps, ps, &clean,
+							    DRM_BUDDY_CLEAR_ALLOCATION),
+				"buddy_alloc hit an error size=%lu\n", 10 * ps);
+
+	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
+	drm_buddy_free_list(&mm, &dirty, 0);
+	drm_buddy_fini(&mm);
+
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
+
+	/*
+	 * Create a new mm. Intentionally fragment the address space by creating
+	 * two alternating lists. Free both lists, one as dirty the other as clean.
+	 * Try to allocate double the previous size with matching min_page_size. The
+	 * allocation should never fail as it calls the force_merge. Also check that
+	 * the page is always dirty after force_merge. Free the page as dirty, then
+	 * repeat the whole thing, increment the order until we hit the max_order.
+	 */
+
+	i = 0;
+	n_pages = mm_size / ps;
+	do {
+		struct list_head *list;
+		int slot = i % 2;
+
+		if (slot == 0)
+			list = &dirty;
+		else
+			list = &clean;
+
+		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+								    ps, ps, list, 0),
+					"buddy_alloc hit an error size=%lu\n", ps);
+	} while (++i < n_pages);
+
+	drm_buddy_free_list(&mm, &clean, DRM_BUDDY_CLEARED);
+	drm_buddy_free_list(&mm, &dirty, 0);
+
+	order = 1;
+	do {
+		size = SZ_4K << order;
+
+		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+								    size, size, &allocated,
+								    DRM_BUDDY_CLEAR_ALLOCATION),
+					"buddy_alloc hit an error size=%u\n", size);
+		total = 0;
+		list_for_each_entry(block, &allocated, link) {
+			if (size != mm_size)
+				KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
+			total += drm_buddy_block_size(&mm, block);
+		}
+		KUNIT_EXPECT_EQ(test, total, size);
+
+		drm_buddy_free_list(&mm, &allocated, 0);
+	} while (++order <= max_order);
+
+	drm_buddy_fini(&mm);
+
+	/*
+	 * Create a new mm with a non power-of-two size. Allocate a random size, free as
+	 * cleared and then call fini. This will ensure the multi-root force merge during
+	 * fini.
+	 */
+	mm_size = 12 * SZ_4K;
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							    4 * ps, ps, &allocated,
+							    DRM_BUDDY_TOPDOWN_ALLOCATION),
+				"buddy_alloc hit an error size=%lu\n", 4 * ps);
+	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
+	drm_buddy_fini(&mm);
+}
+
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 {
 	const unsigned long ps = SZ_4K, mm_size = 16 * 3 * SZ_4K;
@@ -584,6 +724,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pathological),
 	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
+	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
 	{}
 };
-- 
2.25.1

