Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D43B06F38
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D668D10E6C1;
	Wed, 16 Jul 2025 07:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pllafIlo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D10410E6A4;
 Wed, 16 Jul 2025 07:41:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ec3gRUlf7sLT+m22bxlYaEeIfZzd/M4nuUmc3JBaey59JYRd7UX7JLma0bNVwtrDa0V9Xd5A2fk/sbca3EtnoazjjgC7gqXtPR+tq/SC4jFdbyxNOG014aveXa8FMIzJkc9ERKEXLQ7yfsO9gmE3OAZqIoufBB/Gk+eLQuAHK/ZuE/4mpN8HBVvCgf7vutJ7TJOZO1/2zygRWpQG0PXxSkmL9MM08ciGmgRQgrbtVAKxf8cmOEnoKNOJiIzJBookh2ndZqjMibX6CsIsYWKLNFRIw3t8jqKrsdHN39fyYI8OjoMsH9E/T0y+E0TPEITzOruiLu92nI2e+FlAMWcHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X55Z+/E/+Hw5FBhzr2LqytCyCsA65I31LzhBfdaIrug=;
 b=OqdjUuuzl7fSwvGxrL2jz5s5ROekPY1IWl+IyipD0SbnI/LaC28X5j7UEEkrZlIAsyUv/sy8yl3Ggm61mWq1TShD11W/eHl5Ti7w1q+JVZXuSEExIHD7QrzxYLBIX9Le2p548Ju1azVFpfOkSIo5AhmPv09xSJKMN0d2gTFdHRWIyUdHmQu5zGPI5GFacS8sFkiqiMao+UduLF53H7mpVun458KR2ZaUxFOMBTQmR82pfo/nz6wOW8HOm+FlECYKX3ZiwfiBpcMXorcGXKbY7f4QiAQPsDV/Ec79v0lccoE47tcSXXJhrD6awpmgl3EqLKgkWCCvaUmndff3RLn1lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X55Z+/E/+Hw5FBhzr2LqytCyCsA65I31LzhBfdaIrug=;
 b=pllafIloZS1wNat0ZOVfi7TucNx/mW34HPkBo/cvIA5WWXrmNrQ+veq/41l9Ni6qFXfW8eFOR6Tx+RidY3R/WZ9I1iCS/yLXkSCdDZeFjkdLuPq5NinEs+DmTQfSXPJMDT4i4cjkDbNaq87gD3tK6ESTW4r1xZUoTLuhjAMjjQ8=
Received: from BYAPR06CA0029.namprd06.prod.outlook.com (2603:10b6:a03:d4::42)
 by MN6PR12MB8590.namprd12.prod.outlook.com (2603:10b6:208:47c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 07:41:51 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::4f) by BYAPR06CA0029.outlook.office365.com
 (2603:10b6:a03:d4::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Wed,
 16 Jul 2025 07:41:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 07:41:50 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Jul 2025 02:41:47 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v4 2/3] drm/amdgpu: Reset the clear flag in buddy during resume
