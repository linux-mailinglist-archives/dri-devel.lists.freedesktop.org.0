Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA168C589EE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0729310E89E;
	Thu, 13 Nov 2025 16:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C1llwbQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1208710E865;
 Thu, 13 Nov 2025 16:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTkzNId76t5T908Ne+VKPbDbJSJXfzmDALuunBxG6VGXr3DeoA0TzIxMBdqRcy/SS06kDsuJ+cLyztH1t3/QgqKMVwNxpLgnBvwkpVt6hdVhni3bqvWW5to4LFfbFpb5MAHTVhvK3DKETdSpr1FnNFl/Ajsc6yzvFR2pZT27Y+fiygMV1PkyPxfl6uuf57bQAJ6FGfZ0vMQBepx88JOqBOMq1C5Qpd31MYh7XMZBVT55PkMY9mKVIrCijk8JYd92TJawsIm5J4WGQbRozrwZBbXYEVOSJOWL8qFd8oR1VCEODky48BU+IEhLrsxVD2F1wIv+Q2wSpDQNRwXrPKTshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFZ2eaw//3WCmkB7SjUIMEagBrNAQ4dospOtvl02RhY=;
 b=jtMEzDc3ItzdoIk+7y0BFf16pHi5rxPit6tHzazFgbjKEt/bzWTo9VPHS0Afs/t60QLeVr0VZ/bY/A03RsE/AGr9CuWxaWsY4ZxzO7r34TWRnLW0TNtb2PUxMZekABoxw9yJIFgJb1HZgVZEPeCH1EYrzTHK+6VnO7Td/nO69CNm8kr/TfVnRfWav1D6zgh66MxQKrbozy3wd9S37DmnUxCOn3OWLwlmaksKXDdxrZ0mQe++wRtbfSV4piIlIuFitZtJVqM+SMiUZAXLiKBLX7laVB78WX1XM6Q0d0RqRtyL+mOBom6LJsJ4GX8z5IsmA38lxe7EJNu2IgJP2TZ+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFZ2eaw//3WCmkB7SjUIMEagBrNAQ4dospOtvl02RhY=;
 b=C1llwbQEEoRBGk2xQZbTf3TknRid5JkNafTidkQe/enaDxrJ9JCtJLR8U7LT9Gslbts/XU5TJk6Lbzibs1jDP823WbNbc03CZB/4O5u9cycTGQYqRAK70Ud3io80yvG3mo4Dn/n5cTMIKE0Rso3fEX4kTNPg9ln/LKOvqCTrzok=
Received: from MN2PR07CA0021.namprd07.prod.outlook.com (2603:10b6:208:1a0::31)
 by LV8PR12MB9359.namprd12.prod.outlook.com (2603:10b6:408:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:12:02 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::11) by MN2PR07CA0021.outlook.office365.com
 (2603:10b6:208:1a0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Thu,
 13 Nov 2025 16:11:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:12:01 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:11:55 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 15/20] drm/amdgpu: pass all the sdma scheds to amdgpu_mman
