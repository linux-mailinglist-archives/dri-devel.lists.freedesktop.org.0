Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F003264FDF7
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 07:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52E010E16A;
	Sun, 18 Dec 2022 06:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7680810E16A;
 Sun, 18 Dec 2022 06:57:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8R3pyh61703lU5NROfcxG33NBEW3TIxYiocJNOOdi+DWBVSSSH+hn82iG125dttG16rMuWEfPjsf6vTpXs8qJgfu3WpKfb/DJtB5j7jemo+NOkGLnCTJO3AzhNOfNgOKe3cd6gvMgLiHwGsIQtWD+j2xHnZXarp77yyzLZ/sZcSj7hQ0p27UES6Q1MirSQeTh/Pmn6otI1sbAZYeSl7uichNLeLu3pdGgKfXQXRHxU9/MuUlM1zqC2V1G2T0WfpZTM1UjzqpuzShX5u7NGcEC8qA+QGIkVbLx3CRKWdWt7+jN9nENUDYU5hOspVwR9nMYoQYBrqAxiHrZSF98+5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1F97svJn5QstKb6b4YUQYjqNSdCYS/XSCzT7/mpSBlU=;
 b=ChwvdSwtqjR/UUCUPYV+Ova5icpTLZ+YysaOHSdCL+rW7pg9N0z6ka8NvDCL26Ci9MsoK5XhiNQ+XBLosWhp5G0ForJU5QNNV7oipocO7VjRkqLEm0q4agXTr4qHQYvJ+Shp3EyV3g+fu+qbwjdCH+hzEunfPjjrX11xCGENx037XJ+3VGtEvJMRzg29N/dkE8jhAvGI3vIEXBBsuSJa1bUsHpDM8+/PN4cPStd0icazJosZFnulKAJy26K42MJbSe92OxycTSAUxcibkBSYcxdtp0eWYxERkgS96THNDjSLiYFSJ1M2nfvf94pPnfn4wUqqIIT8Z9UN2IckMDD+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F97svJn5QstKb6b4YUQYjqNSdCYS/XSCzT7/mpSBlU=;
 b=zRfDNsfysLuNL74CoL/IZ7FbwYgqZjTznTMHkQ/IHmtY31yXi6CuCCdqMzCr32mcGitL+vgNVnysMerGgF9cjcSbws/MnDkydqG9WjmTCW/3onCsDbLPONhG2uRqodYkRJxENqu1AMUihgXmhFRwReiCAOoLmEm6jKFrPK5nXeo=
