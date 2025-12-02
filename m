Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C9C9AF74
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194A610E5E3;
	Tue,  2 Dec 2025 09:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P7Lka26b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013064.outbound.protection.outlook.com
 [40.93.196.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA8110E5E3;
 Tue,  2 Dec 2025 09:51:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoAHNkmcEYM6rO0lZNypZO14CSvNKMIb7R3ZZJz0uhth3i963aCLFBUpZ2YX9ZmmupDzjaKJ+ssETSq/ZDTLKsaoUclouGQv/HYOjvALO9gLWu3sKGtqeCb7kynv58M9fuDwY0fIkXn95mhsg4ypFV3njufUO8Nr/eWbusODieyiXwFl44um3AIMnOrmoLHPaOxMme3JVmsZh0Kugftws2yO6Dv7bQgHZZIfocLrc0jBD72I1QeqmLCscycRqVd725VXENvdSII0DAjO1k69snE8hYknDC+noPd0nwzpwU63rdCc3tKriANkN5rsQIBeH3dgiUWHspxSq7RviWq0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unSQJloTViP81eZBV1Q84kZCKaK36NVPT3OG7Ve42Wo=;
 b=IOoYJX/DJuq7ciPBNOI5iU7mlFEoAQQH8HbMGpCNGlK9blfRWm3ERAN4B5IHXwSgFcaMv1mswLj3jY022CN6Qh+hBbrzPRzZ0Wpi+Rko9iWXctXCgBZ7YiQetuNnpJSbsOzANUv/LSzWzZPRcLBMI80PoUYMmKQCqee5wJZpZ4RXHDtIiOSxiatrLZDQryzyz5vNBQoCsrE3JQaTJ6Q+Sj676aaqKsm4fHSV04Cz7ZO0kirNoryGgePsTSaGwLDtd3rgWedp8w4k8krIJ9p0N40b3yBIt0e40cjHqCej3Gi4Y8A8fXbdYIc/z7LuPhf4U6B1JO9r9IiLuUg2OcJKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unSQJloTViP81eZBV1Q84kZCKaK36NVPT3OG7Ve42Wo=;
 b=P7Lka26bXwaAnbzwr+ux1q6lVb9w1sVHSfGxDDFDYp4F+Qas3ZSMEe1d20YeCAFd4tGA3VJfPUzlYH+lEhRocOW/NF31DlQ+QmNObGsBkQfjD+VaIMRxpqr/ZyYdDyvwA8IKMqXGBsIMTXsKFCw8egh+mSPa4CE26vfBEfbQPEI=
Received: from MW4P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::18)
 by CH0PR12MB8507.namprd12.prod.outlook.com (2603:10b6:610:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 09:51:26 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::40) by MW4P221CA0013.outlook.office365.com
 (2603:10b6:303:8b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 09:51:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:51:25 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:51:17 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 09/13] drm/amdgpu: check entity lock is held in
 amdgpu_ttm_job_submit
