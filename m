Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8731C2FF7C
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1398910E57E;
	Tue,  4 Nov 2025 08:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="j5TZ6D5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A31410E57E;
 Tue,  4 Nov 2025 08:37:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StqI3C/Gk572vLshTUGG3Gl526oCYsfGSDq3ZaTr2Uetda9y+AXJyOReLAnoFWwUSTp+ox8alPAMUtgpBoVtPBN6jZsfArRQs+LBzWRmbcTup5b7uH7HlK/0gdv3/9eRo+8txRNjfgtnU0UG0h4X+XHnpmHDvW6tkhQjera69sSutcr3wigIoaseVK+f6c9qebRxRH0ttgzV6zonO4c0BEPhmwV0hXNiQCj5oFFy/Ig7Tl1nDg9niC4NMJNjP0uLevlpbBYJhamMxDeJTzjod/6b+8VJ1YXS+dSDg64UdLmAScDJU9ySJc5XVTriUtgBa9248Xyc0aE3gV/CmR+OFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vhUtS3dwtHTfvYdKBi7zahNsCxA0dl2GDAA+pkVjrc=;
 b=HSbCpKTCqj376Nj6jGUvpeNHisnMOzPFd2mFU9G4Qe/rJinwZ0DLWXtBlMN6J5Hb1DlNgCYtN2kITkf119t2tuBUVrOgrAvFXG3n1bU7FVmzBYIZ/cO1lsRVadhgGrzl0C/9LGynfYeq6mihFX7s3nDDPg3kk0yXNl3qSu/s39JZ7ai+hAjkHPrCoZNozzEUZ5pk0n3ds43jIr5ksJFKFDw9y8U3yLlNr/zsS2viOnDWcHh1JULMgg2zkwIuUvksFuydxIt5jZ6uznor7Xc3p3fWIxsbGiA/Qci9OlB/L7cbd18aMKJuPxItU+c8hA3PYpczRoY3NQIuKxXtVMkPxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vhUtS3dwtHTfvYdKBi7zahNsCxA0dl2GDAA+pkVjrc=;
 b=j5TZ6D5Ooc+JMPwK5QSpg9DZ1gZ6YdOxBWwOWinTpsJZgeD3sregnMAqmcwFmcgQIzmlE1Y+zOC0Qwyle449CDCl8u+RQJh60pR2SLzDEs9wdwQnR6YYC8rYjuhZmS8Kb1Aeh/0X2q+5xs9HTj7fDnFbXwLpXivSiAZY18wPoZc=
Received: from SJ0PR03CA0087.namprd03.prod.outlook.com (2603:10b6:a03:331::32)
 by CH1PPF84B7B0C96.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::618) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:36:59 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::ba) by SJ0PR03CA0087.outlook.office365.com
 (2603:10b6:a03:331::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:36:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:36:59 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:36:56 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 13/20] drm/amdgpu: use multiple entities in amdgpu_move_blit
