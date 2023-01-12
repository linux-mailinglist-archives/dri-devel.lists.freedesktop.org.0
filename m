Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC13667184
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 13:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44A810E2E1;
	Thu, 12 Jan 2023 12:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EA210E2DC;
 Thu, 12 Jan 2023 12:02:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGdiAHuYW538ujIVU915wYytFGabDAmPgXaasTtefL1iYZcev9d0trkaLNUKRkjeVDiXO3iEv9Pu2KWkXbDala3VbJKkWZGTd+7ZQqTUWggryPSOFvmzvtUXAwd3yjFKcu75M1YXRMrdsO8RyRS8FPWIKamy07a8jkoszBI14Kg34THUR/ZhGPLVwPCL1ca+mGkWmAJOUtw85oeoJl/J9nMjUYT9fUJUz9Aj2GAyLcHIHowQUBv9s67A3mKhUkf2kWFANKGN0oH2d0WjH1eLUE46osaXUilqbsn5PbMPxo/D9tNWZaTdUPNli8QeBH+QkW/CPzKf+c148UCxiqNt0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdbUzn8q0xGKlgY0mobVpFoHgdmzv3lyen7jbdpyfC8=;
 b=J2RHQ5mXayr6/RCtqmDV1OrgF74v4pzRNIODPqUjOfq51sG27JYXacTj4+aQijJs/qHyX06uDYiPbWnbdsKnfw7GrpL9SxEp+telQivM022CAdZZAvgK8HeSeiJfTxNP3RZUhU4O/Ek11PYnYT34WrCVNqRjZWzftw4Kgt48tZeel+B7NyJtxXGJ4bct/NPgJfT2a1o5Y/BP5NGiQOGKxLI753aIzjFea2oAukDLgdA11jceO9W2iYcFpU1wDJuMqKkug+OgO+9tyCTd6lV0TCb+/fq2HM0D8Vs+OtZGs8hmQOLphWJzqSu1hsYpmnG7ZqDDVwfMbPMtC/2gBZ9tUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdbUzn8q0xGKlgY0mobVpFoHgdmzv3lyen7jbdpyfC8=;
 b=fssBo51YX1LOijaubKiU4p2er+aSwoUdHs9YZ7Jrgv5y3p1yWi2gHqklP0sR9iXFC+mzAYU93F3UwXJdchiHcNQ7wXMdSPJK8RklUUuDtGuDukYOe34Ee7DfmHYBEbnjMWBAVgOmWVzwXgxA7e90r8hplODx0B83uGEcMu/5X0g=
Received: from CY5PR04CA0018.namprd04.prod.outlook.com (2603:10b6:930:1e::31)
 by BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 12:02:06 +0000
