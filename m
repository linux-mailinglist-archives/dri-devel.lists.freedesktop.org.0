Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17153453ACB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 21:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF4D6E165;
	Tue, 16 Nov 2021 20:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666456E165;
 Tue, 16 Nov 2021 20:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1adkK5Ls5TMs8g65/79TeCJv71EFS+XrDxW6I8hbVv//PTBCV1JFkhYOhF7Vr3tzGFss/eEbAqBFS7TxyzYyJKF/uGXWRcRNPaCWhMnZUxgKog04wFnP5LrH2z/1xHvqPW4lUHMmjPMjmmSSVITj7v4+A2QbrIZsupduWUgOujx0wuRq3fFAQWUB3lnI0N5x8xOtYiLBqM7PcVFtw9tthbhJgXfSkuMS1oY7tnd6SKuNbvsN6asYxJk2u2Eh11rQdmhFyBjbpD/1Xn6DFIT8o61qI1LE/kD/skD+fNInnHIdMEU54bBY1DX1AlNrrWq4Mad0CGbD/Go4zj7A8pD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HE/n8ohd/65hGitw20EDDoODN2On/Xw1MOCO+ZgGsGo=;
 b=Qk9jvO6ZmApIc6NXO8E61SpSSDeHBJwwFA93hqI8EtcyJehe7CCuUQ7wuobj+2/y4DlXPGbw3AoztJCliv52IXwOrDgLkN0gfxaKDPmS6GFgxo1xc6G4fvLgLTQIFHg+f2m9qEHfdepsQ0i26g5Xc2LqVvgLar51kcb/mUAGh0wuirhKvHlfGLHOzjl0RRBta0I+/pMwXAS8d24PwX4921BBdpGfnUQRRgggo25kuw2ql0ZPbJZlz+nwB/HDnVjvdVvK1rqFCgY+0gENCFLAbnm6WQ7N3Yt9JEu0vYMVnIiEzs7WjiVHL79tyZ4JsjM5ttTMRR/R6FoZm4yyk+2DLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HE/n8ohd/65hGitw20EDDoODN2On/Xw1MOCO+ZgGsGo=;
 b=VJ4a8fL9KPlE0aCQZILAlU+sWTa5E5qRjY1IFRThsOb8eXXEkhjTyxqEMayCnOYR+HkUsYh8FpHvixbldNbewLJ9kyoC3TmfYCqx5tOTulmGOutymbW438yWLTAztwZwEcDcfIJ+7ZwHEl/NaHi2SNqFX/BvAwLhC2kQUvoZqQQ=
Received: from MW4PR03CA0115.namprd03.prod.outlook.com (2603:10b6:303:b7::30)
 by BYAPR12MB3013.namprd12.prod.outlook.com (2603:10b6:a03:a9::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 20:18:39 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::77) by MW4PR03CA0115.outlook.office365.com
 (2603:10b6:303:b7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Tue, 16 Nov 2021 20:18:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 20:18:39 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 14:18:35 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 4/6] drm: implement a method to free unused pages
Date: Wed, 17 Nov 2021 01:48:05 +0530
Message-ID: <20211116201807.147486-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116201807.147486-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211116201807.147486-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 782a010f-7ac8-4a67-ff02-08d9a93e4719
X-MS-TrafficTypeDiagnostic: BYAPR12MB3013:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3013F52B2D7DEAC4E59DD5F2E4999@BYAPR12MB3013.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cER20Ri60h5WxW6ADCuEG2rUhlp4GPo6gzK8DqW0r60m1NnnhTL46xffDTvW1JorrfmzGNvRIz11EdHTMVC5sD5UqS6TnpaUdYdR0GwJJMyNLayPg2EWI4LQsAN8ZNLGc5vWoGx3MkThqG7TSohf8OAhLNJe/XHQdAnKYn1GYA7CfS3kbzK5UEMMsIdTXSEOVCbo8okIS5+oLT2YqQzKpmUQyk9R8Vd4QNmxIwaKJ998lGXI0J7kxacrzeZyZK2A28Ikzu9ZMm6sKMSJyquLX1hGuv4DbubeoxnNuT2mApx1L7sbUMY20xKkKZT9Pmsr7cJQ/dIn6od4ROPUXs23UL3OQm2MDCvuX2zaIDqm/MOFZxTk6o0deuHHOMwglkTLthoAO50vDDAd151grEJwgtbBCmafkFZplNk0ZYofruwHjiLtt1jTBWZCLUIB7Oh5a/2exYUbzqaNU5U8lnraQPt7tGrerhNUhz1jRMjxbSQie2s9eVUVUmzVweZf/0iNqisZLbM6U/JaiwhacqyVAskurPleu3tNL6SJgoo2mpOt6UdDQo/+ejYOATByYpfhrwyUiKmFCo8N8aSZUyTkUbgTQ/DDG1TMY9shHkN2pLPqj4NqGQWrNgOKbmQ2icILkn26W8LIYmzNFoor7s5TOFh3c0IkZeEDWCyJS2bazBX/2yGge0Wpzg7jWjsmCP0WJKfuynDgNrtTODsifx9LHz7+70TDx7zCIYWCO09Hb60=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(316002)(5660300002)(2906002)(70586007)(356005)(47076005)(82310400003)(110136005)(1076003)(186003)(16526019)(36860700001)(2616005)(83380400001)(508600001)(36756003)(70206006)(86362001)(54906003)(336012)(4326008)(426003)(6666004)(8676002)(7696005)(8936002)(26005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 20:18:39.4019 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 782a010f-7ac8-4a67-ff02-08d9a93e4719
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3013
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

On contiguous allocation, we round up the size
to the *next* power of 2, implement a function
to free the unused pages after the newly allocate block.

v2(Matthew Auld):
  - replace function name 'drm_buddy_free_unused_pages' with
    drm_buddy_block_trim
  - replace input argument name 'actual_size' with 'new_size'
  - add more validation checks for input arguments
  - add overlaps check to avoid needless searching and splitting
  - merged the below patch to see the feature in action
    - add free unused pages support to i915 driver
  - lock drm_buddy_block_trim() function as it calls mark_free/mark_split
    are all globally visible

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 108 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  10 ++
 include/drm/drm_buddy.h                       |   4 +
 3 files changed, 122 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 0a9db2981188..943fe2ad27bf 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -284,6 +284,114 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
 	return s1 <= s2 && e1 >= e2;
 }
 
