Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0DBC78693
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C59310E827;
	Fri, 21 Nov 2025 10:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qlLZr/Fi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013069.outbound.protection.outlook.com
 [40.93.201.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FED10E825;
 Fri, 21 Nov 2025 10:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFJAEDFLCkDioWYSs2ux7Aia8A7h3rcnkXTEX9u3JtCrcrZJoeEY+TyWei3nwIeJ/w3Yvpm1fFSUm3zQCe1fVN6MeQga58g8BpsiPNxJuECb5cgQ4CNZSmPaLrHHrCulfyndsYtmouVx0ZrKJwhfQf1Qr5nNDOCTYZ1xfW1WTaRU63QHYkMa8+xfqaU8975zf81HlhqraqoW9j/GTNu/oCdoQOzkpXo5joWKT1+kcbURFSPS0euJV96BMRUoSlnyo8Dt9aPtha0FQ8Q9NIYqcpC58Uc34b+x9ojio6VBL9wzwetheeVY+pRn59Mm7gqbQD9yfUGn8jvAm+cYZVv14w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9ebGZCjzbPY0OVIPfnrW7ihjYhgD2sWVBYef6FU2GE=;
 b=PfoT86SxK5xIW7ylB+kyQSa+j13ZfU0cdFCoOpJueNABP1G7uHTYO2gFeza0ZiK6Bx74j5nDQwcbrpcuGLMiFpmdTUhVDY/hcUpJGbj/1079nr2iaSUsKX9AUNFiYPhdM2nfSPyQTBrldfyiOn4z37WZqtE8ONz2s1Y7uuDI2XspNCHDH+gml5ZPlAZ0xPxQgsRgkLIiGAmzlinh7nOK2milsSBf8jBhZ3C1rM3TKdM9hwf1Jvli1EvJ4bK/1hbIOMHVjyWxjRzgO5osRjJ0W425iI3/HiAxIcay61kAB89+zF3gU5Tr+XlKUQYYMDlIBJCjtzfhlpZzKuOdB1KOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9ebGZCjzbPY0OVIPfnrW7ihjYhgD2sWVBYef6FU2GE=;
 b=qlLZr/FioZ/cuNGAeOYwXk6GnaMsbs2D+AQg+il1PaHSD2Rlp/JGOLVp5JI/26bAdYO7rAqufq7ikXS/ytvgJSUH/94zsrY84e78ldNEtdcl3hVnoIzskMFXzo99tJlKtEHwhzwkhZAIm6BApntv8qDWrKTCOgj/DN4rKjm0R/4=
Received: from MN2PR07CA0018.namprd07.prod.outlook.com (2603:10b6:208:1a0::28)
 by MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 21 Nov
 2025 10:14:39 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:1a0:cafe::c5) by MN2PR07CA0018.outlook.office365.com
 (2603:10b6:208:1a0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:14:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:14:39 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:14:37 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 10/28] drm/amdgpu: add amdgpu_device argument to ttm
 functions that need it
