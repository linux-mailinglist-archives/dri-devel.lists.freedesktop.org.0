Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C5F7A45A0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A76010E234;
	Mon, 18 Sep 2023 09:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2451410E22D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 920C560F80;
 Mon, 18 Sep 2023 09:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDE9C433C9;
 Mon, 18 Sep 2023 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028416;
 bh=rm/2o0Yzt0/LI9xoFfNtzYLF1kipUM2YHJa2kQoVsiM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h2F9tMm7wn7mi4gCp6ENOiLCITvs7zMF0dkGdi/EeUAaWvJd+cAAszmiGxLMNz1ao
 vSdmnRxD5t0WoQNT4XqL50Usp8NcjPPSpSMnM9ybFpE7iPqa4EOjNKNPPpY2mVdoDh
 Cd2LmhJaozcHmWTYUSuMMTlx4wfchbPopa56Vq7awJs9YyduG3yOO+oCCDmnmznkXU
 BWT4kw91ULoHRGM+026BjsRdKhmRdD/Dt6R+GzYw9i3QNqcat8hC94WfN6kG63LqB+
 t3a8XLvCDZSRYKk6r8xFNUItiw/S0JBroKR3M7jWAfF12tngCCLDJZCqXehxoR2lwX
 O7mCLfPa3PKxQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/14] accel/habanalabs/gaudi2: print power-mode changes
Date: Mon, 18 Sep 2023 12:13:14 +0300
Message-Id: <20230918091321.855943-7-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918091321.855943-1-ogabbay@kernel.org>
References: <20230918091321.855943-1-ogabbay@kernel.org>
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

Print to kernel log any device power mode changes events reported by
the FW.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c             | 12 ++++++++++++
 .../habanalabs/include/gaudi2/gaudi2_async_events.h  |  7 +++++++
 .../include/gaudi2/gaudi2_async_ids_map_extended.h   | 12 ++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index dca19be42d5f..677900e18519 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -7798,6 +7798,7 @@ static inline bool is_info_event(u32 event)
 	switch (event) {
 	case GAUDI2_EVENT_CPU_CPLD_SHUTDOWN_CAUSE:
 	case GAUDI2_EVENT_CPU_FIX_POWER_ENV_S ... GAUDI2_EVENT_CPU_FIX_THERMAL_ENV_E:
+	case GAUDI2_EVENT_ARC_PWR_BRK_ENTRY ... GAUDI2_EVENT_ARC_PWR_RD_MODE3:
 
 	/* return in case of NIC status event - these events are received periodically and not as
 	 * an indication to an error.
@@ -10178,6 +10179,17 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		is_critical = true;
 		break;
 
+	case GAUDI2_EVENT_ARC_PWR_BRK_ENTRY:
+	case GAUDI2_EVENT_ARC_PWR_BRK_EXT:
+	case GAUDI2_EVENT_ARC_PWR_RD_MODE0:
+	case GAUDI2_EVENT_ARC_PWR_RD_MODE1:
+	case GAUDI2_EVENT_ARC_PWR_RD_MODE2:
+	case GAUDI2_EVENT_ARC_PWR_RD_MODE3:
+		error_count = GAUDI2_NA_EVENT_CAUSE;
+		dev_info_ratelimited(hdev->dev, "%s event received\n",
+					gaudi2_irq_map_table[event_type].name);
+		break;
+
 	default:
 		if (gaudi2_irq_map_table[event_type].valid) {
 			dev_err_ratelimited(hdev->dev, "Cannot find handler for event %d\n",
diff --git a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_events.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_events.h
index f661068d0c5f..a426410139af 100644
--- a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_events.h
+++ b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_events.h
@@ -959,6 +959,13 @@ enum gaudi2_async_event_id {
 	GAUDI2_EVENT_ARC_DCCM_FULL = 1319,
 	GAUDI2_EVENT_CPU_FP32_NOT_SUPPORTED = 1320,
 	GAUDI2_EVENT_CPU_DEV_RESET_REQ = 1321,
+	GAUDI2_EVENT_ARC_PWR_BRK_ENTRY = 1322,
+	GAUDI2_EVENT_ARC_PWR_BRK_EXT = 1323,
+	GAUDI2_EVENT_ARC_PWR_RD_MODE0 = 1324,
+	GAUDI2_EVENT_ARC_PWR_RD_MODE1 = 1325,
+	GAUDI2_EVENT_ARC_PWR_RD_MODE2 = 1326,
+	GAUDI2_EVENT_ARC_PWR_RD_MODE3 = 1327,
+	GAUDI2_EVENT_ARC_EQ_HEARTBEAT = 1328,
 	GAUDI2_EVENT_SIZE,
 };
 
diff --git a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
index ad01fc4e9940..6cb0f615fc3e 100644
--- a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
+++ b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_ids_map_extended.h
@@ -2673,6 +2673,18 @@ static struct gaudi2_async_events_ids_map gaudi2_irq_map_table[] = {
 		 .name = "FP32_NOT_SUPPORTED" },
 	{ .fc_id = 1321, .cpu_id = 627, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_HARD,
 		 .name = "DEV_RESET_REQ" },
+	{ .fc_id = 1322, .cpu_id = 628, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
+		 .name = "PWR_BRK_ENTRY" },
+	{ .fc_id = 1323, .cpu_id = 629, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
+		 .name = "PWR_BRK_EXT" },
+	{ .fc_id = 1324, .cpu_id = 630, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
+		 .name = "PWR_RD_MODE0" },
+	{ .fc_id = 1325, .cpu_id = 631, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
+		 .name = "PWR_RD_MODE1" },
+	{ .fc_id = 1326, .cpu_id = 632, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
+		 .name = "PWR_RD_MODE2" },
+	{ .fc_id = 1327, .cpu_id = 633, .valid = 1, .msg = 1, .reset = EVENT_RESET_TYPE_NONE,
+		 .name = "PWR_RD_MODE3" },
 };
 
 #endif /* __GAUDI2_ASYNC_IDS_MAP_EVENTS_EXT_H_ */
-- 
2.34.1

