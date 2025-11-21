Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD9C7872A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA1A10E834;
	Fri, 21 Nov 2025 10:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PWSXhe1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013015.outbound.protection.outlook.com
 [40.107.201.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E053A10E834;
 Fri, 21 Nov 2025 10:18:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQ7bGDkeM3/dMZRTgyy0pmNd6nr9qco5Db4y23Wc0Y6kF5BQcUUGzqYzr8Ar03vqrsRVFNjyOYt71Wp0HUjfxowBqqtZY1TkgnEvW2bIbdfgizf9SjNEn2sxMiXnQlOLfjdkyW3zuz9PV/nIi8Z1dmEC9uZgFdUKXx2zXdD2xute0paCKEiqwyG+PwDZ13iKelgIUKIBMEINXl8QNezPf1UNjoc1KofwhTVahD02im+1yVK1GX6b4jhU+bfsjWBbuvc8FJ/STklfvLe8EBc9ds58L8XLQmo/5QIy/pS2L6pdI6LxiGjtExiwV9gexTAWqsYAsN8XD1++MALm5yzDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deD1UJutEV2XeoBYEcbjyfyyym1PT7FrM3MBhjuT9rY=;
 b=dqx7wNfkFEY5fPkeWsurs47TIiSeBvrY6jsSLe9EJtD7cR1FoqJSrZ6ecXPZJwtHCW9eDAT/us5ypCHmjbthwJYBsJeYOCJ4tXRs5Ck2rP7dH2dk5EsFFEd2uAqUvfD0rjF0VXH6R4sNxThZsavJ3Zoiz1lf/K5Te3Y/zfwoFMHbAE9pWG1tvK1JYi5OJHPtdxjvEScu+J+bRJHWVqO+rWFMWEvI3Mp+ub8T2EsmP3HgUpTKEQIz2KU+lXm1zRkODd0NLaHzgpdiK+q3QT/KuK48FhsEuxaRr0v5i6lVIv9BeDFpwd6kLWpFtZZGRboWh9pV0vmCr4VWENQCHhQr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deD1UJutEV2XeoBYEcbjyfyyym1PT7FrM3MBhjuT9rY=;
 b=PWSXhe1rYCXaz2ry5a1iEZLpZ1Os5WK44rYenSu9Q/Op3X7Xf2UnmGWUuNSYXmWGE+kSN/RWSCSPMdlkf6YnthE1VeE93hSbSx78nTxKJVFmh7noFQRS2ieDGzX2OfpVgU6pM52NEHonW63s+ZRByUk9UP8M3PH3f1tRvW40nLk=
Received: from BN0PR04CA0037.namprd04.prod.outlook.com (2603:10b6:408:e8::12)
 by MW4PR12MB6754.namprd12.prod.outlook.com (2603:10b6:303:1eb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:18:08 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::8e) by BN0PR04CA0037.outlook.office365.com
 (2603:10b6:408:e8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:18:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:18:08 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:18:06 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 20/28] drm/amdgpu: allocate multiple clear entities
Date: Fri, 21 Nov 2025 11:12:30 +0100
Message-ID: <20251121101315.3585-21-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|MW4PR12MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d78700-f9e9-4495-b6e7-08de28e74479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YJt3ICEjohI/yicNfoYKZECjJwTsZ2/PiDjIjYJM54E8l9J9s9wxux0tn+z0?=
 =?us-ascii?Q?kuV7z17CjgLQ8Yq8E2kQI0c3ZtFjdwwWYwKiUyXuAQ03tGY9yZsxlAUQIAXB?=
 =?us-ascii?Q?uxB03VBQsw8BCBOiyukkDSwsn0+8lDcKKSUXzndqqdPPGde1/eRpyGkmJjLp?=
 =?us-ascii?Q?4gN2DsS4XZSpT/ykLvoi4I7Rkp0RaxdX1lBGTaJ525oB/i6qeQPKXydenH/H?=
 =?us-ascii?Q?p2QE9a7npFADvjXwekyjnQGGQp6pbf3SVfLrZHmqyLKnjN6iP8vey2s3tmS9?=
 =?us-ascii?Q?t2h159tRVAbBstidnumhwfkKI4QLGcD0jIvuPhKb2+Ukd+Q8KzvV1Hs29Sso?=
 =?us-ascii?Q?q8ucxB4evh4cYwQEY1fiV2Y0ELXLjIdcv6RlUYdeAfifmhSvW7QA4vksWm+N?=
 =?us-ascii?Q?C7NS9F/4yZckkoLoV7VXno2lzLghOaE5W0NRZiB8eZDDpau7MI6INjuLRPH+?=
 =?us-ascii?Q?6YD9Z4nS8FN/bskW8aney3PY79xjsleIrtaDeu9MFZRsc1V4t7LH/3xixtyb?=
 =?us-ascii?Q?6Sb6zlYL+2O3eclJpiKP9hVVAf/RGVmz4sMw5XzkcJF4khOY9odFiOGPiLUo?=
 =?us-ascii?Q?VLzejlZ2zHa16W7Fm33E3PY+7Mq6BPefXvC2XiyBz14j+/taBYCjgirnF6kC?=
 =?us-ascii?Q?QqmCm/2gb+fGiyxtXut+OMU27OBudq7Wm3IpVYiqImRxpraaqe3QZ58+ml/6?=
 =?us-ascii?Q?E1/vVlgy3Fh7F9r15iIYRUYovmw7WTD2juRVK9iX+xDH6AqFDn7LK4Jvy45o?=
 =?us-ascii?Q?zGG7I7BfVH6v8dKuBzqgebu9kmOIo4gEY89wMkCx9A5IUoNoj48vAvRq3BFK?=
 =?us-ascii?Q?A8K66u9jIOlQKsXyctzhur5nhYJkwr51D+5/d02z8gDE340J+7f/hErP5qa/?=
 =?us-ascii?Q?Lt18dLv5gScjXpe6YsOVFcRH/g+etI3W0QnpWx/QO6VT/chTpOx0ZIKImBbR?=
 =?us-ascii?Q?Zpl1d+qSbMDHn2g2DENweGvFNevWQTs70WkJ6W4+RbNBP0RKhd6Kj6NA9c+o?=
 =?us-ascii?Q?7xnWQelXk7Tc9hoHuurWxuzhIP51384pcO5dwK9XE0oySwNwK8/Qprn1rgZE?=
 =?us-ascii?Q?XEXtUS5Ux5T9C6M9lgv59O0mpTmUHJwhruVVQ0tI2uH9CYWvx4EChhZHO5Bz?=
 =?us-ascii?Q?QMYtkvojh2IrVKu9B3sjIcBmqOKN9w0IYAGCeUuQMvI/0UpBbR9xSVDOR4qM?=
 =?us-ascii?Q?LOYggdwXLFJdTO1LbBfaT04FU7V1LnKvtCC+DdL9AxsEb3A00Hc7XSAJ+9lM?=
 =?us-ascii?Q?EcrzoqA0JL5QGXXIM3e+stXoUnqQgGG1VrHyGT6wXS2zYOXRaa5bgBMoC67N?=
 =?us-ascii?Q?E85QaQ7yOcUE4ImGGhrI1W6WrgCZU+IUloXQmpIqd/zp3B9QkdE8R4/VAgJl?=
 =?us-ascii?Q?fe7K8no+mUmLCRSWHhMO7CfdI9cTaJF3HzOGO/mR61BvqGTVzWR43e/dUoP1?=
 =?us-ascii?Q?Jm7gzRC4qNkz1spbE1mxd03sxlQiz1ZqDiHnj5L22Crcd9OqCgUcYrZd3u26?=
 =?us-ascii?Q?AIe0iXjxgDjTvfYpLsnweja2+kjbkZbKX0QkJsR0NvnftgqlkjxxSvPPKlAS?=
 =?us-ascii?Q?w4HN2ljuOpIYppqn3LY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:18:08.4149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d78700-f9e9-4495-b6e7-08de28e74479
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6754
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

No functional change for now, as we always use entity 0.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 51 ++++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  3 +-
 3 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 2ee48f76483d..56663e82efef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1323,7 +1323,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 		goto out;
 
 	r = amdgpu_fill_buffer(adev,
-			       &adev->mman.clear_entity, abo, 0, &bo->base._resv,
+			       &adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
 			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9024dde0c5a7..d7f041e43eca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2224,10 +2224,12 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	u32 used_windows, reserved_windows;
+	u32 num_clear_entities;
 	uint64_t size;
-	int r;
+	int r, i, j;
 
-	reserved_windows = 3;
+	num_clear_entities = adev->sdma.num_instances;
+	reserved_windows = 2 + num_clear_entities;
 
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
 	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
@@ -2250,21 +2252,11 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 					  1, NULL);
 		if (r) {
 			dev_err(adev->dev,
-				"Failed setting up TTM BO move entity (%d)\n",
+				"Failed setting up TTM BO eviction entity (%d)\n",
 				r);
 			return 0;
 		}
 
-		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
-					  DRM_SCHED_PRIORITY_NORMAL, &sched,
-					  1, NULL);
-		if (r) {
-			dev_err(adev->dev,
-				"Failed setting up TTM BO clear entity (%d)\n",
-				r);
-			goto error_free_entity;
-		}
-
 		r = drm_sched_entity_init(&adev->mman.move_entity.base,
 					  DRM_SCHED_PRIORITY_NORMAL, &sched,
 					  1, NULL);
