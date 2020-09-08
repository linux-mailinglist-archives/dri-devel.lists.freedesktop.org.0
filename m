Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A15260B8F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7C06E188;
	Tue,  8 Sep 2020 07:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B3A6E150
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599548851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d/1j3RxNux/Jqkw1iBdsdegsHl40YIj7+vylXlys3FY=;
 b=DFcKVZy7gclUG/byVeXyspw7xJNBVkL8gsDmv9R+d/6A5AyXNa2iI0lTB4ktqj67vkP9nl
 8j65zsDgRaD2CbBafz61Rs27VJmiK2JMvxc7CmI+2KHbeW0K0W4LXwMNpqS/vb8DRPHldT
 h9W/qk1F3Fxd7GSP49ArX8aoI0I4sp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-SB-rcyB7PtSmJxmCL1E-bA-1; Tue, 08 Sep 2020 03:07:29 -0400
X-MC-Unique: SB-rcyB7PtSmJxmCL1E-bA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D03180EDA1;
 Tue,  8 Sep 2020 07:07:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7014360C15;
 Tue,  8 Sep 2020 07:07:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B6A021FCEE; Tue,  8 Sep 2020 09:07:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/virtio: return virtio_gpu_queue errors
Date: Tue,  8 Sep 2020 09:07:22 +0200
Message-Id: <20200908070723.6394-3-kraxel@redhat.com>
In-Reply-To: <20200908070723.6394-1-kraxel@redhat.com>
References: <20200908070723.6394-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case queuing virtio commands fails (can happen when
the device got unplugged) pass up the error.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 36 +++++++++++++++--------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index c93c2db35aaf..b1884e6e242c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -320,13 +320,13 @@ static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
 	return sgt;
 }
 
-static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
-				      struct virtio_gpu_vbuffer *vbuf,
-				      struct virtio_gpu_fence *fence,
-				      int elemcnt,
-				      struct scatterlist **sgs,
-				      int outcnt,
-				      int incnt)
+static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
+				     struct virtio_gpu_vbuffer *vbuf,
+				     struct virtio_gpu_fence *fence,
+				     int elemcnt,
+				     struct scatterlist **sgs,
+				     int outcnt,
+				     int incnt)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
 	int ret, idx;
@@ -335,7 +335,7 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 		if (fence && vbuf->objs)
 			virtio_gpu_array_unlock_resv(vbuf->objs);
 		free_vbuf(vgdev, vbuf);
-		return;
+		return -1;
 	}
 
 	if (vgdev->has_indirect)
@@ -373,15 +373,16 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 	spin_unlock(&vgdev->ctrlq.qlock);
 
 	drm_dev_exit(idx);
+	return 0;
 }
 
-static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
-						struct virtio_gpu_vbuffer *vbuf,
-						struct virtio_gpu_fence *fence)
+static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
+					       struct virtio_gpu_vbuffer *vbuf,
+					       struct virtio_gpu_fence *fence)
 {
 	struct scatterlist *sgs[3], vcmd, vout, vresp;
 	struct sg_table *sgt = NULL;
-	int elemcnt = 0, outcnt = 0, incnt = 0;
+	int elemcnt = 0, outcnt = 0, incnt = 0, ret;
 
 	/* set up vcmd */
 	sg_init_one(&vcmd, vbuf->buf, vbuf->size);
@@ -398,7 +399,7 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 			if (!sgt) {
 				if (fence && vbuf->objs)
 					virtio_gpu_array_unlock_resv(vbuf->objs);
-				return;
+				return -1;
 			}
 
 			elemcnt += sg_ents;
@@ -419,13 +420,14 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 		incnt++;
 	}
 
-	virtio_gpu_queue_ctrl_sgs(vgdev, vbuf, fence, elemcnt, sgs, outcnt,
-				  incnt);
+	ret = virtio_gpu_queue_ctrl_sgs(vgdev, vbuf, fence, elemcnt, sgs, outcnt,
+					incnt);
 
 	if (sgt) {
 		sg_free_table(sgt);
 		kfree(sgt);
 	}
+	return ret;
 }
 
 void virtio_gpu_notify(struct virtio_gpu_device *vgdev)
@@ -444,10 +446,10 @@ void virtio_gpu_notify(struct virtio_gpu_device *vgdev)
 		virtqueue_notify(vgdev->ctrlq.vq);
 }
 
-static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
+static int virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
 					 struct virtio_gpu_vbuffer *vbuf)
 {
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, NULL);
+	return virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, NULL);
 }
 
 static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
