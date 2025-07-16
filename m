Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF0B06F71
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D910810E6D6;
	Wed, 16 Jul 2025 07:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XnP4S1MW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2053.outbound.protection.outlook.com [40.107.212.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD6910E6D5;
 Wed, 16 Jul 2025 07:51:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q20jrw5eTOW+zQcAZnXdaeZVd+G5zO1By8HxpgKeAOKS4vVd+vTnH0jy8M8hHIAaQXry5qUX1NkqfTncWCq0GKzE5V8/2S0hJJmWY6MzBtLFZGrr9TDNYMEXkF2/zftFvvrxQ2DcwBKnuEPsJ/koBeWc4qNS2bVurBB/A9p6lE2rFG8ER4LdsozWuUmw6sIMrYUwbb2ZkeY5Tn8pOEJoOmKfPBn3H+GGv/AaLlMF1G6GACz+W0+3FC7y8abSHWC02iHB9JjLDKKVB946RHMxbLqJvp/ALiLQglNA5Prvzkhi/AZC91XphnrwFc5AMZp2fgFrer+8lY1p8YxyQ8ivyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLLHnmqu0KVeYiErWqtzo2CuILIxiPjy/h/gdGENUCA=;
 b=dX7ZNHTJJMY34e/hshYNwUMX8dc9i0v2vPQG+kYFrjUOMbqwEZEeJQch8IT8hR4PJ3nRCEjsE+RFf77JMejfyVeZjOgAO8VzKNcxbyfEwiU88cnUOAPxINeX7Ovt6ajtmOieWNiL/CvlN04GXxmKb9p2EtJycDyvLdo3xZKBMGoiMchJKyJCYxNUoTtdTMnliB+qrWA45TqSRE0Z6B8pbj4nmrGvMYJgUdkpbFmVljh4agTPJc/efX49g6ulPqun78ISP3suTViApQPIYDJaqHYotFev0B1ijoyFME0G/giZEUgD1S48jpEoKQo2EExsMyx4sDscj19SGhQuwNaVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLLHnmqu0KVeYiErWqtzo2CuILIxiPjy/h/gdGENUCA=;
 b=XnP4S1MWO2fIwuKk3odBbYeS+KkroHC5u7jmk0hoPiRYBHK/Sbg5Pzu+9C2L2QIj0wRKtz1i2qfQOOyXn7t0u3jzEqCOX78xb5xgWmVrYiK5IoPhoXl6+0/1qgJb/+zcPOEuBlQT0t1kvmWrIL3sXfQ/FTrZsG7oVrceru2J+uw=
Received: from BY5PR17CA0044.namprd17.prod.outlook.com (2603:10b6:a03:167::21)
 by LV8PR12MB9406.namprd12.prod.outlook.com (2603:10b6:408:20b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Wed, 16 Jul
 2025 07:51:50 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:167:cafe::52) by BY5PR17CA0044.outlook.office365.com
 (2603:10b6:a03:167::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Wed,
 16 Jul 2025 07:51:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 07:51:49 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Jul 2025 02:51:45 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v5 3/3] drm/buddy: Add a new unit test case for buffer
 clearance issue
Date: Wed, 16 Jul 2025 13:21:25 +0530
Message-ID: <20250716075125.240637-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716075125.240637-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250716075125.240637-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|LV8PR12MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: c5407e93-6830-46ee-c139-08ddc43d9f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iybmJc515gz3BuRj12I/JwxXQFxLEpfmAGr5YZk4QH5Yo1SBNbPvkvYyimhU?=
 =?us-ascii?Q?ekbMjlb74o7weBqNe+yhDADXSxcoRrmXtg++UL5r2FIXhS6ssbrqA4AqgO4S?=
 =?us-ascii?Q?AtJ17jFCVJM453OIMxouBUiT+MqSAC87NV/0DsWNRv6z3F9+FCvvT8gsvwFf?=
 =?us-ascii?Q?VwMfFjFdL3hZAJZm9N3YEfJlmdUBCJY9tlzza6y2WqWOeKUxSDTNzwZTZ2kJ?=
 =?us-ascii?Q?KIVQKdvevUE8nlJIm/tSXvPqNb0Oa/oIR1cqJSjJNKn6jWI36AU9wo0FEeJy?=
 =?us-ascii?Q?R0qenUJ6eGks2dd6LKm25aH1InnDeJi1+XXbWfoIQWYX3lvLl7XBNeyvQJC1?=
 =?us-ascii?Q?+6P2pTt4ow9CcbKMl/BhHx4fHOtu00PRkej5KkW96FrI7cNIjfaYU34kg0bn?=
 =?us-ascii?Q?+Ci090/HYaA5Ph4W+YNWRLkOl5LXhm0l8zgpgtjdN0LUMnwuN0OOCU2+zZ65?=
 =?us-ascii?Q?CfQyRZctAomLZfBFFqrelly0kuiqs50Ge1yAX0oqgeEpZ8K8IJy4V/59SrFC?=
 =?us-ascii?Q?nkYJ3Na4R/OL3jIFGb1udlOVvFQqU+Y/4s9aBhUoq50bnJm5lcvdWpFLYRFP?=
 =?us-ascii?Q?qbkur35ljbmkDlCrKk8CoxNWXdfHWJkPykwu5U0ihgEI3sK6LJyME9Y31ZN0?=
 =?us-ascii?Q?hmUZ05BuX8wz7nnqUCalPny7onkElC0HTyR1Sd0vhF1ekMhxQGFTNJ7msN0o?=
 =?us-ascii?Q?uf9SDwPdC7n/PTPBMBQyxQQstGyPVyJ9u/fkLX+Xq8AbTQkP+jeZXiRbeL3d?=
 =?us-ascii?Q?I3Dc14WbHsjZfnR5wstP/twB9RBU9/ra3EA+Wbsy+jymq1z38ChNp30kpU1a?=
 =?us-ascii?Q?mBG+aQ/DJcRkDFGoh2mK8gE6/i/DGwbQwB5Qu/A2Tv0RMYPO9f2ZcHp8cRcP?=
 =?us-ascii?Q?mO3boydNez3DULLPOZmwO3OE3V13DjXRAdYC5YIZauwVFG8CNTAiJPV5TaE5?=
 =?us-ascii?Q?jkWz88bBcQwtFcCnxLyzKlZrjWdv3HPkXXVjRxirYq5REpy1cPB/IlxUvnIV?=
 =?us-ascii?Q?OrWfPfS+15v9xXW/FiXE3rq/x4wA8NycXI452VCQo49BL8GcqoSzKTo0SxFn?=
 =?us-ascii?Q?SLEQP9YgbxwE7R6DTS8kRg6tcyA0LBuDJirW5ogXBJP5WsBPb82mYOUSTBXh?=
 =?us-ascii?Q?86fU2T282iFm5Ka1YDArfpUhvu52mbYXnqVrYy7CPi1NpXgK3Ifif5n8RXdk?=
 =?us-ascii?Q?hBSz9zezLSwjcVVtUzZRxWTq8UtFY97YPnzY3xipffqfzXuqmGS8LSquUTcM?=
 =?us-ascii?Q?EI5XfEQIDLbf4wQLX0a1CoJhgHuaz8MiIq6yifhSGbyjMaqJ8cOZWdHfFG5n?=
 =?us-ascii?Q?baGhTP0MB/x3qWRHBeIptRqdaYO0m5E8BHM4f9KmuAlKWOV1VXt+jCdWmyvq?=
 =?us-ascii?Q?UAn1gVlL8H8P9dBNul+nDJhVO6hx3la+G+wkT1iMmhJg8NLr4ldQzPi9FL5X?=
 =?us-ascii?Q?8ppCjCVaBIgkihZSeAc06HVN60MDGlgyO1+pPMZeX8F5UmeDNbfQeln+UZRz?=
 =?us-ascii?Q?3WydCNDNtbsAh2oBq1GN7BXfeVzgK/sVkW0C?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 07:51:49.5793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5407e93-6830-46ee-c139-08ddc43d9f0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9406
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

