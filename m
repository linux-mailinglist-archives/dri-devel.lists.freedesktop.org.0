Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5635EC9AF8E
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A43B10E5E6;
	Tue,  2 Dec 2025 09:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i6Gy2V1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010067.outbound.protection.outlook.com
 [52.101.193.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8380010E5E5;
 Tue,  2 Dec 2025 09:51:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMH6WLy9ggrGAI4oSn352eTkGuXglBX53pTcNosnKom3ouAYT/3TLhpmG2I2jS6a+OUWYKM5aD7LeOmcFoxePDEa3djYq8GI8o8ArCwF/1pPjYWHfENV853EbSOL6tKIVBi2xRFfkUOqLE1RBt+Jr+t/L/rxnpU3dlYIBndz12kTg+X20v0vZARsKwr6Giv42RZiLmgREsUQ6rsJUwzKvw+k5s/l0lIkzh78hj7AgjxFAherFahmF1fGbvWP7F7Suxze2Fq0IgA87f6JFmRJOUcF/ySYaej0PjKO70mW6PuJGE1WwI+a2yMYEAnmqHawOGxm14xYhRIRxswpXUlg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPblxba6C5RVNSRPSgyWpz5AarTGWEwGB6c/QMEQ3Gg=;
 b=HZfGrKnMHxyvFpojeEhkhNGWmH0dico9CrLm0fAGzoqzbCJbK/PV+Iwoy+n/3nrAP1HLT1zEo6/XTfB5SrFyecXjSfHlfwnKoQ0UU4r3hhQhtdYAj42nQlzpGyfrXAjPJxRMPLLDZUX0B/HtqNrj9HKeUtjlR/cZf186LzKchWEO3dNE8Rf3FC9hPNCsdWjzA72Mb+K6Huk8Q4qcyvS6afcIiBE+3xXE3EPK26Qq2oFnussEwkjYV6bb+7r/2o1nhLeS8vnMPeimq0T7jf7VT1RMHK/UVuig3mK6ARJyWZ/5r8tn0CGYXPyeVU0repGCZxLM9nut5k3fkNaO7xS0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPblxba6C5RVNSRPSgyWpz5AarTGWEwGB6c/QMEQ3Gg=;
 b=i6Gy2V1R1Bm6imMWWYHvJ8NMnceUgCg+4dha7jqr8+Zdy8OQHU6zUNLGq/Qh1HTx7tVjiIRwdKr5g2cXp8cWqxKxELLJYy6kw8H9DGY9xhWPKmfzjHM5DhXulWZ+OARqEdNLImREOxqcL64+2k8Ubj8EuZxI2s/ksxmCeBRrFMQ=
Received: from MW4PR03CA0271.namprd03.prod.outlook.com (2603:10b6:303:b5::6)
 by DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:51:47 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:303:b5:cafe::e2) by MW4PR03CA0271.outlook.office365.com
 (2603:10b6:303:b5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 09:51:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:51:47 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:51:38 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 11/13] drm/amdgpu: use larger gart window when possible
