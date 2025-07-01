Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B6AF036A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 21:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504A810E61E;
	Tue,  1 Jul 2025 19:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yD5R+3Hv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2085.outbound.protection.outlook.com [40.107.96.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72D410E5FA;
 Tue,  1 Jul 2025 19:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wL1q6U8fiejNbU6AgLdA1utc0uTdxzUwQhtfz5MrLCfSOvwL0PY5xBL5znmvjuM+9YWU76LvpPv1MCualELwmAb3gSsv2VZJXGprzV2v9+bi/qZ8QCJ62ChdmHvMyRfdGOKJKlZeR8Gwlt0/WiSo3gPD62d+uc9EhjZhS0BoU0nmij1baSDufFri+DiBSGckXIc/ZK/dMd4eqHOXh4oMcanFxZ3/ZgqQhc7grYE+8ST3lBIDPPKodzYE0L7W6iVxwglxPtySSByhNB+1pFkW6L7fd7U0iujOsISZKkLiZssZSbkWr2SlTnTxqNqBRO50l5WvEd/S4AFDfNkpj3zP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTlJQcgiFNCgRqaP7LI5g0loClqca1lELCR8oFfflio=;
 b=gwWKfKk5YevM7l20lY5FI2fgTgL+7up75RcRmj6/op5NItnNtnZC16F6wioPJBpH1mFqkBCVQU5qYrS2dakxatwQexXBVdXvZstp/AzUAqzS5ML+cIw43ICM1WTX3nmOFUY6MFhtZyrHQNenl1yUYIWZP7hIJZjglGthYhDrqqPU2hn+CJF7y0770K3S0MHvihYt/22lxvSByVW7W4no4MXLKmu9+x4D6uK0fY1l1K8rF+4/1i23xzZ0q+QvNIofelWNjtf+HqrI7HUnWHZbDdhsNb0FKiiTaJAO5/TWNjcnTamezr7tgVpPLq5WV5xavFhbud/+h4AFI/mwyGJTpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTlJQcgiFNCgRqaP7LI5g0loClqca1lELCR8oFfflio=;
 b=yD5R+3HvMrPiduNDa8asgr75KaiEiWf0iWqNXVq3k/aIADh2zVRAvKVshws2at7pxSwAyTE/SGthhHAZ/NUaDxXzOgl2k5jlS1RXClTplllyLuOV3EUhcPBqAf6CHt+iWKaOwVke5wJXzKzsEhMCoUlxZy0rpwjJsoHg0Ux6614=
Received: from BL1PR13CA0247.namprd13.prod.outlook.com (2603:10b6:208:2ba::12)
 by DS7PR12MB6094.namprd12.prod.outlook.com (2603:10b6:8:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 1 Jul
 2025 19:09:52 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:208:2ba:cafe::65) by BL1PR13CA0247.outlook.office365.com
 (2603:10b6:208:2ba::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.18 via Frontend Transport; Tue,
 1 Jul 2025 19:09:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 1 Jul 2025 19:09:52 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Jul 2025 14:09:49 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v2 2/3] drm/amdgpu: Reset the clear flag in buddy during resume
Date: Wed, 2 Jul 2025 00:38:21 +0530
Message-ID: <20250701190822.5272-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701190822.5272-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250701190822.5272-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|DS7PR12MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 195a2cee-6825-4ab5-df49-08ddb8d2db85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUtmeWRVMStSaHYzODQ1QzZFb1B0amVZSlpkNnZkYWEzTW9xMjlYZ0lSUjI4?=
 =?utf-8?B?b1MyMlhrNTg0aWZiRG9WT3p5RUp0Q2psNW8rUktOTEM2enl6anVzdnNnd3ZV?=
 =?utf-8?B?ZW1VMzVPa0duN0JLWWpiSDA0NDZJZlM4OWdxVyt2SVpwUmVTMjBqTUIzZ24x?=
 =?utf-8?B?UHZISEo3T3lGeTZIY01WcHRycXg5bTVDaHhWT1lneFJFSEtHU1pPd1hleUFa?=
 =?utf-8?B?UHl0NWlsZkhNOEp2N3lMQWVYNWlsNVZYMEZsUGs5b2dxL2RBU1dBaTNxVUIw?=
 =?utf-8?B?MlVYK2JPZ3BzV0hRSEtVeWpGK1BIQ0F2bWl4NEdEM2Q5RlZaY3UxQ1g2MGo1?=
 =?utf-8?B?SWhHMmxNRlhNQklMTVkvbUIvbkVLeUhFc3VsZkw3OElNelMyZUpNdFpSazkv?=
 =?utf-8?B?OXphc0gxL2l6RllEekJaand0eXJYR2pwbzBWVWpvUlRBNitOZUU2RVVDWnZB?=
 =?utf-8?B?RmN1aHMwWVhQdzVKamhnRTJPdkxGeGcycHVUdmJlTEF4OGwzcFpiRGQxbUUr?=
 =?utf-8?B?RVJuVXVwVHlBZkVORWF3NndmUTl3V0pqc1VhYnZMZnMzM0tiNy9HSnUzaXlw?=
 =?utf-8?B?WTlYc2wwT25waXZHa24wTWU4bm1oNGNpc29nYXpVejdDemRzR01ZRXh2YzhD?=
 =?utf-8?B?NWVNOW1oZmNlekdxMXh4UEtlOTE3SGJOZ2Y4VGUvMU9JaGZ6akZBV0pBcjZs?=
 =?utf-8?B?NGkzRFF3ckdadVhaMGRleFdyd0FpbzdOVTFsL2l5eTI0RzYxZWxaTW00L3BX?=
 =?utf-8?B?ZWRBUVdXRDJNdVVTbHVleEJrWXpBVW4xU0F0dGpVUVY4WTVvY2dEKzJrQWV0?=
 =?utf-8?B?Rm1Yb0E4MWZrdU02aGsxa2dnM0E4aExQT1g1UXFNZTM4b3g4Z1lMdHBKYnFZ?=
 =?utf-8?B?OW1OWXkxSVF2bng1ZHNHMlFGN25HekhsNkhXbGpHb0FMczJkZThNQTFuZnU3?=
 =?utf-8?B?ZGVxRWswV1NtekRZRFF6UnNpcVV4QXo2TWtqaGpXMzVpNitQUGN2VmZURTJY?=
 =?utf-8?B?Y2s3MG5EeEpqNmI5aGpIL0JKM1FzQXJQQnZrZ2REMTlJS3dCZWM1NWJYUVQ3?=
 =?utf-8?B?dWhNK0hzUVJvWlBxeExUNUYwbkgyU0NWcE00S0VSR1E0NjZ5c2FkNzFpbldy?=
 =?utf-8?B?VGpPc2NZbmttMlhFQTdnenNiQjBRcklCVEtCd0FRaURtNUFsQTJTOW9Sc3hX?=
 =?utf-8?B?Tit0NU41ekpKMzBLeHhoRi9LRjRxNDJlUEN4VWo2MUtYOWZuemdubWZqbzE3?=
 =?utf-8?B?Slc3SDJXWlFGSFF4akk3ZkYwZXNrMnBQVUMyN0hjc21jVFhPZVkvZERpRU5Q?=
 =?utf-8?B?YU5iemEzQ1JCTStXNTNpalZXalhyeHlCR3J1c0doSFVBWk1UY1J2b2RBQ0lX?=
 =?utf-8?B?c3dWT2U4ZW9lM2JHZjhkRmEzMnVXMkNRL3I0WisrSVZYcUVuQnIyTUs5Wldk?=
 =?utf-8?B?c21NZWhaZHlZRUppbmNsNXZYM2pxZFJ1R3ArNEpBb3pCUCtqVGd5NVFQUDdM?=
 =?utf-8?B?MHltY0RUL3grdU1RMVR5eTZOSjdWR1lkMmZadDVFcGQ1TE4vQ2xWVW9SR3Z5?=
 =?utf-8?B?L2w2NDNuUGpOdnB0Tk41WEl2SzVOSk1oNjB2Y0xEb21kejhLOWNqRUZqRkN4?=
 =?utf-8?B?UXloMEhua3FyQy9SYzRJaS9yUlpldHFxN3ZBZ1plTzFxMjRZMU5JYnVQeE5z?=
 =?utf-8?B?ZTY5bVZNU0Npd1YxRm4vTklyT1JPcm1pYTRZNHF2K0hkWG9FajdpZDhRNjZw?=
 =?utf-8?B?T3JCSkNSNm1tOHRZWkxTbGYxaTM0Rm1OemhQYmowdjQvT1FiUURTOW9pWW11?=
 =?utf-8?B?a1RGMWYxcTJMSEN2N2ExaHJzaE5Pd0dSQW9oTmxMRjRkUVd5N2QzUG5NUVVo?=
 =?utf-8?B?QktWQTFET2RKakFKQ0pFQys4QW9EUUEzYk5weHMzNlNURzMxbWpCYlg2VXZh?=
 =?utf-8?B?V0ZwSm1aTS85Rk1lcTdwOWNwbFBJY0o0TGdlWjFvV2FObzBhZmQwSWJOZCtN?=
 =?utf-8?B?RFdtWVN2NUl3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 19:09:52.1668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 195a2cee-6825-4ab5-df49-08ddb8d2db85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6094
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Cc: stable@vger.kernel.org
Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++
 drivers/gpu/drm/drm_buddy.c                  | 90 +++++++++++++++++---
 include/drm/drm_buddy.h                      |  2 +
 5 files changed, 99 insertions(+), 13 deletions(-)

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
index abdc52b0895a..665656fbc948 100644
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
+	drm_buddy_reset_clear_state(mm, false);
+	mutex_unlock(&mgr->lock);
+}
+
 /**
  * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
  *
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index a1e652b7631d..436f7e4ee202 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -12,6 +12,9 @@
 
 #include <drm/drm_buddy.h>
 
+#define FORCE_MERGE	BIT(0)
+#define RESET_CLEAR	BIT(1)
+
 static struct kmem_cache *slab_blocks;
 
 static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
@@ -60,6 +63,16 @@ static void list_insert_sorted(struct drm_buddy *mm,
 	__list_add(&block->link, node->link.prev, &node->link);
 }
 
+static bool is_force_merge_enabled(unsigned int flags)
+{
+	return flags & FORCE_MERGE;
+}
+
+static bool is_reset_clear_enabled(unsigned int flags)
+{
+	return flags & RESET_CLEAR;
+}
+
 static void clear_reset(struct drm_buddy_block *block)
 {
 	block->header &= ~DRM_BUDDY_HEADER_CLEAR;
@@ -122,7 +135,7 @@ __get_buddy(struct drm_buddy_block *block)
 
 static unsigned int __drm_buddy_free(struct drm_buddy *mm,
 				     struct drm_buddy_block *block,
-				     bool force_merge)
+				     unsigned int flags)
 {
 	struct drm_buddy_block *parent;
 	unsigned int order;
@@ -135,7 +148,7 @@ static unsigned int __drm_buddy_free(struct drm_buddy *mm,
 		if (!drm_buddy_block_is_free(buddy))
 			break;
 
-		if (!force_merge) {
+		if (!is_force_merge_enabled(flags)) {
 			/*
 			 * Check the block and its buddy clear state and exit
 			 * the loop if they both have the dissimilar state.
@@ -149,7 +162,9 @@ static unsigned int __drm_buddy_free(struct drm_buddy *mm,
 		}
 
 		list_del(&buddy->link);
-		if (force_merge && drm_buddy_block_is_clear(buddy))
+		if (is_force_merge_enabled(flags) &&
+		    !is_reset_clear_enabled(flags) &&
+		    drm_buddy_block_is_clear(buddy))
 			mm->clear_avail -= drm_buddy_block_size(mm, buddy);
 
 		drm_block_free(mm, block);
@@ -167,7 +182,8 @@ static unsigned int __drm_buddy_free(struct drm_buddy *mm,
 static int __force_merge(struct drm_buddy *mm,
 			 u64 start,
 			 u64 end,
-			 unsigned int min_order)
+			 unsigned int min_order,
+			 unsigned int flags)
 {
 	unsigned int order;
 	int i;
@@ -178,6 +194,8 @@ static int __force_merge(struct drm_buddy *mm,
 	if (min_order > mm->max_order)
 		return -EINVAL;
 
+	flags |= FORCE_MERGE;
+
 	for (i = min_order - 1; i >= 0; i--) {
 		struct drm_buddy_block *block, *prev;
 
@@ -198,7 +216,8 @@ static int __force_merge(struct drm_buddy *mm,
 			if (!drm_buddy_block_is_free(buddy))
 				continue;
 
-			WARN_ON(drm_buddy_block_is_clear(block) ==
+			WARN_ON(!is_reset_clear_enabled(flags) &&
+				drm_buddy_block_is_clear(block) ==
 				drm_buddy_block_is_clear(buddy));
 
 			/*
@@ -210,10 +229,11 @@ static int __force_merge(struct drm_buddy *mm,
 				prev = list_prev_entry(prev, link);
 
 			list_del(&block->link);
-			if (drm_buddy_block_is_clear(block))
+			if (!is_reset_clear_enabled(flags) &&
+			    drm_buddy_block_is_clear(block))
 				mm->clear_avail -= drm_buddy_block_size(mm, block);
 
-			order = __drm_buddy_free(mm, block, true);
+			order = __drm_buddy_free(mm, block, flags);
 			if (order >= min_order)
 				return 0;
 		}
@@ -336,7 +356,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
 	for (i = 0; i < mm->n_roots; ++i) {
 		order = ilog2(size) - ilog2(mm->chunk_size);
 		start = drm_buddy_block_offset(mm->roots[i]);
-		__force_merge(mm, start, start + size, order);
+		__force_merge(mm, start, start + size, order, 0);
 
 		if (WARN_ON(!drm_buddy_block_is_free(mm->roots[i])))
 			kunit_fail_current_test("buddy_fini() root");
@@ -405,6 +425,50 @@ drm_get_buddy(struct drm_buddy_block *block)
 }
 EXPORT_SYMBOL(drm_get_buddy);
 
+/**
+ * drm_buddy_reset_clear_state - reset blocks clear state
+ *
+ * @mm: DRM buddy manager
+ * @is_clear: blocks clear state
+ *
+ * Reset the clear state based on @clear value for each block
+ * in the freelist.
+ */
+void drm_buddy_reset_clear_state(struct drm_buddy *mm, bool is_clear)
+{
+	u64 root_size, size, start;
+	unsigned int order;
+	int i;
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
+
+	/* Force merge the two dirty or two cleared blocks */
+	size = mm->size;
+	for (i = 0; i < mm->n_roots; ++i) {
+		order = ilog2(size) - ilog2(mm->chunk_size);
+		start = drm_buddy_block_offset(mm->roots[i]);
+		__force_merge(mm, start, start + size, order, RESET_CLEAR);
+
+		root_size = mm->chunk_size << order;
+		size -= root_size;
+	}
+}
+EXPORT_SYMBOL(drm_buddy_reset_clear_state);
+
 /**
  * drm_buddy_free_block - free a block
  *
@@ -419,7 +483,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
 	if (drm_buddy_block_is_clear(block))
 		mm->clear_avail += drm_buddy_block_size(mm, block);
 
-	__drm_buddy_free(mm, block, false);
+	__drm_buddy_free(mm, block, 0);
 }
 EXPORT_SYMBOL(drm_buddy_free_block);
 
@@ -566,7 +630,7 @@ __alloc_range_bias(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block, false);
+		__drm_buddy_free(mm, block, 0);
 	return ERR_PTR(err);
 }
 
@@ -684,7 +748,7 @@ alloc_from_freelist(struct drm_buddy *mm,
 
 err_undo:
 	if (tmp != order)
-		__drm_buddy_free(mm, block, false);
+		__drm_buddy_free(mm, block, 0);
 	return ERR_PTR(err);
 }
 
@@ -770,7 +834,7 @@ static int __alloc_range(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block, false);
+		__drm_buddy_free(mm, block, 0);
 
 err_free:
 	if (err == -ENOSPC && total_allocated_on_err) {
@@ -1051,7 +1115,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			if (order-- == min_order) {
 				/* Try allocation through force merge method */
 				if (mm->clear_avail &&
-				    !__force_merge(mm, start, end, min_order)) {
+				    !__force_merge(mm, start, end, min_order, 0)) {
 					block = __drm_buddy_alloc_blocks(mm, start,
 									 end,
 									 min_order,
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 9689a7c5dd36..8b5273d4b2d1 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 			 u64 new_size,
 			 struct list_head *blocks);
 
+void drm_buddy_reset_clear_state(struct drm_buddy *mm, bool is_clear);
+
 void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy *mm,
-- 
2.43.0

