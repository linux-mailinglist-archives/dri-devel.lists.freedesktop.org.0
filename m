Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A201F6F2FF1
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 11:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF3510E25E;
	Mon,  1 May 2023 09:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C31210E223
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 09:48:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58ED160ACF;
 Mon,  1 May 2023 09:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF2BC4339B;
 Mon,  1 May 2023 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682934481;
 bh=qTX/9lCiVwISyLdcD/wOaAxdWt30rB2llfGmYTLEzYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gVU7nZQezkf5psn002TJdw14o6use20M1fV3S7Vv+Leg0HqUaK1f2T+n2LM/wNxIF
 A/48n3EoB3jcQjcy0Npy05/vZ7qOF7EoL6Ht+Abb1SszZc4iFpmTxANrwV4grE165p
 U5KSYC7JqyHgQeMkfZqcFIg0WcrJAyzDabg9LdCA1cnuuazwhzhu7yB3ZxfJL/FUdn
 rPWsjohohQzgkeryZEXCYalqiyefDv015oOIv70W7xjg0DG7jDffIbjSuIdHht5yP4
 MIpzlxbPpaRE/OayHItKY97yXeCnwf0IBt4IvUMPVvsLpXXO3ViFFGuVpT77bu44Zv
 0Mj0K70ZOoQdQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] accel/habanalabs: add pci health check during heartbeat
Date: Mon,  1 May 2023 12:47:50 +0300
Message-Id: <20230501094754.100030-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501094754.100030-1-ogabbay@kernel.org>
References: <20230501094754.100030-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

Currently upon a heartbeat failure, we don't know if the failure
is due to firmware hang or due to a bad PCI link. Hence, we
are reading a PCI config space register with a known value (vendor ID)
so we will know which of the two possibilities caused the heartbeat
failure.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c         | 15 ++++++++++++++-
 drivers/accel/habanalabs/common/habanalabs.h     |  2 ++
 drivers/accel/habanalabs/common/habanalabs_drv.c |  2 --
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index c8f4a34d2831..98b46b2e1898 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -981,6 +981,18 @@ static void device_early_fini(struct hl_device *hdev)
 		hdev->asic_funcs->early_fini(hdev);
 }
 
+static bool is_pci_link_healthy(struct hl_device *hdev)
+{
+	u16 vendor_id;
+
+	if (!hdev->pdev)
+		return false;
+
+	pci_read_config_word(hdev->pdev, PCI_VENDOR_ID, &vendor_id);
+
+	return (vendor_id == PCI_VENDOR_ID_HABANALABS);
+}
+
 static void hl_device_heartbeat(struct work_struct *work)
 {
 	struct hl_device *hdev = container_of(work, struct hl_device,
@@ -995,7 +1007,8 @@ static void hl_device_heartbeat(struct work_struct *work)
 		goto reschedule;
 
 	if (hl_device_operational(hdev, NULL))
-		dev_err(hdev->dev, "Device heartbeat failed!\n");
+		dev_err(hdev->dev, "Device heartbeat failed! PCI link is %s\n",
+			is_pci_link_healthy(hdev) ? "healthy" : "broken");
 
 	info.err_type = HL_INFO_FW_HEARTBEAT_ERR;
 	info.event_mask = &event_mask;
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index f83ea96c6530..ad412cc01aba 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -36,6 +36,8 @@
 struct hl_device;
 struct hl_fpriv;
 
+#define PCI_VENDOR_ID_HABANALABS	0x1da3
+
 /* Use upper bits of mmap offset to store habana driver specific information.
  * bits[63:59] - Encode mmap type
  * bits[45:0]  - mmap offset value
diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index a4b3f50f1cba..ea80638fc6b9 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -54,8 +54,6 @@ module_param(boot_error_status_mask, ulong, 0444);
 MODULE_PARM_DESC(boot_error_status_mask,
 	"Mask of the error status during device CPU boot (If bitX is cleared then error X is masked. Default all 1's)");
 
-#define PCI_VENDOR_ID_HABANALABS	0x1da3
-
 #define PCI_IDS_GOYA			0x0001
 #define PCI_IDS_GAUDI			0x1000
 #define PCI_IDS_GAUDI_SEC		0x1010
-- 
2.40.1

