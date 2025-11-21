Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0670C7866D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC6310E819;
	Fri, 21 Nov 2025 10:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WjmsJLs3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012052.outbound.protection.outlook.com
 [40.93.195.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0262D10E818;
 Fri, 21 Nov 2025 10:14:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSxaOh2Gy/M00Do3k3Y+IX73ngiuXt011tXPu38gyVhuIWd4b3aH3YcgjfHN85EYWygCqIJZZS2nu5RDcILnR2oyzc3JHKGMMLJym4Cuci2Bis1k3Q87f9lxCAb3ayT9e747diA9MIwHFB5bmNLk4T4EZ4mW+O3Lr/I4RPFQ52TrGL3QPZkrEhQ7blhRHdNjzTBheU3RaA1LKZJwps/nyWBgHwufHm7W1bVJ39wkItblW2SfvprMiGaTTi2ULHC7hnRF4YXkiPZ2EOEOIbUaaCUwwGoPRZKNo8KigppXWGVHtLYwQJ7wuMh1a9LhprQUT0PZmSxb9L7Hlj9z7qrcvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QTmn/ra4901gpUoDoklZwBtnm7FaQnLDGlun43iRoM=;
 b=Lhnu5XNp+OzakAN/6YQNDqVTItZAGLRHWaLF6yNlVMfQ0CqAOnUanPH2zkb7wYrAXKz1QVD1g9MFCYFSZMhHH6axVfAgBTR1gAGXTxNZsGmZhGI2MaS+G38fr3QWKOwr82YnK4IKR14d3Gf5Lubfq4FBcuLxZHU8V0mrY3iWiCTFA2l+WG+cfmAfhVdcoxWSYEC6UBPWpgv3KVu6+BDPsotNYlegpZhtzMovgBC0nfl9zevryOddiFB006SUO5+Q71KxInnh20EqVUgY/YNXvVREasP4o5Y7/B0p/srK7vW1ZV+S/PuBpKodN7CKT7wVslSFnSpSQMKcpS4kV2aEug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QTmn/ra4901gpUoDoklZwBtnm7FaQnLDGlun43iRoM=;
 b=WjmsJLs3u19mdAr9QckBY68+hpVnVfGQH3wS5E8lnNs4AprO6Mn4owPNeTwzTRWHAxGsnmFhtOsSf+MyRTs3OSXIh9KADbLsGDlbkZqsjUHVpleOVvHmaE9xcXbtrua4S0gAYjk3f8rPpNKw3Ws798Anzgr9LKCOkPZ4K6gUzyc=
Received: from BN9PR03CA0584.namprd03.prod.outlook.com (2603:10b6:408:10d::19)
 by SA3PR12MB9225.namprd12.prod.outlook.com (2603:10b6:806:39e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:14:08 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:10d:cafe::c2) by BN9PR03CA0584.outlook.office365.com
 (2603:10b6:408:10d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 10:14:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:14:08 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:14:06 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 04/28] drm/amdgpu: remove the ring param from ttm functions
Date: Fri, 21 Nov 2025 11:12:14 +0100
Message-ID: <20251121101315.3585-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|SA3PR12MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e66c87-b4dd-480a-09a2-08de28e6b551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZsDBtdgcqt1sFbcAEKLCxJMBCOIbbUHrn+75xP+JYGnO9jWwCiPVwDRjMvfe?=
 =?us-ascii?Q?l/0dzyujE5I20ztj1c4i4tOvaXxwNJefkTLP08+9Hw7/lMxkhX45Qwl+LmJm?=
 =?us-ascii?Q?lIuOi/S1Cd0rFkdN7rAJf/eSxZSyVQ2dIfXEeqHP7SNB1TbKjmq2fcA7ADtl?=
 =?us-ascii?Q?qJNtmE5DTcVlqMmlv77f32GbJjGk7/uisTxj8PdKIc53Qcm5osPlBFI02DDA?=
 =?us-ascii?Q?2FkwUcfCmkywZs1RbbCEW5C0sfDdJnhD2znXKwZiNqhF3Hd6L/1pobDWZZ9Y?=
 =?us-ascii?Q?KbUAdY108ozHCgZI3GYGjmKTXMHQUCHr+0RFXl6pcshMZ3XCjGqVQmuS0Qcq?=
 =?us-ascii?Q?n+ZUasqn1d624Tln2Gx9J7XuUbJmp/LWNocYHl3vPM8yYWUDA8vx0d2v26AV?=
 =?us-ascii?Q?eoI7RtFmHVFVA856apaQyEdrrQ3f0zfZnjUWFufwwN5/UZ455ojc5KuAM+y0?=
 =?us-ascii?Q?gbUapLSJIgz2irocexQIK7JzMufx59AtdHlILR1j+cGDu0Z2vjhVdW2nim4n?=
 =?us-ascii?Q?ODNU/Y6SesByYBjQn1dpb1TWsrQhzxQkaq4xhcuRjk0LtKl5Cmki2Hs4pP3n?=
 =?us-ascii?Q?h/qn4O+LH071EV6/yJ6rnpZZPztgUw5pbUmsNCtHFuQlbD8QSNOtTRDGGavb?=
 =?us-ascii?Q?j/wNTO8YrI/ctuDuZpzWzeVzbrr9doY992bH0juF3QVj7OBRRovCulWeXamy?=
 =?us-ascii?Q?YgEbtv8amVWfCtRTUYuAT4GymNUGDEClelBcqKYxtHx9CrqnEw4uOk5z4SBr?=
 =?us-ascii?Q?FMbnAlZXw/M5ppcspozl0Bh0i0Oj08T8UirozlJ07jw937SFkmzSgsodGLUD?=
 =?us-ascii?Q?X2gUzN1Jd22JC8DHOT/EoRb6BOyYVFK4QqYLNa/oS1GOoua4pSN0peL3YcKK?=
 =?us-ascii?Q?tSTpvf3xnKX4ccPBRpeLCdl1unayyPFrkWq5TQWR2evSCOS57/UESkUUqTYO?=
 =?us-ascii?Q?K3ko17N7IotUY91hzqoCZkbbLlKTdDJJkPuiAtznS6sCFiRKRyobwfK440Bv?=
 =?us-ascii?Q?UK0/Sqj2Xt5mHofS0MH0bYM4xe9UHEbn0aExjrE5k3GRgRalNTe0HneMghY/?=
 =?us-ascii?Q?VVpuVVZJmwXD15eeQN6731zmuuGnCnXJNMaBKCy0FABdMBpbmkEOOBVwfayZ?=
 =?us-ascii?Q?DN4vjarZWJqz7cvvBMvNUT2lssqMFlQow0rNGiqwXsZ9fvPkUlUeEIjqsrh4?=
 =?us-ascii?Q?4f0E9CnQTrqBAhQ7GkNHrnB09jTMZDAEBrUu4bHpSOD7DGDDesQ6BkKe0ies?=
 =?us-ascii?Q?n4QnC0MrWNnLnkZpcSMFHBwf5+58Hhy2sAiPgmT34gWxdQALoGG+ID6Z+Vts?=
 =?us-ascii?Q?FcRuoYRqWqds21L0e5VFE+D71fyNPbrcQntgvjO22/kgcJF9/NwmeGn4Loe9?=
 =?us-ascii?Q?zrqJ5VMX5j//uxqWQC1aK4Nd8Ym+XmAA/0wholDfm/wiDZlBOPGHmEt1q9Lz?=
 =?us-ascii?Q?xaIVRNPUqMTk0vzKjBYhr3pmQzNDYPC7zpIbIdp7p36yhIk4YRbnFXKJS6VY?=
 =?us-ascii?Q?fWwThlDZLX8oIaICx9LkudcZ+j7BSDPdYJD6nX6ohypM3UezkkYzQnspR90O?=
 =?us-ascii?Q?wHdKOpMW49xPNH/2L8s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:14:08.2348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e66c87-b4dd-480a-09a2-08de28e6b551
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9225
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

With the removal of the direct_submit argument, the ring param
becomes useless: the jobs are always submitted to buffer_funcs_ring.

Some functions are getting an amdgpu_device argument since they
were getting it from the ring arg.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 46 ++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  2 +-
 4 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index 02c2479a8840..3636b757c974 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -37,8 +37,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 
 	stime = ktime_get();
 	for (i = 0; i < n; i++) {
-		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
-		r = amdgpu_copy_buffer(ring, saddr, daddr, size, NULL, &fence,
+		r = amdgpu_copy_buffer(adev, saddr, daddr, size, NULL, &fence,
 				       false, 0);
 		if (r)
 			goto exit_do_move;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 071afbacb3d2..d54b57078946 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -164,11 +164,11 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 
 /**
  * amdgpu_ttm_map_buffer - Map memory into the GART windows
+ * @adev: the device being used
  * @bo: buffer object to map
  * @mem: memory object to map
  * @mm_cur: range to map
  * @window: which GART window to use
- * @ring: DMA ring to use for the copy
  * @tmz: if we should setup a TMZ enabled mapping
  * @size: in number of bytes to map, out number of bytes mapped
  * @addr: resulting address inside the MC address space
@@ -176,15 +176,16 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
  * Setup one of the GART windows to access a specific piece of memory or return
  * the physical address for local memory.
  */
-static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
+static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
+				 struct ttm_buffer_object *bo,
 				 struct ttm_resource *mem,
 				 struct amdgpu_res_cursor *mm_cur,
-				 unsigned int window, struct amdgpu_ring *ring,
+				 unsigned int window,
 				 bool tmz, uint64_t *size, uint64_t *addr)
 {
-	struct amdgpu_device *adev = ring->adev;
 	unsigned int offset, num_pages, num_dw, num_bytes;
 	uint64_t src_addr, dst_addr;
+	struct amdgpu_ring *ring;
 	struct amdgpu_job *job;
 	void *cpu_addr;
 	uint64_t flags;
@@ -239,6 +240,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
 				dst_addr, num_bytes, 0);
 
+	ring = adev->mman.buffer_funcs_ring;
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
 
@@ -286,7 +288,6 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 				      struct dma_resv *resv,
 				      struct dma_fence **f)
 {
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
 	struct amdgpu_res_cursor src_mm, dst_mm;
 	struct dma_fence *fence = NULL;
 	int r = 0;
@@ -312,13 +313,13 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
 
 		/* Map src to window 0 and dst to window 1. */
-		r = amdgpu_ttm_map_buffer(src->bo, src->mem, &src_mm,
-					  0, ring, tmz, &cur_size, &from);
+		r = amdgpu_ttm_map_buffer(adev, src->bo, src->mem, &src_mm,
+					  0, tmz, &cur_size, &from);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_map_buffer(dst->bo, dst->mem, &dst_mm,
-					  1, ring, tmz, &cur_size, &to);
+		r = amdgpu_ttm_map_buffer(adev, dst->bo, dst->mem, &dst_mm,
+					  1, tmz, &cur_size, &to);
 		if (r)
 			goto error;
 
@@ -345,7 +346,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 							     write_compress_disable));
 		}
 
