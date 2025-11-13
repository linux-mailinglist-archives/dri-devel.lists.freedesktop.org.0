Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13A7C589D3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453E810E89B;
	Thu, 13 Nov 2025 16:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ShorlOGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F3210E895;
 Thu, 13 Nov 2025 16:10:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2HJbICTJOnjk1A9vGeOM4lAoT9si1gM6GJdc6xizB0LHPlSltXHsFOMw2LHE8FjMcQ4KaRj1dfiOqT7QixmP+Uq4F1Wnm0eRpX6JARo3Du0AXIE7ZLktOQDCaD+F5e6noixtl3nYWTWMTRHY+72gnNT2t92id8XQdV2+R5WsHj2DpDEKsEiVPxGJEMmqU14ba7TSh6f72RGbV5JRkBOl3wPPI8m4sJh9XkkB/sujAL5AOARamknqX4u1cXmHVlIsekts5q3zbqIDVLEX5LoegyBXdW5TfGOf/mD045/8Ui8Bu3nxTYksff9Q82IbL14uVHBYv+xvqmQqgQo7wTUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00Mne1DShvZEWNCnfotiRsrtnQ+gqsxefSJtA7U1RRU=;
 b=AFUKMUe+I23hAa94xE9x8c8fTUAFQPo5VXPW9/3aSHaDfQhQHROVuUteuDSrtEPr28Fb9aNMpT9Z2blPUn0fiY8CK4k0prQGzs57cAbtGeys/7lDknvNawvKQtMPD0D/8tOVU6lBUQFGZDgsqetJyqPS4BjO4Lr3mvid/xE12hqORofTQdg7B2g6T8DSNW7w6eHpl57Ja2BwA6T1HjRPJ94YuhdFmNov5bO0TWzKJmUd3N8vfArDkM+x0EnCvXtjGoeSC9yyfvSU7LXWq+du/AVyGj6M/MBbrJQCzxOM2F36+Cb50HxPl0QZd0xGqBrmXxZyRyE413nHusbYSebEQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00Mne1DShvZEWNCnfotiRsrtnQ+gqsxefSJtA7U1RRU=;
 b=ShorlOGGOKRkgM6E/5J86wQ012sjz7FKf2rf71mEYmxUAHipRqEV7/yWpxm0wVdDDiNU+qmDnjlcJAbUiHkXMXT+Dhmg5aCnI90Crcm0bkm8hdoT9DprzrcTgzfIhaS+FWqn4Uu4gjU29ITmgQlTmWKEsmiemRkim2fvn8TT6+k=
Received: from BN9PR03CA0588.namprd03.prod.outlook.com (2603:10b6:408:10d::23)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:10:38 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::fc) by BN9PR03CA0588.outlook.office365.com
 (2603:10b6:408:10d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:10:38 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:10:36 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 12/20] drm/amdgpu: use TTM_NUM_MOVE_FENCES when reserving
 fences
Date: Thu, 13 Nov 2025 17:05:53 +0100
Message-ID: <20251113160632.5889-13-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 63555095-06a4-4380-77b4-08de22cf2f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bFQKhEKhRaWo3+lElmNZkxp7+ljS4XsjIyQK5HxdfNrw7wgcFhIZBgFaPTZR?=
 =?us-ascii?Q?BgPSiMSXx2r6eO7EE4YXXsWTT8PVPjpx+y7KgaQqA9URhAnPOhAvkFItZzNF?=
 =?us-ascii?Q?o6w98WRH6RJQw1PR/G3ZpqtN2c2HQYNlG6BnyMEpaONAgsXa+WVCFvvzusPL?=
 =?us-ascii?Q?GIq2A9RHHHEt25zLp4KSh7bKu83QnpxZi1UzKNsd9IQPM9lxLROh4KoVqpAa?=
 =?us-ascii?Q?7e4Xe1/FJ0cuBsTTaA29vQq0hKGkWpZtIZsuxWYIpciYzHfENREV/JWfBYD2?=
 =?us-ascii?Q?C9wa6zj5QK4C7GTT6xQiexU4Ni8+MAOaiNawxuuP8fowS5mwUaGiwLE9eNwz?=
 =?us-ascii?Q?drrll+q4lzEJWfxJMENG+IXkCDzvyFJxjQN1kljmWW8kuUYa7BHGbBemfr7f?=
 =?us-ascii?Q?bqVRWMSOVqy82hmWlv6qJg1stzg0TXv+Ina7MtcqFpNw+ZQnvsovzz2lQo9b?=
 =?us-ascii?Q?ve8LFUb7f6IUI9zDIBX7lYD8zOaMg9dlJNRrVy3ZMsIjZtwNAEjNhdVCSFam?=
 =?us-ascii?Q?MM06k+V4fL8xDXZ+oZFRqeiD276JTsYl8I3oZC5tk7dxowH+tay0yokkmMG2?=
 =?us-ascii?Q?0LrldoVIstWOmTtonKAY0T4cotM/sC8HMn4xHb9KOUEEkb61jTUu8FmbgLWq?=
 =?us-ascii?Q?5ZoRpz8cYzodaGU6G4k7EsHwpoeLivGDLlhp+Ql/lEQEyCgDRHACwrltb0E4?=
 =?us-ascii?Q?BXfpJVLWZW5K7LvbKOvryJt4pjDsTNUHB2w2mYHo+U4Nnl4sKLJ0m7kP/BgI?=
 =?us-ascii?Q?IOyRsw4Gz1Ay4TCVOvYs4HBBU7ZxDm8WuFuAANMmosbVEL6XOtuWVB2rZrWz?=
 =?us-ascii?Q?UqUkXameHQsG9iDtL8csrF5duFEYFnurmVuw91W26xFLJAV7kwvt2ZGIKr4Q?=
 =?us-ascii?Q?/19WZtDy0jPfn5EX6S/ig5TMqmE3O9cj3dv8dIv/k8FDaKIqoy6v4R9v+TIR?=
 =?us-ascii?Q?m+P4mtiV1v/PNEu5UHoyoWFbPoCMOhFQgwm0Rwswo4OFczrw90zRnF94/J9c?=
 =?us-ascii?Q?k3eHD8hZXs+ciTx6Q1PTNCBCDp8Nx+biK6RwQ+Vi3kKA8A+2P05HJlP5Bg93?=
 =?us-ascii?Q?IUE/6RyuuP0+ezzfXkTnnqyElrrYMCPeDAtNV0vLFff4Dco7+42xrXVf/r15?=
 =?us-ascii?Q?hjwof/SeHluB/ea9FRSdb7tXoUS7gaQ1p5jp2msx3mOSGJB20zkD1iMVm0y7?=
 =?us-ascii?Q?C9IBHWOcaJU95HVlI7j7KGes9J/AkYRlHLxmnU8TmXmvZetlPTPcdRQDS445?=
 =?us-ascii?Q?kJvOrQlit17mhq51q1DlONzmPLpvrABl8MCAszv92pimwV0DiHs6OUe7eU6R?=
 =?us-ascii?Q?NwauXLDw+2+RjqHJDfz8OtsjKq2HeSsjGwUxaTjIitfRwBUANkC9ByGHBnjh?=
 =?us-ascii?Q?QqkxVngfmRX+z8AJjwu+saznglKKAkUiMIXN7vTRzStaZDPfAj0Keatx9Lt3?=
 =?us-ascii?Q?e/LISUrk/nElGr+adbG7t+DdUvhd7urOZ1sh84OsHckIiUcq4WEKXkmR2pqs?=
 =?us-ascii?Q?S8H2gEz9g1AGsaY5J94gSAZiJzhoUAVMYFUp+Zv2U0yauniT75vGvgwDFmMJ?=
 =?us-ascii?Q?qIdqBf/Vpg+/gFdxuJI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:10:38.2082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63555095-06a4-4380-77b4-08de22cf2f6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
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

