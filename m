Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F617A459A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD94110E22D;
	Mon, 18 Sep 2023 09:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE19D10E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 04E6260B32;
 Mon, 18 Sep 2023 09:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53616C433C7;
 Mon, 18 Sep 2023 09:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028412;
 bh=Lajnt7mV35ksl0/tTunQMF5VIdd1qJ8xz+Rqy63owcI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nm5W3YwaVhlJNL+T0XmAIhqO+kqpxD/Z4pPl0TpQ+R7OkDSJIkY/KLyglWPGZUL0m
 Q9JhaTzMQVpfvJTfJeEM/LnqMhR8VYrzaWwnCImVSoarabeEgyk+WVhrotR38HH8dK
 mLbIa2ZZY9XskHZSzAyGockL+3buJTVKqztS1zyTrcflFz79OCi8YmZpxFu9KS9MjX
 vQ8Sow5lVvbufESx8a9cbo7sGsJfYUzoDBiI+vq3/pzB2Fr9maslnIOmiTignoW7XV
 WukUgoM9tYCoP66t/Ys09KxRbMpXgfC4rc4XnBWP7z45ql0kuD5Fy+MtDfYUMzottj
 ZGq1NZnGT6rvg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/14] accel/habanalabs: disable events ioctls on control
 device
Date: Mon, 18 Sep 2023 12:13:11 +0300
Message-Id: <20230918091321.855943-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918091321.855943-1-ogabbay@kernel.org>
References: <20230918091321.855943-1-ogabbay@kernel.org>
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

Because it is not used and also, for graceful reset to work
those ioctls should run on the compute device.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c           | 13 -------------
 drivers/accel/habanalabs/common/habanalabs_drv.c   |  1 -
 drivers/accel/habanalabs/common/habanalabs_ioctl.c | 11 +++++++++++
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 5293ac3c7988..2d12c197e165 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -572,11 +572,6 @@ static int hl_device_release_ctrl(struct inode *inode, struct file *filp)
 	list_del(&hpriv->dev_node);
 	mutex_unlock(&hdev->fpriv_ctrl_list_lock);
 out:
-	/* release the eventfd */
-	if (hpriv->notifier_event.eventfd)
-		eventfd_ctx_put(hpriv->notifier_event.eventfd);
-
-	mutex_destroy(&hpriv->notifier_event.lock);
 	put_pid(hpriv->taskpid);
 
 	kfree(hpriv);
@@ -1995,14 +1990,6 @@ void hl_notifier_event_send_all(struct hl_device *hdev, u64 event_mask)
 		hl_notifier_event_send(&hpriv->notifier_event, event_mask);
 
 	mutex_unlock(&hdev->fpriv_list_lock);
-
-	/* control device */
-	mutex_lock(&hdev->fpriv_ctrl_list_lock);
-
-	list_for_each_entry(hpriv, &hdev->fpriv_ctrl_list, dev_node)
-		hl_notifier_event_send(&hpriv->notifier_event, event_mask);
-
-	mutex_unlock(&hdev->fpriv_ctrl_list_lock);
 }
 
 /*
diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index 5db9af7e2daf..306a5bc9bf89 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -296,7 +296,6 @@ int hl_device_open_ctrl(struct inode *inode, struct file *filp)
 	hpriv->hdev = hdev;
 	filp->private_data = hpriv;
 
-	mutex_init(&hpriv->notifier_event.lock);
 	nonseekable_open(inode, filp);
 
 	hpriv->taskpid = get_task_pid(current, PIDTYPE_PID);
diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 87a6a0c0c48a..8c3f1e2de2fe 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -1104,6 +1104,17 @@ int hl_info_ioctl(struct drm_device *ddev, void *data, struct drm_file *file_pri
 
 static int hl_info_ioctl_control(struct hl_fpriv *hpriv, void *data)
 {
+	struct hl_info_args *args = data;
+
+	switch (args->op) {
+	case HL_INFO_GET_EVENTS:
+	case HL_INFO_UNREGISTER_EVENTFD:
+	case HL_INFO_REGISTER_EVENTFD:
+		return -EOPNOTSUPP;
+	default:
+		break;
+	}
+
 	return _hl_info_ioctl(hpriv, data, hpriv->hdev->dev_ctrl);
 }
 
-- 
2.34.1

