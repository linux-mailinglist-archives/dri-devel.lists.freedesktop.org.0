Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD52EC7866C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B997D10E812;
	Fri, 21 Nov 2025 10:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ICbsC8eJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010044.outbound.protection.outlook.com [52.101.61.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEC210E812;
 Fri, 21 Nov 2025 10:14:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HanSZ4BMKUlETKVDYurgaMlvuDHeGsPL8n/G3kTo4eF9ilvvbNbPAY1vU6J57VOcKP2FCL0x65Cm9711E+PALcP/gCfn/hp4yb9KjMEuAUL+0lvUw2bDducSCmhPdW5s5iShwSP0l/mRJBuGbqJWd99DkAbC5wvBA1tXOj3/aHEodG95/uCe1eUQTiizGsJN+QsaIQfQSkJgar/7o8rfq7xnzFHJi/QqJZILl+rloJz2YNwh01k8rQNADgdHne8DzZFxgP/VNvSsf49cBsPcm7zL9nDuAOaUkmi2+ar0kkXk1cF62CwATd9G6BurzbrrE9mQ2Tw1jniJ1wv3VzuG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RS8RSFgg4sTtu0ibuYn/rXHzztzCFgMeZ9gxIaJwsJg=;
 b=coYtO23kaYxfWON4ugDC4yd3tc9GLoN7az8pMBxGjdwh/vMJwXmM5OY3yEZ8kfvaqfGaiwXVHZOD5ytRQKxflUfnToD0FREQ23wQfcdSCGTjCmyzAIMztTESKQvMJsglHCC0ZnvijaERk+t9Za1DGYobPr9R6csj6nG0wJOSz+neEW/p9OubXGrfCxxsUE0guiBBwh5IdnjOey9FnrhvR7OyU3eoQzM4r5pjHtylL/gZPBH2aZtwxR8h1HgdyjXq3WApBhNLtNLpAZgyGRfJ+yy5b7Mk1xBczFSraC1yKsJgxcQcdyTWIRAhwuCUcSbfJYNitUSqKBkiC1z7BQFFsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RS8RSFgg4sTtu0ibuYn/rXHzztzCFgMeZ9gxIaJwsJg=;
 b=ICbsC8eJVC/6Yid/atQCg2vxrFWc/8UgnNFkumGumkXayvAKBZhFj+3uxEb5KhwfdDzHoTkybDDiZMPUQn+NfQX/YpYWc9pd0ZevDbhUGcrHcZfQYKqhCVR0kenmoT0cnJYhFDYrg+8zNYoXUn7C/Tb5npVqDMaM2AksJ6+GHfo=
Received: from BL0PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:91::32)
 by SJ2PR12MB8806.namprd12.prod.outlook.com (2603:10b6:a03:4d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:14:15 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:91:cafe::5b) by BL0PR05CA0022.outlook.office365.com
 (2603:10b6:208:91::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.5 via Frontend Transport; Fri,
 21 Nov 2025 10:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:14:14 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:14:13 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 05/28] drm/amdgpu: introduce amdgpu_ttm_buffer_entity
