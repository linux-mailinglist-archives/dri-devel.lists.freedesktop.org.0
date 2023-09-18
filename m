Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9665A7A4B13
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 16:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE6A10E289;
	Mon, 18 Sep 2023 14:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506E710E286
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 14:32:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F0E45B80EA0;
 Mon, 18 Sep 2023 14:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4443C32788;
 Mon, 18 Sep 2023 14:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695047536;
 bh=ir8WshTvQBQW8S1rqaBHbhJZZDNdSS7ityBkYcfQyks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OP6af9s51LO+joEtzrveAFTPSzv1fv0ChtD2FsZL2H66rymnZiFv38SWQuhgJIEkt
 xilfNwAB/nNPpHNPRxPJPGJCyGxeBbKQZWZNJ8VAdTrWs59BXg07OFY/SS+eRhNR9b
 CEdbSC7Kw2wubTytx6+j5Oxin5ARFozAtJh2NYBemJj0YvaKqUZPX5tavTFpNVgq/M
 UZyZWL5KTF9jVDAkr9qVj6OJdZviKFs8bwUll4w/i1tlLEsTcHuFesBihGdbleljZ2
 YHsCSWyjmoPmUAXyp07Gc5O9N0KQJhb8Jzi80p+yXVyaN0nQfo0qpbn3uYhrT4HfBm
 aM7djyIsN2H/Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/10] accel/habanalabs: extend preboot timeout when preboot
 might take longer
Date: Mon, 18 Sep 2023 17:31:57 +0300
Message-Id: <20230918143158.903207-9-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918143158.903207-1-ogabbay@kernel.org>
References: <20230918143158.903207-1-ogabbay@kernel.org>
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

There are cases such when FW runs MBIST, that preboot is expected to take
longer than the usual. In such cases the firmware reports status
SECURITY_READY/IN_PREBOOT and we extend the timeout waiting for it.
This is currently implemented for Gaudi2 only.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 26 ++++++++++++++++---
 drivers/accel/habanalabs/common/habanalabs.h  |  3 +++
 drivers/accel/habanalabs/gaudi2/gaudi2.c      |  2 ++
 drivers/accel/habanalabs/gaudi2/gaudi2P.h     |  1 +
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 2a6dfea3d27d..0fb360cca9cc 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -1474,8 +1474,9 @@ static void detect_cpu_boot_status(struct hl_device *hdev, u32 status)
 int hl_fw_wait_preboot_ready(struct hl_device *hdev)
 {
 	struct pre_fw_load_props *pre_fw_load = &hdev->fw_loader.pre_fw_load;
-	u32 status;
-	int rc;
+	u32 status = 0, timeout;
+	int rc, tries = 1;
+	bool preboot_still_runs;
 
 	/* Need to check two possible scenarios:
 	 *
@@ -1485,6 +1486,8 @@ int hl_fw_wait_preboot_ready(struct hl_device *hdev)
 	 * All other status values - for older firmwares where the uboot was
 	 * loaded from the FLASH
 	 */
+	timeout = pre_fw_load->wait_for_preboot_timeout;
+retry:
 	rc = hl_poll_timeout(
 		hdev,
 		pre_fw_load->cpu_boot_status_reg,
@@ -1493,7 +1496,24 @@ int hl_fw_wait_preboot_ready(struct hl_device *hdev)
 		(status == CPU_BOOT_STATUS_READY_TO_BOOT) ||
 		(status == CPU_BOOT_STATUS_WAITING_FOR_BOOT_FIT),
 		hdev->fw_poll_interval_usec,
-		pre_fw_load->wait_for_preboot_timeout);
+		timeout);
+	/*
+	 * if F/W reports "security-ready" it means preboot might take longer.
+	 * If the field 'wait_for_preboot_extended_timeout' is non 0 we wait again
+	 * with that timeout
+	 */
+	preboot_still_runs = (status == CPU_BOOT_STATUS_SECURITY_READY ||
+				status == CPU_BOOT_STATUS_IN_PREBOOT ||
+				status == CPU_BOOT_STATUS_FW_SHUTDOWN_PREP ||
+				status == CPU_BOOT_STATUS_DRAM_RDY);
+
+	if (rc && tries && preboot_still_runs) {
+		tries--;
+		if (pre_fw_load->wait_for_preboot_extended_timeout) {
+			timeout = pre_fw_load->wait_for_preboot_extended_timeout;
+			goto retry;
+		}
+	}
 
 	if (rc) {
 		detect_cpu_boot_status(hdev, status);
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 874ae76cbd78..3c224942a758 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -1410,6 +1410,8 @@ struct dynamic_fw_load_mgr {
  * @boot_err0_reg: boot_err0 register address
  * @boot_err1_reg: boot_err1 register address
  * @wait_for_preboot_timeout: timeout to poll for preboot ready
+ * @wait_for_preboot_extended_timeout: timeout to pull for preboot ready in case where we know
+ *		preboot needs longer time.
  */
 struct pre_fw_load_props {
 	u32 cpu_boot_status_reg;
@@ -1418,6 +1420,7 @@ struct pre_fw_load_props {
 	u32 boot_err0_reg;
 	u32 boot_err1_reg;
 	u32 wait_for_preboot_timeout;
+	u32 wait_for_preboot_extended_timeout;
 };
 
 /**
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 867175431418..35db02e5010b 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -4825,6 +4825,8 @@ static void gaudi2_init_firmware_preload_params(struct hl_device *hdev)
 	pre_fw_load->boot_err0_reg = mmCPU_BOOT_ERR0;
 	pre_fw_load->boot_err1_reg = mmCPU_BOOT_ERR1;
 	pre_fw_load->wait_for_preboot_timeout = GAUDI2_PREBOOT_REQ_TIMEOUT_USEC;
+	pre_fw_load->wait_for_preboot_extended_timeout =
+		GAUDI2_PREBOOT_EXTENDED_REQ_TIMEOUT_USEC;
 }
 
 static void gaudi2_init_firmware_loader(struct hl_device *hdev)
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
index 14e281fd9895..9b9eef0d97d6 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2P.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
@@ -84,6 +84,7 @@
 #define CORESIGHT_TIMEOUT_USEC			100000		/* 100 ms */
 
 #define GAUDI2_PREBOOT_REQ_TIMEOUT_USEC		25000000	/* 25s */
+#define GAUDI2_PREBOOT_EXTENDED_REQ_TIMEOUT_USEC 85000000	/* 85s */
 
 #define GAUDI2_BOOT_FIT_REQ_TIMEOUT_USEC	10000000	/* 10s */
 
-- 
2.34.1

