Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733CA63BE53
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 11:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0AD10E262;
	Tue, 29 Nov 2022 10:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2056.outbound.protection.outlook.com [40.107.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B5410E082;
 Tue, 29 Nov 2022 10:57:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKOaZOUJDnXeFE2DRXeSyeIgVhFGC6PpSQ0z1giLLtSlJC/NaVS4dMx/uZqrh//SwCxvj1Ulm+9/b3Gg4eA3E/V4QJWO5It/udB93kBL8nsaQg/+cPFsjIz9U4NXezyqQG74GwbPOTLDu6O7Gg/wKstvEEocDZd+64jDltV3WVcaZ4x2khXLheVAaurHIPU4ovG6cwsw0uX+T4jmhkndXepSgpqoSvXkpqPga+QM8CfB0krwhoynsT+J7M5zB5sG+TRuGAIM3DLMDvBAqtplcWVmwpd+u5ANCS5HoE25QLZ/H5T8AymFVptkyYY+pPK4uyKCX+ZL6NVaKAR2AQYz4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XtRd8JrTsbaoCmuxFe3286dfOo1NMfjWxA+WMCp0s0=;
 b=lDqlku5XlAlU8nD7LZ9MuHX1YYNIfZ6L6AS8OK7CBx0mWiGVSAdQ1c6cjJ8ZvjUlPA/bp68qKsh7PKCpIIQ4vpvICxTM1Jt7btEffYmLgdinkS55Reckc2t/wkt5uUrWAhV0VMiouFTyKwyqxgJe+5S5nId91GTKv9zFsByReciRnsGKQTbQJGNqxgKHAWXz2wWQFNtnuwKsM3L5G4mJY9uVQul9Met2slLzPG/mmM9cgeEfbmBnDqdByghc8tj8BotNj3mOmUMP7YaQ1tp5rEie5i1iwQBHPFG17YMw3OqzUtSf582UBUV+TnnHKc6MyyobkDpLNGDBu7ARJhjMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XtRd8JrTsbaoCmuxFe3286dfOo1NMfjWxA+WMCp0s0=;
 b=mpiT5VrswrfY8dV8mn57g2VUtBXWFg5Vy+rweM84VuMM7jhSArcxhHhZfsNYNYFs4nSKZD6GCjXKW1FwgbHLs/2MTYPRVuxeUj3dzv0HldeUSuuwWCP+sulWSs2a+kVL0AqCw7BdONhDYegdN4bh5l54r6dlKde5hdABYKn7L90=
Received: from BL1PR13CA0356.namprd13.prod.outlook.com (2603:10b6:208:2c6::31)
 by IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Tue, 29 Nov
 2022 10:57:13 +0000
Received: from BL02EPF0000EE3F.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::10) by BL1PR13CA0356.outlook.office365.com
 (2603:10b6:208:2c6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Tue, 29 Nov 2022 10:57:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3F.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Tue, 29 Nov 2022 10:57:13 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 29 Nov
 2022 04:57:10 -0600
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4] drm: Optimise for continuous memory allocation
Date: Tue, 29 Nov 2022 18:56:55 +0800
Message-ID: <20221129105655.125571-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3F:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 219552b0-a752-491b-6ce5-08dad1f878c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zM0XEtkIjUk2Ja42WyfvxeUuTHSutCiwKWGcOuIPFqLGFB9ApOm1Vli8HaCHJSvJyI99oomYzKzJUiZl6yO+aB280iCpyGaKh5v5sYsf/A/vbQ1YxBZn+2HNYFN8WN6j4j8hOVEPflw+IOMKjo21e2iv/nDVr4jPZyFjhgZGYvQeB4va9Jz08Kl891uPyL8QU7WuPO64TvvgRW8/4+n89m9GHD6kVekOUlmMS6y2Ol8ew8j5igOD0i22hCVpjmfW7hNEHvOZDvCDhe/XPL6L0IWzlis9KSL2ukQp/ftyRIgVmGgdscqzC5/nHID22Jsfpjj+kJP51WSK7WLnpWolnx2rJP0ghtHyfER/miMZFXTNPBlwEJ9Ub5PF5Y0caKsmUsZfvlxHjDNcLQXirpKaxeo1EXtl6EI5wlCYcY+CBOdzJLMfRhYXWEfrVzo/v0sWVGNrqYIQEntmj1nB/i6Q2++4xv/JnMr1cj8Vgh0+1JlP+UrRlwHyvsegqgXZYAke+LHLBR4NNaVIS+YFXn5btSOOFKLRypenK4iof9+tjCrLQE0QdKCVcFTrYeFpJezffZ/eVWaZ8G5t+V13wlzpFSdvxr9tzQOA9jRMX6D+pu8uf+10vpPf93glfaN3xtAGs4nG6R1sc0czdlGn3EZsDQD2pOYMB97DI80KzfhZBLvxgku4SG9R2oip1EtHoTyhm5ff5fDXq5hZxAT1ZaIytsIwHMDeok5u5saFICSH8J8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(66899015)(36756003)(82310400005)(40480700001)(36860700001)(6666004)(7696005)(16526019)(426003)(47076005)(26005)(1076003)(2616005)(83380400001)(41300700001)(86362001)(8936002)(2906002)(5660300002)(356005)(81166007)(336012)(54906003)(316002)(6916009)(186003)(478600001)(70586007)(70206006)(40460700003)(82740400003)(8676002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 10:57:13.3848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 219552b0-a752-491b-6ce5-08dad1f878c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329
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
Cc: arunpravin.paneerselvam@amd.com, intel-gfx@lists.freedesktop.org, xinhui
 pan <xinhui.pan@amd.com>, linux-kernel@vger.kernel.org,
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
So this patch aims to implement the rest cases.

Adding a new member leaf_link which links all leaf blocks in asceding
order. Now we can find more than 2 sub-order blocks easier.
Say, order 4 can be combined with corresponding order 4, 2+2, 1+2+1,
0+1+2+0, 0+2+1+0.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
change from v3:
reworked totally. adding leaf_link.

change from v2:
search continuous block in nearby root if needed

change from v1:
implement top-down continuous allocation
---
 drivers/gpu/drm/drm_buddy.c | 108 +++++++++++++++++++++++++++++++++---
 include/drm/drm_buddy.h     |   1 +
 2 files changed, 102 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 11bb59399471..8edafb99b02c 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -80,6 +80,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 {
 	unsigned int i;
 	u64 offset;
+	LIST_HEAD(leaf);
 
 	if (size < chunk_size)
 		return -EINVAL;
@@ -136,6 +137,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 			goto out_free_roots;
 
 		mark_free(mm, root);
+		list_add_tail(&root->leaf_link, &leaf);
 
 		BUG_ON(i > mm->max_order);
 		BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
@@ -147,6 +149,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 		i++;
 	} while (size);
 
+	list_del(&leaf);
 	return 0;
 
 out_free_roots:
@@ -205,6 +208,9 @@ static int split_block(struct drm_buddy *mm,
 	mark_free(mm, block->left);
 	mark_free(mm, block->right);
 
+	list_add(&block->right->leaf_link, &block->leaf_link);
+	list_add(&block->left->leaf_link, &block->leaf_link);
+	list_del(&block->leaf_link);
 	mark_split(block);
 
 	return 0;
@@ -256,6 +262,9 @@ static void __drm_buddy_free(struct drm_buddy *mm,
 			break;
 
 		list_del(&buddy->link);
+		list_add(&parent->leaf_link, &block->leaf_link);
+		list_del(&buddy->leaf_link);
+		list_del(&block->leaf_link);
 
 		drm_block_free(mm, block);
 		drm_block_free(mm, buddy);
@@ -386,6 +395,78 @@ alloc_range_bias(struct drm_buddy *mm,
 	return ERR_PTR(err);
 }
 
+static struct drm_buddy_block *
+find_continuous_blocks(struct drm_buddy *mm,
+		       int order,
+		       unsigned long flags,
+		       struct drm_buddy_block **rblock)
+{
+	struct list_head *head = &mm->free_list[order];
+	struct drm_buddy_block *free_block, *max_block = NULL, *end, *begin;
+	u64 pages = BIT(order + 1);
+	u64 cur_pages;
+
+	list_for_each_entry(free_block, head, link) {
+		if (max_block) {
+			if (!(flags & DRM_BUDDY_TOPDOWN_ALLOCATION))
+				break;
+
+			if (drm_buddy_block_offset(free_block) <
+			    drm_buddy_block_offset(max_block))
+				continue;
+		}
+
+		cur_pages = BIT(order);
+		begin = end = free_block;
+		while (true) {
+			struct drm_buddy_block *prev, *next;
+			int prev_order, next_order;
+
+			prev = list_prev_entry(begin, leaf_link);
+			if (!drm_buddy_block_is_free(prev) ||
+			    drm_buddy_block_offset(prev) >
+			    drm_buddy_block_offset(begin)) {
+				prev = NULL;
+			}
+			next = list_next_entry(end, leaf_link);
+			if (!drm_buddy_block_is_free(next) ||
+			    drm_buddy_block_offset(next) <
+			    drm_buddy_block_offset(end)) {
+				next = NULL;
+			}
+			if (!prev && !next)
+				break;
+
+			prev_order = prev ? drm_buddy_block_order(prev) : -1;
+			next_order = next ? drm_buddy_block_order(next) : -1;
+			if (next_order >= prev_order) {
+				BUG_ON(drm_buddy_block_offset(end) +
+				       drm_buddy_block_size(mm, end) !=
+				       drm_buddy_block_offset(next));
+				end = next;
+				cur_pages += BIT(drm_buddy_block_order(next));
+			}
+			if (prev_order >= next_order) {
+				BUG_ON(drm_buddy_block_offset(prev) +
+				       drm_buddy_block_size(mm, prev) !=
+				       drm_buddy_block_offset(begin));
+				begin = prev;
+				cur_pages += BIT(drm_buddy_block_order(prev));
+			}
+			if (pages == cur_pages)
+				break;
+			BUG_ON(pages < cur_pages);
+		}
+
+		if (pages > cur_pages)
+			continue;
+
+		*rblock = end;
+		max_block = begin;
+	}
+	return max_block;
+}
+
 static struct drm_buddy_block *
 get_maxblock(struct list_head *head)
 {
@@ -637,7 +718,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   struct list_head *blocks,
 			   unsigned long flags)
 {
-	struct drm_buddy_block *block = NULL;
+	struct drm_buddy_block *block = NULL, *rblock = NULL;
 	unsigned int min_order, order;
 	unsigned long pages;
 	LIST_HEAD(allocated);
@@ -689,17 +770,30 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
+			pages -= BIT(drm_buddy_block_order(block));
+			if (block == rblock || !rblock)
+				break;
+			block = list_next_entry(block, leaf_link);
+		} while (true);
 
 		if (!pages)
 			break;
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 572077ff8ae7..c5437bd4f4f3 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -50,6 +50,7 @@ struct drm_buddy_block {
 	 */
 	struct list_head link;
 	struct list_head tmp_link;
+	struct list_head leaf_link;
 };
 
 /* Order-zero must be at least PAGE_SIZE */
-- 
2.34.1

