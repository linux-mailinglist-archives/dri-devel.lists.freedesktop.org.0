Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774A64B3A60
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 09:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7678D10F377;
	Sun, 13 Feb 2022 08:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F9D10F36F;
 Sun, 13 Feb 2022 08:52:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsnhGcQ8+fmIt8CCPdu+qJrnBQ8MUe01yMQTm8To7fyi8yPSUTOfOVCpF7WgBGakerasdce7hoNS3z3GFwoow7600kicXOZg7dnnud6B8ZPUOPVceq8fL6m6Fv8fzukB0WhC0hFG7nrrStYlvqbG5LJoga9VcbI3ak/20/NVHIhKsVaIf0DK2wFpxmFPD52uvQiwxHRQtjlUuQV4C/6SygWCb5cbdSyLTkCQ6lbm6583Aba2cho37mPxFylOyq4f07gZPt9Q5Sk6f0AolWb+rRmPDWcP/rsPxt2i772ArxZ/kxCFEZurkbET2ojvy0Q81z1CMeB2yY+1ihTKPbWbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sQF5IrBtxagVliL2dwvcTHqwXhCzTN4AtawHqmMw8A=;
 b=Oqsfc/ZeLA7PcS3WbGldKgTYWZTxzUwDHynEZQaoiDNnZ15r8TWf3obNO4KYwJvTNMq7etvIehoqzXCO8868AkXV53VzXqEhHyPY4YO6Ab8tBYzFFqAJqQg1VeedG8ybjbautUrfY3h/zOrYUyHaprqcH8gqO/U6QCe2bHD84kjSfZcqp9unZWfYVxJja2R29Z0X2S4M+Zbb9qFxyPPPjzjz/Jrhfnn8KK26vGzgz/PoEom461e2pfKPAaKfMmADUtTtuXgKw7zr+3ybzFSqkaz+8PV3lbJdz0iptN5RDdAIsmNhXxI/dbEoywMsgQgRCCvEYRwgqj3wZc+xZxjx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sQF5IrBtxagVliL2dwvcTHqwXhCzTN4AtawHqmMw8A=;
 b=za5HoTDVinqXiAttd5ZKtTrH4pJaScwAhDKkLoM1LqZsMq4qQJXO898SNPIehqiT5rLazb03Vhu0iWpC3uJww8xrjuGewJ4+dlg17Q1rkusz8+fPdAYsYmn03F3VSooVRUuN+byv4KU8WMbOzxNoa2QmSUTDpUs1YJ97ZvwkXN8=
Received: from BN9PR03CA0392.namprd03.prod.outlook.com (2603:10b6:408:111::7)
 by DM5PR12MB1337.namprd12.prod.outlook.com (2603:10b6:3:6e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Sun, 13 Feb
 2022 08:52:48 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::88) by BN9PR03CA0392.outlook.office365.com
 (2603:10b6:408:111::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Sun, 13 Feb 2022 08:52:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Sun, 13 Feb 2022 08:52:47 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 13 Feb
 2022 02:52:40 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v12 2/5] drm: implement top-down allocation method
Date: Sun, 13 Feb 2022 14:22:14 +0530
Message-ID: <20220213085217.2705-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56809347-0506-4230-0ece-08d9eece3562
X-MS-TrafficTypeDiagnostic: DM5PR12MB1337:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1337A0F468F2D630AEAA46C8E4329@DM5PR12MB1337.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kleNLprjrwq/j5iMc7Q5nTyAnsDxDyCVh7rs0J+xldO83Z9gk+4LZmkTn45krvH/CxYYaNdIP0R69Tsmd4z3UtEoE40tsAUEykCiFYrTONXNdyw0o0OiErinj6ntlAW+NknmR3rBw+1NipTyPdB9KTJRSeyUkQSHYUlnzRCQauwvzgNNPc7YJx2j1xMt3ECgktAVDuvIQBA5kMt9YnmY4W9cTRf8Sgk0D3AM2QALojAqrmhJzaiqBlt357U/e97rwybVMqtanFw4uIbFUti+SR4mRaKCGMw6nQkm2pMjUGCSw7KRfeN1/0/1O0D4NOBA9k2Z/7dwu+T7cQGC4vaPKpS5rl4SvMdaQYZMVx+0+kZIjm4kIs3+KgtoUs9L4wN8Mx7esEB81oBN8B7Uyb3Rrl9fYDQzD4tuUuTauDgpHLVkwVVgUcYozEmzkXMXq3aP/GnQrY2VKREzM3RBe9harFDls7VSPymafbkUO2UcU0ZM8ycuNBX4wJrHOzDAskUUM7V4h9+7K823L06q3nU2B2X4yIvMF/D3wnNynOVpbcSmO+mf7xfKRoRk7i6RkUYZHSjkpLPU+UWx4vKv3s3NCdMnHHnwxXWj2fEG4E3K8OTPeyDkuToYkDEAG6iB/WMsl6/KV1WmpFmKCTCkLyvHSPvgdJL5piqFWe+p/xpZBPjK3eMEI7HGJf5veV9gzVUzopZaCIYXXjXTpnGj/7Pihg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(5660300002)(8676002)(70586007)(70206006)(356005)(40460700003)(2906002)(81166007)(36756003)(8936002)(316002)(4326008)(36860700001)(7696005)(6666004)(86362001)(47076005)(54906003)(110136005)(83380400001)(2616005)(1076003)(426003)(336012)(186003)(16526019)(26005)(508600001)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2022 08:52:47.5146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56809347-0506-4230-0ece-08d9eece3562
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1337
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

