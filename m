Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5B85D7C9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 13:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679B510E705;
	Wed, 21 Feb 2024 12:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MXrC2NCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C75510E54B;
 Wed, 21 Feb 2024 12:18:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpyNMqajEeF8t4K+E87PtcwKTd0Jf57Zyt+CXwOH/Z87mWBqBzOF4ME3lFhocy5xqCSK/0nbBUXkhJNw6CjEszZGfnGs7kQsmQx64DI6Mfh6b1CPl8XVAOLdA7wmPPH9JQKBqg15ypFBjYMm2bqwvUbgjvlv5nspCEAC12g3pgBdoeJnfmWbyM2tDQ1Y8ri8BEbdmUmOCwVSMOI3TGVi+d994AFeDtAueq0hZT91lrFfTm8rVpoyMiAGaIetqiMwUEXiy3lwWP/TyHfn1LZzt17rLhtk9gyXhcPxEAEk/RkBS8zEFQSmtXePbxqwGBCWzzEifoaI55LXbZjdBvA3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0EMvCzK/KX8XYGiuAa79T+1mAhQcYufcR/4NI2g0Us=;
 b=TmMrQ5B7lhzbnl8uzUaqVJyzfcIPvdSe5eMh7utna69y4e46ak503Ha/64UxpAOLmFTMZUSruXHoT8ypc7leJxB+E04lvv+xmI4j0TucuSjF10g6/sclTqSzJqXdccamkKmbgCjurIPLU7G1ucpCHdAHDFvLmvfHmb5vV7UsrRlXWCXIbXIu0tGAbQhi/GOQNc4xA+jvn4190D4DiPUju4yDZ7xyl7SNlD0lkFpbCerghzarThoNwTNAb6kbDilsRMHzUkpFbeaH4dl2fazj0V5yndIPLE15mnjyLjVae5bw1eh8rVmOfblA8Ng69v5iOpsTTCoaK5pZ4rX+rRCWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0EMvCzK/KX8XYGiuAa79T+1mAhQcYufcR/4NI2g0Us=;
 b=MXrC2NCs7GtMlwhH6IgftjVGmv2m5ftGkFA5u0XEU+fBUnKXT6EPz6Ekx8/Be8If2WJs1cphIhrpZLFcQzjWgUVSRDX4zQnaf8t8/AFZBSqnV6HQpUqv/iALUyz/c5qbiIzNwxbu0wwGx5t5padccttuk2Ffgg8sxerN20x00wE=
Received: from DM6PR02CA0131.namprd02.prod.outlook.com (2603:10b6:5:1b4::33)
 by MW3PR12MB4348.namprd12.prod.outlook.com (2603:10b6:303:5f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Wed, 21 Feb
 2024 12:18:33 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:5:1b4:cafe::53) by DM6PR02CA0131.outlook.office365.com
 (2603:10b6:5:1b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.41 via Frontend
 Transport; Wed, 21 Feb 2024 12:18:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 21 Feb 2024 12:18:33 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 06:18:30 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <felix.kuehling@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v7 3/3] drm/buddy: Add defragmentation support
