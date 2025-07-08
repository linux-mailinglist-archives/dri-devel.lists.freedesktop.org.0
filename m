Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980B9AFC359
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D1E10E59E;
	Tue,  8 Jul 2025 06:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bEIW6YPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F9410E599;
 Tue,  8 Jul 2025 06:54:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qC/uCCkWyf3Q/N5VaRvVzO1oIkR3D992n3xHE5fQB44VgqEDHQhF4m/b1W+ErQJJSlUERSbWLBPNNNjJ1hYHULCq2Xbr4+uG8dkXFT/obhbHqm6iCU7IrmYL/E/8x6XlhN4m+D+RJ5F6SZe8pOb4bDM3zdW2yPNe9D0kSUv1UamcoAKuTrI4Ve8/NFhOT/X/pBkv+2q3J4F4tAnDSJlb3VHcfOF6C4if2TgjfNu205niJGWXqLkGLbr6rskJHbv9RBjesMylyWCat36/aemP0TUF6WK0cQKTO/voPhBIgOQYAC7OTT2quJav7RIvgrgGxGJ8wqZD4GhCZjofIhpHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiEcW/LjwsIEouZYH7qDRyabPaGDx1yAYLDR3ZWatWY=;
 b=S9dHP+WUhS3tkoCInBXHpgn15egg3nL1sA212awARYl3qTqonf9OFT65a4T6UefJGmkcXQVrz3Xyemu3U5gfozAYqwbuSlJIZhA5WBpph60sEi9iPvj8yeaLUhsRbFCAcrSGbogfhg/DrXzpBwmUZPQAQIP1t6gtLqAYPEjfqJLBMPaTZ5jpnb0KzznSS5Jf0x1cHRJwpdFWFNq051eFCqq94KAdr0MwoSs3se9ivlW/SZzT2T9LVEA15cy3GI0P/qy9PnIi/BWhuWHE8BYHorJKz5ikKE0whtFWYGS5eTwXWXGH82LrsmV+8Yz4SGoCY2Rjq62YgX00+YZFmKgDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiEcW/LjwsIEouZYH7qDRyabPaGDx1yAYLDR3ZWatWY=;
 b=bEIW6YPXcVm7TCLy2C50ys2zjecevgo/EVpznC4LCXkR99fJo0KxRhDG6cC6HJFuDQZSCX5sGkTtbaV5/eDbGTTgoJJ/DqXRsTvnQ/uaOUlqsuik4yK0TTChoW5u/zerdK5E2nn1IJK4o/Oz3BHYm3SNbRrJYc7lVXanv1RYIB8=
Received: from CH2PR05CA0053.namprd05.prod.outlook.com (2603:10b6:610:38::30)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 8 Jul
 2025 06:54:27 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::8f) by CH2PR05CA0053.outlook.office365.com
 (2603:10b6:610:38::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.20 via Frontend Transport; Tue,
 8 Jul 2025 06:54:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 06:54:27 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Jul 2025 01:54:24 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v3 2/3] drm/amdgpu: Reset the clear flag in buddy during resume
