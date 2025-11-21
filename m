Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DF7C78739
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1090F10E837;
	Fri, 21 Nov 2025 10:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KotgrkD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C4D10E837;
 Fri, 21 Nov 2025 10:18:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIX21RizHee6bBlLytwHXpdEOtrtUGCbIRq+qXqrkYAyWtbz0j+pzsV5tqRqi/1EqV0W6sugP6WSlCt5gpWfE4VZ3a0tXLhSPUAQbG6rIWBP8gFX/5PLmoxLzDUg2SeV46SluAaE8oL/LPGbdvuhV7XAkMdFr2bF+6j9/PEiOvvdkY2P91MZvNNjEhfDyaSAHTTOJXoKleBCUI0XJFkZpOPjbMN8NPaSQCdIffULyywEwysCiAoniZ9kC4iHA/twka/tQ9u2DhUGY54wNGb9OJt3wXPOOkLcU0H++KpodsLAP6Cmqwem/qOKMVvSvBQqUfwlECG6Q851RUKSaVRpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iwYRxkjHMPeIxKay7Eg1kMzNYyEM1ZvrK83tkrfoX4=;
 b=lcaU+kuycxiu92n3elspToSiASXQSbOP0Qy4ogoxMCSiv0mOry+UxkgjIfG5v8ZPiA/+hlP1+xVZeAqSrhiKvOPB9yPZvLHIM4J6KRxtTv++gMPV6ok+NnYVd03YiDhCd1is/VLL6ehLpJ3XJ1sDDvwJem3jmOW6Af2YoB+HmB0iW0w3bcNV/w+ziIVtHTM/4uX9p4Ow4AbJEbWGdqVpzqziHxfbgw/7E7t6zz8MN2WaKOT8oAlf5ErS40ITeHLK1dK6TT0MrveL7egozSYyMe/dp1p+18D8yhjg5f8xNQXqZ4YqT6q+iZrZt0O+LAF60ox64A6Lz9Yh/d8AKVU/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iwYRxkjHMPeIxKay7Eg1kMzNYyEM1ZvrK83tkrfoX4=;
 b=KotgrkD+C8ehpeAr9tE89Lx4CrMfPhKXs1Jg/8Z4SpDE+bJJ7/kwWs3Dk1A7MefUjFi92gBOh1+hQZXNZiPPFLiIpBpDCF/OYFO/7Su91FP3HVdfh8ZTZNZLe4iUoCFQYEMw+JaZU68oc5SvwuzajuuUrk8pPP/ZzZq4X6gGwQU=
Received: from BN9PR03CA0786.namprd03.prod.outlook.com (2603:10b6:408:13f::11)
 by MW4PR12MB7191.namprd12.prod.outlook.com (2603:10b6:303:22d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 21 Nov
 2025 10:18:22 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:13f:cafe::b9) by BN9PR03CA0786.outlook.office365.com
 (2603:10b6:408:13f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:18:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:18:21 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:18:20 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 22/28] drm/amdgpu: round robin through clear_entities in
 amdgpu_fill_buffer
