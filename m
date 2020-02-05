Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF3515376B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CE06F91B;
	Wed,  5 Feb 2020 18:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3178D6F91C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:20:12 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g6so1218108plt.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tg40qP+ShitFGj8IpEOqFMhiCtZwoJkfbIFcmVhDNiI=;
 b=nfyIAhLzQtHFVXiNYYVDzni4jQ3EbZb3tf/u7OxOPBbXlwmEZCuFz/LcZY5I39HaSP
 BcVj+7XvuLzzPZupoUWEy8hKx/lJ4lFw1TaaZbSIhXVx4CbHDmLpkkugrFXYSOZxfHwg
 n6+UH8utSNg91/fV7u/3589w+XFFnNFeIChnzQWXIaTz7RL21Qzke0xoeRux6QmGV1lV
 NVuTxupxowvWjvFwu2xjRA5Bc2sWXI8aa3a+nrE+1TIOKs8nXdL9lAHKyxsLJbre2Jse
 uAFRk7M3pl7sLVX0A4H2CxksFc2+ZN23cYdRihi1W/dRFoIZvK00ozpZU88wHNL9Zpj5
 UJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tg40qP+ShitFGj8IpEOqFMhiCtZwoJkfbIFcmVhDNiI=;
 b=pPFxNSPvR7Hbw+nzLHw5rtBy3Q3wvaUCYSo6OwH0WrctW0xP5N6OWTu9nbsog2RyUj
 L5coJZXojnQVaZRVNJkP6lzL+JTt+B219/6J9ULX65hMfYxqgxU9FkbQhgloiXT+CSIH
 JV2a0b/Yqnm8S9q/agWQU360t4WuohqtI2QlXSk9YmoUorMSN6Qw2DE/FKct18zBNIWi
 fZJKtnKzW/jbQdFLskI4vCx/MhsSpg5zInFrU66Is3xRTOiHlCem3ffG1IEVn4hWk6FI
 FLEXtJ3MQpBWeai0hKOFrArZb+a94QjXGdk4aBQC5GDq2MpMqywCncT61/GifdTvhjRK
 iifg==
X-Gm-Message-State: APjAAAVi0D6Y+RSl9I4vNu1WhKR8VfTVhDPumPB6tAtesXeKR1njWE6Q
 3Fo/IQRtpC5+c7Uw/wOUlmBk1RDl
X-Google-Smtp-Source: APXvYqztm7Z12UxbDSOIxpfKJ4eMcBX9iQWyMkWkZWtKSMg/uTtK94KIGS323jgGbjaVbf1ieqOf/A==
X-Received: by 2002:a17:902:7c95:: with SMTP id
 y21mr35789204pll.186.1580926811371; 
 Wed, 05 Feb 2020 10:20:11 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:20:10 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/11] drm/virtio: remove incorrect ENOSPC check
Date: Wed,  5 Feb 2020 10:19:46 -0800
Message-Id: <20200205181955.202485-3-olvaffe@gmail.com>
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

The handling of virtqueue_add_sgs ENOSPC error is incorrect because
it can result in out-of-order virtqueue_add_sgs and break fences.
We never get ENOSPC anyway because the caller waits until there is
enough space (the other caller that did not wait was removed in
commit 32d6c2c5b522).  Remove the incorrect and unnecessary error
path.

This also adds a WARN_ON(ret) until we properly handle errors.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: David Riley <davidriley@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 5169e8dd9fd6c..63d2df7fb0c98 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -310,8 +310,6 @@ static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
 static bool virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 						struct virtio_gpu_vbuffer *vbuf,
 						struct scatterlist *vout)
-		__releases(&vgdev->ctrlq.qlock)
-		__acquires(&vgdev->ctrlq.qlock)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
 	struct scatterlist *sgs[3], vcmd, vresp;
@@ -337,19 +335,14 @@ static bool virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 		incnt++;
 	}
 
-retry:
 	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
-	if (ret == -ENOSPC) {
-		spin_unlock(&vgdev->ctrlq.qlock);
-		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= outcnt + incnt);
-		spin_lock(&vgdev->ctrlq.qlock);
-		goto retry;
-	} else {
-		trace_virtio_gpu_cmd_queue(vq,
-			(struct virtio_gpu_ctrl_hdr *)vbuf->buf);
+	WARN_ON(ret);
+
+	trace_virtio_gpu_cmd_queue(vq,
+		(struct virtio_gpu_ctrl_hdr *)vbuf->buf);
+
+	notify = virtqueue_kick_prepare(vq);
 
-		notify = virtqueue_kick_prepare(vq);
-	}
 	return notify;
 }
 
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
