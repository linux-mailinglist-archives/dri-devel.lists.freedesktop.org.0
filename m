Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E20154C05
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 20:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E176FB2D;
	Thu,  6 Feb 2020 19:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0556FB2D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:22:17 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b22so2718809pls.12
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G/o1dkVdis63O63N2c873rQBIRewzQ3u7/jN8zCTufE=;
 b=kUyH4cFikuuvB3CoctZtuPjszhUrjUoOzXd9GvvL9wxJiuQupeL3xug37q5b5RN8/v
 7cOog4DX6CUgFzUh39uLDbg77oHnl+7ajyikQJdVMTH8pee4QGCFfKl3ceH6tPWdWme3
 I9TGYiSVKRQBTyZ9JNlkc1cZMKsm/9dBdgciNsLRXD54/B+49tvk2SYw/a6C/btP+SgU
 T+4rI7njDEoNXFzp0s6sPxnWT++0cfDKI8lcoSZmyAQ9EKIVQT1zXZsni+6DvorRvOfn
 iM/LY6T9i+0P4blufME39eoRBK9Si/CDGWS6ViAr357Zp+/Pzn5Z7+BXeTGevDj2xioz
 PQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G/o1dkVdis63O63N2c873rQBIRewzQ3u7/jN8zCTufE=;
 b=TI3Eq+WQcz555IJBRqtI7NDRmTEQ+WFXu7NyAi/3wGFP3DKvJVUmwfgc0s0HXD0kmD
 esMXGVfyKeLK1TeVi288/xrypv/bzayZn+mk57eCzSk3Fd/Lp9IjqnG7gEwd34LKdl7S
 3X/B2Ppss2g8YLaBjwwLsGX4FiAweDutZswSCxfLlmiMsIaZrzWawPKWZ23yHb6Delrn
 TfSzEtbltLEZgnTrvpUvDQlKrXFy+7xRT2L6Th6GMI5ib1gMfMb4KZIGB4sdfZZPF85E
 wcGO24tESUjXFNflU60JAKhnks7tbQsI9xvzRTgltUwutAphEMK3GkdFoCKJiq3WneEM
 A0/Q==
X-Gm-Message-State: APjAAAU3TcPUL4uXJjh4IgTHnL9cauprZHoUAGRV4E7abydjQTbROM3p
 /OxBCmsa41NYtdLyZOs/sfYLgSSh
X-Google-Smtp-Source: APXvYqxTjaLC93dI5U4oYHax/HtpV0H+LmFtUepWKGpwloa+NfLgEHteBqf/Tf5ljwk4IfjxnseAlg==
X-Received: by 2002:a17:90a:9b88:: with SMTP id
 g8mr6367463pjp.72.1581016936752; 
 Thu, 06 Feb 2020 11:22:16 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id r3sm162840pfg.145.2020.02.06.11.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:22:16 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/virtio: remove the global pending_notify state
Date: Thu,  6 Feb 2020 11:22:13 -0800
Message-Id: <20200206192214.86818-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200206192214.86818-1-olvaffe@gmail.com>
References: <20200206192214.86818-1-olvaffe@gmail.com>
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
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 28 +++++++++++++++++-----------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7e69c06e168ea..0af1724bda390 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -178,7 +178,6 @@ struct virtio_gpu_device {
 	bool vqs_ready;
 
 	bool disable_notify;
-	bool pending_notify;
 
 	struct ida	resource_ida;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 41e475fbd67bf..204b1577a1873 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -364,16 +364,13 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 
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
@@ -436,12 +433,21 @@ void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev)
 
 void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev)
 {
+	struct virtqueue *vq = vgdev->ctrlq.vq;
+	bool notify;
+
 	vgdev->disable_notify = false;
 
-	if (!vgdev->pending_notify)
-		return;
-	vgdev->pending_notify = false;
-	virtqueue_notify(vgdev->ctrlq.vq);
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
 }
 
 static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
