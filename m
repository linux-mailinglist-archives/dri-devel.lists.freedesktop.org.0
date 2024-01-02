Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766B9821E49
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 16:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D6310E1B5;
	Tue,  2 Jan 2024 15:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9515410E1B5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 15:07:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E591960FB9;
 Tue,  2 Jan 2024 15:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9A8C433C7;
 Tue,  2 Jan 2024 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704208020;
 bh=G/yeMzSU+JFZOgE81eouKJsysPfDu7kxpb8J125k16Y=;
 h=From:To:Cc:Subject:Date:From;
 b=mUVzo72Imn03zBMvWwvM+Vip2RYb+XW6etshLoNmcZKrAbCYVnNEet6b3zU71MKvl
 bsOYiQGGswJw861qdjwb1fuleljWPXT16PXzanXcdZp1t/uJqWLB0CfvN3rVJ4FLNe
 9/vH9zt3rWfSdRv2aEh8XoC1OdM0P9zikrD3bhH+UesI8EB3EwlacXzO9fx1a4RloA
 51qqnp7NHIPZ23UxgcmJT03W3PT2oxh+tcFCQNbztta1esIp5y4zy8e2y0RAXc+jk4
 7ll9+NzO41h4B3ZmLiGJ7WXJSviGTLAkoLS/8EcfKI+V0Ec/VvNtw8SrtKip1vYF4W
 MhSKWDh0StRJw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] accel/habanalabs: check failure of eventfd_signal
Date: Tue,  2 Jan 2024 17:06:49 +0200
Message-Id: <20240102150654.522555-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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

print err log if eventfd_signal return val is not 1 as expected.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index a365791a9f5c..e81ccafddfb3 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2043,13 +2043,19 @@ int hl_device_cond_reset(struct hl_device *hdev, u32 flags, u64 event_mask)
 	return hl_device_reset(hdev, flags | HL_DRV_RESET_HARD);
 }
 
-static void hl_notifier_event_send(struct hl_notifier_event *notifier_event, u64 event_mask)
+static void hl_notifier_event_send(struct hl_device *hdev,
+			struct hl_notifier_event *notifier_event, u64 event_mask)
 {
+	u64 n;
+
 	mutex_lock(&notifier_event->lock);
 	notifier_event->events_mask |= event_mask;
 
-	if (notifier_event->eventfd)
-		eventfd_signal(notifier_event->eventfd, 1);
+	if (notifier_event->eventfd) {
+		n = eventfd_signal(notifier_event->eventfd, 1);
+		if (n != 1)
+			dev_err(hdev->dev, "eventfd signal failed, incremented by %llu\n", n);
+	}
 
 	mutex_unlock(&notifier_event->lock);
 }
@@ -2073,7 +2079,7 @@ void hl_notifier_event_send_all(struct hl_device *hdev, u64 event_mask)
 	mutex_lock(&hdev->fpriv_list_lock);
 
 	list_for_each_entry(hpriv, &hdev->fpriv_list, dev_node)
-		hl_notifier_event_send(&hpriv->notifier_event, event_mask);
+		hl_notifier_event_send(hdev, &hpriv->notifier_event, event_mask);
 
 	mutex_unlock(&hdev->fpriv_list_lock);
 }
-- 
2.34.1