Received: from CY4PEPF0000C96F.namprd02.prod.outlook.com
 (2603:10b6:930:1e:cafe::17) by CY5PR04CA0018.outlook.office365.com
 (2603:10b6:930:1e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 12:02:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C96F.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Thu, 12 Jan 2023 12:02:06 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 12 Jan 2023 06:02:04 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>
Subject: [PATCH v2] drm: Optimize drm buddy top-down allocation method
Date: Thu, 12 Jan 2023 04:00:27 -0800
Message-ID: <20230112120027.3072-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96F:EE_|BL1PR12MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dce6029-037f-4b75-ba66-08daf494d377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8nC50UPsvZOxviT62v4vDPs7By2RAzXj9L/Y8nG9L2tE5zpGgpBuSZSOKrqSbwm64iHcpHKrk7ZntmJs6zHUn9TJxbIGbhnRS0vcLtD6tce9y4cFJwz+nS6/mtzyI1TBgzyX+LhKVmnOSUPOxoUNzef23UgLIRHTUQXrVMrl981Lfw2zJ5ekNYKszWH0GAktHroxdse5CrP9guRhLpM2TiNhvbR/mT76T45nb9araXf6ualhA4vuvPbxFqIxnD8zimaojZPQzrxeBDtwxyHNP3QTm/KVv9VFXVuvekwUIY1fu9JEpnIx+RJsVrbzjqyfx1EzSGxISIcu/JIinrEQ1tYIw7n9NYVZ870IeOo3TQ0KwQC5CHuPnTVNUgJbxdJZb9qa00cifc/aLcOQmer04o677URFu9gHUDywPcFtV3S2M+uFkhXABDKQXVGpBCe256liG4UjZftpKCc1oHIffAWnC3sHCpqbP15NojvyMeGXO2RnD/xqKpPG942U+/AvjGac2VHmEST3eCIHrsUWp+hLcihq1ADO7Qsb2/DxJaVdWeytlqmgtu3r16aYuRJy0WAEWCsVGzNBhas25XFSvn50ljLZfAB+dEyLugjRtd0q7jadQYxESQ2b4w4CJKEdK2ZX2IzPb3Kn3xib0W+wanleQdmdAidwOSN2F03eG+XWklx+WFDA5wDpZJN2DJN1gT7uMKfz3hlxoqOOh5Ivq6hs2yIGLpFiyYnCuwz81s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(8936002)(5660300002)(83380400001)(41300700001)(426003)(47076005)(66574015)(81166007)(86362001)(82740400003)(82310400005)(356005)(36756003)(40460700003)(2906002)(40480700001)(36860700001)(478600001)(26005)(186003)(7696005)(16526019)(336012)(8676002)(4326008)(70586007)(70206006)(316002)(1076003)(110136005)(2616005)(6636002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 12:02:06.5428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dce6029-037f-4b75-ba66-08daf494d377
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C96F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5874
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are observing performance drop in many usecases which include
games, 3D benchmark applications,etc.. To solve this problem, We
are strictly not allowing top down flag enabled allocations to
steal the memory space from cpu visible region.

The idea is, we are sorting each order list entries in
ascending order and compare the last entry of each order
list in the freelist and return the max block.

This patch improves the 3D benchmark scores and solves
fragmentation issues.

All drm buddy selftests are verfied.
drm_buddy: pass:6 fail:0 skip:0 total:6

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 81 ++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 11bb59399471..3d1f50f481cf 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -38,6 +38,25 @@ static void drm_block_free(struct drm_buddy *mm,
 	kmem_cache_free(slab_blocks, block);
 }
 
+static void list_insert_sorted(struct drm_buddy *mm,
+			       struct drm_buddy_block *block)
+{
+	struct drm_buddy_block *node;
+	struct list_head *head;
+
+	head = &mm->free_list[drm_buddy_block_order(block)];
+	if (list_empty(head)) {
+		list_add(&block->link, head);
+		return;
+	}
+
+	list_for_each_entry(node, head, link)
+		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
+			break;
+
+	__list_add(&block->link, node->link.prev, &node->link);
+}
+
 static void mark_allocated(struct drm_buddy_block *block)
 {
 	block->header &= ~DRM_BUDDY_HEADER_STATE;
@@ -52,8 +71,7 @@ static void mark_free(struct drm_buddy *mm,
 	block->header &= ~DRM_BUDDY_HEADER_STATE;
 	block->header |= DRM_BUDDY_FREE;
 
-	list_add(&block->link,
-		 &mm->free_list[drm_buddy_block_order(block)]);
+	list_insert_sorted(mm, block);
 }
 
 static void mark_split(struct drm_buddy_block *block)
@@ -387,20 +405,26 @@ alloc_range_bias(struct drm_buddy *mm,
 }
 
 static struct drm_buddy_block *
-get_maxblock(struct list_head *head)
+get_maxblock(struct drm_buddy *mm, unsigned int order)
 {
 	struct drm_buddy_block *max_block = NULL, *node;
+	unsigned int i;
 
-	max_block = list_first_entry_or_null(head,
-					     struct drm_buddy_block,
-					     link);
-	if (!max_block)
-		return NULL;
+	for (i = order; i <= mm->max_order; ++i) {
+		if (!list_empty(&mm->free_list[i])) {
+			node = list_last_entry(&mm->free_list[i],
+					       struct drm_buddy_block,
+					       link);
+			if (!max_block) {
+				max_block = node;
+				continue;
+			}
 
-	list_for_each_entry(node, head, link) {
-		if (drm_buddy_block_offset(node) >
-		    drm_buddy_block_offset(max_block))
-			max_block = node;
+			if (drm_buddy_block_offset(node) >
+			    drm_buddy_block_offset(max_block)) {
+				max_block = node;
+			}
+		}
 	}
 
 	return max_block;
@@ -412,20 +436,23 @@ alloc_from_freelist(struct drm_buddy *mm,
 		    unsigned long flags)
 {
 	struct drm_buddy_block *block = NULL;
-	unsigned int i;
+	unsigned int tmp;
 	int err;
 
-	for (i = order; i <= mm->max_order; ++i) {
-		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
-			block = get_maxblock(&mm->free_list[i]);
-			if (block)
-				break;
-		} else {
-			block = list_first_entry_or_null(&mm->free_list[i],
-							 struct drm_buddy_block,
-							 link);
-			if (block)
-				break;
+	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
+		block = get_maxblock(mm, order);
+		if (block)
+			/* Store the obtained block order */
+			tmp = drm_buddy_block_order(block);
+	} else {
+		for (tmp = order; tmp <= mm->max_order; ++tmp) {
+			if (!list_empty(&mm->free_list[tmp])) {
+				block = list_last_entry(&mm->free_list[tmp],
+							struct drm_buddy_block,
+							link);
+				if (block)
+					break;
+			}
 		}
 	}
 
@@ -434,18 +461,18 @@ alloc_from_freelist(struct drm_buddy *mm,
 
 	BUG_ON(!drm_buddy_block_is_free(block));
 
-	while (i != order) {
+	while (tmp != order) {
 		err = split_block(mm, block);
 		if (unlikely(err))
 			goto err_undo;
 
 		block = block->right;
-		i--;
+		tmp--;
 	}
 	return block;
 
 err_undo:
-	if (i != order)
+	if (tmp != order)
 		__drm_buddy_free(mm, block);
 	return ERR_PTR(err);
 }
-- 
2.25.1

