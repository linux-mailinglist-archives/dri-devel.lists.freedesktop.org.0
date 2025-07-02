Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C594AF5E36
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FB810E741;
	Wed,  2 Jul 2025 16:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xVsDIZQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6F010E741
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 16:13:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fj8gf5UxDu9efmB4JMNU5fERkgwKH5AjoIf//mYRCJgwB5hWhrWrerW+h2b4zxSxsuxes6svW2AI3eE24Q0NPj8mmXJywQlo0DidSFcCrbBNdoGnx4CvxhJwStXOymyrlNG9QwYWICuUMTlf8MflAqjB/XBJJZ1MKMuKp6atc82IbgLUr+5/9CRAys3KOg6PoXAPCvsndh2FfckcP9JQjRp9RBoL/Dgu3Z324DRkPn4N+EC2sfobiAVH/sghVFrmWGwLQnCpUMR34HBdYH29DpcVVr1UDaH3LdJCGdNdkGx3efJSnepU32tiJpxtqVbqzsKJJAnbgo4Kbp1Kq5AdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ik1fsrU3+1GM9eFwPLMAXJh38CC+gxZmcnGsD0S1ytI=;
 b=RwbgBvWpXlGq9zv4gk9N0WQP5J9vQEB18SlfsexS7NqcmAjdFvJsVtlwYUxRwuYnH7tJAH/jTVNv+eP7Dz4blWFnnzXdxqazOfKcxyT4CGoN0OEChcRsXeonSZZ1ORgB3jmCMXKkwAo85CJPaIquhzHb+JVVGw/EVDDVPNUuOfPMjrata2I7bAmXbISXXQzpQI55ZA+k4A4cNERfqvw6pwZtjOiQM8ZDnn+DtiXyMZOf+16SAYPCzZBZ6Qbib0rWPy8XoIjthUNIn9pJwLT0O2MWSmBRatxuOGShqghPeOWH7lJfXWXYuwq40yjZydr8sUyCCU56C2fYV9/be3FhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik1fsrU3+1GM9eFwPLMAXJh38CC+gxZmcnGsD0S1ytI=;
 b=xVsDIZQRzKh25OQv06cpWeuPDVXg15C5/9ePZE80MCtT6VJkVrzIRy1F8rWJvip8osuA+yx7I6UAi7zi0F3WA+IenTQd+V0wB07XbKZkmO+9Id84rPexTwzfl2Ofn79FO4dNayUobXP94negjYYWIgqSLOUdgUGqa8dDt2OOhSA=
Received: from SN7P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::16)
 by PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 2 Jul
 2025 16:13:36 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:124:cafe::9e) by SN7P222CA0016.outlook.office365.com
 (2603:10b6:806:124::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Wed,
 2 Jul 2025 16:13:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 16:13:35 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 11:13:33 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/3] drm/buddy: dont go over the higher orders multiple
 times
Date: Wed, 2 Jul 2025 18:12:04 +0200
Message-ID: <20250702161208.25188-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702161208.25188-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250702161208.25188-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|PH8PR12MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c03b0f0-1cdc-4d21-5705-08ddb98365c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7FPfXiVCZxILjuV/nzvRpMK/FBYIgvadxKV6mFY60jur9EDwOx9FU1ENfUSd?=
 =?us-ascii?Q?DYz5eAfKawiylss9E0fMe0qdZ6CHYGnozQcjjKU8cU3TugPW8ZhV5kgWgdNr?=
 =?us-ascii?Q?9LTEI5CpZXLVhxrWVnGtTh/w7F74LABveejwvzGjfwVXWBo1Qj03+er1uxoI?=
 =?us-ascii?Q?/c1PwGeN2uitefhK63zB2gtCw3TF/AE6CAlTAA55TDxAXDpCkLJHyGxrZ4MF?=
 =?us-ascii?Q?fGrbPHSb22po2lquz+tOKJl5itAmpyw3D7AZkJy9Q0bisTXQk9UY0dyIFhQw?=
 =?us-ascii?Q?D6agBq4KzeZnQIYs9H0/knp4WnwGVEySpv7wsIzQN4S2jpt2TQedmodADg6W?=
 =?us-ascii?Q?0k8244uXw9244dkiRbMO/5tiUJI4N/ArHoPqoDn/hoXnLj6pY5dyOTYsGXpE?=
 =?us-ascii?Q?DwN/sRCErIvZ9tTzFuwk85s8hSrPe5w5p3Qh8V5JOVPEP6imXvdkfpSg4/Nf?=
 =?us-ascii?Q?XOa49+wU8o60bqL9xdgjyB5PFNNYHjEwhlE52NrBTbEXyLAaTRIsYsaRIO1Y?=
 =?us-ascii?Q?H6BTwItrXITbekWXnCTdUdL8vBE9288baZPXo7Zx3saPlMK3QVexnDWQqzFT?=
 =?us-ascii?Q?cG563HcHDHwfKrLZILI9T3MdwB/vDJ7MnxUICbpnUAWh+B1D8OY0RxLE4LnI?=
 =?us-ascii?Q?LaXYvCb/G9enKnutEvzXhZlVfly28SciPf8GGdwSHLAiglMgEk61SdLJVHRe?=
 =?us-ascii?Q?jcq9SkXgaE8Vgd4HwWaA7nVfajTWAa6i3U/hcNjVIpDdD98PWKWRRILDW8yU?=
 =?us-ascii?Q?uv+QmsQUiAj3jXNR7riIZjDVuoNg/h43ry4Rk7J8nmE5GMyjxXRaHReFQUqX?=
 =?us-ascii?Q?6y+ffKmCVXMiD5v3EJwwffvtj+pQluDwRW4wc+84uMunHhRo4GipqB3NYO3Q?=
 =?us-ascii?Q?O3+9ytkSlI4GTder17tSLj7e3hvH1MU78JfXoRAwsnBr6fiv9AaUQXNp9YrF?=
 =?us-ascii?Q?yK1xbDi102SUWU6V9t6CDWPkQzf9E2PCaO0tttqg/rV3gNHne3WLfb0FH1vN?=
 =?us-ascii?Q?AtVlciMIZQy/yvjSCsB+cG1Lms/1mSnnJ6K7y49pl9aGX0JmJ4BVwXTQQPZl?=
 =?us-ascii?Q?GATtm/JqiZLyA5jww1fCWTDwxp7vmCIHfkPwKK00jHdGMHJOIG87oGlUoFEf?=
 =?us-ascii?Q?/MhUn/B0tRsX2x0ePB1Zl3HTA+lID8xsjG8PwG8KNaD3f9pb99e49sbvnGcs?=
 =?us-ascii?Q?JeUBiG81+Wog3bIb+iWv75d0Et3OFpXJdahpZ5OEFkTF4sXvOqa1NCsrV2lr?=
 =?us-ascii?Q?/Js8aVzTkNVDqe7X9MU3YNGa40ni38IfJmlwDtHqxjzx3YybFdFKDL6o3oIh?=
 =?us-ascii?Q?3C5a1Pm66zgqqRZMmmm+JpWNG85ymfR30+EoHih66HfQK9L/F6FRVHNhvpzW?=
 =?us-ascii?Q?POxY+/PrxR2SjxiQNAMCH2zaWTjH3g36XWxJ2fSwMxnPvBhBU7LxOxBO7HPl?=
 =?us-ascii?Q?iBaeiVy2Qmn2sY4fXkS/UAavnLtmhcg4MqwembNyNrnq4wIVt7koCmBYs2ri?=
 =?us-ascii?Q?JbsKgUDvAf/LeaXuzCh8WWJTScHBkzXiy9RZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 16:13:35.4909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c03b0f0-1cdc-4d21-5705-08ddb98365c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7325
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

