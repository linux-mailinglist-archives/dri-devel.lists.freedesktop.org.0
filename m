Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56415D7C7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 13:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E506F919;
	Fri, 14 Feb 2020 12:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311576F916
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581684945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=7ru/6nhMHiYVk3JxzyUQLK5rcTm79OfGE8uzADOwxvU=;
 b=NC9Bs4xg3znaTXSGJWJ7LDY5pptz7+BUiQWV6vIzLjJeJ0QCgZbP2HYo/D/GqAz5hVLoew
 PVL+6r87PQHWInoi4uMN7HosQlu5jLUpkPEIvAl2RrDPc2OfcmLcBVk0TkRkXWkWekOzYr
 gSmm/SboTN/WV4+oICVMnASgN6Gg8K4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-NaK_KGUGO8m9K7SprXbQzQ-1; Fri, 14 Feb 2020 07:55:42 -0500
X-MC-Unique: NaK_KGUGO8m9K7SprXbQzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7800477;
 Fri, 14 Feb 2020 12:55:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E8E919E9C;
 Fri, 14 Feb 2020 12:55:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6CAB546A0; Fri, 14 Feb 2020 13:55:35 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/6] drm/virtio: rework notification for better batching
Date: Fri, 14 Feb 2020 13:55:30 +0100
Message-Id: <20200214125535.26349-2-kraxel@redhat.com>
In-Reply-To: <20200214125535.26349-1-kraxel@redhat.com>
References: <20200214125535.26349-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Drop the virtio_gpu_{disable,enable}_notify().  Add a new
virtio_gpu_notify() call instead, which must be called whenever
the driver wants make sure the host is notified needed.

Drop automatic notification from command submission.  Add
virtio_gpu_notify() calls after each command query instead.
This allows more fine-grained control over host notification
and can move around the notify calls in subsequent patches to
batch command submissions. With this in place it is also
possible to make notification optional for userspace ioctls.

Page flip batching goes away (temporarely).

v3:
 - move batching to separate patches.
v2:
 - rebase to latest drm-misc-next.
 - use "if (!atomic_read())".
 - add review & test tags.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Tested-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 ++--
 drivers/gpu/drm/virtio/virtgpu_plane.c |  4 ---
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 50 ++++++++++++++++----------
 3 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index af9403e1cf78..2f6c4ccbfd14 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -179,8 +179,7 @@ struct virtio_gpu_device {
 	struct virtio_gpu_queue cursorq;
 	struct kmem_cache *vbufs;
 
-	bool disable_notify;
-	bool pending_notify;
+	atomic_t pending_commands;
 
 	struct ida	resource_ida;
 
@@ -335,8 +334,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
 void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
 void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 
-void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
-void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
+void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
 
 /* virtio_gpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index d1c3f5fbfee4..08b2e4127eb3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -154,8 +154,6 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
 		return;
 
-	virtio_gpu_disable_notify(vgdev);
-
 	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
 	if (bo->dumb)
 		virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
@@ -186,8 +184,6 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 				      rect.y1,
 				      rect.x2 - rect.x1,
 				      rect.y2 - rect.y1);
-
-	virtio_gpu_enable_notify(vgdev);
 }
 
 static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 67caecde623e..6cc259cfa517 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -329,7 +329,6 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 				      int incnt)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
-	bool notify = false;
 	int ret, idx;
 
 	if (!drm_dev_enter(vgdev->ddev, &idx)) {
@@ -368,16 +367,10 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 
 	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf));
 
-	notify = virtqueue_kick_prepare(vq);
+	atomic_inc(&vgdev->pending_commands);
 
 	spin_unlock(&vgdev->ctrlq.qlock);
 
-	if (notify) {
-		if (vgdev->disable_notify)
-			vgdev->pending_notify = true;
-		else
-			virtqueue_notify(vq);
-	}
 	drm_dev_exit(idx);
 }
 
@@ -434,19 +427,20 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	}
 }
 
-void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev)
+void virtio_gpu_notify(struct virtio_gpu_device *vgdev)
 {
-	vgdev->disable_notify = true;
-}
+	bool notify;
 
-void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev)
-{
-	vgdev->disable_notify = false;
-
-	if (!vgdev->pending_notify)
+	if (!atomic_read(&vgdev->pending_commands))
 		return;
-	vgdev->pending_notify = false;
-	virtqueue_notify(vgdev->ctrlq.vq);
+
+	spin_lock(&vgdev->ctrlq.qlock);
+	atomic_set(&vgdev->pending_commands, 0);
+	notify = virtqueue_kick_prepare(vgdev->ctrlq.vq);
+	spin_unlock(&vgdev->ctrlq.qlock);
+
+	if (notify)
+		virtqueue_notify(vgdev->ctrlq.vq);
 }
 
 static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
@@ -520,6 +514,7 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->height = cpu_to_le32(params->height);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 	bo->created = true;
 }
 
@@ -549,6 +544,7 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 
 	vbuf->resp_cb_data = bo;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
@@ -571,6 +567,7 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
@@ -592,6 +589,7 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
@@ -624,6 +622,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 }
 
 static void
@@ -647,6 +646,7 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	vbuf->data_size = sizeof(*ents) * nents;
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 }
 
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
@@ -779,6 +779,7 @@ int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev)
 	vgdev->display_info_pending = true;
 	cmd_p->type = cpu_to_le32(VIRTIO_GPU_CMD_GET_DISPLAY_INFO);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 	return 0;
 }
 
@@ -802,6 +803,7 @@ int virtio_gpu_cmd_get_capset_info(struct virtio_gpu_device *vgdev, int idx)
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_CAPSET_INFO);
 	cmd_p->capset_index = cpu_to_le32(idx);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 	return 0;
 }
 
@@ -877,6 +879,7 @@ int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 	cmd_p->capset_version = cpu_to_le32(version);
 	*cache_p = cache_ent;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 
 	return 0;
 }
@@ -904,6 +907,7 @@ int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev)
 		cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_EDID);
 		cmd_p->scanout = cpu_to_le32(scanout);
 		virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+		virtio_gpu_notify(vgdev);
 	}
 
 	return 0;
@@ -924,6 +928,7 @@ void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
 	strncpy(cmd_p->debug_name, name, sizeof(cmd_p->debug_name) - 1);
 	cmd_p->debug_name[sizeof(cmd_p->debug_name) - 1] = 0;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
@@ -938,6 +943,7 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_DESTROY);
 	cmd_p->hdr.ctx_id = cpu_to_le32(id);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
@@ -956,7 +962,7 @@ void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
@@ -975,6 +981,7 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_notify(vgdev);
 }
 
 void
@@ -1006,6 +1013,8 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->flags = cpu_to_le32(params->flags);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
+
 	bo->created = true;
 }
 
@@ -1039,6 +1048,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->level = cpu_to_le32(level);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
@@ -1065,6 +1075,7 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->level = cpu_to_le32(level);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
@@ -1088,6 +1099,7 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 	cmd_p->size = cpu_to_le32(data_size);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_notify(vgdev);
 }
 
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
