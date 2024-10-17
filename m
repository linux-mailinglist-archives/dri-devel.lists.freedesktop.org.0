Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B7B9A25C1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DB610E853;
	Thu, 17 Oct 2024 14:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjNRThil";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35EB10E853
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177111; x=1760713111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KASbqENI8tyEnLxuF/XzBtIA+KWWRWkk8OU9VBvXJV0=;
 b=YjNRThilWkENlIuoMww1JoOeuw1L6W9FNRXuzhHz3JhjqdXY03mXlhPn
 bfQczDwsVuXvp1UT4TuNH3Y62nVtvWW60pceDmRmbguwqxYD4BhtkcrSJ
 Xcl4dWCoZ6Y8X5W0RH6dlnRsxnXhlpUH6qXIwi3y9QsOsQGXEg0EsY2mG
 2v3P4YTOaKILetHJbcXPnw1EYSeJLcshFtAbuQQOoeENTwz7/+5GuRtoG
 YbbELqISRBWZy8e48e1oJq/pZjqRlyQnPp+3M77di5bmn0GcA1m/zPCCA
 NzsakIlV5YIfKsLYxbsg8XIL+lS3QyArRsovt1yNLeEEVey/L+5faqlxP w==;
X-CSE-ConnectionGUID: HE5f8HH0TtOMyzZEcTZNAg==
X-CSE-MsgGUID: uvJuhSjHRGOP30y/9cca1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790338"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790338"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:30 -0700
X-CSE-ConnectionGUID: ikIXq6e9TMms/Znp77ek2Q==
X-CSE-MsgGUID: lZyu1g9WSV+/FT1ZHWu6UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374522"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:29 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 05/11] accel/ivpu: Unmap partially mapped BOs in case of errors
Date: Thu, 17 Oct 2024 16:58:11 +0200
Message-ID: <20241017145817.121590-6-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Ensure that all buffers that were created only partially through
allocated scatter-gather table are unmapped from MMU600 in case of errors.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu_context.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 8992fe93b679a..697b57071d546 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -432,6 +432,7 @@ int
 ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 			 u64 vpu_addr, struct sg_table *sgt,  bool llc_coherent)
 {
+	size_t start_vpu_addr = vpu_addr;
 	struct scatterlist *sg;
 	int ret;
 	u64 prot;
@@ -462,7 +463,7 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 		ret = ivpu_mmu_context_map_pages(vdev, ctx, vpu_addr, dma_addr, size, prot);
 		if (ret) {
 			ivpu_err(vdev, "Failed to map context pages\n");
-			goto err_unlock;
+			goto err_unmap_pages;
 		}
 		vpu_addr += size;
 	}
@@ -472,7 +473,7 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 		if (ret) {
 			ivpu_err(vdev, "Failed to set context descriptor for context %u: %d\n",
 				 ctx->id, ret);
-			goto err_unlock;
+			goto err_unmap_pages;
 		}
 		ctx->is_cd_valid = true;
 	}
@@ -480,17 +481,19 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 	/* Ensure page table modifications are flushed from wc buffers to memory */
 	wmb();
 
-	mutex_unlock(&ctx->lock);
-
 	ret = ivpu_mmu_invalidate_tlb(vdev, ctx->id);
-	if (ret)
+	if (ret) {
 		ivpu_err(vdev, "Failed to invalidate TLB for ctx %u: %d\n", ctx->id, ret);
-	return ret;
+		goto err_unmap_pages;
+	}
 
-err_unlock:
 	mutex_unlock(&ctx->lock);
-	return ret;
+	return 0;
 
+err_unmap_pages:
+	ivpu_mmu_context_unmap_pages(ctx, start_vpu_addr, vpu_addr - start_vpu_addr);
+	mutex_unlock(&ctx->lock);
+	return ret;
 }
 
 void
-- 
2.45.1

