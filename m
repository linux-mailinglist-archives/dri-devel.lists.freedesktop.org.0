Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8E56A405E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737DD10E3C8;
	Mon, 27 Feb 2023 11:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37DF10E3B9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:13:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 77BCFB80CA7;
 Mon, 27 Feb 2023 11:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D95DC433EF;
 Mon, 27 Feb 2023 11:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677496396;
 bh=MNTXL5gCTOP52+/RXLlk4/dz2lODx9/6GzA1xxPjhNs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eIe+1s+MMaWuq67uWwYAWZsfz8O/D4YVwqaRXixCll0ZXKbOVWeseJ5XlT1fvY73m
 i/wrCfDX0J8JKJTsPpz3B0iwQPFb3EfrERT7wS8Z3KMKjb+PusIFf8Y54Fyb3Cdybr
 Qf2pYQwZWwEjTI8eaIHtgulGqpcClL6XuaW3VkmGk6Im46Y5YDAXe9dNPL0rmdp285
 Zn1+nXJSwTsRmRkfMR3OMxenFuwOLkN6v/ueGA9yqPvgGLlw7Ulwfsp1mpPw3K0E4j
 yW9zoSZpXtSg0N5vtJG+29y5nSc99d4OzMe5ZtJ7ck+s+qu5Men0TtaxVJO654y64d
 XVXl1zDE1idcw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] habanalabs: assert return value of hw_fini
Date: Mon, 27 Feb 2023 13:13:04 +0200
Message-Id: <20230227111306.3985896-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227111306.3985896-1-ogabbay@kernel.org>
References: <20230227111306.3985896-1-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

Since hw_fini return error code for failure indication, we should
check its return value. Currently it might only fail upon soft-reset
from hl_device_reset. Later patch will add hw_fini failure in case of
polling timeout in hard-reset.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 12 +++++++++---
 drivers/accel/habanalabs/gaudi/gaudi.c   |  7 ++++++-
 drivers/accel/habanalabs/gaudi2/gaudi2.c |  7 ++++++-
 drivers/accel/habanalabs/goya/goya.c     |  7 ++++++-
 4 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 7ade32487138..99e793dfb126 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1472,7 +1472,7 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 		schedule_hard_reset = false, delay_reset, from_dev_release, from_watchdog_thread;
 	u64 idle_mask[HL_BUSY_ENGINES_MASK_EXT_SIZE] = {0};
 	struct hl_ctx *ctx;
-	int i, rc;
+	int i, rc, hw_fini_rc;
 
 	if (!hdev->init_done) {
 		dev_err(hdev->dev, "Can't reset before initialization is done\n");
@@ -1634,7 +1634,7 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 	}
 
 	/* Reset the H/W. It will be in idle state after this returns */
-	hdev->asic_funcs->hw_fini(hdev, hard_reset, fw_reset);
+	hw_fini_rc = hdev->asic_funcs->hw_fini(hdev, hard_reset, fw_reset);
 
 	if (hard_reset) {
 		hdev->fw_loader.fw_comp_loaded = FW_TYPE_NONE;
@@ -1661,6 +1661,10 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 		hl_ctx_put(ctx);
 	}
 
+	if (hw_fini_rc) {
+		rc = hw_fini_rc;
+		goto out_err;
+	}
 	/* Finished tear-down, starting to re-initialize */
 
 	if (hard_reset) {
@@ -2416,7 +2420,9 @@ void hl_device_fini(struct hl_device *hdev)
 	hl_cb_pool_fini(hdev);
 
 	/* Reset the H/W. It will be in idle state after this returns */
-	hdev->asic_funcs->hw_fini(hdev, true, false);
+	rc = hdev->asic_funcs->hw_fini(hdev, true, false);
+	if (rc)
+		dev_err(hdev->dev, "hw_fini failed in device fini while removing device %d\n", rc);
 
 	hdev->fw_loader.fw_comp_loaded = FW_TYPE_NONE;
 
diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index 26287084a9e0..60146fd4de6b 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -868,13 +868,18 @@ static int gaudi_early_init(struct hl_device *hdev)
 	rc = hl_fw_read_preboot_status(hdev);
 	if (rc) {
 		if (hdev->reset_on_preboot_fail)
+			/* we are already on failure flow, so don't check if hw_fini fails. */
 			hdev->asic_funcs->hw_fini(hdev, true, false);
 		goto pci_fini;
 	}
 
 	if (gaudi_get_hw_state(hdev) == HL_DEVICE_HW_STATE_DIRTY) {
 		dev_dbg(hdev->dev, "H/W state is dirty, must reset before initializing\n");
-		hdev->asic_funcs->hw_fini(hdev, true, false);
+		rc = hdev->asic_funcs->hw_fini(hdev, true, false);
+		if (rc) {
+			dev_err(hdev->dev, "failed to reset HW in dirty state (%d)\n", rc);
+			goto pci_fini;
+		}
 	}
 
 	return 0;
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 82448edfdfa0..f01fa4bca381 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2886,13 +2886,18 @@ static int gaudi2_early_init(struct hl_device *hdev)
 	rc = hl_fw_read_preboot_status(hdev);
 	if (rc) {
 		if (hdev->reset_on_preboot_fail)
+			/* we are already on failure flow, so don't check if hw_fini fails. */
 			hdev->asic_funcs->hw_fini(hdev, true, false);
 		goto pci_fini;
 	}
 
 	if (gaudi2_get_hw_state(hdev) == HL_DEVICE_HW_STATE_DIRTY) {
 		dev_dbg(hdev->dev, "H/W state is dirty, must reset before initializing\n");
-		hdev->asic_funcs->hw_fini(hdev, true, false);
+		rc = hdev->asic_funcs->hw_fini(hdev, true, false);
+		if (rc) {
+			dev_err(hdev->dev, "failed to reset HW during early init (%d)\n", rc);
+			goto pci_fini;
+		}
 	}
 
 	return 0;
diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
index 7a45ab3ca43a..39f9e5de1f4c 100644
--- a/drivers/accel/habanalabs/goya/goya.c
+++ b/drivers/accel/habanalabs/goya/goya.c
@@ -669,13 +669,18 @@ static int goya_early_init(struct hl_device *hdev)
 	rc = hl_fw_read_preboot_status(hdev);
 	if (rc) {
 		if (hdev->reset_on_preboot_fail)
+			/* we are already on failure flow, so don't check if hw_fini fails. */
 			hdev->asic_funcs->hw_fini(hdev, true, false);
 		goto pci_fini;
 	}
 
 	if (goya_get_hw_state(hdev) == HL_DEVICE_HW_STATE_DIRTY) {
 		dev_dbg(hdev->dev, "H/W state is dirty, must reset before initializing\n");
-		hdev->asic_funcs->hw_fini(hdev, true, false);
+		rc = hdev->asic_funcs->hw_fini(hdev, true, false);
+		if (rc) {
+			dev_err(hdev->dev, "failed to reset HW in dirty state (%d)\n", rc);
+			goto pci_fini;
+		}
 	}
 
 	if (!hdev->pldm) {
-- 
2.39.2

