Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3DC49E443
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8C510EF53;
	Thu, 27 Jan 2022 14:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7DE10EF33;
 Thu, 27 Jan 2022 14:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/KCkFRP+7fai0ST1oTjzEA+D24BDRvL9GGlFWAFnZ+VOMa4Ae/GERTO5+juxb18FXw3OOUgt6UbHqiNac4AIFLgAQw3MIGcIl9VbGrt5iKAM6Vb8m0rHej2hnK3yIN6bhGjAqLR+JPLIZJdEcMz0BcpaH+oyPkxwcSCu2mpeRgV9qh1vH99GVNEg4NXG+Ovv705e7kY7XAmg3gAadg31f8fh5GLpZxQB33bmxVpp5OXIMl5qzBYumYQhkfeB5yjrnqe2G9PPd59ph2mS1LJNqzk9dvuMc2LbewCxZAQvqLwoAhmWg+EqCPRxqb9T8WXQqro65VFUFBfL2W8L86d/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4MuGRi00Z3ItaK8yXVZ0lzYJ5VgsKyMqI8/DcntmHQ=;
 b=kAgg5n97eyV0B8RexuS56dyKYGoin1OmnXzZGVn4NmrGoz8/L8oO0VCBKjTxFf7O1LQ82EfahiOlk/HBe4wPtXah4mGCA8uJcMyN4RNoFObq7H0srUX1Jp0DgK9I3Emw6D5zWxCo5DJ84PdwyjKZpiiHOWyQke20jMfDaspGjJVgN+sXNAqvUhHpbbMyxbGc0u9Cl1vjl6xzDK99vLlYyPe2/10rOvq48U+7fDUdiQ/A1BU75oSrnZmpbjHf5BnNwDOtffoZ7qNBEQNlbcfhjFNaCveE7ed7o6SjjkSDY8m3egJKkReqJ2/VQed9fi4OWuw7ERyQN9nDKo7jembDaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4MuGRi00Z3ItaK8yXVZ0lzYJ5VgsKyMqI8/DcntmHQ=;
 b=PU1VtIiGS7MagCqVaVMea3jdYFpdzQvmFOUH1QFAeI3WvH5HeZAaVs86BXKQtj8dSdjhH99111eMKzBOwpotpPO/Yz8LqnFXmmBPB98AqagH8S/NbuEZm/FYVO6TWfWcXuUnaspefnJE1NvCYUqqqvQNy/qdYcEFmadFOOdXF0Y=
Received: from BN1PR13CA0008.namprd13.prod.outlook.com (2603:10b6:408:e2::13)
 by DM4PR12MB5248.namprd12.prod.outlook.com (2603:10b6:5:39c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 27 Jan
 2022 14:11:32 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::6e) by BN1PR13CA0008.outlook.office365.com
 (2603:10b6:408:e2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.5 via Frontend
 Transport; Thu, 27 Jan 2022 14:11:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 14:11:31 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 27 Jan
 2022 08:11:28 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v11 2/5] drm: implement top-down allocation method
