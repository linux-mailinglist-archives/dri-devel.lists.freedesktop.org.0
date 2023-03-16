Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE2A6BCE5F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331F710ECA8;
	Thu, 16 Mar 2023 11:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E9110ECA8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8641F61FBC;
 Thu, 16 Mar 2023 11:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15923C433D2;
 Thu, 16 Mar 2023 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678966607;
 bh=UmGWWvaPm9DtDkjuHYKHBSZzC1ujogR++GWFYr95Suk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=so3UqfmkAtjO9SS8d6pMzu2h6iZHzFwqIj2FyIw4CEergSPCIL0g1WmxipFIq58yF
 KRjGpwoDnIwrGQi7IvlqQmg2mrsO+2CzspBfke85iEYear/1cW/geDOzepVU+xNQZ9
 rLBHDCV286RJTAgECKSh6R4Jje1uVdrPYEKABLsonV9gakwBjF31FPxXWTJSYr4+6b
 mADDgp4tnV+eJL227UR5k4Au4QAVKGppBCY0pAUUey60/YhHX6D6akkvwxpf1EXYAA
 KCKTNLrQnbcQp7FdvH165Tnlc1MbJyhrxGyoSUCzCwq3WZN7cbzlp4dZrcDgsU9UvZ
 XoaDfP6WTazkQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/10] accel/habanalabs: do not verify engine modes after
 being changed
Date: Thu, 16 Mar 2023 13:36:32 +0200
Message-Id: <20230316113640.499267-2-ogabbay@kernel.org>
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

Engines idle state can't always be verified between changes of
engine modes (e.g., stall/halt).
For example, if a CS is inflight when altering engine's mode,
idle state will return NOT idle, always.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 35 +-----------------------
 1 file changed, 1 insertion(+), 34 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 21cf7180fe9f..cb679365240e 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -4545,36 +4545,9 @@ static int gaudi2_set_engine_modes(struct hl_device *hdev,
 	return 0;
 }
 
-static int gaudi2_verify_engine_modes(struct hl_device *hdev, u32 *engine_ids,
-		u32 num_engines, u32 engine_command)
-{
-	bool is_engine_idle = true;
-	u64 mask_arr = 0;
-	int i;
-
-	gaudi2_get_tpc_idle_status(hdev, &mask_arr, 8 * sizeof(mask_arr), NULL);
-	gaudi2_get_mme_idle_status(hdev, &mask_arr, 8 * sizeof(mask_arr), NULL);
-	gaudi2_get_edma_idle_status(hdev, &mask_arr, 8 * sizeof(mask_arr), NULL);
-
-	for (i = 0 ; i < num_engines ; ++i) {
-		is_engine_idle = !(mask_arr & BIT_ULL(engine_ids[i]));
-		if ((engine_command == HL_ENGINE_RESUME) && !is_engine_idle) {
-			dev_err(hdev->dev, "Engine ID %u remained NOT idle!\n", engine_ids[i]);
-			return -EBUSY;
-		} else if ((engine_command == HL_ENGINE_STALL) && is_engine_idle) {
-			dev_err(hdev->dev, "Engine ID %u remained idle!\n", engine_ids[i]);
-			return -EBUSY;
-		}
-	}
-
-	return 0;
-}
-
 static int gaudi2_set_engines(struct hl_device *hdev, u32 *engine_ids,
 					u32 num_engines, u32 engine_command)
 {
-	int rc;
-
 	switch (engine_command) {
 	case HL_ENGINE_CORE_HALT:
 	case HL_ENGINE_CORE_RUN:
@@ -4582,18 +4555,12 @@ static int gaudi2_set_engines(struct hl_device *hdev, u32 *engine_ids,
 
 	case HL_ENGINE_STALL:
 	case HL_ENGINE_RESUME:
-		rc = gaudi2_set_engine_modes(hdev, engine_ids, num_engines, engine_command);
-		if (rc)
-			return rc;
-
-		return gaudi2_verify_engine_modes(hdev, engine_ids, num_engines, engine_command);
+		return gaudi2_set_engine_modes(hdev, engine_ids, num_engines, engine_command);
 
 	default:
 		dev_err(hdev->dev, "failed to execute command id %u\n", engine_command);
 		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static void gaudi2_halt_engines(struct hl_device *hdev, bool hard_reset, bool fw_reset)
-- 
2.40.0

