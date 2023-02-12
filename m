Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFA76939EC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A869510E476;
	Sun, 12 Feb 2023 20:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4159410E471
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC5AB60DDF;
 Sun, 12 Feb 2023 20:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D80C4339B;
 Sun, 12 Feb 2023 20:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234724;
 bh=q5FH+O4RZtWR0ZT7JVCFFhuYYH7DRpawfX/D4l50uoI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=loYuxlhEt3E7/3CKo+L1SCr0EXsv6GWBGcVub/VQC/GP18RmGbX4vG2tfErhhETZw
 xAV5W8RFBh5eaZgtD3X5LJNzWYHJzTwfsNfZ1haG3qGEz0cwd3WbAH7ifmnbjnc24H
 5BkHdHSgm58JPWs586CKP2TrpMOPQod2KszSGHILRraPD0aJA1bYFmCSlaCDNSVv21
 EIJcSpz8CAUnLq25USFxeH5AQe/PhvWFDoRPrXQmafy2mwh/m7bueQF9igQtrXGCha
 eEUBrtp1SOFr5OA/m5ALU3ealTsKxM+nFDmjexAmLtCa+rE1T0P8+0ol8SGuRt2D09
 t4m6IrnvtQG1g==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/27] habanalabs: minimize error prints when mem map fails
Date: Sun, 12 Feb 2023 22:44:40 +0200
Message-Id: <20230212204454.2938561-13-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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
Cc: Moti Haimovski <mhaimovski@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Moti Haimovski <mhaimovski@habana.ai>

This commit minimizes the "chain of errors" displayed when memory
mapping fails.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/memory.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 1d318d7240b7..be0cba3b61ab 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -235,10 +235,8 @@ static int dma_map_host_va(struct hl_device *hdev, u64 addr, u64 size,
 	}
 
 	rc = hl_pin_host_memory(hdev, addr, size, userptr);
-	if (rc) {
-		dev_err(hdev->dev, "Failed to pin host memory\n");
+	if (rc)
 		goto pin_err;
-	}
 
 	userptr->dma_mapped = true;
 	userptr->dir = DMA_BIDIRECTIONAL;
@@ -1097,10 +1095,8 @@ static int map_device_va(struct hl_ctx *ctx, struct hl_mem_in *args, u64 *device
 			huge_page_size = hdev->asic_prop.pmmu_huge.page_size;
 
 		rc = dma_map_host_va(hdev, addr, size, &userptr);
-		if (rc) {
-			dev_err(hdev->dev, "failed to get userptr from va\n");
+		if (rc)
 			return rc;
-		}
 
 		rc = init_phys_pg_pack_from_userptr(ctx, userptr,
 				&phys_pg_pack, false);
-- 
2.25.1

