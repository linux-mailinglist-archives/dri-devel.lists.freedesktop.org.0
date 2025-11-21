Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AD3C786FE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DBA10E82B;
	Fri, 21 Nov 2025 10:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mehL36YB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013056.outbound.protection.outlook.com
 [40.107.201.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D991410E830;
 Fri, 21 Nov 2025 10:17:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKRYAgiyCWOEpAcne1NQp66gqwJ7/Yxq0KGh/AdXb1bFkN1Y56wpaWDN1D4dedaDAbm9V/7NjvBb9ps8wNt8yUy9bFwoQuoiZnZ8DBkGNeHhaEK+9NMu4pM8YMAT/oYXUU9MP1sioepcXJLb/uBXv3ngugxuAbA/gSmCeNryZrbdi4ZiCuYeShLEIg2GAgQy/ThL1On5JY38wLchBPpBc2QQt38nMnKqmZh+RDTx7Xgn5rEGvvpQzDMBE/aMnfutip4eRaawiNSuWlDMowMWluIVoLh1OoOA7+sQM6/jFdGZLyJGnyi3gHLHlmswv7fpOEkCNMQ7W7D3aIwpLVcT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhjDsTRh5IebcsVAiaDqcyvCU553tYBS531yz4q0CHg=;
 b=KYtQcqNwLcU1dSreewa5W4XTJbaQ8SvV9OE5NFt7ptK2F8CfKy9Ec11RzHbGjG5HVZsMOEQA2XGWIkQFjPUPBwEkJGyYeZtKXBGbUQmYi1fiNyVqkwAATxLsGa3MzpYiblta6rxM8tlYg6K9AcPw6lEwIBCDIT3mA/n9K0UQ1bq79TzmK4euXPo3JAL2hYnrjdritwrAdtN2dvBLrbF0yQrg9nk+BEH4ZmsyKx27Enn1jQFXGsc3aexjm0QZmrutetRbJY9eZ5lyd47PKaU3cdSCOnLofv1Rwkvlc4ku4+PJFApeO7F7M2ZxicRKJvoIZRjUZjhAZauxNJWij7I6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhjDsTRh5IebcsVAiaDqcyvCU553tYBS531yz4q0CHg=;
 b=mehL36YBFclfh31z9KXgkLct3wAWLwouQasCJVDz5w9Xll0sury58OeaySKBzYnx4lkXOiGlySyogbeDzQvmO1LKnEcsPshmCszfkgIq7mA3IEKCE2oKJv/ucU0hkxurYCjdiAkVco6VOTxxmKvYyI+q9JwWhsyzwyJqk4Xtjlw=
Received: from BN0PR04CA0043.namprd04.prod.outlook.com (2603:10b6:408:e8::18)
 by BL3PR12MB6548.namprd12.prod.outlook.com (2603:10b6:208:38f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:17:15 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::e3) by BN0PR04CA0043.outlook.office365.com
 (2603:10b6:408:e8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 10:16:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:17:15 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:17:13 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 16/28] drm/amdgpu: use larger gart window when possible
Date: Fri, 21 Nov 2025 11:12:26 +0100
Message-ID: <20251121101315.3585-17-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|BL3PR12MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 6358cf49-f40c-4b71-7c2f-08de28e724c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fCkl/nT10Bc8Z3MVEf008+ZVvYNZ7q+uMYPKnop45qPhwI7B9W8Wsk4zPG4W?=
 =?us-ascii?Q?fkITE/i322y0bnPUWQnSCUGFM+PjX2kKSGDslGCDfNnpBppmCDPkwQn2S3Pw?=
 =?us-ascii?Q?XplQYUjdqf+kkp6qYJVsDbuVByPlxgjKpMqSe/MmMnymKtiLl3zsxc+rbd2b?=
 =?us-ascii?Q?YQvyeNF5IUNpyWp4pzVi/x+eL+FBCPGeRYZhz8rLW0nH+QqCU/5kdVVjUvi+?=
 =?us-ascii?Q?O/PsuGfve52NXXq3X4qH8GWYdudC/8IQdt548/0GUnOPgULtx5g0nTTcLJfa?=
 =?us-ascii?Q?cNZk1TJlgjQghB7Dat5Wsp+fIZVqIPaYJJ8t/15flspg5vYCE3xK2D1jXV/x?=
 =?us-ascii?Q?zZ85KTpJVySXvucZpyB9/9d1ddOj48bYAXx6tS+nk84Il4fW4PH3t3JHH22T?=
 =?us-ascii?Q?jP1Rf2yslb3xTdjlVptcZt/6U08G7A+6Ixl3rzGSSPFWrB0t4KdTHr1cyM5e?=
 =?us-ascii?Q?4C57V66jGvsw+qLCLJdkfmEhbsi1RTt0Hy88edJI1+6661DAe54qs8t8bHga?=
 =?us-ascii?Q?WpEcs/XdDKVxRVgdxIZgtdWvrezuo632GiosjhPuC4fZu/in5/UY6vrRpez3?=
 =?us-ascii?Q?bCsGEyoeMZSCAyVDZOkitXycGCwgIGVVPaH2162RKa+7Th48+6OPos9eQp9B?=
 =?us-ascii?Q?nb/rqLH451fXPM74bJKtlLexMdhfhlDu3Ne0TOgfZOq7OWizVVXPUg3Tlk+J?=
 =?us-ascii?Q?11qnohLbKoCg0CX2klwoRkov0Ba2mbWTlZJAlUMXSWqjvDkUvfxUKArUr6n9?=
 =?us-ascii?Q?aNbh0MruCwt8cXttYkIOToX+3CdDokVbf/Oj4waCoHfVHwaAICcRQ0mnGczn?=
 =?us-ascii?Q?9Ht9tTYWzFwddqeC4GlhRMlHl4XQ9+eUP9wUHpMprvBves74zjXN1dhsO4Ks?=
 =?us-ascii?Q?3UjQoEmHKvDrxt7YPmR0otd4u8+sezCNWCVvl5GRXu1onWtW3oT613fjC53d?=
 =?us-ascii?Q?P7sqTQzokpVqS8SZ7otU77ZM6CbXNxzfZpEYLhocQwu6NNUV087sYNz4fiLz?=
 =?us-ascii?Q?zGOvHEFDyI1pu8/4a1M3TXVMwEqmeeMLnfUrFLcLTR/Mgzu7jI/Kk013VjbC?=
 =?us-ascii?Q?ZX7J7boWKa8A4e+qLimM4IJoTgUe03baWxOzkljM4iB1Als2+FhJlZUaMwde?=
 =?us-ascii?Q?aWf4iCCsoyz+kutgtf5VeqVYf3i3bS6hzhxrHQb5evfRqLNDcXwOOU7r0JKw?=
 =?us-ascii?Q?LtuDOCUU7uIoHGQTyq1dDTJU7GskM+Hl/Px2FGr81LA6GdXb9Z3YuiS49Y1A?=
 =?us-ascii?Q?edXDtBqmcoXdsNhQxVxDJrShG+voZb22vizEoGnBXg40ntrBEPsVwZF8UFLf?=
 =?us-ascii?Q?M+yhTOttlSmGKqTwqrpeOjxThzDGpjIaiFQqABGkjNrb1Ur8V3cLoAiGiape?=
 =?us-ascii?Q?ivel4M5uUQ+iYo63nv7Pc4eZvVemF6dxyzhqg2JezhUrsyfXSNO95mXOMsjj?=
 =?us-ascii?Q?PepjKrAu2Fa7OsT9mBYjDdgtMCUo4YUErhf8qN5EtUxs17PxhFWDo2oSYtNU?=
 =?us-ascii?Q?56Ro3RFdZn21zWO/njI3NSwkvoY4tyTDkTR06lSa4SCf/IMNmnKhXIBYt03S?=
 =?us-ascii?Q?bVA9VlEgRPncqvcSYbo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:17:15.2177 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6358cf49-f40c-4b71-7c2f-08de28e724c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6548
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

Entities' gart windows are contiguous so when copying a buffer
and src doesn't need a gart window, its window can be used to
extend dst one (and vice versa).

This doubles the gart window size and reduces the number of jobs
required.

---
v2: pass adev instead of ring to amdgpu_ttm_needs_gart_window
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 78 ++++++++++++++++++-------
 1 file changed, 58 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 164b49d768d8..489880b2fb8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -177,6 +177,21 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
 	return amdgpu_job_submit(job);
 }
 
