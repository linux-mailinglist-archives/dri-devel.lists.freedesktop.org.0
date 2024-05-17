Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25618C8660
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 14:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0325410EE84;
	Fri, 17 May 2024 12:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h5nsDhqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DAE10E39C;
 Fri, 17 May 2024 12:38:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbBhRu2JS3xv/r37qJLfqcbPkp93BieaTYuOFxPvhtqPiIcu2nCOoLsz/GKdL84XOBgi2pidKbRMYTo4pKCgl9HLgR5zsmQPXpg9SyaImFwOunVmve7uY8HEqXn1w4spCSSpMNQZWvxuZrTNUwNdkhfGc1cjpk8U3RwVn+E7PTQ6b18WM8aspNX/vLc8U3eeGV3ECfuo9nlmEUIm+HuMsXJEkN7l2VCFYfxdNnTQ49JOj6OSGNrJJycxipXN5WL6Ao6u5iGwKp8DfvaGuatnKE2x4rxTB/AAgWgQ4AGZrmH9bjBo5aevZcGB/gaZZ9CB1tt/bx+s/ZuIiyvSPHUooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtC9Z0OJ7GRiQzW+3ipK7jp38dCrlCfcaYz8GnHGWG4=;
 b=Crz5+GIQzktJ+NGnHEnaBikd4vqIu/WTfQL0HUHlR3y3/2ZQkNhbKHoioF9IuQH8RkhtIBGSVyNje8mjGnZ/4i+I8gAmJQxeRO6I81I5oKjNtPdMRJwa6gVD8+5YnCB/C/ECy02VMC/qrF8sRFoNuGsGdQVlm5S2qpFrHsuAMiwrLHLxRfGZgMYKFgAc3CBLA5Q3CvEdIvLU30eD7F3hhk4LDSTHpHJ7ElMv2wz1lRVArveEvlocVeAcACQJHQhfxg+fKzZ/vRSzu1D8Z93ySomNu8ThYp332Ax9zEekzB7ZZetV5wQXI0qAm2rZPjngM857yM0prXAKVC53X5GY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtC9Z0OJ7GRiQzW+3ipK7jp38dCrlCfcaYz8GnHGWG4=;
 b=h5nsDhqYMkRKAJajw/9pDB1ZxLeBoY++NuRn4LMCwzdUwGDAbQfw+xsd0OJUiXYQQPmrOZPp2hZMMDAqS6my8kg7rKKXDvXXz66Vcn4+upiloI/3JGADb6xjA63TFscwhKva0voI9luQi2RbV05UtQoVL5yxkwpt1cvMyCh4SN8=
Received: from PH0PR07CA0116.namprd07.prod.outlook.com (2603:10b6:510:4::31)
 by IA1PR12MB6307.namprd12.prod.outlook.com (2603:10b6:208:3e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 12:38:54 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::ab) by PH0PR07CA0116.outlook.office365.com
 (2603:10b6:510:4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26 via Frontend
 Transport; Fri, 17 May 2024 12:38:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 12:38:53 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 17 May 2024 07:38:51 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <airlied@gmail.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH] drm/buddy: Merge back blocks in bias range function
