Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B8F153774
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5EB6F921;
	Wed,  5 Feb 2020 18:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F586F921
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:20:17 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id e8so1203338plt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wS3JQcVZ5maNSXGf9GQ6jqqO4T8spIB6XidZE0Phrqo=;
 b=jSdqCuLpXGVDTnRpZqnFSSzXghqUTwzisSZoXKM5JOnuAr3Z/sZS+OuXYBzXrIESl1
 EFi7TOs/zC0LvwUc5HM7RgVHqSLYSCNVh4KqKSPZK9yFNd3HbAE0nNEJ86KjbVxBs7Wh
 xA2IGOhJILpnoC0cp3bBPlKyEcOQArPpMxa1DaW9MYD3yzmohgSsH1gbFaJiZz3gv2Eo
 L5AwJjhE4hFpklU27M1SpuBBvZm14KNnv+h4uqwDflIDwezkbaqPWaTn5ajYwWwC3/bH
 x+uE9LniN7kmHkqXit9dakjgaF7keeCdHJqF/unbILSeMBWCRrIp8d5wAi4fzrDzW09V
 LmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wS3JQcVZ5maNSXGf9GQ6jqqO4T8spIB6XidZE0Phrqo=;
 b=fwqf3aJNRo4oKg1vdxmRoqqNo3UKFUEwhmYgXtQQscijTAZrle2Q+e9PBHyXKWA0QL
 tIFizuZ584+0cRoZaIT1oYDY/nLdbOb7+kF1/78Pf1KB0ZM4xcxJiwmXu1qgJHOBTTqO
 oagSdLEFh4VFe2T//Mfjt2kYRWRUYPHsRBS0x4xW1S8aAeLmzFtGg0VAIdoEVhhEg6Gk
 w19HRofG34/PAMMnsYv0B4J6msOr5KML6VDzY717QG5EWK5Dxerr/DmO2j+d19zeVYdS
 hzn4Sm8ZE/9zfwSbNex8LcZWg4NssJxGaAFjaafPUm7vW4v5tQqUIPxDVNB3r6nsJfBS
 TtSA==
X-Gm-Message-State: APjAAAXeL4F9d4ImmYfrxQq8BUT29KlgdLlQB4SQ3y0AUgGt5OP6+BvQ
 udaU7/8JwhLpbiuH9WG7WHTyWona
X-Google-Smtp-Source: APXvYqy9TuWPXAm8QsVbidiyJWgwAG7GPUb6SM+KVfGb1Sz55e5zeW8XrwOLYJqpDvpFGqGAf8NUlA==
X-Received: by 2002:a17:902:9349:: with SMTP id
 g9mr36204422plp.110.1580926817097; 
 Wed, 05 Feb 2020 10:20:17 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:20:16 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/11] drm/virtio: move virtqueue_notify into
 virtio_gpu_queue_ctrl_sgs
Date: Wed,  5 Feb 2020 10:19:54 -0800
Message-Id: <20200205181955.202485-11-olvaffe@gmail.com>
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

It becomes clear that virtio_gpu_queue_fenced_ctrl_buffer should be
responsible for setting up sgs and virtio_gpu_queue_ctrl_sgs should
be responsible for queuing sgs.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 725cfe93bcef8..0961475e68105 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -318,7 +318,7 @@ static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
 	return sgt;
 }
 
-static bool virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
+static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 				      struct virtio_gpu_vbuffer *vbuf,
 				      struct virtio_gpu_fence *fence,
 				      int elemcnt,
@@ -338,7 +338,7 @@ static bool virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 
 		if (fence && vbuf->objs)
 			virtio_gpu_array_unlock_resv(vbuf->objs);
-		return notify;
+		return;
 	}
 
 	if (vq->num_free < elemcnt) {
@@ -368,7 +368,12 @@ static bool virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 
 	spin_unlock(&vgdev->ctrlq.qlock);
 
-	return notify;
+	if (notify) {
+		if (vgdev->disable_notify)
+			vgdev->pending_notify = true;
+		else
+			virtqueue_notify(vq);
+	}
 }
 
 static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
@@ -378,7 +383,6 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	struct scatterlist *sgs[3], vcmd, vout, vresp;
 	struct sg_table *sgt = NULL;
 	int elemcnt = 0, outcnt = 0, incnt = 0;
-	bool notify;
 
 	/* set up vcmd */
 	sg_init_one(&vcmd, vbuf->buf, vbuf->size);
@@ -416,14 +420,8 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 		incnt++;
 	}
 
-	notify = virtio_gpu_queue_ctrl_sgs(vgdev, vbuf, fence, elemcnt, sgs,
-					   outcnt, incnt);
-	if (notify) {
-		if (vgdev->disable_notify)
-			vgdev->pending_notify = true;
-		else
-			virtqueue_notify(vgdev->ctrlq.vq);
-	}
+	virtio_gpu_queue_ctrl_sgs(vgdev, vbuf, fence, elemcnt, sgs, outcnt,
+				  incnt);
 
 	if (sgt) {
 		sg_free_table(sgt);
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
