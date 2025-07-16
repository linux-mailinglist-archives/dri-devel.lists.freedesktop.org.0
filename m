Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F45B06F70
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D0110E6D5;
	Wed, 16 Jul 2025 07:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZVIGpNGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E3010E6D5;
 Wed, 16 Jul 2025 07:51:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/mWtjk+34dxaBM77ki2faQEFOm2FeoCsj16Ol8i4bmjwDf/rbwoGN3OxewW2pwKIeqORapU+Fe1qxg4B9mU/iG8HTc9p6LjJj3p2KDIsZKvOoI1iowsuftc4QQP+1MhWq+Yv5JehxCKP9QX3AX0jWRYio5TEQRmAWfVc1SEBfIzY9LAgh/bfMRNszMHN7HX4XnaFpHrDzu+npbqAO3CwY1qtZNZxROZvEPyHNFHbS6Sst1VqcBsE+AyPchl2UujP9Suncw+19EH+xw6BR+qXQqO50DwW02H2d495uJdT6aQERNOHVD/LU2B7kA4JyoUOG4/MUMBJQP8UFUbvL8dCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vi7+SahXLnzMjjJOwEPRbcxqDSVPsM7BDE/IoB5CjWA=;
 b=k9QUVpV55Y/m/W/6g1Nz6pbTBGcB1OU6oaZMkQbxD8nutu49x1EfNQe8zq7/kXOjnz5QsEOOnaCi/vu9jn7D5Ua1xQZHFxXRq1onWG9bXjeXNFVX7NZVAwueGcDI/p1QPnys3Fbk8kIvGkYLASpro5Zp93RM7WJCH8/SEZ4lzktdz4BeVTx57SnpMLKxgGLvnuhulrqAYJ0t/2rAmNlR1UMmpTDGAk/l8Iieokfvf64Ru43jSzaloEkSeZCpPAS6brwZl0cRvpwE9S7OPiSCpZRik+64UqYO16IfopHcTwzrippjlOXaMc8NToqBL6Lr8MNzkvieul2W43Em3B0SPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vi7+SahXLnzMjjJOwEPRbcxqDSVPsM7BDE/IoB5CjWA=;
 b=ZVIGpNGuWda08of4p5m4/BB5qByZVGl5H/cPGcsD7SXA9PHJiIhQyhHuZnM5Or9kgJEg4iCTD4YQMYFip/rp7ibhyM6lwEdc5Zy/VrzPL3AtpWCx0OQgPAAbl38HTiuXcN0bIzt6EWI56Rnl70nuAGD8cDyjrmbJSyhUzB9P8dU=
Received: from BY5PR17CA0046.namprd17.prod.outlook.com (2603:10b6:a03:167::23)
 by SA3PR12MB8762.namprd12.prod.outlook.com (2603:10b6:806:31f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 07:51:47 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:167:cafe::7b) by BY5PR17CA0046.outlook.office365.com
 (2603:10b6:a03:167::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 07:51:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 07:51:46 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Jul 2025 02:51:42 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v5 2/3] drm/amdgpu: Reset the clear flag in buddy during resume
