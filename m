Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A8C9AF40
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C18210E5D9;
	Tue,  2 Dec 2025 09:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N0SJe3W1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011031.outbound.protection.outlook.com
 [40.93.194.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF9210E5D9;
 Tue,  2 Dec 2025 09:50:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLxRNq5Su0BuVozzMaGd7ShM5u4FOOS8E74pqF2q+8/xJx1bujKodXH58eR6F18cW/wLb+ZvAh2vDr/373Eeck/y74xYd+wzeoyB4OAOua/JcCMpJkHIIOcz8MmlB0qR9RZO73qkLb4h2S7RxL+LiSmYQ0huB7xty3fP5jlSUNyyRjVsavMNGwQXIt5cRiFM1iZfDuuUzmsrCKQdrHCPr0hlDEOJdhEWzahRM0HwxIDwSOIcpfbrVp7pOmTRxdo+hegWOQv7cOQWn+1EO7H2hNzgxrbLLsD4DtLqqLdkaUqaDukG8c8atKi5xLyTYtrenmDP728+q+ee583ERXJYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LffYM3hmBUdv7peVjQA/bmRVkai2shIYvofF4EqTcGY=;
 b=YiwfiqUfVIR+0/fp9gN1x/sgYQiLi15gxamWd1aXWFssNhQpVuEH4WxQFoLMnhsGUsqT2vQlp17xoOQebGeAr7h6Lz51DqWg1eeWaOc1URZgjUDeZrgcN63H+vpNDfY9ygMzqEmdMqJld5bJSbWUowYgmWWx/a3x4jyHWGly42fezXnUojWnM0Af+xf5prx4lLBPwYNy+POmD6njYGUq2DIOwm9CExZ/z5zNBTAu6Dc7tTcmYkVFzKuNsNOGoVX1vGtefiPQZ1QbqhTTwmqRgnmnADDxuw1L9eDmXuPRcQ7wva4M+pF1n+RKdcoWlcQUwdY/MzQf4XsLGhyQBdPF7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LffYM3hmBUdv7peVjQA/bmRVkai2shIYvofF4EqTcGY=;
 b=N0SJe3W19Cha1PSGETECFavMQJ5eHm2MPBcnu1gW1EImiSFgr8ApXmRBMd+FlxZJGo0xlQ/nrRkpVgYh/oZZxxR4Us1FhvjeZ1sb747NuVOuRudiWVDMk1b5Cc/uNmh8HflIVCTDQgNgRt8bRodWsi/O7zXojeBsKkkbfZ9SPDY=
Received: from BY3PR05CA0029.namprd05.prod.outlook.com (2603:10b6:a03:254::34)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 09:50:30 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::52) by BY3PR05CA0029.outlook.office365.com
 (2603:10b6:a03:254::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8 via Frontend Transport; Tue, 2
 Dec 2025 09:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:50:30 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:50:19 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v4 05/13] drm/amdgpu: pass the entity to use to ttm public
 functions
