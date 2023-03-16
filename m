Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA56BCE63
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168F910ECAE;
	Thu, 16 Mar 2023 11:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D747510ECAE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 602AB61FBC;
 Thu, 16 Mar 2023 11:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54302C433D2;
 Thu, 16 Mar 2023 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678966615;
 bh=geRMtjFAl7EjrdJwcdx+aKlpK0t1faQNxfjd2ke2sIw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GKkMj390joJhf7U60PhAO914pRrSxStwY/sTXZUDCL+/uJVPI+4b2nZr61itgfUH8
 2DwNP+xQvIdS0Km3F3bIWbTQxFtDxYjBOsA4s9OI9srD7z1Mj3gqU6NEipf3nmf7Fw
 qgPHSMzPEY7caGET7SQukBifJamZjTMRoXTDSpq/Pak4l5R4LfXkWG3wQurqKNll78
 FBpIjGqWZvSW0ELBoYd7CFoDtXNiJoktrJOKZdk1zj5NIqbB3/j5WGMQdhCz0srjTV
 IugGeSnl2jlo1Urn4pX/iFXXd97AMhF3nca/x7zXQojrqOdxba9hUXNE4xd1ew/Zcj
 k/o29bylVTt6w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/10] accel/habanalabs: return tlb inv error code upon failure
Date: Thu, 16 Mar 2023 13:36:38 +0200
Message-Id: <20230316113640.499267-8-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230316113640.499267-1-ogabbay@kernel.org>
References: <20230316113640.499267-1-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Now that CQ-completion based jobs do not trigger a reset upon failure,
failure of such jobs (e.g., MMU cache invalidation) should be handled
by the caller itself depending on the error code returned to it.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi/gaudi.c   | 24 +++++++++------
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 37 ++++++++++++++++++------
 2 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index a9d84675b407..08a4b1cf2b42 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -3725,7 +3725,7 @@ static int gaudi_mmu_init(struct hl_device *hdev)
 		if (rc) {
 			dev_err(hdev->dev,
 				"failed to set hop0 addr for asid %d\n", i);
-			goto err;
+			return rc;
 		}
 	}
 
@@ -3736,7 +3736,9 @@ static int gaudi_mmu_init(struct hl_device *hdev)
 	/* mem cache invalidation */
 	WREG32(mmSTLB_MEM_CACHE_INVALIDATION, 1);
 
-	hl_mmu_invalidate_cache(hdev, true, 0);
+	rc = hl_mmu_invalidate_cache(hdev, true, 0);
+	if (rc)
+		return rc;
 
 	WREG32(mmMMU_UP_MMU_ENABLE, 1);
 	WREG32(mmMMU_UP_SPI_MASK, 0xF);
@@ -3752,9 +3754,6 @@ static int gaudi_mmu_init(struct hl_device *hdev)
 	gaudi->hw_cap_initialized |= HW_CAP_MMU;
 
 	return 0;
-
-err:
-	return rc;
 }
 
 static int gaudi_load_firmware_to_device(struct hl_device *hdev)
@@ -8420,19 +8419,26 @@ static int gaudi_internal_cb_pool_init(struct hl_device *hdev,
 	}
 
 	mutex_lock(&hdev->mmu_lock);
+
 	rc = hl_mmu_map_contiguous(ctx, hdev->internal_cb_va_base,
 			hdev->internal_cb_pool_dma_addr,
 			HOST_SPACE_INTERNAL_CB_SZ);
-
-	hl_mmu_invalidate_cache(hdev, false, MMU_OP_USERPTR);
-	mutex_unlock(&hdev->mmu_lock);
-
 	if (rc)
 		goto unreserve_internal_cb_pool;
 
+	rc = hl_mmu_invalidate_cache(hdev, false, MMU_OP_USERPTR);
+	if (rc)
+		goto unmap_internal_cb_pool;
+
+	mutex_unlock(&hdev->mmu_lock);
+
 	return 0;
 
+unmap_internal_cb_pool:
+	hl_mmu_unmap_contiguous(ctx, hdev->internal_cb_va_base,
+			HOST_SPACE_INTERNAL_CB_SZ);
 unreserve_internal_cb_pool:
