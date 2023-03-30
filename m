Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853636CFC99
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9217310ECFD;
	Thu, 30 Mar 2023 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B55910E17D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:22:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84DE761F0D;
 Thu, 30 Mar 2023 07:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DA0C4339C;
 Thu, 30 Mar 2023 07:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680160945;
 bh=f2bpWEYCZQj8T/8L7PJWdvmks04bpCsvhjvvtHKHL5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sgnOdrei9Cef1yYGIEg5eO6pRpXwBjy2CswduwK0gjpaklpQOoVH0Ox534d7ST5w+
 TK9xgbT1x69y+yCu4j6GzSuLX+QPTPCsvrKgs/o3ydUsxzWGC11+U/DLl2pYTKuJCO
 NXhPoTMBFjWa/mJCh0w5WwlisSs74t6ONYIyFm9cd31sPfwHvhHVgkPLCQFWWXSyJY
 /IpUwFspJBgJg1AMSqwJuEhPYN3PW3xGwbCzT3qbjA3V3v6UUrLAFim61eLMJ2sEkP
 LHVba+nbydmbsqwaMceDTR1MkUpHg7pDZ/luag85/DviZzDpGIC7obTXdIdtGUU1eN
 F3AMvN3HrcbnA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] accel/habanalabs: don't wait for STS_OK after sending
 COMMS WFE
Date: Thu, 30 Mar 2023 10:22:12 +0300
Message-Id: <20230330072213.1596318-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330072213.1596318-1-ogabbay@kernel.org>
References: <20230330072213.1596318-1-ogabbay@kernel.org>
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

Sending COMMS_GOTO_WFE instructs the FW's CPU to halt (WFE state).
Once sent, FW's CPU isn't expected to continue communicating with LKD.
Therefore, the stage of waiting for COMMS_STS_OK should be skipped or
else waiting for COMMS_STS_OK will simply timeout, which will trigger
unexpected behavior.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 781256dd49ad..59f61ec66445 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -1278,7 +1278,7 @@ void hl_fw_ask_halt_machine_without_linux(struct hl_device *hdev)
 	/* Stop device CPU to make sure nothing bad happens */
 	if (hdev->asic_prop.dynamic_fw_load) {
 		rc = hl_fw_dynamic_send_protocol_cmd(hdev, &hdev->fw_loader,
-				COMMS_GOTO_WFE, 0, true,
+				COMMS_GOTO_WFE, 0, false,
 				hdev->fw_loader.cpu_timeout);
 		if (rc)
 			dev_err(hdev->dev, "Failed sending COMMS_GOTO_WFE\n");
-- 
2.40.0

