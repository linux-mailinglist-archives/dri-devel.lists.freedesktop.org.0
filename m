Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD6153770
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DF46F920;
	Wed,  5 Feb 2020 18:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95BC6F91F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:20:14 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id a6so1213414plm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eiQ+xTfLWucbWS5TEa/HxnWIrsEOdsrdl2TbLBLm7ms=;
 b=R3Exg55xaWCAhl6OuGikCDBOgWspHjdZRpFuee8TUSVedQ0qXJnbJayLUO+IQmnwqz
 BaVv9GedJ8j40UhMaztj/W94G/Yd9dC8Fu/68gvrKgZszjw9OlSknIQ0W66kvi2d31Bv
 fMTcy516qillnLJSDiGYIam4UJJCvptHyAkv0TQ/yG/70e0EBB16o8zo92Vmys1fayP6
 WDwWZ5blUe8szx1FgNY06mggh241a21qFU8tkD9h2x5KNkzzeec5E843M14zngsU0oAK
 uWnWLRvJYaYUZRp8cVYHoc4oTUCOQdXSKUrKFm82+n8SaSIXgHHrO2fktzEP+dTzCl2N
 x9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eiQ+xTfLWucbWS5TEa/HxnWIrsEOdsrdl2TbLBLm7ms=;
 b=K3vX4xcXNwNLWfYKxkBnh8Ii3kHgPz/YVB0E98hXMcbY8c4VvoKnh5CzSMCA49cVI4
 i/AGxKDXBzX/letwByBjlWoNtesbfHAWZlehPTjlB4VDsZWjp173NaWali1E73y205qL
 STgLM6a4tX0GPKvEaa0RZBoSLsbGkfZvfcFZMGCnyxFNQl7zQJNy+5sr9sMLY1HW3F1O
 A+Eind1I3VzbmTbv/ws2rq1rcnvvzCGzINwSR2fz+xiP94Dwd4rSzSO0E8+APTY8WXoC
 LMIGzfoWb1BoocM80FE5Yhyw0T1PpHZsqo/yC5JJaEkNv/l0tS7y98qMo+5SexND/G9o
 vK/w==
X-Gm-Message-State: APjAAAXGrvvZjV8bXrDZwRVmVmOSMoE+Dr0DnJRvzTVPn1fffeXbXZc9
 hTYW75VpJaKTaJTusmvJG3rVjJOV
X-Google-Smtp-Source: APXvYqw6NvEw6tR09JQoCZKmpYg45DNKmeOLWMQmoXjkGQ5V6JguPrlYoHQAqqpuyZ2f6Hxi7XFqVg==
X-Received: by 2002:a17:90a:2741:: with SMTP id
 o59mr6823525pje.105.1580926813948; 
 Wed, 05 Feb 2020 10:20:13 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:20:13 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] drm/virtio: set up virtqueue sgs before locking
Date: Wed,  5 Feb 2020 10:19:50 -0800
Message-Id: <20200205181955.202485-7-olvaffe@gmail.com>
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

sgs setup does not need to be in the critical section.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 66 +++++++++++++++--------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 1e27f4c09341e..6ccb2a54dfb3c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -318,34 +318,19 @@ static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
 	return sgt;
 }
 
-static bool virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
-						struct virtio_gpu_vbuffer *vbuf,
-						struct scatterlist *vout)
+static bool virtio_gpu_queue_ctrl_sgs_locked(struct virtio_gpu_device *vgdev,
+					     struct virtio_gpu_vbuffer *vbuf,
+					     struct scatterlist **sgs,
+					     int outcnt,
+					     int incnt)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
-	struct scatterlist *sgs[3], vcmd, vresp;
-	int outcnt = 0, incnt = 0;
 	bool notify = false;
 	int ret;
 
 	if (!vgdev->vqs_ready)
 		return notify;
 
-	sg_init_one(&vcmd, vbuf->buf, vbuf->size);
-	sgs[outcnt + incnt] = &vcmd;
-	outcnt++;
-
-	if (vout) {
-		sgs[outcnt + incnt] = vout;
-		outcnt++;
-	}
-
-	if (vbuf->resp_size) {
-		sg_init_one(&vresp, vbuf->resp_buf, vbuf->resp_size);
-		sgs[outcnt + incnt] = &vresp;
-		incnt++;
-	}
-
 	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
 	WARN_ON(ret);
 
@@ -361,26 +346,45 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 						struct virtio_gpu_fence *fence)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
-	struct scatterlist *vout = NULL, sg;
+	struct scatterlist *sgs[3], vcmd, vout, vresp;
 	struct sg_table *sgt = NULL;
+	int elemcnt = 0, outcnt = 0, incnt = 0;
 	bool notify;
-	int outcnt = 0;
 
+	/* set up vcmd */
+	sg_init_one(&vcmd, vbuf->buf, vbuf->size);
+	elemcnt++;
+	sgs[outcnt] = &vcmd;
+	outcnt++;
+
+	/* set up vout */
 	if (vbuf->data_size) {
 		if (is_vmalloc_addr(vbuf->data_buf)) {
+			int sg_ents;
 			sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size,
-					     &outcnt);
+					     &sg_ents);
 			if (!sgt) {
 				if (fence && vbuf->objs)
 					virtio_gpu_array_unlock_resv(vbuf->objs);
 				return;
 			}
-			vout = sgt->sgl;
+
+			elemcnt += sg_ents;
+			sgs[outcnt] = sgt->sgl;
 		} else {
-			sg_init_one(&sg, vbuf->data_buf, vbuf->data_size);
-			vout = &sg;
-			outcnt = 1;
+			sg_init_one(&vout, vbuf->data_buf, vbuf->data_size);
+			elemcnt++;
+			sgs[outcnt] = &vout;
 		}
+		outcnt++;
+	}
+
+	/* set up vresp */
+	if (vbuf->resp_size) {
+		sg_init_one(&vresp, vbuf->resp_buf, vbuf->resp_size);
+		elemcnt++;
+		sgs[outcnt + incnt] = &vresp;
+		incnt++;
 	}
 
 again:
@@ -394,10 +398,9 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	 * to wait for free space, which can result in fence ids being
 	 * submitted out-of-order.
 	 */
-	if (vq->num_free < 2 + outcnt) {
+	if (vq->num_free < elemcnt) {
 		spin_unlock(&vgdev->ctrlq.qlock);
-		wait_event(vgdev->ctrlq.ack_queue,
-			   vq->num_free >= 2 + outcnt);
+		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= elemcnt);
 		goto again;
 	}
 
@@ -409,7 +412,8 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 			virtio_gpu_array_unlock_resv(vbuf->objs);
 		}
 	}
-	notify = virtio_gpu_queue_ctrl_buffer_locked(vgdev, vbuf, vout);
+	notify = virtio_gpu_queue_ctrl_sgs_locked(vgdev, vbuf, sgs, outcnt,
+						  incnt);
 	spin_unlock(&vgdev->ctrlq.qlock);
 	if (notify) {
 		if (vgdev->disable_notify)
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
