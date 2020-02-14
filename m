Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA8015D7C2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 13:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888F96F916;
	Fri, 14 Feb 2020 12:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609A26F916
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581684946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=vfouwP8TcamNpMbxHNP6dn1gS+edKVT/FDKZ0j5xkf4=;
 b=MXWso3GvlkUwlb2eIqBRf6uiFPGcKrVT6VJqr8BhLtKNg7vOlriJyyhKCmCgFanZmBMhNf
 joYMzgksZqWiE0TukxVr9D2PZbKOqf/6QEsZrvcKcXIRGH1xFRLoH71R9Zvzvf+MDoZ6Gx
 /48uRTFl1Jwtw9usT090yicpx+ufZTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-L4uG9_CPOjipUjdS1oGkdg-1; Fri, 14 Feb 2020 07:55:42 -0500
X-MC-Unique: L4uG9_CPOjipUjdS1oGkdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 051E6107ACCD;
 Fri, 14 Feb 2020 12:55:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E12E8AC44;
 Fri, 14 Feb 2020 12:55:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4400131FEE; Fri, 14 Feb 2020 13:55:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 6/6] drm/virtio: move remaining virtio_gpu_notify calls
Date: Fri, 14 Feb 2020 13:55:35 +0100
Message-Id: <20200214125535.26349-7-kraxel@redhat.com>
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

Move all remaining virtio_gpu_notify() calls from virtio_gpu_cmd_*
to the callers, for consistency reasons.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 3 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c    | 3 +++
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 9 ---------
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 0a2b62279647..0d6152c99a27 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -123,6 +123,7 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 
 	virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx_id,
 					       objs);
+	virtio_gpu_notify(vgdev);
 	return 0;
 }
 
@@ -143,6 +144,7 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 
 	virtio_gpu_cmd_context_detach_resource(vgdev, vfpriv->ctx_id,
 					       objs);
+	virtio_gpu_notify(vgdev);
 }
 
 struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 467649733d24..bbc31aef51f1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -158,6 +158,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
 			      vfpriv->ctx_id, buflist, out_fence);
+	virtio_gpu_notify(vgdev);
 	return 0;
 
 out_unresv:
@@ -314,6 +315,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 		(vgdev, vfpriv->ctx_id, offset, args->level,
 		 &args->box, objs, fence);
 	dma_fence_put(&fence->f);
+	virtio_gpu_notify(vgdev);
 	return 0;
 
 err_unlock:
@@ -446,6 +448,7 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	/* not in cache - need to talk to hw */
 	virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
 				  &cache_ent);
+	virtio_gpu_notify(vgdev);
 
 copy_exit:
 	ret = wait_event_timeout(vgdev->resp_wq,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 8fd7acef960f..ad3b673f5796 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -61,6 +61,7 @@ static int virtio_gpu_context_create(struct virtio_gpu_device *vgdev,
 		return handle;
 	handle += 1;
 	virtio_gpu_cmd_context_create(vgdev, handle, nlen, name);
+	virtio_gpu_notify(vgdev);
 	return handle;
 }
 
@@ -68,6 +69,7 @@ static void virtio_gpu_context_destroy(struct virtio_gpu_device *vgdev,
 				      uint32_t ctx_id)
 {
 	virtio_gpu_cmd_context_destroy(vgdev, ctx_id);
+	virtio_gpu_notify(vgdev);
 	ida_free(&vgdev->ctx_id_ida, ctx_id - 1);
 }
 
@@ -93,6 +95,7 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 	}
 	for (i = 0; i < num_capsets; i++) {
 		virtio_gpu_cmd_get_capset_info(vgdev, i);
+		virtio_gpu_notify(vgdev);
 		ret = wait_event_timeout(vgdev->resp_wq,
 					 vgdev->capsets[i].id > 0, 5 * HZ);
 		if (ret == 0) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 65d6834d3c74..3d2a6d489bfc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -88,6 +88,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 
 	if (bo->created) {
 		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		virtio_gpu_notify(vgdev);
 		/* completion handler calls virtio_gpu_cleanup_object() */
 		return;
 	}
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 2e108b426244..5e2375e0f7bb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -544,7 +544,6 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 
 	vbuf->resp_cb_data = bo;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
@@ -798,7 +797,6 @@ int virtio_gpu_cmd_get_capset_info(struct virtio_gpu_device *vgdev, int idx)
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_CAPSET_INFO);
 	cmd_p->capset_index = cpu_to_le32(idx);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 	return 0;
 }
 
@@ -874,7 +872,6 @@ int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 	cmd_p->capset_version = cpu_to_le32(version);
 	*cache_p = cache_ent;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 
 	return 0;
 }
@@ -922,7 +919,6 @@ void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
 	strncpy(cmd_p->debug_name, name, sizeof(cmd_p->debug_name) - 1);
 	cmd_p->debug_name[sizeof(cmd_p->debug_name) - 1] = 0;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
@@ -937,7 +933,6 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_DESTROY);
 	cmd_p->hdr.ctx_id = cpu_to_le32(id);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
@@ -956,7 +951,6 @@ void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
@@ -975,7 +969,6 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 }
 
 void
@@ -1067,7 +1060,6 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->level = cpu_to_le32(level);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
@@ -1091,7 +1083,6 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 	cmd_p->size = cpu_to_le32(data_size);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-	virtio_gpu_notify(vgdev);
 }
 
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
