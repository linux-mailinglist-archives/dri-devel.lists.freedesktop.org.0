Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA32BC7866F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9277810E81A;
	Fri, 21 Nov 2025 10:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M3IHdITo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A67F10E81A;
 Fri, 21 Nov 2025 10:14:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wt3c8qYzxGrKfRuMj2SBZWI86ox2yT5qUyIAXD2M6e1OJS7tGNtRoT+AcVQ3kc8psj26GEcWyx7feqna4wvk9IJCU4a9ng3wnuatAMMvIX/YNJYDtyuQMmPfKc5OlKLT0688Qaliw0v1lbQHJ3FvbDddZjiEhanz4iYxUcYCJz0hjd1yojh8VW1GRi8hck9ngfAGHU/ze42WA5dZx8CGxWzrG33wdmvOxChgAtB+XyowczBg9d6GaxKkpBw/4CzzxPeJpSEWlGmKt9HdO/D5scchoacolSoDlA+fp7H9BG5KsJXZd1GLsNhHJ7thfdk07AIVuEs2ZNSmjqBaPzvsPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DFZMDYHBebPFDsyDDbMSscEXUDehMbrQe5KLF2qFw8=;
 b=D3YDThCz8OnkSgjV/ylzf+QuTbLwUPQaX9U2E/yMH7UNyfY3Q7KwQGt5s4qBR2vkFsDfy3NrELM7in+BuSqsOIgNQK58GEy8djk3X7u1TUSQR10UR2piFLX1ccmpz+OKG3T0blwDixq5FHK5VYo6C87w18ByNI2p/3lpoxYhw4TKRBzyeHGH9a1kb3NDTlqhYRPtTvEl6/UE+3I7HPDMzzX2MZSm4w41LlBIzEM9eY+8RgKEzTUicfvnOITL6+F558meM+3p9EsvcFCT5r6t1J1FtEMM4aUk/JRZu0jSPdb4BFK5YM6SWqG/tyhG8JwpoXUIvO+NoHKKUodatPhrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DFZMDYHBebPFDsyDDbMSscEXUDehMbrQe5KLF2qFw8=;
 b=M3IHdITo7AUrDzSJNJw8uPuexNPxHI8GyLVHXAdG3Aw1j0ZLErYjl9SpxH07vZ4VswHGV9gs90Xc0zG80PQ6kX62yP1PGrXz8d/gJqcKLE/yNCkyxyYogRWmtexrr/G0h9rNYotpn6o80IipkHSQ5CHVWGF2e9oYvpPXruiuUg0=
Received: from MN2PR07CA0004.namprd07.prod.outlook.com (2603:10b6:208:1a0::14)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:14:21 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:1a0:cafe::17) by MN2PR07CA0004.outlook.office365.com
 (2603:10b6:208:1a0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:14:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:14:21 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:14:19 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v3 06/28] drm/amdgpu: add amdgpu_ttm_job_submit helper
Date: Fri, 21 Nov 2025 11:12:16 +0100
Message-ID: <20251121101315.3585-7-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 2021f780-fc61-47e8-0f68-08de28e6bcf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iMehQsd8oI8Zo7ycYIc7o+bX9hxDPsyAfi38rqoawTADAtNpk0DrI0AAczgw?=
 =?us-ascii?Q?74NRimPJAyoPkkTDzfCZ/Vo0CWfNDywBrHU2IVkTXq/CRoRC+kdtwhDjZqba?=
 =?us-ascii?Q?jvYkS+gBrgJd14JehZcyAdbNqiLnqsqnRGxPyEkrxwkbKmswj4Z1VZbZ2zrd?=
 =?us-ascii?Q?a5PcehxyYyVCT0EwESMUaL1qM1gC40oqid9NGrUThqhuzxDHcbZ61Voj2Em5?=
 =?us-ascii?Q?zzfUOxcgaZ6Qe4K9IYLmtgasbfh6LALFlWXwRKsG2FebYhHEXL9oQpGjrwzh?=
 =?us-ascii?Q?D9P9oKZl47pnhe6EGUYNSTbtm+Yh5nCu2v+rVhNw8hjARrRxEsCI9n0NjUVj?=
 =?us-ascii?Q?6Qk3vwloltt/cHWD5m9nTxJYUpLQFgkzdAu9C8BVk2x3934c2fEw7MNFpm3z?=
 =?us-ascii?Q?/Cv44EoUptheVJGJw/ujabKLTOQe9ym6ewC4xeiKJwNKXdUB4mdAzdyRkiBS?=
 =?us-ascii?Q?KKmF0MYF6w4C4qVQHDI8z0iZ/8r7PGE59HNP6qXg4PTd5hA6owfZ/4yBiYMj?=
 =?us-ascii?Q?Ufd6R7+VAdqbk8DzXnyuRsylgTZjCKAK94JlXh1W9MQPmv7rqX1pUU4zwC8X?=
 =?us-ascii?Q?kvqST4D28OV13uW2ZW605ROsMkav+tI7Y6ZVsmecf/KygCknyYzjL33p1Glx?=
 =?us-ascii?Q?xnEaZyv8yK4jbcKuMEi6QzGKe5bkpPbEzaZNr3KGQ/xlCdKdLpsriNKn9boR?=
 =?us-ascii?Q?5E6Q8MXRgmYEsg6KGFflJDALNWoQb85a9g8n36EwAUiCtxAweQGEA4qpivgj?=
 =?us-ascii?Q?z+xvLqphy0u+3ZqxjXD4Qku+Fntu2FBaZHAztYVW7DAYQWc1GOCe695A+SEA?=
 =?us-ascii?Q?4gKhUAX856hItxgVy8edeNANRjQW4QQ2De2ZMf3B3mzVdUA6y0OmLB3tTtX/?=
 =?us-ascii?Q?tzXY4tVm9SL0DVVbgozp6qNqwBLGF5T+LE74t0iIMqb9kl83/g2b62bSYkOJ?=
 =?us-ascii?Q?oVVavr8yI50wisOOo9BAlffPNVdAlWfaSjhBMVbi/ja9udzSc14UT3vOcaHR?=
 =?us-ascii?Q?/iCi1D/63BJlaOG7yPB88Mbwz6SU1bRTMVAmQc9OmUTFRuEkHGqPGWj6nu8g?=
 =?us-ascii?Q?e7LAkjRTttr0pl2wfvuynRy8an4lUZUUtrZChHTL8X5UOphh5A5U1nOgnKgl?=
 =?us-ascii?Q?lSutqLUDmheAOBddmcDtKYsKO5VnjQ7Wwa4gQX+/j+J82V4MB1iO7eLfSWq1?=
 =?us-ascii?Q?67BRJL4qq+mOsanjkGRMygDw7L21Yq+/KekotDbxj46NQYN1kIJ4xw8OKdz3?=
 =?us-ascii?Q?seUALM3EYwY0S3+JYLUUDaQBo79C9Cx842FLDDAtYYxAmDx+UvHbPgw+YwyJ?=
 =?us-ascii?Q?ri6UOUH72Uhx6B4ZQoLhzY9AkIMNTDemNpXogmXS5V20AM10ABJDBBBenvgs?=
 =?us-ascii?Q?rLzng+v5EG7ciJsijTqDskgMVBkju1mnLVQwMV+8i3M6I3mIm9jnlu2lJSuR?=
 =?us-ascii?Q?BmvZzDRHi7kfyCCrvbtD5fMQ9N48ltoVZ3LXLUfFrSicXAA7dLiPX/0MRubP?=
 =?us-ascii?Q?kG9jto4jBxV92xassF8Ie5aFgOrPUx84/T5UbOGQOWp+One966Y89vg7X86X?=
 =?us-ascii?Q?ccPD/7nq8lmLwBKgs5E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:14:21.0398 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2021f780-fc61-47e8-0f68-08de28e6bcf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425
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

