Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A8EC7865E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0DC10E813;
	Fri, 21 Nov 2025 10:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UwD4wBLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4D610E810;
 Fri, 21 Nov 2025 10:14:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCgHAUUCGbPQfIyR6sSU+Q5m/tpjoRvorpIuJT2x5w/B7AW2jyazRCoPB1vBo87nKJzqmLMgjB+HtbM0GWqwzZQhZJoKAa0nohYLP6ZqYPHeePWrElFJO8PLrkvlR+6U2NsNFEAPnUMpjihv2ynK1n40o6wgAtPCaCKsqdSYUK1Lr9aw5HIST35C1YTPJBmQayOzmfiW3xRvJ+sRAbGWrQtH94gc4Hsli/gpQe6YA8n4+bR4I/7s50DN8MprRTrUBaqN9rUF0MEvyBnSjqpecvA6fy0lykUulv3vO1Tp6MvVh6BOPOIFGAPjROiZa/rXDcCeBM0dr9ZbkPIQ/9d/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISRyLtvs/LvW+8bmrVE8tXkaZMA9Tj+pJDMxEvGgWd4=;
 b=OtPSpB34XpkWvWhIfNkcv2ekETnpF39mAAhWLAMPPq5qf6m4etNfkc3VzTCaa5qQwU8gPI1U+52JtuDQzt6rF8+0ucpg7Ig8zbvvQU1ghCuQwZDz4+kBMBkgbTgljV+Nzv69ih9dRNC7YAARWvs5jMy9WrZ8z0vZHA3Iz5DOXxcgM6z1D1D98Nrun8QYzjwfqon1N6xYS7pTdwlHKORRg9ebCVbPh/oi7RfUc3Kv9YWSMeEMwLpcdPvMfwotfqJ6jwkZDAxqJvHd/5GlQnIPEW6zd2b8IDGLOVyz46GSC3SNHHgje2fP4pmabCFPh1k7Z4SMeGoB6EAboLlqPWiMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISRyLtvs/LvW+8bmrVE8tXkaZMA9Tj+pJDMxEvGgWd4=;
 b=UwD4wBLhzD6LEo6Z0thUonPcGubSKZSVBSzS/NrCE7lZu5wDq+hQODoFeCw86awSTgvojtrTMOIZ+7kG68pco4LwwlC84nS7TLjwsDeK/Q6Tl6S8BSTJypbC0I1GCOytEdT+W2ussPUkHRv3hItD6T7SZ9sd2jdkSTPSGaluzeg=
Received: from BN9PR03CA0606.namprd03.prod.outlook.com (2603:10b6:408:106::11)
 by DS0PR12MB9348.namprd12.prod.outlook.com (2603:10b6:8:1a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:14:01 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:106:cafe::13) by BN9PR03CA0606.outlook.office365.com
 (2603:10b6:408:106::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:13:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:14:00 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:13:58 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v3 03/28] drm/amdgpu: remove direct_submit arg from
 amdgpu_copy_buffer