-		r = amdgpu_copy_buffer(ring, from, to, cur_size, resv,
+		r = amdgpu_copy_buffer(adev, from, to, cur_size, resv,
 				       &next, true, copy_flags);
 		if (r)
 			goto error;
@@ -2232,19 +2233,21 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 						   DMA_RESV_USAGE_BOOKKEEP);
 }
 
-int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
+int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags)
 {
-	struct amdgpu_device *adev = ring->adev;
 	unsigned int num_loops, num_dw;
+	struct amdgpu_ring *ring;
 	struct amdgpu_job *job;
 	uint32_t max_bytes;
 	unsigned int i;
 	int r;
 
+	ring = adev->mman.buffer_funcs_ring;
+
 	if (!ring->sched.ready) {
 		dev_err(adev->dev,
 			"Trying to move memory with ring turned off.\n");
@@ -2284,15 +2287,15 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	return r;
 }
 
-static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
+static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
 			       uint64_t dst_addr, uint32_t byte_count,
 			       struct dma_resv *resv,
 			       struct dma_fence **fence,
 			       bool vm_needs_flush, bool delayed,
 			       u64 k_job_id)
 {
-	struct amdgpu_device *adev = ring->adev;
 	unsigned int num_loops, num_dw;
+	struct amdgpu_ring *ring;
 	struct amdgpu_job *job;
 	uint32_t max_bytes;
 	unsigned int i;
@@ -2316,6 +2319,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
 		byte_count -= cur_size;
 	}
 