@@ -2272,26 +2264,48 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			dev_err(adev->dev,
 				"Failed setting up TTM BO move entity (%d)\n",
 				r);
-			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
 			goto error_free_entity;
 		}
 
+		adev->mman.num_clear_entities = num_clear_entities;
+		adev->mman.clear_entities = kcalloc(num_clear_entities,
+						    sizeof(struct amdgpu_ttm_buffer_entity),
+						    GFP_KERNEL);
+		if (!adev->mman.clear_entities)
+			goto error_free_entity;
+
+		for (i = 0; i < num_clear_entities; i++) {
+			r = drm_sched_entity_init(&adev->mman.clear_entities[i].base,
+						  DRM_SCHED_PRIORITY_NORMAL, &sched,
+						  1, NULL);
+			if (r) {
+				for (j = 0; j < i; j++)
+					drm_sched_entity_destroy(
+						&adev->mman.clear_entities[j].base);
+				kfree(adev->mman.clear_entities);
+				goto error_free_entity;
+			}
+		}
+
 		/* Statically assign GART windows to each entity. */
 		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
 							     0, false, false);
 		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
 							     used_windows, true, true);
-		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
-							     used_windows, false, true);
+		for (i = 0; i < num_clear_entities; i++)
+			used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entities[i],
+								     used_windows, false, true);
 		WARN_ON(used_windows != reserved_windows);
 	} else {
 		drm_sched_entity_destroy(&adev->mman.default_entity.base);
-		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
 		drm_sched_entity_destroy(&adev->mman.move_entity.base);
+		for (i = 0; i < num_clear_entities; i++)
+			drm_sched_entity_destroy(&adev->mman.clear_entities[i].base);
 		/* Drop all the old fences since re-creating the scheduler entities
 		 * will allocate new contexts.
 		 */
 		ttm_resource_manager_cleanup(man);
+		kfree(adev->mman.clear_entities);
 	}
 
 	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
@@ -2456,8 +2470,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
 
 	if (!fence)
 		return -EINVAL;
-
-	entity = &adev->mman.clear_entity;
+	entity = &adev->mman.clear_entities[0];
 	*fence = dma_fence_get_stub();
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 0b3b03f43bab..250ef54a5550 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -72,8 +72,9 @@ struct amdgpu_mman {
 	struct mutex				gtt_window_lock;
 
 	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
-	struct amdgpu_ttm_buffer_entity clear_entity;
 	struct amdgpu_ttm_buffer_entity move_entity;
+	struct amdgpu_ttm_buffer_entity *clear_entities;
+	u32 num_clear_entities;
 
 	struct amdgpu_vram_mgr vram_mgr;
 	struct amdgpu_gtt_mgr gtt_mgr;
-- 
2.43.0

