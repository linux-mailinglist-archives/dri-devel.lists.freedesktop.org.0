Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D39B06F36
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3137B10E6A1;
	Wed, 16 Jul 2025 07:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1bOy5W6m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345E910E6A1;
 Wed, 16 Jul 2025 07:41:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEYSv0Odbl3LHgq7PjBe7nXJZmAP8i2lS7etQAwnkavugTF3CegmmNAuitFnDN7cv5TAbiSWpFS3KnT+Q0bY12CMsyUsYGBaRDtHHGD+K91CSVURpvbd5P9xWC42yspl3zuUPngmHkIoBIpVb5nX4cq2v8+KZ2QRmKMOGwRyAnN9vKu7TH3Fz3R4BeNc6lFpoiszeOGAIbbybLz5x7Yqr9WxkwTcaVUi5tmtoDLVg+gy6YUVxj8UzPACar223grDQJNfVCCHuVHUTvKYeb7XzneDglNcZIpwtHRq4aJxTAZc2NdaA0D09ZJ+oazUtVFCLKjw8mVwwMAm77S/iFu2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLLHnmqu0KVeYiErWqtzo2CuILIxiPjy/h/gdGENUCA=;
 b=QWwgculA6nnssNBVLPra836Zgzf8rIWwEZM8diWYO4/GM4phyOERyYFCLcluAE5jFVFhD9r2mzHy2Yg7Nj3khERJ5WWi/mLfntBbR+ssK6fhLOxeQ91EOjBNjfNmhK53UXYGRKBspgTmZBjwDTXf0WBGVjFtW5tT/gIlT0Y2KZDHw9ispqwGD9UNL0ur9aJ+wJhqirD2kiZvBKZ/NXOzBXIYp8ZNqk57JVIYCxZ8mZHDAqXobL2hBrRzO0TyVBxuScE6Uv1uMWYwjH/4lyt6YrXbbCSGO/4nkiAn0QI7zLgg7DN/QpZvzijMM/NFDfDqCQpz2VAHhzo04MbF9FXujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLLHnmqu0KVeYiErWqtzo2CuILIxiPjy/h/gdGENUCA=;
 b=1bOy5W6mb9ja61vt8is18iGZxDU51dxxR9qDX8Nq0PqUNF0rrSX8/f/ZCVS0kGQQ/PBE5enpqDNv/TEfmaN16JQRAGk8YLHP4Bk7HmNW1ADy1frEdwIJ5MLiLr39zT11YOGGliCTA/5wMguqeX/XsSXy4ilekj1V8z+cWUiyKWg=
Received: from MW4PR02CA0008.namprd02.prod.outlook.com (2603:10b6:303:16d::27)
 by SJ0PR12MB6686.namprd12.prod.outlook.com (2603:10b6:a03:479::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 07:41:53 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::7d) by MW4PR02CA0008.outlook.office365.com
 (2603:10b6:303:16d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 07:41:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 07:41:52 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Jul 2025 02:41:50 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v4 3/3] drm/buddy: Add a new unit test case for buffer
 clearance issue