Date: Wed, 16 Jul 2025 13:21:24 +0530
Message-ID: <20250716075125.240637-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716075125.240637-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250716075125.240637-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|SA3PR12MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: 65fc0186-e4c6-4ad7-b3d6-08ddc43d9d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2Q5TnpPendMNXRNdkZ6RUxWc1JEamdTZDAxK1JqSVpaWkwvSDhCZ0dwRm0z?=
 =?utf-8?B?Mk1zMmNNRkpWSjdaZE1aMUM5VGNpVVVxTDkvaXJtdmo1d0J2Qng4d3BBOTdF?=
 =?utf-8?B?UUJLWmYyeUQ4Q0xJeTVPM25hb3hSVHAvL3FHbHRNeFJPanlCNjgxSGVUYlpS?=
 =?utf-8?B?ZTRHMkF3OGpidUNFNEp0ck1tdGJWK3NLMXVuZ0ZoN1RlaXcxZ2o0aUxOdmZq?=
 =?utf-8?B?Mko0TklEMEZnZGFnNmd3NDZjMko5NDV5ZGdDbDhtYUhhb2dtMGZ6QUV3TXg0?=
 =?utf-8?B?aXZlSmlNNmpLMVhmZFB6VHdrUC9aZUZSdjlwMDNTSTJvd3NIOTVzZmRSeVZ3?=
 =?utf-8?B?d3ZpZGFIbWEzZ3c2N3hhVERTdWVBR3VTY0k2NUJ3Z3REWGxkS096UjFaZW54?=
 =?utf-8?B?RkNNaWt0VDhPMUI5OENldlFEdFVUOWlxU0lqWFNCQTNTa1ptT2FzZU4wN1pF?=
 =?utf-8?B?WmR2cDBqbnNRam5MaXJqUFpXREJGYU9pTmNUdTlkV0xOWmE0RnQ0RHcreDl5?=
 =?utf-8?B?TmtEMjRmOVhIRW9qemg1ak5WampsMHNUZ3F5U3hvZG9xL3FEUGV4TkE2NVdI?=
 =?utf-8?B?dTZtOTB4NnFLWE96ZXdYK1lqR2dKWTlZc1hodTZPZ2lYQkFuVHNLYXlVTGZo?=
 =?utf-8?B?WHZ5Y1B6eDNzTitOdzZPcllBS2hEVWdSZ1M2dnFNTW5nandLUjdhNkhhczVH?=
 =?utf-8?B?NksyVVQ1eGpNL1ZPUUYvcFllREJCYkRLM3Y1b3ZZV1NiVDNIK2ZyM1ZFVmxT?=
 =?utf-8?B?VWREcmZoeEs2MS8wNEVGM2lhL2wzb3BSdjBzR09kMmJXSXpvdkRabkM2UzlK?=
 =?utf-8?B?N3NUZDBRdWhjUy81NkhleFpCN3F0VU9mb3ExdmFYUTNiOGhLRmF0S0ZjZVQx?=
 =?utf-8?B?bmJ3dWg3UG5OaHJKQm5nSnJNbTZFQVE4b1dhZGZWR3pRY0hOV3liK09SS3Vl?=
 =?utf-8?B?Z25BeUFzR0xsTUE0M2d0bDM5OGw0QWlXU3F4cmJ4aUxYUGNSeEtrTUtqbVFk?=
 =?utf-8?B?SmcxeHlSbE1oNC9udWxrNUpsQW4yOWc2dy83RW9ZS0xIODBXOUVBcG5keXpX?=
 =?utf-8?B?K3JvV2R2bTU0WGdJSCtDckV0aHpTY1owYnR3TS9DSnRKRUdDMWc3eFd5anFW?=
 =?utf-8?B?YnFNUGp0c0FZQTh1K2tSbENIWWQ5V2g3Z002WE9hbmlZcGt6TFdvVG5UeUVN?=
 =?utf-8?B?TEpoSzBTOWhaVks5WXJJUHhTa3ZQWjNZVFpXQVFkVUNUTHc2Q1BzejdHT243?=
 =?utf-8?B?RkZOTVdyWGVPNEh2REVzLytudDRrOEZCa1RTQzlhNEtVMWJYU2RnMUhMaWxy?=
 =?utf-8?B?SjlxYXdsTytsUWwwSU9KUCsybXF4MGVkT0ZEWFJSVHhKZ1AydXpjL01rSXhN?=
 =?utf-8?B?akt2djlBVkFNTE9LSVYwUXY3UDFTS1R0RGgxek5wUThKT3pwOVB5akJhUGlW?=
 =?utf-8?B?NTQxT0pjckJBTlpHOGoxOUR5eUtCemFuOHRMYkQ4MDRvT2pRMmZMRjRpdmtB?=
 =?utf-8?B?VmpBdVF6cEY3TWdzbE4rM2ExRlpFcWFjdWpHMVFzYzBwSG1tMC8wQjA0L3I0?=
 =?utf-8?B?MjBPRDNxWncwMjI3UDg3SzRGWVFpVlJVQ2lqNkpBYTFUdjdCTzN4R29wRGFE?=
 =?utf-8?B?NVlNNzIrMU9xVXJxa2dMdjNuREdDcWJDbEVHZkp4QWIzUVAzb2Z6WmhERUY4?=
 =?utf-8?B?NENhQ25STzRXbUsxV040bE5ZL0Z4Vk9IRUszQmVoNnJ2OXhFRVBXMWoyckpD?=
 =?utf-8?B?VTkrNnlmYllSUTg1NkJJckZzdjY0V0o1ZUN3SCsyTWZIYlZPYTl1bzhyV1Nn?=
 =?utf-8?B?Znc5dlpoblpldkM4dDk5M3V3NjZJNTIxUkNmam9rWnhReForSU1OOWdvOEdL?=
 =?utf-8?B?YWp6Nkc5Zi9TOEk2eEJ5am0zbFhxZC9CaXNCb2RBTTNTaWdaOXFTcTNmWGRZ?=
 =?utf-8?B?ZlRwNEpaNHkxVEJsRXBQckx4ZEhmL1hFVEo0TzdkV1BlVzEwSXVSN21KMDRI?=
 =?utf-8?B?SFFvZUhDb2pRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 07:51:46.6959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fc0186-e4c6-4ad7-b3d6-08ddc43d9d57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8762
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

