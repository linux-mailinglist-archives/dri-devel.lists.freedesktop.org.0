Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91342C2FF61
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19BD10E571;
	Tue,  4 Nov 2025 08:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gwny0K0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B0110E56E;
 Tue,  4 Nov 2025 08:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cggTwgBZt1ZOW8NamAJjKz2YkCnUk9pWit3ObSZhbkNQ2OGyzf0Nw+mMWf5BN6mGbxAr23f6F7ouxhJ8gQ9o5+ZKT2GwBDHv/7C8mssuElAH9mMNUQ3uLy3fkVHsafIexUvqU8n4kWBX1jd4BCJiMsEhuBrfz+xorCEt7rjwhv3dm091Otd4BNJLqZy5hlfJ4FXgw9ZfTzOvs9gO+zwnAJd8Uzn90JKbAhSCq+b2Zs+QNPSQ89PFpm218bSkvWSOjMpfW/9KIX2rYpUnZGYMrtnG4e+rHPhSb9ME1UQWvD4l+b5LsKaHpRk05Gx/APkpva+5ciFTbw1I5Skw1gTtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j72vlyK1HLMAQG/JP9CSabKoZXqUxjFPNH2lDM2QttY=;
 b=HQo0nf52qsP3UtPoPrtV5bZsPcSeidnhUsvZAWLtOgcFV5KYgC1CPcsvTGzkawdEHihvd1mw/8XtGIH+ca/7EqMFsYZV+NWf6pCprfk52V0UaYUkO/+RSdo8ltBBiNorzjnNym9Lok+dHmmsRpwtAOxQTnaPQARqxtyo3BmkS/l4PteMzk7zmbLlk5XHAfG7vdGPi5XnGt2wYdXyoD3kXSOSE0GnKvdBJ0DZX5PxCejij8VKVo44mKBWvVAnBvgBSyrO+DoNaOy/1BDkreXX9NJHWKT4rNOymMun8SMFXBVVHipHVDlBPvw1QkFv6deMzyoa919X5OrSsnbb4cwp2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j72vlyK1HLMAQG/JP9CSabKoZXqUxjFPNH2lDM2QttY=;
 b=gwny0K0MufwzTSxxca9nj58AabiZ7C+jQAxAxFk53MjCb4NRG7e1B1OwrDnbOMlI1ZiGTsddGujYyhwPvb+aYj8eDG3iQue0D4FE6Euktsgkv3H4lSWVq8u5lM76N23KwQai/W8/ovf+EeHPrsDVMsamWLX4BGgir8Q07GJsmbc=
Received: from SJ0PR03CA0089.namprd03.prod.outlook.com (2603:10b6:a03:331::34)
 by DS2PR12MB9751.namprd12.prod.outlook.com (2603:10b6:8:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 08:36:50 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::98) by SJ0PR03CA0089.outlook.office365.com
 (2603:10b6:a03:331::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:36:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:36:49 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:36:46 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v1 09/20] drm/amdgpu: pass optional dependency to
 amdgpu_fill_buffer
Date: Tue, 4 Nov 2025 09:35:24 +0100
Message-ID: <20251104083605.13677-10-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|DS2PR12MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: d5790c8a-8159-431d-cbca-08de1b7d4c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?85yrGkOa2C3vgZ7cRXiIJWdrw3pgSKzyJQC5/TioaR6ldyuJ+6sOXtEQX621?=
 =?us-ascii?Q?GrVfJ0T3ww1cU01TS7lCcykn9LfUCYuBtIKU+I74GNMJkvrYVfUFpIGHmih2?=
 =?us-ascii?Q?MezFpQpWvVHxZ31KaUs0Uzyt/chEMl+6MuE8FlzIAj80Tdh2xX3T6SWsABye?=
 =?us-ascii?Q?CNozyJIDhRTmSXdOsNkyngXsNj64vv91C4jKVJdKtFd1Ec93ZZqxsWXfddMV?=
 =?us-ascii?Q?mvmcVCSRI8FFiShKVBJhoqW/YgpiR8nXSEw341qvOsVlYh2DtH5zct67ja62?=
 =?us-ascii?Q?IPdlmkV3g0oV0Vx+wzDvYd8mt/AifzbymMtk8C7DoK2BbSs6qoAvPbsmewRo?=
 =?us-ascii?Q?BH25Ah1sy/BzHoaj4gVLkVhHy4hucG/4czyL0VuEl1LLIA6jiksoEy+GJB9H?=
 =?us-ascii?Q?T5+NtYAPUfNfQyVkAVTpPXIdmNDaJT577QDr8CEaXP64+84AW2YVAOvRK3uT?=
 =?us-ascii?Q?Tw0jTKhA5ztIdm4QuOJLz8GZqD52RAH/1rnaPtAwhPLNCSDXQmoGE5zyysfU?=
 =?us-ascii?Q?mIAEXrhvR1uN9V6CKtzPWf0Ggi4eFxCXVEHsUY67jDC/A5jb3a1dO7/5SPso?=
 =?us-ascii?Q?EAkzebZtyny9DEhSmG16S5b4g3nOWwHQljyNyweMkAZKNuB7JRWbiFhPPOlG?=
 =?us-ascii?Q?POLOfWoY5RrhcxwTc+SANHheWBXp/7ewTXAu509PUFXATFfXtKgsEAAOrcsa?=
 =?us-ascii?Q?eWj5+1WS3AeFa7V62M7g9HW2SPrvjGqJXmSpVpavqOfwlPi2OKnuvvg1mxGX?=
 =?us-ascii?Q?M401KpjH43S0k4c/PwZT3ulU5IE3/L4WcxciwODBVpu766NcHdgsgHGBZ/Kv?=
 =?us-ascii?Q?BqD9k7VcmH4lpSTcugLorEK1nOYhz4D43Nq1eO3LTUyjwKMjh303U/eWo618?=
 =?us-ascii?Q?FIAt2a+7XS1cTVtzcm2WYO65u1gBM95z2kIqyWkW4XmVH05K2lrNnSH9hkDu?=
 =?us-ascii?Q?OF8NNmMnyH6bgIiSRzLraPCE4u5+EvCbmHuVzHJptbc3iKhpBKreHRk3IEJJ?=
 =?us-ascii?Q?QUkuYg6ecnIZ+0lDcey6TiyjJIB7GR2frlxdH8Ni2u3Gu2u1cgNxklD/x7Tj?=
 =?us-ascii?Q?4dMRgyR9vNnW4oreYPEu+gHJkWDdxuHLAUQKXbjWaFSv3tHFWtSr7M90TXZy?=
 =?us-ascii?Q?/EKUNmyETqEs55FPRinm3xMSx3uH4v7to7PS63K39JI3WxmmdZn0Im7naRts?=
 =?us-ascii?Q?m0BlPiw1Sk09ZfBlfqaJ5J5NivWPmT72EOUEyLIHT4/Cu345Dn3E4qbwx0FP?=
 =?us-ascii?Q?G2ijXwq5AizgDksgr1Qk32Wr2qKF66+j29Mf4Q0V2DmLHhx16ZUX5XFv+m/w?=
 =?us-ascii?Q?WGMTBKVKlGoIUHAvltss/9gANrmYAchzg3WrrucXwUSF2Uy8MVPFBWRKWbMu?=
 =?us-ascii?Q?+yaGHFKVZ4+DJ5pKCCuYxuYwn71yOBZh7A/zwvwuE7lD94haJ8Vb55lg3vJo?=
 =?us-ascii?Q?TU6XsdYoBQH7aAdbAG8MLYIZFCiFmArdVeeRF8I0jzDknJxaa9il24bqywas?=
 =?us-ascii?Q?P+aEoMVDakBXDpjNbY7U6FQMASK4XXgyH6laMDtR25xYKdohGpNjevP1b0of?=
 =?us-ascii?Q?CPWRq5dT0ImMeGgkqeE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:49.4912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5790c8a-8159-431d-cbca-08de1b7d4c2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9751
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

