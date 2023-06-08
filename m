Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE208728182
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB3F10E5BC;
	Thu,  8 Jun 2023 13:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AEA10E5B5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:38:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE69F615C6;
 Thu,  8 Jun 2023 13:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77892C4339B;
 Thu,  8 Jun 2023 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686231536;
 bh=mOlbTkDwyB+4/Q/+Yy1kHQOljI7tE3g8StidJZ/Wurc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uCxHByDgGE05DMg4lS5f+OyK/rRf9XxC2r1AOn/O6GBKmcxmKPHkGSb43yI5PXfHq
 bw1Rg2Ckd2YTkeA4hob8ZF5GLA1sVqqer3eu7beyIk/JXpfey1ajd3MnpfDeBq2wWD
 w4FlfW685UohaC83YyGYtdUFEwYst5xoOHNryRBZ5/j1nFoP6vnKPY9SRWPZu20P9S
 nFabVp3+ejd5WiTpz2d85UXo/v44liHH1mHQWDDp2IkWkwYSc0lTJ0NWn+mJ0pjD0p
 zW6+b0MQUvfqIVXy6KnTHXigCJTppK1X0BoZoR5BcXE+/Y4RSEWrEJuuVvLlt79Oz+
 IZCftGewE00Vg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/12] accel/habanalabs: update pending reset flags with new
 reset requests
Date: Thu,  8 Jun 2023 16:38:39 +0300
Message-Id: <20230608133849.2739411-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608133849.2739411-1-ogabbay@kernel.org>
References: <20230608133849.2739411-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

If hl_device_cond_reset() is called while a reset is already pending but
hasn't started, the reset request will be dropped.
If the flags of the new request are more severe, e.g. a hard reset while
the pending reset is a compute reset, the eventual reset won't be
suitable for the device status.

To prevent such cases, update the pending reset flags with the new
requests flags before the requests are dropped.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 1e61e79c42e5..993305871292 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1937,8 +1937,10 @@ int hl_device_cond_reset(struct hl_device *hdev, u32 flags, u64 event_mask)
 		goto device_reset;
 	}
 
-	if (hdev->reset_info.watchdog_active)
+	if (hdev->reset_info.watchdog_active) {
+		hdev->device_release_watchdog_work.flags |= flags;
 		goto out;
+	}
 
 	hdev->device_release_watchdog_work.flags = flags;
 	dev_dbg(hdev->dev, "Device is going to be hard-reset in %u sec unless being released\n",
-- 
2.40.1

