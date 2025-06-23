Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E1AE3537
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 07:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943D410E168;
	Mon, 23 Jun 2025 05:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="De42k/io";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1213110E168;
 Mon, 23 Jun 2025 05:53:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4TTnSIy3o+QpFTTg9kLqkkq34NwYWO4wWo0mMbaAj47T4p4PQyXm2QMD/hXL+vr8lgaVTA6S5/a0picbXHH1kW/nZXYCCvcOtP3p+PrPvTuqwbD+BFSqx+t+cRc/eFQt+yQkG/3I/F2SC8TV7yp2SL+J7VZvND0X6xrGNbIwwDdk+hsOldp/lI8QBnFtPfWXS61NaAQL7dsEcl4HjqvhKiuk0U7eSq6ch8FkFwyGHlupRckJ4kcoxCUU0J4VvJqpG3e2S6zkWRG/S+IKJPLVEtUBUndYDzMJVSNose6WbfRA8SUmTs440TsFleQpe5+A55MwGKgzosBeFmxKq2gQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjAn9o0t8b60HZD5zLThY4ESzC2SoWhpQrb/6w1DF5Y=;
 b=p7UdZ1QXp99aelhRPAZnkMps9NpljZkptYT42OKDTavtt7/4RMfBaveBP3bMJ+9mYuqTEfBGa8aZdHPbYuzFamN2cLPdVrd8SF8/XyNqVqLEEd0WxMghoBliQunLxjjMGoxc1H7nCEvyReytWvgNlEjV1XRPL0ZRrH6+f7Zhg0oKRyR2Tsk8mRL+qhNvZVSZRT0WAbcUvY6NvzeyO8MmSrA7q4Rusb/KyM81xU2avPB+QytfpyAb0BIDfE2wgIiqmgBDbpt8KILOrLRT1luohJoDvtu9fJ9fcN+uevPsNp6oY+FLiRTupHmAuvwl2pu2vChdEggNdeQxDtmIATfMLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjAn9o0t8b60HZD5zLThY4ESzC2SoWhpQrb/6w1DF5Y=;
 b=De42k/io7IFUZ+vLk6tv0u4H1TN+/sYeJtJvZf3NFhv+R+m09ZxnxrNyDezcgrSC3ymSewia3fVzyeyzx9U73Y7jcv0i2sRp1VR/X1QIbyxQ27cPxi7yvzfPqobrcHygZDh2Baqgnfr23weKxSukxwRdont5ah+/L5uTEi9tkU4=
Received: from BN0PR08CA0003.namprd08.prod.outlook.com (2603:10b6:408:142::19)
 by SN7PR12MB7910.namprd12.prod.outlook.com (2603:10b6:806:34b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Mon, 23 Jun
 2025 05:53:35 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::76) by BN0PR08CA0003.outlook.office365.com
 (2603:10b6:408:142::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.28 via Frontend Transport; Mon,
 23 Jun 2025 05:53:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 05:53:34 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Jun 2025 00:53:31 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH 2/2] drm/amdgpu: Reset the clear flag in buddy during resume
