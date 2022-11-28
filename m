Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7B63A14D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 07:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3A110E1C1;
	Mon, 28 Nov 2022 06:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584A410E1C0;
 Mon, 28 Nov 2022 06:35:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/vN2Vu0v0Jq2tjz6X4Ayy5hBuKi/y03OsScVDOTaZplaHx36OyDQbuZFp6dupTbvqjCsOgt521HT4ougSc+5MmkIarlS1VTdFDvURmpOkeYerNZ/iXR8Sdne5QoWUDsCYOesIpDhNCj6oUKvWRlIkGTan+B+EC4Pmb0QqdmlrRcNCvV1Aeu+XjNgmdS30X1HF3mmEr4tbzXdZlnqrywyYSkc6NP2W11AheZfrYaj/2UZjSaKa6nmjbDtwfFbnHGRSVLD5AYaN/EvA275Ml8qembDEZn1TFirUVSbWBkTVEmz0zXKE1qgTBYYtbp2F9dsIqSlMIn0lBifeL0Cs5TQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6htDTJmXmTbnY89v63BveXxpg/Nm1TkQy44Rt9VrpU=;
 b=l2+3Q5YAkTdUCBRDTQCvyr1A1iOtmYbIthNhdP9ghCbgHJ9+1s4ar0rIuWi0A2lcST5BO8zCbEB2cG/8h6UK0RP6GP/lzQGZUYSj82rLm3hyKbYIQ4X2QiJPXh3epuDqMMjbXoBN7NDo0mL4FFSx+cKPExqc3zTOE5giEr5IsZnf3MXDdHaIzPxEdQYXNnPCW3eCUf17EtJRKv93VnnLjO1ELzrPs39MU7YVJkNHL8P8lEqe80ZONsejW+mKoaZ/Z92z0FcCkUCZys64/9RCH8XFZXdNxss546egfFIIPSl0LxdCXFiwMLO7iJO94fFMIAMtmmjtzEOyJrXu7fdeIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6htDTJmXmTbnY89v63BveXxpg/Nm1TkQy44Rt9VrpU=;
 b=2ctYVMVv7TpyyoAGj0iUL+b9TQizjP2BNNI7oP0NWMD5CEd/cr/uTqYw/Z4IqgR5Y3kksTl3SdzQQZBRfNvo/qZNPBcoFHMcsEpiNmnz54phcStRMK3TtROwyAcaHcWqJCbpv5eZNIXxWTgj/laMywHRnVqp+cA/Ld7Nn7UZoYI=
Received: from DS7PR03CA0086.namprd03.prod.outlook.com (2603:10b6:5:3bb::31)
 by CY5PR12MB6599.namprd12.prod.outlook.com (2603:10b6:930:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Mon, 28 Nov
 2022 06:35:29 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::85) by DS7PR03CA0086.outlook.office365.com
 (2603:10b6:5:3bb::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22 via Frontend
 Transport; Mon, 28 Nov 2022 06:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Mon, 28 Nov 2022 06:35:29 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 00:34:58 -0600
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3] drm: Optimise for continuous memory allocation
Date: Mon, 28 Nov 2022 14:34:19 +0800
Message-ID: <20221128063419.101586-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|CY5PR12MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: b0abce57-5989-49a9-a663-08dad10abdd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zxH457R4zfOi4MSxPizbjomTVC+r/BafxkIDSPQ4A1tYORVnJ64Cei43Rdc+199bp3FnLNdc4+mgDp1mWrMPxkwZt3erd8Z39q/hvMVBUacdYZw1e5rOGXsK9fWdFtkFDjxJZs+yQZ4mn3XDShfwGs4aACGtRgceUTgTPv4oa8gFzWj2juU3bGugH1B7WABAJCviEVQ9AVIFnUeoGT/ipVSx4PTWU7XgQzFu1jYNisuAzgGWtNpgzQAzIBuDhNDMxBwnof0mf5VYCIrq4t6pO1tlZv1BvkWQvGseZXE9Gkdk8t4gJ3GK8CLj+1/gClHIGRSgyhkAzXAayrHwB83+b2FBmhvWbUOFzv1zFkdTjZCSY2MSuJ6oondfZCgcqFRf7TLGkQbf+iJh9ukw0a5JQlX6zIFIxhV/5Gu6UcKh2e/wXh+c109JlIJsK5cU3LOu9NrLp552h5woatiyrwsYwFstV8oj2VLfOTqfyLnPf8qubLmAaTfd9KYC+Mj1lF7W9UVsSAh0Z2pbUiO8LUORwqDmOKpi/miZf5dGk2AUYgkhx9RnCpSmI36Y+UKHRgZoLQ0G87QOk5qR/nTZNYPIuiIpbCi0XpSsjGEHPszbEO27sUkDoSV9XVEy450H58LCszRkT8RdqGjfpKd+dUSgRehFoGH09dWW0mXfWfMZidbiekglcLswOgy7kKZt8E8qLj624Q+kpp1U8oY/zBGtIPOGah4c5bFxisjDFE+QNio=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(6916009)(316002)(54906003)(70206006)(70586007)(4326008)(41300700001)(8676002)(82310400005)(86362001)(83380400001)(26005)(47076005)(426003)(7696005)(1076003)(16526019)(2616005)(336012)(186003)(6666004)(36860700001)(478600001)(36756003)(40460700003)(66899015)(81166007)(5660300002)(2906002)(356005)(40480700001)(8936002)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 06:35:29.0626 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0abce57-5989-49a9-a663-08dad10abdd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6599
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
Cc: xinhui pan <xinhui.pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matthew.auld@intel.com,
 christian.koenig@amd.com
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
change from v2:
search continuous block in nearby root if needed

change from v1:
implement top-down continuous allocation
---
 drivers/gpu/drm/drm_buddy.c | 78 +++++++++++++++++++++++++++++++++----
 1 file changed, 71 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 11bb59399471..ff58eb3136d2 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -386,6 +386,58 @@ alloc_range_bias(struct drm_buddy *mm,
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
+	int i;
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
+
+		if (!parent) {
+			for (i = 0; i < mm->n_roots - 1; i++)
+				if (mm->roots[i] == node)
+					break;
+			if (i == mm->n_roots - 1)
+				continue;
+			node = mm->roots[i + 1];
+		} else {
+			node = parent->right;
+		}
+
+		while (drm_buddy_block_is_split(node))
+			node = node->left;
+
+		if (drm_buddy_block_is_free(node) &&
+		    drm_buddy_block_order(node) == order) {
+			*rn = node;
+			max_node = free_node;
+			BUG_ON(drm_buddy_block_offset(node) !=
+				drm_buddy_block_offset(max_node) +
+				drm_buddy_block_size(mm, max_node));
+		}
+	}
+	return max_node;
+}
+
 static struct drm_buddy_block *
 get_maxblock(struct list_head *head)
 {
@@ -637,7 +689,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   struct list_head *blocks,
 			   unsigned long flags)
 {
-	struct drm_buddy_block *block = NULL;
+	struct drm_buddy_block *block = NULL, *rblock = NULL;
 	unsigned int min_order, order;
 	unsigned long pages;
 	LIST_HEAD(allocated);
@@ -689,17 +741,29 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
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