Date: Fri, 17 May 2024 18:08:04 +0530
Message-ID: <20240517123804.2816-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|IA1PR12MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d6d477-e8f8-42e9-18b9-08dc766e4fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lWW4apAS19Y/RpnTth3/QzUFBZKN835UcEhoJg39NRre+ShP5/D5b5skjoiT?=
 =?us-ascii?Q?QuwgiPdsftGCXWV0Pj0J5UK58VLN+dkdeQaS4t0Y2GHr79e1Zhfm8tgijP2t?=
 =?us-ascii?Q?hsvgb4Y1FY/ZoJOJOb2wT3hFDFnBnxHutq1iOZ8Wie+/KluuuslVoh6vebzq?=
 =?us-ascii?Q?kiXXUoqeqVZ3zilc8QIsMHTNHrkAZt429SmUtOwiIOytgIvNOT1cJLMPtVka?=
 =?us-ascii?Q?A4z7zNGS1tElcrA3m/CCdcPJlTnxSKHfcvk1F3J9FxHohOLT3BorlLkDmG/k?=
 =?us-ascii?Q?Ep7c7XWzDPuOWPLWG4o9VrG6Tnbl8+qo3JzetXVjnTuf0RON3SnqzCDEPEYZ?=
 =?us-ascii?Q?NNI14IkOwAPFNDRW97uhGKoTyD+nGYkOTUlHW2kIxW6zrJJPSyetX3FVJSjJ?=
 =?us-ascii?Q?AHDDm00JW4OhttkWwcCFQDMmo4EqKpYqlmmtxTqWYzvYWTM437Q49Uown6NH?=
 =?us-ascii?Q?5X0A+XqIXhDNd787qgEU00qwJLp7NoJaw+LfWnZiB9uoGpHcGwW6SGHlXHa5?=
 =?us-ascii?Q?a6E0nA/p0wwzpVdW1Th88MAmINF4wD3kr8SzXeqql7ZZ0oWn0bkhLsOZSZAR?=
 =?us-ascii?Q?xIlQNZTe1LerW3pLsBxrVLO+ElYU/zSQoa60UjC/Ki+SQkT63J6RqIji1xLQ?=
 =?us-ascii?Q?XH7Pn32PGYx9Gg16E8ln9TcZyYU1Kp/T+EnwvAbJJsy6m5P3fDki2nXRoSn0?=
 =?us-ascii?Q?VF1ntpGbzwSqPRKqU1ZUE5IPetD36u4ScpACr321Aptdxb7VIm51wVw5LBhe?=
 =?us-ascii?Q?eGo0EFqJUeOcZFEYic7MBMA4Bb7wuaJg9l9B5X3lGtjJJTQbFr15RPwZNh5k?=
 =?us-ascii?Q?kLyT/tvctw0d6SQMWM+k7HikLdK3ysjLOaQmSHuQ91ByS99P1q0iEBL3Zue2?=
 =?us-ascii?Q?3Hz/RngxGKcmBLtzzNab4bwmEoDgxicxMaqmgfiV7uGUAhnOsS0ETwtINyWl?=
 =?us-ascii?Q?I/Uhub7ZUdZKEIrVpmeJIrDYvKyiHIUPb2r5wx1CxPj2YJSFwPLcwUnBKB71?=
 =?us-ascii?Q?tGSiUM2izUb1Jp4voFCtPGmZrr+1cHwLVulYX74t7IUYbLugnAL5IsQPeAuD?=
 =?us-ascii?Q?uT+VXjQrbp358wxFRS6QfN932TZ7jDcdihov5SQTIJlYRgCchTbudJVHzQol?=
 =?us-ascii?Q?zpYXcTAvS5BXOdYf0COFOk8WjnNxXWzfwcHk7NS53W7rP3kzwqwzrxp6AcG9?=
 =?us-ascii?Q?jaKV3cYVCD7Lm8iEUK8nPA5FX4bIFB7bBk5mskbW0DnkyB528TTHEjF24IRm?=
 =?us-ascii?Q?sDMKfx+YDdDl6STkxKrVTylgtMNqqmulHOREMnR1cj5ucsYQtuEXlTUg+w44?=
 =?us-ascii?Q?+eQNk2DWIZGVQFuEy1Zbqu6cCOr6T0rh5K010sZ1R65HX5Q2HJfkxZUpXYIC?=
 =?us-ascii?Q?skgM7I0XqwtdrGnEy1raMbXSykq+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 12:38:53.8233 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d6d477-e8f8-42e9-18b9-08dc766e4fe8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6307
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