Date: Thu, 27 Jan 2022 19:41:04 +0530
Message-ID: <20220127141107.173692-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba8f95dc-f6ce-4f0c-55b7-08d9e19eeb2a
X-MS-TrafficTypeDiagnostic: DM4PR12MB5248:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB524892AF9A7704E03A2AA0D7E4219@DM4PR12MB5248.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45Yz9oLD/J3yDuNgAZHV6Xh7vHfgeoMd1z/sTSZqY1oFh2yvfWCg9RLtqu2y5sIPSJi0/IhWOrnQo4MOKSlVs1eyxxSpxJLsBFBENLrBVWeUEyjPqU6oscJYE5patVbUoWPob+xiQ+uGpZWzZwgs/07Z/q8WQESgm+NbB1qejBhOqBPE7dV9wMxY8KewoJ5rsaT7NkTLNm7yPSju4ew7zLcCzAAJ7qiMLRYh0fbWqdFb09EblzHthNNPln1Pxk/OGuJIbJF7hHkzkdlZuYWE0QbT9uFpDTiMyG4Nu/TAXbHiYEia6UrsJlkX8MzywkwFbNae5TzJ2Wuzexz2fbrMrkxPibIJ55hmWMr3KnPzPL4a+UoODDPVA2krO4lu3qcMQ1/mYJRhV0GT6mFBsyaHvS1Ja2EHBA4hGeWGrIu0C+YtER3XmgXreHM/ll1GMLIu7bi/H/sGZiiXCZokvFY+GYMlNQkP0izWiVtKxgroEOPnACWbrjEtz7zahW36CURte2PSSpjf7p5FAsl/FlRQbISLNuCxlCwwPJbpSCUjTOo5seENqXGFLCssfEqvLrjSbmzRy4wIJxoEeI9g1ZiSMJdmRHKExMcynAQON/0Rglk9BGw4Cbk9xfMqLHTU97C4N1u0y9Q0OcjQPh/pUyFBSznL3gFv454l0VbQ6J2B64J0ix2oFrcqsLDf3zXqK5NaRk8A8SIeGmENrbG8O5P7HkMiPGgOh9YEjcj3IWs4D+5TJz+UmE/7cOQggdQ+NsTHASvvNyqknRQ0/pSe1PVyjNGOcnLqKWgerUAZCh7X+uY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700004)(46966006)(54906003)(8676002)(1076003)(83380400001)(2616005)(40460700003)(110136005)(86362001)(16526019)(26005)(8936002)(36860700001)(186003)(36756003)(6666004)(2906002)(508600001)(4326008)(70586007)(336012)(316002)(70206006)(426003)(81166007)(7696005)(47076005)(356005)(82310400004)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:11:31.5200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8f95dc-f6ce-4f0c-55b7-08d9e19eeb2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5248
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implemented a function which walk through the order list,
compares the offset and returns the maximum offset block,
this method is unpredictable in obtaining the high range
address blocks which depends on allocation and deallocation.
for instance, if driver requests address at a low specific
range, allocator traverses from the root block and splits
the larger blocks until it reaches the specific block and
in the process of splitting, lower orders in the freelist
are occupied with low range address blocks and for the
subsequent TOPDOWN memory request we may return the low
range blocks.To overcome this issue, we may go with the
below approach.

The other approach, sorting each order list entries in
ascending order and compares the last entry of each
order list in the freelist and return the max block.
This creates sorting overhead on every drm_buddy_free()
request and split up of larger blocks for a single page
request.

v2:
  - Fix alignment issues(Matthew Auld)
  - Remove unnecessary list_empty check(Matthew Auld)
  - merged the below patch to see the feature in action
     - add top-down alloc support to i915 driver

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 36 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  3 ++
 include/drm/drm_buddy.h                       |  1 +
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index cfc160a1ef1a..30cad939a112 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -369,6 +369,26 @@ alloc_range_bias(struct drm_buddy *mm,
 	return ERR_PTR(err);
 }
 
+static struct drm_buddy_block *
+get_maxblock(struct list_head *head)
+{
+	struct drm_buddy_block *max_block = NULL, *node;
+
+	max_block = list_first_entry_or_null(head,
+					     struct drm_buddy_block,
+					     link);
+	if (!max_block)
+		return NULL;
+
+	list_for_each_entry(node, head, link) {
+		if (drm_buddy_block_offset(node) >
+		    drm_buddy_block_offset(max_block))
+			max_block = node;
+	}
+
+	return max_block;
+}
+
 static struct drm_buddy_block *
 alloc_from_freelist(struct drm_buddy *mm,
 		    unsigned int order,
@@ -379,11 +399,17 @@ alloc_from_freelist(struct drm_buddy *mm,
 	int err;
 
 	for (i = order; i <= mm->max_order; ++i) {
-		block = list_first_entry_or_null(&mm->free_list[i],
-						 struct drm_buddy_block,
-						 link);
-		if (block)
-			break;
+		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
+			block = get_maxblock(&mm->free_list[i]);
+			if (block)
+				break;
+		} else {
+			block = list_first_entry_or_null(&mm->free_list[i],
+							 struct drm_buddy_block,
+							 link);
+			if (block)
+				break;
+		}
 	}
 
 	if (!block)
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index a328a38fab07..7f553cceb6c0 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -53,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	INIT_LIST_HEAD(&bman_res->blocks);
 	bman_res->mm = mm;
 
+	if (place->flags & TTM_PL_FLAG_TOPDOWN)
+		bman_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
+
 	if (place->fpfn || lpfn != man->size)
 		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 54f25a372f27..f0378fb48d06 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -23,6 +23,7 @@
 })
 
 #define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
-- 
2.25.1