Date: Tue, 2 Dec 2025 10:47:19 +0100
Message-ID: <20251202094738.15614-10-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|CH0PR12MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 98eda08d-2b43-4732-ea73-08de31885bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkhDQ0svbDYvWEhLRTd2UU1lZTBzTWxPMzlMWGs4bEQ0Y011aUM2eDJ4c3Nv?=
 =?utf-8?B?dXFlWGJMMlkwL0RUK3dEcDZsaVIyZGxXbTN3LzdGNC9wM0ZEZkNRdFdsZk5p?=
 =?utf-8?B?VTY4TXNNUHQ1bHRhTG5MWmVUUjJaclgxaTZjRldrNGtrcWdBekduR2JWNm9C?=
 =?utf-8?B?SEF1M1RkeXZ5VmRNSDhHSVY5Rk85MkNiT3g4SHh4Z1J3WHlkYVdrcFRJQ0Z0?=
 =?utf-8?B?RGVuN1JxdUUzY3h1L3dZQ0FxL3ZaMGdYK3ZhSDBCbVVuQTNPQzd6d0hZeUlG?=
 =?utf-8?B?Tzh0K2Q0emlFa2UxNHBVVGJNSDB5UW1pcTFoc0U2cjdUaHlKVEl5Wll0RHRm?=
 =?utf-8?B?UERmejdaeGg5MUZvWWxFbG9jU1pjVDRlby94NkU2VTl4M01DSll6YkE4blha?=
 =?utf-8?B?VGVvbkZLSjVWcjdUbytMODdFeHErSWJ3YTczWFlwRjVZR3ZLRlJ6SjlZVmRX?=
 =?utf-8?B?c3NXWTltZkkwN21veDdrN0lqamYrOWJ3VlNkdWUvVFdONEhtVGE5b0Y0eFpN?=
 =?utf-8?B?bnJHeXB1bnR3S25Ccng0QUdoL3VvTEtpNUxBNFl6NjZGdTRrMGllZmZvVm42?=
 =?utf-8?B?NktlaWF2bTBPZVdEbW9YaEpkejlKVGgzOU5YekxpOWRVbE9xVmhNYmlXNEg4?=
 =?utf-8?B?UHBzcjA4c3c2WlhVVlJpY2xyTWZCaWYrUmoxQlI2NGVVTTVHSkVYVVdUdFRw?=
 =?utf-8?B?L2t4aUc0RFdnbGFqOGVkTXBGUTVyRDhuandvbE5qQ1Z2RmtwVkVNUEY1OTYv?=
 =?utf-8?B?NmVIbE82R2NxNy9Ua21iUW9SVDRaZnNNTTdwMUZucXM4MjZNUU52STNzbEo3?=
 =?utf-8?B?Q2JRb2J1Z3RxMWh3UWNkZnFLTXNUMmJuT3p0Q0pkSVdkY2NzZ2NJS25HNE9F?=
 =?utf-8?B?YkFJWWVnbFN1cU5WL2JIdGczNUJFOFZWaFhuOU1pZFhhditycnA0YW13Rzh3?=
 =?utf-8?B?V3R1Z3pWMzBLMEZJZVhQdEU4MjM2Um0vWHl1ekk1WTNLT0QyRGhFc0U4a0RB?=
 =?utf-8?B?YThsbVhxTzIwSXpQdFphMEZXUnRQOE5ueGFrb3VoamNjOG1CdklyZHQ0U1Er?=
 =?utf-8?B?NXZqSmI1aXVucTZJbUpGUHROQVU0SkFIaVZyVzFvb21JUHVsR0IzOHJ2M2VV?=
 =?utf-8?B?T0NWaWVOWmJmaFZCM3JEZVhWR1I4Yk9mRmNHd2FKbkVZNHdkblkxcEJWNnJX?=
 =?utf-8?B?RDIvRGhHYzlGK2hmbjNOUWFNZTlidnZRL1FTMlVoaTVvNnNXZzZQL1AxVlgy?=
 =?utf-8?B?S2N4MDYra2dnV2VVQ2R0UVJCaFFDeHFFQm9IcURqRkVJandLRXVjZFRJaFl2?=
 =?utf-8?B?dm1KNTVJd2FVVStSMUQzdk9oQjJHTEE0WEZpNy8wVWkwRkFWQUJDQjdFR1pF?=
 =?utf-8?B?d2llZTdDNFp3Ykc1bDdWZTQ1WmVSNUpndXBoVGlrTE5jVHZoUDRpcDA4NmEz?=
 =?utf-8?B?eFU4T01ZaUR1bnNKaW54Z0pMRnlyMjVkdWdmQXVjazRzdHR4SzFKd0hPTWRB?=
 =?utf-8?B?ZHZhS1FadmtVbFN2QzU2YmI5V1MwOWc3OGVJWXAzR3JPTkVBSUZ5eGIyVzNY?=
 =?utf-8?B?MDZ3WnFkMDJDdTg4dnJNaXk5TVIxaTVkN245MjJXeUNnd1JSakkwd2N6VjZV?=
 =?utf-8?B?YlhXcm95bGRYOWxzem5wZzVOYVBDK0VZZjd6c2VyUWlUUHRJZDFiT0daY2VK?=
 =?utf-8?B?ZW1PZVZKeXUvWmp6UUE0ZG5HalY0MHB2SDhsOWltV3AxdlJNNk1IMHZva0tp?=
 =?utf-8?B?eWQwdmJGLzVkWEtUMitzbitUeklLVytkMGhUZmtkMER1TVlzQ21MOVVUOVFl?=
 =?utf-8?B?TENBeDBzOHVlcUlYL3NyTnZnZTdIL1VJWFRKSExqcjJiUHdtSlMzZ0c4Rm5U?=
 =?utf-8?B?YWRRVjREVyt2K3B4YXkwT0VMaEVIQzlXcVlEU0FRT29LRm9kTDVsb2w0ZDFE?=
 =?utf-8?B?Y05mNlhyU2V5ZWh6Rkd2SjVUeGVmNndlQ3VXalRKdHYzRXZ6Qjdadzd1Q0RR?=
 =?utf-8?B?YVhwZUtlMWRWenF4bzVDeEdaSUltN25oMEdoRENGelZScjU4NXNkTVFkZXEw?=
 =?utf-8?B?aFRjK1B1M2s4N2pRdmw5OFFodERKWWpOdWFXcTl3Mk9GaTVuUFMyOTlvZyt2?=
 =?utf-8?Q?cygQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:51:25.7955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98eda08d-2b43-4732-ea73-08de31885bd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8507
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

drm_sched_job_arm and drm_sched_entity_push_job must be called
under the same lock to guarantee the order of execution.

This commit adds a check in amdgpu_ttm_job_submit and fix the
places where the lock was missing.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 5e40d47398a4..6da1ce03ce15 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -163,7 +163,8 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 }
 
 static struct dma_fence *
-amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 num_dw)
+amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entity *entity,
+		      struct amdgpu_job *job, u32 num_dw)
 {
 	struct amdgpu_ring *ring;
 
@@ -171,6 +172,8 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 nu
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
 
+	lockdep_assert_held(&entity->lock);
+
 	return amdgpu_job_submit(job);
 }
 
@@ -267,7 +270,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		amdgpu_gart_map_vram_range(adev, pa, 0, num_pages, flags, cpu_addr);
 	}
 
-	dma_fence_put(amdgpu_ttm_job_submit(adev, job, num_dw));
+	dma_fence_put(amdgpu_ttm_job_submit(adev, entity, job, num_dw));
 	return 0;
 }
 
@@ -1509,7 +1512,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
 				PAGE_SIZE, 0);
 
-	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
+	fence = amdgpu_ttm_job_submit(adev, &adev->mman.default_entity, job, num_dw);
 	mutex_unlock(&adev->mman.default_entity.lock);
 
 	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
@@ -2331,7 +2334,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		byte_count -= cur_size_in_bytes;
 	}
 
-	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
+	*fence = amdgpu_ttm_job_submit(adev, entity, job, num_dw);
 
 	return 0;
 
@@ -2374,7 +2377,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
 		byte_count -= cur_size;
 	}
 
-	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
+	*fence = amdgpu_ttm_job_submit(adev, entity, job, num_dw);
 	return 0;
 }
 
-- 
2.43.0

