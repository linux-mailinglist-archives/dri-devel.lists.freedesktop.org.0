Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D008C3566
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 09:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E6D10E080;
	Sun, 12 May 2024 07:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VEc90iIx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA5610E080;
 Sun, 12 May 2024 07:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrC7A2WYckN3/gWCCmIyEuH7e4gbyFiMfxqwYyH1qEu2hfFlWjGRwnVSUEuSKB8Ssl7u41/kzZxLn6K8/8Cnf6WXL9QZ13wQcLtwooAdPxYu0/CVuAX6c/VKUdLNA8d0mP30b2aBGq3gcNL5XPjt5vVuAAZZ18DWnt/wwb48G45Hy46mUzjg+gvN1SOgxfif5iFI2tcL5VXhXm6uAhGiuRCSCAMibPX4/YPOnZhY1y64UDjoashNZDpt215zUD4JS0y9x42RmRw7qcF6dJKVVroUx3GE8U6ukqRyd2s74SiMJQvmQFQhMQ2tEN3W/A+Rbt79A6zGcB5A+2ty3P1S9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xc3gbNccS9zJ/rrk71j++WVUrMYjipHEuqz8Z8YblXo=;
 b=gUI+HGD7xDqOC9FNEUAT5ru48UuXJ0gjGLwm4m+Zv0x5IG52/4xGNbI2IcfFNkPtwVH4n6ZQCMsO/yf3K9OOzkOIpTBFWq6LmB26Om3/kL+PXLZ0AQu8VsPCixCMJJrWQjIdILT2mGvcxobwQXtXyWWie1JhaZzFXx5oiE0kaxRjxbEt6VGv/rHLyftkEQfgo266EUDFyuHN9pkzl5d8LkKzDr5aJUiL0FBA0c9wqDGo40BlPI/EyJyorXbxILoGPoA1YE7XNsWw/bmyh2qpF9K1wTiEzMuHTibvnDMk1YrQBN5kFMUKjM9nGx/Ud6Ij9sd+kCzIkpXnrzqsDdk5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xc3gbNccS9zJ/rrk71j++WVUrMYjipHEuqz8Z8YblXo=;
 b=VEc90iIxotAagVwbA2IVlJ0uf0PqOtJAQUuQ1bH2pPr5R+we3SXbZKyP6ctV7nzIctHSebyB4+HdK7Cd1YdUbV9LI9L5c6xarVqldEipV6I5XLTFsxY3i75wZkYzyZliSXpBAEj2IUv33Et313DyquBYHQ7U4aXXhdXWpo3C/6I=
Received: from BL1PR13CA0425.namprd13.prod.outlook.com (2603:10b6:208:2c3::10)
 by SN7PR12MB7105.namprd12.prod.outlook.com (2603:10b6:806:2a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sun, 12 May
 2024 07:59:29 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::95) by BL1PR13CA0425.outlook.office365.com
 (2603:10b6:208:2c3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.21 via Frontend
 Transport; Sun, 12 May 2024 07:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Sun, 12 May 2024 07:59:28 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 12 May 2024 02:59:26 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <daniel@ffwll.ch>, Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v2 2/2] drm/tests: Add a unit test for range bias allocation
