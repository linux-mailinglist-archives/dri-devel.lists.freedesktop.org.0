Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0F1C58958
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD5C10E87B;
	Thu, 13 Nov 2025 16:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gv3dAIhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8FD10E876;
 Thu, 13 Nov 2025 16:08:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1ckiauZXB631b8ZZEZgxI+Zf9CGJ+pbKzuU7TKjAdocuExBVpm5/xSVOgoIfZW+g271+deTTMYl29Ozu6L1pvMEidiSlqP+eONKqCCE3OeWj4788u+/pAlOTKnPeBbZjBcG5nWgvVvCgoUULTSwkaXx7DK4a+cMpQYd1NHt04Ji+oE2KS7VO6hyFlLQnJCZSt7s2npRfvUuCzuQ5NitqJUgj9u3SGcukcGTqZC3irou9gKuz1RpVsCSfH5xTn0hET2oa6wsRDxw/2p29v6fEe4zjO+X0FvJvj/HSWIuCnFfGFcICOQGadQPCwGyb4oA1JiGAHjTNOcXzdG2KZTYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6E4IF3LYcU5qbaNoF8ewtPzT4lDCpbqqbYBA/cpCbg=;
 b=vBHISJ2Lwb68TiQm15wSqHo3A8Qc3SsLuaUC9yMXxknGoI+esnEwztTJvnOz/ryODriNphm6rXM/re0VqS7hx5dhA8N4I1MX8ldlOcr5LusC/3NyuhIuVBMOdJzoTKx/KVeEYeMcQcAiM+kmiknq3IVTGGqJQ7kyoxB8FCr3NsaWyXWDg7OQN8e12kiZ84sgfE28aJeBmgEIQIF2U+bC520LC97hU+wo9bwBFLzQnY1RZ0uSYA1sBBsaTr3pC95CIGSU7VySrewnYRZpGX3UDD3qcW9tOsNXwy6dA2DN/MBj3vr3xAZNNcqHeBEirGl8rnjbcq9v81ADzZBP6/SJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6E4IF3LYcU5qbaNoF8ewtPzT4lDCpbqqbYBA/cpCbg=;
 b=gv3dAIhCyE/Av39Q1dw3vs6kaByUoI2nC54k5QxfQpUEluB/UIhMr2IBMkAG30IgQ2q4us0b3PJXCd3sZj0fvRSNvgg5HIfqvP7NWAbckLSjdqWITIvdo+Li0Tcbo98R6zYsKnNrD438BTx44mnXdxBPw59ZIDtRliph6qdBEiQ=
Received: from CH2PR14CA0006.namprd14.prod.outlook.com (2603:10b6:610:60::16)
 by CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:08:12 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::6f) by CH2PR14CA0006.outlook.office365.com
 (2603:10b6:610:60::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Thu,
 13 Nov 2025 16:08:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:08:12 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:08:10 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v2 03/20] drm/amdgpu: remove direct_submit arg from
 amdgpu_copy_buffer
