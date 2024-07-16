Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD430932327
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 11:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4938C10E60C;
	Tue, 16 Jul 2024 09:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jv2FAEqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0176B10E609;
 Tue, 16 Jul 2024 09:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSCxqj6a0lKzzQYwCfJutWQagC3ggDyaiOcDCPytgW3ca4C9NEoeFSG/aaB0S7pcjbwxPh65ThgGEKWND4OoYRYB3ZbFAy0MDp4hnhMEdtJz0BHi/lBorwDh+3I5cgAhdW0gCeWKHEXRfyNkLvqb/OqqemojodK8S9Yc7BU706o3HodqUide1oVWVQ0WdNx6cwx3pBnBEulmzDxnO75sbCvnaKslk1RNqtomARdqOgsi0b0fSHF8QyzsbvQjBJa0SYWr5pGtmI1SlnwcfqbglLA3m/XqRrFTLOJPprr4uFyKmafNIdjM7OZDrsFt/Faz5Q/Td/4/QdrBSOMIMgQy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mc6xlicH/fKXP6YDC9ltq4yQWp9aiMYCOTE65JjZ2Ac=;
 b=cf0gssm8yBWnnEDOmjEssJIRc8Rco86JjH+CSLa+4ooYpamoDNswViOVpTVl2XwK8lzGyYtTTklTgmkXTAYstIWgoBmq5zd0g6E2Kl3BxesjSrJktTUi+mHNClr9x8xLP2ZbjVWc85WwqKdnRs0qxB5zgX41pV9IpUXXDeJNAtOjfJrb/3Y9gH0VUBi1IGa28nVkyx+nVpeuDHnxAwK1aFSKlf9+XkTLxWkivMO5sPhEIi0VLBnsWYqPtG6AeI43wZuETFoXLfCCStrob8hrPW2L8SRFWJGFE3c81SkZ2DDup7v8LiRjIcOQojTBSkhBI+C1KJVC5oZjF1WaP2GkQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc6xlicH/fKXP6YDC9ltq4yQWp9aiMYCOTE65JjZ2Ac=;
 b=Jv2FAEqLhgWlbBFtuptI/6ztacHI3StlM35wYGV304/svWLEnn5bkEkBU9Ke3L2SDFn4l96xu+YZP0comX1HoPEopLm9k8mPwS2LFSL/7NmoG5rX4EBMBNOIpVH+OozpB4e8NUdNuKdrPKDmm5NKdrPwOLLLHgOoKnezuDW0HAI=
Received: from BLAPR03CA0068.namprd03.prod.outlook.com (2603:10b6:208:329::13)
 by SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 09:44:06 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::50) by BLAPR03CA0068.outlook.office365.com
 (2603:10b6:208:329::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Tue, 16 Jul 2024 09:44:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 09:44:06 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 04:44:03 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <frank.min@amd.com>, <marek.olsak@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 1/2] drm/buddy: Add start address support to trim function
