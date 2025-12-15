Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B3CBCB90
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 08:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BC810E09C;
	Mon, 15 Dec 2025 07:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnExPRtF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE66210E09C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 07:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765782581; x=1797318581;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e5Nre/C/VwopCszZpklu8XA7OdSVRnExF8evZzQvXME=;
 b=mnExPRtFSwe6mJLmIWERxnx1WmR8PF6Jj0BphcT2geQPAc/6ZaNKb+HH
 tUtmfYeoQF1kdnlNE/2ZfnAGY0UX1rzpkDySYl6kCECmnOq7vv9MHmPRR
 vlYOQ0b2P6smjXH6NTjXGZVeUvnd+60OgzPxN4x024lrBYmJrcq/t7WGt
 OIR+36Eg3ajIMOkk38uqBYBUWNNNjh42CIZPeR4edRDK+axrPcg8kGZEu
 Y4tGnZnVVV5ihmdy4vwOls0la0ja3UtKQdVxrc+BVZJ/IO4OiI1VdX6T8
 wPqLo2ykLKraqKzSv/KDJtpTd0nroyjUc6mpKdyB9RBBIqGXQTk6kznsL A==;
X-CSE-ConnectionGUID: j3q1DUmoQRaVXh4WCNgLCA==
X-CSE-MsgGUID: J77e+S1LRhKmZLNGTSaDJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="55242212"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="55242212"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2025 23:09:40 -0800
X-CSE-ConnectionGUID: Wix7aeFMTwi/rhvwo2B4lQ==
X-CSE-MsgGUID: cJFv2WTTS8yaaEcgIDuUow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="196914935"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2025 23:09:38 -0800
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 andrzej.kacprowski@linux.intel.com,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Validate scatter-gather size against buffer size
Date: Mon, 15 Dec 2025 08:09:33 +0100
Message-ID: <20251215070933.520377-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Validate scatter-gather table size matches buffer object size before
mapping. Break mapping early if the table exceeds buffer size to
prevent overwriting existing mappings. Also validate the table is
not smaller than buffer size to avoid unmapped regions that trigger
MMU translation faults.

Log error and fail mapping operation on size mismatch to prevent
data corruption from mismatched host memory locations and NPU
addresses. Unmap any partially mapped buffer on failure.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c         |  2 +-
 drivers/accel/ivpu/ivpu_mmu_context.c | 20 +++++++++++++++++---
 drivers/accel/ivpu/ivpu_mmu_context.h |  5 +++--
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index ece68f570b7e..98b9ce26962b 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -95,7 +95,7 @@ int __must_check ivpu_bo_bind(struct ivpu_bo *bo)
 
 	if (!bo->mmu_mapped) {
 		drm_WARN_ON(&vdev->drm, !bo->ctx);
-		ret = ivpu_mmu_context_map_sgt(vdev, bo->ctx, bo->vpu_addr, sgt,
+		ret = ivpu_mmu_context_map_sgt(vdev, bo->ctx, bo->vpu_addr, sgt, ivpu_bo_size(bo),
 					       ivpu_bo_is_snooped(bo), ivpu_bo_is_read_only(bo));
 		if (ret) {
 			ivpu_err(vdev, "Failed to map BO in MMU: %d\n", ret);
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 87ad593ef47d..c4014c83e727 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -429,11 +429,12 @@ static void ivpu_mmu_context_unmap_pages(struct ivpu_mmu_context *ctx, u64 vpu_a
 }
 
 int
-ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
-			 u64 vpu_addr, struct sg_table *sgt, bool llc_coherent, bool read_only)
+ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u64 vpu_addr,
+			 struct sg_table *sgt, size_t bo_size, bool llc_coherent, bool read_only)
 {
 	size_t start_vpu_addr = vpu_addr;
 	struct scatterlist *sg;
+	size_t sgt_size = 0;
 	int ret;
 	u64 prot;
 	u64 i;
@@ -462,12 +463,25 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 		ivpu_dbg(vdev, MMU_MAP, "Map ctx: %u dma_addr: 0x%llx vpu_addr: 0x%llx size: %lu\n",
 			 ctx->id, dma_addr, vpu_addr, size);
 
+		if (sgt_size + size > bo_size) {
+			ivpu_err(vdev, "Scatter-gather table size exceeds buffer object size\n");
+			ret = -EINVAL;
+			goto err_unmap_pages;
+		}
+
 		ret = ivpu_mmu_context_map_pages(vdev, ctx, vpu_addr, dma_addr, size, prot);
 		if (ret) {
 			ivpu_err(vdev, "Failed to map context pages\n");
 			goto err_unmap_pages;
 		}
 		vpu_addr += size;
+		sgt_size += size;
+	}
+
+	if (sgt_size < bo_size) {
+		ivpu_err(vdev, "Scatter-gather table size too small to cover buffer object size\n");
+		ret = -EINVAL;
+		goto err_unmap_pages;
 	}
 
 	if (!ctx->is_cd_valid) {
@@ -493,7 +507,7 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 	return 0;
 
 err_unmap_pages:
-	ivpu_mmu_context_unmap_pages(ctx, start_vpu_addr, vpu_addr - start_vpu_addr);
+	ivpu_mmu_context_unmap_pages(ctx, start_vpu_addr, sgt_size);
 	mutex_unlock(&ctx->lock);
 	return ret;
 }
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.h b/drivers/accel/ivpu/ivpu_mmu_context.h
index 663a11a9db11..cc02e7bab04e 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.h
+++ b/drivers/accel/ivpu/ivpu_mmu_context.h
@@ -41,8 +41,9 @@ int ivpu_mmu_context_insert_node(struct ivpu_mmu_context *ctx, const struct ivpu
 				 u64 size, struct drm_mm_node *node);
 void ivpu_mmu_context_remove_node(struct ivpu_mmu_context *ctx, struct drm_mm_node *node);
 
-int ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
-			     u64 vpu_addr, struct sg_table *sgt, bool llc_coherent, bool read_only);
+int
+ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u64 vpu_addr,
+			 struct sg_table *sgt, size_t bo_size, bool llc_coherent, bool read_only);
 void ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 				u64 vpu_addr, struct sg_table *sgt);
 int ivpu_mmu_context_set_pages_ro(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
-- 
2.43.0

