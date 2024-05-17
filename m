Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904798C881C
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 16:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E9910E1D4;
	Fri, 17 May 2024 14:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ph3J5TA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C4610EEF2;
 Fri, 17 May 2024 14:33:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmiFCQx53tLrHMBRTEDhBaQlMutn9hK4tmB10dTtw221QGiN4U+YchIsS92BTg3IctsUEwPm9qFF9c+FfypXRyWAktrucefjMiMtAL/VbRGog81OSXGaxJz5LwtiaTuh/wK1KYJnHyteRBCneHgwLJYlsaWbe1/n9tGN/F8WY2k0hk+UTL6RJSg2iwl3g2eXTmOALRvURFN7cjBWdJbilrDsYW84O46GXlUzlN8maFlJQrZtmA7qfBroT4vuJjw2pAkP6KeIhl0i3mhfAADY0oCBBOESq4YLFQiZC5KOHApeBuqWa/UNbYixoXVBGLjqA+2IegNxdz1Kg3rRFpIDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9CX8cvoxqWtMEFiZgZEHU+If9mFDlK/9UtyWnjyT8g=;
 b=e38mOYgkRCq1ik58b9t1rCsAQDnjFkKRruni4uRQwsGEiy9vZRuFNxfDzC1bcBQ0bkxccp0PmHjU4x3EvLrRaHML/dppoB+Zw4o6PNwR2tLsvNC4nEfNBmknLt9UunQKhFSCDStY5np+hZs/aKVHrkAqBzIDHXAnWeURgOBUiGUJo3/sIwr3xI0zshE98dQHzaOs+TLkGiDgetrr368YAQzun1zw1rrdiLL7zOSubL+8rtZB982YNnpCJOlZuof+xn5R+KXDxdr0P8ZHaOXX2qB9mq6KVS7AsW+cazcNXu5NuybzOab6wRJrv+lsuXKBu08dMWtmvvLAGPfXIozCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9CX8cvoxqWtMEFiZgZEHU+If9mFDlK/9UtyWnjyT8g=;
 b=Ph3J5TA6/synUDIAu5wJOJVM0XhC2IjoGnjs1Fc/IPIyWaWu35HubUYx3Y7QavaAUnLLNS53xJyOiuGJ+I5Q+voi1PtMzM1nlZKU+xd9o/iPnqoXyAC3dC+cs82kba6Ca9TI19RrWenQghPCT5xGxsCVvCYNf0loq9g7n+Ab2dY=
Received: from PH8PR07CA0016.namprd07.prod.outlook.com (2603:10b6:510:2cd::24)
 by SA3PR12MB9200.namprd12.prod.outlook.com (2603:10b6:806:39c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 14:33:22 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::21) by PH8PR07CA0016.outlook.office365.com
 (2603:10b6:510:2cd::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.31 via Frontend
 Transport; Fri, 17 May 2024 14:33:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 14:33:22 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 17 May 2024 09:33:19 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <airlied@gmail.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v2] drm/buddy: Fix the warn on's during force merge
