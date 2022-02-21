Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0754BDAF3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 17:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FEC10E667;
	Mon, 21 Feb 2022 16:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD07110E491;
 Mon, 21 Feb 2022 16:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eam52HSs0xFOISjB2h//DZFkushdTY/BsAxJv9SbcQDnyyoejEYpzC2EWwsMMtrpN8KCOQbGfv1l2LcFMOWJlaqdj6G6cgPS+6OX2tvWsm/xwEP5d4npX3oJGFXqTqk1UGPboS02z/24E8asa/nsrFriLYyJZZnTTdtU3AFUu+94lf3/FsZe2gVnSqmlp8O780gskML/vDEeesNWfV2APKJMqnkzHTWQDOf7GlTbLS7sadtKNQq9APm0yruPbpmz3wmn+X3i2nb67fLBX2fuY90/zyxDHT7FJLkBGUm3ozMcrRhJyFIP8KG2NOpi0beIT1d7bjAypJPRd1QgvqDcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9jrts/HMmhN+iPDJQgKW6Jw7LcsZqORCmSij+7OeXY=;
 b=AB1FHk+Br5xcsA3qwhzsKKrVA5eJ82tFfwGNTC9SoqxRhlufQ6yz1EetOpTakeKD0o1pBEpAY+ssFXcqFR/Hsi0TSYCa+DczrnetVa902Nhtm0pVw+ggu3PvkuhP3VC597Jt9a1HmzlH9fIpq41TUD+QwFYI15CdwT8J1czXFvv0DEBUbxbGKQMF9ehvrZhS/y7StNE1gl/PrlStS/W6yEHJdlhUCdyhEGIsn+momoWDzJxZkgvabb3NI4cwb4CNIexTj4lSN5yp/TytLiIsCUdMjKRX1S32QZSqI6ov5qjsDtCop7qamCUdbJtuOHmVvCHl891p+RnxGc/s+9msbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9jrts/HMmhN+iPDJQgKW6Jw7LcsZqORCmSij+7OeXY=;
 b=HzgweBk39A64Vqm75fXxUxcWd8SpBOrIP1iugCvuNwEI1igfPjljrhNuKnR8EeDg8vr+P250QEBisPMNprh0VOatfjSwDYOKLL3QURjRzK2hySwaDgqEUm9voEYKXzp/vwJO/E0FMY4ndwI9JWqkIoq+2jwev9bT//V9Q2DNyvg=
Received: from DM6PR07CA0074.namprd07.prod.outlook.com (2603:10b6:5:337::7) by
 BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Mon, 21 Feb
 2022 16:46:19 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::c7) by DM6PR07CA0074.outlook.office365.com
 (2603:10b6:5:337::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Mon, 21 Feb 2022 16:46:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Mon, 21 Feb 2022 16:46:19 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 21 Feb
 2022 10:46:16 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v13 3/5] drm: implement a method to free unused pages
Date: Mon, 21 Feb 2022 22:15:50 +0530
Message-ID: <20220221164552.2434-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221164552.2434-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220221164552.2434-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a341dc8-7c49-457a-dff6-08d9f559af97
X-MS-TrafficTypeDiagnostic: BL1PR12MB5755:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5755AFA22985AE58E4A859B5E43A9@BL1PR12MB5755.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfclC+6RuVpEveuHTOkg8rEV4EWeLBR1P6/U1UraYurXKLOuYre+BH+SsNUCUleu6r3O1CTZfbsETRkcFfTTtpaQ4N2llVZSNroqeVWPTMIPQQIi/IBfw1WeHTZ/i3WqXeMDTssElkcShzxYLt/nCn7xqq32Erucrg+IucxD7LHAkPGhPCYyfDmbHLloq1hiZ2DZq5u9YS3payUOy/TWUAxTnUnVGhwSVngzzM/c7ELGTeI/+YKej4H7BWHdfT+AYTN13gewujbXQkmLHqeSgbZpQXiKo1P3a3pHexgQ0Bipmw9kCJ0DG5KUUT1nSFlFj6CX/fnPNauGkLcH1pA1zdPuCGg768zPkmT4pwu6Km7wba9ybLNew3GFXz2218xMKrpNRKRLkB0F4XQxFRqqZoUJ+vTvZ2H8/HKvO0GUqwLh6H1av12ORELr547CJoHicucen+TMHHGRo0E0V9BPszeqlbADpRlSB3Ot1Pu+qeb+qIYACpO/t8Ue/RDcGcVOcf0EzbYqZPcLsPEAgYgZ6f/Zdvmjo4yISa0wpIv3tNVQrjzN0s8F1VxRY07KVplgCLDV63T6c8OqSx+mktDGY99iMJaMFIBNQ1ZnEKppDI9rO2VX5pLA00FCXYdms/HS/f/sBejQS024qvYJZ8foUWDbb9/eKfqvLp2PLx8IwM6kONFohc8Ez3hFV5Hq4Ade0ptWnASGx/XDWZsBpniYxA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(40460700003)(82310400004)(86362001)(36860700001)(356005)(8676002)(81166007)(70206006)(70586007)(5660300002)(4326008)(316002)(110136005)(54906003)(83380400001)(8936002)(2906002)(36756003)(16526019)(2616005)(1076003)(186003)(426003)(26005)(336012)(47076005)(508600001)(7696005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 16:46:19.5402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a341dc8-7c49-457a-dff6-08d9f559af97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
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

v3(Matthew Auld):
  - remove trim method error handling as we address the failure case
    at drm_buddy_block_trim() function

v4:
  - in case of trim, at __alloc_range() split_block failure path
    marks the block as free and removes it from the original list,
    potentially also freeing it, to overcome this problem, we turn
    the drm_buddy_block_trim() input node into a temporary node to
    prevent recursively freeing itself, but still retain the
    un-splitting/freeing of the other nodes(Matthew Auld)

  - modify the drm_buddy_block_trim() function return type

v5(Matthew Auld):
  - revert drm_buddy_block_trim() function return type changes in v4
  - modify drm_buddy_block_trim() passing argument n_pages to original_size
    as n_pages has already been rounded up to the next power-of-two and
    passing n_pages results noop

v6:
  - fix warnings reported by kernel test robot <lkp@intel.com>

v7:
  - modify drm_buddy_block_trim() function doc description
  - at drm_buddy_block_trim() handle non-allocated block as
    a serious programmer error
  - fix a typo

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 69 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 10 +++
 include/drm/drm_buddy.h                       |  4 ++
 3 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 72ee3cd96a24..edef30be8304 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -525,6 +525,75 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
 	return __alloc_range(mm, &dfs, start, size, blocks);
 }
 