Date: Tue, 2 Dec 2025 10:47:15 +0100
Message-ID: <20251202094738.15614-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|SA0PR12MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: 958b039e-1ff6-4659-3b51-08de31883ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXdtMVdRS3RWLzlFcmttWktaYkZEdUw5R1hTc2tJVTRJbis3QUIzekN3MzVQ?=
 =?utf-8?B?M3RRenA0eHoveXZ5c0dhb0Q3QlhNdkdyMFNWSHRnRTVjancyWVJFNnIzWStZ?=
 =?utf-8?B?MDRLVDg5aWNvMTBjUEVrZFg1bjVkN1hVbTBDS2p5bnhCMmlhUTRTdTNKeGhj?=
 =?utf-8?B?SmVqNzltOFhzaU5BNE1zaHZxWTdkYjFPVFQwdi9hZTc1TlA2S2JzSUJ5UGZ3?=
 =?utf-8?B?OUpUdEhZMWl3TGR2Q3VLeDJ1b0k5eWlxNU5FNGFPL0VjRVM3ZDNsMG4yRU5l?=
 =?utf-8?B?L09JWkhIL0pCWGtXM0hUQ0Q4SHRyeEhkYzhHRndGR09EMGZaODNiRTJRS0Iw?=
 =?utf-8?B?S1hLcWhsdzRQbDA1elBQSHNVQ20vQkpDT3lzVkZSTGhGSjdiOFVkajV3UWJy?=
 =?utf-8?B?K3RhNENzc2grSmd5aFJPZUROL0F4T0Zxa3c3dm5BeFZQRnJpOWdpQWxVTEpM?=
 =?utf-8?B?ODduNU8wcUZmazEzYVV0cERRRXdCeHE0c0hoRnFkZnVjNTEzdC9nUmNxcS83?=
 =?utf-8?B?a2ZIRTNMYlhwVDdINFhoNkFJd3c4L1ZRTlBJQnRaWVpub0JvVWowZkFmQUg2?=
 =?utf-8?B?SThjRy9hc25GYkpxaTRnVi9UaUs1aHVSaUVKaUVzcVpoS2NvZmErUlA0RHVI?=
 =?utf-8?B?M1Y2VG4rSWZDb3gvZTZvR1FTZ3pJNmVQNGRCWjNRckU4aXdXNTJvaXFSS1Zv?=
 =?utf-8?B?RWtoSXBsN2pEUEhxMVFhWGIreWk5YmlhanpJRVVPektSWGRWVWMyRCs5VS8z?=
 =?utf-8?B?Wi9OZEJ5U2RQNkwwY1QyWmVXZ1lKcS93RVV0N1p4REhYaGFBMXNJV0ZwR0NX?=
 =?utf-8?B?T0p4UVVZZXk3cmZwOTdPSGR0SmNOY2htY0pLSnh0RFQwR0wyTTE5enNQYXJ5?=
 =?utf-8?B?RW0wWnIzSDU2Z1RSZHJyWDFFYVNremNSaGc4MU9EU05NZStyVkI3aVQ0aDVy?=
 =?utf-8?B?cjVER0F6WnN4MVpEaldGb3FKWTU3VnJ6NExCWmJiRjZOMWZWWkIwRExZaGRQ?=
 =?utf-8?B?NUtvUTBQdXUzMVg4NUpKWVNVbDlqRG00U2h3S0pPNGxCYWVuUkE0dzA3b1Rk?=
 =?utf-8?B?MUxIY2M3QTM0MWFPVmV0Y3ovallFUVF4RXloaGJNSTF3RHV3eDZqbUpiUGRU?=
 =?utf-8?B?SVZITnZiQzZ5SjcycWtXNDI1Zzl3cWpROUQrUlRvZEU0bW1xT01ZMXR0b2Fn?=
 =?utf-8?B?YS8vMkJIRTY5NURkUDk2WW1UNVZDSGoxTys0aklheGNORmpZNTd1MkcrWHVE?=
 =?utf-8?B?VDcwZU0wSTVLWEI2aTNTbTVVMDRPVXg0T21vdmc4QTVFb2xwRUMvOTlDbDBZ?=
 =?utf-8?B?L0NZN1pvT2VFaVZJZTY0dVU5VVdOWnMzNFBTMVE4dmZlSDVHRjkwbXluOXl2?=
 =?utf-8?B?NHZObXA0Nmk5S3h4cGVQcUZlNGwyT05uTEF3ZkNrQWozTk5BM1F3RDV3eGZH?=
 =?utf-8?B?UlB3K25zTXI2TDUxUmUwaWp3YlF4TjNCZW1XeUY1S0NSTkpxMHdTZGhiOHBT?=
 =?utf-8?B?Z0dZd3d3a3FOSTRYYzJUaCtmME9pSWY0Zk1iRHZjd2FNZi9NT2YxYStxS3VH?=
 =?utf-8?B?TzU3QlVUdkV2RDF1ZXptc29YQlRtMER6SUNzRi85VUNUNVZXMFNyUU9xS3Zl?=
 =?utf-8?B?RENiUkt5MlAzNlRLRzQ0aXF5OVB4ZVFVZFJSeG5JZjNsdGF4WktraTNVcXo2?=
 =?utf-8?B?K0dlc2lNTmljUWY3MDl2clRPcEpuOEFWcHRhL0cyZ0MvREtrdFJkbTg1WVlN?=
 =?utf-8?B?VmEycFVGTGUrbU9mWUtjQVVrbUpvM2p3Z3Q3NFdtQzNzZktWMjZJM1FMTzhU?=
 =?utf-8?B?TXJDNXFib3d6SWZsb0JjTHp6RzdsWGZqOWlxYko5dGhDY3Jjd0NLWHVYdGJ6?=
 =?utf-8?B?YUk5NWtZTWt4MHN1ejNmTHhwVFNhL0ZidXArNEZCbVh6VnlGUlFvVzNGUkVQ?=
 =?utf-8?B?RUJacW0yaktGNi9RVmVHdXg4b291RTZUem4rU3AzZCt5NVZNRFZuSTlKZHMy?=
 =?utf-8?B?U1BqVVBpb1h6dUtLWVVQU1FEZHJmeTRnZURDUmluaW5QZ0FBWkJ6QXhDbExQ?=
 =?utf-8?B?dm9BRTNRTUNiWXFPblM0azlKUWV5OE0vZ1BHNWVzYnVjbmxJMGJBOWR0RGdK?=
 =?utf-8?Q?CTsc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:50:30.2319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 958b039e-1ff6-4659-3b51-08de31883ab8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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