Date: Thu, 13 Nov 2025 17:05:56 +0100
Message-ID: <20251113160632.5889-16-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|LV8PR12MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a5ca59-50fe-4746-0165-08de22cf60f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vj4gtnBVfg9KYNtwNh80Fa9Pyzj5oYuNYyZEkJiRrUHWEQb/O4lx1ookZlUQ?=
 =?us-ascii?Q?zsB4wlFEkWxF3mNw2bingAr0aoVP0SCzI9+du/nfU1c8TcqyfJP/GlpWZSOV?=
 =?us-ascii?Q?1H7/StZm3haCuy6V+4PMrWHOUSAvOso2wk8Fvc0UA7gJm6O1TSfLCxij+hSC?=
 =?us-ascii?Q?nmer0bWlHP4cAT5vj3B2HAFc07XGLWI6TA/mI6WQ4TplQKKFH2pn4GYq2aQS?=
 =?us-ascii?Q?35nSSx0S7pW5+OketYwe0lZ5/ZBF6Q6JIloOezCMQ7tExa6ISL9oQKS7anEq?=
 =?us-ascii?Q?G3gFASXxAO8TDhAqdqc/MdduXmzBojshe1rFQ20YYNhIKcqZ4HeDjHGRLplb?=
 =?us-ascii?Q?gt2NWPobOqw4J3ixrRfso3I4C5owdj5/MyLPj8UWUuBCcia8ZbwFPwWIuS6Q?=
 =?us-ascii?Q?Lk7B/gTyi8PgpRmYefk1ZhHQGIEg6AjIXdVABkbSmTcsaHHg0z/uk+OU0BBB?=
 =?us-ascii?Q?Yo8j7bMtqoCmaNjhpriZHOiw/4VbF872uM/UR7eC07yEHZCm/Lp5vbUBEbni?=
 =?us-ascii?Q?6fwSWchzna+W2ygTWr81H+A+QxCuwFwiyg3cb4HOy/71tQl7qI3Bkt5fOnK4?=
 =?us-ascii?Q?AnGQLhiEomVajbBxh3f5fGO3o380udVr7RwcdecS9g5luEBJo8Cb1DauNDU0?=
 =?us-ascii?Q?CEog0sowTdCBRZV9tge11YsgJXrJO0g1FwG2MfmZFfvXCQhuWC5sSZ4qjHmw?=
 =?us-ascii?Q?hXmLtsBMOzN7+k1jF/NqXe1SeIbkPYwn2L+GeEyrLTTGi+WnZ2mr8wY+TxKY?=
 =?us-ascii?Q?+4cbe/4f4wR9ysDU3BI3XJOtJPDsi3y4S5l6Tbdl9N1ea2Exb6b1R5GgCDYw?=
 =?us-ascii?Q?iQsM+5FIQ+Fqaaw8BJIFgSdqfhtuMl4zw3vrHlBk/CobOMDsGLxo5fJjaYSm?=
 =?us-ascii?Q?0esKBeHp/KydLHWsv8n857U+4U5ArRFl8te/Iz15wkPPNA1cA2K0l/lQgVd2?=
 =?us-ascii?Q?QolNuFCavqnrUDAATM1n5guQNd5zSMGsb95fzMR5v01ccyempyZjxtjBAyIH?=
 =?us-ascii?Q?LX11XJGqO4QLXLq4sFihzPbXYXCOAM6ECH2XXn3+9clG4nNba4sMMuYWBOBi?=
 =?us-ascii?Q?tZIF46Yzil623/q63pvf/qln1aYiXIZlizQlGY3d2f1jwn3TUy/cn2CB9RjO?=
 =?us-ascii?Q?nJuvUuPutdNukfxXXwuD5ySyot4vGUVbxipnGKupCzXqSj3fEc5YxbcKqbVt?=
 =?us-ascii?Q?Kp8t5erBfyFqaDcT5tXnVk5X70GZf7ERNtoc8RLCN/Rxf/UFCHiwLFH4zzor?=
 =?us-ascii?Q?tP1FTLPreHnokX4N6m9ucxIzL1rbKm0r6t1GSdoBjQtwK6PdaMYsPXCu1R4K?=
 =?us-ascii?Q?I4htcaATEcB9JSZ9mJcENOBRBFUm0JCeUPfMsgACTGykM7W62KjZklRT3S8f?=
 =?us-ascii?Q?ZcaKIa1sNC69WXcyvqzgpGHNIhqrOReSLgobE20EwBYPr6HzFf3wENTQxNRp?=
 =?us-ascii?Q?RUSJ8C/GjBfC3Iw982tXIFL39AqZNmBn/0Grzl6htCJKq5X2n5wcjm+K/Qr1?=
 =?us-ascii?Q?l/C950rkCKTNnry4PNH9DUxUDMVRZVUM0Vfx31crf2RLWTcN/uEBvZ8Z7Ggn?=
 =?us-ascii?Q?ES+ddJW+5oi1TnwFjMY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:12:01.3121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a5ca59-50fe-4746-0165-08de22cf60f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9359
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

This will allow the use of all of them for clear/fill buffer
operations.
Since drm_sched_entity_init requires a scheduler array, we
store schedulers rather than rings. For the few places that need
access to a ring, we can get it from the sched using container_of.

Since the code is the same for all sdma versions, add a new
helper amdgpu_sdma_set_buffer_funcs_scheds to set buffer_funcs_scheds
based on the number of sdma instances.

Note: the new sched array is identical to the amdgpu_vm_manager one.
These 2 could be merged.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  8 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 41 +++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  6 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  6 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  6 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  6 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  3 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c           |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
 17 files changed, 62 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 3fab3dc9f3e4..05c13fb0e6bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1615,6 +1615,8 @@ ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
 ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
 void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
 				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