Date: Tue, 2 Dec 2025 10:47:21 +0100
Message-ID: <20251202094738.15614-12-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: cda23e47-7b18-4e0f-828d-08de31886893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ixO/hV1wPejj+G8IY/Lug6YYEoaE8MVpx8QZ+nGp5gwgXoVuysOUWUNZqqUV?=
 =?us-ascii?Q?kREvg/8E1lNvX0I4liDu0wn04aiSpcIzBB6EaMtCuNjEwiqyZQBfp2cPkHV1?=
 =?us-ascii?Q?1lkudQJxn74dDDpMj9cmjDZR1G84exbIgptlsWEh7MNDf6jlpSsPPUoopVvx?=
 =?us-ascii?Q?60wYUrfBmOm+2ZmcbgrsOY6rSWuT3g+iZIjifTBoBmYnCCusfd/efYVJv+1Q?=
 =?us-ascii?Q?1rWtdPrjEjFfWsQ77wSoBWslmhsQWI9PbE/JfK104EsQ61qIi8tvtrpAVkVH?=
 =?us-ascii?Q?33qi/JYgNgOI3qtTBGv9DbpPmskjYVuZQzwKXZ//np0Ry/IAHPPqnSkmUoZZ?=
 =?us-ascii?Q?OuLRLmfT966I1VwdJbyx4eQwkZJwynrjR4PcjekvHXrr4gjp9Yitt68zGEWm?=
 =?us-ascii?Q?YsPfQKLmhlO1ukoF5OEHxt4bSaBmlBj650nAZrGgQWbe3nWOjUs74imV2pTj?=
 =?us-ascii?Q?LZv8DqDTOkM6ZOzuUsRsJ1/10gO79fW/zVUBynvri75Gmxf90MnS4Ve2/zOV?=
 =?us-ascii?Q?fHg22y6y3EwFr4z8Ki49h0yoXetRkr7g1wjAUCZMxGiNsbX93j1D4RkdKp1x?=
 =?us-ascii?Q?+GIjIIOXebQ8QBqbCECflMD6GO4N+rQEu0VO8m/XJvMBCE0X5n9HhP7rsVBR?=
 =?us-ascii?Q?r2S1SDkrT+kLyidR/is3ku7r/Zk9ni/LZjl+rTvpDELIiMj2ta3ZLTUuwkzw?=
 =?us-ascii?Q?r8zqxaBaIr45iLemQicN7+y7vAtWLAO8WN68h6AmgtvJxkrI30rIAYr/Lr89?=
 =?us-ascii?Q?qZplrSeqYb4fV+syUzPxFMrLKwGrIPVA39rw7vtzHrIGHsuoQMT17J4oHIVZ?=
 =?us-ascii?Q?3gb3iHp3X5SrfGFDKnCIvGIdgGDe7XA9duDEmyRhRNn+7wx5pLwPUBjn1hj1?=
 =?us-ascii?Q?1KupB2aDoFl59tTluAlT6rYFj7CmDrlpQ3zUSDQsK+n5zxRJZjUREnx6uD+u?=
 =?us-ascii?Q?oEyiDGTHOBdwVQHdVD8pfV9O0h8gKj+YhJWcFiL74Rx5TH/b64wHxIytMzcA?=
 =?us-ascii?Q?7jNTzUSvX45/sN/m/jqRQ4rAk0W7Ug87hDPaEThdB0J/4jSz1AlWx/vQzP7E?=
 =?us-ascii?Q?8aFnjZ141t1zt41aTUiMZtUNL9c0hG1enebr0xatP0PnY/6P+SmMwAYXvyeQ?=
 =?us-ascii?Q?GopswWrebxYvvc4Hx8nCxGvasjQ4zsOy8h2A4Oc+DN8CeYwve9v+ILo4c24s?=
 =?us-ascii?Q?ZWk/xXl6YQS9hAV1mRQZT/h3mDvUhaVvvvR5G8bXTW4ZnH6+yG96s8K2Ykkm?=
 =?us-ascii?Q?Re823e04dnEKIb4IviBSHjbBgVBoTkbUhSYfb3niuFTWqO1hApbze/ulZZww?=
 =?us-ascii?Q?mNVygtC6WjWEbd3nuUQ3miEvAsma85/fJHmowuz2R2YL+NQ9g8ZvpixVgMAR?=
 =?us-ascii?Q?MZ/lA5xAL3K2sxE01x9mJYyvGwn40tzEDirHNDBqUE4qlNillMobdEy8x/68?=
 =?us-ascii?Q?+UsrD+qgF2AhzPcatzUNLGheTknM0ZWGFaCAhGhv6tsn4x8BuqqcyvXTjxVO?=
 =?us-ascii?Q?d3oEJ46znjtclakWDvbZZz18Msvl3UmJ9lfoSyQi8iwuc6ayl9F8ahSkHrKB?=
 =?us-ascii?Q?p0i766WLvuwbXGnefUQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:51:47.1663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cda23e47-7b18-4e0f-828d-08de31886893
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861
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
v4:
- merge if conditions
- always call amdgpu_ttm_needs_gart_window before calling
  amdgpu_ttm_map_buffer
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 83 +++++++++++++++++--------
 1 file changed, 57 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6da1ce03ce15..ad53789d0e2b 100644
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
  * @entity: entity to run the window setup job