+/**
+ * drm_buddy_block_trim - free unused pages
+ *
+ * @mm: DRM buddy manager
+ * @new_size: original size requested
+ * @blocks: output list head to add allocated blocks
+ *
+ * For contiguous allocation, we round up the size to the nearest
+ * power of two value, drivers consume *actual* size, so remaining
+ * portions are unused and it can be freed.
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_block_trim(struct drm_buddy_mm *mm,
+			 u64 new_size,
+			 struct list_head *blocks)
+{
+	struct drm_buddy_block *block;
+	struct drm_buddy_block *buddy;
+	u64 new_start;
+	u64 new_end;
+	LIST_HEAD(dfs);
+	u64 count = 0;
+	int err;
+
+	if (!list_is_singular(blocks))
+		return -EINVAL;
+
+	block = list_first_entry(blocks,
+				 struct drm_buddy_block,
+				 link);
+
+	if (!drm_buddy_block_is_allocated(block))
+		return -EINVAL;
+
+	if (new_size > drm_buddy_block_size(mm, block))
+		return -EINVAL;
+
+	if (!new_size && !IS_ALIGNED(new_size, mm->chunk_size))
+		return -EINVAL;
+
+	if (new_size == drm_buddy_block_size(mm, block))
+		return 0;
+
+	list_del(&block->link);
+
+	new_start = drm_buddy_block_offset(block);
+	new_end = new_start + new_size - 1;
+
+	mark_free(mm, block);
+
+	list_add(&block->tmp_link, &dfs);
+
+	do {
+		u64 block_start;
+		u64 block_end;
+
+		block = list_first_entry_or_null(&dfs,
+						 struct drm_buddy_block,
+						 tmp_link);
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		if (count == new_size)
+			return 0;
+
+		block_start = drm_buddy_block_offset(block);
+		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
+
+		if (!overlaps(new_start, new_end, block_start, block_end))
+			continue;
+
+		if (contains(new_start, new_end, block_start, block_end)) {
+			BUG_ON(!drm_buddy_block_is_free(block));
+
+			/* Allocate only required blocks */
+			mark_allocated(block);
+			mm->avail -= drm_buddy_block_size(mm, block);
+			list_add_tail(&block->link, blocks);
+			count += drm_buddy_block_size(mm, block);
+			continue;
+		}
+
+		if (!drm_buddy_block_is_split(block)) {
+			err = split_block(mm, block);
+			if (unlikely(err))
+				goto err_undo;
+		}
+
+		list_add(&block->right->tmp_link, &dfs);
+		list_add(&block->left->tmp_link, &dfs);
+	} while (1);
+
+	return -ENOSPC;
+
+err_undo:
+	buddy = get_buddy(block);
+	if (buddy &&
+	    (drm_buddy_block_is_free(block) &&
+	     drm_buddy_block_is_free(buddy)))
+		__drm_buddy_free(mm, block);
+	return err;
+}
+EXPORT_SYMBOL(drm_buddy_block_trim);
+
 static struct drm_buddy_block *
 alloc_range(struct drm_buddy_mm *mm,
 	    u64 start, u64 end,
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index b6ed5b37cf18..5e1f8c443058 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -97,6 +97,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (unlikely(err))
 		goto err_free_blocks;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		mutex_lock(&bman->lock);
+		err = drm_buddy_block_trim(mm,
+				(u64)n_pages << PAGE_SHIFT,
+				&bman_res->blocks);
+		mutex_unlock(&bman->lock);
+		if (unlikely(err))
+			goto err_free_blocks;
+	}
+
 	*res = &bman_res->base;
 	return 0;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index cbe5e648440a..36e8f548acf7 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -145,6 +145,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
 		    struct list_head *blocks,
 		    unsigned long flags);
 
+int drm_buddy_block_trim(struct drm_buddy_mm *mm,
+			 u64 new_size,
+			 struct list_head *blocks);
+
 void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
-- 
2.25.1