Use TTM_NUM_MOVE_FENCES as an upperbound of how many fences
ttm might need to deal with moves/evictions.

---
v2: removed drm_err calls
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c                  | 5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c                 | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c                | 6 ++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c                  | 3 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c                    | 3 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 6 ++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c    | 6 ++----
 7 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ecdfe6cb36cc..0338522761bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -916,9 +916,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			goto out_free_user_pages;
 
 		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			/* One fence for TTM and one for each CS job */
 			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
-						 1 + p->gang_size);
+						 TTM_NUM_MOVE_FENCES + p->gang_size);
 			drm_exec_retry_on_contention(&p->exec);
 			if (unlikely(r))
 				goto out_free_user_pages;
@@ -928,7 +927,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 
 		if (p->uf_bo) {
 			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
-						 1 + p->gang_size);
+						 TTM_NUM_MOVE_FENCES + p->gang_size);
 			drm_exec_retry_on_contention(&p->exec);
 			if (unlikely(r))
 				goto out_free_user_pages;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index ce073e894584..2fe6899f6344 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -353,7 +353,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 
 	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&exec) {
-		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
+		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, TTM_NUM_MOVE_FENCES);
 		drm_exec_retry_on_contention(&exec);
 		if (unlikely(r))
 			goto out_unlock;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 79bad9cbe2ab..b92561eea3da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -326,11 +326,9 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
-	if (r) {
-		dev_err(adev->dev, "allocating fence slot failed (%d)\n", r);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
+	if (r)
 		goto error_unlock;
-	}
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR)
 		domain = amdgpu_display_supported_domains(adev, rbo->flags);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 2f8e83f840a8..aaa44199e9f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2630,7 +2630,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	}
 
 	amdgpu_vm_bo_base_init(&vm->root, vm, root_bo);
-	r = dma_resv_reserve_fences(root_bo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(root_bo->tbo.base.resv,
+				    TTM_NUM_MOVE_FENCES);
 	if (r)
 		goto error_free_root;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index ffb7b36e577c..968cef1cbea6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -627,9 +627,8 @@ svm_range_vram_node_new(struct kfd_node *node, struct svm_range *prange,
 		}
 	}
 
-	r = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(bo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
 	if (r) {
-		pr_debug("failed %d to reserve bo\n", r);
 		amdgpu_bo_unreserve(bo);
 		goto reserve_bo_failed;
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 56cb866ac6f8..ceb55dd183ed 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -952,11 +952,9 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct drm_plane *plane,
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
-	if (r) {
-		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
+	if (r)
 		goto error_unlock;
-	}
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR)
 		domain = amdgpu_display_supported_domains(adev, rbo->flags);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc87..110f0173eee6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -106,11 +106,9 @@ static int amdgpu_dm_wb_prepare_job(struct drm_writeback_connector *wb_connector
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
-	if (r) {
-		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
+	if (r)
 		goto error_unlock;
-	}
 
 	domain = amdgpu_display_supported_domains(adev, rbo->flags);
 
-- 
2.43.0

