Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C47153772
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DDC6F925;
	Wed,  5 Feb 2020 18:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7F46F91F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:20:15 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 2so1608343pfg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IXuYS8x0SfcLd26IJJ54TWYfxysAwotI9/Qd09g7qPU=;
 b=HGVvJHVPXxjDsqNmoL91fvH84Dk8WUH5HgyNiEQYFjPb+yGR0GMUMTNxnRUla4f0Pt
 Os+m7QSBQweH42y3J/OC1cuhlnToI0WM3KVqlMTg2B1sOQBP5CHs+NC2yMfMRhs1vLUK
 VGmBIRgT3W4i2OST8HB/hw7SrSgM2W3D+sO8b8MZ/w3zi4EiF6SmrzmF1bnpLjnCV2Kr
 8biGifRRlxZCQYI8TQGWHbHWX9cmrudxvpLmH7rYg0D9KE5hVuGEnJPB/ISeDT1HISc1
 6MNppz/XJBSN1JgcQ2KCl71euz/8+L+vjRvX3PT2E8CdtdbV5hZZAaG52ttoq7BZA/sz
 JeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IXuYS8x0SfcLd26IJJ54TWYfxysAwotI9/Qd09g7qPU=;
 b=h07jr4QWuwGkRBLaZ4jyAKK306oxooV2MZbYVvW0Qx+nM78sv/jIqC9+jewDL/B10T
 ImD3B4yx3IWCRM7DhVX9VPuCofCM6p2kzI0Gln7MZUMaGsON4qHYkDSNcGkWkyiAPJz9
 htAGBmA7QFjAqAX/LiTUBptHO0pRgtzX/WbHRJRivXpqvNbd7IGexMoRcjBEVInimO82
 nQh8oNZ+/CSuT5Dhf+At5L+k01hc8FSh9lZWl8+JfUK27shYI8srq9xI2zZA1/kzauIy
 GqpGwldmvVpBNAWAHJjG14BXvVQEXhLsVai9cKDeo5OTP3vjZvbzmTFCT+tuROJyl61i
 IovQ==
X-Gm-Message-State: APjAAAXLMcw2yaG/inqP2K5YAb0eZ2UGBQJ5combJlsblehGOzw+qI+0
 wZW4sLk1l0XcmBcdFmo2ZCazHRbr
X-Google-Smtp-Source: APXvYqzcBx/n/B1V2ntiwRwi0EVqJK8Ur7aDkn5J2ev1nKGRu4Netgrk7AcRt4/iyOak6wUE4heb+Q==
X-Received: by 2002:aa7:9218:: with SMTP id 24mr37332703pfo.145.1580926814519; 
 Wed, 05 Feb 2020 10:20:14 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:20:14 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/11] drm/virtio: move locking into virtio_gpu_queue_ctrl_sgs
Date: Wed,  5 Feb 2020 10:19:51 -0800
Message-Id: <20200205181955.202485-8-olvaffe@gmail.com>
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

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 70 ++++++++++++++---------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 6ccb2a54dfb3c..299470aac281a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -318,18 +318,43 @@ static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
 	return sgt;
 }
 
-static bool virtio_gpu_queue_ctrl_sgs_locked(struct virtio_gpu_device *vgdev,
-					     struct virtio_gpu_vbuffer *vbuf,
-					     struct scatterlist **sgs,
-					     int outcnt,
-					     int incnt)
+static bool virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
+				      struct virtio_gpu_vbuffer *vbuf,
+				      struct virtio_gpu_fence *fence,
+				      int elemcnt,
+				      struct scatterlist **sgs,
+				      int outcnt,
+				      int incnt)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
 	bool notify = false;
 	int ret;
 
-	if (!vgdev->vqs_ready)
+again:
+	spin_lock(&vgdev->ctrlq.qlock);
+
+	if (vq->num_free < elemcnt) {
+		spin_unlock(&vgdev->ctrlq.qlock);
+		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= elemcnt);
+		goto again;
+	}
+
+	/* now that the position of the vbuf in the virtqueue is known, we can
+	 * finally set the fence id
+	 */
+	if (fence) {
+		virtio_gpu_fence_emit(vgdev, virtio_gpu_vbuf_ctrl_hdr(vbuf),
+				      fence);
+		if (vbuf->objs) {
+			virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
+			virtio_gpu_array_unlock_resv(vbuf->objs);
+		}
+	}
+
+	if (!vgdev->vqs_ready) {
+		spin_unlock(&vgdev->ctrlq.qlock);
 		return notify;
+	}
 
 	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
 	WARN_ON(ret);
@@ -338,6 +363,8 @@ static bool virtio_gpu_queue_ctrl_sgs_locked(struct virtio_gpu_device *vgdev,
 
 	notify = virtqueue_kick_prepare(vq);
 
+	spin_unlock(&vgdev->ctrlq.qlock);
+
 	return notify;
 }
 
@@ -345,7 +372,6 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 						struct virtio_gpu_vbuffer *vbuf,
 						struct virtio_gpu_fence *fence)
 {
-	struct virtqueue *vq = vgdev->ctrlq.vq;
 	struct scatterlist *sgs[3], vcmd, vout, vresp;
 	struct sg_table *sgt = NULL;
 	int elemcnt = 0, outcnt = 0, incnt = 0;
@@ -387,34 +413,8 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 		incnt++;
 	}
 
-again:
-	spin_lock(&vgdev->ctrlq.qlock);
-
-	/*
-	 * Make sure we have enouth space in the virtqueue.  If not
-	 * wait here until we have.
-	 *
-	 * Without that virtio_gpu_queue_ctrl_buffer_nolock might have
-	 * to wait for free space, which can result in fence ids being
-	 * submitted out-of-order.
-	 */
-	if (vq->num_free < elemcnt) {
-		spin_unlock(&vgdev->ctrlq.qlock);
-		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= elemcnt);
-		goto again;
-	}
-
-	if (fence) {
-		virtio_gpu_fence_emit(vgdev, virtio_gpu_vbuf_ctrl_hdr(vbuf),
-				      fence);
-		if (vbuf->objs) {
-			virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
-			virtio_gpu_array_unlock_resv(vbuf->objs);
-		}
-	}
-	notify = virtio_gpu_queue_ctrl_sgs_locked(vgdev, vbuf, sgs, outcnt,
-						  incnt);
-	spin_unlock(&vgdev->ctrlq.qlock);
+	notify = virtio_gpu_queue_ctrl_sgs(vgdev, vbuf, fence, elemcnt, sgs,
+					   outcnt, incnt);
 	if (notify) {
 		if (vgdev->disable_notify)
 			vgdev->pending_notify = true;
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