+/**
+ * drm_buddy_block_trim - free unused pages
+ *
+ * @mm: DRM buddy manager
+ * @new_size: original size requested
+ * @blocks: Input and output list of allocated blocks.
+ * MUST contain single block as input to be trimmed.
+ * On success will contain the newly allocated blocks
+ * making up the @new_size. Blocks always appear in
+ * ascending order
+ *
+ * For contiguous allocation, we round up the size to the nearest
+ * power of two value, drivers consume *actual* size, so remaining
+ * portions are unused and can be optionally freed with this function
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_block_trim(struct drm_buddy *mm,
+			 u64 new_size,
+			 struct list_head *blocks)
+{
+	struct drm_buddy_block *parent;
+	struct drm_buddy_block *block;
+	LIST_HEAD(dfs);
+	u64 new_start;
+	int err;
+
+	if (!list_is_singular(blocks))
+		return -EINVAL;
+
+	block = list_first_entry(blocks,
+				 struct drm_buddy_block,
+				 link);
+
+	if (WARN_ON(!drm_buddy_block_is_allocated(block)))
+		return -EINVAL;
+
+	if (new_size > drm_buddy_block_size(mm, block))
+		return -EINVAL;
+
+	if (!new_size || !IS_ALIGNED(new_size, mm->chunk_size))
+		return -EINVAL;
+
+	if (new_size == drm_buddy_block_size(mm, block))
+		return 0;
+
+	list_del(&block->link);
+	mark_free(mm, block);
+	mm->avail += drm_buddy_block_size(mm, block);
+
+	/* Prevent recursively freeing this node */
+	parent = block->parent;
+	block->parent = NULL;
+
+	new_start = drm_buddy_block_offset(block);
+	list_add(&block->tmp_link, &dfs);
+	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks);
+	if (err) {
+		mark_allocated(block);
+		mm->avail -= drm_buddy_block_size(mm, block);
+		list_add(&block->link, blocks);
+	}
+
+	block->parent = parent;
+	return err;
+}
+EXPORT_SYMBOL(drm_buddy_block_trim);
+
 /**
  * drm_buddy_alloc_blocks - allocate power-of-two blocks
  *
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 7f553cceb6c0..76d5211c25eb 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -97,6 +97,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (unlikely(err))
 		goto err_free_blocks;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
+
+		mutex_lock(&bman->lock);
+		drm_buddy_block_trim(mm,
+				     original_size,
+				     &bman_res->blocks);
+		mutex_unlock(&bman->lock);
+	}
+
 	*res = &bman_res->base;
 	return 0;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index f0378fb48d06..bd21f9dfd15e 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -140,6 +140,10 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   struct list_head *blocks,
 			   unsigned long flags);
 
+int drm_buddy_block_trim(struct drm_buddy *mm,
+			 u64 new_size,
+			 struct list_head *blocks);
+
 void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects);
-- 
2.25.1

