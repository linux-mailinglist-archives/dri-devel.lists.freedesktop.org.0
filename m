Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED12C58973
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D65410E87E;
	Thu, 13 Nov 2025 16:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tYUeLzrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430E010E879;
 Thu, 13 Nov 2025 16:08:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbXzKDBIVPsOORM21EKlK5VRmQrAYgi0vvEfgdjn1lCCyqb11sEIfO1p8DShINhRbtW6fr5UTvSQI2CBiUKXvvab2lP8UTLc+XB0nTildUMg4EV/SbboA9tcaRYpnBoo7bJKPFAeGxzGpLFhqB0YpmTpHWvgCRjNZQIi+fr/RgplLbkh2falFNeVdA+tFGtGoLZrv5hqPJRYBNdwboWv4sdlHXvr4oVSSC3MYitwz4LztuehUOhEpANoqxDuziV0YB2oRASlp/IwKKoNq8aPeOafth/hZeN6J7DohndxtlSo/VLkgDrIGb8cGly1+yEi5geSsA9+Tv+vFxXOBFkdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rjLrLmglT+XrDHN7Wv7aURaNZ/9anVO6wUs+izJ8bo=;
 b=uEUgds+J/nBFg0VtzjHSCCJivZeGfhu9c0mr1ONAVcdHhbY/vF8RmWKnbsGN96/1AL1yMS0cgbAOm+uqC8NSRvZWZ8ARrDs5UtQb0l8atBJDdk4Ic5Fy0p3wc7xaFHHNO0ztO/Aya5HBOJICUqsMwhH/+M7zVBBdYpdq2J6zlgGNt4nswH/onnoJF2pejJUarZdsocvtg2kV/QLHoCPMHB5xcFqCU5oH77k4JyjAbkk2syEbu3hLLmJ34mEbNa4jLG9FraU+YP2U6pwF1vxAB3WRfulGZOPI72I+43pImW0JTDSnhBZKjoBARNvn64QV2Hvw2lPqg/Zq59F3Lqjnsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rjLrLmglT+XrDHN7Wv7aURaNZ/9anVO6wUs+izJ8bo=;
 b=tYUeLzrjq1f2NNHbJoBVBsxpkMWmqWdGkzsfhYxHdV37T0K3gyL5RFUAUZFfmK1akEAea2H4mwFhN81574bpD+DbL/3ny/yNTjYo3wG8YcohLqQpqtqsEvL35rJmznyDGcBWCZA65uR4uNwQGwceQAGrX+AbtJMehica7GB83n8=
Received: from CH0PR03CA0406.namprd03.prod.outlook.com (2603:10b6:610:11b::14)
 by BL3PR12MB6595.namprd12.prod.outlook.com (2603:10b6:208:38e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:08:50 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::42) by CH0PR03CA0406.outlook.office365.com
 (2603:10b6:610:11b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Thu,
 13 Nov 2025 16:08:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:08:50 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:08:47 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v2 05/20] drm/amdgpu: pass the entity to use to ttm functions
