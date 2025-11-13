Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9ACC5897C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5780B10E884;
	Thu, 13 Nov 2025 16:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aOZYjczY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF7610E880;
 Thu, 13 Nov 2025 16:09:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REska99V12yWANAW2sS22ALuBtaa2Fx3BgmXBGiAGCTXFVqXnkvqMOhCdRqzmtla2VgpZYPloDdRcdsL6x28ApGPA9LNF97wgVmt1PSHFD5+HGNcZ2Da8PRmkm63LToEUMj8iIvzib1LBZ2uFwQyr/itgJdXFpbEjcFmt1XSMSe2UwkWct1ZhCoG/InMowf9A8KsSVy0YJ/Ts4uaSrOs6HHeBBqxeJNHcyiiafU6CdzWz3Myt87Aj9MIGZmw7PmSp9UkBLTW1wWbQEo3ThnTxU1Oj7gVqtjBbOz6qVlLzjujASyciCD8s/4C9DeocQXKkgEr0kpoFvJrNbyF1iV67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78ZkSTiA49OEqnuHu5gVkr7/CfpOTZLtY5ddvNJY+HQ=;
 b=VVUN0+Gq0kK+dYPrwVRM5SAv7Z5lx0BHfdLrmmm6N/x6pMUUvgzkd3UQO40mF17YjAouhN8bJG4aKP71CKD83WOy1myaDzk/fHXf5UD15RugtTbe9Uk2/fzyPlK7tRgYQzFvCnrAAPA3g6C6mnuB65TVDliE8drmscN4X9Pi1UVnHqc/yQGV1z5njqKwV2vdpZfqp5yk3E1ssR6nKXfGXluhvQ1UNoZl6qSzR9GjUf7ojtJRwsVYp7HIXIirWE0oI0eQw6TBQ5NOvxxpvwKiv4zesxXqi639eZuEyrMyQF+MOL6yksi0zpGUfM1qsn0OFxqKJznT5ov4vx6S1GW0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78ZkSTiA49OEqnuHu5gVkr7/CfpOTZLtY5ddvNJY+HQ=;
 b=aOZYjczYlJdQUKf/bzUeJlr0xPHw1tzOyLkuJ57Ay0VHuqiA7xmqtCkBIUmSMaFBWi+ex/ooaxhiypZtkJHgNkEdXIt3qPogu6ZKxvE/wNn74JUZo7SWp17p4xmYIaQYwxXalGnsWdpWPCQVW80UEFXM3rWhNU/tClPALwfdZOs=
Received: from CH0PR03CA0396.namprd03.prod.outlook.com (2603:10b6:610:11b::16)
 by CH3PR12MB7524.namprd12.prod.outlook.com (2603:10b6:610:146::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:09:03 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::c0) by CH0PR03CA0396.outlook.office365.com
 (2603:10b6:610:11b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:09:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:09:00 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:08:58 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 06/20] drm/amdgpu: statically assign gart windows to ttm
 entities
