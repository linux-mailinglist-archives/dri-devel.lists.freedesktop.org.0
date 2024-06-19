Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB7590E37D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BD510E909;
	Wed, 19 Jun 2024 06:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="MnY6i1PS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C2C10E8FB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:34:44 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718778884; bh=5ump6eTLOwqBw/KiRuccbtl0IWfZ6Ud4eHUp0djojrs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MnY6i1PSqvaA9TQQuARbAu1bYcyotWLFA2uZ3I9aZP3TrCP1jPAJxdkA+9PNjAOsR
 a8s7Ap7CNLGGtLCAHfF4x2xYBA+2/vqgNg+/tqKKgt5W0FbJrBKDuGiUmnUuA6H60S
 ywqNoCELtYlEQc3TgY9HJORW568ZjE/06PcLRKMFMWrumDgt6L9tP+hEuXAguIUGgG
 768m2EKncDYnwCIbLCXACgZVC+ubkUODpQDYga4m5AlPTN1vrUy0Q0T7p3mzmN/Yc0
 rQhMs9kJ3xkn+xRtaXxr8eI5u/M2aRqPRDRBdlOLQAD7T1iyykv0G7uxcEb0FmVRfg
 7NMUWLU8+Xzqw==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 45J6YQB41377354; Wed, 19 Jun 2024 09:34:33 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Farah Kassabri <fkassabri@habana.ai>
Subject: [PATCH 4/9] accel/habanalabs: add more info upon cpu pkt timeout
Date: Wed, 19 Jun 2024 09:34:20 +0300
Message-Id: <20240619063425.1377327-4-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619063425.1377327-1-obitton@habana.ai>
References: <20240619063425.1377327-1-obitton@habana.ai>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Farah Kassabri <fkassabri@habana.ai>

In order to have better debuggability upon encountering FW issues,
We are adding additional info once CPU packet timeout expires.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/firmware_if.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 6f0c40b12072..3cd8a1f69980 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -460,11 +460,19 @@ int hl_fw_send_cpu_message(struct hl_device *hdev, u32 hw_queue_id, u32 *msg,
 		/* If FW performed reset just before sending it a packet, we will get a timeout.
 		 * This is expected behavior, hence no need for error message.
 		 */
-		if (!hl_device_operational(hdev, NULL) && !hdev->reset_info.in_compute_reset)
+		if (!hl_device_operational(hdev, NULL) && !hdev->reset_info.in_compute_reset) {
 			dev_dbg(hdev->dev, "Device CPU packet timeout (0x%x) due to FW reset\n",
 					tmp);
-		else
-			dev_err(hdev->dev, "Device CPU packet timeout (status = 0x%x)\n", tmp);
+		} else {
+			struct hl_bd *bd = queue->kernel_address;
+
+			bd += hl_pi_2_offset(queue->pi);
+
+			dev_err(hdev->dev, "Device CPU packet timeout (status = 0x%x)\n"
+					"Pkt info: dma_addr: 0x%llx, kernel_addr: %p, len:0x%x, ctl: 0x%x, ptr:0x%llx, dram_bd:%u\n",
+					tmp, pkt_dma_addr, (void *)pkt, bd->len, bd->ctl, bd->ptr,
+					queue->dram_bd);
+		}
 		hdev->device_cpu_disabled = true;
 		goto out;
 	}
-- 
2.34.1

