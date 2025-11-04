Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6696C2FF11
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D63810E559;
	Tue,  4 Nov 2025 08:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fPNLQrWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483BF10E558;
 Tue,  4 Nov 2025 08:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDO3YCnFTNUl42wAUxYo0fPE2pyTaHuDhoYejTPmj39ihaYlADa7oZYqZ5WkERJ3aOrkjqx14JZ+OOoK5Vz9Sog2qoJwUZd3lMmPKCt3KSQOE+SS4bqUVsWLREwb+lCmu6mf+VWO5YxyL2ZnYK98NCRgdmWCQOuBOMRZuY0a884RLIWUTIn1bEHMsZQ3YXuNK9DnIolLy8FxjEUhDcFwOdWvr3LkYUSjcJvkZjlFDGP13FS7a03sYpceOugQ8iuOp6GOxE+0TF+N75f0kjqBPQMB9aQrnS+M4Am6SHOKKEptTO4SpY94kJV4RLjBfF0n0iIy0XfpveGkqzjZBkjPbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkeOurzo+lhDWRn3czuHCWR1PPTyNGWjKE7SVSsab0o=;
 b=P5D98WWqGoE8vzWKJ4FWSEMCzcp51JJEAVrc2KKPh0nyog1RN3XQiGUhTGnnQrl/6raQnRq5i3GuIKUhXtp91Ap4MkHKy1f0NFz6L1BINTJ0GgPPQZarytUKcq+czoOB2xfbtetZ4epczTHXe19GZQI9AXfoKBpedv4rR5qhFbmqHelknaPCeZ8OJUCtaF43SysqCn4nBEmN49x0IvGifZaVKvwk5+1hn/5uGROLbgVWeCHkfrGwNnPNJweGsqYfRC2m7cWdcjE8kcSV/7jkbmNLGvyW2HkenPhOdXHqxAeTGE3G2t6QC6tS83Mkbs/bqm2xNDA0KjRxRkXZ7cRvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkeOurzo+lhDWRn3czuHCWR1PPTyNGWjKE7SVSsab0o=;
 b=fPNLQrWFbqMs+SwClEjOkt+IVcSvS6WLc3/XueIHisYO4gCFv7XvHgza3jZTX+7PqXCkBg5E8Gr2qcOO9dCYLF8MtBgonn3OGOmKOEpy1mG/glZlO5SgnIebTJ0nCR2tc4wEdER50i7+paeBhxsx7CKrhur66x5laimclOiT4s4=
Received: from MW4PR04CA0265.namprd04.prod.outlook.com (2603:10b6:303:88::30)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 08:36:34 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::48) by MW4PR04CA0265.outlook.office365.com
 (2603:10b6:303:88::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:36:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:36:33 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:36:30 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v1 03/20] drm/amdgpu: remove direct_submit arg from
 amdgpu_copy_buffer