Date: Thu, 13 Nov 2025 17:05:47 +0100
Message-ID: <20251113160632.5889-7-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|CH3PR12MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 91069092-8051-41d5-9a9e-08de22cef571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ldNfTL3w9Y0ryxVl+M/GvXzsuHNHx5objROg1WYNBxhOeVCzkbcm9Qa0GyBA?=
 =?us-ascii?Q?sNz0Frn+OuUSZExTnhM4Fnv/K0zG/7ZKtRmBt9vVSpx76F0DhEhh0KGNPaVy?=
 =?us-ascii?Q?f8C3HAY33bRIIWbsIPrjtY/PfQaxp/tb9zG3EZg+MX7/xAjaBtqGg4Mwr9pm?=
 =?us-ascii?Q?7jvPxcad/b5P2LZlKFZV4wEWQzAotMu+yBg21lRB6hulGfzxYWUcG71rRm9Q?=
 =?us-ascii?Q?Npaum+pU8ho/24sEH5+LJ1PzaXP+U/gqwE33NxxCLn3yWkWkKLW+joLG41Sd?=
 =?us-ascii?Q?bEQZAyuiEF4wDnF7LPeoL8gcL1yz4mucQu5gitlOA3bsftQuLC+rhzRTJ6Pi?=
 =?us-ascii?Q?rfB5+UB7AqsoipCNxA7XpwszMgKhmrEs/XPDyoqDCyP+c9D3IEkdzfb8JMiD?=
 =?us-ascii?Q?nx2cbZiGhGrphq8ZirSdsQm07HribeWSKfv63YUPMLJ7rMv/yIZRj7h8Q+29?=
 =?us-ascii?Q?LqVefCFdQZIwQpxGjoZ1Fl1RhmPPw4QMMjZZaaVhZrGrfw3QyfyzZZJlKf3p?=
 =?us-ascii?Q?IUFeG5TnZfBYF3eacrvqUWD2q4xwzFLoVNUJlsfYAZq8XXq6dESowhh162Lv?=
 =?us-ascii?Q?BxMFJP5z5AUNEPtXM9xxgPsmx/SSGrTlagsN/ciQJN25cSI/i+D/ev0fMD8z?=
 =?us-ascii?Q?VY78VWlvowD5zm708s+nOwe5X4wuVWMSK2+Nddsn5J9kgR3drHaoUqM1mHz4?=
 =?us-ascii?Q?5I1hG9clCg0sKriLRPvnxWB8H7o9u2YUDSu/KKyRP4yi4Sm3Urv1ygno7n6b?=
 =?us-ascii?Q?e2qfp2AA8ltFPFakx4N5274IMESXC1SsjTQpDboOjCKxatKo7mxuVGodJnc8?=
 =?us-ascii?Q?UNQN9nn5RlM66BskZHINIh3nS69VHPse7S+6gnl7NvJKzQU9G+fyLMTBQMO4?=
 =?us-ascii?Q?TJvVtJQXCo67oylvP4YrNR0yf+1fzEstpJ8qn5sRjdTrkaL7xKVimqRNK0vp?=
 =?us-ascii?Q?kok8CZ+HUQewj2reth1cwVf8n4zJb9wJB3bdFxhY7RttV1tq2BaBff5EMlhI?=
 =?us-ascii?Q?gP+cKgSsmgtDRLvej8Kz5cyYxgMOuv9jt6hF6pHTaqhOqrb/5rkTvQjKWSpv?=
 =?us-ascii?Q?0p+ZVcYL7d4Nl9Yvqt9RuAR7JYqgzKDafiX5EfiqzihGOXbwMVjcBGARE7y0?=
 =?us-ascii?Q?n83gn1pQJxPESmhML/XDNXYaKYpAoccougFBQ5vkuCflL00Ih5ejInSYBKqC?=
 =?us-ascii?Q?oOcMYG5itHQgLuduBjauitUJgBajaM/dGO8t5JYfZD0WDBQmHN1odwDoedAu?=
 =?us-ascii?Q?eVmD6MVlGE26VFpCG91/DRTL53ZKnqcVKOMaBbifuoF8GNcwXW4sapOL5Dlk?=
 =?us-ascii?Q?cBrRaj77pOzeGNKr0wBk8FL97ZcSCdtR7TlqoMJntjk3YtEdJ+CzVVjvJ8cp?=
 =?us-ascii?Q?zGAwheXBk/cZ/G6dBLBXyLeYfybpCoW5PkNtQP8FDXFcgy20EcBnlG28urJI?=
 =?us-ascii?Q?SkHGEQl3HnlhK/kUe+65lI0NtRyGcR/Lv9vwSNmKlaOF0YikI+wd4VXjmoVw?=
 =?us-ascii?Q?aGRML69P1URdZG9d6MpLLoeH6q4BiQI+zrCvTZcCehilFUcnKwgSzYocJicr?=
 =?us-ascii?Q?pTKm9oZcLKhLdsggxPM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:09:00.9147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91069092-8051-41d5-9a9e-08de22cef571
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7524
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

