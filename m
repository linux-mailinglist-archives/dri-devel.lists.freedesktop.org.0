Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7B47F951
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 23:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538710F5D5;
	Sun, 26 Dec 2021 22:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DA910F5D2;
 Sun, 26 Dec 2021 22:25:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMm7+7O0+qHBzLU3xaW+9k3xATGpa1zRQ1U4O5i8+3FurupwdQ7gQK4eQ/gXbv2bSaJN3XPvDaUH472jTRXoNyA5Uzo27xtaijZrUx5msr1t926bpJFfllxb9RCrtK7soLrizd8hXd/SAgcyw3/eNqYXH4YslPAED05eYMzNo5XHkR7VYmmkIcLAE3wVziu/rrfsNZueJSQfwgFQWoULeN9ncQsLMmOJzGXRQb3t2dxXpLRAIKaq16YxRJ2AlTBMOLsDuchP1bLZNAgCUTxa6Y+KNX/IgNuq4hU669ol731R/rP4fuvXiQMbtcH5RZrpY8I2cij7oxi0KBfXWvCJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0Hml9T6zIeI02EAQjAnBOuo5KkmntZfA3FOLJopL0M=;
 b=LHeB01h6QopSuxPxcxkCpyoZ4x8ntIjHfVD2JhPz5ENERNyPJskfxSSkRoLQbXJdoY82l+7e/39kVqMVosBoW92qdNRESZFntRu5WWiajNylM/gruPyx3jQE1KYfrvSXRl2WeSQUVTOSyyBPxC1YeZdWhKUMOoIsiO3ay7fHlmC8tb95oOcweqAU5nsvvEXi9bBpLaWY81SpwlvvazTVlF7d8fuH/1kofJi4A1dxDjubdvwWfpaRFaMYiWCyb26nIOC5ZD5dlZc/o6ihYdduVafIhwDpx8LDQjgdx3bTWIsybCzlWyPOhxzdbxw3GoPwuy0nrqHcIiJzOoXhiW5vhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0Hml9T6zIeI02EAQjAnBOuo5KkmntZfA3FOLJopL0M=;
 b=Che+tKNmcyNWw+dHD+0RkWlIY0kGM87+H+mtcEK3w4ntM4IpQ9ADHu6TmCDD1IyH1VB4Sv0DXoCfg1aRYp5RBUAgqhv8Rm7ONxNnJUWgozlcqN9NN2rXTJm7893yTJOcvr/A/wVsUVWDoY2g4Pe9/qZEg3yJLcdvvQmfiZDP3HI=
Received: from DM5PR21CA0031.namprd21.prod.outlook.com (2603:10b6:3:ed::17) by
 BN8PR12MB3393.namprd12.prod.outlook.com (2603:10b6:408:46::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Sun, 26 Dec 2021 22:25:11 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::5c) by DM5PR21CA0031.outlook.office365.com
 (2603:10b6:3:ed::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.2 via Frontend
 Transport; Sun, 26 Dec 2021 22:25:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Sun, 26 Dec 2021 22:25:10 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 26 Dec
 2021 16:25:07 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 3/6] drm: implement top-down allocation method
Date: Mon, 27 Dec 2021 03:54:22 +0530
Message-ID: <20211226222425.544863-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48692d0c-3137-4076-5746-08d9c8be943d
X-MS-TrafficTypeDiagnostic: BN8PR12MB3393:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB33935BF9DA228D9CC497F1AFE4419@BN8PR12MB3393.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LPeB+AJZ7Qu9tSq49y7tzKrPjRQb+yTfcsFQsp6ES8rpGXdm9785tjNueOFUbNx7i/cvEkNeZVyBp1mPIDy522G0LNRQSmQ/s3gU1nW0tNey5LzK0eDb7dZ1pYw8aaRiZPbPcK0oMTZP8x0hxtMB2h8OIYAY4OuHe7PwD5OEJn4Do8M6BWHJjnJBQjmOdCLJL3hwNJ8zxWPOCD0opLGIcMNxNq3+L8EGxcT5Wn92+1HhBa8VivtSiriTdXMpTqthRcTFrtjMLSeAU/w+Ayni8XUZ0zOW5xOy2eLsQXfEXE9vvaMw+aMp9NEus/yQ1ypYxUI5p5U47M0ZaQrKAY/b4D5lRT7Mcrp7mGW4c+jU83s5yu0oyr442QBJIuLXJ7F7rxw54KHRu/poWkot0DTaDgTn+0Dn1SBEM4LWII+j3z65jefCg9yDuosz70jGUfxnLtq54vTQ/zoOCS9qPifIEcxZ+aV0ZHblCtPwfhiSVWNOv+Ly0bHfDh2nz9FzXDdwgnard4PgtsKPVHXH2UeoAyJ4+EmKFDh70+ME8I1WUia+Cm/pbvKzJ3qd1nVR088wU8yhPxkqERL19MDZqbKwb4ik6dvsME+kZlUbSLW5icj2/wdY+nLSjYI5GH/GQo937krsh9pEoIfsoDCuzvpZC9ItGmzYeDbqj3cn1aDb+VhbtMLaLDGJWjTuq74esdGtOhb8vZwpA4VYt6JuyeUkcm1ajVZpkja0tZZNDyshTKsTqEB4PqKIcO707AoNlUE4fGoseGG6e4bFK+XpTIqnoTDS8+qXkIx7QG2a79XaIXk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(2616005)(316002)(47076005)(426003)(36860700001)(2906002)(110136005)(36756003)(336012)(54906003)(5660300002)(8936002)(8676002)(81166007)(16526019)(6666004)(82310400004)(70206006)(26005)(40460700001)(86362001)(70586007)(7696005)(1076003)(356005)(4326008)(83380400001)(186003)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2021 22:25:10.5244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48692d0c-3137-4076-5746-08d9c8be943d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3393
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
index 7f47632821f4..eddc1eeda02e 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -367,6 +367,26 @@ alloc_range_bias(struct drm_buddy_mm *mm,
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
@@ -377,11 +397,17 @@ alloc_from_freelist(struct drm_buddy_mm *mm,
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
index 7621d42155e6..7c58efb60dba 100644
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
index 4368acaad222..f573b02304f4 100644
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