+	ring = adev->mman.buffer_funcs_ring;
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
 	*fence = amdgpu_job_submit(job);
@@ -2338,7 +2342,6 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_fence **fence)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
 	struct amdgpu_res_cursor cursor;
 	u64 addr;
 	int r = 0;
@@ -2366,12 +2369,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
-					  1, ring, false, &size, &addr);
+		r = amdgpu_ttm_map_buffer(adev, &bo->tbo, bo->tbo.resource, &cursor,
+					  1, false, &size, &addr);
 		if (r)
 			goto err;
 
-		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
+		r = amdgpu_ttm_fill_mem(adev, 0, addr, size, resv,
 					&next, true, true,
 					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (r)
@@ -2396,7 +2399,6 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
 	int r;
@@ -2417,12 +2419,12 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &dst,
-					  1, ring, false, &cur_size, &to);
+		r = amdgpu_ttm_map_buffer(adev, &bo->tbo, bo->tbo.resource, &dst,
+					  1, false, &cur_size, &to);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
+		r = amdgpu_ttm_fill_mem(adev, src_data, to, cur_size, resv,
 					&next, true, delayed, k_job_id);
 		if (r)
 			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 50e40380fe95..76e00a6510c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -163,7 +163,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev);
 void amdgpu_ttm_fini(struct amdgpu_device *adev);
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
 					bool enable);
-int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
+int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 378af0b2aaa9..0ad44acb08f2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -152,7 +152,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 			goto out_unlock;
 		}
 
-		r = amdgpu_copy_buffer(ring, gart_s, gart_d, size * PAGE_SIZE,
+		r = amdgpu_copy_buffer(adev, gart_s, gart_d, size * PAGE_SIZE,
 				       NULL, &next, true, 0);
 		if (r) {
 			dev_err(adev->dev, "fail %d to copy memory\n", r);
-- 
2.43.0

