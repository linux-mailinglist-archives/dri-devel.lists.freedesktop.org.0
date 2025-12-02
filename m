Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D8FC9AF37
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCB610E5DA;
	Tue,  2 Dec 2025 09:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z2Q3i/rF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5D210E5D9;
 Tue,  2 Dec 2025 09:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZiang2Zi+Ky/rppZCfvi+/ROBEyDRRD6rXwrv9ChpMbZeT+nJJLxjIxtuofoxfmyQY4xgsh30gzN/MzMTW79NegB1kjDc2NMABdmqkYLyfDSgI760YlVSy0GIwP/pJPxoI1FORNu4gTIy1caOXQqrLjiKC0zXauEx8SQxfteduVCnoRjESwI+OXcBLAgnjwDv3Rybr+ULSiX5xqa75IMN7NSepUlXFTMRJaacn8Kr8BgRqk/2ubQjsl4o2nD2/7kb6bx7pOWcyrKTuXlD6urtfqjGiA42VRfxUbKoxKGYLOUV3QXsmEfSRRjdmt60UrLoiPcRRNejgpwOoIev3bSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7JnFJtkLdjAL6HY2uIrUYDo5vdvocb+YaML86Ycg6Y=;
 b=Ejc4D5g82kQ8K9Q32EXHQk6dilq0dyoqhgiJyCMS999QncuFdb0gKBPvHfoSU3GHMlRswxCkVmEx/uixS+IRrN/yZYIUi2dYmuR///VuYswY9k2PSM7ScV+NqRCRozZbC0tDNdW0TM9EBogeK7cylOqMpbHGAWWgY7ZsY6gSBagDWSrMUJumg3nCRwHAId4mTzlqWmi9Edtzmu/0iHH9FNB0ulXgbLVG0qir82oN4x6kMxsowQqIrYiHd3TCAgqDM2iLNNLRwAThn0BIrdhb2XsYdxxo3aFQh5nZTU8XrC5a+Zo+VOaiP9DOrBhBVgIc1eotlw2OF1H9RU4/IoODcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7JnFJtkLdjAL6HY2uIrUYDo5vdvocb+YaML86Ycg6Y=;
 b=z2Q3i/rFfLI3tHzckBGlLdnIbmJqN4zolb6bTPo9a5VsxwFFkXQKcpfT7kjEAvYpuIiJxAX8AXi4S0sTQalkrOutoi3y/xcX5zJkSI7xhkb6IxXVRS2iHsZS+3FxGWFEgYmMFyVqP6cRt/Agk0mGI+SQN5nKK78szbhktvxqAfc=
Received: from SJ0PR13CA0178.namprd13.prod.outlook.com (2603:10b6:a03:2c7::33)
 by DM6PR12MB4122.namprd12.prod.outlook.com (2603:10b6:5:214::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:50:16 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::b4) by SJ0PR13CA0178.outlook.office365.com
 (2603:10b6:a03:2c7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 09:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:50:15 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:50:08 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 04/13] drm/amdgpu: pass the entity to use to
 amdgpu_ttm_map_buffer