Date: Thu, 13 Nov 2025 17:05:46 +0100
Message-ID: <20251113160632.5889-6-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|BL3PR12MB6595:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd695ab-cf5f-48b7-cf0b-08de22ceef09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sG3CLsMoeFNFZbBJ0esQ6TPP81I8iXNDWpiixnMMmKAxXie+bv7ORRG1uOjA?=
 =?us-ascii?Q?XIgCgBntICs4/XnUg9xxlNFb5BSL5btapMM5Dr0AqxiZ9hqZkPgjKNRZTCMh?=
 =?us-ascii?Q?cMog2VpGg1Bk3YZJgmNiIqcSSfBq7sn96eku3gqpjXRY6LMspi5t3fO41Ipb?=
 =?us-ascii?Q?n7MpvuNf3ftgq23VdothVfg4OH0JvJXLsScjpCkR3mXpp3CfYAkiGFvq4eiO?=
 =?us-ascii?Q?6108SNReOSrJQuwmo7J2jbIpAqevXeIz/r/1d3J8dLOX5lZ5H1w1uZH2QA4b?=
 =?us-ascii?Q?pAgNcRhZknqYcKAZZNjmcV4KLxuk0IZ+3c7KsWqT/4RbOG824rA2wSw0bO2Y?=
 =?us-ascii?Q?vUQb0FU4tDsSA4n9cwanYk0irqUYtliFaCe5kGlz4yy7otCDu7j4FF6Z7q5I?=
 =?us-ascii?Q?u/WBRTUCBaFpEOChKvx0qxT1Care6Sy3vG2Du4pD7yxOmFskiTwmsFDcPvSd?=
 =?us-ascii?Q?5ziECyByVwsQS5meoYiYBm7kjZdC62x4OoTauzmsmAwpBV3twuAg+FzQgFS5?=
 =?us-ascii?Q?gXssuZSKqtXglXH2HGTJVsbiBo2FK8H05yEllZ4JhLCsFBgbcRUNpU4fqFjO?=
 =?us-ascii?Q?wJRoHlpG41XC2LB2e2IN0/MgEGlg8E3SLjmILBRGvftARs1+tj2BBx3tBI6X?=
 =?us-ascii?Q?sZO9aFvVYDDSCZDPq4TWl9UOP2a2Pc28oxd9ulHc6Ab1zzY3SEP8wk2TqAxA?=
 =?us-ascii?Q?9udDceGMQkNsKa5mZz9tzLyXI8jSaKbqmrzcZK422LCCsI454ica01F5dnLh?=
 =?us-ascii?Q?wR+RsJyWe7f2LYVH4bpZnhQt0OHJP1avD3u08gQGL6T4plYCh2aB9EuMmLFJ?=
 =?us-ascii?Q?rX7G9XV84zrbDfyVqc4xwnNCfoeM5VkwTbN84ayPQ71K3h49dSYC3Uw1GITI?=
 =?us-ascii?Q?CTZGSpXuk/ps28t/1572cvlaqvn0ehkvK2gBkwEi4nW68OtIHGmmJPc/HWEY?=
 =?us-ascii?Q?B33C4eKmP4nK/PYOsdeYpXGwvxTucbal1m5bhNCC/yC8c4fHbifbWYxTM+tE?=
 =?us-ascii?Q?7KAry/LSJaDlRY2EBFxmhVOneb/5D7S3sW6EKd2qz9oWvHVUUPlCjINuuH7X?=
 =?us-ascii?Q?l1wiw8SlKDiUXyWAPXh2fVj6PYb8mrPsBG3jJuTyvu+5T1KvFziQZ+WHCV6Z?=
 =?us-ascii?Q?/zBkUUFl0bbgM+ogdSxnREWJbPfGTGZMiI4wzDGe2hFiPmfPMLEao0D02rFc?=
 =?us-ascii?Q?J2vzOGykaM6+bjT6PjU+4RQAfGuOtyPAi0pxQTbULTAytkYengSOza1qyq41?=
 =?us-ascii?Q?LbWq7QmmHI7VSvyhQfxE/BIWCWETnZmynTaNVlP9E+fbXVj7u3XT86aT1vos?=
 =?us-ascii?Q?ExW9aYhopl4VkqPEYLxFI+W6s7Utz+Ji73ana6ZkhFF6FUbusXdtZXa8swhu?=
 =?us-ascii?Q?kv6yfDTFjnGHXWeL2SZlrtVDiyQI2ZRubUeZM1iz/5x6vKm7e5kIwb083hcB?=
 =?us-ascii?Q?sBEypyqZ9IJJNZ7lboYv0wSWfXr7r0swT+jpQcN7WMwjLdNrYhYRa2z+4b2Q?=
 =?us-ascii?Q?SxY60RSYpnxko6uMy65e6OCXML+kfZPiNqzGzGZERT8dePdnFiyp5/isMnNr?=
 =?us-ascii?Q?p+c8jsYIX1ZH/qi6pzk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:08:50.1632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd695ab-cf5f-48b7-cf0b-08de22ceef09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6595
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