Date: Tue, 16 Jul 2024 15:13:48 +0530
Message-ID: <20240716094349.338529-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|SA1PR12MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 97803aeb-e4a8-424a-fe04-08dca57bd5c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wkp0MlFtaHpUeE9JVGtNalNGc0NwdlZldTNiOGprZGcxdlltYVpCc3AyRndY?=
 =?utf-8?B?cXc3SWlwLzZjWGc2YVVnNm9JZHBhcWdsZTlrRWxIZHFzamhEOEorVGF5OFJs?=
 =?utf-8?B?K1g3UVJ6WHlBR1VINUJUelQyMStJYWRwOVFoK1pDR0dlN01zcENadUl5MU1K?=
 =?utf-8?B?aEdyRFJ2U0lwTHNLVVkxUksvVk4xU0VNSllTbnRybkZzTU5xbDBtdVNyUzZs?=
 =?utf-8?B?Uk1UVUNiOG1RWmJ4MjA5U0FnaEF4UkVUanMzL0RzZEI5SHF1MnUvSXhRbE9K?=
 =?utf-8?B?NStiSTZIVVRzbnV2QXBYQVBPN1hrU3F3Qi9pbmJXSXhmUUl3OXZxem54VXp2?=
 =?utf-8?B?QnEzTXdiNmYxeXhZaXdBbmZBQk4vaDdWc3BKREFIbjh5MTBKck1IcUNLTlhH?=
 =?utf-8?B?c3h3bkhaaVJwSnhEbHFGMXdha3pGM2xvR0FOUDV1aTBZWnl1d3VZaXF0eUxF?=
 =?utf-8?B?ZFZNNW5xVWdXRTJHWEI2UDNiNFI5N1FHRlg4eTd2cU5wNEtsTFU4Yk5oVHVu?=
 =?utf-8?B?UG1lVldZcWZKWXpXK3dJaElJeGtkbmVPTFRBOFFZeTJqa2lFdFhzYmNWY0JP?=
 =?utf-8?B?Q0JqMFpHU0RqeXM2UHU4QUVuQzVXUEl0WWV4SnBLZmtxQnQ5VFJYYlF6eTFC?=
 =?utf-8?B?QTE5NThHK21rb0orSmtnb0NaMzltUndLK3hJZTVyQXh1bWs3MldCUGgvOHZU?=
 =?utf-8?B?TFllSXo3NDc4c1JDV0dqRVdNaWVTUGFETk9CSWhFUWxkMXRLRmhjS3B2eXpR?=
 =?utf-8?B?d3cyL3J4Zk5ieUx4cXFlVWtmVmhlSDdqeU9DcnFwL0NxT1g0V2NQQndxOWRo?=
 =?utf-8?B?VFdvazZ0UDFqVkk1WFFncUw2OWUvYkhITTRvc2twcU9sWE8vRHdHMW4ycUFo?=
 =?utf-8?B?K0FPK2gwT1ppVUVPd2U0a2Nsa3EySFBKR1FpSm5CM1RmV2hKWElNM09OVjRs?=
 =?utf-8?B?RzlHNngzaEhnMFo1ampJUWRiZlMzdGZOUTFZS1pHRjdZdEpiMVZpRGU2WU05?=
 =?utf-8?B?NVZscWRtZkFhLzc3RzE3ZEtZNWN5YlJCSENjd3NYZnA2K2pjbDNzd0crc3NF?=
 =?utf-8?B?K2NVbDhiMURjS0YxUUcrZHhRZUEwK0xGdEtkVjZ1RjJ1YmNDVHFwdkp6dGtP?=
 =?utf-8?B?KzBEZWpmbGZocDhQQStFY3hlR3lLcDFWN1FDbkRodlVoazFLcFBESVBVQ3dt?=
 =?utf-8?B?c254VGVzWHl6bTE4RnIrTHZYQlBOVXFhZm5qVVI5bG1UQ3dpdGZpWEpxZjhP?=
 =?utf-8?B?ckV0bHRJd0VzRW5rUEM0MFErR2FBb3hMR0w4ME01NTVuNVQ3K3M4cGp6VGls?=
 =?utf-8?B?SEkzNUFKUEFTVm1hcWNZaWwyQlRQenR6Tk8wWVdKQllONVlVY3l3VTJPV0tE?=
 =?utf-8?B?aFoydnhYQ1VQNHRGazVZdjVaOC9sMXNpdWh0c1pCRUE3S0R6M1JvdTd6STZS?=
 =?utf-8?B?V2Z6bWoyMjQzWW1HRmc3OWUxVStKUnc0TU9BVFlmZFVHc1VHSHNja3c4dWl0?=
 =?utf-8?B?QmQ1cUppaUJyWHA4WFI0OFhGTlpPTWpLd0pIait5cTlJUm1zU3VsLzE1MCsy?=
 =?utf-8?B?a20raUcwOFZmRnBtQXhwb1BCK25rRmtGV1FJYytNd1BmTUN5TzVpKy83RUdr?=
 =?utf-8?B?ekdjS0ZvZUFkVUNYc3RWNXNUU24va2tWWE41QTRNSS92MTRHcjQzQVNtV0hs?=
 =?utf-8?B?RTN3bkdVTHNOOHpxcjdVTGw5VzBISEdicGUxREFuQTFRcTErQ0p6Q3lHcGRO?=
 =?utf-8?B?L3I2RjhmR2lQek5WNU9PeW9WS1BkSFB4bkZhVG5IVHhvVEtMMVlaUnhxVjhB?=
 =?utf-8?B?U1JmejRqWDB2T01xczJoaU51M05uNE5DOHhNWk9TdmNJUEFlSHJ0VUxEUklz?=
 =?utf-8?B?bVFUNHJPL0lIN1N6QXlDVll5MGZ3UG9rUXljNktVdXBTbStYTGNGUkw5bENH?=
 =?utf-8?Q?KwOLDyw5I9wgbeGgOt/iCQn/SO7JM1jk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 09:44:06.4963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97803aeb-e4a8-424a-fe04-08dca57bd5c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847
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