Date: Mon, 23 Jun 2025 11:22:53 +0530
Message-ID: <20250623055253.56630-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623055253.56630-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250623055253.56630-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|SN7PR12MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 534f8e66-239c-47e6-0d5f-08ddb21a4ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alRuM3h1c1ZHOEw2d0o2dC9OZkdSWkdrSnJrVHBYVFg3ZXF4RVRnNjBrZUJQ?=
 =?utf-8?B?TVJmYWtzZVpZWGZzVXROcWR1WjR6bVV3bTZaOU10KzYvUjhyQnNhanhrQXF5?=
 =?utf-8?B?TkZLeWdvSlRvY2htam1EZjdHT29MekcrZjM0b0t2MnZLRW5XaksvTnZVS1Vl?=
 =?utf-8?B?MGlxdUhRZTRhSUthRmwzRTFEa0NVYVpEZ0lMcURDWVd4bEtTeElxZWxDUW1T?=
 =?utf-8?B?dDJ1SjVZTWJHSkorTUJaZ1MrbXJJVVpXRDZmQ0ptUDUwaU9HbDk4MjlXMzhu?=
 =?utf-8?B?VVhQazU2aWovTk1TOVNTNHJ3UWNKVkRYcmJ4eHNrS3lPUER2M2YwUm85a3lx?=
 =?utf-8?B?T1psWE1GTDJ6Ylltd3BickxpWDBUYVFpZVFOY0RITnhyVElHSDlzWFpML2p2?=
 =?utf-8?B?cnZKSmJSeEZnUSt3RktDTTlPVkFwTGhJMVUrTEJWaWY1VXd6OG1FdGg2a0FH?=
 =?utf-8?B?b3N1SWpTQnVDcHZkbzlhbTBkYTJWSFp4elAvRGtJSUwxdnZKN2EwTlJyQmxY?=
 =?utf-8?B?bmRhRk5lQ0UrZEhxV2VBeVZxd2syYWxuK2gyRlFVSXE5ZTRVVUR0bTNlemVX?=
 =?utf-8?B?N243ZGtyZkVKN3czR2k0Qk90WUxsaktpU2x3dGpZaHdveDBLMGZZajJQNGpU?=
 =?utf-8?B?ZnVyN1ZweHcwbTArNyt2RFFnZHJyRnNaRXBOaENKaVBXU2tuMHV0ZG5rT1hL?=
 =?utf-8?B?L2hBYVJVRUtycWx0ellCU0FKZmZqNEhJYWdlQm1SMmhwcjE3Mzd4K256b0pi?=
 =?utf-8?B?M3lUVkVsRFBxb2orbWJvN00zbmI1eTRDKzFvMXVSblJVZ09LU0tKOXRpdkxm?=
 =?utf-8?B?QTJiVnBJZWszNEdoeUFsTGdtMHhtc1RSS2lDMmY4YUhQb3hVY0d0dkV4S3Fp?=
 =?utf-8?B?V3hxMWR1Yzlid2FuTDRQeVNrUllURzhKOHgxUDF2czBLQVdaeERVSlEyeHZy?=
 =?utf-8?B?ZmlJZTZBaytNTk0wbDFnNDU0NTEvZ2c2dXBLTTNtdURQZDZpa1B3UjB4enZC?=
 =?utf-8?B?SEI4WjlLNmZEWE9paFF2eEFwNTNVc2taNzA3dGdwenZVMTgzRFlvMkpvTmFm?=
 =?utf-8?B?MDBRZk01N3hkZ1NVUDlNYVFZTjdzdmRoYnUxeDlpbWZhVS81NzJtNW1CR1dR?=
 =?utf-8?B?dDFIM2hCVDhPb2p0eitGdjZNSHpZaDFROW5DVzYwR2MvSVRtaEwxN25JYkRN?=
 =?utf-8?B?d0JqckhJRVRvRDRFODRJa3V0TjRkRkZqRjB0QWluZlZlc1g3WUlocXNBWkVm?=
 =?utf-8?B?VzBNV1lYUVJmWmFzNFg5ZkJrK0tXL2dsL1lWOFdDT2s1UGRGWnJSTDNhbFJJ?=
 =?utf-8?B?ZTAwWlNuUG1PVDI4SW81Rlh4SmtDNmFRdFVhUWc2Z2dkVG16VFdtbHRxOGVR?=
 =?utf-8?B?NUtwc2NnWU9vcy9aK2xYSm15OTlXQ0xPR29sbUFGZnE3b2J1T0doRXZHN3B0?=
 =?utf-8?B?SEg4WGg1NkFieE5GeFVIR0tiVFQ3dWdnWE03c21EeHlFSHpQZUhvNzhIVTg4?=
 =?utf-8?B?TTZGdUVZVmkwQksvSnREZDRWeEJXV1VKOWQ2V2FFVzZ6MEw0Y1Z1REZub2JQ?=
 =?utf-8?B?VVZmUExKaW94dFNSN0V5TmFJdk5JMlVlRGRHaTFkTEdIRnRHbGx3bVErZVBs?=
 =?utf-8?B?OTB5UzdTWXRiQnJDSzFQT2poSVpMVzQwZVVHczZ6NmorK1QvSGdxTFZIZlN4?=
 =?utf-8?B?TGhrb2xOek8rRzhxVmhvdFJFNWJtTVIwcHFaTDcvSFJBRVdRR0lvRlFyVktx?=
 =?utf-8?B?a2wrWjJLbE5FQkUvZjByK3pSQkMrSk4vNEZUc0tuSDE3M1krRVgxclFZaXNN?=
 =?utf-8?B?eDVpcU9vM1U0aDVOM0dDRHdlZTRQdnFrRzlkOTZsekROZ0VnUFhFUGROZXUw?=
 =?utf-8?B?SnI0TTdqRjAwZS9zN2Q0UTJEN1J0QTVzSWlWeDdNazFHVEx4QithYTYvWGdN?=
 =?utf-8?B?OTJDY09GSHRPcksyMzRFMm9GTnlMeGtaRVZPdENWUExBd1A5VFlwUkluMFU4?=
 =?utf-8?B?TDFDSUJ6NmF3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 05:53:34.9051 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 534f8e66-239c-47e6-0d5f-08ddb21a4ac0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7910
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Cc: stable@vger.kernel.org
Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h |  5 ++++
 drivers/gpu/drm/drm_buddy.c                  | 24 ++++++++++++++++++++
 include/drm/drm_buddy.h                      |  2 ++
 4 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a59f194e3360..eb67d6c97392 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5193,6 +5193,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 		dev->dev->power.disable_depth--;
 #endif
 	}
+
+	amdgpu_vram_mgr_clear_reset_blocks(&adev->mman.vram_mgr.mm);
 	adev->in_suspend = false;
 
 	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
index 1019c5806ec7..e9e2928fa4d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -58,6 +58,11 @@ static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *block)
 	return drm_buddy_block_is_clear(block);
 }
 
+static inline void amdgpu_vram_mgr_clear_reset_blocks(struct drm_buddy *mm)
+{
+	drm_buddy_clear_reset_blocks(mm);
+}
+
 static inline struct amdgpu_vram_mgr_resource *
 to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
 {
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index a1e652b7631d..b5e44867adf2 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -405,6 +405,30 @@ drm_get_buddy(struct drm_buddy_block *block)
 }
 EXPORT_SYMBOL(drm_get_buddy);
 
+/**
+ * drm_buddy_clear_reset_blocks - reset cleared blocks
+ *
+ * @mm: DRM buddy manager
+ *
+ * Reset all the cleared blocks in the freelist.
+ */
+void drm_buddy_clear_reset_blocks(struct drm_buddy *mm)
+{
+	unsigned int i;
+
+	for (i = 0; i <= mm->max_order; ++i) {
+		struct drm_buddy_block *block;
+
+		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
+			if (drm_buddy_block_is_clear(block)) {
+				clear_reset(block);
+				mm->clear_avail -= drm_buddy_block_size(mm, block);
+			}
+		}
+	}
+}
+EXPORT_SYMBOL(drm_buddy_clear_reset_blocks);
+
 /**
  * drm_buddy_free_block - free a block
  *
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 9689a7c5dd36..da569dea16b7 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 			 u64 new_size,
 			 struct list_head *blocks);
 
+void drm_buddy_clear_reset_blocks(struct drm_buddy *mm);
+
 void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy *mm,
-- 
2.43.0