Date: Tue, 2 Dec 2025 10:47:14 +0100
Message-ID: <20251202094738.15614-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|DM6PR12MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: 6657893b-208c-4fee-d1eb-08de31883216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2lsZmN1OHFVV3VKbmJZdUlBZWVOcUZMNFp5emZsZzZPbTloVitOcFBHb3Zl?=
 =?utf-8?B?TksyZERGUm5hMURmd05UYjJzbDYrK0QwZTh0Z2NJbE9UN0VGZTVhbzN6VE8y?=
 =?utf-8?B?cW9RUnI3d29NWXpCZVVSK0p2RWxoS3JuOW9TZnBuNnhoTmpiaDFySDA1djgr?=
 =?utf-8?B?d0U3bTduRGFhYm1WMGwrbDdwaTVJdHJZMUpuZmwwZlByMnRYRVZ4TituZm1X?=
 =?utf-8?B?U29IN3RFVFZ2cHJSaGNlM3ZyQjAvanJtWFhkNHBBNm5xQ2RiVVBtSGNRNVhi?=
 =?utf-8?B?WXVmWkk5V1luRUxOQkVnT0RBZmM0Rm9HVFJodUVSZ0M4dWNSWEd0RzEvNFBE?=
 =?utf-8?B?alZQaTNTSFUyVmhsRTd6alRpbDVPVEVQS0FiYisxQ2laSk9pU3N5VGZkeEtq?=
 =?utf-8?B?cXI2ZzZGa21HOTJrMmRtMFpTMTUxelM0TXYxbG5kMWFFUFEvblZFMnFRM1Ni?=
 =?utf-8?B?STFRMHpqL0IxU0hHZHd2Zjk4MVUzM0w0WEtKeW5KWmpyb0ZrTnRRbDcvREpG?=
 =?utf-8?B?Z3V3RTkyTFZLQjFjZkJpR2FFem91SjNIMFhaVEk1cWliVXFlUWhtZ2JRcEsw?=
 =?utf-8?B?Mmx6L0lvS0RIR1BYSFdSSjQ3RXV4TXBYM0ZPMTZpMHJicXRLWFpGc0Fyb0Uy?=
 =?utf-8?B?bTVsOEkvb3ViZngwcEx4bWhhQm1keW8vaTFwY1VsVEZYZGZuZXNlcVVMbU45?=
 =?utf-8?B?T2JsaVNQS3RBa2l3Z2QrNWVvZmVWRjMwSHdrQmhaL1FPOFBqZUV4ZVFURjlt?=
 =?utf-8?B?K2RYL2w4NjYrWGpHejU5V0ZwVjg0MmVUMkdEcG9yOW4zK2dMVVJmTytBTmFH?=
 =?utf-8?B?Uk9IcVNyMGcxcnp2elkrSnVjQjVGN2plMXc1REtDdXJiczQ2ZXl1N1VlWHVS?=
 =?utf-8?B?U3Z5Q2RIY3N5RytOemdaZU5PNDh4SHFuZjVpT3JMdzFaSmswYjFXWjRmWVVW?=
 =?utf-8?B?cDdVUDRmZGtLOVpmK0dSOVlzQ01OV0xaUkxKZGhDK3U1UXUvTm5CTlJFbC9G?=
 =?utf-8?B?VzkxYkh5UWo2N3RKaGFBOEtMcmdKaEtDQXZ4ellsaXdWUDcrdHd6bkwwMFpE?=
 =?utf-8?B?d3k3MUR6OG5BdUhzSXF1a21tQ29HMlB5ZVNCQVB0VTh1N0hpNVVxNmFMNVJE?=
 =?utf-8?B?UCthTmJ2clRaRkVwU3kzOWFhTVp2QnByZFhKRGUxNWEvdTA3MHNJQ2k5NTVW?=
 =?utf-8?B?R0gvMmlxODhzMmM2YVlkNHdTREJtaHREOUlVSjhRSlJ4ZFYrWHdod2J5eXNp?=
 =?utf-8?B?cTV2SVZLeDdXRldTQVdJQW1LcVc1V0hFbDlkM0RyMGJTMWY4c3Zoa3RqazE3?=
 =?utf-8?B?b3NkYndMc1dNMHdzNXQ0c3ZUVWpHS2JhU09BRUhZWGFQTm1EVGkwdXJ2RmZN?=
 =?utf-8?B?bThEcjFTOGVJSEkrQ0VEeUl4ZkJDYS9sTm52bGlKQUtBa0ZCajFvKytrT2NE?=
 =?utf-8?B?NXpMSEViRXgvREdZVjdKWnVzZWpjUys5b0xUSEJJOUVpejNockFnMDBOdjMv?=
 =?utf-8?B?OE0zclZZVSs1RTNrYUpiSDBLWUgvRnl2WFhBNW9qRmVNY2xKR2Z5TkovWDRn?=
 =?utf-8?B?dGwrdkc3OXFQckc5ME1XdTFPQzZsZEdwK2FGRGZZZHRjZ2syM3dySTd5ZmVk?=
 =?utf-8?B?Z1FGa0g1YlZ4cTFQaVU3NHhZUDYwZ2xFRXZBRUZYQ2k5cEZJbWxnTmYyOEN1?=
 =?utf-8?B?Z0xWdW14WDR5S0pDdUJIOGJjWERZbVM1QStzQVUvQTFFT2dQTDBmTStXMXhQ?=
 =?utf-8?B?V08yMCtXanFhRmlVaFVZVGRvWVJ3ajNZY2dvenhCVmJJcndsSENoMVFPN3hn?=
 =?utf-8?B?Wk9NeHdNZS9FSi9jd0Z0NXY3V2FLOEYwb1hHZVM2bDEvWFdTTk1mckc0QXoz?=
 =?utf-8?B?cFhQNm1xVjNDays3L29leHR0aGpWdnZjSEw3eTUvWk51bC8wb0JTMUlCdTdr?=
 =?utf-8?B?ZlFoY0dPNDdPOFg1SVlKbDk2NnVFV0ZHNEVRMWhnYlVUUitIc2ZSY2cyZlRP?=
 =?utf-8?B?V1VWajNNMllncGtzOGhnSEZRN3k1eHRwN05YcFZiRUt6K0ZLZjRQRWlxQ0Ur?=
 =?utf-8?B?Vy9wK2NUZnpsbHVQb3JFNm1VV1lBTkFUaWpnQzRtMXJmdkZTVmx2eHdhVEJ3?=
 =?utf-8?Q?8X3k=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:50:15.7523 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6657893b-208c-4fee-d1eb-08de31883216
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4122
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
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 55 +++++++++++++++----------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6e8b6fd94378..cc4e0aaa5ffa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -176,6 +176,7 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 nu
 
 /**
  * amdgpu_ttm_map_buffer - Map memory into the GART windows
+ * @entity: entity to run the window setup job
  * @bo: buffer object to map
  * @mem: memory object to map
  * @mm_cur: range to map
@@ -187,7 +188,8 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 nu
  * Setup one of the GART windows to access a specific piece of memory or return
  * the physical address for local memory.
  */