- Added a handler in DRM buddy manager to reset the cleared
  flag for the blocks in the freelist.

- This is necessary because, upon resuming, the VRAM becomes
  cluttered with BIOS data, yet the VRAM backend manager
  believes that everything has been cleared.

v2:
  - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew Auld)
  - Force merge the two dirty blocks.(Matthew Auld)
  - Add a new unit test case for this issue.(Matthew Auld)
  - Having this function being able to flip the state either way would be
    good. (Matthew Brost)

v3(Matthew Auld):
  - Do merge step first to avoid the use of extra reset flag.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Cc: stable@vger.kernel.org
Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
 drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++
 include/drm/drm_buddy.h                      |  2 +
 5 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 723ab95d8c48..ac92220f9fc3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5327,6 +5327,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 		dev->dev->power.disable_depth--;
 #endif
 	}
+
+	amdgpu_vram_mgr_clear_reset_blocks(adev);
 	adev->in_suspend = false;
 
 	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 215c198e4aff..2309df3f68a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -155,6 +155,7 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
 				  uint64_t start, uint64_t size);
 int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
 				      uint64_t start);
+void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
 
 bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
 			    struct ttm_resource *res);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index abdc52b0895a..07c936e90d8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
 	return atomic64_read(&mgr->vis_usage);
 }
 
+/**
+ * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
+ *
+ * @adev: amdgpu device pointer
+ *
+ * Reset the cleared drm buddy blocks.
+ */
+void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
+{
+	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
+	struct drm_buddy *mm = &mgr->mm;
+
+	mutex_lock(&mgr->lock);
+	drm_buddy_reset_clear(mm, false);
+	mutex_unlock(&mgr->lock);
+}
+
 /**
  * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
  *
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index a1e652b7631d..a94061f373de 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
 }
 EXPORT_SYMBOL(drm_get_buddy);
 
+/**
+ * drm_buddy_reset_clear - reset blocks clear state
+ *
+ * @mm: DRM buddy manager
+ * @is_clear: blocks clear state
+ *
+ * Reset the clear state based on @is_clear value for each block
+ * in the freelist.
+ */
+void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
+{
+	u64 root_size, size, start;
+	unsigned int order;
+	int i;
+
+	size = mm->size;
+	for (i = 0; i < mm->n_roots; ++i) {
+		order = ilog2(size) - ilog2(mm->chunk_size);
+		start = drm_buddy_block_offset(mm->roots[i]);
+		__force_merge(mm, start, start + size, order);
+
+		root_size = mm->chunk_size << order;
+		size -= root_size;
+	}
+
+	for (i = 0; i <= mm->max_order; ++i) {
+		struct drm_buddy_block *block;
+
+		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
+			if (is_clear != drm_buddy_block_is_clear(block)) {
+				if (is_clear) {
+					mark_cleared(block);
+					mm->clear_avail += drm_buddy_block_size(mm, block);
+				} else {
+					clear_reset(block);
+					mm->clear_avail -= drm_buddy_block_size(mm, block);
+				}
+			}
+		}
+	}
+}
+EXPORT_SYMBOL(drm_buddy_reset_clear);
+
 /**
  * drm_buddy_free_block - free a block
  *
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 9689a7c5dd36..513837632b7d 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 			 u64 new_size,
 			 struct list_head *blocks);
 
+void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
+
 void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy *mm,
-- 
2.43.0