Date: Fri, 21 Nov 2025 11:12:20 +0100
Message-ID: <20251121101315.3585-11-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|MN0PR12MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: d6907149-da9f-470e-d38b-08de28e6c7d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XpEzEsgk2QnVLhxz0yvyPmHkriIg5xUlPPO+LN/Sw89332rBXRnPytSsna/+?=
 =?us-ascii?Q?Bb/mQAqQNkiXFJcC+NzE1if2iLDtqNLPJVyVc37c457iOhi/LQlJinSdTM44?=
 =?us-ascii?Q?wThssDKILXxYH4kF7rpbQH+w3i8Ukrtsi7FdXP8vYRAqI6B74mQsCy03eRKe?=
 =?us-ascii?Q?iem0MVIpFwIZso0b7sfWoLwFppgHRk+Jy7GP6DcJEpN5gv0+pU0StJ6kZMr8?=
 =?us-ascii?Q?11r0DtgZvhoC5wjnnM+Mf2QaffP9xpMSVYUCEF5W5WDNRfaOEwKl17TFBe26?=
 =?us-ascii?Q?vYkS1jdhcV+iu12yRZ6uPl5mMvOUyw9OvXO/8iqI+jvmZ3ejlHzF6TrzYVEH?=
 =?us-ascii?Q?r+noziY1qSToZGWm8qigIpb1TVntER08k/5u/JJmApDE8QD3bTLTtt2328x0?=
 =?us-ascii?Q?f55lt+zn0QIhOfHCO3DwydLNIRtMPjTzZYUu8WLI6BIJwCLEf3HfD3v+6pNe?=
 =?us-ascii?Q?AAPvGYhvNLrWvLxn3Gdbj0Kx1FVd5wZoK3kPfxviFeJ3ux1SlJQGSRjjaTos?=
 =?us-ascii?Q?clOJkKXdobcxgDj5+ZSoBcADnY9e6I7nZ3R5e9JhBYvxD42niuDPDTs94KFj?=
 =?us-ascii?Q?fGdjg1Lw89fz+4HWlzTVUNVJjTSH9Yhal90dp8pwOLJ6otlcJTfvot+Tloja?=
 =?us-ascii?Q?Ck3iWHC3gAmuWLoM5yYfxDMI0EaxpyB/xuIqteHF8dP2t0OwFINmcqC7rd9l?=
 =?us-ascii?Q?f3/TASZDdbM8PWZpdekPvzW9I1Y5U3nsgotS/HKGHc8vNCmjE046oLv7sCZX?=
 =?us-ascii?Q?w8zy/DhqjDaXKQ6ryU2OoeMTJKiJmxNCEzPJ/Gr/wLrHJhnA21RUQ1kfCf1Q?=
 =?us-ascii?Q?YdZjBpfN0jSwLuwrersQLHRiHtsRo9LBb/edfmCY1z+wzG8Hprx2/8FR+MLD?=
 =?us-ascii?Q?Tr2JMpeRsgEv0Wp8AFJdO48FBnK0RfqqmSQxw2sfHY8WEVL7h8nDq44uqpa8?=
 =?us-ascii?Q?bYf4iTUmWti9bZuXmcoKt524uqzYVAeV9/z0PgOrbojebCobqO3jaw4h2Z+D?=
 =?us-ascii?Q?3w9fsxtU9gtg/PNJMgn0wNsJYMVH4xntHNuQV1QnIZVnakMEs2u3a7WQl/RK?=
 =?us-ascii?Q?GMHgRehq5RUuHxwLpPcDgimRsv5l6yhL7mJ0qtJ2kk2P4cyIs7VYnQmkGFyQ?=
 =?us-ascii?Q?QHuwLnliIPTGmSC703XvXNfQ1X6o7B8qQSQkewfuVlsK3ZmX2+715JhBvnNw?=
 =?us-ascii?Q?QrE1e0zf3kRzpzVLTkzike2+JDQQOTyDfX2TWoka4o9ciJpuL0EvpeI6XCt0?=
 =?us-ascii?Q?7nQBPg+8e1NZiZmcbfuNU1CfVuJu3TN1usBOFbYFgx6Zfxy6W9kAamIFt5nT?=
 =?us-ascii?Q?yj2dtvkBz8jPJiruea/NhEFLoyz8Wtpxy8OVEWhpgdmSHEg4mbaYMwrigzo5?=
 =?us-ascii?Q?3W68ifUZi+v9MXdWCav5wYYDAKn6CDcTtOR+9cepEjRqQ5cJl4Lrr27gNLLY?=
 =?us-ascii?Q?8lscLHd1hfrl9zh+b56uISrZ5Pe3R0DdvVeI1tOckCM025VltKL6U3A04kBt?=
 =?us-ascii?Q?th+KLrtBJ2ktzDdCr8dvaPVRrnXl/7eVICdiKIlFHUDrOm0afm5dRG0jzP4r?=
 =?us-ascii?Q?WDVEl6v79prvPgPjXGw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:14:39.2887 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6907149-da9f-470e-d38b-08de28e6c7d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763
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

Instead of getting it through amdgpu_ttm_adev(bo->tbo.bdev).

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 11 ++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  6 ++++--
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 858eb9fa061b..2ee48f76483d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -725,7 +725,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
+		r = amdgpu_ttm_clear_buffer(adev, bo, bo->tbo.base.resv, &fence);
 		if (unlikely(r))
 			goto fail_unreserve;
 
@@ -1322,7 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
+	r = amdgpu_fill_buffer(adev,
+			       &adev->mman.clear_entity, abo, 0, &bo->base._resv,
 			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 1d3afad885da..57dff2df433b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -414,7 +414,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(&adev->mman.move_entity,
+		r = amdgpu_fill_buffer(adev, &adev->mman.move_entity,
 				       abo, 0, NULL, &wipe_fence,
 				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
@@ -2350,6 +2350,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
 
 /**
  * amdgpu_ttm_clear_buffer - clear memory buffers
+ * @adev: amdgpu device object
  * @bo: amdgpu buffer object
  * @resv: reservation object
  * @fence: dma_fence associated with the operation
@@ -2359,11 +2360,11 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
  * Returns:
  * 0 for success or a negative error code on failure.
  */
-int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
+int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
+			    struct amdgpu_bo *bo,
 			    struct dma_resv *resv,
 			    struct dma_fence **fence)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct amdgpu_res_cursor cursor;
 	u64 addr;
 	int r = 0;
@@ -2414,14 +2415,14 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 	return r;
 }
 
-int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
+int amdgpu_fill_buffer(struct amdgpu_device *adev,
+		       struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
 		       struct dma_fence **f,
 		       u64 k_job_id)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
 	int r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 9288599c9c46..d0f55a7edd30 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -174,10 +174,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags);
-int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
+int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
+			    struct amdgpu_bo *bo,
 			    struct dma_resv *resv,
 			    struct dma_fence **fence);
-int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
+int amdgpu_fill_buffer(struct amdgpu_device *adev,
+		       struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
-- 
2.43.0

