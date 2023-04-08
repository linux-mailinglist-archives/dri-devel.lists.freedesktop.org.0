Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9E86DB953
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 09:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573ED10E11C;
	Sat,  8 Apr 2023 07:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7E110E11B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 07:45:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D2C966006F;
 Sat,  8 Apr 2023 07:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58613C4339B;
 Sat,  8 Apr 2023 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680939919;
 bh=9Fgj/QExTY+tu8jjhnuDPVG5mk6QKPQruzqaaLpdpvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CV47gPKXajiBxDfO0qj/UYobS1Wvay1bIKmhC92XS7CA84RvobbCCQqIeTgRgVg4i
 f0R9GOf367oAYRCq23pdB1Qp0gL5Fj0yfz0HswYG3RKOhlzfsyR+eTySxYsCFPmzXU
 fWdGdfk49FthypvN1pW2NcoIcGntpWJflOeV+QfHvXuKXkwV8Q4IPedq6Geknq6p5R
 3YhNYDr7zkSLY+aK0m9vIdHP6Kz3sQkhhmj577oAkVYEwMeWzYyrSjB2ASiwy7Koas
 LrgBMOt0a+6khpK/lO38AIELDIfek21HlImo6+vMJkSR6BpNUJ3drbnRaOvTGI6bOs
 GgAYku68ECHFQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] accel/habanalabs: fix handling of arc farm sei event
Date: Sat,  8 Apr 2023 10:45:10 +0300
Message-Id: <20230408074512.2277163-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230408074512.2277163-1-ogabbay@kernel.org>
References: <20230408074512.2277163-1-ogabbay@kernel.org>
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

There is only single eq entry for arc farm sei event which aggregates
events from the four arc farms.
Fix the code to handle this event according to this behavior.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 25 +++++++++++--------
 .../include/gaudi2/asic_reg/gaudi2_regs.h     |  4 ++-
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index da1b2e6dd683..b318c67dae13 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8490,23 +8490,28 @@ static int gaudi2_handle_qman_err(struct hl_device *hdev, u16 event_type, u64 *e
 
 static int gaudi2_handle_arc_farm_sei_err(struct hl_device *hdev, u16 event_type)
 {
-	u32 i, sts_val, sts_clr_val = 0, error_count = 0;
+	u32 i, sts_val, sts_clr_val, error_count = 0, arc_farm;
 
-	sts_val = RREG32(mmARC_FARM_ARC0_AUX_ARC_SEI_INTR_STS);
+	for (arc_farm = 0 ; arc_farm < NUM_OF_ARC_FARMS_ARC ; arc_farm++) {
+		sts_clr_val = 0;
+		sts_val = RREG32(mmARC_FARM_ARC0_AUX_ARC_SEI_INTR_STS +
+				(arc_farm * ARC_FARM_OFFSET));
 
-	for (i = 0 ; i < GAUDI2_NUM_OF_ARC_SEI_ERR_CAUSE ; i++) {
-		if (sts_val & BIT(i)) {
-			gaudi2_print_event(hdev, event_type, true,
-				"err cause: %s", gaudi2_arc_sei_error_cause[i]);
-			sts_clr_val |= BIT(i);
-			error_count++;
+		for (i = 0 ; i < GAUDI2_NUM_OF_ARC_SEI_ERR_CAUSE ; i++) {
+			if (sts_val & BIT(i)) {
+				gaudi2_print_event(hdev, event_type, true,
+						"ARC FARM ARC %u err cause: %s",
+						arc_farm, gaudi2_arc_sei_error_cause[i]);
+				sts_clr_val |= BIT(i);
+				error_count++;
+			}
 		}
+		WREG32(mmARC_FARM_ARC0_AUX_ARC_SEI_INTR_CLR + (arc_farm * ARC_FARM_OFFSET),
+				sts_clr_val);
 	}
 
 	hl_check_for_glbl_errors(hdev);
 
-	WREG32(mmARC_FARM_ARC0_AUX_ARC_SEI_INTR_CLR, sts_clr_val);
-
 	return error_count;
 }
 
diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
index 452b379f39f6..6c58af614236 100644
--- a/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0
  *
- * Copyright 2020-2022 HabanaLabs, Ltd.
+ * Copyright 2020-2023 HabanaLabs, Ltd.
  * All Rights Reserved.
  *
  */
@@ -543,6 +543,8 @@
 #define HBM_MC_SPI_IEEE1500_COMP_MASK		BIT(3)
 #define HBM_MC_SPI_IEEE1500_PAUSED_MASK		BIT(4)
 
+#define ARC_FARM_OFFSET (mmARC_FARM_ARC1_AUX_BASE - mmARC_FARM_ARC0_AUX_BASE)
+
 #include "nic0_qpc0_regs.h"
 #include "nic0_qm0_regs.h"
 #include "nic0_qm_arc_aux0_regs.h"
-- 
2.40.0