In case the fill job depends on a previous fence, the caller can
now pass it to make sure the ordering of the jobs is correct.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 22 ++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index e7b2cae031b3..be3532134e46 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1322,7 +1322,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 		goto out;
 
 	r = amdgpu_fill_buffer(&adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
-			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+			       &fence, NULL, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 1b3945513157..b94ac16c785b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -173,6 +173,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
  * @tmz: if we should setup a TMZ enabled mapping
  * @size: in number of bytes to map, out number of bytes mapped
  * @addr: resulting address inside the MC address space
+ * @dep: optional dependency
  *
  * Setup one of the GART windows to access a specific piece of memory or return
  * the physical address for local memory.
@@ -182,7 +183,8 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
 				 struct ttm_resource *mem,
 				 struct amdgpu_res_cursor *mm_cur,
 				 unsigned int window, struct amdgpu_ring *ring,
-				 bool tmz, uint64_t *size, uint64_t *addr)
+				 bool tmz, uint64_t *size, uint64_t *addr,
+				 struct dma_fence *dep)
 {
 	struct amdgpu_device *adev = ring->adev;
 	unsigned int offset, num_pages, num_dw, num_bytes;
@@ -234,6 +236,9 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
 	if (r)
 		return r;
 
+	if (dep)
+		drm_sched_job_add_dependency(&job->base, dma_fence_get(dep));
+
 	src_addr = num_dw * 4;
 	src_addr += job->ibs[0].gpu_addr;
 
@@ -326,13 +331,15 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		/* Map src to window 0 and dst to window 1. */
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  src->bo, src->mem, &src_mm,
-					  entity->gart_window_id0, ring, tmz, &cur_size, &from);
+					  entity->gart_window_id0, ring, tmz, &cur_size, &from,
+					  NULL);
 		if (r)
 			goto error;
 
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  dst->bo, dst->mem, &dst_mm,
-					  entity->gart_window_id1, ring, tmz, &cur_size, &to);
+					  entity->gart_window_id1, ring, tmz, &cur_size, &to,
+					  NULL);
 		if (r)
 			goto error;
 
@@ -415,7 +422,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 		struct dma_fence *wipe_fence = NULL;
 
 		r = amdgpu_fill_buffer(&adev->mman.move_entities[0],
-				       abo, 0, NULL, &wipe_fence,
+				       abo, 0, NULL, &wipe_fence, fence,
 				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
@@ -2443,7 +2450,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  &bo->tbo, bo->tbo.resource, &cursor,
-					  entity->gart_window_id1, ring, false, &size, &addr);
+					  entity->gart_window_id1, ring, false, &size, &addr,
+					  NULL);
 		if (r)
 			goto err;
 
@@ -2469,6 +2477,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
 		       struct dma_fence **f,
+		       struct dma_fence *dependency,
 		       u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
@@ -2496,7 +2505,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  &bo->tbo, bo->tbo.resource, &dst,
 					  entity->gart_window_id1, ring, false,
-					  &cur_size, &to);
+					  &cur_size, &to,
+					  dependency);
 		if (r)
 			goto error;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 2874f054e869..9dd2a76a5641 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -186,6 +186,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
 		       struct dma_fence **f,
+		       struct dma_fence *dependency,
 		       u64 k_job_id);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
-- 
2.43.0