+	mutex_unlock(&hdev->mmu_lock);
 	hl_unreserve_va_block(hdev, ctx, hdev->internal_cb_va_base,
 			HOST_SPACE_INTERNAL_CB_SZ);
 destroy_internal_cb_pool:
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 94d53cd1b0ff..247a6e2c2e91 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10239,16 +10239,23 @@ static int gaudi2_debugfs_read_dma(struct hl_device *hdev, u64 addr, u32 size, v
 
 	/* Create mapping on asic side */
 	mutex_lock(&hdev->mmu_lock);
+
 	rc = hl_mmu_map_contiguous(ctx, reserved_va_base, host_mem_dma_addr, SZ_2M);
-	hl_mmu_invalidate_cache_range(hdev, false,
+	if (rc) {
+		dev_err(hdev->dev, "Failed to create mapping on asic mmu\n");
+		goto unreserve_va;
+	}
+
+	rc = hl_mmu_invalidate_cache_range(hdev, false,
 				      MMU_OP_USERPTR | MMU_OP_SKIP_LOW_CACHE_INV,
 				      ctx->asid, reserved_va_base, SZ_2M);
-	mutex_unlock(&hdev->mmu_lock);
 	if (rc) {
-		dev_err(hdev->dev, "Failed to create mapping on asic mmu\n");
+		hl_mmu_unmap_contiguous(ctx, reserved_va_base, SZ_2M);
 		goto unreserve_va;
 	}
 
+	mutex_unlock(&hdev->mmu_lock);
+
 	/* Enable MMU on KDMA */
 	gaudi2_kdma_set_mmbp_asid(hdev, false, ctx->asid);
 
@@ -10277,11 +10284,16 @@ static int gaudi2_debugfs_read_dma(struct hl_device *hdev, u64 addr, u32 size, v
 	gaudi2_kdma_set_mmbp_asid(hdev, true, HL_KERNEL_ASID_ID);
 
 	mutex_lock(&hdev->mmu_lock);
-	hl_mmu_unmap_contiguous(ctx, reserved_va_base, SZ_2M);
-	hl_mmu_invalidate_cache_range(hdev, false, MMU_OP_USERPTR,
+
+	rc = hl_mmu_unmap_contiguous(ctx, reserved_va_base, SZ_2M);
+	if (rc)
+		goto unreserve_va;
+
+	rc = hl_mmu_invalidate_cache_range(hdev, false, MMU_OP_USERPTR,
 				      ctx->asid, reserved_va_base, SZ_2M);
-	mutex_unlock(&hdev->mmu_lock);
+
 unreserve_va:
+	mutex_unlock(&hdev->mmu_lock);
 	hl_unreserve_va_block(hdev, ctx, reserved_va_base, SZ_2M);
 free_data_buffer:
 	hl_asic_dma_free_coherent(hdev, SZ_2M, host_mem_virtual_addr, host_mem_dma_addr);
@@ -10334,17 +10346,24 @@ static int gaudi2_internal_cb_pool_init(struct hl_device *hdev, struct hl_ctx *c
 	}
 
 	mutex_lock(&hdev->mmu_lock);
+
 	rc = hl_mmu_map_contiguous(ctx, hdev->internal_cb_va_base, hdev->internal_cb_pool_dma_addr,
 					HOST_SPACE_INTERNAL_CB_SZ);
-	hl_mmu_invalidate_cache(hdev, false, MMU_OP_USERPTR);
-	mutex_unlock(&hdev->mmu_lock);
-
 	if (rc)
 		goto unreserve_internal_cb_pool;
 
+	rc = hl_mmu_invalidate_cache(hdev, false, MMU_OP_USERPTR);
+	if (rc)
+		goto unmap_internal_cb_pool;
+
+	mutex_unlock(&hdev->mmu_lock);
+
 	return 0;
 
+unmap_internal_cb_pool:
+	hl_mmu_unmap_contiguous(ctx, hdev->internal_cb_va_base, HOST_SPACE_INTERNAL_CB_SZ);
 unreserve_internal_cb_pool:
+	mutex_unlock(&hdev->mmu_lock);
 	hl_unreserve_va_block(hdev, ctx, hdev->internal_cb_va_base, HOST_SPACE_INTERNAL_CB_SZ);
 destroy_internal_cb_pool:
 	gen_pool_destroy(hdev->internal_cb_pool);
-- 
2.40.0

