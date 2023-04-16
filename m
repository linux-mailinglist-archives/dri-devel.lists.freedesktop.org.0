Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331246E37BD
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 13:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F7F10E0B0;
	Sun, 16 Apr 2023 11:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF7B10E066
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 11:31:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EE2D60DD9;
 Sun, 16 Apr 2023 11:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1360EC433EF;
 Sun, 16 Apr 2023 11:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681644664;
 bh=DSeFNBgQySY7ySyAZKExFOQqvgJKxBYCHCUDJ/Tf+cA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GM6Pm6FtJyHFSIazrSrQ3+a+HMkhF1gUpfq1h762Ca/yJYbn4lYRP9L/OgsSfqPWb
 kUD5Cdpp4nlXHVHqnZ/YU+XzJoYkuzFfghl8VdyjRPb1UcDHbeUlhlV/ntvUJMV2zG
 rYnvM3gcMIIs3GgM0iFlrjJefk4BztztJiiim9Wi22VD5xR1NZ7P3kWj2Aifz6yxvw
 nkx6TlA24ihSW3/bcbFhZ67wMNfAW+iWIqUYJsw4SsNOa4r2bHh+oe/al2GX16JhD5
 SOjH8nrXoQswqJSu+3CPYHE+uRtcW9GQYoYFSSXFhsNS3SwVmUbvWTEett/U7OMWiA
 NekM1Cpn9JJsQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] accel/habanalabs: fix bug in free scratchpad memory
Date: Sun, 16 Apr 2023 14:30:50 +0300
Message-Id: <20230416113050.2815620-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416113050.2815620-1-ogabbay@kernel.org>
References: <20230416113050.2815620-1-ogabbay@kernel.org>
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

This commit fixes a bug in Gaudi2 when freeing the scratchpad memory
in case software init fails.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 6f05aa230376..acc304ebca82 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -3630,8 +3630,8 @@ static int gaudi2_sw_init(struct hl_device *hdev)
 special_blocks_free:
 	gaudi2_special_blocks_iterator_free(hdev);
 free_scratchpad_mem:
-	hl_asic_dma_pool_free(hdev, gaudi2->scratchpad_kernel_address,
-				gaudi2->scratchpad_bus_address);
+	hl_asic_dma_free_coherent(hdev, PAGE_SIZE, gaudi2->scratchpad_kernel_address,
+				  gaudi2->scratchpad_bus_address);
 free_virt_msix_db_mem:
 	hl_cpu_accessible_dma_pool_free(hdev, prop->pmmu.page_size, gaudi2->virt_msix_db_cpu_addr);
 free_cpu_accessible_dma_pool:
-- 
2.40.0

