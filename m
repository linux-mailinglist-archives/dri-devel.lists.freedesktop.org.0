Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DAE704955
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A5C10E338;
	Tue, 16 May 2023 09:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C5310E33B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DDA6636E9;
 Tue, 16 May 2023 09:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42B3C433D2;
 Tue, 16 May 2023 09:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684229451;
 bh=wjTM3ZJdzQWf6sAyVetSz+MgGpmQ4ynNtBHWcXxTirE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YXuUCxPVpxyzuxn8Qbn3RSfLAmJLyP+Pv1gzUuNd/qWlpLtI20CP37RX/cH2koRHC
 lY8E2ZHAjU5M3V6lFHPxhF6JY3P80xsvUa3QCLffC9HZ06IHDeQvCnecQY96EXo2ui
 LcQ0G31vZpjnCjVpMk/Bu2sIypxg7zXVmSbcWThqAa+Hmlf62gVOvAgaGBEewR8bnz
 /dBGbLFsgRn4RQffLz5gHZN6+IcG9MDwfDfXLTyRDtJbuC+/Q36pHr8Q0elT5vGine
 8BuPvkGAumcqpZEogGP+8lDO5fDXIlCFJFqH7LjZzsve3GxeDGNnsBSz0hmsx7xmAC
 NegBZ+9zEer2w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/12] accel/habanalabs: mask part of hmmu page fault captured
 address
Date: Tue, 16 May 2023 12:30:30 +0300
Message-Id: <20230516093030.1220526-12-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516093030.1220526-1-ogabbay@kernel.org>
References: <20230516093030.1220526-1-ogabbay@kernel.org>
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
Cc: Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

When receiving page fault from hmmu, the captured address is scrambled
both by HW and by driver. The driver part is unscrambled but the HW
part isn't getting unscrambled.
To avoid declaring wrong address, the HW scrambled part will be
masked.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 4981b8eb0ff5..1cb2b72e1cd2 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -162,6 +162,9 @@
 #define PSOC_RAZWI_ENG_STR_SIZE 128
 #define PSOC_RAZWI_MAX_ENG_PER_RTR 5
 
+/* HW scrambles only bits 0-25 */
+#define HW_UNSCRAMBLED_BITS_MASK GENMASK_ULL(63, 26)
+
 struct gaudi2_razwi_info {
 	u32 axuser_xy;
 	u32 rtr_ctrl;
@@ -8835,11 +8838,16 @@ static void gaudi2_handle_page_error(struct hl_device *hdev, u64 mmu_base, bool
 	addr <<= 32;
 	addr |= RREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_PAGE_ERROR_CAPTURE_VA));
 
-	if (!is_pmmu)
+	if (is_pmmu) {
+		dev_err_ratelimited(hdev->dev, "PMMU page fault on va 0x%llx\n", addr);
+	} else {
+
 		addr = gaudi2_mmu_descramble_addr(hdev, addr);
+		addr &= HW_UNSCRAMBLED_BITS_MASK;
+		dev_err_ratelimited(hdev->dev, "HMMU page fault on va range 0x%llx - 0x%llx\n",
+				addr, addr + ~HW_UNSCRAMBLED_BITS_MASK);
+	}
 
-	dev_err_ratelimited(hdev->dev, "%s page fault on va 0x%llx\n",
-				is_pmmu ? "PMMU" : "HMMU", addr);
 	hl_handle_page_fault(hdev, addr, 0, is_pmmu, event_mask);
 
 	WREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_ACCESS_PAGE_ERROR_VALID), 0);
-- 
2.40.1

