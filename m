Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA2E6CA246
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 13:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F68110E36E;
	Mon, 27 Mar 2023 11:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB1910E36E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 11:22:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAAC16118E;
 Mon, 27 Mar 2023 11:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5549EC433EF;
 Mon, 27 Mar 2023 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679916136;
 bh=hghkGDUeNX0ZzOZaT0ZYGQIwBZM+Djuo3kOAOr3hlHY=;
 h=From:To:Cc:Subject:Date:From;
 b=j+hFa5tI179mqFEGB5qBm5f8Ho0A5MkTRtY1+L4PYf7wbWgrconAB2bNsV3IO2c5Y
 Pm1g/ryoiqOKQR1N5ZwjPqhyRC4pWG6hQ4oEOuvTaYkJ8r3FoZsN07ayuOScHyTFjz
 gYR3dhp/xMzKj15kWNdY79ULf7tWJ0/xp9oAq88fLAXu1XYFXa5Kg39tin6UsN3OMW
 ucDH4FbP3XPqcL/Psxjhw/c+cWdTvITSPtfuBbivaWJfrD/megHfjzrc7S5bb/63lc
 DIR/WEjoWz1ifLTZfRF0nfYEOzHQGBzokpyK74tYHRZ4gY4cLH5CWtGqOughB9qWRI
 ZSFRKu7ztoS3A==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] accel/habanalabs: fix access error clear event
Date: Mon, 27 Mar 2023 14:22:08 +0300
Message-Id: <20230327112210.1287876-1-ogabbay@kernel.org>
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
Cc: Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

The register which needs to be cleared is the valid register instead
of the address.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index edcbda3d9b40..bace4ac998e0 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8884,7 +8884,7 @@ static void gaudi2_handle_access_error(struct hl_device *hdev, u64 mmu_base, boo
 
 	dev_err_ratelimited(hdev->dev, "%s access error on va 0x%llx\n",
 				is_pmmu ? "PMMU" : "HMMU", addr);
-	WREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_ACCESS_ERROR_CAPTURE), 0);
+	WREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_ACCESS_PAGE_ERROR_VALID), 0);
 }
 
 static int gaudi2_handle_mmu_spi_sei_generic(struct hl_device *hdev, u16 event_type,
-- 
2.40.0

