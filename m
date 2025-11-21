Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E669C78778
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1A810E84C;
	Fri, 21 Nov 2025 10:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vopVRzLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010051.outbound.protection.outlook.com
 [40.93.198.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3643110E848;
 Fri, 21 Nov 2025 10:19:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P39gDmz04ElOtsmk8EfRy8rQP7WZWXvWE/HmhTkeeluokOEBfDrNFzZPHjXsckknWMDI4MVOtdMGXJ4mOqSeHnuWFlYWAA8HKuk6fPqRiqk9mZunPvf5AoBDPhKZacFq/zwD6y5eEuKT0omrujV/FNbm0VR/Q0jEGTogxRahJ3fcz2RdRbPH7EtYl9wdtUwwLKCBqAWVCeA+W1wUn2ZrfbCczp2VOpXPQW+0YjSEGi1hzaxm6JfGjPu5YBXidhnqYPT+XMVBvxrVSGc79Z6HTiMDJ+Dj4qRe4xiaaNOVDcLxQWhhRwQsNpuTLsy/vRj/Qb27cJiULJ0q21qEYFNSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fzp68uJ/mbJpmyd/2Zx8qBt1xPdo1vwDxT/GPncS4qI=;
 b=sp1CY7q5il9KAgluZlHyu5cpQfq2wkFOn4b8MtoGRywQR2m5Z7D/SQ+CIgxAbtksVGajFHszNChZid21yWOLUR71q0gTptuou5DjMy9xWgDBT2Cs+yfOHwHu6g0UUlQAYmhsuwz47apjfE6Rb761LocXSIRjbkfap4LO9nzDg7nRd9BHkJP/GiChJ58EO0eFOk4Km1kXSPTABO/vmGUrSnma9ZFTyEOc3hxKhFtf1r9ZrPx8rFKkMReRXKQdlfzETJGSm23oJza3tPx8rLDv0SMhOuEit/sIaGCRAo3VOJhxSqdqfkcreHOg+LWfymM9xZv+HxR/6PUIBjzEjwGDuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fzp68uJ/mbJpmyd/2Zx8qBt1xPdo1vwDxT/GPncS4qI=;
 b=vopVRzLYgRu+AWLZy2jek5lI43ro54EixtB4PpeFErQMoRa6Ul+OS7z2QiYdTzk0u/j5VXsQfNJYdP3D0B9MaAc4eXPln/fkEA97VIgs9L6/eg+RHaMEEGaWm+nkt4eKQl6PSxo5lQcnzfiIavpwdUxXxp6nd5FoWkpt9Re9Bgw=
Received: from BL0PR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:91::13)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:19:25 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::5d) by BL0PR05CA0003.outlook.office365.com
 (2603:10b6:208:91::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.5 via Frontend Transport; Fri,
 21 Nov 2025 10:19:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:19:24 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:19:22 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v3 28/28] drm/amdgpu: rename amdgpu_fill_buffer as
 amdgpu_ttm_clear_buffer