If multiple entities share the same window we must make sure
that jobs using them are executed sequentially.

This commit gives separate window id to each entity, so jobs
from multiple entities could execute in parallel if needed.
(for now they all use the first sdma engine, so it makes no
difference yet).

default_entity doesn't get any windows reserved since there is
no use for them.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  9 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 50 ++++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  |  9 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  8 ++--
 4 files changed, 46 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 8e2d41c9c271..2a444d02cf4b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -686,7 +686,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 * translation. Avoid this by doing the invalidation from the SDMA
 	 * itself at least for GART.
 	 */
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&adev->mman.clear_entity.gart_window_lock);
+	mutex_lock(&adev->mman.move_entity.gart_window_lock);
 	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
@@ -699,7 +700,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	fence = amdgpu_job_submit(job);
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
+	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
@@ -707,7 +709,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	return;
 
 error_alloc:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
+	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
 	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c8d59ca2b3bd..7193a341689d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -291,7 +291,7 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
  */
 __attribute__((nonnull))
 static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
-				      struct drm_sched_entity *entity,
+				      struct amdgpu_ttm_buffer_entity *entity,
 				      const struct amdgpu_copy_mem *src,
 				      const struct amdgpu_copy_mem *dst,
 				      uint64_t size, bool tmz,
@@ -314,7 +314,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
 	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->gart_window_lock);
 	while (src_mm.remaining) {
 		uint64_t from, to, cur_size, tiling_flags;
 		uint32_t num_type, data_format, max_com, write_compress_disable;
@@ -324,15 +324,15 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
 
 		/* Map src to window 0 and dst to window 1. */
-		r = amdgpu_ttm_map_buffer(entity,
+		r = amdgpu_ttm_map_buffer(&entity->base,
 					  src->bo, src->mem, &src_mm,
-					  0, ring, tmz, &cur_size, &from);
+					  entity->gart_window_id0, ring, tmz, &cur_size, &from);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_map_buffer(entity,
+		r = amdgpu_ttm_map_buffer(&entity->base,
 					  dst->bo, dst->mem, &dst_mm,
-					  1, ring, tmz, &cur_size, &to);
+					  entity->gart_window_id1, ring, tmz, &cur_size, &to);
 		if (r)
 			goto error;
 
@@ -359,7 +359,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 							     write_compress_disable));
 		}
 
-		r = amdgpu_copy_buffer(ring, entity, from, to, cur_size, resv,
+		r = amdgpu_copy_buffer(ring, &entity->base, from, to, cur_size, resv,
 				       &next, true, copy_flags);
 		if (r)
 			goto error;
@@ -371,7 +371,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		amdgpu_res_next(&dst_mm, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->gart_window_lock);
 	*f = fence;
 	return r;
 }
@@ -401,7 +401,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	dst.offset = 0;
 
 	r = amdgpu_ttm_copy_mem_to_mem(adev,
-				       &adev->mman.move_entity.base,
+				       &adev->mman.move_entity,
 				       &src, &dst,
 				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
@@ -1893,8 +1893,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	uint64_t gtt_size;
 	int r;
 
-	mutex_init(&adev->mman.gtt_window_lock);
-
 	dma_set_max_seg_size(adev->dev, UINT_MAX);
 	/* No others user of address space so set it to 0 */
 	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
@@ -2207,6 +2205,15 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
 			goto error_free_entity;
 		}
