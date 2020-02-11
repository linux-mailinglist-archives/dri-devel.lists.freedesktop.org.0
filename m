Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387815911E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 14:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945A96EA7D;
	Tue, 11 Feb 2020 13:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF906EA7D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 13:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581429496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=sVe95hwJrcXX1VBf0GtrIkwXVPxpbZsIuV5redLdKjo=;
 b=ANSZGfIUeOTGEZKVmBmDQjM/ehzFpfjHzCyi4G9JvZ/prNWDPENa6IFbrVzLLy82cBtPpK
 9JdMMEQvFXtr6FLc01trs/Rihr2uegT+t8bnmdOXhj9Z1icmc+FK+A28V9xtD1AqIPDEiT
 brz4MHohdipOFXuxa02jyHBdyBof/cs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-mG-hoTzsNS2QnUHbAZZGTw-1; Tue, 11 Feb 2020 08:58:10 -0500
X-MC-Unique: mG-hoTzsNS2QnUHbAZZGTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52A67107ACC9;
 Tue, 11 Feb 2020 13:58:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1798F60BFB;
 Tue, 11 Feb 2020 13:58:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 11E5217447; Tue, 11 Feb 2020 14:58:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/virtio: add drm_driver.release callback.
Date: Tue, 11 Feb 2020 14:58:04 +0100
Message-Id: <20200211135805.24436-1-kraxel@redhat.com>
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split virtio_gpu_deinit(), move the drm shutdown and release to
virtio_gpu_release().  Drop vqs_ready variable, instead use
drm_dev_{enter,exit,unplug} to avoid touching hardware after
device removal.  Tidy up here and there.

v4: add changelog.
v3: use drm_dev_*().

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  3 ++-
 drivers/gpu/drm/virtio/virtgpu_display.c |  1 -
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  6 +++++-
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  7 ++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 27 +++++++++++++-----------
 5 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7fd8361e1c9e..af9403e1cf78 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -32,6 +32,7 @@
 #include <linux/virtio_gpu.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
@@ -177,7 +178,6 @@ struct virtio_gpu_device {
 	struct virtio_gpu_queue ctrlq;
 	struct virtio_gpu_queue cursorq;
 	struct kmem_cache *vbufs;
-	bool vqs_ready;
 
 	bool disable_notify;
 	bool pending_notify;
@@ -219,6 +219,7 @@ extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 /* virtio_kms.c */
 int virtio_gpu_init(struct drm_device *dev);
 void virtio_gpu_deinit(struct drm_device *dev);
+void virtio_gpu_release(struct drm_device *dev);
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
 void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 7b0f0643bb2d..af953db4a0c9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -368,6 +368,5 @@ void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
 
 	for (i = 0 ; i < vgdev->num_scanouts; ++i)
 		kfree(vgdev->outputs[i].edid);
-	drm_atomic_helper_shutdown(vgdev->ddev);
 	drm_mode_config_cleanup(vgdev->ddev);
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 8cf27af3ad53..ab4bed78e656 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -31,6 +31,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 
@@ -135,7 +136,8 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
 {
 	struct drm_device *dev = vdev->priv;
 
-	drm_dev_unregister(dev);
+	drm_dev_unplug(dev);
+	drm_atomic_helper_shutdown(dev);
 	virtio_gpu_deinit(dev);
 	drm_dev_put(dev);
 }
@@ -214,4 +216,6 @@ static struct drm_driver driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
+
+	.release = virtio_gpu_release,
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index c1086df49816..4009c2f97d08 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -199,7 +199,6 @@ int virtio_gpu_init(struct drm_device *dev)
 	virtio_gpu_modeset_init(vgdev);
 
 	virtio_device_ready(vgdev->vdev);
-	vgdev->vqs_ready = true;
 
 	if (num_capsets)
 		virtio_gpu_get_capsets(vgdev, num_capsets);
@@ -234,12 +233,16 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 
 	flush_work(&vgdev->obj_free_work);
-	vgdev->vqs_ready = false;
 	flush_work(&vgdev->ctrlq.dequeue_work);
 	flush_work(&vgdev->cursorq.dequeue_work);
 	flush_work(&vgdev->config_changed_work);
 	vgdev->vdev->config->reset(vgdev->vdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
+}
+
+void virtio_gpu_release(struct drm_device *dev)
+{
+	struct virtio_gpu_device *vgdev = dev->dev_private;
 
 	virtio_gpu_modeset_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index a682c2fcbe9a..cfe9c54f87a3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -330,7 +330,14 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
 	bool notify = false;
-	int ret;
+	int ret, idx;
+
+	if (!drm_dev_enter(vgdev->ddev, &idx)) {
+		if (fence && vbuf->objs)
+			virtio_gpu_array_unlock_resv(vbuf->objs);
+		free_vbuf(vgdev, vbuf);
+		return;
+	}
 
 	if (vgdev->has_indirect)
 		elemcnt = 1;
@@ -338,14 +345,6 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 again:
 	spin_lock(&vgdev->ctrlq.qlock);
 
-	if (!vgdev->vqs_ready) {
-		spin_unlock(&vgdev->ctrlq.qlock);
-
-		if (fence && vbuf->objs)
-			virtio_gpu_array_unlock_resv(vbuf->objs);
-		return;
-	}
-
 	if (vq->num_free < elemcnt) {
 		spin_unlock(&vgdev->ctrlq.qlock);
 		wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= elemcnt);
@@ -379,6 +378,7 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 		else
 			virtqueue_notify(vq);
 	}
+	drm_dev_exit(idx);
 }
 
 static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
@@ -460,12 +460,13 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 {
 	struct virtqueue *vq = vgdev->cursorq.vq;
 	struct scatterlist *sgs[1], ccmd;
+	int idx, ret, outcnt;
 	bool notify;
-	int ret;
-	int outcnt;
 
-	if (!vgdev->vqs_ready)
+	if (!drm_dev_enter(vgdev->ddev, &idx)) {
+		free_vbuf(vgdev, vbuf);
 		return;
+	}
 
 	sg_init_one(&ccmd, vbuf->buf, vbuf->size);
 	sgs[0] = &ccmd;
@@ -490,6 +491,8 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 
 	if (notify)
 		virtqueue_notify(vq);
+
+	drm_dev_exit(idx);
 }
 
 /* just create gem objects for userspace and long lived objects,
-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
