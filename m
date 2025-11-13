Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5055FC58A15
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE1710E8A0;
	Thu, 13 Nov 2025 16:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xLKMEyua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011006.outbound.protection.outlook.com [52.101.52.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197B910E8A0;
 Thu, 13 Nov 2025 16:13:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxFbrq/2aC4tG3Y80cEmU2nXOb1xfs0TunOGT0Ag9G5Lmst9Bqxn+yqcsWxBe5C02SZpTzklDLQNvD6yd+xDZ8ZTiLfjaqe+eus3q1E9fPK1IF/BvFaj2q1lCX0Qd/yDD/SaoYqGFXp86pJoZvr+zQ0DywG8CY7iTXTG2lhXxn8h7MaYAONBAWIKThRG6URt/mQ/sfLlwgHYa/JiLY6+nPui9nJXj5t7hmnU3ZH6T8Hz4aSIzJhom9vnGP0p/+PP4Z3FQpDyTMGTIHXluSbyfAzCC7gZ4xw/+hY3rhCbspBqLAeP5m4u00FRbxaWSSQhQeeBJKxKMLfWNm3VxwrciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmfxQXGjTBVDXa/swxlMJa/RFBmk6wh92nSPBNpIpsY=;
 b=mZt+Fl1a3/IOnq/3B9w9a1w00MR6Jskw4JZgQOuvbO3Yb7z2JKl7V5D+Sxi6v2JV0r72dZlcH/NXGZYKRdUHSukQ/+YbaMVtrFVBlOEakS12J4A9AaLt0HdEdQy2y/rXO9I4NBzxDEbX/abmd9s41jfT8uZGcPstD98TgHbTIbIobs91mbUyHQFOGK55LGqh+rDXx5MYFYlCG2WMH3r34CNH1TzXyPxTovfg1Dhqw4yMZJKaCkSW8yQ2mbTlWendNGAooDrCSiIfmrMRgzGNl05vPojRX8zl7p4cYKIHDYFkgghhudUInZQ+vjOHDt5vuw+nzEKBukmuxSMYkVMM+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmfxQXGjTBVDXa/swxlMJa/RFBmk6wh92nSPBNpIpsY=;
 b=xLKMEyuaRRMpluYg8qgtDjg9i2Y2qrKur2hmN0CcMZSixEW0ffL4LfVEixarqXFuMfg/uAbFhYb7q4jMC0b3mR5t+vG2y/h50B9jNVp1uFqinj1G4U8RZoa2u36LjpxKCkkCobSAaQWKwMq7oBWWGx39rdCAs6CrzEcxrnSSz/o=
Received: from MN2PR07CA0002.namprd07.prod.outlook.com (2603:10b6:208:1a0::12)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Thu, 13 Nov
 2025 16:13:01 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::98) by MN2PR07CA0002.outlook.office365.com
 (2603:10b6:208:1a0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:12:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:13:01 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:12:58 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v2 18/20] drm/amdgpu: rename amdgpu_fill_buffer as
 amdgpu_ttm_clear_buffer
