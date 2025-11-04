Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDF3C2FFB5
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17ED510E594;
	Tue,  4 Nov 2025 08:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dxp7ST6Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012046.outbound.protection.outlook.com
 [40.93.195.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7778710E591;
 Tue,  4 Nov 2025 08:37:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQ27usIpIsoVJGTdc6zRG7KrQVoKTIs7q89gw+v4qBN0PtcxIC+APakbBlvHISLKWZofYTXx5d1LGXZjHAZYwA+cWuS2bfZoX438PvaKz9skG9yS+FZSrqdHfq2HekQoOdVhpI/11Wpm4uAMQYNJ2tkexpPdE38muqTEOLEpaEC1OOzkGlN757FfKSQ2azddpduxO812V43W4ZSh63y3cBpiM1XVcg2Iw9e/ida4T5L39+Rb6BTsZ24wQOi0918q9EmHqPkDm3FjBqdlbhVtdbh4gWE0BJz6t57vbRxWcRI9Hpzqa8GA9dVl2MEeJsoVSM6goyDhd1ogtAVh9RVDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riADo9F10hTN6uVDTKAdEYAPTwlZvJDRTpmFvR+Tna8=;
 b=nar7+DVQSSg1q4Xtlc+w/SrZy5AxYUEFDsH+FDw4tdIrgWiV2Y4m8UiKuGEM6+uBrPGlZVvQxgg7hNGZe96RHqnNujOxqYu0nhvWupC9TesIYrqjlOnBfPltY6U9Ru7PJ/3fe39vHPp90t6zVbYTgACOgP6Us/RVJrBEX79Cpm8nr/jBYf1aH2PeRxxR104TYf2ra+VEgKO6ytHfZGdAI2uBTBhK6s6Ltxjuzn6iuc0pge+eq112JQczbLbEjH2BhhQ/zOcTkHgrbBGnzOkLnb3nehOM1mEIo36uoKKRFWHEQXGVZkcVhMf6zdjUcJIUfws9f6L8Hqu84N3yCFyeYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riADo9F10hTN6uVDTKAdEYAPTwlZvJDRTpmFvR+Tna8=;
 b=dxp7ST6QKZ3rUuXQD3y5hzdmW9Xl1XBx2295mLDv/TexsdkCvBVyfOwLKTT3jmAdwpCN9cwUFHU/aHfrr5CB+PuKJtDWBFyN2iccx+rEeQtF7ySsmBKGebPCg+ZGDYFRvUl/+WjHPiEK0WaRFLEDxktBmXIpDNfBiFExEePzJ80=
Received: from BYAPR11CA0088.namprd11.prod.outlook.com (2603:10b6:a03:f4::29)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 08:37:15 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a03:f4:cafe::23) by BYAPR11CA0088.outlook.office365.com
 (2603:10b6:a03:f4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:37:14 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:37:12 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 19/20] drm/amdgpu: use larger gart window when possible
