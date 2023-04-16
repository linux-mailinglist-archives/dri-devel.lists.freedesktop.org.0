Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D3A6E37BA
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 13:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3756110E03E;
	Sun, 16 Apr 2023 11:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDE510E03E
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 11:31:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 149DE60D3C;
 Sun, 16 Apr 2023 11:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD5EC433D2;
 Sun, 16 Apr 2023 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681644659;
 bh=3qMOz86nPcW6QzmV/fIg6KctzX9/L0ZI+140QE21B+4=;
 h=From:To:Cc:Subject:Date:From;
 b=RI/iaHNXu5iyVDxSARxeHzQaR2K1GTvjsO6A52AvMIpoba4T9IPeRih6fsHeBuIMO
 TY/NtI55gODERLLuJD4M1AUcg3H2hblJRfVpiUxC1jCxfr9nCrh8tNHoxbxunT/S0f
 FZtTwJFqOKEmBBzpVIaBfimxioFy+VgExeDoesHAAXCaMcLuxAQ4Hplg6cj/GjRxhy
 RlzvfoL2rIeq4PMAQcOFDdQfuVVO0Skbt9RNnTdQzaILJ2G/yRHJw43Lsih2satmc1
 +32YdfQFQ02D5F+El3BIoWXo/vKLfZ6t5wFJnnGjiSzAwwZxGVYm9g3TRQg9mG16zX
 jGu7Akt/V2B8w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] accel/habanalabs: ignore false positive razwi
Date: Sun, 16 Apr 2023 14:30:47 +0300
Message-Id: <20230416113050.2815620-1-ogabbay@kernel.org>
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
Cc: Tal Cohen <talcohen@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tal Cohen <talcohen@habana.ai>

In Gaudi2 asic, PSOC RAZWI may cause in HBW or LBW. The address that
caused the error is read from HW register and printed by the Driver.
There are cases where the Driver receives an indication on PSOC
RAZWI error but the address value is zero. In that case, the indication
is a false positive.
The Driver should not "count" a PSOC RAZWI event error when the
caused the address is zeroed.

Signed-off-by: Tal Cohen <talcohen@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 43 +++++++++++++++---------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index b778cf764a68..6f05aa230376 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8251,6 +8251,7 @@ static bool gaudi2_handle_psoc_razwi_happened(struct hl_device *hdev, u32 razwi_
 	u16 num_of_eng, eng_id[PSOC_RAZWI_MAX_ENG_PER_RTR];
 	char eng_name_str[PSOC_RAZWI_ENG_STR_SIZE];
 	bool razwi_happened = false;
+	u64 addr;
 	int i;
 
 	num_of_eng = gaudi2_psoc_razwi_get_engines(common_razwi_info, ARRAY_SIZE(common_razwi_info),
@@ -8269,43 +8270,53 @@ static bool gaudi2_handle_psoc_razwi_happened(struct hl_device *hdev, u32 razwi_
 		if (RREG32(base[i] + DEC_RAZWI_HBW_AW_SET)) {
 			addr_hi = RREG32(base[i] + DEC_RAZWI_HBW_AW_ADDR_HI);
 			addr_lo = RREG32(base[i] + DEC_RAZWI_HBW_AW_ADDR_LO);
-			dev_err(hdev->dev,
+			addr = ((u64)addr_hi << 32) + addr_lo;
+			if (addr) {
+				dev_err(hdev->dev,
 					"PSOC HBW AW RAZWI: %s, address (aligned to 128 byte): 0x%llX\n",
-					eng_name_str, ((u64)addr_hi << 32) + addr_lo);
-			hl_handle_razwi(hdev, ((u64)addr_hi << 32) + addr_lo, &eng_id[0],
+					eng_name_str, addr);
+				hl_handle_razwi(hdev, addr, &eng_id[0],
 					num_of_eng, HL_RAZWI_HBW | HL_RAZWI_WRITE, event_mask);
-			razwi_happened = true;
+				razwi_happened = true;
+			}
 		}
 
 		if (RREG32(base[i] + DEC_RAZWI_HBW_AR_SET)) {
 			addr_hi = RREG32(base[i] + DEC_RAZWI_HBW_AR_ADDR_HI);
 			addr_lo = RREG32(base[i] + DEC_RAZWI_HBW_AR_ADDR_LO);
-			dev_err(hdev->dev,
+			addr = ((u64)addr_hi << 32) + addr_lo;
+			if (addr) {
+				dev_err(hdev->dev,
 					"PSOC HBW AR RAZWI: %s, address (aligned to 128 byte): 0x%llX\n",
-					eng_name_str, ((u64)addr_hi << 32) + addr_lo);
-			hl_handle_razwi(hdev, ((u64)addr_hi << 32) + addr_lo, &eng_id[0],
+					eng_name_str, addr);
+				hl_handle_razwi(hdev, addr, &eng_id[0],
 					num_of_eng, HL_RAZWI_HBW | HL_RAZWI_READ, event_mask);
-			razwi_happened = true;
+				razwi_happened = true;
+			}
 		}
 
 		if (RREG32(base[i] + DEC_RAZWI_LBW_AW_SET)) {
 			addr_lo = RREG32(base[i] + DEC_RAZWI_LBW_AW_ADDR);
-			dev_err(hdev->dev,
+			if (addr_lo) {
+				dev_err(hdev->dev,
 					"PSOC LBW AW RAZWI: %s, address (aligned to 128 byte): 0x%X\n",
 					eng_name_str, addr_lo);
-			hl_handle_razwi(hdev, addr_lo, &eng_id[0],
+				hl_handle_razwi(hdev, addr_lo, &eng_id[0],
 					num_of_eng, HL_RAZWI_LBW | HL_RAZWI_WRITE, event_mask);
-			razwi_happened = true;
+				razwi_happened = true;
+			}
 		}
 
 		if (RREG32(base[i] + DEC_RAZWI_LBW_AR_SET)) {
 			addr_lo = RREG32(base[i] + DEC_RAZWI_LBW_AR_ADDR);
-			dev_err(hdev->dev,
-					"PSOC LBW AR RAZWI: %s, address (aligned to 128 byte): 0x%X\n",
-					eng_name_str, addr_lo);
-			hl_handle_razwi(hdev, addr_lo, &eng_id[0],
+			if (addr_lo) {
+				dev_err(hdev->dev,
+						"PSOC LBW AR RAZWI: %s, address (aligned to 128 byte): 0x%X\n",
+						eng_name_str, addr_lo);
+				hl_handle_razwi(hdev, addr_lo, &eng_id[0],
 					num_of_eng, HL_RAZWI_LBW | HL_RAZWI_READ, event_mask);
-			razwi_happened = true;
+				razwi_happened = true;
+			}
 		}
 		/* In common case the loop will break, when there is only one engine id, or
 		 * several engines with the same router. The exceptional case is with psoc razwi
-- 
2.40.0