+void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
+					 const struct amdgpu_buffer_funcs *buffer_funcs);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index b59040a8771f..9ea927e07a77 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -32,12 +32,14 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 				    uint64_t saddr, uint64_t daddr, int n, s64 *time_ms)
 {
 	ktime_t stime, etime;
+	struct amdgpu_ring *ring;
 	struct dma_fence *fence;
 	int i, r;
 
+	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
+
 	stime = ktime_get();
 	for (i = 0; i < n; i++) {
-		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
 		r = amdgpu_copy_buffer(ring, &adev->mman.default_entity.base,
 				       saddr, daddr, size, NULL, &fence,
 				       false, 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b92234d63562..1927d940fbca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3303,7 +3303,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
-	if (adev->mman.buffer_funcs_ring->sched.ready)
+	if (adev->mman.buffer_funcs_scheds[0]->ready)
 		amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	/* Don't init kfd if whole hive need to be reset during init */
@@ -4143,7 +4143,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
 
 	r = amdgpu_device_ip_resume_phase2(adev);
 
-	if (adev->mman.buffer_funcs_ring->sched.ready)
+	if (adev->mman.buffer_funcs_scheds[0]->ready)
 		amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	if (r)
@@ -4493,7 +4493,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	adev->num_rings = 0;
 	RCU_INIT_POINTER(adev->gang_submit, dma_fence_get_stub());
 	adev->mman.buffer_funcs = NULL;
-	adev->mman.buffer_funcs_ring = NULL;
+	adev->mman.num_buffer_funcs_scheds = 0;
 	adev->vm_manager.vm_pte_funcs = NULL;
 	adev->vm_manager.vm_pte_num_scheds = 0;
 	adev->gmc.gmc_funcs = NULL;
@@ -5965,7 +5965,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 				if (r)
 					goto out;
 
-				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
+				if (tmp_adev->mman.buffer_funcs_scheds[0]->ready)
 					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
 
 				r = amdgpu_device_ip_resume_phase3(tmp_adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 2713dd51ab9a..4433d8620129 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -651,12 +651,14 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_device *adev)
 void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 			      uint32_t vmhub, uint32_t flush_type)
 {
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring;
 	struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
 	struct dma_fence *fence;
 	struct amdgpu_job *job;
 	int r, i;
 
+	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
+
 	if (!hub->sdma_invalidation_workaround || vmid ||
 	    !adev->mman.buffer_funcs_enabled || !adev->ib_pool_ready ||
 	    !ring->sched.ready) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6c333dba7a35..11fec0fa4c11 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -308,7 +308,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 				      struct dma_resv *resv,
 				      struct dma_fence **f)
 {
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring;
 	struct amdgpu_res_cursor src_mm, dst_mm;
 	struct dma_fence *fence = NULL;
 	int r = 0;
@@ -321,6 +321,8 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		return -EINVAL;
 	}
 
+	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
+
 	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
 	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
 
@@ -1493,6 +1495,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
 	struct amdgpu_res_cursor src_mm;
+	struct amdgpu_ring *ring;
 	struct amdgpu_job *job;
 	struct dma_fence *fence;
 	uint64_t src_addr, dst_addr;
@@ -1530,7 +1533,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
 				PAGE_SIZE, 0);
 
-	amdgpu_ring_pad_ib(adev->mman.buffer_funcs_ring, &job->ibs[0]);
+	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
+	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
 
 	fence = amdgpu_job_submit(job);
@@ -2196,11 +2200,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		return windows;
 
 	if (enable) {
-		struct amdgpu_ring *ring;
 		struct drm_gpu_scheduler *sched;
 
-		ring = adev->mman.buffer_funcs_ring;
-		sched = &ring->sched;
+		sched = adev->mman.buffer_funcs_scheds[0];
 		r = drm_sched_entity_init(&adev->mman.default_entity.base,
 					  DRM_SCHED_PRIORITY_KERNEL, &sched,
 					  1, NULL);
@@ -2432,7 +2434,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_fence **fence)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring;
 	struct amdgpu_ttm_buffer_entity *entity;
 	struct amdgpu_res_cursor cursor;
 	u64 addr;
@@ -2443,6 +2445,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 
 	if (!fence)
 		return -EINVAL;
+
+	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
 	entity = &adev->mman.clear_entities[0];
 	*fence = dma_fence_get_stub();
 
@@ -2494,9 +2498,9 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
+	struct amdgpu_ring *ring;
 	int r, e;
 
 	if (!adev->mman.buffer_funcs_enabled) {
@@ -2505,6 +2509,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		return -EINVAL;
 	}
 
+	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
+
 	if (entity == NULL) {
 		e = atomic_inc_return(&adev->mman.next_clear_entity) %
 				      adev->mman.num_clear_entities;
@@ -2579,6 +2585,27 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
 	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
 }
 
+void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
+					 const struct amdgpu_buffer_funcs *buffer_funcs)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
+	struct drm_gpu_scheduler *sched;
+	int i;
+
+	adev->mman.buffer_funcs = buffer_funcs;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		if (adev->sdma.has_page_queue)
+			sched = &adev->sdma.instance[i].page.sched;
+		else
+			sched = &adev->sdma.instance[i].ring.sched;
+		adev->mman.buffer_funcs_scheds[i] = sched;
+	}
+
+	adev->mman.num_buffer_funcs_scheds = hub->sdma_invalidation_workaround ?
+		1 : adev->sdma.num_instances;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static int amdgpu_ttm_page_pool_show(struct seq_file *m, void *unused)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 4844f001f590..63c3e2466708 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -66,7 +66,8 @@ struct amdgpu_mman {
 
 	/* buffer handling */
 	const struct amdgpu_buffer_funcs	*buffer_funcs;
-	struct amdgpu_ring			*buffer_funcs_ring;
+	struct drm_gpu_scheduler		*buffer_funcs_scheds[AMDGPU_MAX_RINGS];
+	u32					num_buffer_funcs_scheds;
 	bool					buffer_funcs_enabled;
 
 	struct mutex				gtt_window_lock;
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 5fe162f52c92..a36385ad8da8 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -1333,8 +1333,7 @@ static const struct amdgpu_buffer_funcs cik_sdma_buffer_funcs = {
 
 static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &cik_sdma_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &cik_sdma_buffer_funcs);
 }
 
 static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 63636643db3d..4a3ba136a36c 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -1228,8 +1228,7 @@ static const struct amdgpu_buffer_funcs sdma_v2_4_buffer_funcs = {
 
 static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v2_4_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v2_4_buffer_funcs);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 0153626b5df2..3cf527bcadf6 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1670,8 +1670,7 @@ static const struct amdgpu_buffer_funcs sdma_v3_0_buffer_funcs = {
 
 static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v3_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v3_0_buffer_funcs);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 96a67b30854c..7e106baecad5 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2608,11 +2608,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_0_buffer_funcs = {
 
 static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v4_0_buffer_funcs;
-	if (adev->sdma.has_page_queue)
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
-	else
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_0_buffer_funcs);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 04dc8a8f4d66..7cb0e213bab2 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -2309,11 +2309,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_4_2_buffer_funcs = {
 
 static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v4_4_2_buffer_funcs;
-	if (adev->sdma.has_page_queue)
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
-	else
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_4_2_buffer_funcs);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 19c717f2c602..eab09c5fc762 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -2066,10 +2066,8 @@ static const struct amdgpu_buffer_funcs sdma_v5_0_buffer_funcs = {
 
 static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	if (adev->mman.buffer_funcs == NULL) {
-		adev->mman.buffer_funcs = &sdma_v5_0_buffer_funcs;
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
-	}
+	if (adev->mman.buffer_funcs == NULL)
+		amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_0_buffer_funcs);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 7a07b8f4e86d..e843da1dce59 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -2076,10 +2076,8 @@ static const struct amdgpu_buffer_funcs sdma_v5_2_buffer_funcs = {
 
 static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	if (adev->mman.buffer_funcs == NULL) {
-		adev->mman.buffer_funcs = &sdma_v5_2_buffer_funcs;
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
-	}
+	if (adev->mman.buffer_funcs == NULL)
+		amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_2_buffer_funcs);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 8f8228c7adee..d078bff42983 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1884,8 +1884,7 @@ static const struct amdgpu_buffer_funcs sdma_v6_0_buffer_funcs = {
 
 static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v6_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v6_0_buffer_funcs);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index cf412d8fb0ed..77ad6f128e75 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1826,8 +1826,7 @@ static const struct amdgpu_buffer_funcs sdma_v7_0_buffer_funcs = {
 
 static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v7_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v7_0_buffer_funcs);
 }
 
 static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 863e00086c30..4f6d7eeceb37 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -826,8 +826,7 @@ static const struct amdgpu_buffer_funcs si_dma_buffer_funcs = {
 
 static void si_dma_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &si_dma_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &si_dma_buffer_funcs);
 }
 
 static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 943c3438c7ee..3f7b85aabb72 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -129,13 +129,14 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 			     struct dma_fence **mfence)
 {
 	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring;
 	struct amdgpu_ttm_buffer_entity *entity;
 	u64 gart_s, gart_d;
 	struct dma_fence *next;
 	u64 size;
 	int r;
 
+	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
 	entity = &adev->mman.move_entities[0];
 
 	mutex_lock(&entity->gart_window_lock);
-- 
2.43.0

