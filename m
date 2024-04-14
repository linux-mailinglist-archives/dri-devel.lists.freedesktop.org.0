Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B7D8A4591
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 23:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CF61120E2;
	Sun, 14 Apr 2024 21:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sqm4Vjc+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2057.outbound.protection.outlook.com [40.107.100.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5091120CD;
 Sun, 14 Apr 2024 21:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uv6e1k3vza3zq8TVoURHQLDUPh0YHeNiYUlTyQJAgTbG39Pc3oC1Nr8vGDpFufpP/jzxMmBBTPWMgHfdSKVY+Mdzbh33qtEaBfZAo19nVXV4E7tylYRF8AF/W0PDLQjPqGihx0YsXgup80xJWHmbFXFgm6YurhXvXNSfPBPyKh35gCA+PgyR/2go8vBaCxw7ir3yeI06/Zuy163IIZS6lS/TLzifB2Oh7Jca0u7sUeKV612kbimTGXps74M+4OPFtYc3TrxJdkgB1oC5BUcA+kbgH9SX19FcUAzREdXzWQPKYw9zppqmdfDGqjmN9INsZJP+ZrVA6Bo1GAkU6SUtEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q64of9tKYh9H8hqLZp+4EBsVdolCq6Ik+epZWEwyk74=;
 b=S3TReJOkB6tKLZSo3tTwuysVwaxyLwfRT4PIPQ0YdwM83v3aquw7y0yaF91jJT6CC62Hsfc+ofIcFUiIWhqXv4XFQvQtFdFqlIXSCYWrfa4s+e7CTOxbArfWH8C5WjLXr5JTawcV5NCNavRz3EfUKdxvvlzvkmbBfRDyXZNU+H7qKteuCtq++1ALvyUR3mqGuDU5kY2LdgrEAuWKCUmO9YY8Ojn/OZ+769408q8ZFt5T1lpmpvIFiUGto4igWDZz3dfAsnI8sXg6Qfc3ndi43Ykx88Wn9Y44KCFiM5qpfoEVxplobPAKrJy/LVtRcNKjVh/AUUNaqFeWzc4a8HiN4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q64of9tKYh9H8hqLZp+4EBsVdolCq6Ik+epZWEwyk74=;
 b=sqm4Vjc+8I4cCT/cnHqAvzKaHb2sha6aZP/tun4OFIg5BhjWQOMbDviOxmlHp40CHV2A/R6HmNkNoahbcahuacdTzsG92mca6tKw8/IYRsly1oQSsj+g1UHK04nQttrod3yygdroS5a9CWYL0aS34jFAKo+JWrMJcxV9mu0k/tU=
Received: from SA1P222CA0055.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::7)
 by MW6PR12MB8662.namprd12.prod.outlook.com (2603:10b6:303:243::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Sun, 14 Apr
 2024 21:24:31 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::dd) by SA1P222CA0055.outlook.office365.com
 (2603:10b6:806:2c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.32 via Frontend
 Transport; Sun, 14 Apr 2024 21:24:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Sun, 14 Apr 2024 21:24:31 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 16:24:28 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <felix.kuehling@amd.com>,
 <mario.limonciello@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v11 3/3] drm/tests: Add a test case for drm buddy clear
 allocation
Date: Mon, 15 Apr 2024 02:53:49 +0530
Message-ID: <20240414212349.2834-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240414212349.2834-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240414212349.2834-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|MW6PR12MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1b1175-d2ad-4474-9f0d-08dc5cc945f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7zThfhtgYjKucVR4u8pBnIh/heHqT2aDUBa7yAk9ye2uGzhnXnygASUQbh19D5hJ0efMWPtTaBdLxI4+bzpe3UtIlMoNMsxkxZXgTx2StOnuKehC+FZkuiNO++jqHhDlmyLYfTOxnboiX2HpGj57H73aKO++9CO/q2GQ5XWNtu5OXNzuigmn8Al+vfpiKAVBUoANuw720Utm0yCDSo3ND44ySb3c8YrL6FfF45Bx4OXUacz9PKpvsGNhT/ZJZ21atJJgv9UPznAagCR+vlNEmafLWeZGjdStfpMWZwwq4wmr1as7QXAhi+vJq8HlKPFJO053T0259l0/U76PUa1EwZb18eu7x0WXDIf4t2OifrzOSNoMaBAkdHalOSShPAm41ZWGNNl4oP7zYB2v/pEfhbnVI7Lfx7M7T0UrImNvYJspjS8Dc6QgMlXAd0a12ThqbF9lFBJVRj++0dQybK9DP8fgdMOSr/VyHBWzE+s5RSfwsFxkCxE0Pe0V8dY8EEDZtY5zLh1z4EWb1QmsG1Y+lOKvS1+OUlis783zzN0VelSL5ehZ4s8MVnVgPxqWl7YL3U27eKnt8vM+IF/LA9NRmg0pCM4Um7TUboXe2wrwpca/kpkIbqCI1JEimagnC29TJmIZi2j5wcAwpaYDxCbOTzjDBQLtPk4dEMivHvDfyMmKJztrtlklIsAeNR8zW3BXTPyZJvQ/uRiFHEBO2UWvpFYUddUw+9Y0Ln2R6P6NRHC9sVaV7g4d25tcRBBscIuY
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 21:24:31.1140 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1b1175-d2ad-4474-9f0d-08dc5cc945f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8662
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

v3:
  - add randomness in size calculation(Matthew)

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 143 +++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 4621a860cb05..e3b50e240d36 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -224,6 +224,148 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 	drm_buddy_fini(&mm);
 }
 
+static void drm_test_buddy_alloc_clear(struct kunit *test)
+{
+	unsigned long n_pages, total, i = 0;
+	DRM_RND_STATE(prng, random_seed);
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
+	size = max(round_up(prandom_u32_state(&prng) % mm_size, ps), ps);
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+							    size, ps, &allocated,
+							    DRM_BUDDY_TOPDOWN_ALLOCATION),
+				"buddy_alloc hit an error size=%u\n", size);
+	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
+	drm_buddy_fini(&mm);
+}
+
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 {
 	const unsigned long ps = SZ_4K, mm_size = 16 * 3 * SZ_4K;
@@ -584,6 +726,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pathological),
 	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
+	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
 	{}
 };
-- 
2.25.1

