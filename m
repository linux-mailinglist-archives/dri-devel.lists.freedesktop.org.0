Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E789C589B9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AB810E88F;
	Thu, 13 Nov 2025 16:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wSPECJpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAEF10E893;
 Thu, 13 Nov 2025 16:10:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJ7I6DItSdeuH0wARmNS2JFEub75TzW9ZuWzq3uk+aHMVnoXcrjYW2eB/HGU+kz0vX9rXvAR7coQpDTVFJwq24cBZR947LkKybuwW/Lu+GRet7msj8FhWFKTYWrEZSIv8N30s7QxXgU2ScsYqO7e8Qo2UPL83OiuCQ16BRh9xwr4qxWs37qDoHBzD4LDVV30SE/iZxwHdACx6a6jBnjfCn9A0i15rpJ7pdK2B97ZviOecCNuuwv8KbE9ZwF/Gns0Dv/MqXeMo5PvyROGPP/ucSQwHoEtlGVASfFIAkfs0f5b8ZEp9Yz0rYOU4AuF0lWzMktAII0J0CneEGjhNPRPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcCSBjhXx+F/WFOp5AaQlyGioCq9tq/pIwTPmy74awA=;
 b=idy3FF1OXqishKx9QRaFFmyUtRTya4uTjZplylzUVyOyx2iCBth0a0myW9DlSNHA/XUqc61gjoyp9+lu5eA/70dDkbL3n65QLihyUMDdAVNZcalA71RAkPmFemJ6yat+fgttXh3ij+icwFEaThUeSBtH4q1lzcB7TxZqRlPRPDcmFc19Fj/Ou6EC4E+wc3s/PT9owTBMGMvlWXsWjfNSfB0LV46Ftt7ZdqGcCqfAbAVeOlJKRRetqKt6Vf9A1qm63ZxS1jEkaDxzv9lfzU4HH4neSyeH+laVmJUoTUSYWFtlKJFqb9zQi/avIJJjaSQG88Um1MnSEOH3+qdpH9DgUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcCSBjhXx+F/WFOp5AaQlyGioCq9tq/pIwTPmy74awA=;
 b=wSPECJpE0bL441A7izXH5M3vYOjrUL46Lq1KVTHsWhGX9odLspwb9JsBfZQGAcMImXj1/OPBA2A8jbhydfESJpegq1EL3tjFh07juYtvzfu8U8wkK/mZbKxwPtDhSpcU1HI1QZ2jwyKaR4RfEKTq/ies7hyhFBCsIUP4/PECyjw=
Received: from MN2PR08CA0026.namprd08.prod.outlook.com (2603:10b6:208:239::31)
 by MN0PR12MB5836.namprd12.prod.outlook.com (2603:10b6:208:37b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:10:27 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::5a) by MN2PR08CA0026.outlook.office365.com
 (2603:10b6:208:239::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:10:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:10:27 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:10:25 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 11/20] drm/amdgpu: round robin through clear_entities in
 amdgpu_fill_buffer