Date: Fri, 21 Nov 2025 11:12:38 +0100
Message-ID: <20251121101315.3585-29-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: e3183a14-5d98-471f-d20e-08de28e771d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWJtaGtWNEI2enJTSTZqYzBVZWpuY1dxNm1XbEVjaFhlVzd6ZHNmOEMyc0JI?=
 =?utf-8?B?ZW9wVzFxMUZ5U0xJdURIWjkxRHE3TWI3d3VFYnZoVis0OUtCSjNlUG9SalAv?=
 =?utf-8?B?Y0ZJNDBwUTdOWk91NUFOT05QTHVsOWpLNFlMVTh3VEM1eVZ1WlhFYURnKzdi?=
 =?utf-8?B?RUIxemJJOHl4MUxZdHAxSnI3RVpuOGIyWUNES0JzSHFGT1lETmFyWnlCaTBB?=
 =?utf-8?B?WkFCN05NWDFhc1dlVEtGNUo3ckcyTzB4YmJWbTl4T2YwVndrYWkvSWVFVXFF?=
 =?utf-8?B?VExPMnM1Rk9OUE5RNnFXSmhIWTBVMFBRalFDQWNpc21yZFhHSGNnL2JpaFMv?=
 =?utf-8?B?dEtCOVhYbVU0cEViR3NRVWtsUnZaM1R3L0plRXJRZWJvaXZ3VkRGNklYdTJz?=
 =?utf-8?B?RURhZEZiZ1U3MmFmcmdzaGs4ZXNqVDJTY0MvZlpGUzVpTGRnUlNCSWIvSmRX?=
 =?utf-8?B?ODZJblVxQ1drWTB0SktGVW1yczZuV1NsQmI3U2hqRTdnNW9lazVVQUlBSFdk?=
 =?utf-8?B?c2VKNGo3aTIwalZ4Y3hVRGV4M0hxS01wR0tjTGZ3VytJYnIwSmxGS0Z6bWVZ?=
 =?utf-8?B?Qjk5b1NleWNlUVNINlpSU3R0Zm5HT2tkQitXeUg3QnJ4TVlkTnFwQ3M1cjZP?=
 =?utf-8?B?amxpbjltbmZOZkdBLzlPbTZySk9QaVhuVHI4SWNjbmM1M3VrZU0yTE9WREZZ?=
 =?utf-8?B?dXNYT2lmWVFycDIwU2FCNk5pZE9EQnJHbFlleTFTTnExa1N2SlBaUjlTbis5?=
 =?utf-8?B?VGEzNUZ4MDR3NlIvbDJFa2RSWHRZaGJ2OG0yQW1weFVYT2EwamhpOHgxQjdY?=
 =?utf-8?B?K0NTQWc3MkVOVkJBc21nWTFBQmJ6eURGTC85aGFETTZ0enR1cGsybWlLWkdT?=
 =?utf-8?B?SzdQVUd2SjRrZ21scTgzVGorYnNFK0tPaFJ5aFoyVW1GWlJZdDJ0Z1JscXlr?=
 =?utf-8?B?RjU3VHkzYUhjY2hhRVIvQkpGQkNOOU90WEhDem9tNnlMdWU4V3lQekpVenc0?=
 =?utf-8?B?YlpVL2kzTklwUm41TThmVTZMZGxDaXZtT2xHQVVmZW84RmxmeGpnUHVST0VB?=
 =?utf-8?B?dUowby8yRFBiaVBNLy9mSFlPdy9CQVBsS2UyemZMMXJnVm5zS2VkQ2FpaGNq?=
 =?utf-8?B?NGk0ekNaMnhuWExmd293V3Q5aDdETGgveEJ0eE1mcWY2Q2t6aFdzQ3Nmb2da?=
 =?utf-8?B?bTNuVG9zcHVRc0ppb1k2UFJmREZvVFFzNnhCK2ZtTllka0pZbU1CdlJreTNF?=
 =?utf-8?B?NEJ5OTBPS01GUDltc2NOa1krcmtUdm42UDU4d21LNEZQdURGL25vaXBOdTda?=
 =?utf-8?B?MUtKZkFDVWsyWTVyQkZzSVk2aVFwaDdVdHAyOFVGZjNqMnVGVVVVa0VmUU50?=
 =?utf-8?B?ZzVuL0lmYnRnTXdoa0Z3dUFEKzZ6QmlrU2dWZ3FFTUtmdmx1Z0NURSs0UnIy?=
 =?utf-8?B?eDNkSS9DelpiWllURExqUm5GTFJkU0FXL0c5NHF3ZUlUd3NjZ1pHSFNEYkdW?=
 =?utf-8?B?a2swaHBDSjE4MXcvMjN5QTl1ZTh6WTVhQUFIOFM5OWhLUkN4MGZydmhDUVhV?=
 =?utf-8?B?ajI2Z1RSZFJDMHlCSlVMb1pEd3NsaDVRSmpoclNTUEhNUVA0NXV4Ymh2U3ha?=
 =?utf-8?B?RVpmV3BybFBXbURQSkhuWDdkZHRKQXNDSWs1eFNMdjhXbzRoWnNUMnBuUEJB?=
 =?utf-8?B?c1JwQnlwZDQyR2FNRFhsaFRJQ1BPbS9lSjdGaC9zL01sR05qY1FZeEF6WTQ1?=
 =?utf-8?B?ZzVHaEtGZnlqYjVDVmZpY0U4bEJlcDRsOFNadFB5cEpYQmhMTkJwQ0dVV2VJ?=
 =?utf-8?B?YXVPS1BQYWtaVVprZzFkZUVNdzJuOWVzcjJCazBhSVpKbERta1R5S042VWQz?=
 =?utf-8?B?TEZvMEwvdVZheHBOSDVibG9vZUZyVTNieDNsKzF6Y3B0YVR6eHR0SDFYUW9C?=
 =?utf-8?B?UnFnSkthOU1EV0NPZ3pKckRySGRGZ2h0b0xmMEgwZWZ5ZU5BcnRuZDRDQk1s?=
 =?utf-8?B?TzVFZTlVZm1tMWJsS3AyRG5RT0VDVjVNdUlZaVhwdUtZaWRFOWRnNXJIUnJu?=
 =?utf-8?B?Zk1FSzhYRENJaHltdDFOUHFiYTZ5TFVTeWJHUjAxZjlSbTJITDFLeGJzNGc3?=
 =?utf-8?Q?u9D4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:19:24.4888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3183a14-5d98-471f-d20e-08de28e771d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220
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