Date: Thu, 13 Nov 2025 17:05:44 +0100
Message-ID: <20251113160632.5889-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|CH2PR12MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: 54007dc9-ba94-4a78-6854-08de22ced868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnRYSDR2UHN0eXlxM25hTkE3MVNwdndlRVcxbC9JYkZIZENBWlVTNTl1TTh1?=
 =?utf-8?B?UkFVakVmMHBMTmU5enZSci80UWNWWk9obEg4UlZIN0VYTGxlUjNKeTFzZU96?=
 =?utf-8?B?bHl1cEpFc1JnTndqRE1lVlBWazk5Y20rbkNPQkpyNnBFV3BGSHA1cjloTStv?=
 =?utf-8?B?VVpEMFZESmxEbnZrb21nSXhCRG1uRi9SUTVRaURhZTl5SGRtWkQrdTNRRSs4?=
 =?utf-8?B?NCtqcDMxSkhqMXpnUHlYMmZUVVdDdXUyWnB2Qktnc1FycFlIS3VMK2JoVGMr?=
 =?utf-8?B?dWJYOURwdVdTdkMwOUo5cHgvQ0ErZWN3SUNVZVUvQkMvSGw3Q3VTb1ExNVFv?=
 =?utf-8?B?T0YweXJMekFmVW9IcE91UUs2Z244M0xmVERPREZRdWY2cVJCdGFHTExsbC9F?=
 =?utf-8?B?U3pySXZsc0pzNnVUR2l3YTM0R0hQS3JkV2Y5SzM4U25SMnNNQzZyN1VrWTMx?=
 =?utf-8?B?ZTBLWThPSlJvMzJnWnplRVlOM3d0SVBqQ2lzNDAyUEhRcGkrRnJjL3l0ZDZK?=
 =?utf-8?B?dFpWSGFwY3hOU1p1bGxxQzJOdXBkWjQzeDZlNlcrcGt4L01tbmJ5MUZ4b1hU?=
 =?utf-8?B?cG1JTEIrbFpHbWczTVBoSFNuWFBlRkxncXpSYnN4M1VtTTJPQTRndUFiSGhY?=
 =?utf-8?B?L1hVdlBxTEx5aVhiNHk4aTZ5U1B3T1BiRVp2UjlmQjlFUEoyZlVzZ0FnV0hH?=
 =?utf-8?B?Nyt0OThJMmE0WS9VOC9ucm5WMkJSWmtFWkpaMWdZVzhSeFExTjlZNG5Oa1FZ?=
 =?utf-8?B?T0cwelJGcjZvWTFCdTZyZU1kWDh4TTRBMlNaVUFQMWhWWnZIclYzRmhxNW93?=
 =?utf-8?B?dnNEY2ltaWtmRkR3SjJvVVJQU2tTOVVnMjAxNWN0bzltUnJSWlJNV2tvY2wx?=
 =?utf-8?B?Q1hDeVUvNmYzT2hmWS9Jd2tYdEhEQ0xjTUpZay84UjdNbXc0NzVERGFVTGtM?=
 =?utf-8?B?ZEE3SW5mc05wVGZWeURyNWxqRklXS1RrbTBPT08vUUFyVWVPUldUVUhjUitv?=
 =?utf-8?B?VWFVNmtvZ2NxWkV5a0dLSXdkZ3JsVlZwVzNBM2Q2cmRsRHdBaWFrNzhoeXVk?=
 =?utf-8?B?bmd6cHg3RWtkV1A1b0tneTAxaS9FcTE4OThwdElFcUZpQ0FON3dDOUpVWFBj?=
 =?utf-8?B?b3R0M05pWS9zY0d4V01mZGk1enBFbEFvTU1ZWVFjalZuU1NzQkt3amhrL0g3?=
 =?utf-8?B?aVhFcTdvZWcxVGNHcmRRdTc3c1Zlb3lsMld2czVLWnNqdkRtWnZXY2tUUEpQ?=
 =?utf-8?B?bFYvckphaytoRndLeFFTYUp5MjJpdlJhRTlwRndHRWdQYlByb0NFaHpaQnRm?=
 =?utf-8?B?UTRwYmxOaThGOVkxa1RqUi9XMUhWUEZiR0U5MHdVcy9kcmRqTm9aNjdnWFA4?=
 =?utf-8?B?Vmswd3ZFTDlIdzRWVnlUTjV5c0pLalNLWnM3N0J5c0xraVRtTEVyOG9xaEli?=
 =?utf-8?B?dFJhS1grSGFTQ3VJeFJDZkkvMm5qV1dJREhxVHZxdjY1cXRaNHE1dVUvSGFa?=
 =?utf-8?B?U3NINVBLaWdLSDR3T05Va0JlTitLNzFsOUM3WGdabm5XeStpa3E0OC9IcFRJ?=
 =?utf-8?B?bzdhMVBXRHQ5dDNhTTZuajBzT1N0V25BbUl5bTVadmN3dWdzVzNVdWVWL1Vl?=
 =?utf-8?B?bDJheFJkM3A4WUxHT2NiRU16ajV2RkhySkNjYjA3UkVmZk5IWkJjakNsY0l6?=
 =?utf-8?B?TlA3ZGU3elJmc3VaaTJmWFhUalArUlpBMkdNTU1DVERXckpJSDREdm1mQzNK?=
 =?utf-8?B?UlRvU0ppNk1OZElBQVJJRFZwbFZyQTRUOEswN080ZEtGMXlqdHppR1l2d3NT?=
 =?utf-8?B?NXVyVFBSYXNPTG5mNDl3cWRQOEc2ZUpYdk1QRzZHQ040MW9HQlgyTXdIeDBa?=
 =?utf-8?B?SDlteUFyTmRNQ1JWZXBCeC9BRU9xNnFOazV6dGd3TU1COXFZa0NZM3pEYk0v?=
 =?utf-8?B?eG1UdktwWDFhbktlaHVLNVlLZjg2MDJ2d2htRDdRYlVNMzBGMnA2UkYrVzdK?=
 =?utf-8?B?ZEZhSXV1RHNnR2FmVDlhQlBUekZwS0NpSGZROXM5QWxUNkdhTDd0Z09vazY0?=
 =?utf-8?B?bUE3bG1jVWVGTm04ZzFFcUpyRXVCL3doWkYzcitYT3B3WlRoZ084ZC9iTThR?=
 =?utf-8?Q?LJJM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:08:12.1986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54007dc9-ba94-4a78-6854-08de22ced868
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053
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
index 3b46a24a8c48..c985f57fa227 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -354,7 +354,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		}
 
 		r = amdgpu_copy_buffer(ring, from, to, cur_size, resv,
-				       &next, false, true, copy_flags);
+				       &next, true, copy_flags);
 		if (r)
 			goto error;
 
@@ -2211,16 +2211,13 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
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
@@ -2246,7 +2243,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
-		       struct dma_fence **fence, bool direct_submit,
+		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags)
 {
 	struct amdgpu_device *adev = ring->adev;
@@ -2256,7 +2253,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	unsigned int i;
 	int r;
 
-	if (!direct_submit && !ring->sched.ready) {
+	if (!ring->sched.ready) {
 		dev_err(adev->dev,
 			"Trying to move memory with ring turned off.\n");
 		return -EINVAL;
@@ -2265,7 +2262,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
 	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
-	r = amdgpu_ttm_prepare_job(adev, direct_submit, num_dw,
+	r = amdgpu_ttm_prepare_job(adev, num_dw,
 				   resv, vm_needs_flush, &job, false,
 				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
 	if (r)
@@ -2283,10 +2280,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
-	if (direct_submit)
-		r = amdgpu_job_submit_direct(job, ring, fence);
-	else
-		*fence = amdgpu_job_submit(job);
+	*fence = amdgpu_job_submit(job);
 	if (r)
 		goto error_free;
 
@@ -2315,7 +2309,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
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

