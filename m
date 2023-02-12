Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667F16939F7
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C9110E47C;
	Sun, 12 Feb 2023 20:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3CB10E474
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02ACA60DD5;
 Sun, 12 Feb 2023 20:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817B1C433A0;
 Sun, 12 Feb 2023 20:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234739;
 bh=giErPGiLTtQ+sjk3kI4pfFHdlj6NmP7zKK9NUj4qDlY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CuRmtuaH54fePchtXSIDBtWFM9uvH3Pc6puJmB9E4ySmfEJpfzEu90ORvKC5hhhp8
 HBKOyK4MVUnaGvgODA9trQ5pioVjVh/OihSGTdNjqfiqp/EfNGPnKXB7XwjNYoDNiX
 V/SuGo277HFODDInlAR46963oAbRqquFyDkN2RWQYrJHOfOqaeP0eqhoKV2kNQTQXN
 3MwQNoV2NQkVjE+uy1aseuJ5ydvc5h5pcd+Hb3Ep0VdpOaV09EJKo67hiCLLbvSEiG
 pKHJopAojhB78G55PujuzOjTCx/IycsCOM1EMeLiBjWGcMPkNXGJtKmReG/+RAe91N
 ufYwnYGtKVU7g==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 23/27] habanalabs: tiny refactor of hl_device_reset for
 readability
Date: Sun, 12 Feb 2023 22:44:50 +0200
Message-Id: <20230212204454.2938561-23-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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

Align assignment of reset_upon_device_release to the convention used
in this function.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 2d496cd935b2..0e405e4c4b32 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1475,7 +1475,7 @@ static void handle_reset_trigger(struct hl_device *hdev, u32 flags)
 int hl_device_reset(struct hl_device *hdev, u32 flags)
 {
 	bool hard_reset, from_hard_reset_thread, fw_reset, hard_instead_soft = false,
-			reset_upon_device_release = false, schedule_hard_reset = false,
+			reset_upon_device_release, schedule_hard_reset = false,
 			delay_reset, from_dev_release, from_watchdog_thread;
 	u64 idle_mask[HL_BUSY_ENGINES_MASK_EXT_SIZE] = {0};
 	struct hl_ctx *ctx;
@@ -1492,6 +1492,7 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 	from_dev_release = !!(flags & HL_DRV_RESET_DEV_RELEASE);
 	delay_reset = !!(flags & HL_DRV_RESET_DELAY);
 	from_watchdog_thread = !!(flags & HL_DRV_RESET_FROM_WD_THR);
+	reset_upon_device_release = hdev->reset_upon_device_release && from_dev_release;
 
 	if (!hard_reset && (hl_device_status(hdev) == HL_DEVICE_STATUS_MALFUNCTION)) {
 		dev_dbg(hdev->dev, "soft-reset isn't supported on a malfunctioning device\n");
@@ -1503,15 +1504,13 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 		hard_reset = true;
 	}
 
-	if (hdev->reset_upon_device_release && from_dev_release) {
+	if (reset_upon_device_release) {
 		if (hard_reset) {
 			dev_crit(hdev->dev,
 				"Aborting reset because hard-reset is mutually exclusive with reset-on-device-release\n");
 			return -EINVAL;
 		}
 
-		reset_upon_device_release = true;
-
 		goto do_reset;
 	}
 
-- 
2.25.1

