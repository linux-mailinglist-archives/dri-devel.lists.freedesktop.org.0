Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129528CFF78
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 13:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1461310F3E5;
	Mon, 27 May 2024 11:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="ZWxkJoC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E13B10E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 11:58:37 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716810491; bh=skli1maWV7RuxoutTeWI++XUj41hbSG5WqGmRBrwHVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZWxkJoC4sAYc0xew2L8bxOcsSYTawBA+p2xmt160CFhFpEV80wd9yZjlHduz3i9Aa
 R8bEZC308umaI4aZs5wXmXycq9xriY906re7TEi9suXuAL73Gt1q091apESoTlSTbp
 PPKk49l+WrpKFyd8KHWqRsaloRYQL29YjIn0EPegHkS30nM99UbDY+pp9yv0cNdGeG
 QNAGS8vZUUONU19QPml3YrcaYMCS9hb0pHgXeGz0ckIcnVNKOYVKjJ91GdcuRARnKg
 gn7+kw2B9h/kwJQ7oUSlIogpMcgQ/Ze2eozAY6bxK46gIgLSUaKbTPh53wP+0Q2Jgb
 7rnRVibJENO8g==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RBltNh1919357; Mon, 27 May 2024 14:47:55 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Ohad Sharabi <osharabi@habana.ai>
Subject: [PATCH 3/9] accel/habanalabs: restructure function that checks
 heartbeat received
Date: Mon, 27 May 2024 14:47:40 +0300
Message-Id: <20240527114746.1919292-3-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527114746.1919292-1-obitton@habana.ai>
References: <20240527114746.1919292-1-obitton@habana.ai>
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

From: Ohad Sharabi <osharabi@habana.ai>

The function returned an error code which isn't propagated up the stack
(nor is it printed).

The return value is only checked for =0 or !=0 which implies bool return
value.

The function signature is updated accordingly, renamed, and slightly
refactored.

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index a381ece25592..eee41c367bd1 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1048,21 +1048,21 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
 	return (device_id == hdev->pdev->device);
 }
 
-static int hl_device_eq_heartbeat_check(struct hl_device *hdev)
+static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
 {
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 
 	if (!prop->cpucp_info.eq_health_check_supported)
-		return 0;
+		return true;
 
-	if (hdev->eq_heartbeat_received) {
-		hdev->eq_heartbeat_received = false;
-	} else {
+	if (!hdev->eq_heartbeat_received) {
 		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
-		return -EIO;
+		return false;
 	}
 
-	return 0;
+	hdev->eq_heartbeat_received = false;
+
+	return true;
 }
 
 static void hl_device_heartbeat(struct work_struct *work)
@@ -1081,7 +1081,7 @@ static void hl_device_heartbeat(struct work_struct *work)
 	 * in order to validate the eq is working.
 	 * Only if both the EQ is healthy and we managed to send the next heartbeat reschedule.
 	 */
-	if ((!hl_device_eq_heartbeat_check(hdev)) && (!hdev->asic_funcs->send_heartbeat(hdev)))
+	if (hl_device_eq_heartbeat_received(hdev) && (!hdev->asic_funcs->send_heartbeat(hdev)))
 		goto reschedule;
 
 	if (hl_device_operational(hdev, NULL))
-- 
2.34.1