-static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
+static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
+				 struct ttm_buffer_object *bo,
 				 struct ttm_resource *mem,
 				 struct amdgpu_res_cursor *mm_cur,
 				 unsigned int window,
@@ -234,7 +236,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
 
-	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
+	r = amdgpu_job_alloc_with_ib(adev, &entity->base,
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
+				      struct amdgpu_ttm_buffer_entity *entity,
 				      const struct amdgpu_copy_mem *src,
 				      const struct amdgpu_copy_mem *dst,
 				      uint64_t size, bool tmz,
@@ -319,12 +323,12 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
 
 		/* Map src to window 0 and dst to window 1. */
-		r = amdgpu_ttm_map_buffer(src->bo, src->mem, &src_mm,
+		r = amdgpu_ttm_map_buffer(entity, src->bo, src->mem, &src_mm,
 					  0, tmz, &cur_size, &from);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_map_buffer(dst->bo, dst->mem, &dst_mm,
+		r = amdgpu_ttm_map_buffer(entity, dst->bo, dst->mem, &dst_mm,
 					  1, tmz, &cur_size, &to);
 		if (r)
 			goto error;
@@ -393,7 +397,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	src.offset = 0;
 	dst.offset = 0;
 
-	r = amdgpu_ttm_copy_mem_to_mem(adev, &src, &dst,
+	r = amdgpu_ttm_copy_mem_to_mem(adev,
+				       &adev->mman.move_entity,
+				       &src, &dst,
 				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
 				       bo->base.resv, &fence);
@@ -2221,17 +2227,16 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
+				  struct amdgpu_ttm_buffer_entity *entity,
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
-						    &adev->mman.default_entity.base;
-	r = amdgpu_job_alloc_with_ib(adev, entity,
+	r = amdgpu_job_alloc_with_ib(adev, &entity->base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4, pool, job, k_job_id);
 	if (r)
@@ -2274,8 +2279,8 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
 	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
-	r = amdgpu_ttm_prepare_job(adev, num_dw,
-				   resv, vm_needs_flush, &job, false,
+	r = amdgpu_ttm_prepare_job(adev, &adev->mman.move_entity, num_dw,
+				   resv, vm_needs_flush, &job,
 				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
 	if (r)
 		goto error_free;
@@ -2300,11 +2305,13 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 	return r;
 }
 
-static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
+static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
+			       struct amdgpu_ttm_buffer_entity *entity,
+			       uint32_t src_data,
 			       uint64_t dst_addr, uint32_t byte_count,
 			       struct dma_resv *resv,
 			       struct dma_fence **fence,
-			       bool vm_needs_flush, bool delayed,
+			       bool vm_needs_flush,
 			       u64 k_job_id)
 {
 	unsigned int num_loops, num_dw;
@@ -2316,8 +2323,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
 	max_bytes = adev->mman.buffer_funcs->fill_max_bytes;
 	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
-	r = amdgpu_ttm_prepare_job(adev, num_dw, resv, vm_needs_flush,
-				   &job, delayed, k_job_id);
+	r = amdgpu_ttm_prepare_job(adev, entity, num_dw, resv,
+				   vm_needs_flush, &job, k_job_id);
 	if (r)
 		return r;
 
@@ -2378,13 +2385,14 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
+		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity,
+					  &bo->tbo, bo->tbo.resource, &cursor,
 					  1, false, &size, &addr);
 		if (r)
 			goto err;
 
-		r = amdgpu_ttm_fill_mem(adev, 0, addr, size, resv,
-					&next, true, true,
+		r = amdgpu_ttm_fill_mem(adev, &adev->mman.clear_entity, 0, addr, size, resv,
+					&next, true,
 					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (r)
 			goto err;
@@ -2408,10 +2416,14 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct amdgpu_ttm_buffer_entity *entity;
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
 	int r;
 
+	entity = delayed ? &adev->mman.clear_entity :
+			   &adev->mman.move_entity;
+
 	if (!adev->mman.buffer_funcs_enabled) {
 		dev_err(adev->dev,
 			"Trying to clear memory with ring turned off.\n");
@@ -2428,13 +2440,14 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &dst,
+		r = amdgpu_ttm_map_buffer(&adev->mman.default_entity,
+					  &bo->tbo, bo->tbo.resource, &dst,
 					  1, false, &cur_size, &to);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_fill_mem(adev, src_data, to, cur_size, resv,
-					&next, true, delayed, k_job_id);
+		r = amdgpu_ttm_fill_mem(adev, entity, src_data, to, cur_size, resv,
+					&next, true, k_job_id);
 		if (r)
 			goto error;
 
-- 
2.43.0

