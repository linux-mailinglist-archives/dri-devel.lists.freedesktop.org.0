Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2854341C5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD25B6E14F;
	Tue, 19 Oct 2021 22:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8800C6E138;
 Tue, 19 Oct 2021 22:55:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7LRbnqaTQzlooGSSOSeM0l+rEWMYFA/GEktinEy4zBxe3EpxW1x2iVEnxos82DrOfCEmq7tTH1wtUA6AX7zuWtXbFS6hBRV2njgHAAF65lmequJ25Sp43Fa6qVcXottiy/NPZwycfsFXZCpk9gv8bFt7G9XDToOb1HfdXR+VxpC3oPEUb95NetJW2iOQ+dMH62goIK87AtRpVC142gh+/ijxaotROaLxPvdvv/OmiEdD+oMxh6+waMGwImyz2VUseOyX/tgJ/26m4H29LAjRcRuIo8Ui8QhcBzRYpyVrmhMr7Uj7+oV06CrqID1HTpXvwe9/2rTVI9F4tg4mTQZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TicL0s/ZvhSsFe0I8vCX4p1ZYArbNiuXSvHt6bKOBik=;
 b=OZsby38878Z43eX2efG9r9Vl7tKBQvH88yp9ncwG1p280mM15Mfg9wGmxbDdb08oVvf//UCm2/PvCy+5Yj6Hcf5eQtayu8uVxnTYrS6p47iHkvUoiRvThwLxtpEdNAfiuGsdTaJtvy3S+x0kUfwW0cHN/EsongP45Z4jz2XPOfCZx56vb1vM8xh2/vRa6DqJfMTsq5IxqiD14j5NwuevqDhVzwazhN0InEQgBP1QyGtDyFpRfc8vgVFknpYwsz4hmKc7e/19aMVdIHkYpXRbtGGfnxqbakGrR68baZOVPOz7PpWmjtnB9/R5fw5NatPP8ceByoiFmoCb3rkxzpS2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TicL0s/ZvhSsFe0I8vCX4p1ZYArbNiuXSvHt6bKOBik=;
 b=iCizuKClHz85/0ljZZqM1jdh8l4v8sC/JYkbdLG8LXs4SqvGH82PZ0ucXxY0QUpjYBk5Dq9kssjTDn41UOxvuTQO+KMDCMtAV4tUaKvP2MrjrZ7z/ISy5XKpFMTJdvGCX6sBA+PKAUHYaDpuFPE7CQsyLX8PUfOXufqb0EOy53Q=
Received: from MW3PR06CA0002.namprd06.prod.outlook.com (2603:10b6:303:2a::7)
 by CH2PR12MB4166.namprd12.prod.outlook.com (2603:10b6:610:78::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 22:55:18 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::82) by MW3PR06CA0002.outlook.office365.com
 (2603:10b6:303:2a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:15 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:55:12 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 05/13] drm: remove drm_buddy_alloc_range
Date: Wed, 20 Oct 2021 04:24:01 +0530
Message-ID: <20211019225409.569355-6-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d56d83e5-36a0-4a03-7d5d-08d99353843b
X-MS-TrafficTypeDiagnostic: CH2PR12MB4166:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4166E46977487607EA6D3674E4BD9@CH2PR12MB4166.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/sWo47DWb37eQTUgdzI5aPJoRRRmU7vZAFClhHw2JsxPSCBDQalMvOrlivEs1ldYGfEanpb2GgSet/3iHE6nrIj2S6orWOSJMJr2IjAi2IjaZNoNmXAp4647zzE/T45Xa3VE9/ChT9Cwbz5qQGxldhLh3ZbXUO2OyrIpGN18WBPCG2JvqWG/JP+wHn8G/Bm+7W5eObdxE4frM+UJQgUPJVa6BY88QVfGNS4Wm29Bybedlnew4KbAjcODZZwMh1aWy0IzmsO1MUTBJd0nYtUdnaRyYOI2OY2cX7XtCtp1jnEjPWJyGk00I+4Z4iC9niurgQVMnVYroK9K3NPFKhB+/L6+7UQz86ohmTNyCXGf6jZVwtXseL6gAOUecjGIhQLYsIadtgGKkJADVv9FcKFgpjtZt9XOqiZZ60oA1ZJlUt4aw1CVC0llhIonp41H7/gEEvSExQsdnzNC2ZlYZmG5gq3ZYn35+0fAosNqs4OXsVxXKc6fgkxOS1u9EA7ehP7jfY0YG6hExcQFAXxs+xrU2KhPv5rpfALUq9pq8I8IJ6139ImbO8MtAg6MIGK8B8Lo9aj5UzQilqRc5kZlcAcAU4whXh3bBkh3zmOWiVZrKXgY49SEb7N2i5IPpVaLwv88bZGZRSiTPi55U/IlIPgPDdcDmkCOGjMQ94xZFrbtcNyDWVXzLL3iXtw2J42rlzZGoiWmAqdxGo0h3oYzy+yI3qKmjtSPL0NBGV3cIN7ybo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(1076003)(5660300002)(6666004)(8676002)(2906002)(36860700001)(8936002)(4326008)(47076005)(36756003)(508600001)(81166007)(83380400001)(356005)(82310400003)(86362001)(54906003)(110136005)(70586007)(426003)(70206006)(336012)(2616005)(316002)(186003)(7696005)(26005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:15.8086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d56d83e5-36a0-4a03-7d5d-08d99353843b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4166
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

This function becomes obsolete and may be removed.

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 101 ------------------------------------
 include/drm/drm_buddy.h     |   4 --
 2 files changed, 105 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index f5f299dd9131..138e9f1a7340 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -457,107 +457,6 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
 	return err;
 }
 