Date: Tue, 4 Nov 2025 09:35:28 +0100
Message-ID: <20251104083605.13677-14-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|CH1PPF84B7B0C96:EE_
X-MS-Office365-Filtering-Correlation-Id: 0211769e-7ba8-4e43-9213-08de1b7d5212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d3aj/gYkAAmPVfBG7R4vZmNIwGgPWMCRbUWTBtI+fN3nUmVO1Ox3wdrU2kDO?=
 =?us-ascii?Q?hd59oRWC7mTy46AUvkt7u2QbMbcJ6nsEsW1/d9klASJxSArfeP41X6XIIz70?=
 =?us-ascii?Q?6Jm4brDNdVfHGswGWNPY2ZMEoPgeaarXI9Ca+6o2vGtqMB4lCw5Tnvadc3UP?=
 =?us-ascii?Q?30tjto+mEquOUz00q46fum6qk6CCqMrLQGOAqHXKmMI+/cSXMOgnRJpXRms0?=
 =?us-ascii?Q?sr+uhH8119RNDhHakJatwkbJoGGACB0tgXoKPJ1KzaNgeXanjBBVTzQafU11?=
 =?us-ascii?Q?gjjndColXb/74+YYOQUyBgQXTRZ/XqY7GqaiQNi7y4z2g96JcrN0Plw44el9?=
 =?us-ascii?Q?RWYb+A9+lXJqnSXcNqF9kFMfg0yqLT1j80NI3JMujkNtsDEL/T9wPp3xo2qo?=
 =?us-ascii?Q?6+Vc0jl7ROUVYzv7hsO25GLr64a3QP+Fon6gUHxIK4DmYCa41A+cZ7tIERPg?=
 =?us-ascii?Q?9ihEQj6FwbwIBAW9/Nf4H7R9lUyaVwIMXqo21GNgw7xEL2ZU+TF8iLvyKF6g?=
 =?us-ascii?Q?ODdML50PTvmsoIUQMAvPFDpJh8KJmBSITCs1SdNtaLyC/00J4oGvOi7BKv/V?=
 =?us-ascii?Q?k3q/t5kHILRFL0qJRMC3qKLsySPv56E0UlhTg5uehV9BYbm0z+C322mNEoma?=
 =?us-ascii?Q?UeSNfyW5VanpOav4gvBCfjrHi7llRCz+4HVa8ebKu4MMj21cWPhnuAyCkCb9?=
 =?us-ascii?Q?dwinVQw7JCJONAXincbxqRjMilrYosCdzF9BndKYmvgl8DmLCNmqTqkcTS7h?=
 =?us-ascii?Q?Jt5LXMTBPX233o/Ml+ovbfNQtQDd8x9jbsAMph2ps1KLINYDTCagDNhRzx2M?=
 =?us-ascii?Q?cusJ0gzU7sQcfXsEhON+2ej7X+h0GfGcjn5BOTWWNkrc7rT8TWas1IBq8Vsz?=
 =?us-ascii?Q?3FyneOZkQf5B9gNuDDJfpA7SyL7tB/hcGpaMszxnEk+ETpoUpNHTBTADvzm9?=
 =?us-ascii?Q?prpUXyIbaC6fglJbIhYlfckpmlDUM5q23I5eQb6N6cWThVsvapXZw+5qFlxf?=
 =?us-ascii?Q?iSRFVcyis2iqWaZXvpLwgWvuG5l2Fi878nQTzTITdZpuFgG3mLUzq688/M2m?=
 =?us-ascii?Q?kruw69OOd7zaFQLtV1RrUXahhQ9ww/FwmbkwA75TLzZrQKQR70/Gcpe3SjSB?=
 =?us-ascii?Q?pUB4o2d00Wx/PgpbL6x7GdzV1gj0SdmO+bzYldyzQB//uqvGeH2l6HuSaqtg?=
 =?us-ascii?Q?Sifo02GM+e2RblwfprgXQzj6UJO7Ae/KmN16/Ed2V9MZ2N5vKN/tUevBOmMm?=
 =?us-ascii?Q?S/H73+bHabWh7TY6h9e1GcGe7rp+SqEYOJUtBkjpkbE3rPbgjD/CKkKpGtRY?=
 =?us-ascii?Q?Vwv+9SDRurMygXgaXaHxV818NGWoSs5x+O2rIEtS/NwXoIw3itwJtiFit5hk?=
 =?us-ascii?Q?UKL9/TIRiSjWQH1gtYKototMkL8eyfgFjTCM/dd6wZIzxBR2xvRICHRnmLsU?=
 =?us-ascii?Q?6KRH7vW+a7H1D8IBrAvfwaa5kdw3IVN5kbEXhhkzzIcoocbnHguUZH/ZeNTw?=
 =?us-ascii?Q?jzFe/RY1alUPoi+7CkIY5Y3QVS4s2/CHhM6G43flKF/0j4oOG7Y4PyyfXB+n?=
 =?us-ascii?Q?eGJwrho3xYO7wJ0Y54E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:59.3662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0211769e-7ba8-4e43-9213-08de1b7d5212
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF84B7B0C96
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

Thanks to "drm/ttm: rework pipelined eviction fence handling", ttm
can deal correctly with moves and evictions being executed from
different contexts.

Create several entities and use them in a round-robin fashion.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 +++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 839ea8c7f6be..c3a88574f143 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -401,6 +401,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
+	struct amdgpu_ttm_entity *entity;
 	struct amdgpu_copy_mem src, dst;
 	struct dma_fence *fence = NULL;
 	int r;
@@ -412,8 +413,12 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	src.offset = 0;
 	dst.offset = 0;
 
+	int e = atomic_inc_return(&adev->mman.next_move_entity) %
+				  adev->mman.num_move_entities;
+	entity = &adev->mman.move_entities[e];
+
 	r = amdgpu_ttm_copy_mem_to_mem(adev,
-				       &adev->mman.move_entities[0],
+				       entity,
 				       &src, &dst,
 				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
@@ -426,7 +431,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(&adev->mman.move_entities[0],
+		r = amdgpu_fill_buffer(entity,
 				       abo, 0, &wipe_fence, fence,
 				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
@@ -2179,10 +2184,12 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	uint64_t size;
 	int r, i, j;
-	u32 num_clear_entities, num_move_entities, windows, w;
+	u32 num_clear_entities, num_move_entities;
+	u32 windows, w;
 
 	num_clear_entities = adev->sdma.num_instances;
 	num_move_entities = MIN(adev->sdma.num_instances, TTM_FENCES_MAX_SLOT_COUNT);
+	man->pipelined_eviction.n_fences = num_move_entities;
 	windows = adev->gmc.is_app_apu ? 0 : (2 * num_move_entities + num_clear_entities);
 
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
@@ -2205,6 +2212,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		}
 
 		adev->mman.num_move_entities = num_move_entities;
+		atomic_set(&adev->mman.next_move_entity, 0);
 		for (i = 0; i < num_move_entities; i++) {
 			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
 						  DRM_SCHED_PRIORITY_NORMAL, &sched,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 3fc31c7c6bfe..c3df9d24fb96 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -76,6 +76,7 @@ struct amdgpu_mman {
 	atomic_t next_clear_entity;
 	u32 num_clear_entities;
 	struct amdgpu_ttm_entity move_entities[TTM_FENCES_MAX_SLOT_COUNT];
+	atomic_t next_move_entity;
 	u32 num_move_entities;
 
 	struct amdgpu_vram_mgr vram_mgr;
-- 
2.43.0

