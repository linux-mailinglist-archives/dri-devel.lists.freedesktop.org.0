Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12ACC9AF07
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5623210E5D1;
	Tue,  2 Dec 2025 09:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dDtj1rCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1573010E5D1;
 Tue,  2 Dec 2025 09:49:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2d+pRcF+LHM3CzM17lw8l1O17W6TLGTetlHnxgg1IP7VIcTgLBF/dCZmc2Qujh8/LB2WnOlz2qCBzzVWbSRdc7iZBPzTcit/fEMnlHurb50+q96oC3YFO0AnSAeX+c2700q+c6jWj7dumjOcyAqyDAmDCEuPl8zF9BMkYKW3V+ThWX3XSz3I+badVQEVYHCAIUcovtvO8u6vHXf264bMjkU15GMz5gJ3jUoDF/in+aLKRA76nAU5lm6xmyO87+6SKBZh9R8RbVcBuU0Jw+BEaZOtWM6Mjm7CLP9Y2o/oZMHEcqqiwk/h4KElhpO/C6+tC5X6czWFWeTQgWjTLY/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twMjSvkph0+a+q9RYT3eW7md+lxiLDHh/CQrjm1AuMQ=;
 b=R+7m/yc2ZC7EQI0ol9ExlTsb8kVqfv7xi7/ok2+IXw43KSyJ+Hds3tNQ5cc7q59NeRMFRbh/wkeEvwWNV+hzHLIFjg1fjf+9+/Y0EZ+i8svV2zCbRJ2ec+gpOrsypiaiBtUIicyP2YFpHS4mpWp8CnAH34xh8YV1hIq7Af3l2OkcSnWKS/t6cr9R8qUHby2bF5lPRf1Dotp10Y0hwcblySQBupy1TmaBpeBwxmp9Nbjzj0SlqUyTcLQHVDAZlTTHtbsOH/LaVpMGV2ul98s0qEMIs6ucCFT4XRDooCkfWF438iOKb/4Q0+crLASycRvHBU/6rQnhM6x0Fd2/xG+8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twMjSvkph0+a+q9RYT3eW7md+lxiLDHh/CQrjm1AuMQ=;
 b=dDtj1rCO6wItycb8oDcnrfz0x7hP97sQw6srzWOfqOJS6oSr+IyLkO3qngQNcmQFhdf3R3WvEhZYbtT6gHjxO2SWARImxvXa/XXN3yDUBIbIWeFwmfvRTwyiRWvNkiSrIXVGUYs8aeYx+Lii5Y6HtAbfim+B5cVUsk4Ex9G/DMk=
Received: from SJ0PR03CA0225.namprd03.prod.outlook.com (2603:10b6:a03:39f::20)
 by DS7PR12MB6072.namprd12.prod.outlook.com (2603:10b6:8:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:49:19 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::91) by SJ0PR03CA0225.outlook.office365.com
 (2603:10b6:a03:39f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 09:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:49:18 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:49:15 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 01/13] drm/amdgpu: introduce amdgpu_ttm_buffer_entity
