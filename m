Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF7AC78748
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F8B10E841;
	Fri, 21 Nov 2025 10:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NWyyzeRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012038.outbound.protection.outlook.com
 [40.107.200.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5504010E840;
 Fri, 21 Nov 2025 10:18:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQ9uPhEeAgPM4z4w2589ZkA/YBr/8x/jyjTqULXyp4OOWcvrHyNzDYxuyuH1sR38//pMVVW2Oowhedd1gKgRzmO9vrHDFzWuel3yiVByYWq4JR0DRdq7lclF8whTNCJLw1vPGax+yNMWizA0CI4PckxhEhjppIj1vAk00ZJoWEU21PNWvBrCGlS8/yirLSWis5UlosSjvMZ4NrRINVAYSqNwTZ+BOLSRTs2pqt5S9Y608CmJ8kzAE0imrGf37R0tyolByu9feV6BzwNzFVM4wZJsnUVYngdNiP5qJcYG3iLvGeadKPkr3R2Vn20DP80cFzd1uoeseBQ4f92xrU9XPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ak2DMhVTCt1f/ipwhEPx+sbDK0nR4a+yqdQRC5pSTNo=;
 b=kkDH2QIjBxCi3VCMFEyQBkYHf2R+hN8TkPxRB9mgjIYjnqRm5V4hAKp8DMzbkEnlWhka/2ksCq9dr3Pbo13PqGs5RV9Sr7hiVqcPXL4lWGVorQ1y87mzF2dyfHv2h0d8A5bTzI2fTsDnSBORLqCnmsH6stC5ns5EcgvyWB1rnzEoBW1zP/xhxZOPfW5vbDR44RtWbjwhOp3Viki00JG0XjkJpvGaP8Tdi0qMoNXak8bP25iOWBfAEd9cL4SDYSdVL4uB417y4AphGMLomCqF8TAzvsuO8Q7dz6VcDKPB2lJMqUPfsPBHaCF4VFqJUFfBNSzfvwQnaQrNK4uJVKO3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak2DMhVTCt1f/ipwhEPx+sbDK0nR4a+yqdQRC5pSTNo=;
 b=NWyyzeRjngdzH1DfYZRweO3l5vekVXVfQwVyBwVhL+OEqQPIK43Wi2AP0wDEQNUutfbVapDg5/Pz5D/dQ+GamN9KBeDoV5ytAGTGCV4iLu8n29lJA9BSVTpvxEKfAsWMuYQA42+8sCtYcd69WlQn56/+OGBuXuwHBl5POhNrt3k=
Received: from BN9PR03CA0237.namprd03.prod.outlook.com (2603:10b6:408:f8::32)
 by LV8PR12MB9232.namprd12.prod.outlook.com (2603:10b6:408:182::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Fri, 21 Nov
 2025 10:18:36 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::b3) by BN9PR03CA0237.outlook.office365.com
 (2603:10b6:408:f8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:18:36 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:18:34 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 24/28] drm/amdgpu: use multiple entities in amdgpu_move_blit
Date: Fri, 21 Nov 2025 11:12:34 +0100
Message-ID: <20251121101315.3585-25-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|LV8PR12MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: f73801ce-74d3-4c9a-463e-08de28e75537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmlqTzYrUnlLMkRZbFNtT0pkM09UR1RRTmExL2ZDME1UYnUrMjZITTFxV1A5?=
 =?utf-8?B?UXY2bmZ0eXJoSlc1Z0pRRi9jdFk5K2hGd0I5YjQ4K0F4c3p4WnI3a2MxbUw2?=
 =?utf-8?B?NzB4NVB0bFMySDJZL3B0OHlFU2d0VjUwVStCam5aT1RUVGJTK21BekVzV1B1?=
 =?utf-8?B?clJ4U3V4WnM1SGpheitrNTdZQ3k3WWdRTGdxS281OFdnd2lIeUtjY0RvaTFk?=
 =?utf-8?B?SHd4R3N5d2czcW54U3ZLL245TFZ2eHgzUkI1eGMzd045Yy90bFl5RDZSN0x1?=
 =?utf-8?B?aFg5NmZzSWl2SW80UTlLNjR3UWhrc1BkWXRVcXJIc0RYdjRHc1NPRXVKZGdF?=
 =?utf-8?B?V05IaUMyY1ZFVTdEem83MGpGWWF6NmpHc2tkcW9na2o5MzBlVmtRemZQNTBZ?=
 =?utf-8?B?ak1FNVpWcVp4V3NORFpEYmJpdzU1NmM0MGJGOXhxWGUvMHc1NERoR0d2a0tI?=
 =?utf-8?B?bDA5c2cyNHdsQTR0MStsdmdPSTRhUFRubGc2aDc5cnJLVmZ5alpyNXYxcjNB?=
 =?utf-8?B?dDlmOUhXUkRpOGwrU1lhNm9Sb05wVTVnYlhiZFZqMHd5U3RKVWVqRkc4MEYz?=
 =?utf-8?B?bTV3aVJ0UE9jL1BIM0d1WGdYT2RHUS83Z1BweDNuZ1VnR0ppNUlibGtMM1JM?=
 =?utf-8?B?anRDZVN5TmFqVzdtbHBBMk5jL00vVmZ6ZFNKNXlBdmRxcHVMUnlrckJpS3Bu?=
 =?utf-8?B?QkNMUkg2TVc1Y1VxZVhuVDZ6M2IzWTFHUVVFVnZGbjFKREwvY2FOUXdjY09D?=
 =?utf-8?B?bGI5VHNub1lpV1U0R3ZOait0STcxbkV5WUJJbWJQVFdrbml2YVZrUzM0M095?=
 =?utf-8?B?S3Z0ZWlPK0pDU0VmWW5qeVBOVTJlNS9sWWtTNGpSa0dqNGVHRHUxcDlSbHJC?=
 =?utf-8?B?K0R4WUJObUtIYUovZzdXMUcxbGErMlIxTVNKN0F4aWpSdHZLMFZzYlNHenNw?=
 =?utf-8?B?b1Q0RTc2STR5T0hBQzhSYi9xTk9oU2svc0ZGT2hYU1YxVjBHYjcvaUl3d01o?=
 =?utf-8?B?NEF5OWpXN3l0M0ZtayttZFRzT1NlTzluK0k2ckMwUlZyaEVpTUtMZnBieDgv?=
 =?utf-8?B?MjdFbXpLM3pkUTFqR2JSSk1vdDRuQWZpb2Z1V0plUk12Mms1TS9zaFU5UFh4?=
 =?utf-8?B?Wm5qWnFUbU9iY1ZRMDVoTU5nem5ySktNZFg1WlJPOEZ6RThnVlhQWGFzVlFx?=
 =?utf-8?B?amx2WURuTjYvMUNtT3JyWVdmd3M3d3dsd3BUWVBBSGtFUmVIRkVNS01QK25Z?=
 =?utf-8?B?UGlkSkt2Mzd5TGJlREZheU04dzk0YVpEcmIwcjFySnNOQVVOV0hJM05pUFZJ?=
 =?utf-8?B?cHdJWnBNcnlXQXdTalVnNU0xQUdxaXN1UVNYc1lxV2tuaFBlVjIveDkwMFV5?=
 =?utf-8?B?eU5aYVkrcVRsYlRkN3lJL0tiWUJtNjRwamVlV204UCtQSmhGVnp6akNOQytp?=
 =?utf-8?B?TXh6V0liTnZaaHV2dEJYTjFYYkVUZU5ETUQwMGVBa01JckRKaVkxVFBFNTVU?=
 =?utf-8?B?bWtzNnYzRDVXdDdVbEsxdHc2ZmZ2WGJXOCthV2pJbVc2b09tMHNuOXhjanhz?=
 =?utf-8?B?dHFHSkZUdGdpeVV5cDJhQ1UySlZyZkU1UVZXdlAyT0xQclhhQ0M1aURzb1hC?=
 =?utf-8?B?T2NsNFVPYks5UVFTbkFBMEVCdEZLNEMvWGpRSmJNWDJ2RDV6MVFKZ3BVVUQv?=
 =?utf-8?B?bmVrcDhhYlo1eCtzRzR1dHZ5djdLQUJraFpJTVUrWW5hT3hENjFXMGNONEZF?=
 =?utf-8?B?d3M4UFNkdUdyc2VoVHFYMGJkelFNanlKS3BlNW4rWmpsWXFWelJaekFrZm9y?=
 =?utf-8?B?cTY5eGZTRnVTcnpSRXVHNkJZQ1pIKzlXbG5hQm53VlFZOVZTdENkSVZ4WVdK?=
 =?utf-8?B?VW9MMnlIVWhnM29NRFVIR2lxQUIvaHMwOWt2K1RLcTNDNCtmeENaNEpOUENU?=
 =?utf-8?B?NWdwdDNtSnkwNFpuay9DQ3FZbjNDY1hMbDZheEw2K2k3K1Ixb1huSUViV2Np?=
 =?utf-8?B?VzIycjhQTjlldzFHejFnMW9vL3dhay9JR0MwZzU1WkNUMlEzek5yMlB2cGVv?=
 =?utf-8?B?SUY3QnJuMC9GSGowTDJpNGl6YW42TGJJSjNDSGNRcmxPMjFjWDM3Rmp6Z1pS?=
 =?utf-8?Q?cgBo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:18:36.5000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f73801ce-74d3-4c9a-463e-08de28e75537
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9232
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
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 ++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8d70bea66dd0..575a4d4a1747 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -427,6 +427,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
+	struct amdgpu_ttm_buffer_entity *entity;
 	struct amdgpu_copy_mem src, dst;
 	struct dma_fence *fence = NULL;
 	int r;
@@ -438,8 +439,12 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
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
@@ -452,7 +457,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(adev, &adev->mman.move_entities[0],
+		r = amdgpu_fill_buffer(adev, entity,
 				       abo, 0, NULL, &wipe_fence,
 				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
@@ -2258,6 +2263,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		}
 
 		adev->mman.num_move_entities = num_move_entities;
+		atomic_set(&adev->mman.next_move_entity, 0);
 		for (i = 0; i < num_move_entities; i++) {
 			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
 						  DRM_SCHED_PRIORITY_NORMAL, &sched,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 887531126d9d..0785a2c594f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -76,6 +76,7 @@ struct amdgpu_mman {
 	atomic_t next_clear_entity;
 	u32 num_clear_entities;
 	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
+	atomic_t next_move_entity;
 	u32 num_move_entities;
 
 	struct amdgpu_vram_mgr vram_mgr;
-- 
2.43.0