Date: Fri, 21 Nov 2025 11:12:13 +0100
Message-ID: <20251121101315.3585-4-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|DS0PR12MB9348:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ccf8f6-fced-4ab3-1517-08de28e6b0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlppK3dHRkFzTjlKb2JSTy9WMGs1SS93RDBDYmhDRHFoQWpNUUhwYXh3Unhk?=
 =?utf-8?B?akp6SEZxcTIzY3ZKU3dESCsxbFZ4TWxWVGFhMHlicVRBZGt2SVFVbmc1dEJF?=
 =?utf-8?B?eDFOV0pCSkoxY09QTWwyZk8yajZYNmdOUjVYYmJUZjdRQTJHMHgwTXRYeVl6?=
 =?utf-8?B?MEdSQmMrdXZJeG5tWDJQaXFpcVMvTkRaWkJmVmhSRlNHaFlqWEY5VnU1RWM1?=
 =?utf-8?B?eUl4dXhQcDdCS3VqQmJ3MU1Na1JxMHpTaWswVEFYQmhNYVZvMEFCZkFEb2Ry?=
 =?utf-8?B?aWpaLzRJWHB0SklOUXdua3lqK2FKNVFXREk5STRlYjJHWmUwUXFxZUNVYlY2?=
 =?utf-8?B?RTVDUDEvWVo5T0dJSFJPS1FLSXRnUkU0THJMaTY1V3MzVGRsakpRT0ZWNld6?=
 =?utf-8?B?VXBiRWoxc1lJOUZsZENWQXA1dGN0OWJUempvMVRlMS85bHRtSWZWdHFydWpL?=
 =?utf-8?B?c0FvVjRZMUpDOFRtamFsR0NsQWpCTTF2bEpRTHV2czljemo4KzFKV296WmpB?=
 =?utf-8?B?V2VxV1R6SzMzR0Y4ZnBGdzdqWXZXdHBrbXltYXIzWnZEeXdzVllZSmwrL1VD?=
 =?utf-8?B?WFQzZ0RqcVU3UURSWVVTbTlMWXMyY05nQUpOT3dQRWRFbHBoTWFGOHR5SFVX?=
 =?utf-8?B?VmQzNlBocVNOaFlHby9tNTgyRUd2VVVXKytUcndES2t4UWI4YlM3bEk4RlRB?=
 =?utf-8?B?djRua1NZSzNUZ0dlNmpOZlV3NmVnazA3TitXOUhkQ0xjRTY5Q3ZqcTJWbFpU?=
 =?utf-8?B?cUF3MTFuSUE0elRzNm9rYi9BYVZkVTJIMmpISGNiVVRJYUpNdGFWUzI2YmQz?=
 =?utf-8?B?M3AzT1o4NFRuY29kQlFudktUYmFlMllaYVNZUDRNSWJhM1hWN1N4Nlhacloz?=
 =?utf-8?B?cWRGVDZZVzdXR2N0TW9sbWFyMXZwd0M4aDJ0SGg4TEY3YlEyU2hmcm51K3Zs?=
 =?utf-8?B?dEhBMSsrUFQ3V01wMDFCb1lpK2thT3RXVUVlZEEwM1dyeGRENDFWWGxXOGdo?=
 =?utf-8?B?N2JHS1c4NHNFb1pnN0M4dk91b0FGLzZWVExWbWlJMkdkUDkyQTBaT3BIUExK?=
 =?utf-8?B?dEI2SkhmdFQzNFhTem55dnVvcitjMFN2U2pGQ3pzMTlNS0E4VnN3M3hHeEVY?=
 =?utf-8?B?TUNBbTVTOGNFK28vUEdPdVhNQ2ZaZE0xOEttVGxHT0pBMEFYRmtWUFpJVk9m?=
 =?utf-8?B?cStYNzhZc1FES0NZandNVyt4RnQ5WjVrNC9ycGZMS2ljMnZxaWdSMUsvUms2?=
 =?utf-8?B?b0FOemxlRGFMRWt2dHA2UCt5Q1loeHlBdlR6S0lTczdreHhudUp3bTV1WEJi?=
 =?utf-8?B?b0twZzUwUEptNmZwa05MQklWcUhxN3c5dHhhMlEyRVlnOEV3dmQzcDNuT2tQ?=
 =?utf-8?B?eTBkTTBMTHhnVzhvN3dIdERUV04wMm1WVmMwNnhXNE1YR2poT00xQUJKTTZ3?=
 =?utf-8?B?MjBVZWZ2Y2dyS0ljQ1VOeFV6U0JDemhkalpmNmpxckZHM1d0V0JQenFuOTdn?=
 =?utf-8?B?RFlvUWM4L1ZnU0k2WU1MdWlwdFEyN2praGJReWgrKzdncmkvMlc2Q1RUTFpv?=
 =?utf-8?B?NU1zNVdiWHM0ZDJtdW5UTjlUNjZ6c3FyNy9hZTYvZzhIU0dzd2g0WTFjUVBH?=
 =?utf-8?B?ZmphTTFGeGdTRGdYUjRyVHJaeG54VTRXUk1tSUR2QVVKQVdwOW9pZ0d3NXIz?=
 =?utf-8?B?V3k5dWR5ZWVZOC92eXA2My9TQ0lkNFFIWERCMmlhT3Z1ZDJNd2R5bnI2SldI?=
 =?utf-8?B?WjBaV29iV0NHdmtVSnBaMzV0Y3Bxb3RmSVJUZ2RNVTl5OXBWU25RNlpuSEVa?=
 =?utf-8?B?UlZvL1luZURwQkNSZmdpRms4RmZoUDdab2l5YXFwZjExOXphVTRvRTN6Mnpa?=
 =?utf-8?B?cEJ5blpTTkZTYkVLUm8yQXZnZUVFalplZkJIWHhMUjdhSkZncmd4MmQvMVdP?=
 =?utf-8?B?aVZRM21VclRhVTVEVXlEUmp1OGF2NDNuUHhpOWRRSjlmTWFZeHJEdTBRSzFi?=
 =?utf-8?B?Y0N5TE8rdUpZclFkazhUV09GYXRoUnBpRzR1cXFNeitkRkNwNzUzQnBEQU5I?=
 =?utf-8?B?eVFCQWRQdnd5OEtydDVLdFgrdkpLVGNHZCszN3IzS09PYlI0RkIzN2FTK2V1?=
 =?utf-8?Q?UaPs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:14:00.7242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ccf8f6-fced-4ab3-1517-08de28e6b0d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9348
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

