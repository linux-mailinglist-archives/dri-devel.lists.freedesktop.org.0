Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30091728181
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A99910E5B5;
	Thu,  8 Jun 2023 13:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A4310E5B5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:38:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EE7C63C24;
 Thu,  8 Jun 2023 13:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF78C433EF;
 Thu,  8 Jun 2023 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686231534;
 bh=pLSnDM48gI3wCeowijVY1uBrUUQN0ZfedCJxGcz+reI=;
 h=From:To:Cc:Subject:Date:From;
 b=QdHrlSCYZ/RwvjKGYig0Rdzd6JX12ibJQaggE3P6I3wRg0bCxtIQ7SlJcIp2TlDik
 j4BWHrT4LSQcQuO/fApAk8YO6tv5gxIeXMPVlnAqHPeiq3ICaQs+Qi7OHmeUl44BFm
 3rlIRXGuGIDSxpyt4D3d7858IiIcNYFxXGUktLO20GecwJob/9DIxYf+A9GDX7CPT8
 AGiii4E+jwTgiAg21M71sTSCZdkHg19ZwF6p5qjyYb9Iw+uYXydaXjHlmJeGrSTCEz
 pB0OZSSDpURs+DiP6j5VtFVvSPpuTaGN7VDcKR8OSXCeaCSNoLWB852HnBCtwk5PNQ
 OelqhPe284E1g==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/12] accel/habanalabs: prevent immediate hard reset due to 2
 adjacent H/W events
Date: Thu,  8 Jun 2023 16:38:38 +0300
Message-Id: <20230608133849.2739411-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

When a H/W event is received while a user is registered to events, no
immediate hard reset will happen, and instead the user will be notified
and will have some time to handle it and eventually release the
device, after which the reset will be done.
If a user, as part of the handling and as part of the cleanup steps
towards releasing the device, unregisters from receiving those events,
and at that time an adjacent H/W event is received, it will be assumed
that the user is not registered to events and thus an immediate hard
reset is required.

To prevent such an unwanted immediate reset, modify the driver to
perform it if the user is not registered to events AND we don't already
have a pending reset for a previous H/W event.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index b97339d1f7c6..1e61e79c42e5 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1916,7 +1916,16 @@ int hl_device_cond_reset(struct hl_device *hdev, u32 flags, u64 event_mask)
 	}
 
 	ctx = hl_get_compute_ctx(hdev);
-	if (!ctx || !ctx->hpriv->notifier_event.eventfd)
+	if (!ctx)
+		goto device_reset;
+
+	/*
+	 * There is no point in postponing the reset if user is not registered for events.
+	 * However if no eventfd_ctx exists but the device release watchdog is already scheduled, it
+	 * just implies that user has unregistered as part of handling a previous event. In this
+	 * case an immediate reset is not required.
+	 */
+	if (!ctx->hpriv->notifier_event.eventfd && !hdev->reset_info.watchdog_active)
 		goto device_reset;
 
 	/* Schedule the device release watchdog work unless reset is already in progress or if the
-- 
2.40.1