Date: Tue, 4 Nov 2025 09:35:34 +0100
Message-ID: <20251104083605.13677-20-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|MN0PR12MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: a6095020-f2f9-48e1-d1d2-08de1b7d5b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gtQpJG3DWydfW9yggldyhADBXqxY4vxB2SSug8Wb8N443Z79h+WVIfhGZ2fN?=
 =?us-ascii?Q?+TtYD2+/5vy1eXm3sFWV6kha5iIRaQYlUBcNjNiBgmOOJzU9pMH906mxdslc?=
 =?us-ascii?Q?NHExipLw4ZgpSlLCNazFVYQFF7r8Kv2+2B1TC3ZjnIhHiM/UhB6fwyW55JdY?=
 =?us-ascii?Q?Rdk1gmveJwnuuopHW5vpERjGV44845ilSUO7sIZudlRZY9yekolJj2FdH6wA?=
 =?us-ascii?Q?CkG4F9R+x5gFREuNju7tD+T6BZBfzyw6A19g69q2k7JnDjlhHYZoCYdhTloi?=
 =?us-ascii?Q?kesjvQOdBaZkh8lTVkY8UH/z08t6yqdAZhaMT/CQRYnlHer+Cl7daQGzxhpO?=
 =?us-ascii?Q?0alu3jH8hSOo1eK+ndL2Lon+J/4pMsbdE4P5DNJ+fWNMVVjd75l9V7PV9emv?=
 =?us-ascii?Q?Ls6iArbu0VYxLuY2TI2tC0at9mNxD1RRchNmC/oaALQ6gKlNUBbDXnblP0QE?=
 =?us-ascii?Q?0aFEiCa8s+bc6FkWZEeUa/9vNqHZe5kzBRiV554wi8wKFGvxzvQwzNwDBHrc?=
 =?us-ascii?Q?XEhoc2Da7WPfdK5GLXUcx0dc2g7dluKHKvxFOicoQ3BME7XO8PyZlMc7l5iY?=
 =?us-ascii?Q?+/SalQ2kylEZTUxFdakHb1Ds2iUZ3fp+oUBU8/e0TwzSu7LNF0u3gQIEdtrj?=
 =?us-ascii?Q?JCcUVTmissQcHiX4SXWKTyLLCknJ5Z1j5db/SpT6qBwPcsyg+M54iLWvGaMv?=
 =?us-ascii?Q?08k/nrqPVkpolZqV6QrlhAGxpVklkfmaMOc0cWPJ8i1jZvrvzpvquBzcvWNa?=
 =?us-ascii?Q?mwf/tQ88xjTsu0sLKaGOYwIWZnr/PNoLSk4G+Lz4hE+9GwQcEFvqZzgYqGM4?=
 =?us-ascii?Q?6R906g/+3GnLEZNkQIbgyTvTRc6AoaQMYhDVFbwzCPgsCxwdZEhK18KxPQJ2?=
 =?us-ascii?Q?SriklZ08z1jc1KRT2P3V8Mi+CUNWVOsZvsQB+1INmST13jpr43OfaVXzzzIz?=
 =?us-ascii?Q?meVRbcH6zbmXV7CPRPbvQJwf+8o7pwfjh3NK66MmISWzVqBwqjYxCmpToe5O?=
 =?us-ascii?Q?iggxB99l1R2Xrhzxrj98GmA+U9IwwT6nS+C/zRM1adpmzla6T/OZVOe9mlWZ?=
 =?us-ascii?Q?ArKIMDIN+4ENfSljWqV/Ja+2sUVgd8MtReD8vSI2sASh5RSQv+GxocLJZy2y?=
 =?us-ascii?Q?cVRRpaQ1msaSKkhPeVaRLQpYQgwY+la0ufyL+ht4hOOCz60s0oBRVJDIBw/u?=
 =?us-ascii?Q?88hUswIfM5RCEOFv5qOFeCu8p2n++fNj08991H7c1flIBXQasn9PBwHOAwyt?=
 =?us-ascii?Q?B4PgHkF1Pz3oW26WnvsfVcyQx5TKgqQO7WVivJrhtk7uWSP3WwB/vViyj7fD?=
 =?us-ascii?Q?AavP/Ltq/TauC46rCyc5x2cZ9rJ8DZL9LD7Jq1rxy8vp8cPcavuZUreowGUj?=
 =?us-ascii?Q?KpvO72e+ZMlEZn0NjI9iYLBpB4A+yn6qHuVOG6qHKEWlvles6TtY+kYnoyEM?=
 =?us-ascii?Q?M8EEI+dez5I0Wa9enjMJh5QFv8FNNaxtGNSATez4hGKP1o8FAuUhxOQqXDed?=
 =?us-ascii?Q?ib+QnJ1dHtFsfkMulVceDtztSrwynJqBVGicgCU2OP77ktv3hymDtEYw3N4f?=
 =?us-ascii?Q?KmxK+VtpwYz+uM3WPq0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:37:14.5978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6095020-f2f9-48e1-d1d2-08de1b7d5b26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079
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

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++++++-------
 1 file changed, 63 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ac2857314d68..3bfdce1ef5c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -162,6 +162,23 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	*placement = abo->placement;
 }
 
+static bool amdgpu_ttm_needs_gart_window(struct amdgpu_ring *ring,
+					 struct ttm_resource *mem,
+					 struct amdgpu_res_cursor *mm_cur,
+					 bool tmz,
+					 uint64_t *addr)
+{
+	struct amdgpu_device *adev = ring->adev;
+
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
@@ -169,6 +186,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
  * @mem: memory object to map
  * @mm_cur: range to map
  * @window: which GART window to use
+ * @use_two_windows: if true, use a double window
  * @ring: DMA ring to use for the copy
  * @tmz: if we should setup a TMZ enabled mapping
  * @size: in number of bytes to map, out number of bytes mapped
@@ -182,7 +200,9 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
 				 struct ttm_buffer_object *bo,
 				 struct ttm_resource *mem,
 				 struct amdgpu_res_cursor *mm_cur,
-				 unsigned int window, struct amdgpu_ring *ring,
+				 unsigned int window,
+				 bool use_two_windows,
+				 struct amdgpu_ring *ring,
 				 bool tmz, uint64_t *size, uint64_t *addr,
 				 struct dma_fence *dep,
 				 struct dma_resv *resv)
