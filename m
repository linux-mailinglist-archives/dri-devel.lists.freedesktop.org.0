Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666EF4BDAF1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 17:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1384210E5C5;
	Mon, 21 Feb 2022 16:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA4B10E3B4;
 Mon, 21 Feb 2022 16:46:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jq6b07wBrPuB+cruiw689C87uYy3e/Cl1gMwrSGkISRB8tVs8Nyh18vr33zVtCaKmQ2wC78nOlWEiPzVtl6L4QfOuNwjN2qSikVAIt7yVktLsomvUCkj8exTRL5/p61u3Nawm8+QfiKCknO0O/UpfQYDkvSP7RYxjbSu8K/UagsY8pQ20X5A711i1ELjAouk0nRTH4zpqg9P9pN3yg6++ZjwI3K6jGzJ0Cb+nhTXEitw32+blqD2BtcMvhgb74pTZUKjxCLy3mg2f7D5QUbambzhvARvAkTTH6auEvbeSrpVsAQ5dBlq+Tgoytoe1B/ubHZOlKG+p973WZ6XhttQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++mBnMwGwPW4ky8lHMo+Wuyc7ZXwyVK28VUK8UxLgco=;
 b=jt9UH5fnAnmo101bhT9zddet5/M7cWZ19nSMHHEHxQRo63pdEB/thIvNRIolGW9NSCzTDO+/AJs4n5SnGbebvJSbo4xt70jEp7datEWuyOeS7RUTlmYXE4Fs+RrTVNLTUKZLPo0S15hGYskDhm+YaXrECIm/3yE99MUksFLXTY0k1JMFcf03xalMFNdlJnwBQU6jR2sTUnUe7/A0VjlEZwu2b+ty/sIlQYIMdtiiAnCKKTfoDXx9spvlvRFb3vOHRRSIKUKgR7YI862ZowdtuNv9jc7i4ZDZUuDtP6I5O/2yh8VXiTfKc4lb5CzwtrmyVp3chq4JHU6CqBnhKKsIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++mBnMwGwPW4ky8lHMo+Wuyc7ZXwyVK28VUK8UxLgco=;
 b=vCPvrID8PwXgzlnecKmXcbdTuF16e2w6TWppRsMJp4/rezo2E75YXpxHnOtP2/A9nSIZ2qnSeKMGb5oflFxzHJ9EYYC8DuKWWqos8YfRi468kIvTncFq7pSu29Oc+DC7BkxKwpju3qFBfVlkoEfBnOKa0fWKzjjchwGHFl858Mc=
Received: from DS7PR03CA0048.namprd03.prod.outlook.com (2603:10b6:5:3b5::23)
 by PH7PR12MB5593.namprd12.prod.outlook.com (2603:10b6:510:133::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Mon, 21 Feb
 2022 16:46:19 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::b) by DS7PR03CA0048.outlook.office365.com
 (2603:10b6:5:3b5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17 via Frontend
 Transport; Mon, 21 Feb 2022 16:46:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Mon, 21 Feb 2022 16:46:19 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 21 Feb
 2022 10:46:12 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v13 2/5] drm: implement top-down allocation method
Date: Mon, 21 Feb 2022 22:15:49 +0530
Message-ID: <20220221164552.2434-2-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 32ec8634-c69a-4621-bc74-08d9f559af69
X-MS-TrafficTypeDiagnostic: PH7PR12MB5593:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB5593563FB171DC510E384512E43A9@PH7PR12MB5593.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WSOG71ump4T3IJb5lTrd/Aw1807R/y/npKsdx3DmhHVjH/TzAXk7w5ApdiiZ+3aRaB8BtARVjACxt7uhCs4w1/0v2wsSr430kMD3LrbYI86mRnLIMm4/Z/G7YbGVv74e4XBmgvvhJUXM+HGX/9xllLr4+STEm2SGt7h8Sp1L5eJiqzTK9fR+L/onefChAtFfzPWSPn+wCzqqiwNR89gzbaeBvLXyXDL0DKXotXx5QRWUKHItyueI3pHi8E0N+H39iXOshllZxdpt3oWarJ/fXtrkf+rPI1y8lQJH9KckhhHXhRQlBr+Y4aG4JrZnGzu9WlNGSQkxrnm4e05NmkWjkV2Qc2eJ69S6b6zGl9Synad5Y3f5IR3WrnzIIS12D4h6h7gJNvISJ105Q8TcQpaIevKKSYhOcTVDR70gfdAyplftPXOhTndnZg2sxJOtDGFMVyfE+JFGrnn+kDlxZESCI0Fven5Q1ISFOocQ4jJhrvp+mQJ3Jur1EF18t4wLr8wdA3KBfglNiAUkWU3FcdTcfjS+N1wwhF1oGlmIlT/7i1jZMB4O8dcJRJ6xzgqj5xXOnC3BLFFrPBJKY+HJ2ERt4V4v1cll7PhPgU+a1dPsDBriWwMrGxoiFe52YIvA1tlKcyI4LIXRJ42jwViKwPu4yyIk61zi0sP52szLgyou81WsEgLBko+HZD5ToiVssBfQGpvZcdoukOF3ogiy7REMgA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2906002)(6666004)(7696005)(8936002)(5660300002)(356005)(508600001)(81166007)(36756003)(336012)(26005)(426003)(1076003)(2616005)(186003)(16526019)(47076005)(83380400001)(82310400004)(36860700001)(70586007)(54906003)(40460700003)(110136005)(70206006)(86362001)(8676002)(4326008)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 16:46:19.2378 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ec8634-c69a-4621-bc74-08d9f559af69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5593
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
 include/drm/drm_buddy.h                       |  1 +
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 1d801c88b286..72ee3cd96a24 100644
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
index a328a38fab07..7f553cceb6c0 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -53,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	INIT_LIST_HEAD(&bman_res->blocks);
 	bman_res->mm = mm;
 
+	if (place->flags & TTM_PL_FLAG_TOPDOWN)
+		bman_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
+
 	if (place->fpfn || lpfn != man->size)
 		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 54f25a372f27..f0378fb48d06 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -23,6 +23,7 @@
 })
 
 #define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
-- 
2.25.1