Received: from BN0PR10CA0007.namprd10.prod.outlook.com (2603:10b6:408:143::25)
 by SN7PR12MB8170.namprd12.prod.outlook.com (2603:10b6:806:32c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Sun, 18 Dec
 2022 06:57:32 +0000
Received: from BN8NAM11FT116.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:143:cafe::56) by BN0PR10CA0007.outlook.office365.com
 (2603:10b6:408:143::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.17 via Frontend
 Transport; Sun, 18 Dec 2022 06:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT116.mail.protection.outlook.com (10.13.176.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.16 via Frontend Transport; Sun, 18 Dec 2022 06:57:31 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 18 Dec
 2022 00:57:28 -0600
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6] drm: Optimise for continuous memory allocation
Date: Sun, 18 Dec 2022 14:57:08 +0800
Message-ID: <20221218065708.93332-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT116:EE_|SN7PR12MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: fdbb26fb-0852-4ed5-11d7-08dae0c5227d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bcSupmG/14fHwdYV7g5rV0txZHsZMyafyV7LRfcuqx8aZBcLiucUIzYivCPPB6cb5SMAsvrvx/MgVXs8S0+5zOWWN+UItW5Kck9lAsnvEqQ3TvjVbOI8LoPNK21VUD2X2nu7fBk9FGZlnZUkGVCtETzivT+tcnTEfGCWxseavcSb//sJ2DTJ8Gxj4EAlZWQkHCGVwr1ewAHHoRkU6DkRoSbxe6AaRQTqwyntbKYQLTiHda85My9zYyDoa0wObobCyr4Kb5sgWoJonRnLiPQUVZZh2YZFJU3zNnp/k9byKAZeR+bvgrCasQb+60yeNg7S504fILqi1HdZZbMlEEvsa/QWUz6iOKnhwi2WkUTNqfXBBDXwzhKgO9hWoSO/aemaKX90DBJV0dbpIhf8BqHqZMuMW0CahsFle0tNaxis/3BdkJjBEw0KGymEfRR1I87O2UVQ3lS6IvoqK+GeahZIFixqJ0kMo7buJMQN8cytruMTf6XVB3qw9UN5a/1a/PvAdqnu0fQ64UuDAleGBbLZOoIM4XapkmrbVXpMiSlbwJBKDCLQHLAGkrJy/xG+Om5dW+b3MpGYX9tC6XvGYCSDRzWAzSjf3qWxk2pVd0NsrAEQKIunF4bBshmFelUh7QaymOhVbXDTkc6hH1qgFMaX45WXrqjpZYrz/BfYTez0dEYCdq4pPiC9mOlb7LWcWOLCfWsoj04xQbSEsEbKfJU/d0XZ9W0d73I4OjeICg/q2tE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(7696005)(82740400003)(316002)(478600001)(6916009)(54906003)(1076003)(4326008)(6666004)(8676002)(70206006)(70586007)(26005)(186003)(16526019)(2616005)(426003)(5660300002)(47076005)(8936002)(2906002)(83380400001)(41300700001)(336012)(36860700001)(81166007)(36756003)(356005)(40460700003)(82310400005)(86362001)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2022 06:57:31.7678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbb26fb-0852-4ed5-11d7-08dae0c5227d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT116.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8170
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

Optimise a little when continuous memory request fails.

There are memory holes and continuous memory request usually fails when
order is too big.
Currently buddy only look for exactly order memory for such request.
Now we can try again to look for several smaller continuous memory on
failure.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
change from v5:
reworked
---
 drivers/gpu/drm/drm_buddy.c | 161 ++++++++++++++++++++++++++++++++++--
 1 file changed, 154 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 11bb59399471..6c795e1b3247 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -386,6 +386,140 @@ alloc_range_bias(struct drm_buddy *mm,
 	return ERR_PTR(err);
 }
 
+static void __continuous_block_in_tree(struct drm_buddy_block *top_block,
+				       struct list_head *fbl,
+				       int left,
+				       int min_order)
+{
+	/*
+	 * Look for continuous memory of
+	 * [top_block) when left is true or (top_block] when left is false.
+	 * The list of fbl looks like (top_block1][free_block][...][top_blockX).
+	 * Memory offset is in ascending order.
+	 */
+	while (top_block) {
+		struct drm_buddy_block *block = top_block;
+		int order;
+
+		while (drm_buddy_block_is_split(block))
+			block = left ? block->left : block->right;
+
+		order = drm_buddy_block_order(block);
+		if (order < min_order || !drm_buddy_block_is_free(block))
+			return;
+
+		if (left)
+			list_add_tail(&block->tmp_link, fbl);
+		else
+			list_add(&block->tmp_link, fbl);
+
+		if (order == min_order)
+			return;
+		top_block = __get_buddy(block);
+	}
+}
+
+static bool __free_block_in_order(struct list_head *fbl,
+				  struct drm_buddy_block *cur,
+				  int order,
+				  struct drm_buddy_block **first,
+				  struct drm_buddy_block **last)
+{
+	struct drm_buddy_block *fb = cur, *lb = list_next_entry(cur, tmp_link);
+	u64 pages = BIT(order);
+	u64 cur_pages = 0;
+
+	/*
+	 * Look for continuous memory which satisfy requested order.
+	 * Memory in list fbl are already in below order.
+	 * 1) Memory offset are in ascending order.
+	 * 2) Memory size are in ascending order from left to middle and
+	 * descending order from middle to right.
+	 * So walk through the list of fbl from middle to both sides to
+	 * choose the bigger memory.
+	 * This is because one memory with order X are composed with 2 of order X-1
+	 * or 1 of order X-1 and 2 of order X-2, etc. Looks like below.
+	 *      n
+	 *    {∑(X - y)} + {2 * (X-n-1))}
+	 *      1
+	 * And the last 2 memory of order (X-n-1) are at the two sides of list.
+	 */
+	list_for_each_entry_from_reverse(fb, fbl, tmp_link) {
+		int prev_order = drm_buddy_block_order(fb);
+
+		list_for_each_entry_from(lb, fbl, tmp_link) {
+			int next_order = drm_buddy_block_order(lb);
+
+			if (prev_order <= next_order)
+				cur_pages += BIT(next_order);
+			else
+				break;
+		}
+
+		cur_pages += BIT(prev_order);
+		if (pages == cur_pages) {
+			*first = fb;
+			*last = list_prev_entry(lb, tmp_link);
+			return true;
+		}
+		BUG_ON(pages < cur_pages);
+	}
+
+	*first = *last = NULL;
+	return false;
+}
+
+static struct drm_buddy_block *
+find_continuous_blocks(struct drm_buddy *mm,
+		       int order,
+		       unsigned long flags,
+		       struct drm_buddy_block **lb)
+{
+	struct list_head *head = &mm->free_list[order - 1];
+	struct drm_buddy_block *free_block, *first = NULL, *last = NULL;
+
+	/*
+	 * Look for continuous free memory in buddy and buddy-in-law.
+	 * IOW, the most left blocks at right of free block and the most right
+	 * blocks at left of free block.
+	 */
+
+	list_for_each_entry(free_block, head, link) {
+		struct drm_buddy_block *buddy, *parent, *block;
+		int left, min_order = 0;
+		LIST_HEAD(fbl);
+
+		parent = free_block->parent;
+		if (!parent)
+			continue;
+
+		left = parent->left == free_block;
+		list_add(&free_block->tmp_link, &fbl);
+		buddy = __get_buddy(free_block);
+		__continuous_block_in_tree(buddy, &fbl, left, min_order);
+
+		while (parent && !((parent->left == block) ^ left)) {
+			block = parent;
+			parent = parent->parent;
+		}
+
+		if (!parent)
+			continue;
+
+		buddy = __get_buddy(block);
+		__continuous_block_in_tree(buddy, &fbl, !left, min_order);
+
+		/* list head of fbl is invalid outside.
+		 * Walk through list from first fo last only.
+		 */
+		if (__free_block_in_order(&fbl, free_block, order, &first, &last))
+			break;
+	}
+
+	*lb = last;
+	return first;
+}
+
 static struct drm_buddy_block *
 get_maxblock(struct list_head *head)
 {
@@ -637,7 +771,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   struct list_head *blocks,
 			   unsigned long flags)
 {
-	struct drm_buddy_block *block = NULL;
+	struct drm_buddy_block *block = NULL, *last_block = NULL;
 	unsigned int min_order, order;
 	unsigned long pages;
 	LIST_HEAD(allocated);
@@ -689,17 +823,30 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 				break;
 
 			if (order-- == min_order) {
+				if (!(flags & DRM_BUDDY_RANGE_ALLOCATION) &&
+				    min_order != 0 && pages == BIT(min_order)) {
+					block = find_continuous_blocks(mm,
+								       min_order,
+								       flags,
+								       &last_block);
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
+			if (block == last_block || !last_block)
+				break;
+			block = list_next_entry(block, tmp_link);
+		} while (block);
 
 		if (!pages)
 			break;
-- 
2.34.1

