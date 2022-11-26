Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B33FD6394AE
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 09:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C8010E012;
	Sat, 26 Nov 2022 08:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D423710E012;
 Sat, 26 Nov 2022 08:40:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAO+6Syo26N8/07/MGEjBGWeiGW6zwp2R6LDInaQqZoE9b+RqvMKk4mN3VFPoUZPuxDB+VaRXdufLrdoIOmnn1h1t/Xiq9MzfU7onX786hWFpog3vQ3ho1LrQGzlen5HjgLAhtO+ebey7k/zNDAeGJiLt+tgF1/4rwDYPPjINmpINof80IginVGIHiF+dIPbYZcDY5yQQRT4xMoKXrFf48PvxBCui4BvIiGDke/G8ICX/by5ksdM7O8LbL8vVqwEB1jeNemzd9zkqVD8cCfAddnjAlns0zDk06Z70oPIYAa487bW7kqeQR3x3liFY09QNDfz38lD1JX11wfDAEirtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BNm7p4c1V7oH2YmNCWcgCtqaLXGmbOhnFyLarXxtLE=;
 b=T1nBc282FiKRTUZQzuENHF60tJ8czVv/JLPOEmUlScUR2vXczpVzwpoKcUnzWoH4oJNOz8WeqIQeScPP7DWzrjZ9ncRDgIPeAOBbPwH507WgVdWYGsRJEC9w+w/35F4rjezO4Oc5anrsHYXAYdmBq59ufKcY6+lOigr/s2lt+s8lTzcv73TTEvta2mPEW8v9IWiuGCMR2StXTx/hDh31oPxqvber4en1Rk5fVB3zItWtX03fwbBkK1f1MxmN8cJPQMx1r/CtfioWFyLJX9z9w8RZZlDvA18NS46+qivRp5XNDC6+NwrzYpsLXhEdxflJXZ5Jp0dTCY6AQzMMsoaGMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BNm7p4c1V7oH2YmNCWcgCtqaLXGmbOhnFyLarXxtLE=;
 b=x+qYmkJS6qs3iHNqBE4rBduVSfrbpJuc9uzvM0mxHpZlMJXXWFmJFoUhlNRhkUUAXki6l0+DTWwQLZSa9FeYVF8UBspvDhAEK/WSXH2WdQQPjawz7gWGREnkr9fC7wZdVeYixnGcanbVxL8t/H2Oz1qY9jR4dPwDlmEYEkr2vl0=
Received: from MW4PR03CA0029.namprd03.prod.outlook.com (2603:10b6:303:8f::34)
 by BN9PR12MB5082.namprd12.prod.outlook.com (2603:10b6:408:133::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Sat, 26 Nov
 2022 08:40:12 +0000
Received: from CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::52) by MW4PR03CA0029.outlook.office365.com
 (2603:10b6:303:8f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21 via Frontend
 Transport; Sat, 26 Nov 2022 08:40:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT107.mail.protection.outlook.com (10.13.175.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.20 via Frontend Transport; Sat, 26 Nov 2022 08:40:11 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 26 Nov
 2022 02:40:06 -0600
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm: Optimise for continuous memory allocation
Date: Sat, 26 Nov 2022 16:39:54 +0800
Message-ID: <20221126083954.112164-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT107:EE_|BN9PR12MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e26c741-159a-4c21-c4ae-08dacf89d4d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LRA44zu1aXw13sr+IcItp1RVmLwaT5AbtnuDgeQAh+SmNydX4diow9rmwWamhp8kgyJQKET3Fwlj/IdVn8Lc/fmswZyxQj1nm2gyS1HplOYATl1lK82sglYqLYzK0qxefUldTS8p5AqnxflzElgvLbBUcGDfGFe/wywwJGGeoo9Em9t0/uplzB5CRiFWQsYYuCx+m8HyUznMqdURhTF4NHFhg+hIiQ/nK0zpB2X7/Od3XJSrzYYLEwICKZdkoV/KG9Dg5CDPZYMIvHUzyPnL46Ijx9D29Ln7qjYWc/SWrt6oiCN9FWLTm3RWlhcwHrp6Aa8+6Fz1c8xV5fypMVkBLitz/t7cAtv995QqVXK5aoasAUmsUhE+m108JfC4DZw1mmlRrgmfQx5JT38rjdzW/b3NB6MGRZLvnjhtFRPgWUITN2HChFDOoGxwNJEOBAx475A9zt6KdJksT/ISZ37QRmT8SMWoilR/PtKVXvjqz4DklK0tNV4tpBnruYEfZUNS3dl31kCfB42TM2gz+gwxO31Q36+WteioBsRPiU1JPZsO18E3u8atDgfeZIWuAi6Q1z+SxNBsr0/oSzfDmC/j4f/OLR16FJQ/rElh+adUukuE2jBMPCuAxLL2TIcvFNpXZxa5BAzuwg0BqNH2v/wzUAHVJt6Ku2tBK7Xu4Md5x3tRXMS38pLMfKkFIbIi/TJlfE9ErD9qtyNb8yFXUA1OziSjEmNrtOqegxydXc+ihvI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(47076005)(426003)(83380400001)(336012)(66899015)(54906003)(6666004)(7696005)(40460700003)(36756003)(81166007)(356005)(86362001)(40480700001)(82310400005)(82740400003)(36860700001)(2616005)(16526019)(186003)(1076003)(5660300002)(26005)(478600001)(6916009)(8936002)(8676002)(2906002)(70586007)(70206006)(4326008)(41300700001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2022 08:40:11.3072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e26c741-159a-4c21-c4ae-08dacf89d4d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5082
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
 drivers/gpu/drm/drm_buddy.c | 56 ++++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 11bb59399471..550af558342e 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -386,6 +386,37 @@ alloc_range_bias(struct drm_buddy *mm,
 	return ERR_PTR(err);
 }
 
+static struct drm_buddy_block *
+find_continuous_blocks(struct drm_buddy *mm,
+		       int order,
+		       struct drm_buddy_block **rn)
+{
+	struct list_head *head = &mm->free_list[order];
+	struct drm_buddy_block *node, *parent, *free_node;
+
+	list_for_each_entry(free_node, head, link) {
+		node = free_node;
+		parent = node->parent;
+		while (parent && parent->right == node) {
+			node = parent;
+			parent = node->parent;
+		}
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
+			return free_node;
+		}
+	}
+	return NULL;
+}
+
 static struct drm_buddy_block *
 get_maxblock(struct list_head *head)
 {
@@ -637,7 +668,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   struct list_head *blocks,
 			   unsigned long flags)
 {
-	struct drm_buddy_block *block = NULL;
+	struct drm_buddy_block *block = NULL, *rblock = NULL;
 	unsigned int min_order, order;
 	unsigned long pages;
 	LIST_HEAD(allocated);
@@ -689,17 +720,28 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 				break;
 
 			if (order-- == min_order) {
+				if (!(flags & DRM_BUDDY_RANGE_ALLOCATION) &&
+				    min_order != 0 && pages == BIT(order + 1)) {
+					block = find_continuous_blocks(mm,
+								       order,
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

