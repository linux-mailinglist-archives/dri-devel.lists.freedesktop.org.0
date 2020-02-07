Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7207F156110
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 23:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8426E129;
	Fri,  7 Feb 2020 22:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0DD6FDD5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 22:14:05 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id j4so496058pgi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 14:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9DoniFgOsba35P22TkUkSubfYRoGPlLL/6X6QFgtqrI=;
 b=Oq85KJV8yEreLCgRn5kjJYL/gZBDXmOww51kAYuOHVuEcp/HGukBQdHq/h41onZyyp
 j1DEQeU66frfcGY7KzBHsO+fYH1EEtSC+tayHNEoGeC62WDSDsTyLIxRSQoCfjiILxTZ
 OYlOKKeT1Wq6SFCj8JEJGE22JpNMa7bj/bJnLHMPkKKZPQJPiAvVWAJE0WX3coKVf6xj
 Bh5DpmK81F1N868TJWU4o9p7/9ofth88DoyQ9+vltXo0tEosBhZVBjVRSLVJHLUH0hX+
 hLNJruTRkgteRdSjosaUjY5PZmbESq3C1TJyoCrtOzdjtLgN87mMF+45uuGRgQeOqbqq
 1m4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9DoniFgOsba35P22TkUkSubfYRoGPlLL/6X6QFgtqrI=;
 b=fEHbIeVANDyDvJG+555beZVZg27OtB5GpIxEbTz8ewQNhYETTEGbLkGc3M3ZXkBeld
 K+QNyV7csQcCfUQ0fZhmZ1gNa2RF4x/m69Zrd61iSzCaYWLeBCEyIwhNQaJjj51T1Mh8
 3slzvzoz3W5wsR/Fq0blYTlIXjy3la257lcRvSrrO5PaZpFG7jGAJDZ+POLK6uPHqBDK
 Fc/M/JE71e64ylAgV9HSjp09j1WMIV881Yhn3FO6d6fh311I0Z2fNeBd7ylRmnBYkTpf
 nz9pI3liqj3iEFTnwAOrqu5GoEwCVgjO4SYryMpRpFW0FvbPBwsUHsJ1lj8RVXu/uwZN
 /gvw==
X-Gm-Message-State: APjAAAVDzR5fu2ycMBGaztTXJMVMopnzq2vMFbbgcEJNLf28FE5cJZHl
 klYZy9vLc9EgRQB2xIebd6PloVFD
X-Google-Smtp-Source: APXvYqzov+5sayAgWVBuBm4liW9aUVN730zu4aVg70v4uI7ACdghpDbQkZqzM0Jh/pPxE2rI/tAreQ==
X-Received: by 2002:a63:e54c:: with SMTP id z12mr1276708pgj.415.1581113643935; 
 Fri, 07 Feb 2020 14:14:03 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id t65sm3899043pfd.178.2020.02.07.14.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 14:14:02 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/virtio: remove the global pending_notify state
Date: Fri,  7 Feb 2020 14:13:57 -0800
Message-Id: <20200207221359.187340-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207221359.187340-1-olvaffe@gmail.com>
References: <20200206192214.86818-1-olvaffe@gmail.com>
 <20200207221359.187340-1-olvaffe@gmail.com>
MIME-Version: 1.0
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
Cc: kraxel@redhat.com, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call virtqueue_kick_prepare once in virtio_gpu_enable_notify, not
whenever a command is added.  This should be more efficient since
the intention is to batch commands.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h |  1 -
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 34 ++++++++++++++++++----------
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d278c8c50f394..d3fcc25068132 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -178,7 +178,6 @@ struct virtio_gpu_device {
 	bool vqs_ready;
 
 	bool disable_notify;
-	bool pending_notify;
 
 	struct ida	resource_ida;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index cc02fc4bab2a5..0c9be2142ba1a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -367,16 +367,13 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 
 	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf));
 
-	notify = virtqueue_kick_prepare(vq);
+	if (!vgdev->disable_notify)
+		notify = virtqueue_kick_prepare(vq);
 
 	spin_unlock(&vgdev->ctrlq.qlock);
 
-	if (notify) {
-		if (vgdev->disable_notify)
-			vgdev->pending_notify = true;
-		else
-			virtqueue_notify(vq);
-	}
+	if (notify)
+		virtqueue_notify(vq);
 }
 
 static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
@@ -432,6 +429,23 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	}
 }
 
+static void virtio_gpu_commit_ctrl(struct virtio_gpu_device *vgdev)
+{
+	struct virtqueue *vq = vgdev->ctrlq.vq;
+	bool notify;
+
+	spin_lock(&vgdev->ctrlq.qlock);
+	notify = virtqueue_kick_prepare(vq);
+	spin_unlock(&vgdev->ctrlq.qlock);
+
+	/* Do not call virtqueue_notify with the lock held because
+	 * virtio_gpu_dequeue_ctrl_func may contend for the lock if an irq is
+	 * generated while we are in virtqueue_notify.
+	 */
+	if (notify)
+		virtqueue_notify(vq);
+}
+
 void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev)
 {
 	vgdev->disable_notify = true;
@@ -440,11 +454,7 @@ void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev)
 void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev)
 {
 	vgdev->disable_notify = false;
-
-	if (!vgdev->pending_notify)
-		return;
-	vgdev->pending_notify = false;
-	virtqueue_notify(vgdev->ctrlq.vq);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
