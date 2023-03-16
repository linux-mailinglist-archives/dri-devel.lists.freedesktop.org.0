Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6046BCE64
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D6C10ECB0;
	Thu, 16 Mar 2023 11:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431A610ECA8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6BD161FBC;
 Thu, 16 Mar 2023 11:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B19C4339C;
 Thu, 16 Mar 2023 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678966611;
 bh=svAWj3QMFrUxzrTRWMGtf8lk+Xcl2JB3q7z9gbEYMJA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k2AtBnLHLb/5mqEDRtbvQ7xV1OomSYl6iYjUgZTvkPPbcHj0YcWYFOu9BcmbIJXKH
 WiieblBk3dlzdBSCRXaW4+1KyCINIeqBIk4QgNOntgzpxcsgyT/iupmp4gXHIAwR2K
 27up612DMn3uOjbhlpdUAp7ZUybOnGTVNTHStvA18eY2ih5sm0CZmk5vdifTuRmbVr
 a41TQhX4s5ZgcQiB2Idt+YBljN1o28E3/YwPCHvMRky+DSWLl6IbjpAt9CYqz5Z5jq
 +l+qxOnXXm3lUw8QTR0jFMaqfHytG8JHTXJPbLYLn+dSbI15yS24O6vITJMsKx1f2o
 bfCQwY4L/ASoA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/10] accel/habanalabs: fix use of var reset_sleep_ms
Date: Thu, 16 Mar 2023 13:36:35 +0200
Message-Id: <20230316113640.499267-5-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

- remove reset_sleep_ms arg from functions that don't use it.
- move the call msleep(reset_sleep_ms) from btm poll to gaudi2_hw_fini
as it is called from there already for other flow.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 34 +++++++++++-------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 15a06beea065..224eaafe953f 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -6014,11 +6014,10 @@ static void gaudi2_send_hard_reset_cmd(struct hl_device *hdev)
  * gaudi2_execute_hard_reset - execute hard reset by driver/FW
  *
  * @hdev: pointer to the habanalabs device structure
- * @reset_sleep_ms: sleep time in msec after reset
  *
  * This function executes hard reset based on if driver/FW should do the reset
  */
-static void gaudi2_execute_hard_reset(struct hl_device *hdev, u32 reset_sleep_ms)
+static void gaudi2_execute_hard_reset(struct hl_device *hdev)
 {
 	if (hdev->asic_prop.hard_reset_done_by_fw) {
 		gaudi2_send_hard_reset_cmd(hdev);
@@ -6060,14 +6059,13 @@ static int gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll_
  * gaudi2_execute_soft_reset - execute soft reset by driver/FW
  *
  * @hdev: pointer to the habanalabs device structure
- * @reset_sleep_ms: sleep time in msec after reset
  * @driver_performs_reset: true if driver should perform reset instead of f/w.
  * @poll_timeout_us: time to wait for response from f/w.
  *
  * This function executes soft reset based on if driver/FW should do the reset
  */
-static int gaudi2_execute_soft_reset(struct hl_device *hdev, u32 reset_sleep_ms,
-						bool driver_performs_reset, u32 poll_timeout_us)
+static int gaudi2_execute_soft_reset(struct hl_device *hdev, bool driver_performs_reset,
+						u32 poll_timeout_us)
 {
 	struct cpu_dyn_regs *dyn_regs = &hdev->fw_loader.dynamic_loader.comm_desc.cpu_dyn_regs;
 
@@ -6099,15 +6097,11 @@ static int gaudi2_execute_soft_reset(struct hl_device *hdev, u32 reset_sleep_ms,
 	return 0;
 }
 
-static void gaudi2_poll_btm_indication(struct hl_device *hdev, u32 reset_sleep_ms,
-								u32 poll_timeout_us)
+static void gaudi2_poll_btm_indication(struct hl_device *hdev, u32 poll_timeout_us)
 {
 	int i, rc = 0;
 	u32 reg_val;
 
-	/* without this sleep reset will not work */
-	msleep(reset_sleep_ms);
-
 	/* We poll the BTM done indication multiple times after reset due to
 	 * a HW errata 'GAUDI2_0300'
 	 */
@@ -6129,6 +6123,7 @@ static int gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
 	u32 poll_timeout_us, reset_sleep_ms;
 	bool driver_performs_reset = false;
+	int rc;
 
 	if (hdev->pldm) {
 		reset_sleep_ms = hard_reset ? GAUDI2_PLDM_HRESET_TIMEOUT_MSEC :
@@ -6146,7 +6141,7 @@ static int gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset
 
 	if (hard_reset) {
 		driver_performs_reset = !hdev->asic_prop.hard_reset_done_by_fw;
-		gaudi2_execute_hard_reset(hdev, reset_sleep_ms);
+		gaudi2_execute_hard_reset(hdev);
 	} else {
 		/*
 		 * As we have to support also work with preboot only (which does not supports
@@ -6156,8 +6151,9 @@ static int gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset
 		 */
 		driver_performs_reset = (hdev->fw_components == FW_TYPE_PREBOOT_CPU &&
 							!hdev->asic_prop.fw_security_enabled);
-		gaudi2_execute_soft_reset(hdev, reset_sleep_ms, driver_performs_reset,
-						poll_timeout_us);
+		rc = gaudi2_execute_soft_reset(hdev, driver_performs_reset, poll_timeout_us);
+		if (rc)
+			return rc;
 	}
 
 skip_reset:
@@ -6181,12 +6177,14 @@ static int gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset
 		 * communicate with FW that is during reset.
 		 * to overcome this we will always wait to preboot ready indication
 		 */
-		if ((hdev->fw_components & FW_TYPE_PREBOOT_CPU)) {
-			msleep(reset_sleep_ms);
+
+		/* without this sleep reset will not work */
+		msleep(reset_sleep_ms);
+
+		if (hdev->fw_components & FW_TYPE_PREBOOT_CPU)
 			hl_fw_wait_preboot_ready(hdev);
-		} else {
-			gaudi2_poll_btm_indication(hdev, reset_sleep_ms, poll_timeout_us);
-		}
+		else
+			gaudi2_poll_btm_indication(hdev, poll_timeout_us);
 	}
 
 	if (!gaudi2)
-- 
2.40.0

