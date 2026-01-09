Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FB2D0A389
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 14:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2347510E2C8;
	Fri,  9 Jan 2026 13:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eCXncuYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB4610E2C8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767964098;
 bh=gw3ynU1c5E/XYrTMa2G4JEbtK+116Zk/yQUXThO/tH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eCXncuYSvsHqi0d4tlTewsGzAvg8DKH/tCa6obvPvB2l2g3TtaZ0+ZE+uKq6eAK6V
 +CTKWVbG/Zh1UUkz38/mvVZxgYal8+QiayrcMg/RkzdiPbfDS5xTm1Uef8QFmXFtT4
 Hy/nx9O9Lf0PgcYDumaZjc0vRpxYA5IXIjyqQyciz+vx9IOwdl2dwStGUwzrrgdnG3
 ayI/PSglSViB++4pGHRMccdDgo4FH1+lsLHTXhLlMb+J+xZNv4h25bn4t/93HoNUgK
 R8cTxyL8Z3G/mHqJJzQu9v9r+OMODBovkFmfFBwH3ZBJrcYXeGDqs7hBbctLt8jJ+O
 m1BlTuurINseg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E27DC17E13E0;
 Fri,  9 Jan 2026 14:08:17 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Subject: [PATCH v1 7/9] drm/panthor: Split panthor_vm_prepare_map_op_ctx() to
 prepare for reclaim
Date: Fri,  9 Jan 2026 14:07:59 +0100
Message-ID: <20260109130801.1239558-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109130801.1239558-1-boris.brezillon@collabora.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

We're gonna need just the page table reservation logic when we restore
evicted BO mappings, so let's prepare for that by extracting the
op_ctx init and page table pre-allocation into separate helpers.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 70 ++++++++++++++++-----------
 1 file changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index c323b7123713..3290e0b5facb 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1170,6 +1170,45 @@ panthor_vm_op_ctx_prealloc_vmas(struct panthor_vm_op_ctx *op_ctx)
 	return 0;
 }
 
+static void panthor_vm_init_op_ctx(struct panthor_vm_op_ctx *op_ctx,
+				   u64 size, u64 va, u32 flags)
+{
+	memset(op_ctx, 0, sizeof(*op_ctx));
+	op_ctx->flags = flags;
+	op_ctx->va.range = size;
+	op_ctx->va.addr = va;
+}
+
+static int panthor_vm_op_ctx_prealloc_pts(struct panthor_vm_op_ctx *op_ctx)
+{
+	u64 size = op_ctx->va.range;
+	u64 va = op_ctx->va.addr;
+	int ret;
+
+	/* L1, L2 and L3 page tables.
+	 * We could optimize L3 allocation by iterating over the sgt and merging
+	 * 2M contiguous blocks, but it's simpler to over-provision and return
+	 * the pages if they're not used.
+	 */
+	u64 pt_count = ((ALIGN(va + size, 1ull << 39) - ALIGN_DOWN(va, 1ull << 39)) >> 39) +
+		       ((ALIGN(va + size, 1ull << 30) - ALIGN_DOWN(va, 1ull << 30)) >> 30) +
+		       ((ALIGN(va + size, 1ull << 21) - ALIGN_DOWN(va, 1ull << 21)) >> 21);
+
+	op_ctx->rsvd_page_tables.pages = kcalloc(pt_count,
+						 sizeof(*op_ctx->rsvd_page_tables.pages),
+						 GFP_KERNEL);
+	if (!op_ctx->rsvd_page_tables.pages)
+		return -ENOMEM;
+
+	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
+				    op_ctx->rsvd_page_tables.pages);
+	op_ctx->rsvd_page_tables.count = ret;
+	if (ret != pt_count)
+		return -ENOMEM;
+
+	return 0;
+}
+
 #define PANTHOR_VM_BIND_OP_MAP_FLAGS \
 	(DRM_PANTHOR_VM_BIND_OP_MAP_READONLY | \
 	 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC | \
@@ -1185,7 +1224,6 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 {
 	struct drm_gpuvm_bo *preallocated_vm_bo;
 	struct sg_table *sgt = NULL;
-	u64 pt_count;
 	int ret;
 
 	if (!bo)
@@ -1204,10 +1242,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	    bo->exclusive_vm_root_gem != panthor_vm_root_gem(vm))
 		return -EINVAL;
 
-	memset(op_ctx, 0, sizeof(*op_ctx));
-	op_ctx->flags = flags;
-	op_ctx->va.range = size;
-	op_ctx->va.addr = va;
+	panthor_vm_init_op_ctx(op_ctx, size, va, flags);
 
 	ret = panthor_vm_op_ctx_prealloc_vmas(op_ctx);
 	if (ret)
@@ -1250,30 +1285,9 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 
 	op_ctx->map.bo_offset = offset;
 
-	/* L1, L2 and L3 page tables.
-	 * We could optimize L3 allocation by iterating over the sgt and merging
-	 * 2M contiguous blocks, but it's simpler to over-provision and return
-	 * the pages if they're not used.
-	 */
-	pt_count = ((ALIGN(va + size, 1ull << 39) - ALIGN_DOWN(va, 1ull << 39)) >> 39) +
-		   ((ALIGN(va + size, 1ull << 30) - ALIGN_DOWN(va, 1ull << 30)) >> 30) +
-		   ((ALIGN(va + size, 1ull << 21) - ALIGN_DOWN(va, 1ull << 21)) >> 21);
-
-	op_ctx->rsvd_page_tables.pages = kcalloc(pt_count,
-						 sizeof(*op_ctx->rsvd_page_tables.pages),
-						 GFP_KERNEL);
-	if (!op_ctx->rsvd_page_tables.pages) {
-		ret = -ENOMEM;
+	ret = panthor_vm_op_ctx_prealloc_pts(op_ctx);
+	if (ret)
 		goto err_cleanup;
-	}
-
-	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
-				    op_ctx->rsvd_page_tables.pages);
-	op_ctx->rsvd_page_tables.count = ret;
-	if (ret != pt_count) {
-		ret = -ENOMEM;
-		goto err_cleanup;
-	}
 
 	/* Insert BO into the extobj list last, when we know nothing can fail. */
 	dma_resv_lock(panthor_vm_resv(vm), NULL);
-- 
2.52.0