Date: Tue, 8 Jul 2025 12:24:03 +0530
Message-ID: <20250708065404.4185-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708065404.4185-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250708065404.4185-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|SA0PR12MB4381:EE_
X-MS-Office365-Filtering-Correlation-Id: af577e91-0680-4a1d-7bd9-08ddbdec47e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0lKdE1JY1Rab3UyN05vdVE3SnhXVGJyaE9PL3lUdXZHZTRxQWdqSkhEYXpx?=
 =?utf-8?B?UzI5SEpJSHpMUDhscWlHMlpxQ0JjaWJTK0dXTTZ6bmtkU2RCY0wxNlBiRUVm?=
 =?utf-8?B?MGJSYVBHTzBSZWFxQ05iQW95U0ZFdVB3OWh1ejlBWmUyaGlSQXNiVDdZOWpz?=
 =?utf-8?B?TlZ2YnJHb0RTTGZzeTdUOHVxTjJlQmJSUGhpd1VCYXFBdThRd0RKdWJsTkhZ?=
 =?utf-8?B?MS9HRG9MNjEwYmVLV2R3NkhoWTZ3YnQ5TVFvOE9haldCNzFRZWRtb0toeFhB?=
 =?utf-8?B?NURmdzk1SWh2OXFtWnAzVXd5VW1rSjdVQ01ENmtlTUhrQ0dXL1RQb3dsUWxm?=
 =?utf-8?B?eUdqMlhYVTFERnhBQVl0STRpS2xjSmVXbWN3M0tDT0hVWUhnTUdPU0RXMm1p?=
 =?utf-8?B?U3dvK2lqcE1lT0VQTHh5RGRpRnl4TVdYcnZ0YUtBaEJuOXIzSEZjTFFDOEZv?=
 =?utf-8?B?L2h5SUpJWitXajF4djlMZkJVOUhzZ0ZWUzRrRVNRYW1rRVY5dVdWME80ZFhn?=
 =?utf-8?B?d2VUV1FzQmUvMmNZc2Ixb2tKTm9aRUxJd3JaMEg1QlNSaGMxblE4ZHdYVjBi?=
 =?utf-8?B?RHhzdzJVVXVpQnUxcXNkTTU4bXlXbE1EWHp3aUpDN2Vyb2FseG1HeUNxV0ho?=
 =?utf-8?B?NVJ3Q3VQTjVQcE9aVjFGck9tQ09hSTExcWwrR3hsY205d1YwS3lNdnJjK3ps?=
 =?utf-8?B?UDFTa09iZUhWYXBoUzJ1REoyemJybDMvRWxGNU5lejZJL2s3UUt3dU1Hd1V0?=
 =?utf-8?B?eFFaVWlibHVEdkU5WkV3MllVemZ1UDFMclZVR2VyMktrdEttbG9YNnRiQ3BP?=
 =?utf-8?B?Q1oxS3lvTHdhdmFBNGQydzdwQmxDVUNRaE9yNVdhMmpxMVluVXp5S2JYSURK?=
 =?utf-8?B?eE5tMnRRdkhQa3dubEo0alMxYmVFTU85Qmk2Z0hZVWdoSmVTZ1htalZQcnZz?=
 =?utf-8?B?MklpMHRwL01GdFI1aVlueUQyZi82ckFpbGo1ZzZyMFZBa0UvMXRsZU81dmhk?=
 =?utf-8?B?QmlIdUI0cXgvaW90ZmV6SkhKNmpJVk1GSlg5UTV4cmpNT0cxWUJLSWhtRDFI?=
 =?utf-8?B?SU1VTE90N2NRMEF1d2VGdTh3Zi81QjRWbG1GQTdqZnYxVTZTQ0FwYTlWaC9V?=
 =?utf-8?B?SFVRam41SnROekxXLzNnaWxpcXlOdW5pSTVLb0QxWHRPUit5ZzdhM2MxdHQy?=
 =?utf-8?B?R1EyWE1UZCtUZ2NrOEYxSnpCZ2Y1UEk4RURMcUNTejlkaGlEdG1vbFlEak14?=
 =?utf-8?B?Y1NmWXo3NndiRUZEMGF5NlF2V0tiS2c0ZEhDeVV2TTJrWHFhSmVyZXdKeGQz?=
 =?utf-8?B?dmF2SStKMzQ1ZkRTc2d2YkwzNDVyZmJRczhPcVBmdkZieVo0UXArOHBwZ1di?=
 =?utf-8?B?TE8rSTRGOFA3dTErelhIazRkS2VQT09GZndYZERDK1NjdEJiSjZFaHJBZHlX?=
 =?utf-8?B?dVpRVHRjeXFITFhRb25DZmNaZXJlM0dUUTViRUtYRCsrUkNEaFRqUE5Id0dW?=
 =?utf-8?B?RnRqUmozeEd3eGdCakdJOHFCUlFDbnA5NTJoUlVyOUx4bTM3NTNXeldhT2Q3?=
 =?utf-8?B?Z0pmOTA4NDQ3bDZPYjNGSE1OcmZQd3IrNDR6WWdpalFBV1prRG0xWWc1T0lX?=
 =?utf-8?B?MytHWm14RjNWbmpoUTloVlVOUUJXVldLY0xnblNRd1drbjFCUG5VbEVDRDhB?=
 =?utf-8?B?dGYwbFBES3prd012MmpBekc0Rm5adVFlTDM0NjVOTTRBdnZwL05qekFYY1VI?=
 =?utf-8?B?azZIRlo5UHRqZW8yYkxTNENibU95MkxaL2hiVTBwbmpXNkg5cTRqQ1JRNzhE?=
 =?utf-8?B?TWJoM0tRQnZnMmZFTXBrdDhvcXZLK2lkVGtJZS9LdEkvYVBrWk4vdlhIdjht?=
 =?utf-8?B?SGppbm1oTEs5Q0VaVmtPanM5cDJwSXdoaFVHU01CY01Ra2tzZ2IzZHlGRld3?=
 =?utf-8?B?RUdnM2N3bW11RGtWalE4eUNPcE1RNmtxS0VCTEt4azZWenIyWThtakhEVVZq?=
 =?utf-8?B?dXhHM2Jpd1dnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:54:27.1612 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af577e91-0680-4a1d-7bd9-08ddbdec47e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381
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
index a59f194e3360..b89e46f29b51 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5193,6 +5193,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 		dev->dev->power.disable_depth--;
 #endif
 	}
+
+	amdgpu_vram_mgr_clear_reset_blocks(adev);
 	adev->in_suspend = false;
 
 	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 208b7d1d8a27..450e4bf093b7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -154,6 +154,7 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
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