Deduplicate the IB padding code and will also be used
later to check locking.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 34 ++++++++++++-------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 17e1892c44a2..be1232b2d55e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -162,6 +162,18 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	*placement = abo->placement;
 }
 
+static struct dma_fence *
+amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 num_dw)
+{
+	struct amdgpu_ring *ring;
+
+	ring = adev->mman.buffer_funcs_ring;
+	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
+	WARN_ON(job->ibs[0].length_dw > num_dw);
+
+	return amdgpu_job_submit(job);
+}
+
 /**
  * amdgpu_ttm_map_buffer - Map memory into the GART windows
  * @adev: the device being used
@@ -185,7 +197,6 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 {
 	unsigned int offset, num_pages, num_dw, num_bytes;
 	uint64_t src_addr, dst_addr;
-	struct amdgpu_ring *ring;
 	struct amdgpu_job *job;
 	void *cpu_addr;
 	uint64_t flags;
@@ -240,10 +251,6 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
 				dst_addr, num_bytes, 0);
 
-	ring = adev->mman.buffer_funcs_ring;
-	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
-	WARN_ON(job->ibs[0].length_dw > num_dw);
-
 	flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, mem);
 	if (tmz)
 		flags |= AMDGPU_PTE_TMZ;
@@ -261,7 +268,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 		amdgpu_gart_map_vram_range(adev, pa, 0, num_pages, flags, cpu_addr);
 	}
 
-	dma_fence_put(amdgpu_job_submit(job));
+	dma_fence_put(amdgpu_ttm_job_submit(adev, job, num_dw));
 	return 0;
 }
 
@@ -1497,10 +1504,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
 				PAGE_SIZE, 0);
 
-	amdgpu_ring_pad_ib(adev->mman.buffer_funcs_ring, &job->ibs[0]);
-	WARN_ON(job->ibs[0].length_dw > num_dw);
-
-	fence = amdgpu_job_submit(job);
+	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
 
 	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
 		r = -ETIMEDOUT;
@@ -2285,11 +2289,9 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 		byte_count -= cur_size_in_bytes;
 	}
 
-	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
-	WARN_ON(job->ibs[0].length_dw > num_dw);
-	*fence = amdgpu_job_submit(job);
 	if (r)
 		goto error_free;
+	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
 
 	return r;
 
@@ -2307,7 +2309,6 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
 			       u64 k_job_id)
 {
 	unsigned int num_loops, num_dw;
-	struct amdgpu_ring *ring;
 	struct amdgpu_job *job;
 	uint32_t max_bytes;
 	unsigned int i;
@@ -2331,10 +2332,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
 		byte_count -= cur_size;
 	}
 
-	ring = adev->mman.buffer_funcs_ring;
-	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
-	WARN_ON(job->ibs[0].length_dw > num_dw);
-	*fence = amdgpu_job_submit(job);
+	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
 	return 0;
 }
 
-- 
2.43.0

