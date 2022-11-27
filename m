Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1C63996B
	for <lists+dri-devel@lfdr.de>; Sun, 27 Nov 2022 06:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F6310E032;
	Sun, 27 Nov 2022 05:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4789310E032;
 Sun, 27 Nov 2022 05:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lq8JJCsA05dqxgFYiuOHlBCvw3n3aZrRr5Ovhvuy/10Ns3Uj+pvr32kkNVes4t8amHc6wyeeICWOjnm3YNZL180HW4vDDT0skxck/qgOkfORxa1Wlr031aZWdUCEul7V+SKgodU1Yt2CX0l7gTT23GxQCpm6Oup7jkeH2wJVLtkF0KIfKaQEEzQZSW84h8a4GohFW6MevM6S1I2hiy1BMqUJCqBaoC9ePj0D4FIPPq2lpR7YN4GcCy80seRXC0RhrKP1WDlVWIvEjIUUJm8Azg7TO62FPakGeqVTOJGW1GzSj106F73XamMHv76ajzMRTEoNkPWm+3VKDvBhSk7/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GSeSTiGQLs/Y0wPZt+1ELfr/RSZdRhpAlcrV3Ebu84=;
 b=Qjx9oRhX4odGpl1wLF46KQki90vde3KBhKOWgV6BkM558BSXqPJwu+01rtLYWIp12cbrnp2ai91Y7hThEA6SKYDDzN0JPGg5t2VzfLdR+bwHPUPjZPr6uaTinvSy42W0aZzIXugqeEP1cLFbqUovmUXEMYCymI2S547kdN6TWfj1Hoof8IjGNFhPXWyfDr3g5XewbrntWrSOOYtuZ9RR1NIyvAWY23J+nEbodxo4cwuxQGQc4BpjM7N5WmKwvaLPZ0fuPdpQR0P7uLHedTTlyo55yX300ij6erTZK4+NwUzFIZ508wesxrD+TlA5QsJ6idkMeXIamuSG0BGxqWFIcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GSeSTiGQLs/Y0wPZt+1ELfr/RSZdRhpAlcrV3Ebu84=;
 b=jqs0N8FdIivRj98As6v/IxnoIav9Cn5Th0kHOAvKFSIKaBN5Bbsx1H/2X1sb68fTafsfwi7BcF9teQbutyTny6L0jTDpatzm9NJAcc/ZjmvLlkWOvjYRjuYiVsvYal93DmXLzzBawZPOPyVBgn2OAjofcY/RDtG+bbt9aSKuwdQ=
Received: from DS7PR03CA0029.namprd03.prod.outlook.com (2603:10b6:5:3b8::34)
 by CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Sun, 27 Nov
 2022 05:38:19 +0000