Date: Fri, 21 Nov 2025 11:12:32 +0100
Message-ID: <20251121101315.3585-23-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|MW4PR12MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c306658-b791-4759-1ba9-08de28e74c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nVUFZwTY+a2noPB4VoVKdxzKj6Cr1S3AvZOwLcqri7IMrZum7H2x8VmVeZd9?=
 =?us-ascii?Q?KsNdLBwBmOSaRykpfph7eN3gzdd2+KOczUQuFiU1fTV3JUK/S/BJgQQPYx+E?=
 =?us-ascii?Q?4hvgCU7MalvYe4IY7HFqAkMmCgJzbQSuLg+yh4xjjuFNTtBH+LIrMbsoR9uD?=
 =?us-ascii?Q?DK2ywtYVVvI9988b8fJzsKNVrt5isC9xyav5iMrQ4iGnnYenq3m3oKtB4ZPg?=
 =?us-ascii?Q?oNEPH6VH7wHgcVhc3dZ14c8U3Amzoii7SslOHQOQztl0ssJxessGNbnI93Vt?=
 =?us-ascii?Q?i0N/ApXaQ+qhMmfQOn/qYRUe1rSzAalErQms1U7gmnlkf3Nwg/ynjIL1baIj?=
 =?us-ascii?Q?/anIJXl93AObk2QuID55Kvjxv7fCvraZul/WQ+nApVpAXtfYTFzJi34Sg3pC?=
 =?us-ascii?Q?qdzG85VFhkqLaznYJ+kMKX6G15Bz0xT980hAor/FsgtwinAhFApS5UycX0nj?=
 =?us-ascii?Q?hBfzwmtTxq/a3q0MYexYgRXewjS+UYTwrzGudymXmrGZRxQYyrs+HOQU2Nzb?=
 =?us-ascii?Q?R/xjSgEChgqekTXtKZCMSZGxNag6X6f8pPlrkkjExhZq4//Y3EFozhy9d6Cl?=
 =?us-ascii?Q?OAg1K5UG811B3IGToSRSr7nKw67gopr1gsigrFDuaIX7hC0i5toOHhLcCg7f?=
 =?us-ascii?Q?QJwGOYAWtnIbsK3fWmBltrl0UNtM4uVdoAoZS0WsfVRPi1RHR+ag2HhAtUy3?=
 =?us-ascii?Q?tOtusLqYM4usMxAn9qXxw2uts6IbUiV1/VnDK8/2AYL0d3W4mVWZbcJ8ZNVV?=
 =?us-ascii?Q?gy+STgedH+uqrx0rXb5GaGxREINtNeCsTufQ95JAjnAbJ//Bh4czwtDPVTOg?=
 =?us-ascii?Q?8bfXme9t8CCwtdQvZLaFEAZzNfgc84/q0QC103FOQkdrTe/oj7qzNn1us+H/?=
 =?us-ascii?Q?C2Q4z9cB4hVIc38+wd6PCnJUPtZyPGsSDKHK+bpfxzUG0U1ire80tmfU94S4?=
 =?us-ascii?Q?QAinCT5Cyvfpr744DJlvEN1OnFKr/nFXZ2ULT72iWicyTZYwdCLKwCicC5Ut?=
 =?us-ascii?Q?3OAI8sSMLXZlgLEM4fwhoqjlNqScfrXwPYBTNyNNFz8mv8zr0RoN8qovtCr9?=
 =?us-ascii?Q?UPviNn0HY5suvdcS5LV5+YgsyU2aIslbeWyabsDDKdvDEDb37JmVCPvLLgwB?=
 =?us-ascii?Q?BIU+alPJAYvRtshpse5ZMuI26LZKpqelvmcijIWelaRgLz2UG1zBA0t8A6RK?=
 =?us-ascii?Q?gyVbX7krvE8uBc+uJR3o6HyY/cPlrCwsNd6DpeqFccYkImyoy3joTWFuvxhR?=
 =?us-ascii?Q?zAo5Q38SFz14CbRVXXhgu+MIqwAzdz4aJHh4fNDG0izseWXxBMj48N7so76S?=
 =?us-ascii?Q?f/gZMFRS54jnnkfrYF0TWL4aPkyBLqa/doUVO2kZLsYA/8YN4dmiCnDSoU1n?=
 =?us-ascii?Q?KHhyz7sHRHaoUKV3HklxtkpcV6PnVhPfmYpFWOR/c4mCdpooAHjy6/yfxhMk?=
 =?us-ascii?Q?JL6iQ+iTDYcn4Ol/DSL+wonC2fhEy0HPId0EeANNp7hFIc83tRH/jva3A+Kh?=
 =?us-ascii?Q?NAfzGOi0+WPXqVagrznFUEIqjmax3C5zB+eXQJc5HUB3FJSTflIFtpZZYw/q?=
 =?us-ascii?Q?x7VjiOqRrCc88hGc9/E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:18:21.9707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c306658-b791-4759-1ba9-08de28e74c8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7191
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 12 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  2 ++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 56663e82efef..7d8d70135cc2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1322,8 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(adev,
-			       &adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
+	r = amdgpu_fill_buffer(adev, amdgpu_ttm_next_clear_entity(adev),
+			       abo, 0, &bo->base._resv,
 			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 438e8a3b7a06..8d70bea66dd0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2277,6 +2277,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		adev->mman.clear_entities = kcalloc(num_clear_entities,
 						    sizeof(struct amdgpu_ttm_buffer_entity),
 						    GFP_KERNEL);
+		atomic_set(&adev->mman.next_clear_entity, 0);
 		if (!adev->mman.clear_entities)
 			goto error_free_entity;
 
@@ -2576,6 +2577,17 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
 	return r;
 }
 
+struct amdgpu_ttm_buffer_entity *
+amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev)
+{
+	struct amdgpu_mman *mman = &adev->mman;
+	int i;
+
+	i = atomic_inc_return(&mman->next_clear_entity) %
+			      mman->num_clear_entities;
+	return &mman->clear_entities[i];
+}
+
 /**
  * amdgpu_ttm_evict_resources - evict memory buffers
  * @adev: amdgpu device object
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index eabc5a1549e9..887531126d9d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -73,6 +73,7 @@ struct amdgpu_mman {
 
 	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
 	struct amdgpu_ttm_buffer_entity *clear_entities;
+	atomic_t next_clear_entity;
 	u32 num_clear_entities;
 	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
 	u32 num_move_entities;
@@ -189,6 +190,7 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
 		       struct dma_resv *resv,
 		       struct dma_fence **f,
 		       u64 k_job_id);
+struct amdgpu_ttm_buffer_entity *amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
 void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
-- 
2.43.0