+static bool amdgpu_ttm_needs_gart_window(struct amdgpu_device *adev,
+					 struct ttm_resource *mem,
+					 struct amdgpu_res_cursor *mm_cur,
+					 bool tmz,
+					 uint64_t *addr)
+{
+	/* Map only what can't be accessed directly */
+	if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
+		*addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
+			mm_cur->start;
+		return false;
+	}
+	return true;
+}
+
 /**
  * amdgpu_ttm_map_buffer - Map memory into the GART windows
  * @adev: the device being used
@@ -185,6 +200,7 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
  * @mem: memory object to map
  * @mm_cur: range to map
  * @window: which GART window to use
+ * @use_two_windows: if true, use a double window
  * @tmz: if we should setup a TMZ enabled mapping
  * @size: in number of bytes to map, out number of bytes mapped
  * @addr: resulting address inside the MC address space
@@ -198,6 +214,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 				 struct ttm_resource *mem,
 				 struct amdgpu_res_cursor *mm_cur,
 				 unsigned int window,
+				 bool use_two_windows,
 				 bool tmz, uint64_t *size, uint64_t *addr)
 {
 	unsigned int offset, num_pages, num_dw, num_bytes;
@@ -213,13 +230,8 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 	if (WARN_ON(mem->mem_type == AMDGPU_PL_PREEMPT))
 		return -EINVAL;
 
-	/* Map only what can't be accessed directly */
-	if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
-		*addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
-			mm_cur->start;
+	if (!amdgpu_ttm_needs_gart_window(adev, mem, mm_cur, tmz, addr))
 		return 0;