AFAICT the rationale for the loop is to:
1) try to allocate from the preferred order
2) if it fails, try higher orders (order + 1 -> max order)
3) if it fails, try smaller orders (order - 1 -> min order)

Steps 1 and 2 are covered by the loop going through [order, max_order].
Currently step 3 tries again [order, max_order] but with decreasing
values of order.

This is wasteful, so change it to evaluate only order.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index fd31322b3d41..9d3723f2cff9 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -590,13 +590,14 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
 
 static struct drm_buddy_block *
 get_maxblock(struct drm_buddy *mm, unsigned int order,
+	     unsigned int max_order,
 	     unsigned long flags)
 {
 	struct drm_buddy_block *max_block = NULL, *block = NULL;
 	bool wants_clear;
 	unsigned int i;
 
-	for (i = order; i <= mm->max_order; ++i) {
+	for (i = order; i <= max_order; ++i) {
 		struct drm_buddy_block *tmp_block;
 
 		wants_clear = flags & DRM_BUDDY_PREFER_CLEAR_ALLOCATION;
@@ -635,6 +636,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 static struct drm_buddy_block *
 alloc_from_freelist(struct drm_buddy *mm,
 		    unsigned int order,
+		    unsigned int max_order,
 		    unsigned long flags)
 {
 	struct drm_buddy_block *block = NULL;
@@ -643,12 +645,12 @@ alloc_from_freelist(struct drm_buddy *mm,
 	int err;
 
 	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
-		block = get_maxblock(mm, order, flags);
+		block = get_maxblock(mm, order, max_order, flags);
 		if (block)
 			/* Store the obtained block order */
 			tmp = drm_buddy_block_order(block);
 	} else {
-		for (tmp = order; tmp <= mm->max_order; ++tmp) {
+		for (tmp = order; tmp <= max_order; ++tmp) {
 			struct drm_buddy_block *tmp_block;
 			wants_clear = flags & DRM_BUDDY_PREFER_CLEAR_ALLOCATION;
 
@@ -956,6 +958,7 @@ static struct drm_buddy_block *
 __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			 u64 start, u64 end,
 			 unsigned int order,
+			 unsigned int max_order,
 			 unsigned long flags)
 {
 	if (flags & DRM_BUDDY_RANGE_ALLOCATION)
@@ -964,7 +967,7 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 						     order, flags);
 	else
 		/* Allocate from freelist */
-		return alloc_from_freelist(mm, order, flags);
+		return alloc_from_freelist(mm, order, max_order, flags);
 }
 
 /**
@@ -995,7 +998,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 {
 	struct drm_buddy_block *block = NULL;
 	u64 original_size, original_min_size;
-	unsigned int min_order, order;
+	unsigned int min_order, max_order, order;
 	LIST_HEAD(allocated);
 	unsigned long pages;
 	int err;
@@ -1044,6 +1047,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 
 	do {
 		order = min(order, (unsigned int)fls(pages) - 1);
+		max_order = mm->max_order;
 		BUG_ON(order > mm->max_order);
 		BUG_ON(order < min_order);
 
@@ -1051,6 +1055,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			block = __drm_buddy_alloc_blocks(mm, start,
 							 end,
 							 order,
+							 max_order,
 							 flags);
 			if (!IS_ERR(block))
 				break;
@@ -1062,6 +1067,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 					block = __drm_buddy_alloc_blocks(mm, start,
 									 end,
 									 min_order,
+									 mm->max_order,
 									 flags);
 					if (!IS_ERR(block)) {
 						order = min_order;
@@ -1082,6 +1088,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 				err = -ENOSPC;
 				goto err_free;
 			}
+			max_order = order;
 		} while (1);
 
 		mark_allocated(block);
-- 
2.43.0