Date: Fri, 17 May 2024 20:03:05 +0530
Message-ID: <20240517143305.17894-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SA3PR12MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: f64dbbe4-9797-453a-d354-08dc767e4dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|36860700004|376005|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Feb3FvEkAiksj/yf+lrtwAo59KMOIiMhtmtruqEi4VZnnNP8njoG2ACmRaOW?=
 =?us-ascii?Q?h2jonjOBb5UqXXvhxfFR+rgpQnMEKapwgG9YhZZk2ZH8Dc2tLTeb8HDKSnOV?=
 =?us-ascii?Q?/3qS3KCSCwikenVJqo7BX02sr42KH9pAS1LCc3j5b7TH32iE1hrPWn9UWBbx?=
 =?us-ascii?Q?hmI851SaalYQj9G8YbWZ0bOIf8es7qQbK7LrkKrAIt8QYkVNhsf3ieKlbGdN?=
 =?us-ascii?Q?FyKZXNlp9HFZi6R79NUYOYqAyn8rrp90hKPEijRv4wy/o9k6sE+fmGLM/4My?=
 =?us-ascii?Q?Dh7cN8VnIkPfZAe6izNBklNG+P9On9nPnlGmdYi+QQj5HSWuhvdsIGqAqtM/?=
 =?us-ascii?Q?VZzKH5DrhYLPNGf280xnqAEjLXU4Izi7bcYWDoBg0pT8soQzAmOVzxoHZFF3?=
 =?us-ascii?Q?F4PDfr5K1ZibbzPaliQkaMJsGZznfFYZhnRO30U0lL2xdwF8ASkm4+oAzpeP?=
 =?us-ascii?Q?lTqNdgh4T7o0Ngc66RIB+OnypKLHnzKX4LBQeRbipX/PG1Byq/nqyHrF0Bd4?=
 =?us-ascii?Q?/5jrlA/kE0E8DDqA3DRJn7GfKn5cD6zaHmfqELRIXfiaIgWHbiwV+mFQiBej?=
 =?us-ascii?Q?1L+myu2+sdxnTaGOhlYatWnleZoLRNHU0kpoQIzahjYtHlqnPXVugnnEJa3f?=
 =?us-ascii?Q?B2IkBJmuhL5MaMlEKiM+ChC3Qj2RQrmRYhP7BXUv8+GllwRjHc02ZXA5DKAq?=
 =?us-ascii?Q?K9yhc306mjmopy5XPHBvi4YFInxWpGSnjQ6fifbVz9edjylZZGDns4D8qGTS?=
 =?us-ascii?Q?hfFNaojHMw/jOidjul73aLT9i6GHEl1LcMhuZAN2enAkv5jYeMeSqoO8lhsb?=
 =?us-ascii?Q?gU5Td9kXfARc4bV2CPssHB1F7NNRAE+p7kviTtLFOBYZ2RlKlXHyxWydq+/V?=
 =?us-ascii?Q?OajOx4y3EgGy9foO/flNjFl3Ku4pXjmLv7SUymtFvb/v6DiEQ+yEmRmhOAkL?=
 =?us-ascii?Q?8QlZCNcDEcslaQ7f9rbzj/lSQWnr605q8oGlqtV2fE1xMA30aECYeS0PC3f4?=
 =?us-ascii?Q?kK5vI6DSp5yJrsVzQ3eSAag9XCodfpYgw0KorFGGRUTdytEHbdJyatw9LGSc?=
 =?us-ascii?Q?CpHOlY7ZUN8ljvFNKYi3zinThC4ej7q8N6b4POFHNxbS2AYZR7tiKC66x9mu?=
 =?us-ascii?Q?MKWhU6wCdAFrDaaMlVTyp7IohrqjL+tJ9/7ko0odA2GLDJK/ut9G4dxFcOSY?=
 =?us-ascii?Q?STqVNUDM4rZxvMOcXsA83LYMrgHetcDK3HTDuj85WAA0dje1gOyb4mtuxCXD?=
 =?us-ascii?Q?xcWO7rh30jr/q+2UFeau4bP296m08Yucz8FZ0WKK9pwki8x3B6YlgwFkG6kB?=
 =?us-ascii?Q?w0LrMdYHQX/S+QQcb0MMM19m?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 14:33:22.2630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f64dbbe4-9797-453a-d354-08dc767e4dd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9200
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

Move the fallback and block incompatible checks
above, so that we dont unnecessarily split the blocks
and leaving the unmerged. This resolves the unnecessary
warn on's thrown during force_merge call.

v2:(Matthew)
  - Move the fallback and block incompatible checks above
    the contains check.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
Link: https://patchwork.kernel.org/project/dri-devel/patch/20240517135015.17565-1-Arunpravin.PaneerSelvam@amd.com/
---
 drivers/gpu/drm/drm_buddy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 1daf778cf6fa..94f8c34fc293 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -524,11 +524,11 @@ __alloc_range_bias(struct drm_buddy *mm,
 				continue;
 		}
 
+		if (!fallback && block_incompatible(block, flags))
+			continue;
+
 		if (contains(start, end, block_start, block_end) &&
 		    order == drm_buddy_block_order(block)) {
-			if (!fallback && block_incompatible(block, flags))
-				continue;
-
 			/*
 			 * Find the free block within the range.
 			 */
-- 
2.25.1