Date: Wed, 21 Feb 2024 17:48:01 +0530
Message-ID: <20240221121801.3252-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221121801.3252-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240221121801.3252-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|MW3PR12MB4348:EE_
X-MS-Office365-Filtering-Correlation-Id: 666cda4d-3880-4f02-e951-08dc32d738eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KdSsKcHX+b7pRJlGp1X6anSCZuPybKeo8og5hOEcGx4vjXsoM+JaEiXuJ2dVcE3VqLsIDnLCdhrAyhmy62OdasbjOXI/bj17WFMmkE84reiureWQyuPF45eyn/RcBbTFki0yQ4+hUSVJTJtmRKlR3l1bvDLH0+yIT1XJfJ87qpAWg/5ePd4b6bCaP9asoNpH9oItq0VDqQdpXyYfTkcT8gOrvTEmzEW8EdPpywGoiCaLsNCKwVE8aFRMvxpyTa9KbLNEUhD3Y0+piklzDzndjq1fNsdi360rtIWfLSGpIp2BH/mhjFTRupuIglLWzV6rCDN38xUznsMiI7G4T0w7rA9ZEj78HXRIZCDxk/mB6xih2yZrZiCqRfeyrMShc0sO1UT/l1qG78TP9Fgu2DkoXFeiR9xpVFzvQb57upTm01jNkd+S9qhQXPouu+eunniDWS8GnQuphh4RhSheEi40uJtgjgnECMCuMds8kWEhji2TRNQfTUJCBDe1Lt5nvy5Ea6ax7hukFqtTge7Ei68VvCGN7RsxV351YtDRHUDxTGMDKdhwdw6L4IeNTlWzzoVk4zwGYtb8Zq+6Em16iZmOrKuLJNsTLDPd7S3LaZA8s+4EkynmKmKyCELEnMBj5KbUMyzzu3AkNDMKnCV4whtsZAZdtLwTHnBQe3MaZWWix+s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(230273577357003)(36860700004)(40470700004)(46966006); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 12:18:33.3016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 666cda4d-3880-4f02-e951-08dc32d738eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4348
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

Add a function to support defragmentation.

v1:
  - Defragment the memory beginning from min_order
    till the required memory space is available.

v2(Matthew):
  - add amdgpu user for defragmentation
  - add a warning if the two blocks are incompatible on
    defragmentation
  - call full defragmentation in the fini() function
  - place a condition to test if min_order is equal to 0
  - replace the list with safe_reverse() variant as we might
    remove the block from the list.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++-
 drivers/gpu/drm/drm_buddy.c                  | 93 +++++++++++++++++---
 include/drm/drm_buddy.h                      |  3 +
 3 files changed, 97 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index e494f5bf136a..cff8a526c622 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -533,8 +533,21 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 					   min_block_size,
 					   &vres->blocks,
 					   vres->flags);
-		if (unlikely(r))
-			goto error_free_blocks;
+		if (unlikely(r)) {
+			if (r == -ENOSPC) {
+				drm_buddy_defrag(mm, min_block_size);
+				r = drm_buddy_alloc_blocks(mm, fpfn,
+							   lpfn,
+							   size,
+							   min_block_size,
+							   &vres->blocks,
+							   vres->flags);
+				if (unlikely(r))
+					goto error_free_blocks;
+			} else {
+				goto error_free_blocks;
+			}
+		}
 
 		if (size > remaining_size)
 			remaining_size = 0;
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 18e004fa39d3..56bd1560fbcd 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -203,6 +203,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
 		drm_block_free(mm, mm->roots[i]);
 	}
 
+	drm_buddy_defrag(mm, mm->chunk_size << mm->max_order);
+
 	WARN_ON(mm->avail != mm->size);
 
 	kfree(mm->roots);
@@ -276,25 +278,39 @@ drm_get_buddy(struct drm_buddy_block *block)
 }
 EXPORT_SYMBOL(drm_get_buddy);
 