Date: Tue, 2 Dec 2025 10:47:11 +0100
Message-ID: <20251202094738.15614-2-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|DS7PR12MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: f79f667b-06e8-45a5-f4d4-08de31881035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWZidWlYV01XTjB5emFrRlliMFplUkI4TGVzcUZTbVFmVmNLMlUreTh3cG9G?=
 =?utf-8?B?VGk1WmpPNCszMmpNbCtsY3pMa1p6czZUWkdRVUtYNVpMMFlQaUt2WG9SeEJw?=
 =?utf-8?B?azRzL3E5SWxVSmZtc05TQ0pGeHgrSHBjdjM2cDFnUWFYZ0pCdEdabU51OU9a?=
 =?utf-8?B?NEZLb3R3Ym5EcVJFdThKWm8rNW5SWWhCNTIvakZ6UzlYd2ZvVkJhWk5QWjRY?=
 =?utf-8?B?VDI5bFNocGJJTzJuTWxCT0FNb3dsY1RPZDgxOG1ZTDJvbDcrMnAvdjVaZGRu?=
 =?utf-8?B?MU01RjdRZWlJMkpqbkRpT1ZUZDR3b3pFODVlK0lXV01iOU9Tcnl6WFhna1Rn?=
 =?utf-8?B?bDdoaXRJTkZpbWJ5VTlVbzE1V2xxdkZTNm01b1pZZnk0Y3AyK0VXc3ByTkcr?=
 =?utf-8?B?UHJocVd0N1gzTHQ3Tzc1a3FMczN0TW50YkEvSGJ1Zjhrb1lTdjZWQU1JWFpB?=
 =?utf-8?B?dkZlbExYZ21GTVVKeGZxWDc0aEZuZnVkN1ZpNEcyV1I0TXBsNklqeWFIcUFa?=
 =?utf-8?B?MkdpTUJxTUVmZHJ0SVRrR2EzMnFRUVp1YWVKRStjelJ4d3BFSXJoSms4UHNm?=
 =?utf-8?B?TUtEbmNxbXpwOVlxV3k2VVJLYldzc28rSURubDRWaEhzYlhHWjlmM3g2Sngx?=
 =?utf-8?B?S3ptV0R2WWlZck9WN0RPZHpUb2ExN1hvNmN2UkJ6UU8zUEh0WDA3MGYxK1Ev?=
 =?utf-8?B?UFpVRTkvMGVlU25maVVLUytkOGw4YjdxMlJCOHg2UWFQOVZtWXR6ZjJ3SmNR?=
 =?utf-8?B?T0t6UXg2V2RKWk1zbjVoMnVFeEtkdWpncll3b25OOUNjd3krV25SLzBGSkJO?=
 =?utf-8?B?bnQyVVVyRG9jTWYyN1RkZ0c5VmhSV1ZObWtCYmM3ZVEvUnIrN0M4cHpScURz?=
 =?utf-8?B?OXdJSHFmMWF5aUhFUDl5KzB3WGVWY21aam54V3p0WU5OK3J5Q2x5OWlHZ3ZG?=
 =?utf-8?B?Qk5CdzhTQ1RhakZteW5acTIrNDM3U0hYdVV1SXpGNjhjRk9vUXk4Zm1aYklE?=
 =?utf-8?B?RUVheGNrS0JEYWJiSEF2QnVha3hTOURrckhPUWNQTDU1dzdHMlpZb3lZeGVp?=
 =?utf-8?B?bDN1dWdsTTJHME1BeXRSdkYzTkM0dGFCd1VpV29YdEpIM09sM2p0QzJRYUNC?=
 =?utf-8?B?U1gzNXNWbWFiTVIxQnFLeXE1bHhEdEtVc0NqUGFLc3BCOUhWSm1SMkttWlB5?=
 =?utf-8?B?RXVkYXIyU2FyazFkQ3ZWZEUrNHVkUkJTbjFkTWFzeEJWSTRSanYwTllqMCtE?=
 =?utf-8?B?aFRmR3FwdnZzemh1UWFucFJwV3l6TFVNYmlidDNVVWFVNTFRS1BiaW12MzI0?=
 =?utf-8?B?bW5mTXdRRHluSnF3WWFvOXVvVVEzMHJjeEFiQjYrcW1SZmtFU0h1S2xackpq?=
 =?utf-8?B?YXE5M0FFNysrVzhBL0p6NUxHN1NQSSs1SFVlMVVFdEd1VVlyTlpHcy80elFR?=
 =?utf-8?B?RW9xWEF6VGVMQ0YvcDVaeVArOE10eXVrdCtNRGFYRjVXbVVLSnRtZ1ZZbG5K?=
 =?utf-8?B?czVRVzcxZW5UUS9XVk9keVJ2dy9BQVdYL2VGNzZNdVBFL2ZzeEhwbFFUdWRK?=
 =?utf-8?B?YmZxbC8zOFdKVWhUcDlRVDFQTktKdFEyanRKaUtKNEl3VGFVV1E4MGovQ1Yv?=
 =?utf-8?B?WnFXTGd0ZmtsMGxONVZmT0VTQ1N3VTB1UmZoUGErVjNkMkRhQWFicVAzWDN4?=
 =?utf-8?B?NWU1L0hON2dJQUVwNFpCd0g0aHUydjA2VVR2OXVOZVVnUmZTWUJMNkFNdkg0?=
 =?utf-8?B?UlZkNnFUbWkzYmFPUzNjdlgveEpoSXp6MDRjbFQzbHBNRGFtOWFTbUNIcWpt?=
 =?utf-8?B?a250S0thUVp0Q0c5TnluR2huSHdtTFRySHdNZzBYU04rbnBtT0Mvcy9xN3VN?=
 =?utf-8?B?YU5wUUMyQzBXUVduOUM5aFVIZVd1NzVSZktDUW84c3M2WENzRHN1VVRROVFy?=
 =?utf-8?B?eHp6RktmbFlKbnpDQ2ZOQjFKTG5SWlFVbkVzMnVuck9aOG9Na0RYbjBaVzlK?=
 =?utf-8?B?TzZxT2Q3RmJDbUlmYUUzeEtpQWYwVHhPYW1ydHlSdXpCeDkrWDVaY3VlOUVn?=
 =?utf-8?B?dWJlY1dUcGI5dHArcmZDeVBNV1VzMTBpaEJyalRHOGtKZndobjNwdFY0MTM2?=
 =?utf-8?Q?SjlY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:49:18.9167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f79f667b-06e8-45a5-f4d4-08de31881035
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6072
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