Date: Thu, 13 Nov 2025 17:05:52 +0100
Message-ID: <20251113160632.5889-12-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|MN0PR12MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 951616ea-c27c-4d44-b4d9-08de22cf28e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1kF93kxC6xqUZrRjVI4aAPl9t8W0UyTTk3X8uoV/8cZRqXq7oDGWtuMAZ13y?=
 =?us-ascii?Q?Y5Zj+X13apkf4t87nqj3Jw5d/F8Djxe9NxsVNpJovmmzL0EOtltnwqAncjZA?=
 =?us-ascii?Q?KZYuBDqywpt7j9v2bqmjRsavw6QziRXIOy080wWfO01Jn6GHUS6d5FpxZLXv?=
 =?us-ascii?Q?JM33qo3gjsW6GpNiw3Xl/Q+pRl+yTAHhN+zFZf148Ia35naw8ChCeQCJRqxc?=
 =?us-ascii?Q?CVxRCuCk/4czRpSlqxNxOBzf67O+yX9yA0rYMPxIDIsCn0RVinKrfUH3LnPj?=
 =?us-ascii?Q?0zfNddhFO6be6JYc99dzfdVi15t01mri/pKgDFZOGqWDM2Fuaacni78n24B2?=
 =?us-ascii?Q?5uc7I/dYcN5AfO9cWqrIogRwsa6Ij0vA6mFOt2QOaNjfr19MahKSXnWQfJ1p?=
 =?us-ascii?Q?vnhSgnT2aHsMtyWO9m+Ax8NjQIZcc/4htXHSO6Dgq61WtyxG+49eLOYtCyGV?=
 =?us-ascii?Q?TicPNe5PVltJIkvukH+vXiI1s9oT10yJeKR75pBkNObfD55kIXnNTcJkUN9Z?=
 =?us-ascii?Q?x9zHA///bNMFqKFRkzUHx1rLczi1DAis0dBs94r0eQJoWA7Ksw7aPKp/zrHs?=
 =?us-ascii?Q?vO/WkIkKDbEAKIbJbz9BXgCQvzJ11e5Hks3LPWqkbT6gFs0f7se87yKbdniP?=
 =?us-ascii?Q?pfnjB9u/fyElOXznBVTw2vujiujD/pjJm1rrEK51uwDL1UUdfgUfmU78DGAk?=
 =?us-ascii?Q?0m2ikZdri7icKvZMSlKJsPWT6kPX+obRvFBEBv+44HQevygHT+kgx0COSKVd?=
 =?us-ascii?Q?Ezj58ORor5ZZ5fcSIEPJe2ejJyKKXETXWBCIj7S2BQr1+PEdQww6ExouL7PD?=
 =?us-ascii?Q?v/LrapS72A1HL6yYzuXu72Ooj95IImYF659//I18Y4J39KgF0SvgqlxGaO2g?=
 =?us-ascii?Q?+CAzbbsM2S3SbqhMK1HoOGltc0af2ZsjOn9uXJyH+ZHISsFY0u4hVRAtyM85?=
 =?us-ascii?Q?8m6Ue5l7jWflFPcY+2lKlln7DclOcmVr0jIvts4/UWhJh4ntku2koHRX1YfV?=
 =?us-ascii?Q?lSa9AU+CzODq5EfE1dktEy4rlrY6wsC0TOssr2S6CwdoYQ8tb6OkMLf+hl1d?=
 =?us-ascii?Q?qlNS8ddUedMIDL+riC71eZhUhqN8+chc4/BqgIvz9ja2pxvrtRZCIhWIddmt?=
 =?us-ascii?Q?A7PWJDdjDQ0i1TKuhk/wEb6bTgLB8zGDyqEKdVYfeTAgym1QkAXnRKQSymDm?=
 =?us-ascii?Q?rbFI+72H5WoQFigoqjjVSNprKNFv7ffZK/aWCy0clyracFaaZsNMupYQ9flZ?=
 =?us-ascii?Q?NEEv0LHaMv17zBdWownT+o1Ku1J7AV9P9EOMcETdGRaxYsil9FhCFcxuhnoc?=
 =?us-ascii?Q?YqDkoEHNMVdPeDuYgVBc/5cj2eSuNc2OnfQG6ALvJ4jLvMBxG9scbmMw8DTJ?=
 =?us-ascii?Q?iDwYENaoUB6Cdgveua5lQ03YDi8vaA/8tKILAEYomNZ2I0cKuYvzvgnaCkJl?=
 =?us-ascii?Q?rj2+3f39xnHfsoXZymzNVpBLpfGQM4RQvYTVpx1M0CVq7iTF1QdzKVrOTXaA?=
 =?us-ascii?Q?AF9SVYE/Jiz/hXLNSGCol3JCl7WKRcOwkl5CTg2l0XuRSm3jDWcFd/TGp0aX?=
 =?us-ascii?Q?sJaHu0JNnMoz984UzzE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:10:27.2337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 951616ea-c27c-4d44-b4d9-08de22cf28e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5836
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

This makes clear of different BOs run in parallel. Partial jobs to
clear a single BO still execute sequentially.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 9 ++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    | 1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index be3532134e46..33b397107778 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1321,7 +1321,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(&adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
+	r = amdgpu_fill_buffer(NULL, abo, 0, &bo->base._resv,
 			       &fence, NULL, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 411997db70eb..486c701d0d5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2224,6 +2224,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		adev->mman.clear_entities = kcalloc(num_clear_entities,
 						    sizeof(struct amdgpu_ttm_buffer_entity),
 						    GFP_KERNEL);
+		atomic_set(&adev->mman.next_clear_entity, 0);
 		if (!adev->mman.clear_entities)
 			goto error_free_entity;
 
@@ -2489,7 +2490,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
-	int r;
+	int r, e;
 
 	if (!adev->mman.buffer_funcs_enabled) {
 		dev_err(adev->dev,
@@ -2497,6 +2498,12 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		return -EINVAL;
 	}
 
+	if (entity == NULL) {
+		e = atomic_inc_return(&adev->mman.next_clear_entity) %
+				      adev->mman.num_clear_entities;
+		entity = &adev->mman.clear_entities[e];
+	}
+
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
 
 	mutex_lock(&entity->gart_window_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index e8f8165f5bcf..781b0bdca56c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -73,6 +73,7 @@ struct amdgpu_mman {
 
 	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
 	struct amdgpu_ttm_buffer_entity *clear_entities;
+	atomic_t next_clear_entity;
 	u32 num_clear_entities;
 	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
 	u32 num_move_entities;
-- 
2.43.0

