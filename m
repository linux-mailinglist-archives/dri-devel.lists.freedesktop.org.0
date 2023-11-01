Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0A7DDF07
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 11:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011D110E69D;
	Wed,  1 Nov 2023 10:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BC610E69D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 10:08:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CC5D0CE0FA0;
 Wed,  1 Nov 2023 10:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E5DC433C7;
 Wed,  1 Nov 2023 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698833294;
 bh=+y2U+/CSdO5rFqbvib/QFg2QAHsmQMTqiF0vq4cB0+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WGvQqihqH2DdL/DWl5Gm0/nS2ZKbHlIkEWiJEvl/ttg69LgUlP0CBxyKKXG4rzgBN
 Sr5AVOusdwBB0tzrx/F2jXJm1XhP1fbknE8ex219cfpL2aIoc8Tg31x6APqGrADTKw
 S8ehuGOoRIa9y8iljW+6Q5ru7gygqSYV1ytzGLx9v08mxPtYSDC08pKLD1FCqcJ67k
 uGs0XuKZBoRcM3btbFMRWTYJSdfMOdMXW+bCa/+9l7/quCkP8M4XQObegFdn2X5XSZ
 3jTfQ28wzchmgRc0qJt4p0nAxMf/GcZQKzjTo2EcQFREhJGZloIAR+4JgOty0NdlA1
 l1i6Ne870SPag==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] accel/habanalabs: update device boot error check
Date: Wed,  1 Nov 2023 12:08:05 +0200
Message-Id: <20231101100805.596657-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101100805.596657-1-ogabbay@kernel.org>
References: <20231101100805.596657-1-ogabbay@kernel.org>
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
Cc: Farah Kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Farah Kassabri <fkassabri@habana.ai>

Use a predefined mask which set the device critical boot errors.
Driver will fail and stop its loading, only upon detecting at least
one of those errors defined in this mask.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 122 +++++-------------
 1 file changed, 34 insertions(+), 88 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 47e8384134aa..ec04234e18a5 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -646,39 +646,27 @@ int hl_fw_send_heartbeat(struct hl_device *hdev)
 	return rc;
 }
 