- Add a new start parameter in trim function to specify exact
  address from where to start the trimming. This would help us
  in situations like if drivers would like to do address alignment
  for specific requirements.

- Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
  flag to disable the allocator trimming part. This patch enables
  the drivers control trimming and they can do it themselves
  based on the application requirements.

v1:(Matthew)
  - check new_start alignment with min chunk_size
  - use range_overflows()

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
 include/drm/drm_buddy.h              |  2 ++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 6a8e45e9d0ec..103c185bb1c8 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
  * drm_buddy_block_trim - free unused pages
  *
  * @mm: DRM buddy manager
+ * @start: start address to begin the trimming.
  * @new_size: original size requested
  * @blocks: Input and output list of allocated blocks.
  * MUST contain single block as input to be trimmed.
@@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
  * 0 on success, error code on failure.
  */
 int drm_buddy_block_trim(struct drm_buddy *mm,
+			 u64 *start,
 			 u64 new_size,
 			 struct list_head *blocks)
 {
 	struct drm_buddy_block *parent;
 	struct drm_buddy_block *block;
+	u64 block_start, block_end;
 	LIST_HEAD(dfs);
 	u64 new_start;
 	int err;
@@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 				 struct drm_buddy_block,
 				 link);
 
+	block_start = drm_buddy_block_offset(block);
+	block_end = block_start + drm_buddy_block_size(mm, block);
+
 	if (WARN_ON(!drm_buddy_block_is_allocated(block)))
 		return -EINVAL;
 
@@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	if (new_size == drm_buddy_block_size(mm, block))
 		return 0;
 
+	new_start = block_start;
+	if (start) {
+		new_start = *start;
+
+		if (new_start < block_start)
+			return -EINVAL;
+
+		if (!IS_ALIGNED(new_start, mm->chunk_size))
+			return -EINVAL;
+
+		if (range_overflows(new_start, new_size, block_end))
+			return -EINVAL;
+	}
+
 	list_del(&block->link);
 	mark_free(mm, block);
 	mm->avail += drm_buddy_block_size(mm, block);
@@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	parent = block->parent;
 	block->parent = NULL;
 
-	new_start = drm_buddy_block_offset(block);
 	list_add(&block->tmp_link, &dfs);
 	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
 	if (err) {
@@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	} while (1);
 
 	/* Trim the allocated block to the required size */
-	if (original_size != size) {
+	if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
+	    original_size != size) {
 		struct list_head *trim_list;
 		LIST_HEAD(temp);
 		u64 trim_size;
@@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		}
 
 		drm_buddy_block_trim(mm,
+				     NULL,
 				     trim_size,
 				     trim_list);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index fe3779fdba2c..423b261ea743 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	} while (remaining_size);
 
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
+		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
 			size = vres->base.size;
 	}
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 2a74fa9d0ce5..9689a7c5dd36 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -27,6 +27,7 @@
 #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
 #define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
 #define DRM_BUDDY_CLEARED			BIT(4)
+#define DRM_BUDDY_TRIM_DISABLE			BIT(5)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
@@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   unsigned long flags);
 
 int drm_buddy_block_trim(struct drm_buddy *mm,
+			 u64 *start,
 			 u64 new_size,
 			 struct list_head *blocks);
 

base-commit: c58c39163a7e2c4c8885c57e4e74931c7b482e53
-- 
2.25.1

