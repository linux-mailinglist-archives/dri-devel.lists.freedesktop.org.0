Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A191453AC9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 21:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283A96E16D;
	Tue, 16 Nov 2021 20:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05C56E165;
 Tue, 16 Nov 2021 20:18:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjE2zcOoqzV+Psbl3MpkdK0djSsdNYGxsmXraoJpVWLELyN7sVS35i1gSm6mlRVMCOx/Tye77k0vOlHumCEUPKDGiOlrrOJnkeDaDWO+zGDRURoFmblhvi6dFFXtvxLodvhAi6g5Z/+js4q3HJxGcRGAf37Uv3PR8V5F9hsL+x2r4gAzCMM/58WP7lmjbq1oVOlSiYktDHwf+i9IFVCvmvfdOqebc85FGwuWn7Xjv82P2Elvb2G/VnrnOYotcsylWJdod/5ynK8315gjgkqDW3GtGHs1RL6WvZvuMzjLM/NYBG5SRfsgAfdQ46T9SDeK6TR7Z6NbuY9RYPf0w9iATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WY/e0c05I/NOYXGUrSHS3UtcHr5LR2PDcdWEWKvnJnU=;
 b=c6WIjSXGxVmAwF3TshSSg4+lrXk/a03XJK3Yd7I+hiDgeUkj/5hRaslm+UlawZIaFePyVYqrJFA4Y0vI56h81Yi1PQal06kDdxO0lfdJjU9UFrj5e80pUHGE9IKwe8JTsDEWFw7ERcdTb9XyjMu4tiuMZUXKKYw8Xgx2oOJYTcJfS79BFXSjeM1gQRhBkI4g+kxWO1vnavKn+FiIMZI7SSgGIGf882UtM7w3eG1xWzq6/KrdhCOqOrU94VsAfRLD81fqZColqUXMdP0vutFgO0d4l/9RYGsYNAqERWZERtR8pCFFDkTTYs2OnBRVXm0RHc2Adr1lLU1rfY/0FVRFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY/e0c05I/NOYXGUrSHS3UtcHr5LR2PDcdWEWKvnJnU=;
 b=YY2pv03pNui7+R/paz2+t9GKFRiYdEEpSu77kTdF73yFhE7P/Qyr5kkx3bwPanmGvm8ZRRAbf8Oh2MplBlVzm7LybBv77uGEvhDI4CbFgaRaQCkW3F2pj9r1Co7B59fobTi8Ot+2MS4VnQSlAYbsQ2ul8E4q9PwrzQ7M6Kc2N5s=
Received: from CO2PR04CA0106.namprd04.prod.outlook.com (2603:10b6:104:6::32)
 by BN8PR12MB4594.namprd12.prod.outlook.com (2603:10b6:408:a2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 16 Nov
 2021 20:18:36 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::43) by CO2PR04CA0106.outlook.office365.com
 (2603:10b6:104:6::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 16 Nov 2021 20:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 20:18:35 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 14:18:32 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 3/6] drm: implement top-down allocation method
Date: Wed, 17 Nov 2021 01:48:04 +0530
Message-ID: <20211116201807.147486-3-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 78493919-486c-4e29-3faa-08d9a93e4501
X-MS-TrafficTypeDiagnostic: BN8PR12MB4594:
X-Microsoft-Antispam-PRVS: <BN8PR12MB45943910B4852575F5EE1B32E4999@BN8PR12MB4594.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xvOSyVioRsCNX9olplieyCyMG1WD7tf/xCl4JFMeh5ba2TDhlrWzmbq3yKrcD12spHZ128Ttw9u+kPW8lNnLgO14FMAqMNogNBnyF1/l1bp0uYfSTPidi4LqCSOsslGoeJkQNXvYEWdRpY/zx46GAD30d6OjI/AMDGhB/tCQ6Az2Pgeo0fLWX2mFIa9id6rn0z8Jm/d1HmvrSiaJ934QO159uF0gPhfPeDZ4cJKLw7oIJtqO1LqlaXVquW6iOeWJYPnwcy1PTyoF7zeZ2p2GXCIU+PPh9OHYSRHPlDw383L4uhfIVxZ4txayXpF5qjrqB1MnVc8YQCAa4s2Fm9/HydzTNiafwuC9oyQnPhqk/AdWCABNAVtVVbyLVc5+KXZyYj0lSydJGMG4Z76dTMJcBYPgelIu/VXEfs+C1yhZqHMOJ/01omeOo7S77pGPApHfox1fVsTHi0KK5XXB7wuO+e2Z7pEQsLoFk1umbxknKeuQsEvBYT0DZOrWyVV4qS7EgeFsPzmhoppRJCcLKVp1PbVYy8saCy82Bhtn8xayfkU+k7VtlUbmEFRWA+0MxlXlNjDRW4db5tslD+oc3e3HtG5iSLwsX7fuwG8Cy28eZ3q5ovPxjb/5zvq35kqwYBe9CO3NblYyfHKv5Dy9zHa2MN9CUUGrgl0rUX7qQ9VfHvRqsZfG5fpSBoG36810c4SiG+MCk7nYYJxwJb//EAM//DmB1bQkaG2hKnG/vG0nXY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(82310400003)(316002)(1076003)(86362001)(47076005)(6666004)(426003)(36860700001)(26005)(7696005)(110136005)(508600001)(54906003)(5660300002)(16526019)(8936002)(81166007)(2616005)(336012)(356005)(4326008)(70586007)(8676002)(83380400001)(36756003)(2906002)(70206006)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 20:18:35.8453 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78493919-486c-4e29-3faa-08d9a93e4501
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4594
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
---
 drivers/gpu/drm/drm_buddy.c                   | 36 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  3 ++
 include/drm/drm_buddy.h                       |  1 +
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index c9b18a29f8d1..0a9db2981188 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -361,6 +361,26 @@ alloc_range(struct drm_buddy_mm *mm,
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
 alloc_from_freelist(struct drm_buddy_mm *mm,
 		    unsigned int order,
@@ -371,11 +391,17 @@ alloc_from_freelist(struct drm_buddy_mm *mm,
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
index 9e3d130c3f42..b6ed5b37cf18 100644
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
index 2ec3cbc9d5d7..cbe5e648440a 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -28,6 +28,7 @@
 })
 
 #define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
-- 
2.25.1