Date: Tue, 4 Nov 2025 09:35:18 +0100
Message-ID: <20251104083605.13677-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|CH2PR12MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: f006fe64-4373-465c-cbb1-08de1b7d42bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lsPguDrpsHmTvaXeRFqNozWrgVWFYwj1YnIxhrE3Or2Y0zrqprkTCq2z9g/R?=
 =?us-ascii?Q?i82LEixy1hdzrGW/QjVUH+qRuAw5yCLmzvmt0Dxc7cUOVw81AOoBoEUWwcCj?=
 =?us-ascii?Q?uRYuqaCVN2MCnVVJwEWmyGF7i7W0xfS4aXfJg9giV42YNw+bmcOIVA43CoBi?=
 =?us-ascii?Q?Kr3YbM75KZP9s3mUR4qLMjGjvvKTJRfs2PGMwkVuZvqoHIEmWrPguqV1ZK8W?=
 =?us-ascii?Q?ipYOg5FnHF0ANvz5COqGuPfvCM+kbjQaPnk0mm61gf16UqBUP7nZ+hIGu5eH?=
 =?us-ascii?Q?J4WFupwFcINUc+VULCCulD1Ltiz6PjgJ8Sg+sdKXqis2PSPAHhU4qHOSI++y?=
 =?us-ascii?Q?H/oRmA09I76w4p1UrTDqw8U+rkhzKdSej0BAXkyTRWdqbzEE3FtknLwRSE9N?=
 =?us-ascii?Q?glc4fteCyJU60IdMuz9pWmBptNiKcWGavg+N5i2n4aVUVqqS1u5ss2Y7KMQA?=
 =?us-ascii?Q?C5JuuLV7z4sNyWg8jUIsQqtFN6PkCE+eTFgTYojKANyZrMv9Lif19RHRH3hf?=
 =?us-ascii?Q?Iw5FKHeYyCu1BqGSO3GEWIsJdQ0qPd9Uy/5pyydu0zAlnx1+GW1WV3qYMwIc?=
 =?us-ascii?Q?EmWuUjQj8quXdvhKdkuZiJGf2LiQzg8B6mHFS2yCv/DU7wDAUSCw+g5/xVfz?=
 =?us-ascii?Q?rKwk6hPgKgRNL/lKrZ2vRoyGtgLE0mMpbXZ/LpSa79f730yvqnzXe8Om8xUO?=
 =?us-ascii?Q?hgeofX4tpf9wURZ8Vm56b76C5LmkonVLOp1kGPY4kZtSDS1KADCqJlqGpbkk?=
 =?us-ascii?Q?CLJD9J0lvebGpYWNt+7bOW/NKU+e0ngKVjRazNUcScB12fLtgkeRl3/JX7VH?=
 =?us-ascii?Q?WgVs1z9udm8JODAUG46LTWhiQsv2YWoVpuVBYVsx306n3id/wX4yVUZatl6K?=
 =?us-ascii?Q?/dFlSB23Ib4cXtDD0Yq43Ppaeuy0vDO7TdG44Mi4qtH5Ki9qEDLfJTTfIFS3?=
 =?us-ascii?Q?PzjI6L+h9FqXY+c+NFmCsMA7byPhRTboi9xnbJfoVAubx4Mc8Bo5dWrc57Yq?=
 =?us-ascii?Q?bStsvFHzj9XUIx18X8LDn5xhiyHqbMmReDUlupxHBdJDeN4CgooY3gs359Pg?=
 =?us-ascii?Q?jRxjN4vcln6PsT6oSswEyUHge6URz5GWsgS5Nm4vgA80kvKcPionw19IHh3A?=
 =?us-ascii?Q?OL8pF2CH0eJDitpV3JavkwPeSws6IqapssN1E2BbLiIU6lXs7iap8AOxpyeF?=
 =?us-ascii?Q?ecCpsOQmRP/+I7j2/CtoXCvtRfUXFJ4aFoowCP26Cji4PF5y0YftqscJj4R3?=
 =?us-ascii?Q?0JQ5/LYOwxFIr/nkCAGyTr2zRvUY5GjpLzlkB9hQlinejAd2XIORFw/6ERCb?=
 =?us-ascii?Q?yc3ikHkb75a4GfRCgE0eHS+FJp2NKXK0TUku3odIzu7NV2R2TTPv1LaGqZwq?=
 =?us-ascii?Q?Tg98clC9N9djegnm4bjagfxbwzQlpsTjQQK8HmKceWlOSuzdnmbtMW6g/BIF?=
 =?us-ascii?Q?+6rryO3apIoAAI28xktNqtK9nXjCrv1JwfqFsy8hNFuU6rsCprc7SlHnqzOJ?=
 =?us-ascii?Q?rbp3l5HJDmlkd5sKZ+jOyvTe4KSJV3WPRFFtjMuBTJMNCyzUI49ZfqQQNSij?=
 =?us-ascii?Q?rX0He+SQCP8X2mOs6NY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:33.6326 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f006fe64-4373-465c-cbb1-08de1b7d42bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197
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
index c66f00434991..fce22712396b 100644
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

