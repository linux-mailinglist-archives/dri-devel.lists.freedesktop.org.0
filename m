Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13657152987
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 12:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9C06F545;
	Wed,  5 Feb 2020 11:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA09D6E954
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 11:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580900403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=bqgElwRefjJ3EiFm371iu05T9EzEgrtJ/QBv+TdYAbM=;
 b=ika3kPlc6tLKfASTP/x8m4KhWd5XnarzhYo2FtrZ9smJOiDsNTW8z8kqx9ialZtxQY2kcB
 qItohtmY9ZRex1DjofAXzRXcsUIk7oWVzI7aSpxlXXfTzsIPqweaD8cSoPQMqdtSzDhmqe
 Otx4XKxPalh4M65waywv9a7/7t5tA0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-UX-nIhLWO6OpXEtZYbzKDA-1; Wed, 05 Feb 2020 06:00:00 -0500
X-MC-Unique: UX-nIhLWO6OpXEtZYbzKDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45CD2DB61;
 Wed,  5 Feb 2020 10:59:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 431495D9E2;
 Wed,  5 Feb 2020 10:59:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8FDDE9C75; Wed,  5 Feb 2020 11:59:55 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/virtio: resource teardown tweaks
Date: Wed,  5 Feb 2020 11:59:53 +0100
Message-Id: <20200205105955.28143-3-kraxel@redhat.com>
In-Reply-To: <20200205105955.28143-1-kraxel@redhat.com>
References: <20200205105955.28143-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Add new virtio_gpu_cleanup_object() helper function for object cleanup.
Wire up callback function for resource unref, do cleanup from callback
when we know the host stopped using the resource.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  3 ++-
 drivers/gpu/drm/virtio/virtgpu_object.c | 19 ++++++++++----
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 35 ++++++++++++++++++++++---
 3 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7e69c06e168e..372dd248cf02 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -262,7 +262,7 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object_array *objs,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
-				   uint32_t resource_id);
+				   struct virtio_gpu_object *bo);
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
@@ -355,6 +355,7 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
 				    u64 last_seq);
 
 /* virtio_gpu_object */
+void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 						size_t size);
 int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 017a9e0fc3bb..28a161af7503 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -61,6 +61,14 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
 	}
 }
 
+void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+
+	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
+	drm_gem_shmem_free_object(&bo->base.base);
+}
+
 static void virtio_gpu_free_object(struct drm_gem_object *obj)
 {
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
@@ -68,11 +76,12 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 
 	if (bo->pages)
 		virtio_gpu_object_detach(vgdev, bo);
-	if (bo->created)
-		virtio_gpu_cmd_unref_resource(vgdev, bo->hw_res_handle);
-	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
-
-	drm_gem_shmem_free_object(obj);
+	if (bo->created) {
+		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		/* completion handler calls virtio_gpu_cleanup_object() */
+		return;
+	}
+	virtio_gpu_cleanup_object(bo);
 }
 
 static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 6d6d55dc384e..6e8097e4c214 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -152,6 +152,15 @@ static void *virtio_gpu_alloc_cmd(struct virtio_gpu_device *vgdev,
 					 sizeof(struct virtio_gpu_ctrl_hdr), NULL);
 }
 
+static void *virtio_gpu_alloc_cmd_cb(struct virtio_gpu_device *vgdev,
+				     struct virtio_gpu_vbuffer **vbuffer_p,
+				     int size,
+				     virtio_gpu_resp_cb cb)
+{
+	return virtio_gpu_alloc_cmd_resp(vgdev, cb, vbuffer_p, size,
+					 sizeof(struct virtio_gpu_ctrl_hdr), NULL);
+}
+
 static void free_vbuf(struct virtio_gpu_device *vgdev,
 		      struct virtio_gpu_vbuffer *vbuf)
 {
@@ -494,17 +503,37 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 	bo->created = true;
 }
 
+static void virtio_gpu_cmd_unref_cb(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_vbuffer *vbuf)
+{
+	struct virtio_gpu_object *bo;
+
+	bo = gem_to_virtio_gpu_obj(vbuf->objs->objs[0]);
+	kfree(vbuf->objs);
+	vbuf->objs = NULL;
+
+	virtio_gpu_cleanup_object(bo);
+}
+
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
-				   uint32_t resource_id)
+				   struct virtio_gpu_object *bo)
 {
 	struct virtio_gpu_resource_unref *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 
-	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	cmd_p = virtio_gpu_alloc_cmd_cb(vgdev, &vbuf, sizeof(*cmd_p),
+					virtio_gpu_cmd_unref_cb);
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_UNREF);
-	cmd_p->resource_id = cpu_to_le32(resource_id);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+
+	/*
+	 * We are in the release callback and do NOT want refcount
+	 * bo, so do NOT use virtio_gpu_array_add_obj().
+	 */
+	vbuf->objs = virtio_gpu_array_alloc(1);
+	vbuf->objs->objs[0] = &bo->base.base;
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
