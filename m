Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EDA72C3AA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 14:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A0A10E010;
	Mon, 12 Jun 2023 12:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C896F10E010
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:07:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C6076155B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639B9C433D2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686571658;
 bh=TkEy6k+aGbSjO6yAnZdhkixIjar1l/3aEPGHti2HxHc=;
 h=From:To:Subject:Date:From;
 b=f0WAaemvqilNnz49q7Tktuje/hY/HPj/n5XkF1/Am95W+73JEkPbLbaSasUoH3GQ1
 q/leGSSY0VR9tyVWoaJSr/XoWbF6AyE8Or+A6gA9AxsJd5kv+4lK115WmDifHO/pX/
 3ah2m76CnVG7YP04ovxnVtH5tiBwh6D+tX81WWtuHsNsp9VuPVwpz1/4lmmhC+Tj0Z
 aIjzBbWYnlCUhlq8ZQjBgbth269ljg/YOQiAaVzGqvYtspZt0a7AtZ3oHW2MwKsr75
 1YXZWYtBmjtHtOZVmkQJjZcrut92/AmaCuy3iMIo20IS5IqUP5yUJMXKqosVmBp4f/
 XzUKdN0wgA16Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] accel/habanalabs: remove pdev check on idle check
Date: Mon, 12 Jun 2023 15:07:31 +0300
Message-Id: <20230612120733.3079507-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
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

Our simulator supports idle check so no need anymore to check if pdev
exists.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 0d02f1f7b994..5e61761b8c11 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -424,7 +424,7 @@ static void hpriv_release(struct kref *ref)
 	/* Check the device idle status and reset if not idle.
 	 * Skip it if already in reset, or if device is going to be reset in any case.
 	 */
-	if (!hdev->reset_info.in_reset && !reset_device && hdev->pdev && !hdev->pldm)
+	if (!hdev->reset_info.in_reset && !reset_device && !hdev->pldm)
 		device_is_idle = hdev->asic_funcs->is_device_idle(hdev, idle_mask,
 							HL_BUSY_ENGINES_MASK_EXT_SIZE, NULL);
 	if (!device_is_idle) {
-- 
2.40.1