This is the only use case for this function.

---
v2: amdgpu_ttm_clear_buffer instead of amdgpu_clear_buffer
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 27 ++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    | 15 ++++++------
 3 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index dccc31d0128e..ac1727c3634a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -725,9 +725,9 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_fill_buffer(adev, amdgpu_ttm_next_clear_entity(adev),
-				       bo, 0, NULL, &fence,
-				       true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
+		r = amdgpu_ttm_clear_buffer(adev, amdgpu_ttm_next_clear_entity(adev),
+					    bo, NULL, &fence,
+					    true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (unlikely(r))
 			goto fail_unreserve;
 
@@ -1326,9 +1326,9 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(adev, amdgpu_ttm_next_clear_entity(adev),
-			       abo, 0, &bo->base._resv, &fence,
-			       false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+	r = amdgpu_ttm_clear_buffer(adev, amdgpu_ttm_next_clear_entity(adev),
+				    abo, &bo->base._resv, &fence,
+				    false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c65c411ce26e..1cc72fd94a4c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -457,9 +457,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(adev, entity,
-				       abo, 0, NULL, &wipe_fence,
-				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
+		r = amdgpu_ttm_clear_buffer(adev, entity,
+					    abo, NULL, &wipe_fence,
+					    false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
@@ -2459,29 +2459,26 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
 }
 
 /**
- * amdgpu_fill_buffer - fill a buffer with a given value
+ * amdgpu_ttm_clear_buffer - fill a buffer with 0
  * @adev: amdgpu device object
  * @entity: optional entity to use. If NULL, the clearing entities will be
  *          used to load-balance the partial clears
  * @bo: the bo to fill
- * @src_data: the value to set
  * @resv: fences contained in this reservation will be used as dependencies.
  * @out_fence: the fence from the last clear will be stored here. It might be
  *             NULL if no job was run.
- * @dependency: optional input dependency fence.
  * @consider_clear_status: true if region reported as cleared by amdgpu_res_cleared()
  *                         are skipped.
  * @k_job_id: trace id
  *
  */
-int amdgpu_fill_buffer(struct amdgpu_device *adev,
-		       struct amdgpu_ttm_buffer_entity *entity,
-		       struct amdgpu_bo *bo,
-		       uint32_t src_data,
-		       struct dma_resv *resv,
-		       struct dma_fence **out_fence,
-		       bool consider_clear_status,
-		       u64 k_job_id)
+int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
+			    struct amdgpu_ttm_buffer_entity *entity,
+			    struct amdgpu_bo *bo,
+			    struct dma_resv *resv,
+			    struct dma_fence **out_fence,
+			    bool consider_clear_status,
+			    u64 k_job_id)
 {
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
@@ -2516,7 +2513,7 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
 			goto error;
 
 		r = amdgpu_ttm_fill_mem(adev, entity,
-					src_data, to, cur_size, resv,
+					0, to, cur_size, resv,
 					&next, true, k_job_id);
 		if (r)
 			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index f3bdbcec9afc..fba205c1b5d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -181,14 +181,13 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags);
-int amdgpu_fill_buffer(struct amdgpu_device *adev,
-		       struct amdgpu_ttm_buffer_entity *entity,
-		       struct amdgpu_bo *bo,
-		       uint32_t src_data,
-		       struct dma_resv *resv,
-		       struct dma_fence **out_fence,
-		       bool consider_clear_status,
-		       u64 k_job_id);
+int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
+			    struct amdgpu_ttm_buffer_entity *entity,
+			    struct amdgpu_bo *bo,
+			    struct dma_resv *resv,
+			    struct dma_fence **out_fence,
+			    bool consider_clear_status,
+			    u64 k_job_id);
 struct amdgpu_ttm_buffer_entity *amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
-- 
2.43.0