In bias range allocation, when we don't find the required
blocks (i.e) on returning the -ENOSPC, we should merge back the
split blocks. Otherwise, during force_merge we are flooded with
warn on's due to block and its buddy are in same clear state
(dirty or clear).

Hence, renamed the force_merge with merge_blocks and passed a
force_merge as a bool function parameter. Based on the requirement,
say, in any normal situation we can call the merge_blocks passing
the force_merge variable as false. And, in any memory cruch situation,
we can call the merge_blocks passing the force_merge as true. This
resolves the unnecessary warn on's thrown during force_merge call.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
---
 drivers/gpu/drm/drm_buddy.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 1daf778cf6fa..111f602f1359 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -161,10 +161,11 @@ static unsigned int __drm_buddy_free(struct drm_buddy *mm,
 	return order;
 }
 
-static int __force_merge(struct drm_buddy *mm,
-			 u64 start,
-			 u64 end,
-			 unsigned int min_order)
+static int __merge_blocks(struct drm_buddy *mm,
+			  u64 start,
+			  u64 end,
+			  unsigned int min_order,
+			  bool force_merge)
 {
 	unsigned int order;
 	int i;
@@ -195,8 +196,9 @@ static int __force_merge(struct drm_buddy *mm,
 			if (!drm_buddy_block_is_free(buddy))
 				continue;
 
-			WARN_ON(drm_buddy_block_is_clear(block) ==
-				drm_buddy_block_is_clear(buddy));
+			if (force_merge)
+				WARN_ON(drm_buddy_block_is_clear(block) ==
+					drm_buddy_block_is_clear(buddy));
 
 			/*
 			 * If the prev block is same as buddy, don't access the
@@ -210,7 +212,7 @@ static int __force_merge(struct drm_buddy *mm,
 			if (drm_buddy_block_is_clear(block))
 				mm->clear_avail -= drm_buddy_block_size(mm, block);
 
-			order = __drm_buddy_free(mm, block, true);
+			order = __drm_buddy_free(mm, block, force_merge);
 			if (order >= min_order)
 				return 0;
 		}
@@ -332,7 +334,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	for (i = 0; i < mm->n_roots; ++i) {
 		order = ilog2(size) - ilog2(mm->chunk_size);
-		__force_merge(mm, 0, size, order);
+		__merge_blocks(mm, 0, size, order, true);
 
 		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
 		drm_block_free(mm, mm->roots[i]);
@@ -479,7 +481,7 @@ __alloc_range_bias(struct drm_buddy *mm,
 		   unsigned long flags,
 		   bool fallback)
 {
-	u64 req_size = mm->chunk_size << order;
+	u64 size, root_size, req_size = mm->chunk_size << order;
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
 	LIST_HEAD(dfs);
@@ -487,6 +489,7 @@ __alloc_range_bias(struct drm_buddy *mm,
 	int i;
 
 	end = end - 1;
+	size = mm->size;
 
 	for (i = 0; i < mm->n_roots; ++i)
 		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
@@ -548,6 +551,15 @@ __alloc_range_bias(struct drm_buddy *mm,
 		list_add(&block->left->tmp_link, &dfs);
 	} while (1);
 
+	/* Merge back the split blocks */
+	for (i = 0; i < mm->n_roots; ++i) {
+		order = ilog2(size) - ilog2(mm->chunk_size);
+		__merge_blocks(mm, start, end, order, false);
+
+		root_size = mm->chunk_size << order;
+		size -= root_size;
+	}
+
 	return ERR_PTR(-ENOSPC);
 
 err_undo:
@@ -1026,7 +1038,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			if (order-- == min_order) {
 				/* Try allocation through force merge method */
 				if (mm->clear_avail &&
-				    !__force_merge(mm, start, end, min_order)) {
+				    !__merge_blocks(mm, start, end, min_order, true)) {
 					block = __drm_buddy_alloc_blocks(mm, start,
 									 end,
 									 min_order,
-- 
2.25.1