-static void __drm_buddy_free(struct drm_buddy *mm,
-			     struct drm_buddy_block *block)
+static unsigned int __drm_buddy_free(struct drm_buddy *mm,
+				     struct drm_buddy_block *block,
+				     bool defrag)
 {
+	unsigned int order, block_order;
 	struct drm_buddy_block *parent;
 
+	block_order = drm_buddy_block_order(block);
+
 	while ((parent = block->parent)) {
-		struct drm_buddy_block *buddy;
+		struct drm_buddy_block *buddy = NULL;
 
 		buddy = __get_buddy(block);
 
 		if (!drm_buddy_block_is_free(buddy))
 			break;
 
-		if (drm_buddy_block_is_clear(block) !=
-		    drm_buddy_block_is_clear(buddy))
-			break;
+		if (!defrag) {
+			/*
+			 * Check the block and its buddy clear state and exit
+			 * the loop if they both have the dissimilar state.
+			 */
+			if (drm_buddy_block_is_clear(block) !=
+			    drm_buddy_block_is_clear(buddy))
+				break;
 
-		if (drm_buddy_block_is_clear(block))
-			mark_cleared(parent);
+			if (drm_buddy_block_is_clear(block))
+				mark_cleared(parent);
+		}
+
+		WARN_ON(defrag &&
+			(drm_buddy_block_is_clear(block) ==
+			 drm_buddy_block_is_clear(buddy)));
 
 		list_del(&buddy->link);
 
@@ -304,8 +320,57 @@ static void __drm_buddy_free(struct drm_buddy *mm,
 		block = parent;
 	}
 
-	mark_free(mm, block);
+	order = drm_buddy_block_order(block);
+	if (block_order != order)
+		mark_free(mm, block);
+
+	return order;
+}
+
+/**
+ * drm_buddy_defrag - Defragmentation routine
+ *
+ * @mm: DRM buddy manager
+ * @min_block_size: minimum size in bytes to begin
+ * the defragmentation process
+ *
+ * Driver calls the defragmentation function when the
+ * requested memory allocation returns -ENOSPC.
+ */
+void drm_buddy_defrag(struct drm_buddy *mm,
+		      unsigned int min_block_size)
+{
+	struct drm_buddy_block *block, *tmp;
+	unsigned int order, min_order;
+	struct list_head *list;
+	unsigned long pages;
+	int i;
+
+	pages = min_block_size >> ilog2(mm->chunk_size);
+	min_order = fls(pages) - 1;
+
+	if (!min_order)
+		return;
+
+	if (min_order > mm->max_order)
+		return;
+
+	for (i = min_order - 1; i >= 0; i--) {
+		list = &mm->free_list[i];
+		if (list_empty(list))
+			continue;
+
+		list_for_each_entry_safe_reverse(block, tmp, list, link) {
+			if (!block->parent)
+				continue;
+
+			order = __drm_buddy_free(mm, block, 1);
+			if (order >= min_order)
+				return;
+		}
+	}
 }
+EXPORT_SYMBOL(drm_buddy_defrag);
 
 /**
  * drm_buddy_free_block - free a block
@@ -321,7 +386,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
 	if (drm_buddy_block_is_clear(block))
 		mm->clear_avail += drm_buddy_block_size(mm, block);
 
-	__drm_buddy_free(mm, block);
+	__drm_buddy_free(mm, block, 0);
 }
 EXPORT_SYMBOL(drm_buddy_free_block);
 
@@ -468,7 +533,7 @@ __alloc_range_bias(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 	return ERR_PTR(err);
 }
 
@@ -586,7 +651,7 @@ alloc_from_freelist(struct drm_buddy *mm,
 
 err_undo:
 	if (tmp != order)
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 	return ERR_PTR(err);
 }
 
@@ -666,7 +731,7 @@ static int __alloc_range(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, 0);
 
 err_free:
 	if (err == -ENOSPC && total_allocated_on_err) {
@@ -828,7 +893,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
  * @mm: DRM buddy manager to allocate from
  * @start: start of the allowed range for this block
  * @end: end of the allowed range for this block
- * @size: size of the allocation
+ * @size: size of the allocation in bytes
  * @min_block_size: alignment of the allocation
  * @blocks: output list head to add allocated blocks
  * @flags: DRM_BUDDY_*_ALLOCATION flags
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 352a6364e26a..68a874846e78 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -167,6 +167,9 @@ void drm_buddy_free_list(struct drm_buddy *mm,
 			 struct list_head *objects,
 			 unsigned int flags);
 
+void drm_buddy_defrag(struct drm_buddy *mm,
+		      unsigned int min_order);
+
 void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
 void drm_buddy_block_print(struct drm_buddy *mm,
 			   struct drm_buddy_block *block,
-- 
2.25.1