@@ -184,18 +199,22 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
  * @mem: memory object to map
  * @mm_cur: range to map
  * @window: which GART window to use
+ * @use_two_windows: if true, use a double window
  * @tmz: if we should setup a TMZ enabled mapping
  * @size: in number of bytes to map, out number of bytes mapped
  * @addr: resulting address inside the MC address space
  *
  * Setup one of the GART windows to access a specific piece of memory or return
  * the physical address for local memory.
+ * amdgpu_ttm_needs_gart_window() should be used to check if calling this
+ * function is required.
  */
 static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 				 struct ttm_buffer_object *bo,
 				 struct ttm_resource *mem,
 				 struct amdgpu_res_cursor *mm_cur,
 				 unsigned int window,
+				 bool use_two_windows,
 				 bool tmz, uint64_t *size, uint64_t *addr)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
@@ -212,14 +231,6 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	if (WARN_ON(mem->mem_type == AMDGPU_PL_PREEMPT))
 		return -EINVAL;
 
-	/* Map only what can't be accessed directly */
-	if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
-		*addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
-			mm_cur->start;
-		return 0;
-	}
-
-
 	/*
 	 * If start begins at an offset inside the page, then adjust the size
 	 * and addr accordingly
@@ -227,7 +238,8 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	offset = mm_cur->start & ~PAGE_MASK;
 
 	num_pages = PFN_UP(*size + offset);
-	num_pages = min_t(uint32_t, num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE);
+	num_pages = min_t(uint32_t,
+		num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE * (use_two_windows ? 2 : 1));
 
 	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
 
@@ -299,6 +311,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 				      struct dma_resv *resv,
 				      struct dma_fence **f)
 {
+	bool src_needs_gart_window, dst_needs_gart_window;
 	struct amdgpu_res_cursor src_mm, dst_mm;
 	struct dma_fence *fence = NULL;
 	int r = 0;
@@ -323,16 +336,29 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		/* Never copy more than 256MiB at once to avoid a timeout */
 		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
 
-		/* Map src to window 0 and dst to window 1. */
-		r = amdgpu_ttm_map_buffer(entity, src->bo, src->mem, &src_mm,
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
 
-		r = amdgpu_ttm_map_buffer(entity, dst->bo, dst->mem, &dst_mm,
-					  1, tmz, &cur_size, &to);
-		if (r)
-			goto error;
+		if (src_needs_gart_window) {
+			r = amdgpu_ttm_map_buffer(entity, src->bo, src->mem, &src_mm,
+						  0, !dst_needs_gart_window,
+						  tmz, &cur_size, &from);
+			if (r)
+				goto error;
+		}
+		if (dst_needs_gart_window) {
+			r = amdgpu_ttm_map_buffer(entity, dst->bo, dst->mem, &dst_mm,
+						  src_needs_gart_window ? 1 : 0,
+						  !src_needs_gart_window,
+						  tmz, &cur_size, &to);
+			if (r)
+				goto error;
+		}
 
 		abo_src = ttm_to_amdgpu_bo(src->bo);
 		abo_dst = ttm_to_amdgpu_bo(dst->bo);
@@ -2426,10 +2452,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
-					  1, false, &size, &addr);
-		if (r)
-			goto err;
+		if (amdgpu_ttm_needs_gart_window(adev, bo->tbo.resource, &cursor, false, &addr)) {
+			r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
+						  1, false, false, &size, &addr);
+			if (r)
+				goto err;
+		}
 
 		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
 					&next, true,
@@ -2476,10 +2504,13 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &dst,
-					  1, false, &cur_size, &to);
-		if (r)
-			goto error;
+		if (amdgpu_ttm_needs_gart_window(adev, bo->tbo.resource, &dst, false, &to)) {
+			r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &dst,
+						  1, false, false,
+						  &cur_size, &to);
+			if (r)
+				goto error;
+		}
 
 		r = amdgpu_ttm_fill_mem(adev, entity,
 					src_data, to, cur_size, resv,
-- 
2.43.0