Received: from CY4PEPF0000B8EC.namprd05.prod.outlook.com
 (2603:10b6:5:3b8:cafe::d1) by DS7PR03CA0029.outlook.office365.com
 (2603:10b6:5:3b8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22 via Frontend
 Transport; Sun, 27 Nov 2022 05:38:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EC.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Sun, 27 Nov 2022 05:38:18 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 26 Nov
 2022 23:38:16 -0600
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm: Optimise for continuous memory allocation
Date: Sun, 27 Nov 2022 13:37:46 +0800
Message-ID: <20221127053746.102392-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EC:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: 5371c724-b883-4751-c2ea-08dad03996c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0RuAq4tEWIXMtdPHKr+CLFHmPcrUkoYWgnOod0eN12QqwmGraTFiSHjMO1al3psLfKM0YdE0qmR7lMn07bZVQjlzqcmUw9+6HtVMUJvFz1IEqzMqN6+yOFyoAKeWzqDpWYTTOiBRUD/V6QmvG/t1yus3doG5L5NSgCSiGjZAoAaFwP8mWFbmM/5iI/3GCF8SgPqq7QrrRsm6mDZTfUeTivrl87L//cP5N4dzEPZ/d/+wkjevqDKAULYd0ixPtKDzC5CCYLcAgTEhjY8wnC9YJGL1lhADK6o4jX4mmcSbNKREtRzlkbwoIkcb16gDk02lulShrKRhueh5rwE9wWwNT5geV7zOrh7WVcALDFMTffyBH5rpw2RnPCnVcCjSyEgArPUzLlZhkXMuGiNPkqEaMTcapsJTp/uWm3Ud+P1eq03XXMJBoPAnUHpUJBefFw/V+KyU6D3nMwOoTWxjI/xREeW1SXbopG+YO+zPB6oiI8CAiytjJauWtK9rtMYklwE76QS2C1giIWASkqbvThxBsP69NHIf5Pb0eNAYoZRA+fn5eoBsFN7IZj1lqAVf/WcQZqZRdlkDxlPBhnZX5fXXi102a3u0qx1vgF2lNiGevJ5x4X6E2OfKXX6ahIp9BC3JIvKQbtgTAJeLJxOrQ8kVzUtCtqKwrCQd8NHMcBfQQu/QDqmZZLY/HYfN1/PUQt/gHEttLEM67uikW3GfAiIMByPLa22OHMxEAJmYkKBiw6k=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(82740400003)(81166007)(356005)(83380400001)(6666004)(40480700001)(2906002)(316002)(26005)(8676002)(4326008)(86362001)(70206006)(70586007)(41300700001)(5660300002)(7696005)(8936002)(47076005)(426003)(54906003)(6916009)(2616005)(336012)(82310400005)(1076003)(40460700003)(186003)(16526019)(66899015)(36860700001)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2022 05:38:18.6705 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5371c724-b883-4751-c2ea-08dad03996c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150
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
Cc: aniel@ffwll.ch, xinhui pan <xinhui.pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently drm-buddy does not have full knowledge of continuous memory.

Lets consider scenario below.
order 1:    L		    R
order 0: LL	LR	RL	RR
for order 1 allocation, it can offer L or R or LR+RL.

For now, we only implement L or R case for continuous memory allocation.
So this patch aims to implement the LR+RL case.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
change from v1:
implement top-down continuous allocation
---
 drivers/gpu/drm/drm_buddy.c | 66 +++++++++++++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 11bb59399471..eea14505070e 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -386,6 +386,46 @@ alloc_range_bias(struct drm_buddy *mm,
 	return ERR_PTR(err);
 }
 
+static struct drm_buddy_block *
+find_continuous_blocks(struct drm_buddy *mm,
+		       int order,
+		       unsigned long flags,
+		       struct drm_buddy_block **rn)
+{
+	struct list_head *head = &mm->free_list[order];
+	struct drm_buddy_block *node, *parent, *free_node, *max_node = NULL;
+
+	list_for_each_entry(free_node, head, link) {
+		if (max_node) {
+			if (!(flags & DRM_BUDDY_TOPDOWN_ALLOCATION))
+				break;
+
+			if (drm_buddy_block_offset(free_node) <
+			    drm_buddy_block_offset(max_node))
+				continue;
+		}
+
+		parent = free_node;
+		do {
+			node = parent;
+			parent = parent->parent;
+		} while (parent && parent->right == node);
+		if (!parent)
+			continue;
+
+		node = parent->right;
+		while (drm_buddy_block_is_split(node))
+			node = node->left;
+
+		if (drm_buddy_block_is_free(node) &&
+		    drm_buddy_block_order(node) == order) {
+			*rn = node;
+			max_node = free_node;
+		}
+	}
+	return max_node;
+}
+
 static struct drm_buddy_block *
 get_maxblock(struct list_head *head)
 {
@@ -637,7 +677,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   struct list_head *blocks,
 			   unsigned long flags)
 {
-	struct drm_buddy_block *block = NULL;
+	struct drm_buddy_block *block = NULL, *rblock = NULL;
 	unsigned int min_order, order;
 	unsigned long pages;
 	LIST_HEAD(allocated);
@@ -689,17 +729,29 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 				break;
 
 			if (order-- == min_order) {
+				if (!(flags & DRM_BUDDY_RANGE_ALLOCATION) &&
+				    min_order != 0 && pages == BIT(order + 1)) {
+					block = find_continuous_blocks(mm,
+								       order,
+								       flags,
+								       &rblock);
+					if (block)
+						break;
+				}
 				err = -ENOSPC;
 				goto err_free;
 			}
 		} while (1);
 
-		mark_allocated(block);
-		mm->avail -= drm_buddy_block_size(mm, block);
-		kmemleak_update_trace(block);
-		list_add_tail(&block->link, &allocated);
-
-		pages -= BIT(order);
+		do {
+			mark_allocated(block);
+			mm->avail -= drm_buddy_block_size(mm, block);
+			kmemleak_update_trace(block);
+			list_add_tail(&block->link, &allocated);
+			pages -= BIT(order);
+			block = rblock;
+			rblock = NULL;
+		} while (block);
 
 		if (!pages)
 			break;
-- 
2.34.1

