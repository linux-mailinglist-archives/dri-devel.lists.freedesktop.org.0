Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230037A459F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0CE10E235;
	Mon, 18 Sep 2023 09:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172F410E233
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85EDB61042;
 Mon, 18 Sep 2023 09:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B28AC433C7;
 Mon, 18 Sep 2023 09:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028421;
 bh=lB6DUE9RYbedQxq7J1xTWUcAEDFQGvi1RKnye/w7h6Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=diVAqMwrXubwleg0KTQguCywIqmTpS6B61ykr4B+gN9AIPoO0mxV9ypba5c+otJ34
 MoDJDN0uVA8LDnBTONKSbMjMPCIVh+EcNZkrkKH8Vur9TcP4eP1IzxOPo1dWx9XfCz
 1uuEDBBuoX4gTdrtejkmpIxxNDLzWO19Csk1Lb0EpmGx87vBPx7yzXr9D9TY6gW2hg
 +r5CR6DmvMTDfOeWKy+Cfzy4iRmFZDzCX7N4J4PCCYx3LZPbY1JrJQ/3PbQQm+LAa/
 lU2fDCp8ZfzDk5FecbNl+k3FfJg6iKbFoiLr4uNwJNAe1cB5bawybduTdoo24rGTHg
 Z7Vp4wNY6vseQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/14] accel/habanalabs: prevent sending heartbeat before
 events are enabled
Date: Mon, 18 Sep 2023 12:13:17 +0300
Message-Id: <20230918091321.855943-10-ogabbay@kernel.org>
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
Cc: farah kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: farah kassabri <fkassabri@habana.ai>

After the heartbeat mechanism is now expanded to be used also
for EQ health check, we shouldn't send heartbeat messages
to FW before driver allow events to be received from FW.

Because if the driver will send two heartbeats before it enables
events to be received from FW, then the EQ health check
will fail and reset the device.

Signed-off-by: farah kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 1d68d2233171..13f14b80a7d4 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -994,12 +994,7 @@ static void hl_device_eq_heartbeat(struct hl_device *hdev)
 	u64 event_mask = HL_NOTIFIER_EVENT_DEVICE_RESET | HL_NOTIFIER_EVENT_DEVICE_UNAVAILABLE;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 
-	 /*
-	  * This feature supported in FW version 1.12.0 45.2.0 and above,
-	  * only on those FW versions eq_health_check_supported will be set.
-	  * Start checking eq health only after driver has enabled events from FW.
-	  */
-	if (!prop->cpucp_info.eq_health_check_supported || !hdev->init_done)
+	if (!prop->cpucp_info.eq_health_check_supported)
 		return;
 
 	if (hdev->eq_heartbeat_received)
@@ -1015,7 +1010,8 @@ static void hl_device_heartbeat(struct work_struct *work)
 	struct hl_info_fw_err_info info = {0};
 	u64 event_mask = HL_NOTIFIER_EVENT_DEVICE_RESET | HL_NOTIFIER_EVENT_DEVICE_UNAVAILABLE;
 
-	if (!hl_device_operational(hdev, NULL))
+	/* Start heartbeat checks only after driver has enabled events from FW */
+	if (!hl_device_operational(hdev, NULL) || !hdev->init_done)
 		goto reschedule;
 
 	/*
-- 
2.34.1