-static bool fw_report_boot_dev0(struct hl_device *hdev, u32 err_val,
-								u32 sts_val)
+static bool fw_report_boot_dev0(struct hl_device *hdev, u32 err_val, u32 sts_val)
 {
 	bool err_exists = false;
 
 	if (!(err_val & CPU_BOOT_ERR0_ENABLED))
 		return false;
 
-	if (err_val & CPU_BOOT_ERR0_DRAM_INIT_FAIL) {
-		dev_err(hdev->dev,
-			"Device boot error - DRAM initialization failed\n");
-		err_exists = true;
-	}
+	if (err_val & CPU_BOOT_ERR0_DRAM_INIT_FAIL)
+		dev_err(hdev->dev, "Device boot error - DRAM initialization failed\n");
 
-	if (err_val & CPU_BOOT_ERR0_FIT_CORRUPTED) {
+	if (err_val & CPU_BOOT_ERR0_FIT_CORRUPTED)
 		dev_err(hdev->dev, "Device boot error - FIT image corrupted\n");
-		err_exists = true;
-	}
 
-	if (err_val & CPU_BOOT_ERR0_TS_INIT_FAIL) {
-		dev_err(hdev->dev,
-			"Device boot error - Thermal Sensor initialization failed\n");
-		err_exists = true;
-	}
+	if (err_val & CPU_BOOT_ERR0_TS_INIT_FAIL)
+		dev_err(hdev->dev, "Device boot error - Thermal Sensor initialization failed\n");
 
 	if (err_val & CPU_BOOT_ERR0_BMC_WAIT_SKIPPED) {
 		if (hdev->bmc_enable) {
-			dev_err(hdev->dev,
-				"Device boot error - Skipped waiting for BMC\n");
-			err_exists = true;
+			dev_err(hdev->dev, "Device boot error - Skipped waiting for BMC\n");
 		} else {
-			dev_info(hdev->dev,
-				"Device boot message - Skipped waiting for BMC\n");
+			dev_info(hdev->dev, "Device boot message - Skipped waiting for BMC\n");
 			/* This is an info so we don't want it to disable the
 			 * device
 			 */
@@ -686,101 +674,59 @@ static bool fw_report_boot_dev0(struct hl_device *hdev, u32 err_val,
 		}
 	}
 
-	if (err_val & CPU_BOOT_ERR0_NIC_DATA_NOT_RDY) {
-		dev_err(hdev->dev,
-			"Device boot error - Serdes data from BMC not available\n");
-		err_exists = true;
-	}
+	if (err_val & CPU_BOOT_ERR0_NIC_DATA_NOT_RDY)
+		dev_err(hdev->dev, "Device boot error - Serdes data from BMC not available\n");
 
-	if (err_val & CPU_BOOT_ERR0_NIC_FW_FAIL) {
-		dev_err(hdev->dev,
-			"Device boot error - NIC F/W initialization failed\n");
-		err_exists = true;
-	}
+	if (err_val & CPU_BOOT_ERR0_NIC_FW_FAIL)
+		dev_err(hdev->dev, "Device boot error - NIC F/W initialization failed\n");
 
-	if (err_val & CPU_BOOT_ERR0_SECURITY_NOT_RDY) {
-		dev_err(hdev->dev,
-			"Device boot warning - security not ready\n");
-		err_exists = true;
-	}
+	if (err_val & CPU_BOOT_ERR0_SECURITY_NOT_RDY)
+		dev_err(hdev->dev, "Device boot warning - security not ready\n");
 
-	if (err_val & CPU_BOOT_ERR0_SECURITY_FAIL) {
+	if (err_val & CPU_BOOT_ERR0_SECURITY_FAIL)
 		dev_err(hdev->dev, "Device boot error - security failure\n");
-		err_exists = true;
-	}
 
-	if (err_val & CPU_BOOT_ERR0_EFUSE_FAIL) {
+	if (err_val & CPU_BOOT_ERR0_EFUSE_FAIL)
 		dev_err(hdev->dev, "Device boot error - eFuse failure\n");
-		err_exists = true;
-	}
 
-	if (err_val & CPU_BOOT_ERR0_SEC_IMG_VER_FAIL) {
+	if (err_val & CPU_BOOT_ERR0_SEC_IMG_VER_FAIL)
 		dev_err(hdev->dev, "Device boot error - Failed to load preboot secondary image\n");
-		err_exists = true;
-	}
 
-	if (err_val & CPU_BOOT_ERR0_PLL_FAIL) {
+	if (err_val & CPU_BOOT_ERR0_PLL_FAIL)
 		dev_err(hdev->dev, "Device boot error - PLL failure\n");
-		err_exists = true;
-	}
 
-	if (err_val & CPU_BOOT_ERR0_TMP_THRESH_INIT_FAIL) {
+	if (err_val & CPU_BOOT_ERR0_TMP_THRESH_INIT_FAIL)
 		dev_err(hdev->dev, "Device boot error - Failed to set threshold for temperature sensor\n");
-		err_exists = true;
-	}
 
-	if (err_val & CPU_BOOT_ERR0_DEVICE_UNUSABLE_FAIL) {
-		/* Ignore this bit, don't prevent driver loading */
-		dev_dbg(hdev->dev, "device unusable status is set\n");
-		err_val &= ~CPU_BOOT_ERR0_DEVICE_UNUSABLE_FAIL;
-	}
+	if (err_val & CPU_BOOT_ERR0_DEVICE_UNUSABLE_FAIL)
+		dev_err(hdev->dev, "device unusable status is set\n");
 
-	if (err_val & CPU_BOOT_ERR0_BINNING_FAIL) {
+	if (err_val & CPU_BOOT_ERR0_BINNING_FAIL)
 		dev_err(hdev->dev, "Device boot error - binning failure\n");
-		err_exists = true;
-	}
 
 	if (sts_val & CPU_BOOT_DEV_STS0_ENABLED)
 		dev_dbg(hdev->dev, "Device status0 %#x\n", sts_val);
 
+	if (err_val & CPU_BOOT_ERR0_DRAM_SKIPPED)
+		dev_err(hdev->dev, "Device boot warning - Skipped DRAM initialization\n");
+
+	if (err_val & CPU_BOOT_ERR_ENG_ARC_MEM_SCRUB_FAIL)
+		dev_err(hdev->dev, "Device boot error - ARC memory scrub failed\n");
+
+	/* All warnings should go here in order not to reach the unknown error validation */
 	if (err_val & CPU_BOOT_ERR0_EEPROM_FAIL) {
 		dev_err(hdev->dev, "Device boot error - EEPROM failure detected\n");
 		err_exists = true;
 	}
 
-	/* All warnings should go here in order not to reach the unknown error validation */
-	if (err_val & CPU_BOOT_ERR0_DRAM_SKIPPED) {
-		dev_warn(hdev->dev,
-			"Device boot warning - Skipped DRAM initialization\n");
-		/* This is a warning so we don't want it to disable the
-		 * device
-		 */
-		err_val &= ~CPU_BOOT_ERR0_DRAM_SKIPPED;
-	}
-
-	if (err_val & CPU_BOOT_ERR0_PRI_IMG_VER_FAIL) {
-		dev_warn(hdev->dev,
-			"Device boot warning - Failed to load preboot primary image\n");
-		/* This is a warning so we don't want it to disable the
-		 * device as we have a secondary preboot image
-		 */
-		err_val &= ~CPU_BOOT_ERR0_PRI_IMG_VER_FAIL;
-	}
+	if (err_val & CPU_BOOT_ERR0_PRI_IMG_VER_FAIL)
+		dev_warn(hdev->dev, "Device boot warning - Failed to load preboot primary image\n");
 
-	if (err_val & CPU_BOOT_ERR0_TPM_FAIL) {
-		dev_warn(hdev->dev,
-			"Device boot warning - TPM failure\n");
-		/* This is a warning so we don't want it to disable the
-		 * device
-		 */
-		err_val &= ~CPU_BOOT_ERR0_TPM_FAIL;
-	}
+	if (err_val & CPU_BOOT_ERR0_TPM_FAIL)
+		dev_warn(hdev->dev, "Device boot warning - TPM failure\n");
 
-	if (!err_exists && (err_val & ~CPU_BOOT_ERR0_ENABLED)) {
-		dev_err(hdev->dev,
-			"Device boot error - unknown ERR0 error 0x%08x\n", err_val);
+	if (err_val & CPU_BOOT_ERR_FATAL_MASK)
 		err_exists = true;
-	}
 
 	/* return error only if it's in the predefined mask */
 	if (err_exists && ((err_val & ~CPU_BOOT_ERR0_ENABLED) &
-- 
2.34.1