This way the caller can select the one it wants to use.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 75 +++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       | 16 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
 5 files changed, 60 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index 02c2479a8840..b59040a8771f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -38,7 +38,8 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 	stime = ktime_get();
 	for (i = 0; i < n; i++) {
 		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
-		r = amdgpu_copy_buffer(ring, saddr, daddr, size, NULL, &fence,
+		r = amdgpu_copy_buffer(ring, &adev->mman.default_entity.base,
+				       saddr, daddr, size, NULL, &fence,
 				       false, 0);
 		if (r)
 			goto exit_do_move;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index e08f58de4b17..c06c132a753c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1321,8 +1321,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
-			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
+			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 42d448cd6a6d..c8d59ca2b3bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -164,6 +164,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 
 /**
  * amdgpu_ttm_map_buffer - Map memory into the GART windows
+ * @entity: entity to run the window setup job
  * @bo: buffer object to map
  * @mem: memory object to map
  * @mm_cur: range to map
@@ -176,7 +177,8 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
  * Setup one of the GART windows to access a specific piece of memory or return
  * the physical address for local memory.
  */
-static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
+static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
+				 struct ttm_buffer_object *bo,
 				 struct ttm_resource *mem,
 				 struct amdgpu_res_cursor *mm_cur,
 				 unsigned int window, struct amdgpu_ring *ring,
@@ -224,7 +226,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
 
-	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
+	r = amdgpu_job_alloc_with_ib(adev, entity,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4 + num_bytes,
 				     AMDGPU_IB_POOL_DELAYED, &job,
@@ -274,6 +276,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 /**
  * amdgpu_ttm_copy_mem_to_mem - Helper function for copy
  * @adev: amdgpu device
+ * @entity: entity to run the jobs
  * @src: buffer/address where to read from
  * @dst: buffer/address where to write to
  * @size: number of bytes to copy
@@ -288,6 +291,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
  */
 __attribute__((nonnull))
 static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
+				      struct drm_sched_entity *entity,
 				      const struct amdgpu_copy_mem *src,
 				      const struct amdgpu_copy_mem *dst,
 				      uint64_t size, bool tmz,
@@ -320,12 +324,14 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
 
 		/* Map src to window 0 and dst to window 1. */
-		r = amdgpu_ttm_map_buffer(src->bo, src->mem, &src_mm,
+		r = amdgpu_ttm_map_buffer(entity,
+					  src->bo, src->mem, &src_mm,
 					  0, ring, tmz, &cur_size, &from);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_map_buffer(dst->bo, dst->mem, &dst_mm,
+		r = amdgpu_ttm_map_buffer(entity,
+					  dst->bo, dst->mem, &dst_mm,
 					  1, ring, tmz, &cur_size, &to);
 		if (r)
 			goto error;
@@ -353,7 +359,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 							     write_compress_disable));
 		}
 
-		r = amdgpu_copy_buffer(ring, from, to, cur_size, resv,
+		r = amdgpu_copy_buffer(ring, entity, from, to, cur_size, resv,
 				       &next, true, copy_flags);
 		if (r)
 			goto error;
@@ -394,7 +400,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	src.offset = 0;
 	dst.offset = 0;
 
-	r = amdgpu_ttm_copy_mem_to_mem(adev, &src, &dst,
+	r = amdgpu_ttm_copy_mem_to_mem(adev,
+				       &adev->mman.move_entity.base,
+				       &src, &dst,
 				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
 				       bo->base.resv, &fence);
@@ -406,8 +414,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
-				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
+		r = amdgpu_fill_buffer(&adev->mman.move_entity,
+				       abo, 0, NULL, &wipe_fence,
+				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
@@ -2223,16 +2232,15 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
+				  struct drm_sched_entity *entity,
 				  unsigned int num_dw,
 				  struct dma_resv *resv,
 				  bool vm_needs_flush,
 				  struct amdgpu_job **job,
-				  bool delayed, u64 k_job_id)
+				  u64 k_job_id)
 {
 	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
 	int r;
-	struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
-						    &adev->mman.move_entity.base;
 	r = amdgpu_job_alloc_with_ib(adev, entity,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4, pool, job, k_job_id);
@@ -2252,7 +2260,9 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 						   DMA_RESV_USAGE_BOOKKEEP);
 }
 
-int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
+int amdgpu_copy_buffer(struct amdgpu_ring *ring,
+		       struct drm_sched_entity *entity,
+		       uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
@@ -2274,8 +2284,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
 	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
-	r = amdgpu_ttm_prepare_job(adev, num_dw,
-				   resv, vm_needs_flush, &job, false,
+	r = amdgpu_ttm_prepare_job(adev, entity, num_dw,
+				   resv, vm_needs_flush, &job,
 				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
 	if (r)
 		return r;
@@ -2304,11 +2314,13 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	return r;
 }
 
-static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
+static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
+			       struct drm_sched_entity *entity,
+			       uint32_t src_data,
 			       uint64_t dst_addr, uint32_t byte_count,
 			       struct dma_resv *resv,
 			       struct dma_fence **fence,
-			       bool vm_needs_flush, bool delayed,
+			       bool vm_needs_flush,
 			       u64 k_job_id)
 {
 	struct amdgpu_device *adev = ring->adev;
@@ -2321,8 +2333,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
 	max_bytes = adev->mman.buffer_funcs->fill_max_bytes;
 	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
-	r = amdgpu_ttm_prepare_job(adev, num_dw, resv, vm_needs_flush,
-				   &job, delayed, k_job_id);
+	r = amdgpu_ttm_prepare_job(adev, entity, num_dw, resv,
+				   vm_needs_flush, &job, k_job_id);
 	if (r)
 		return r;
 
@@ -2386,13 +2398,14 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
+		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity.base,
+					  &bo->tbo, bo->tbo.resource, &cursor,
 					  1, ring, false, &size, &addr);
 		if (r)
 			goto err;
 
-		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
-					&next, true, true,
+		r = amdgpu_ttm_fill_mem(ring, &adev->mman.clear_entity.base, 0, addr, size, resv,
+					&next, true,
 					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (r)
 			goto err;
@@ -2408,12 +2421,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 	return r;
 }
 
-int amdgpu_fill_buffer(struct amdgpu_bo *bo,
-			uint32_t src_data,
-			struct dma_resv *resv,
-			struct dma_fence **f,
-			bool delayed,
-			u64 k_job_id)
+int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
+		       struct amdgpu_bo *bo,
+		       uint32_t src_data,
+		       struct dma_resv *resv,
+		       struct dma_fence **f,
+		       u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
@@ -2437,13 +2450,15 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &dst,
+		r = amdgpu_ttm_map_buffer(&entity->base,
+					  &bo->tbo, bo->tbo.resource, &dst,
 					  1, ring, false, &cur_size, &to);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
-					&next, true, delayed, k_job_id);
+		r = amdgpu_ttm_fill_mem(ring, &entity->base,
+					src_data, to, cur_size, resv,
+					&next, true, k_job_id);
 		if (r)
 			goto error;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index d2295d6c2b67..e1655f86a016 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -167,7 +167,9 @@ int amdgpu_ttm_init(struct amdgpu_device *adev);
 void amdgpu_ttm_fini(struct amdgpu_device *adev);
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
 					bool enable);
-int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
+int amdgpu_copy_buffer(struct amdgpu_ring *ring,
+		       struct drm_sched_entity *entity,
+		       uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
@@ -175,12 +177,12 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_resv *resv,
 			    struct dma_fence **fence);
-int amdgpu_fill_buffer(struct amdgpu_bo *bo,
-			uint32_t src_data,
-			struct dma_resv *resv,
-			struct dma_fence **fence,
-			bool delayed,
-			u64 k_job_id);
+int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
+		       struct amdgpu_bo *bo,
+		       uint32_t src_data,
+		       struct dma_resv *resv,
+		       struct dma_fence **f,
+		       u64 k_job_id);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
 void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index d74ff6e90590..09756132fa1b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -157,7 +157,8 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 			goto out_unlock;
 		}
 
-		r = amdgpu_copy_buffer(ring, gart_s, gart_d, size * PAGE_SIZE,
+		r = amdgpu_copy_buffer(ring, &entity->base,
+				       gart_s, gart_d, size * PAGE_SIZE,
 				       NULL, &next, true, 0);
 		if (r) {
 			dev_err(adev->dev, "fail %d to copy memory\n", r);
-- 
2.43.0

