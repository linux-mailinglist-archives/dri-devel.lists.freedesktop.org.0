Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8FC7EC8B9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 17:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC2C10E11B;
	Wed, 15 Nov 2023 16:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461B310E0F0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:39:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98B9D6154F;
 Wed, 15 Nov 2023 16:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E81BC433C9;
 Wed, 15 Nov 2023 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700066363;
 bh=hH/MtPMheBE4FRnp6r7JcZVzm3gOuvyKUwNseHulg94=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kVyduxGw7RGktXNcN7T+SGle97iooX2quLtnli9mnVApOKEa8BtmFwngJ42Km8A32
 jARlxlOP9xx6aSCE5ndmrJWMEYasSv0811arbT+bdmSpDodAnf3PY44FCYS+ok/O3b
 uBsOix7P4nF7OBGQtbnE6JD/7+Nfp+SllJcuYjUzKChNuoO8zis+ifrbTAnDBJczU3
 S1M3V2jTYPkMTsMaKM649uBdQJlMDKMR67tlzwYw6BEHvOpnY/fPVRWGq8/Jm/oOeq
 rR4FIwzNS193Ipxn92zAvkqOBH4Pw+anMtS4zxQ7HaTgkYzunzrrN9VD44/l4PDasM
 PZrGVAHbIGckA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] accel/habanalabs: fix EQ heartbeat mechanism
Date: Wed, 15 Nov 2023 18:39:06 +0200
Message-Id: <20231115163912.1243175-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115163912.1243175-1-ogabbay@kernel.org>
References: <20231115163912.1243175-1-ogabbay@kernel.org>
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

Stop rescheduling another heartbeat check when EQ heartbeat check fails
as it generates confusing logs in dmesg that the heartbeat fails.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index d9447aeb3937..6bf5f1d0d005 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1044,20 +1044,21 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
 	return (vendor_id == PCI_VENDOR_ID_HABANALABS);
 }
 
-static void hl_device_eq_heartbeat(struct hl_device *hdev)
+static int hl_device_eq_heartbeat_check(struct hl_device *hdev)
 {
-	u64 event_mask = HL_NOTIFIER_EVENT_DEVICE_RESET | HL_NOTIFIER_EVENT_DEVICE_UNAVAILABLE;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 
 	if (!prop->cpucp_info.eq_health_check_supported)
-		return;
+		return 0;
 
 	if (hdev->eq_heartbeat_received) {
 		hdev->eq_heartbeat_received = false;
 	} else {
 		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
-		hl_device_cond_reset(hdev, HL_DRV_RESET_HARD, event_mask);
+		return -EIO;
 	}
+
+	return 0;
 }
 
 static void hl_device_heartbeat(struct work_struct *work)
@@ -1074,10 +1075,9 @@ static void hl_device_heartbeat(struct work_struct *work)
 	/*
 	 * For EQ health check need to check if driver received the heartbeat eq event
 	 * in order to validate the eq is working.
+	 * Only if both the EQ is healthy and we managed to send the next heartbeat reschedule.
 	 */
-	hl_device_eq_heartbeat(hdev);
-
-	if (!hdev->asic_funcs->send_heartbeat(hdev))
+	if ((!hl_device_eq_heartbeat_check(hdev)) && (!hdev->asic_funcs->send_heartbeat(hdev)))
 		goto reschedule;
 
 	if (hl_device_operational(hdev, NULL))
-- 
2.34.1

