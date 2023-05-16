Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB1704956
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C0210E33C;
	Tue, 16 May 2023 09:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD7210E337
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DAFA26368E;
 Tue, 16 May 2023 09:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F19FC4339B;
 Tue, 16 May 2023 09:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684229450;
 bh=RPeG7il0fG73XCeZa2IMJtEo5DGH2b+5ndrp7FGxxfY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XFx4wK6QDqzJyz3mgX2UFbb5h+q7n1WQytFFZ9KVbhk1P9okJKfqANY60vIwpifoY
 x0fS9hxN587ovz+u5+qN98uaz1/GnSjRa6Awi9L9ZgxrWx6qGpxhgLtpuiCeKoBXzM
 yH2iDf/MbO8KCpltVrQu/yTKEqJ56WXBClQhJ1M96dUJm37V2qi6aJETiJP7/KbWIB
 38Jwem0vikhebPnLABoelkiwYyr+EIYs3uNLhAF63F0J4k89L8F0fJDZjoNckwiPwU
 yV/K93f5lApRZbY8LNbM1j+srLJQBPgN+zLZiaVTjCAygInjaEh9yqxV+Cr/RJ9J8H
 QomHVUOMmfc2g==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/12] accel/habanalabs: update state when loading boot fit
Date: Tue, 16 May 2023 12:30:29 +0300
Message-Id: <20230516093030.1220526-11-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Any FW component we load must be followed by a corresponding state
update. However, it seems that so far we skipped doing so for the
bootfit case, so fix that.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index eb51d7f70aec..acbc1a6b5cb1 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -2486,16 +2486,6 @@ static int hl_fw_dynamic_load_image(struct hl_device *hdev,
 	if (rc)
 		goto release_fw;
 
-	/* update state according to boot stage */
-	if (cur_fwc == FW_COMP_BOOT_FIT) {
-		struct cpu_dyn_regs *dyn_regs;
-
-		dyn_regs = &fw_loader->dynamic_loader.comm_desc.cpu_dyn_regs;
-		hl_fw_boot_fit_update_state(hdev,
-				le32_to_cpu(dyn_regs->cpu_boot_dev_sts0),
-				le32_to_cpu(dyn_regs->cpu_boot_dev_sts1));
-	}
-
 	/* copy boot fit to space allocated by FW */
 	rc = hl_fw_dynamic_copy_image(hdev, fw, fw_loader);
 	if (rc)
@@ -2798,6 +2788,14 @@ static int hl_fw_dynamic_init_cpu(struct hl_device *hdev,
 		goto protocol_err;
 	}
 
+	rc = hl_fw_dynamic_wait_for_boot_fit_active(hdev, fw_loader);
+	if (rc)
+		goto protocol_err;
+
+	hl_fw_boot_fit_update_state(hdev,
+			le32_to_cpu(dyn_regs->cpu_boot_dev_sts0),
+			le32_to_cpu(dyn_regs->cpu_boot_dev_sts1));
+
 	/*
 	 * when testing FW load (without Linux) on PLDM we don't want to
 	 * wait until boot fit is active as it may take several hours.
@@ -2807,10 +2805,6 @@ static int hl_fw_dynamic_init_cpu(struct hl_device *hdev,
 	if (hdev->pldm && !(hdev->fw_components & FW_TYPE_LINUX))
 		return 0;
 
-	rc = hl_fw_dynamic_wait_for_boot_fit_active(hdev, fw_loader);
-	if (rc)
-		goto protocol_err;
-
 	/* Enable DRAM scrambling before Linux boot and after successful
 	 *  UBoot
 	 */
@@ -2844,7 +2838,8 @@ static int hl_fw_dynamic_init_cpu(struct hl_device *hdev,
 	if (rc)
 		goto protocol_err;
 
-	hl_fw_linux_update_state(hdev, le32_to_cpu(dyn_regs->cpu_boot_dev_sts0),
+	hl_fw_linux_update_state(hdev,
+				le32_to_cpu(dyn_regs->cpu_boot_dev_sts0),
 				le32_to_cpu(dyn_regs->cpu_boot_dev_sts1));
 
 	hl_fw_dynamic_update_linux_interrupt_if(hdev);
-- 
2.40.1