Date: Wed, 16 Jul 2025 13:11:26 +0530
Message-ID: <20250716074127.240091-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716074127.240091-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250716074127.240091-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|MN6PR12MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a5f062-79b9-410c-74f1-08ddc43c3a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bC82SVJhWVd1ZnVBY3NKR2xpQnJXVmJBeXJTTzRrN0FCMUR1V09PNFlmdFFX?=
 =?utf-8?B?Z1FhdE0rVTMyRHYrTTRoM1hXRC9GZG4xRTBZOHV4QUdYNXJaZldTOENNeDhQ?=
 =?utf-8?B?VnZseW00UUNzUmFOUFdsQ1ZLTW1YRmpTd3ZFbklid0E1TFZxaEh3bzlZSU9q?=
 =?utf-8?B?RjRhYVJ1RGs1UE14S3pFREpQSUZGaEF1dVo1QnUvajdaa29pZktQUzlDMHY0?=
 =?utf-8?B?UGY4WUFDZHZWMTIxZkZ5dG4xUjVUOUhBb1kxSW9jQ2huN1pTY3p4VHRxSWJM?=
 =?utf-8?B?Njdtd0JVZ25RZUJKSFhYbXRVMnNTbFVWNU5weS9mN3gvR1FyNkQzSEhPU2Yz?=
 =?utf-8?B?RUlGNkY1RGh5Q0kybWpySUlialAxakdPUDdSdHpKMDc3OG05elpLL0d0NXRN?=
 =?utf-8?B?d1JONnZZTHUyMGVPdGlneTF2amdTN0x0T3FBT3poYXFXTnlUU01LUzN0dGI0?=
 =?utf-8?B?ZUpIM2s5L0hMVGExT21raHBtYUNzWlJNa1VnWjNZeXFQaW9VRFVtZ1JGenho?=
 =?utf-8?B?TlV4N2xPOTBaQ3dNWUlYWXJMQS9xdzZoTGl1WVg2eVVZaUJkeGNlRm41WVF5?=
 =?utf-8?B?enZrVm1DRTVIODdGcmtqTXhOaUlXMlJlWHo4UGpkQXJWellVcVhlaHBmUlZM?=
 =?utf-8?B?T0psRzlJa3pxVy9wZExJQWRBZWVLelJadm9qdDBRc1daTVdKL2dhakFLcFhm?=
 =?utf-8?B?OCs4NVlJcGdTWU94V1REN0V3bGlPNXdxeU9oRDNSVEl2TThxLzlVeHlHSVJE?=
 =?utf-8?B?ckF2UFl2UmRpdXRWZkNmUDNySFNqak5wZEw4RDViZGtyVWV6dHhOQ3dmL2F1?=
 =?utf-8?B?K0dDN293UHBmZnkxbUw4YXJ5V09yYUU2MkJwOU42eTlIWDVQeVJBTG50T0Jk?=
 =?utf-8?B?SHJocy8zdWZRSVdaZERNVE1xNWRwbEx3YnZ4Q1hjQTJteUFkWXVBeGdoTEJp?=
 =?utf-8?B?L2VuRkFpY0lQMjY4TGIycEF5emdJZVNia21LWDRMVUZXTzV1R1M1eVVveE1J?=
 =?utf-8?B?eWF2WWpRSlFnYytGSjI1MUIvVjIyRU5WR2NaZVFSc3RUamlVdTFyWGJSUlJG?=
 =?utf-8?B?SmlUcUZSci9QWUtuY28zb0dnR285QWNKU3dOVWZBTnhrV3dxdXdoUlVIR0pl?=
 =?utf-8?B?c2tNSWExLytpN0U5c3FFSXZwY1lDTzU5VXN6anNzM2hWeHNBUVZwWlJaR1FS?=
 =?utf-8?B?Q0Y1MHoxK2hCa0tJWERJVVA3bkRJZFZ2K3EvVDBaM1dWY21wZkhUbWlhTi9t?=
 =?utf-8?B?dllYelFPYUxIbEVBWko0Z1A5SDl0RElxTTRSbU1na3F3MUlGYVpZVmJ3NG5C?=
 =?utf-8?B?MXl0TERrRTZjWGtFd1prNXk5cURXYVk2UHlselBhaG5FOUViT0tDNDh5TEtM?=
 =?utf-8?B?d20xdGdoRVVwbmRkd01XUWJvYzhzYUpWcFNUQit6NmMzTVA0N3NxQldEaU4v?=
 =?utf-8?B?NFdGQXBUeDlHNTVPMExUZDNadkFBR09PN2E5dkppKzJvS1NmT0lkenB0ZnBy?=
 =?utf-8?B?aHlQb0UzaGs0MU5yUmorc2dCNVBTV2JjSzdYQ0JGWW1QSWV6QU5TSnhJOFFK?=
 =?utf-8?B?cVkvN0F2RkltejE0V1hIU3hMRmc2NEJWTDljTG5mZjV3VmROZUlyMStrNENY?=
 =?utf-8?B?WFpLc2taRmltL3hsSTg4L01YNlJDb3ZCTUVoczRmOU5LUXNyNUVPekphbStO?=
 =?utf-8?B?L3pUQVg0dVV1VTQvWmp2UmFIcmJFZ01SZnhjK3NWMjVZaGJldk11UU1HaFhB?=
 =?utf-8?B?N0FPazhycTVSWWxsQk9sUndoQm5LenpoelN4UWMzd0ZmUmFhYWpad3ZhRVF0?=
 =?utf-8?B?ZjRLeW1nYWtWTngzSjVUUndMU1ByRW1OVXkvUjZBbUZqVi9YT0RBVjlCNmEr?=
 =?utf-8?B?U3h4NmQvaDVtVzhKTUVXNTZpS2xrUnFoYW9EelEySkdkYkNYblhkaHFSWnpn?=
 =?utf-8?B?MUR6dWJFOUNaN3hjajZZem5MY3QzMG42U0FXWVFCOEVMK0NkWE9GWnpvQkZT?=
 =?utf-8?B?RW1sOFM2YzFRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 07:41:50.6112 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a5f062-79b9-410c-74f1-08ddc43c3a0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8590
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

