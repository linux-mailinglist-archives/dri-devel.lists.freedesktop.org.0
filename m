Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9134D6C66B4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 12:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C1A10E010;
	Thu, 23 Mar 2023 11:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A89010E010
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 11:35:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E396C62606;
 Thu, 23 Mar 2023 11:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6980FC433D2;
 Thu, 23 Mar 2023 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679571332;
 bh=tDRuSr+FoMDrwJWKloBZGemtUGb1lIUmrv7XdcHche8=;
 h=From:To:Cc:Subject:Date:From;
 b=nKadjOjIgE94tTgfh6sxWOIRWNYWpVARRRJEpgR5LZzxyzTd3ZnFbzNQO44zRN9Jl
 tbcexM2w+C7vczbYtIumHOOWpmlWIyUw3bTQH0kADTmTExC+0vhmBX1CZ3HdWr9a7M
 +7XwS4cHQJBXPXJTA7Zqsk84mebahtS2VzhNEZW35w8nTTsEQkHd+kZwuCQUiW7iaw
 j7k5mv+gtYkZosr31A0oRKD+8oTP0+rjHLdi28mDjahND7wrtXQu+0w/MsNTafe7LU
 CdY9I4wFMENerYB2YunJNYDvcT31RxFkvGeANyoTmkkmirYRmpL8JR2vSpi+X/Pk41
 S5sG719u21ijw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] accel/habanalabs: unmap mapped memory when TLB inv fails
Date: Thu, 23 Mar 2023 13:35:20 +0200
Message-Id: <20230323113525.959176-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
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

Once a memory mapping is added to the page tables, it's followed by
a TLB invalidation request which could potentially fail (HW failure).
Removing the mapping is simply a part of this failure handling routine.
TLB invalidation failure prints were updated to be more accurate.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/command_buffer.c | 15 ++++++++++++---
 drivers/accel/habanalabs/common/mmu/mmu.c        |  8 ++++++--
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_buffer.c b/drivers/accel/habanalabs/common/command_buffer.c
index 3a0535ac28b1..6e09f48750a0 100644
--- a/drivers/accel/habanalabs/common/command_buffer.c
+++ b/drivers/accel/habanalabs/common/command_buffer.c
@@ -45,20 +45,29 @@ static int cb_map_mem(struct hl_ctx *ctx, struct hl_cb *cb)
 	}
 
 	mutex_lock(&hdev->mmu_lock);
+
 	rc = hl_mmu_map_contiguous(ctx, cb->virtual_addr, cb->bus_address, cb->roundup_size);
 	if (rc) {
 		dev_err(hdev->dev, "Failed to map VA %#llx to CB\n", cb->virtual_addr);
-		goto err_va_umap;
+		goto err_va_pool_free;
 	}
+
 	rc = hl_mmu_invalidate_cache(hdev, false, MMU_OP_USERPTR | MMU_OP_SKIP_LOW_CACHE_INV);
+	if (rc)
+		goto err_mmu_unmap;
+
 	mutex_unlock(&hdev->mmu_lock);
 
 	cb->is_mmu_mapped = true;
-	return rc;
 
-err_va_umap:
+	return 0;
+
+err_mmu_unmap:
+	hl_mmu_unmap_contiguous(ctx, cb->virtual_addr, cb->roundup_size);
+err_va_pool_free:
 	mutex_unlock(&hdev->mmu_lock);
 	gen_pool_free(ctx->cb_va_pool, cb->virtual_addr, cb->roundup_size);
+
 	return rc;
 }
 
diff --git a/drivers/accel/habanalabs/common/mmu/mmu.c b/drivers/accel/habanalabs/common/mmu/mmu.c
index 17581b1bcc77..f379e5b461a6 100644
--- a/drivers/accel/habanalabs/common/mmu/mmu.c
+++ b/drivers/accel/habanalabs/common/mmu/mmu.c
@@ -679,7 +679,9 @@ int hl_mmu_invalidate_cache(struct hl_device *hdev, bool is_hard, u32 flags)
 
 	rc = hdev->asic_funcs->mmu_invalidate_cache(hdev, is_hard, flags);
 	if (rc)
-		dev_err_ratelimited(hdev->dev, "MMU cache invalidation failed\n");
+		dev_err_ratelimited(hdev->dev,
+				"%s cache invalidation failed, rc=%d\n",
+				flags == VM_TYPE_USERPTR ? "PMMU" : "HMMU", rc);
 
 	return rc;
 }
@@ -692,7 +694,9 @@ int hl_mmu_invalidate_cache_range(struct hl_device *hdev, bool is_hard,
 	rc = hdev->asic_funcs->mmu_invalidate_cache_range(hdev, is_hard, flags,
 								asid, va, size);
 	if (rc)
-		dev_err_ratelimited(hdev->dev, "MMU cache range invalidation failed\n");
+		dev_err_ratelimited(hdev->dev,
+				"%s cache range invalidation failed: va=%#llx, size=%llu, rc=%d",
+				flags == VM_TYPE_USERPTR ? "PMMU" : "HMMU", va, size, rc);
 
 	return rc;
 }
-- 
2.40.0