Implemented a function which walk through the order list,
compares the offset and returns the maximum offset block,
this method is unpredictable in obtaining the high range
address blocks which depends on allocation and deallocation.
for instance, if driver requests address at a low specific
range, allocator traverses from the root block and splits
the larger blocks until it reaches the specific block and
in the process of splitting, lower orders in the freelist
are occupied with low range address blocks and for the
subsequent TOPDOWN memory request we may return the low
range blocks.To overcome this issue, we may go with the
below approach.

The other approach, sorting each order list entries in
ascending order and compares the last entry of each
order list in the freelist and return the max block.
This creates sorting overhead on every drm_buddy_free()
request and split up of larger blocks for a single page
request.

v2:
  - Fix alignment issues(Matthew Auld)
  - Remove unnecessary list_empty check(Matthew Auld)
  - merged the below patch to see the feature in action
     - add top-down alloc support to i915 driver

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 36 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  3 ++
 include/drm/drm_buddy.h                       |  2 ++
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index e0c0d786a572..b71e74827550 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -369,6 +369,26 @@ alloc_range_bias(struct drm_buddy *mm,
 	return ERR_PTR(err);
 }
 
+static struct drm_buddy_block *
+get_maxblock(struct list_head *head)
+{
+	struct drm_buddy_block *max_block = NULL, *node;
+
+	max_block = list_first_entry_or_null(head,
+					     struct drm_buddy_block,
+					     link);
+	if (!max_block)
+		return NULL;
+
+	list_for_each_entry(node, head, link) {
+		if (drm_buddy_block_offset(node) >
+		    drm_buddy_block_offset(max_block))
+			max_block = node;
+	}
+
+	return max_block;
+}
+
 static struct drm_buddy_block *
 alloc_from_freelist(struct drm_buddy *mm,
 		    unsigned int order,
@@ -379,11 +399,17 @@ alloc_from_freelist(struct drm_buddy *mm,
 	int err;
 
 	for (i = order; i <= mm->max_order; ++i) {
-		block = list_first_entry_or_null(&mm->free_list[i],
-						 struct drm_buddy_block,
-						 link);
-		if (block)
-			break;
+		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
+			block = get_maxblock(&mm->free_list[i]);
+			if (block)
+				break;
+		} else {
+			block = list_first_entry_or_null(&mm->free_list[i],
+							 struct drm_buddy_block,
+							 link);
+			if (block)
+				break;
+		}
 	}
 
 	if (!block)
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 7aef6ad9fe84..698747dd1c42 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -53,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	INIT_LIST_HEAD(&bman_res->blocks);
 	bman_res->mm = mm;
 
+	if (place->flags & TTM_PL_FLAG_TOPDOWN)
+		bman_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
+
 	GEM_BUG_ON(!bman_res->base.num_pages);
 	size = bman_res->base.num_pages << PAGE_SHIFT;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 1f2435426c69..8e08ab8551d4 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -22,6 +22,8 @@
 	start__ >= max__ || size__ > max__ - start__; \
 })
 
+#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 0)
+
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
-- 
2.25.1

