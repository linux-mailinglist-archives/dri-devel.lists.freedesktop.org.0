Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A21E6C66B8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 12:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D8110EA70;
	Thu, 23 Mar 2023 11:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BE810E46E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 11:35:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E95D6260A;
 Thu, 23 Mar 2023 11:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E297CC433D2;
 Thu, 23 Mar 2023 11:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679571336;
 bh=+5Ahn+K+Q1efmLhyeeZTykldUeRIz/+pE+wVFDHfSyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KgzmPFMHUYG4GLqxzvi/+Lk2dxPOwvT2wrLn3SLGz6wXwAuMMGb1TDuBsByy1juVy
 OqGcu1vcg79SWazlvfjz03R+UaOZ1KaN/xUyL3y69MHdU5aeWm1xpYIODSUBn6CAy5
 g3yEO4xCCeskcmgQmWH15+Owg7pluL30IapkgysaznQYtaf2NFk/3Ahqqo56doDyDg
 9ZeQ+wQ3xCYGegPDk4qHFiptxL4ZvCJtwqggi/XFWbMgMlVcgMUtj+g/HhDd5lHbz1
 KyI4kNZOyZPTOl0KYPsZOtVI4KqcG3OSOzpie4os9UvQP0VFOfoHYG9qNYZVGaqdM3
 iYiYepPqYWBCA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] accel/habanalabs: change COMMS warning messages to error
 level
Date: Thu, 23 Mar 2023 13:35:23 +0200
Message-Id: <20230323113525.959176-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230323113525.959176-1-ogabbay@kernel.org>
References: <20230323113525.959176-1-ogabbay@kernel.org>
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

COMMS protocol is used for LKD <--> FW communication, and any
communication failure between the two might turn out to be
destructive, hence, it should be well emphasized.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 7ea611392f8c..96027a1c124d 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -1263,7 +1263,7 @@ void hl_fw_ask_hard_reset_without_linux(struct hl_device *hdev)
 				COMMS_RST_DEV, 0, false,
 				hdev->fw_loader.cpu_timeout);
 		if (rc)
-			dev_warn(hdev->dev, "Failed sending COMMS_RST_DEV\n");
+			dev_err(hdev->dev, "Failed sending COMMS_RST_DEV\n");
 	} else {
 		WREG32(static_loader->kmd_msg_to_cpu_reg, KMD_MSG_RST_DEV);
 	}
@@ -1284,7 +1284,7 @@ void hl_fw_ask_halt_machine_without_linux(struct hl_device *hdev)
 				COMMS_GOTO_WFE, 0, true,
 				hdev->fw_loader.cpu_timeout);
 		if (rc)
-			dev_warn(hdev->dev, "Failed sending COMMS_GOTO_WFE\n");
+			dev_err(hdev->dev, "Failed sending COMMS_GOTO_WFE\n");
 	} else {
 		WREG32(static_loader->kmd_msg_to_cpu_reg, KMD_MSG_GOTO_WFE);
 		msleep(static_loader->cpu_reset_wait_msec);
-- 
2.40.0