Reviewed-by: Christian König <christian.koenig@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 35 +++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       | 16 +++++----
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
 5 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index 3636b757c974..a050167e76a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -37,7 +37,8 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 
 	stime = ktime_get();
 	for (i = 0; i < n; i++) {
-		r = amdgpu_copy_buffer(adev, saddr, daddr, size, NULL, &fence,
+		r = amdgpu_copy_buffer(adev, &adev->mman.default_entity,
+				       saddr, daddr, size, NULL, &fence,
 				       false, 0);
 		if (r)
 			goto exit_do_move;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 926a3f09a776..858eb9fa061b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1322,8 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
-			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
+			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index cc4e0aaa5ffa..a5048cd8e10d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -356,7 +356,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 							     write_compress_disable));
 		}
 
-		r = amdgpu_copy_buffer(adev, from, to, cur_size, resv,
+		r = amdgpu_copy_buffer(adev, entity, from, to, cur_size, resv,
 				       &next, true, copy_flags);
 		if (r)
 			goto error;
@@ -411,8 +411,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
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
@@ -2255,7 +2256,9 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 						   DMA_RESV_USAGE_BOOKKEEP);
 }
 
-int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
+int amdgpu_copy_buffer(struct amdgpu_device *adev,
+		       struct amdgpu_ttm_buffer_entity *entity,
+		       uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
@@ -2279,7 +2282,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
 	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
-	r = amdgpu_ttm_prepare_job(adev, &adev->mman.move_entity, num_dw,
+	r = amdgpu_ttm_prepare_job(adev, entity, num_dw,
 				   resv, vm_needs_flush, &job,
 				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
 	if (r)
@@ -2408,22 +2411,18 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 	return r;
 }
 
-int amdgpu_fill_buffer(struct amdgpu_bo *bo,
-			uint32_t src_data,
-			struct dma_resv *resv,
-			struct dma_fence **f,
-			bool delayed,
-			u64 k_job_id)
+int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
+		       struct amdgpu_bo *bo,
+		       uint32_t src_data,
+		       struct dma_resv *resv,
+		       struct dma_fence **f,
+		       u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ttm_buffer_entity *entity;
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
 	int r;
 
-	entity = delayed ? &adev->mman.clear_entity :
-			   &adev->mman.move_entity;
-
 	if (!adev->mman.buffer_funcs_enabled) {
 		dev_err(adev->dev,
 			"Trying to clear memory with ring turned off.\n");
@@ -2440,13 +2439,13 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&adev->mman.default_entity,
-					  &bo->tbo, bo->tbo.resource, &dst,
+		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &dst,
 					  1, false, &cur_size, &to);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_fill_mem(adev, entity, src_data, to, cur_size, resv,
+		r = amdgpu_ttm_fill_mem(adev, entity,
+					src_data, to, cur_size, resv,
 					&next, true, k_job_id);
 		if (r)
 			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 41bbc25680a2..9288599c9c46 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -167,7 +167,9 @@ int amdgpu_ttm_init(struct amdgpu_device *adev);
 void amdgpu_ttm_fini(struct amdgpu_device *adev);
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
 					bool enable);
-int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
+int amdgpu_copy_buffer(struct amdgpu_device *adev,
+		       struct amdgpu_ttm_buffer_entity *entity,
+		       uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
@@ -175,12 +177,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_resv *resv,
 			    struct dma_fence **fence);
-int amdgpu_fill_buffer(struct amdgpu_bo *bo,
-			uint32_t src_data,
-			struct dma_resv *resv,
-			struct dma_fence **fence,
-			bool delayed,
-			u64 k_job_id);
+int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
+		       struct amdgpu_bo *bo,
+		       uint32_t src_data,
+		       struct dma_resv *resv,
+		       struct dma_fence **f,
+		       u64 k_job_id);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
 void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index ade1d4068d29..9c76f1ba0e55 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -157,7 +157,8 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 			goto out_unlock;
 		}
 
-		r = amdgpu_copy_buffer(adev, gart_s, gart_d, size * PAGE_SIZE,
+		r = amdgpu_copy_buffer(adev, entity,
+				       gart_s, gart_d, size * PAGE_SIZE,
 				       NULL, &next, true, 0);
 		if (r) {
 			dev_err(adev->dev, "fail %d to copy memory\n", r);
-- 
2.43.0