+
+		/* Statically assign GART windows to each entity. */
+		mutex_init(&adev->mman.default_entity.gart_window_lock);
+		adev->mman.move_entity.gart_window_id0 = 0;
+		adev->mman.move_entity.gart_window_id1 = 1;
+		mutex_init(&adev->mman.move_entity.gart_window_lock);
+		/* Clearing entity doesn't use id0 */
+		adev->mman.clear_entity.gart_window_id1 = 2;
+		mutex_init(&adev->mman.clear_entity.gart_window_lock);
 	} else {
 		drm_sched_entity_destroy(&adev->mman.default_entity.base);
 		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
@@ -2371,6 +2378,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ttm_buffer_entity *entity;
 	struct amdgpu_res_cursor cursor;
 	u64 addr;
 	int r = 0;
@@ -2381,11 +2389,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 	if (!fence)
 		return -EINVAL;
 
+	entity = &adev->mman.clear_entity;
 	*fence = dma_fence_get_stub();
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->gart_window_lock);
 	while (cursor.remaining) {
 		struct dma_fence *next = NULL;
 		u64 size;
@@ -2398,13 +2407,13 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity.base,
+		r = amdgpu_ttm_map_buffer(&entity->base,
 					  &bo->tbo, bo->tbo.resource, &cursor,
-					  1, ring, false, &size, &addr);
+					  entity->gart_window_id1, ring, false, &size, &addr);
 		if (r)
 			goto err;
 
-		r = amdgpu_ttm_fill_mem(ring, &adev->mman.clear_entity.base, 0, addr, size, resv,
+		r = amdgpu_ttm_fill_mem(ring, &entity->base, 0, addr, size, resv,
 					&next, true,
 					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (r)
@@ -2416,12 +2425,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		amdgpu_res_next(&cursor, size);
 	}
 err:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->gart_window_lock);
 
 	return r;
 }
 
-int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
+int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
@@ -2442,7 +2451,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->gart_window_lock);
 	while (dst.remaining) {
 		struct dma_fence *next;
 		uint64_t cur_size, to;
@@ -2452,7 +2461,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  &bo->tbo, bo->tbo.resource, &dst,
-					  1, ring, false, &cur_size, &to);
+					  entity->gart_window_id1, ring, false,
+					  &cur_size, &to);
 		if (r)
 			goto error;
 
@@ -2468,7 +2478,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 		amdgpu_res_next(&dst, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->gart_window_lock);
 	if (f)
 		*f = dma_fence_get(fence);
 	dma_fence_put(fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index e1655f86a016..f4f762be9fdd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -39,7 +39,7 @@
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
-#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
+#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
@@ -54,6 +54,9 @@ struct amdgpu_gtt_mgr {
 
 struct amdgpu_ttm_buffer_entity {
 	struct drm_sched_entity base;
+	struct mutex		gart_window_lock;
+	u32			gart_window_id0;
+	u32			gart_window_id1;
 };
 
 struct amdgpu_mman {
@@ -69,7 +72,7 @@ struct amdgpu_mman {
 
 	struct mutex				gtt_window_lock;
 
-	struct amdgpu_ttm_buffer_entity default_entity;
+	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
 	struct amdgpu_ttm_buffer_entity clear_entity;
 	struct amdgpu_ttm_buffer_entity move_entity;
 
@@ -177,7 +180,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring,
 int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_resv *resv,
 			    struct dma_fence **fence);
-int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
+int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 09756132fa1b..bc47fc362a17 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -60,7 +60,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
 	int r;
 
 	/* use gart window 0 */
-	*gart_addr = adev->gmc.gart_start;
+	*gart_addr = entity->gart_window_id0;
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = npages * 8;
@@ -116,7 +116,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
  * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait for
  * the last sdma finish fence which is returned to check copy memory is done.
  *
- * Context: Process context, takes and releases gtt_window_lock
+ * Context: Process context, takes and releases gart_window_lock
  *
  * Return:
  * 0 - OK, otherwise error code
@@ -138,7 +138,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 
 	entity = &adev->mman.move_entity;
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->gart_window_lock);
 
 	while (npages) {
 		size = min(GTT_MAX_PAGES, npages);
@@ -175,7 +175,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 	}
 
 out_unlock:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->gart_window_lock);
 
 	return r;
 }
-- 
2.43.0