@@ -202,13 +222,8 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
 	if (WARN_ON(mem->mem_type == AMDGPU_PL_PREEMPT))
 		return -EINVAL;
 
-	/* Map only what can't be accessed directly */
-	if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
-		*addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
-			mm_cur->start;
+	if (!amdgpu_ttm_needs_gart_window(ring, mem, mm_cur, tmz, addr))
 		return 0;
-	}
-
 
 	/*
 	 * If start begins at an offset inside the page, then adjust the size
@@ -217,7 +232,8 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
 	offset = mm_cur->start & ~PAGE_MASK;
 
 	num_pages = PFN_UP(*size + offset);
-	num_pages = min_t(uint32_t, num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE);
+	num_pages = min_t(uint32_t,
+		num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE * (use_two_windows ? 2 : 1));
 
 	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
 
@@ -308,8 +324,10 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 				      struct dma_resv *resv,
 				      struct dma_fence **f)
 {
+	bool src_needs_gart_window, dst_needs_gart_window, use_two_gart_windows;
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_rings[0];
 	struct amdgpu_res_cursor src_mm, dst_mm;
+	int src_gart_window, dst_gart_window;
 	struct dma_fence *fence = NULL;
 	int r = 0;
 	uint32_t copy_flags = 0;
@@ -333,20 +351,43 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		/* Never copy more than 256MiB at once to avoid a timeout */
 		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
 
-		/* Map src to window 0 and dst to window 1. */
-		r = amdgpu_ttm_map_buffer(&entity->base,
-					  src->bo, src->mem, &src_mm,
-					  entity->gart_window_id0, ring, tmz, &cur_size, &from,
-					  NULL, NULL);
-		if (r)
-			goto error;
+		/* If only one direction needs a gart window to access memory, use both
+		 * windows for it.
+		 */
+		src_needs_gart_window =
+			amdgpu_ttm_needs_gart_window(ring, src->mem, &src_mm, tmz, &from);
+		dst_needs_gart_window =
+			amdgpu_ttm_needs_gart_window(ring, dst->mem, &dst_mm, tmz, &to);
 
-		r = amdgpu_ttm_map_buffer(&entity->base,
-					  dst->bo, dst->mem, &dst_mm,
-					  entity->gart_window_id1, ring, tmz, &cur_size, &to,
-					  NULL, NULL);
-		if (r)
-			goto error;
+		if (src_needs_gart_window) {
+			src_gart_window = entity->gart_window_id0;
+			use_two_gart_windows = !dst_needs_gart_window;
+		}
+		if (dst_needs_gart_window) {
+			dst_gart_window = src_needs_gart_window ?
+				entity->gart_window_id1 : entity->gart_window_id0;
+			use_two_gart_windows = !src_needs_gart_window;
+		}
+
+		if (src_needs_gart_window) {
+			r = amdgpu_ttm_map_buffer(&entity->base,
+						  src->bo, src->mem, &src_mm,
+						  src_gart_window, use_two_gart_windows,
+						  ring, tmz, &cur_size, &from,
+						  NULL, NULL);
+			if (r)
+				goto error;
+		}
+
+		if (dst_needs_gart_window) {
+			r = amdgpu_ttm_map_buffer(&entity->base,
+						  dst->bo, dst->mem, &dst_mm,
+						  dst_gart_window, use_two_gart_windows,
+						  ring, tmz, &cur_size, &to,
+						  NULL, NULL);
+			if (r)
+				goto error;
+		}
 
 		abo_src = ttm_to_amdgpu_bo(src->bo);
 		abo_dst = ttm_to_amdgpu_bo(dst->bo);
@@ -2506,7 +2547,7 @@ int amdgpu_clear_buffer(struct amdgpu_ttm_entity *entity,
 
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  &bo->tbo, bo->tbo.resource, &dst,
-					  entity->gart_window_id1, ring, false,
+					  entity->gart_window_id1, false, ring, false,
 					  &cur_size, &to,
 					  dependency,
 					  resv);
-- 
2.43.0