It was always false.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 20 +++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  2 +-
 4 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index 199693369c7c..02c2479a8840 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -39,7 +39,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 	for (i = 0; i < n; i++) {
 		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
 		r = amdgpu_copy_buffer(ring, saddr, daddr, size, NULL, &fence,
-				       false, false, 0);
+				       false, 0);
 		if (r)
 			goto exit_do_move;
 		r = dma_fence_wait(fence, false);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8d0043ad5336..071afbacb3d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -346,7 +346,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		}
 
 		r = amdgpu_copy_buffer(ring, from, to, cur_size, resv,
-				       &next, false, true, copy_flags);
+				       &next, true, copy_flags);
 		if (r)
 			goto error;
 
@@ -2203,16 +2203,13 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
-				  bool direct_submit,
 				  unsigned int num_dw,
 				  struct dma_resv *resv,
 				  bool vm_needs_flush,
 				  struct amdgpu_job **job,
 				  bool delayed, u64 k_job_id)
 {
-	enum amdgpu_ib_pool_type pool = direct_submit ?
-		AMDGPU_IB_POOL_DIRECT :
-		AMDGPU_IB_POOL_DELAYED;
+	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
 	int r;
 	struct drm_sched_entity *entity = delayed ? &adev->mman.low_pr :
 						    &adev->mman.high_pr;
@@ -2238,7 +2235,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
-		       struct dma_fence **fence, bool direct_submit,
+		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags)
 {
 	struct amdgpu_device *adev = ring->adev;
@@ -2248,7 +2245,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	unsigned int i;
 	int r;
 
-	if (!direct_submit && !ring->sched.ready) {
+	if (!ring->sched.ready) {
 		dev_err(adev->dev,
 			"Trying to move memory with ring turned off.\n");
 		return -EINVAL;
@@ -2257,7 +2254,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
 	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
-	r = amdgpu_ttm_prepare_job(adev, direct_submit, num_dw,
+	r = amdgpu_ttm_prepare_job(adev, num_dw,
 				   resv, vm_needs_flush, &job, false,
 				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
 	if (r)
@@ -2275,10 +2272,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
-	if (direct_submit)
-		r = amdgpu_job_submit_direct(job, ring, fence);
-	else
-		*fence = amdgpu_job_submit(job);
+	*fence = amdgpu_job_submit(job);
 	if (r)
 		goto error_free;
 
@@ -2307,7 +2301,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
 	max_bytes = adev->mman.buffer_funcs->fill_max_bytes;
 	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
-	r = amdgpu_ttm_prepare_job(adev, false, num_dw, resv, vm_needs_flush,
+	r = amdgpu_ttm_prepare_job(adev, num_dw, resv, vm_needs_flush,
 				   &job, delayed, k_job_id);
 	if (r)
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 577ee04ce0bf..50e40380fe95 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -166,7 +166,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
 int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
-		       struct dma_fence **fence, bool direct_submit,
+		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags);
 int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_resv *resv,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 46c84fc60af1..378af0b2aaa9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -153,7 +153,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 		}
 
 		r = amdgpu_copy_buffer(ring, gart_s, gart_d, size * PAGE_SIZE,
-				       NULL, &next, false, true, 0);
+				       NULL, &next, true, 0);
 		if (r) {
 			dev_err(adev->dev, "fail %d to copy memory\n", r);
 			goto out_unlock;
-- 
2.43.0