-	}
-
 
 	/*
 	 * If start begins at an offset inside the page, then adjust the size
@@ -228,7 +240,8 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 	offset = mm_cur->start & ~PAGE_MASK;
 
 	num_pages = PFN_UP(*size + offset);
-	num_pages = min_t(uint32_t, num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE);
+	num_pages = min_t(uint32_t,
+		num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE * (use_two_windows ? 2 : 1));
 
 	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
 
@@ -300,7 +313,9 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 				      struct dma_resv *resv,
 				      struct dma_fence **f)
 {
+	bool src_needs_gart_window, dst_needs_gart_window, use_two_gart_windows;
 	struct amdgpu_res_cursor src_mm, dst_mm;
+	int src_gart_window, dst_gart_window;
 	struct dma_fence *fence = NULL;
 	int r = 0;
 	uint32_t copy_flags = 0;
@@ -324,18 +339,40 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		/* Never copy more than 256MiB at once to avoid a timeout */
 		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
 
-		/* Map src to window 0 and dst to window 1. */
-		r = amdgpu_ttm_map_buffer(adev, entity,
-					  src->bo, src->mem, &src_mm,
-					  0, tmz, &cur_size, &from);
-		if (r)
-			goto error;
+		/* If only one direction needs a gart window to access memory, use both
+		 * windows for it.
+		 */
+		src_needs_gart_window =
+			amdgpu_ttm_needs_gart_window(adev, src->mem, &src_mm, tmz, &from);
+		dst_needs_gart_window =
+			amdgpu_ttm_needs_gart_window(adev, dst->mem, &dst_mm, tmz, &to);
 
-		r = amdgpu_ttm_map_buffer(adev, entity,
-					  dst->bo, dst->mem, &dst_mm,
-					  1, tmz, &cur_size, &to);
-		if (r)
-			goto error;
+		if (src_needs_gart_window) {
+			src_gart_window = 0;
+			use_two_gart_windows = !dst_needs_gart_window;
+		}
+		if (dst_needs_gart_window) {
+			dst_gart_window = src_needs_gart_window ? 1 : 0;
+			use_two_gart_windows = !src_needs_gart_window;
+		}
+
+		if (src_needs_gart_window) {
+			r = amdgpu_ttm_map_buffer(adev, entity,
+						  src->bo, src->mem, &src_mm,
+						  src_gart_window, use_two_gart_windows,
+						  tmz, &cur_size, &from);
+			if (r)
+				goto error;
+		}
+
+		if (dst_needs_gart_window) {
+			r = amdgpu_ttm_map_buffer(adev, entity,
+						  dst->bo, dst->mem, &dst_mm,
+						  dst_gart_window, use_two_gart_windows,
+						  tmz, &cur_size, &to);
+			if (r)
+				goto error;
+		}
 
 		abo_src = ttm_to_amdgpu_bo(src->bo);
 		abo_dst = ttm_to_amdgpu_bo(dst->bo);
@@ -2434,7 +2471,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
 
 		r = amdgpu_ttm_map_buffer(adev, entity,
 					  &bo->tbo, bo->tbo.resource, &cursor,
-					  1, false, &size, &addr);
+					  1, false, false, &size, &addr);
 		if (r)
 			goto err;
 
@@ -2485,7 +2522,8 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
 
 		r = amdgpu_ttm_map_buffer(adev, entity,
 					  &bo->tbo, bo->tbo.resource, &dst,
-					  1, false, &cur_size, &to);
+					  1, false, false,
+					  &cur_size, &to);
 		if (r)
 			goto error;
 
-- 
2.43.0

