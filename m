Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B687F75E65A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C51710E21F;
	Mon, 24 Jul 2023 01:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF5810E21F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 01:18:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD3FD60EEF;
 Mon, 24 Jul 2023 01:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3ACC433C8;
 Mon, 24 Jul 2023 01:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161512;
 bh=Gx0A6rJXlbwCqQAX4Gy3l3XZri+JPfTyJS42TR/E9NE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C8KB6mboxgRbRqwcGC1i3Czl4GwNFLtMlN5xdovMtQB7IjyoKuD8FBcP6kH7yuHby
 dFgEvSXo2votroXvzgzDQc8817hAeCJIcyBz330yP6X5tHeEkI13kyMQvZ8z45g8F8
 h8QUj+Q6r0mNOSJf2ZAzGPm8PP6y7QSwhuql/xhcFuddN7dtl5EUshzqMAgd8gIf95
 wYVNqvAqOxlsvl6d2mGyUQIUCrafYZycP+2UBz3JRjkMZjfPnCf9WyMVQiNV2+F8MD
 C4Q4mlauUKRsrT26M6JA70FkzbDRI7gC7LEfz2zM+lC2cWWCB+Pf32N77Zn7O2CAJX
 l8ONtdzg18s3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 31/58] accel/habanalabs: add pci health check
 during heartbeat
Date: Sun, 23 Jul 2023 21:12:59 -0400
Message-Id: <20230724011338.2298062-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
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
Cc: Sasha Levin <sashal@kernel.org>, osharabi@habana.ai, kelbaz@habana.ai,
 Oded Gabbay <ogabbay@kernel.org>, dliberman@habana.ai,
 dri-devel@lists.freedesktop.org, dhirschfeld@habana.ai,
 stanislaw.gruszka@linux.intel.com, ttayar@habana.ai, mhaimovski@habana.ai,
 Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

[ Upstream commit d8b9cea584661b30305cf341bf9f675dc0a25471 ]

Currently upon a heartbeat failure, we don't know if the failure
is due to firmware hang or due to a bad PCI link. Hence, we
are reading a PCI config space register with a known value (vendor ID)
so we will know which of the two possibilities caused the heartbeat
failure.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/habanalabs/common/device.c         | 15 ++++++++++++++-
 drivers/accel/habanalabs/common/habanalabs.h     |  2 ++
 drivers/accel/habanalabs/common/habanalabs_drv.c |  2 --
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index fabfc501ef543..a39dd346a1678 100644
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
index eaae69a9f8178..7f5d1b6e3fb08 100644
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
index d9df64e75f33a..1ec97da3dddb8 100644
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
2.39.2