Date: Thu, 13 Nov 2025 17:05:59 +0100
Message-ID: <20251113160632.5889-19-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|DM4PR12MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 2006af19-fb8b-4ae6-d57f-08de22cf84ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yStdPGPr6xWTTV1to6p1YShKy2oXPGnSgHNtUky9ob6abdx776LnGQsL9dCd?=
 =?us-ascii?Q?ga4/zrEunkIMUC6epxjAEPfR2AZxD0uVXmakMLzT3aM0MK0DVtx+tApvORCI?=
 =?us-ascii?Q?cjB+gFWmnPhD/0YMc5N4l3PGscWNDyBFg7RMxDDemWHGLj47jMgW54c9gm87?=
 =?us-ascii?Q?sLnWPIgjXtNwXBdrCSfTI/wILy8QqpAy1m7SqrrGLiFge1rzgLqdB/S/2QKU?=
 =?us-ascii?Q?ByNhLFD6I6Jk+RriETLWNDh1pR9R08Oz8IaqFDhYr+KMbbjB2832/X7pNvbf?=
 =?us-ascii?Q?FPKSO0RDXykPEXHDPeuqfCixxqEpO0gamKBsmmZWYogyvkvgAJNiLcixGO/r?=
 =?us-ascii?Q?Y9NVuy1MOuZ2yB1v7g+YZOMyb5+DUv/0E6LcfHeBYFkRr3iZgDmXYhGHoBQU?=
 =?us-ascii?Q?dWgy/6YgIhPowoLBDE9MBXgbYAkFEPUgi42IsggF72x39MQ1gDsSoVf5DLlL?=
 =?us-ascii?Q?y1P6SmwFoxoXKXpDw0mYUHKjV31yEZVDgqUsqDjvGoOEqdZVfIOPWkJCRzKn?=
 =?us-ascii?Q?u4n3x8oWxCV76ZIZpuouhcYrSRPKQ5+A8xdliDl4nalpxiKs0uk1YKl9NaRK?=
 =?us-ascii?Q?CJSWhoiz/daj8zQWcEhxWg6VXtw8yIWh33EE9/WJhGfYirW8wm1be0Rjkd2g?=
 =?us-ascii?Q?qerss7ExgmWimSjWJzjOq0GF0FYQjl7V3I+Z+lDHbtVygnNx7EAAbCEe6RTC?=
 =?us-ascii?Q?oRDPpko6ObG7oMUHiurh2vSKxt6VIvP28UzPQhvoiqzFhPm7dzQ5soFlXaIS?=
 =?us-ascii?Q?BFaksR0Igq1uM8DIsPqP4NpIw0Glz5FQVP8v+g+uaHP6ikrW6GzP2hCjFDo6?=
 =?us-ascii?Q?xi7sSn7AxPMHKvmBQPILV4yccvyy4DV7lxPzXBX+4qGSIP/d/AZmC3ChvcNX?=
 =?us-ascii?Q?pqco3KQqMsXYlGRXKr6olEZxc2r6hR1VoqHUzedLX8hwHyzkU/LcGtatkQX0?=
 =?us-ascii?Q?uuiwrqveWdaNSHvS6R3wII0AXB0n1ASntaR5myFtyunyKomp7BgSvEIa9yan?=
 =?us-ascii?Q?fVi3wugL3fKE2Kf7SyHRcD77P/VCzssiKCldNIAX3kyzzDxHgRqftmun0B9I?=
 =?us-ascii?Q?FT5kUcqobYKHJ1Y+m2z9l/BOYJp77jQeaROD1Wn3YIEUYFbunZdIT7Q6Yu9Y?=
 =?us-ascii?Q?z1Z+X4dCn1hJlnGfxLl1OrlrU3veHUV0mqZuznWUcESuTfm70apNdCd7iaAB?=
 =?us-ascii?Q?UmPio0tCH8n3Ee6HkQ0PrOdmr1hCqCrtH+OaT6RcQAxgqiU6PkMxBWDE3WcR?=
 =?us-ascii?Q?jXCVwVBrOOytm3RDhI8xsv+WixfAYVAK2669+qWabSg4NrKSwH8uYD9YlBBK?=
 =?us-ascii?Q?zS6bY0akKY5QVDDJPPaf3/AmWKRoueqe4pL2Co7OVlHUbrn42T8Hw4J/suhX?=
 =?us-ascii?Q?wLqDrERKifTfHUTOApLyAHKgAGWEClloZGc5T613i16dlYJ7eZfHlIC3EqRU?=
 =?us-ascii?Q?DuHnBB2dKH54E9YtqEWzgCr6FDkk8GQYCoaPblBY85X2fkkyxEVX1kQG5D83?=
 =?us-ascii?Q?/wWv/a5LHFQTQfzKa/wxWc6kvvv1cqnWD2nJZVDdgg6kD2Tf8CxH/yvFz3jF?=
 =?us-ascii?Q?STzAC0YEf2Zz5Jn3h6g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:13:01.2260 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2006af19-fb8b-4ae6-d57f-08de22cf84ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818
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
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  8 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 26 ++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    | 15 ++++++-------
 3 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 4490b19752b8..4b9518097899 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -725,8 +725,8 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_fill_buffer(NULL, bo, 0, NULL, &fence, NULL,
-				       true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
+		r = amdgpu_ttm_clear_buffer(NULL, bo, NULL, &fence, NULL,
+					    true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (unlikely(r))
 			goto fail_unreserve;
 
@@ -1324,8 +1324,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(NULL, abo, 0, &bo->base._resv, &fence, NULL,
-			       false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+	r = amdgpu_ttm_clear_buffer(NULL, abo, &bo->base._resv, &fence, NULL,
+				    false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index df05768c3817..0a55bc4ea91f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -433,9 +433,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(entity,
-				       abo, 0, NULL, &wipe_fence, fence,
-				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
+		r = amdgpu_ttm_clear_buffer(entity,
+					    abo, NULL, &wipe_fence, fence,
+					    false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
@@ -2418,11 +2418,10 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
 }
 
 /**
- * amdgpu_fill_buffer - fill a buffer with a given value
+ * amdgpu_ttm_clear_buffer - fill a buffer with 0
  * @entity: optional entity to use. If NULL, the clearing entities will be
  *          used to load-balance the partial clears
  * @bo: the bo to fill
- * @src_data: the value to set
  * @resv: fences contained in this reservation will be used as dependencies.
  * @out_fence: the fence from the last clear will be stored here. It might be
  *             NULL if no job was run.
@@ -2432,14 +2431,13 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
  * @k_job_id: trace id
  *
  */
-int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
-		       struct amdgpu_bo *bo,
-		       uint32_t src_data,
-		       struct dma_resv *resv,
-		       struct dma_fence **out_fence,
-		       struct dma_fence *dependency,
-		       bool consider_clear_status,
-		       u64 k_job_id)
+int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
+			    struct amdgpu_bo *bo,
+			    struct dma_resv *resv,
+			    struct dma_fence **out_fence,
+			    struct dma_fence *dependency,
+			    bool consider_clear_status,
+			    u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct dma_fence *fence = NULL;
@@ -2486,7 +2484,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 			goto error;
 
 		r = amdgpu_ttm_fill_mem(ring, &entity->base,
-					src_data, to, cur_size, resv,
+					0, to, cur_size, resv,
 					&next, true, k_job_id);
 		if (r)
 			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index e01c2173d79f..585aee9a173b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -181,14 +181,13 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags);
-int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
-		       struct amdgpu_bo *bo,
-		       uint32_t src_data,
-		       struct dma_resv *resv,
-		       struct dma_fence **out_fence,
-		       struct dma_fence *dependency,
-		       bool consider_clear_status,
-		       u64 k_job_id);
+int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
+			    struct amdgpu_bo *bo,
+			    struct dma_resv *resv,
+			    struct dma_fence **out_fence,
+			    struct dma_fence *dependency,
+			    bool consider_clear_status,
+			    u64 k_job_id);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
 void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
-- 
2.43.0

