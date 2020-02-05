Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94E153775
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF766F926;
	Wed,  5 Feb 2020 18:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4B86F924
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:20:18 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id j7so1219547plt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HCUksZDKsyiRackGGI1q2bb6B3864G8jYGwVQTnYIsI=;
 b=GnIdRWwMAPHcTVMhCUvJ5vfA3UIZeryzVrmT7S/n9yvlUX2+vE8FAoEb4OHww6AuTq
 TQ0dmTD3d08Ckl3UAsnRjSzjqEF3OQMNFtFU5a1nQApPlMtlTWkVCWZCA02RdVK8MAvS
 SP8uF9cI9245mH0vcx1idpC8MV2kX52b8XCKDJ8r7pDw8ImWTuNJVMLx998XO6gxDUdf
 wrbngJo4UlwqYp/o5U7M7Ly79nXPVq/lMzCk4lh0BirlflxRdqrGwsIUbNBUyPX3Uy0O
 q0pp+1OR0SEQ+Sp7oJAW1CTtnx7upYbCnn5DSL7yjgF3Dbg24pJk3mV9FEmK2mZhOXPa
 sHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HCUksZDKsyiRackGGI1q2bb6B3864G8jYGwVQTnYIsI=;
 b=rHuyVV43DhgY3ae5pzUWVqkPzZJLdOrgxC1ZGvwlnVUfEp2njIqAU2u8S7wzmi/48z
 BTKO55AFNUM9P3TCcp9wamTKbBwczay7Ip2mIZa0lR8+U7clugrc+lcmXCfgK6niYsn8
 MGhBx6ODf8hDk04oeABkKwHFIPKLhwf5b1hHnQeCxac55C+0jc4ARvZRXNf6+7+2TRcP
 Nu/AdiYwc+1HwdGoIDMcumIzIgkIx44viA7BGRGdJsQvLt53Ybl5EfuXdV2YXsH6Y8oO
 3gQx8n8X4w8YBp0hIUJwbjeE/6ii6ZGh9eeReXx+rsma/5290xv5FEkCD6PNEPMI5oVN
 lOFQ==
X-Gm-Message-State: APjAAAUUT1jF0mun8+JOTblelKHpgwmUQtYugdfFNneuxhBJseA9hZiZ
 9utVnizCTI7IQfGBUNPBGhIYdYWf
X-Google-Smtp-Source: APXvYqwn3Qc/6f0O4CAgOzwTSlpHR+Bq0NYmvqqUWkkUn5DvU0KFCSk7cPnj4EZRjMCxEACtCJ9e5Q==
X-Received: by 2002:a17:90a:191:: with SMTP id 17mr7142645pjc.88.1580926817712; 
 Wed, 05 Feb 2020 10:20:17 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:20:17 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/11] drm/virtio: rework virtio_gpu_enable_notify
Date: Wed,  5 Feb 2020 10:19:55 -0800
Message-Id: <20200205181955.202485-12-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200205181955.202485-1-olvaffe@gmail.com>
References: <20200205181955.202485-1-olvaffe@gmail.com>
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
index f7520feb39d4b..f0e7130ac9e27 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -179,7 +179,6 @@ struct virtio_gpu_device {
 	bool vqs_ready;
 
 	bool disable_notify;
-	bool pending_notify;
 
 	struct ida	resource_ida;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 0961475e68105..aea1be68e99c4 100644
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
