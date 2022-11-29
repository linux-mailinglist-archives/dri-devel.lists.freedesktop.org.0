Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3001363C045
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 13:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AB210E089;
	Tue, 29 Nov 2022 12:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4E710E089;
 Tue, 29 Nov 2022 12:46:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xh2jVjDVO8CvzWNxwr6b3cmS9u6MmEDUds+NKjJ9122KJETUSobF+pG6veGH1hHomDp4HgYvFsKu6N4aLZ8kzgoxmsoExV0niQkc+Dr82zlYbJLZdPYZkefMtdzjwq7SsTG9y7my1SMXDkUDQ4ZDpZ+l3E3CaAGlcNP3U4+7SWEc4d10jh1KzgOh1C/XaVpIYcqxOq3IEmCZIjbZDXgyv3j65Ne1bJXTBu3ntQ8Ve6ZsIPQBj+CPIC7jM97vhXDIrQoNKInI63uLQ7IrfKTZWGlLoR/OI2vqUY3na69TQQuDFgb1+YQWpHte4ILMZ/V8PyFcQSRKIHSijsRjCKpyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4P3z2JjSfCM9bP4l9+9nLv+sps2uWgWsOxldL5wp9s=;
 b=KVZu0OUjGbWBo6qWvKcFMzDpH3ndzU+nT2FqfXq0qSWvx351jTSoIBi43r3LZUFGB+muhYcuG1AdCz2gDWbMkKs2xQKCPfY9PX+tT9MYoce24Ogyxt4ImcIBbg/AKG0Vh/42SVJDu3hHBNO+FpoIw3GZV7MyZ/jT0yXRnTGLJ9qB0PFJWp/8/rGZT24jpysolPaU56O8K5wkYWAdcIeZOkVgKcQe95oQacS8ul4dwqIEB0WIB74t/Rp4zyQhtZSnGVo+M+i7aGcSNTbsCThQ0p7g8hIdJPXfSFSM/UL/JB7hkTLcc3JFCun5tZ+y83xTGtcaazUUuoaD3A8GhcM6pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4P3z2JjSfCM9bP4l9+9nLv+sps2uWgWsOxldL5wp9s=;
 b=RKtSeMOvehGvZ0GfMntpUFDry7hPBCWo2XUUoeEdsYmR40fTPXxzDrnzNvifECb+ApetUZ3sLB/KCAX8PH46wVx16smb5mTKpcR177UeUD8W5KNAl1Lgjf2Dteb0BZr8R7+DZkMNIh8M5pBqDK/Fido1tDmQrTDfcMSW2ty3Vng=
Received: from BN8PR04CA0043.namprd04.prod.outlook.com (2603:10b6:408:d4::17)
 by PH8PR12MB7231.namprd12.prod.outlook.com (2603:10b6:510:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 12:46:05 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::8b) by BN8PR04CA0043.outlook.office365.com
 (2603:10b6:408:d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Tue, 29 Nov 2022 12:46:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.22 via Frontend Transport; Tue, 29 Nov 2022 12:46:03 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 29 Nov
 2022 06:46:01 -0600
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5] drm: Optimise for continuous memory allocation
Date: Tue, 29 Nov 2022 20:45:38 +0800
Message-ID: <20221129124538.177870-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT053:EE_|PH8PR12MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: 0083d91d-ff1f-4f33-81b8-08dad207ad47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4+rHV+GTZ+n7/DjhGrDewFMhgFYrurUbQ1PX/XJcRkOpiXtI/SPlFwts6tTuU9u+1IlwKNJ9XFt5Ie843UTlW3UusVaYq4zgu+smPlMtdOy1UswFcmadoxeFPR56dNxkpwCUpxxJnM1E4WulHUSxFt52BDoeZzREIpaHEo3401u8uIoBHp2hfSkgd+wrgCqNGBxFKb0KSsSXfY9/AgvdWVLocAnTBsSGI2vQMnGItAdc8xVWMBn1db2ZXYZ8CwcjUSu8y4WaBNXpdT+YxnHtwb6CNwLahlEq8RNj7YKQjKpRbHFsk8BZc8NoV/0ZTLPNyakpgEA0yOJHGt2A4P3yBG0epsrd3GvIheMX2H7fxPNJBFUjv0o8YCvea0OKJmAdZH6Xk79DAPcRtYBgLZyUErulK6eoI+hkevuRfPkH7Ig0MHGPnhMziZnsgYulcirs/mEQHuxQpmKCBXxGlfyZCu/WpgNdqTDEkkFJo44DhUhHyUXSDjcz0BjAhTE4N/8UaYMFwkYr0kk40Gir9awLEgWQTfbCt0JU9Gz7/ETH/97Vj9exk16JhUWNhNRJ6xZH20WFJlZsinK6qetWKVJJIwlv+aN5HNV881B+szOrTBxRsLbAlqgIjo23sC6rC4nj3PLtrIy1MtsRJXaDev0DbjdBDPL83u1YQOaiFTY3+B9gwRsEBzsNDBXZqp8i1jIIWQKP8dMtuchnXiD7ncTgR+EBZaU3R6hM38ATiF0APj4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(2906002)(83380400001)(36860700001)(40480700001)(1076003)(336012)(41300700001)(2616005)(16526019)(70586007)(70206006)(186003)(40460700003)(86362001)(36756003)(81166007)(356005)(82740400003)(26005)(6916009)(54906003)(82310400005)(8936002)(5660300002)(4326008)(8676002)(426003)(47076005)(478600001)(316002)(7696005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 12:46:03.9626 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0083d91d-ff1f-4f33-81b8-08dad207ad47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7231
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

Adding a new member leaf_link which links all leaf blocks in asceding
order. Finding continuous memory within this leaf_link is easier.

Say, memory of order 3 can be combined with corresponding memory of
order 3 or 2+2 or 1+2+1 or 0+1+2+0 or 0+2+1+0.
Without this patch, eviction is the final step to cleanup memory.
Now there is a chance to delay the evction and then reduce the total
count of evction.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
change from v4:
Fix offset check by using <= instead of <
Change patch description.

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
index 11bb59399471..00dd6da1e948 100644
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
+			    drm_buddy_block_offset(prev) >=
+			    drm_buddy_block_offset(begin)) {
+				prev = NULL;
+			}
+			next = list_next_entry(end, leaf_link);
+			if (!drm_buddy_block_is_free(next) ||
+			    drm_buddy_block_offset(next) <=
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