Date: Wed, 16 Jul 2025 13:11:27 +0530
Message-ID: <20250716074127.240091-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716074127.240091-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250716074127.240091-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|SJ0PR12MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc67207-9776-41c9-a3bc-08ddc43c3b72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2DI6TdNFHB7z2RKY5a1wG9sv9Jd9w9ut200841odxxw/PKekhdJz3HyJXiDN?=
 =?us-ascii?Q?mDVsu+kNWloBKq1HqFmZmFnjoJQqvKABdVQlgadBnnalb31TEVWCv/8VVtqW?=
 =?us-ascii?Q?8P/4Ib8QscwbT8a+2GSwAZ2BUJ1EvdJKiZw0/Zs8Wz82tM8UpjqVNMQZFE8j?=
 =?us-ascii?Q?rPHDgBESaAGTcve4LvSqB0zmP0ioFgzCSeLQqkZDcP/SIrQrNF9FL/e/ZcLn?=
 =?us-ascii?Q?411mGxFh5nv1V83Wszt5TsPI24G9esq1pl4mqKifsi35KYHKO7omtuMqVQ4r?=
 =?us-ascii?Q?ztRpAbDm8EL4xp5iTZiwQnOmelAQzLgjEN4JWWfouK2Dv1jKDyihLYUS6TCi?=
 =?us-ascii?Q?g0poq4vermr6wwakzB7s/9BcGTn8TmkmJFYo/H9iNZ5zYwJ90tF6rM5zmkrs?=
 =?us-ascii?Q?6Htr8MUSYw52rTZvzzX1CmY7qrrpcL4N1UfTgs8+LCLoVpb5to690mtKbXbT?=
 =?us-ascii?Q?Ww4/cH1ScvNzUds+zA2eVdGNi9L0s/s6uxQmuhPFJNg7rBrl5S4VTfW9dvpf?=
 =?us-ascii?Q?L6kFJlv17ku0rxGfGoqx2ro+HDtdvI/q+Uz7ys+ABMDi8HiCuvrVdrrFzcIP?=
 =?us-ascii?Q?lacbiEQTc+sS/KzGzWYQYZpnpOsMtCftTV4KT2ttxGQP0jpQZRNEHNvumqtk?=
 =?us-ascii?Q?OZkOjQbT/tjjWAWezAjRl5T0iDnfLlYHw/gaL8ABVINJJBIc3nRl61NaPbCN?=
 =?us-ascii?Q?+arxDOyE7AhCCrDPDIS65xpbs5PCcNASZmFTaC5gVJXljKl7ZobEH5/3F8bj?=
 =?us-ascii?Q?fFFSjz4rsPNiotTea8vMI/KYOp5WsbUEiC7eQbSgkVT3WO5ibRsHkHwY2cq5?=
 =?us-ascii?Q?MbwbCs1CHs2r+xFTBqPfMCtVWki0zKHpT5ROlHzHPR8gVy0vp5IkgzT3S+Si?=
 =?us-ascii?Q?S8cg1tc6Fu65ly+76dBRBXRyJv4rjEwJi5zk7arIuFUZjLI8ZsoJ+eG+IsmP?=
 =?us-ascii?Q?qgeZolromdOudPBx7V5Kv4d+xL4j+tihWcQzNccf7hfClVZXDNULexrq9Gg8?=
 =?us-ascii?Q?mt81F3OZesvGXWvffrRVVuWrQYkygG9mPhnoUUvn9KNfxZRPoV2ncQ6eb57Z?=
 =?us-ascii?Q?19NAH+7z4UQdLudHr5tmEFkrR+1SyHoxvIXyFMStAjBnzlRKqt10/eqgCs5H?=
 =?us-ascii?Q?3oifO28sR5n4tZ+pxuWh92lc/qnIiRJCYY/268C3nfY9GUeR+11JvT4pIAHa?=
 =?us-ascii?Q?Mlv7ATZXZ6Dn2SQTAUYnnCogukh/GmTFnXk0EBWyCAP6w0NsHNHzmJ/mtRQ9?=
 =?us-ascii?Q?R4+zknPpIRR8iSCxFPLWjngSiGWPdlmLoMJq1cyd3S3fS2VEIb/DusQ7BpA/?=
 =?us-ascii?Q?KAcCexq60EbxZmrSm45oa2lb6Mv9CMphC0zJDQPtO3+hUUx7gsmlpQk6WO77?=
 =?us-ascii?Q?uymkqFL911eq6/roy3SN0/ZNJjHynMiY8Wa9rqgmkNDKBhulmnJbadhJENUN?=
 =?us-ascii?Q?L7Hwm0klAkLK3q6OD8hvY0xIB8nzALXroMaaZ+7ay1GcRJ0GK6z69pyAdxKC?=
 =?us-ascii?Q?9vm+GhgLImX45wRTuWPPwYrA0nUGvMttDpem?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 07:41:52.9459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc67207-9776-41c9-a3bc-08ddc43c3b72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6686
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

Add a new unit test case for buffer clearance issue during
resume.

Using a non-power-of-two mm size, allocate alternating blocks of
4KiB in an even sequence and free them as cleared. All alternate
blocks should be marked as dirty and the split blocks should be
merged back to their original size when the blocks clear reset
function is called.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 7a0e523651f0..26f8be8ceecd 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -408,6 +408,47 @@ static void drm_test_buddy_alloc_clear(struct kunit *test)
 				"buddy_alloc hit an error size=%lu\n", ps);
 	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
 	drm_buddy_fini(&mm);
+
+	/*
+	 * Using a non-power-of-two mm size, allocate alternating blocks of 4KiB in an
+	 * even sequence and free them as cleared. All blocks should be marked as
+	 * dirty and the split blocks should be merged back to their original
+	 * size when the blocks clear reset function is called.
+	 */
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
+	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
+
+	i = 0;
+	n_pages = mm_size / ps;
+	do {
+		if (i % 2 == 0)
+			KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+									    ps, ps, &allocated, 0),
+						"buddy_alloc hit an error size=%lu\n", ps);
+	} while (++i < n_pages);
+
+	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
+	drm_buddy_reset_clear(&mm, false);
+	KUNIT_EXPECT_EQ(test, mm.clear_avail, 0);
+
+	/*
+	 * Using a non-power-of-two mm size, allocate alternating blocks of 4KiB in an
+	 * odd sequence and free them as cleared. All blocks should be marked as
+	 * cleared and the split blocks should be merged back to their original
+	 * size when the blocks clear reset function is called.
+	 */
+	i = 0;
+	do {
+		if (i % 2 != 0)
+			KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+									    ps, ps, &allocated, 0),
+						"buddy_alloc hit an error size=%lu\n", ps);
+	} while (++i < n_pages);
+
+	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
+	drm_buddy_reset_clear(&mm, true);
+	KUNIT_EXPECT_EQ(test, mm.clear_avail, mm_size);
+	drm_buddy_fini(&mm);
 }
 
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
-- 
2.43.0