No functional change for now, but this struct will have more
fields added in the next commit.

This change would introduce synchronisation issue, because
dependencies between successive jobs are not taken care of
properly. For instance, amdgpu_ttm_clear_buffer uses
amdgpu_ttm_map_buffer then amdgpu_ttm_fill_mem which should
use different entities (default_entity then move/clear entity).
To prevent failures for this commit, we limit ourselves to
2 entities: default_entity (which replaces high_pr usages) and
clear_entity (which replaces low_pr usages).

The next commits will deal with these dependencies correctly,
and then we'll be able to use move_entity.

---
v2: renamed amdgpu_ttm_buffer_entity
v4: don't use move_entity in ttm yet
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com> (v3)
Acked-by: Felix Kuehling <felix.kuehling@amd.com> (v3)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 30 +++++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  | 12 ++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 13 ++++++----
 4 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index ea8ec160b98a..94e07b9ec7b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -687,7 +687,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 * itself at least for GART.
 	 */
 	mutex_lock(&adev->mman.gtt_window_lock);
-	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
+	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
 				     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 03500555c4a5..843a0e483268 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -223,7 +223,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
 
-	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
+	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4 + num_bytes,
 				     AMDGPU_IB_POOL_DELAYED, &job,
@@ -1478,7 +1478,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 		memcpy(adev->mman.sdma_access_ptr, buf, len);
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
-	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
+	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
 				     &job,