Date: Sun, 12 May 2024 13:29:09 +0530
Message-ID: <20240512075909.2688-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240512075909.2688-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240512075909.2688-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|SN7PR12MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf741a0-6e2b-4d35-aa9f-08dc72597309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5NiwqxvAcRL+miTYQfbpqQi+FHzFd4Pc+h894ymBAausPsOtx77zr3VxbVNR?=
 =?us-ascii?Q?KOeMjgkb+q08/V/lbjn+d7SGThKNcTA7Rqmukq6ihriIgwUjRRanGTto/8P9?=
 =?us-ascii?Q?hXmJTwnEQZfAVl0pjsaAYCd5bkh+grwn+iXs98JfGJ8Dhb5/GfwBvkQUojmA?=
 =?us-ascii?Q?P4AQGGhvVMLU9hdZf3SvKYP5ej6pFqnEZHfSiYKF8hmTKkx38FnGTsxjExRV?=
 =?us-ascii?Q?nxsNF6f2GgCldmlkaLDw0u1m8UF5rwVv4W3LKF4eo8wPyrq/v4Xjv7TrBz/o?=
 =?us-ascii?Q?5fru0846ZT/UQacqJdiQFzV4hQ2E7eB7equ3NQD6HN0YUL+Bi2RnPZdWsuea?=
 =?us-ascii?Q?IvcoduHAJe5amZ7iS5Cqw4GxKVfkUfq7kFsHC5MIWekDj/I1hgL3C9shsqXV?=
 =?us-ascii?Q?eBth87jXsYfbfuUWxU6SQzA6rcIcbXQx+46mAAAyybTtXvo3Xe1Qb7cAMGlX?=
 =?us-ascii?Q?HVxQZWoi0UxVqcq6CAgqDRtMnHsaRbutASjOnp2dUQL0v1LvkftuY4HNcvEs?=
 =?us-ascii?Q?2lSJmadh5NGQbrGmi6uaYlBVOxVhLrnEALftgoZq9HuGsFlK2fuCdY+rfvPJ?=
 =?us-ascii?Q?OsNCibFOLYtA0eYolH48OpcjBVxSpxl8muzL0+ksdaMp6UxQUkOiFPTJcug9?=
 =?us-ascii?Q?nY/9L4nNCQC2nUncKG/SQ5yyXQMd55bel0yVPIQwQbVGTo+bcx03lHCFGr0P?=
 =?us-ascii?Q?AtUsa4JolxEfgb8fe6jxloNENPWX2Rg+PohlvUbtjLwMcrcysCm11qcwGDOA?=
 =?us-ascii?Q?2lHzLkuBrnyM2nGB7WgGfkmQOwm/fXFl7Q7ENzm85+1PqZV6JYU2SdK62iMT?=
 =?us-ascii?Q?PzKNQsBKbiJ0MMxl7u/hkETr5yjD8QWqcKlYpw/sA9az6AMsSum4rlndt4e2?=
 =?us-ascii?Q?8C8m5HLJiVhcc+3oZSpnj8JklqAk0ZnpknG28GISz5p0GqvxwiHqqF4eQqCE?=
 =?us-ascii?Q?QCmsJSx4KZZ6+S0YjRWec5B/e3xx/8fv7IzKo8T/ecWt5+YXC6ceKmtWaCS8?=
 =?us-ascii?Q?XpbLrXm2rcAYzgfQQdi/nFQAyTQKpM8FDW6xJ8E1/5xT/Sh/uRYSmcnlWfFg?=
 =?us-ascii?Q?PvVUcV1Vkyf8XRe7f0lPWmHLLKfYQrqrA/Mfe1NbxsfElJ3Ud+D2ziKjvsNK?=
 =?us-ascii?Q?pp1B0qWzRg2cWhlnUDBKS3lMWAavIaztx/hs72gXii9sagqFGLjP/H5nDNE+?=
 =?us-ascii?Q?mb39y0oXknQCjg5uWtwSBrFJoe56nrY29LlRthmY5CWaorpk1FfjCmJ6y/mq?=
 =?us-ascii?Q?E5Rtuhtq5F0M02LnlqfUxHAh+rYsFJC87UAXeOoyz9edmTvsTcYbbUuWfP2L?=
 =?us-ascii?Q?LO+OtczvfG0iMHLzC/TQuto/kwtx+FeCV6L3vd3WyIabk559za+bnp3CgyDf?=
 =?us-ascii?Q?2qbVxR7MYrCwRXnyN8iDEc756FvW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2024 07:59:28.6968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf741a0-6e2b-4d35-aa9f-08dc72597309
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7105
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

Allocate cleared blocks in the bias range when the DRM
buddy's clear avail is zero. This will validate the bias
range allocation in scenarios like system boot when no
cleared blocks are available and exercise the fallback
path too. The resulting blocks should always be dirty.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index e3b50e240d36..a194f271bc55 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -26,6 +26,8 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 	u32 mm_size, ps, bias_size, bias_start, bias_end, bias_rem;
 	DRM_RND_STATE(prng, random_seed);
 	unsigned int i, count, *order;
+	struct drm_buddy_block *block;
+	unsigned long flags;
 	struct drm_buddy mm;
 	LIST_HEAD(allocated);
 
@@ -222,6 +224,39 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 
 	drm_buddy_free_list(&mm, &allocated, 0);
 	drm_buddy_fini(&mm);
+
+	/*
+	 * Allocate cleared blocks in the bias range when the DRM buddy's clear avail is
+	 * zero. This will validate the bias range allocation in scenarios like system boot
+	 * when no cleared blocks are available and exercise the fallback path too. The resulting
+	 * blocks should always be dirty.
+	 */
+
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, ps),
+			       "buddy_init failed\n");
+	mm.clear_avail = 0;
+
+	bias_start = round_up(prandom_u32_state(&prng) % (mm_size - ps), ps);
+	bias_end = round_up(bias_start + prandom_u32_state(&prng) % (mm_size - bias_start), ps);
+	bias_end = max(bias_end, bias_start + ps);
+	bias_rem = bias_end - bias_start;
+
+	flags = DRM_BUDDY_CLEAR_ALLOCATION | DRM_BUDDY_RANGE_ALLOCATION;
+	u32 size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
+
+	KUNIT_ASSERT_FALSE_MSG(test,
+			       drm_buddy_alloc_blocks(&mm, bias_start,
+						      bias_end, size, ps,
+						      &allocated,
+						      flags),
+			       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
+			       bias_start, bias_end, size, ps);
+
+	list_for_each_entry(block, &allocated, link)
+		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
+
+	drm_buddy_free_list(&mm, &allocated, 0);
+	drm_buddy_fini(&mm);
 }
 
 static void drm_test_buddy_alloc_clear(struct kunit *test)
-- 
2.25.1