Date: Fri, 21 Nov 2025 11:12:15 +0100
Message-ID: <20251121101315.3585-6-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|SJ2PR12MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c5ae34-c4a1-475f-a0bd-08de28e6b939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2pqNHBza0pHWGxaTEorakR5TmR2bDVOZzUxMTArcEV3eG4wMHRpMDBLTW1B?=
 =?utf-8?B?clVUNDd4aUw3UHNTcWJkYUlHdHdyemhSVWdOeE95UUNuK3QweWlaQUpjbUhT?=
 =?utf-8?B?QmNvRUVycFRBbDh5aWVRZ2VqNm5tM0dwdnpodTl3NitXbWhUWERidHJIOXo2?=
 =?utf-8?B?ZWNmMDNTQUVYMHJHZWNzNysyNmRXWTlXUW9GTVlKcTl4OUtldjRBc2w2VFVY?=
 =?utf-8?B?MTloVis1R0lyK0RoZnMwYXNhNUJUZnFWRGRRdFhoL3dKdVNZOXhWK3pkeEZZ?=
 =?utf-8?B?NmhCQmluTzlmWXJLcGZxbHl6bUZBSDdORWo2bmFtd3E4YnhYVXRsSlFnREc0?=
 =?utf-8?B?aVZJaDFBa0ZzeUI4MGNxN3VEUzVwdEhHNnIvR1JQZ2k3ZEp5OCtZL0lUMXd5?=
 =?utf-8?B?NmdCSmd1bWZsbmVROS9SdkkwYmtCVWJCWkkraFprRG1FYndmeUNzbDRISkRy?=
 =?utf-8?B?b01aQ1YwSWxrMkFBMlYvWEExbmpEaTN2ZkxCWGU4TEdSQ3ZYTko1a2U5Wm5k?=
 =?utf-8?B?empJYmhYNmx0Zlh2bGJNRXpwT1RoZmVDUmdUUWlRTUZrYU9sSEVyQk0zb3pt?=
 =?utf-8?B?OStkdDdXa0hFQmV4NGhCaGRyVzdKK2JLWG04emxTdGpJVWV5N0c1MlVpNjd6?=
 =?utf-8?B?cGxrbG1JOUh1UklJanFKY3ZIVXZ5VkdNeXVYRFRLQmZCQUU3THMwVWRHNmZk?=
 =?utf-8?B?c1dEeHIwelRVNnJZWnVUb0lmYWRyRTRWTkp6VVAwV0Rpd2tFWGxaMFgwTTI2?=
 =?utf-8?B?cEtyZUVwQldIUjFlMmlkaHRGSklZL0wxY3Y3T2s4Zmo3UEJPK3I5Z1RVV3hw?=
 =?utf-8?B?WXNQTFFKcER4SitSVEN0VWV6NnFWQTFZdW9FdjFNWXN1MlE0VFdyWllVMGxB?=
 =?utf-8?B?MGJCVFJLRXNOR0ozZTFob09nRnNIREtZdm5nUjJCTXNJcGVhbk1zWHZUWFI1?=
 =?utf-8?B?anVmMEZKNC9BdVNzcW54eWhZUlgrcHZ4ZHAvVEhrR2JCOW1NRktGZlViTUl5?=
 =?utf-8?B?S1VDK29QcSt2c2NNRWtwemVqUVArMG5BS1dCSEpYRzhRMlNCRFpkYU9NU2g0?=
 =?utf-8?B?ODJGcUxWZDdlR2drQlpwSzVlSkxqelVMRXkwbHFyY0pYZUdqK084MGVYTkxW?=
 =?utf-8?B?aGNpVG5qeTE2bllvTkxZd2UyeTlSSzZpeHZKdi9GamFWdi9Wd1c3V014VmNS?=
 =?utf-8?B?SHJzbWxDY08ydTRIVkt3d3E4YXB5am5ZNG1yeFAzcDVZWG1tejk2MmNkelQ0?=
 =?utf-8?B?ZFJjeisvN2JIQXYvdjZ0bzBVRnd3ZmpSMzhWOFl2RDdJVzRSQnBtVTd6dFMz?=
 =?utf-8?B?TjZZQmpxTU9tcFBrM0VQa0loelVZcmUyUGlHVGlaVnArOFVrdVgxWXJJSnVs?=
 =?utf-8?B?MXhhRElxbnhxWmNsL2Uvc21LTTh0bG42VTZZNG1YeVdySzVIbWdDL2swbG1S?=
 =?utf-8?B?Ly8wODdvK2lvb2EwM2JWbmhSVTRtVW9pUVJlVlc0WWxlNkt3cGxJUzZUaTQy?=
 =?utf-8?B?MzkyWWU4dDNnd0VGUTlYbERpRTJyN2RxeWNjN2FwanFvRGd1c3pNVVFXdUY2?=
 =?utf-8?B?YmZBbWRENTNTVjBhT2dxcUdaRXRvR1pSZnk0MDdMQ2YvNUpyYnBXODNCTnVG?=
 =?utf-8?B?U095UUk2ZHJYYVNpOFZEa25SMmhPRmlxQTgyYTZacFdoOVdpR0swc2FpdnBy?=
 =?utf-8?B?bGZxQ3UxMHliUjdpZFp4RTJJdnhPcHpxbDJDcnNzbWhiZ3VCWDFIRHMxbDJk?=
 =?utf-8?B?anhud1BhM05pNlM4N1NaclB6bjMrRmg1Z24renI0VWN1K0RhRWJEOEM2WmdN?=
 =?utf-8?B?aDB4R1Z6NVpNWkZRcTl5ZGFxR2xHZDNsdWo1UUMySmx0bHg3bndQeHFBeWhP?=
 =?utf-8?B?WGJvR0crelQrNEs1UlBuc1dMWjZSMmV1R0FXelQ3UVFtbTFVY1AydFVFWXhL?=
 =?utf-8?B?ckczM1V4NkJFOFdReTZ1ZUpPeUVMUi9mMTUzZVBGU21ZQWtiZXRjQitMQkxh?=
 =?utf-8?B?SEt3N3pQc25TcTIzZ3hCNVZ6OXVoaHNwcmtJYngzWHZicXpUY0FLc0Y1Q3dJ?=
 =?utf-8?B?Mkhhb1BlVStjNC8wajI5NW1yOUl3YUxiRVBYK1poMUg1Tk9CZjRoaXY2Z0Nu?=
 =?utf-8?Q?HRrw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:14:14.7940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c5ae34-c4a1-475f-a0bd-08de28e6b939
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8806
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

Technically the change introduces synchronisation issue, because
dependencies between successive jobs are not taken care of
properly. For instance, amdgpu_ttm_clear_buffer uses
amdgpu_ttm_map_buffer then amdgpu_ttm_fill_mem which use
different entities (default_entity then move/clear entity).
But it's all working as expected, because all entities use the
same sdma instance for now and default_entity has a higher prio
so its job always gets scheduler first.

The next commits will deal with these dependencies correctly.

---
v2: renamed amdgpu_ttm_buffer_entity
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
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
index d54b57078946..17e1892c44a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -224,7 +224,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
 
-	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
+	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4 + num_bytes,
 				     AMDGPU_IB_POOL_DELAYED, &job,
@@ -1479,7 +1479,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 		memcpy(adev->mman.sdma_access_ptr, buf, len);
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
-	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
+	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
 				     &job,
@@ -2161,7 +2161,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
-		r = drm_sched_entity_init(&adev->mman.high_pr,
+		r = drm_sched_entity_init(&adev->mman.default_entity.base,
 					  DRM_SCHED_PRIORITY_KERNEL, &sched,
 					  1, NULL);
 		if (r) {
@@ -2171,18 +2171,30 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
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
@@ -2200,7 +2212,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	return;
 
 error_free_entity:
-	drm_sched_entity_destroy(&adev->mman.high_pr);
+	drm_sched_entity_destroy(&adev->mman.default_entity.base);
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
@@ -2212,8 +2224,8 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 {
 	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
 	int r;
-	struct drm_sched_entity *entity = delayed ? &adev->mman.low_pr :
-						    &adev->mman.high_pr;
+	struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
+						    &adev->mman.move_entity.base;
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