@@ -2162,7 +2162,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
-		r = drm_sched_entity_init(&adev->mman.high_pr,
+		r = drm_sched_entity_init(&adev->mman.default_entity.base,
 					  DRM_SCHED_PRIORITY_KERNEL, &sched,
 					  1, NULL);
 		if (r) {
@@ -2172,18 +2172,30 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			return;
 		}
 
-		r = drm_sched_entity_init(&adev->mman.low_pr,
+		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
+					  DRM_SCHED_PRIORITY_NORMAL, &sched,
+					  1, NULL);
+		if (r) {
+			dev_err(adev->dev,
+				"Failed setting up TTM BO clear entity (%d)\n",
+				r);
+			goto error_free_entity;
+		}
+
+		r = drm_sched_entity_init(&adev->mman.move_entity.base,
 					  DRM_SCHED_PRIORITY_NORMAL, &sched,
 					  1, NULL);
 		if (r) {
 			dev_err(adev->dev,
 				"Failed setting up TTM BO move entity (%d)\n",
 				r);
+			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
 			goto error_free_entity;
 		}
 	} else {
-		drm_sched_entity_destroy(&adev->mman.high_pr);
-		drm_sched_entity_destroy(&adev->mman.low_pr);
+		drm_sched_entity_destroy(&adev->mman.default_entity.base);
+		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
+		drm_sched_entity_destroy(&adev->mman.move_entity.base);
 		/* Drop all the old fences since re-creating the scheduler entities
 		 * will allocate new contexts.
 		 */
@@ -2201,7 +2213,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	return;
 
 error_free_entity:
-	drm_sched_entity_destroy(&adev->mman.high_pr);
+	drm_sched_entity_destroy(&adev->mman.default_entity.base);
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
@@ -2213,8 +2225,8 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 {
 	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
 	int r;
-	struct drm_sched_entity *entity = delayed ? &adev->mman.low_pr :
-						    &adev->mman.high_pr;
+	struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
+						    &adev->mman.default_entity.base;
 	r = amdgpu_job_alloc_with_ib(adev, entity,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4, pool, job, k_job_id);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 76e00a6510c6..41bbc25680a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -52,6 +52,10 @@ struct amdgpu_gtt_mgr {
 	spinlock_t lock;
 };
 
+struct amdgpu_ttm_buffer_entity {
+	struct drm_sched_entity base;
+};
+
 struct amdgpu_mman {
 	struct ttm_device		bdev;
 	struct ttm_pool			*ttm_pools;
@@ -64,10 +68,10 @@ struct amdgpu_mman {
 	bool					buffer_funcs_enabled;
 
 	struct mutex				gtt_window_lock;
-	/* High priority scheduler entity for buffer moves */
-	struct drm_sched_entity			high_pr;
-	/* Low priority scheduler entity for VRAM clearing */
-	struct drm_sched_entity			low_pr;
+
+	struct amdgpu_ttm_buffer_entity default_entity;
+	struct amdgpu_ttm_buffer_entity clear_entity;
+	struct amdgpu_ttm_buffer_entity move_entity;
 
 	struct amdgpu_vram_mgr vram_mgr;
 	struct amdgpu_gtt_mgr gtt_mgr;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 0ad44acb08f2..ade1d4068d29 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -45,7 +45,9 @@ svm_migrate_direct_mapping_addr(struct amdgpu_device *adev, u64 addr)
 }
 
 static int
-svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
+svm_migrate_gart_map(struct amdgpu_ring *ring,
+		     struct amdgpu_ttm_buffer_entity *entity,
+		     u64 npages,
 		     dma_addr_t *addr, u64 *gart_addr, u64 flags)
 {
 	struct amdgpu_device *adev = ring->adev;
@@ -63,7 +65,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = npages * 8;
 
-	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
+	r = amdgpu_job_alloc_with_ib(adev, &entity->base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4 + num_bytes,
 				     AMDGPU_IB_POOL_DELAYED,
@@ -128,11 +130,14 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 {
 	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ttm_buffer_entity *entity;
 	u64 gart_s, gart_d;
 	struct dma_fence *next;
 	u64 size;
 	int r;
 
+	entity = &adev->mman.move_entity;
+
 	mutex_lock(&adev->mman.gtt_window_lock);
 
 	while (npages) {
@@ -140,10 +145,10 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 
 		if (direction == FROM_VRAM_TO_RAM) {
 			gart_s = svm_migrate_direct_mapping_addr(adev, *vram);
-			r = svm_migrate_gart_map(ring, size, sys, &gart_d, 0);
+			r = svm_migrate_gart_map(ring, entity, size, sys, &gart_d, 0);
 
 		} else if (direction == FROM_RAM_TO_VRAM) {
-			r = svm_migrate_gart_map(ring, size, sys, &gart_s,
+			r = svm_migrate_gart_map(ring, entity, size, sys, &gart_s,
 						 KFD_IOCTL_SVM_FLAG_GPU_RO);
 			gart_d = svm_migrate_direct_mapping_addr(adev, *vram);
 		}
-- 
2.43.0