-/*
- * Allocate range. Note that it's safe to chain together multiple alloc_ranges
- * with the same blocks list.
- *
- * Intended for pre-allocating portions of the address space, for example to
- * reserve a block for the initial framebuffer or similar, hence the expectation
- * here is that drm_buddy_alloc() is still the main vehicle for
- * allocations, so if that's not the case then the drm_mm range allocator is
- * probably a much better fit, and so you should probably go use that instead.
- */
-int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
-			  struct list_head *blocks,
-			  u64 start, u64 size)
-{
-	struct drm_buddy_block *block;
-	struct drm_buddy_block *buddy;
-	LIST_HEAD(allocated);
-	LIST_HEAD(dfs);
-	u64 end;
-	int err;
-	int i;
-
-	if (size < mm->chunk_size)
-		return -EINVAL;
-
-	if (!IS_ALIGNED(size | start, mm->chunk_size))
-		return -EINVAL;
-
-	if (range_overflows(start, size, mm->size))
-		return -EINVAL;
-
-	for (i = 0; i < mm->n_roots; ++i)
-		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
-
-	end = start + size - 1;
-
-	do {
-		u64 block_start;
-		u64 block_end;
-
-		block = list_first_entry_or_null(&dfs,
-						 struct drm_buddy_block,
-						 tmp_link);
-		if (!block)
-			break;
-
-		list_del(&block->tmp_link);
-
-		block_start = drm_buddy_block_offset(block);
-		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
-
-		if (!overlaps(start, end, block_start, block_end))
-			continue;
-
-		if (drm_buddy_block_is_allocated(block)) {
-			err = -ENOSPC;
-			goto err_free;
-		}
-
-		if (contains(start, end, block_start, block_end)) {
-			if (!drm_buddy_block_is_free(block)) {
-				err = -ENOSPC;
-				goto err_free;
-			}
-
-			mark_allocated(block);
-			mm->avail -= drm_buddy_block_size(mm, block);
-			list_add_tail(&block->link, &allocated);
-			continue;
-		}
-
-		if (!drm_buddy_block_is_split(block)) {
-			err = split_block(mm, block);
-			if (unlikely(err))
-				goto err_undo;
-		}
-
-		list_add(&block->right->tmp_link, &dfs);
-		list_add(&block->left->tmp_link, &dfs);
-	} while (1);
-
-	list_splice_tail(&allocated, blocks);
-	return 0;
-
-err_undo:
-	/*
-	 * We really don't want to leave around a bunch of split blocks, since
-	 * bigger is better, so make sure we merge everything back before we
-	 * free the allocated blocks.
-	 */
-	buddy = get_buddy(block);
-	if (buddy &&
-	    (drm_buddy_block_is_free(block) &&
-	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block);
-
-err_free:
-	drm_buddy_free_list(mm, &allocated);
-	return err;
-}
-
 void drm_buddy_block_print(struct drm_buddy_mm *mm,
 			   struct drm_buddy_block *block,
 			   struct drm_printer *p)
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index c64fd4062cb6..ebf03d151845 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -144,10 +144,6 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
 		    struct list_head *blocks,
 		    unsigned long flags);
 
-int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
-			   struct list_head *blocks,
-			   u64 start, u64 size);
-
 void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
-- 
2.25.1

