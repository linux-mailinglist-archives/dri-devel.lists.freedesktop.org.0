Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E75660FE1
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 16:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EE710E11A;
	Sat,  7 Jan 2023 15:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB7E10E0CE;
 Sat,  7 Jan 2023 15:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOqGt6/yGYtY77MBb6msJ31VIXJ0hT1ron1rbBd3nEHuq2jVQDNSANmQfFXvavkjhnoSULtJbfybwFFGbMx8Gl4fwiWI7QKxy0mog68fj65nYxkQAP1Mw9pT6Iba1Etttw+xkgtSuHY/QaFH2z40hprkl+PDY4oifXJMpOcxgUHAT9QLTztNp6+4rUYUhdmUv+RPZTlOrGnXDjME+1F37TSu27KE2B37jFKDNa78X8/nBl/AfyvBkWNkZDg9VlVIEwpz8VIFdqTuMe+O6Bb98EhyEq8VKCAFkxBDS4AicqRbyHwUN5uNbfa5tKzIh9NqCOPN/GMl2HbCcoGOkGzhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8gOoSk4pmidzM33muRz+zPl4fzgR9Ae0Aq9cbuse00=;
 b=c/QDsL5L+kturXTQLpkpKYG88CP5cF90EzD7bMeVW0ybTjDHKGm7I5ZSaQPoQJqZCrDf8o732f25Wo4uurH54tNuAddBIac4tbGeyGQWwX1Vr97YSuRghH4ITz30tDMRCPF8SQbgOmjSeR64VNK5ExOh60V8rALyIHbPp7ol0qqjFlfe+f0uo8sPGDRZH5xN36gDnkyaosB5/RvJ0N4OjyGz8UTl2coCuE3DXXzIBEDQ/rivIwzzMwVZ4MJCzhHoLALb7H5ssjCM6UF5JP9V5VoQi9Psw1HkJRpieVbu2VRgF/kx+w/TbphkO3UtHf+e4tJ3KNrDov5YluIkTdyP6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8gOoSk4pmidzM33muRz+zPl4fzgR9Ae0Aq9cbuse00=;
 b=ou7yn4lkcR+znfcA1fbpn8dFxxfyCAb9RptTDeYE+d4B9ZmbaPYjypOUteBY1YUuR9h8Ixi2zYdE9Hh+gMbEwYUqqRaVWw99ZBG3eGY+JXMWbrzggdRNUEiO+HdpRp5NK3iDrGnLKU/Rwc9ZkLVfErc9OYDQ6UGhNNCvFNs7wTk=
Received: from DS7PR03CA0055.namprd03.prod.outlook.com (2603:10b6:5:3b5::30)
 by SJ0PR12MB6943.namprd12.prod.outlook.com (2603:10b6:a03:44b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Sat, 7 Jan
 2023 15:15:54 +0000
Received: from CY4PEPF0000B8E9.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::c3) by DS7PR03CA0055.outlook.office365.com
 (2603:10b6:5:3b5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Sat, 7 Jan 2023 15:15:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8E9.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.6 via Frontend Transport; Sat, 7 Jan 2023 15:15:53 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sat, 7 Jan 2023 09:15:51 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>
Subject: [PATCH] drm: Alloc high address for drm buddy topdown flag
Date: Sat, 7 Jan 2023 07:15:23 -0800
Message-ID: <20230107151523.29864-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8E9:EE_|SJ0PR12MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd9eace-0b6d-4613-d4ff-08daf0c211d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d/w6rlaJhWyvbicR+FvUSr4QLPpTu6/9dId9MKMO3SoozTaIh3xpgXaMO+MW5iQ7trDT0qmtAViVtpEJFDV2BZXEizl6UvMbElf6w9Pm4XvRMTy81g8eJSOcGT/V60/29uaLoqhfEvYdu+kFOL64G7cUx292bOv0uBHrj8yomoNAFwy4uZyToIn7wZIiCKdZntEa7/L1/fy2uoRG72CUCjjqKj6FcLSkxFKaGAYE2lrG7qv0qnhgOoiIXUK5hMwLc3bBuNGUQEKnOGgO5TWsKT+B+oahGu+wz7iz5JxKwlgC1ci9dVL68kBdu0xFBLInqyYhH2h1ymdy/yGYnr03F7FfzE+Y/faVMylRv8W2Kq/G8xqdtVbSFp5AvGUKczMUA4zedIli2u3Hq7qlEaCloeGYa2Cyjo/B8QqHz0LqQmamcW8A1SvSUVE5KOc8NbTIW+OetZDf1zRE3u66qLFXHRt+P0BrDx+TE2j3CJ4KQ7FlJ8i4Dlcm5CPKtNvTCQHXuaxANbSPn+2KoNEKvgbvYUy4BtivpCPIHFHu84SwSpPJICshY25ESpuMGoUIp2We2kjT4nDk2H/n7aApXmfq5Isj/LqtnNdxMpLxmf0kY0rPcDsj6yiYiEpdQQKIqQahIijinj/4TciE0DCBn07HfWSIezsgrFj9UNV4+iGBhP/kVm6dstohhGTjj1/gy7FeWJEbZcoln6u6BK9v7ZIb4xMlnPjVGnRhJtfFfsur4Uc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(41300700001)(8936002)(316002)(8676002)(70586007)(110136005)(2906002)(6636002)(4326008)(5660300002)(7696005)(6666004)(478600001)(70206006)(47076005)(336012)(426003)(86362001)(26005)(186003)(83380400001)(16526019)(2616005)(82740400003)(356005)(36756003)(81166007)(40480700001)(1076003)(40460700003)(36860700001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2023 15:15:53.8801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd9eace-0b6d-4613-d4ff-08daf0c211d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6943
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

As we are observing low numbers in viewperf graphics benchmark, we
are strictly not allowing the top down flag enabled allocations
to steal the memory space from cpu visible region.

The approach is, we are sorting each order list entries in
ascending order and compare the last entry of each order
list in the freelist and return the max block.

This patch improves the viewperf 3D benchmark scores.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 81 ++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 11bb59399471..50916b2f2fc5 100644
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
+				drm_buddy_block_offset(max_block)) {
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

