Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49367C46B4D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EFE10E38B;
	Mon, 10 Nov 2025 12:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ba5sb8JT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866D710E38B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762779159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdF0qcLAT3KqrA3rNU9xsRjKWO55qxtf2gsPNynjwVI=;
 b=Ba5sb8JTHnHbiiQ4pfvY+FSx86oCnWCp0TteJM4k33/ATVWPJgFPpa/bX/2XPDSdqKieMt
 LS3AjZo53DrmCYUWku0OL/VSAQnZUtBEDp4L8jp/zBdgnHbFnObA+3cODx04c2kBlLSHOJ
 /XQm3Ax+81TXb5H7R+kWLvUevKqH6To=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-LhhL5zLGMpid6bnqNvANMQ-1; Mon,
 10 Nov 2025 07:52:36 -0500
X-MC-Unique: LhhL5zLGMpid6bnqNvANMQ-1
X-Mimecast-MFC-AGG-ID: LhhL5zLGMpid6bnqNvANMQ_1762779154
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4288D195608E; Mon, 10 Nov 2025 12:52:34 +0000 (UTC)
Received: from slp-asahi.redhat.com (unknown [10.44.32.9])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8214230001B9; Mon, 10 Nov 2025 12:52:28 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Sergio Lopez <slp@redhat.com>
Subject: [PATCH 2/3] drm/virtio: honor blob_alignment requirements
Date: Mon, 10 Nov 2025 13:52:12 +0100
Message-ID: <20251110125213.12633-3-slp@redhat.com>
In-Reply-To: <20251110125213.12633-1-slp@redhat.com>
References: <20251110125213.12633-1-slp@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, both
CREATE_BLOB and MAP_BLOB requests must be aligned to blob_alignment.

Introduce checks to ensure we don't send invalid requests to the
device.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  6 ++++--
 drivers/gpu/drm/virtio/virtgpu_prime.c  |  7 +++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 12 +++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vram.c   | 10 ++++++++--
 5 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d1fa386a5a99..11a55d4ccd54 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -433,7 +433,7 @@ int virtio_gpu_cmd_map(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_unmap(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_object *bo);
 
-void
+int
 virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo,
 				    struct virtio_gpu_object_params *params,
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index e6363c887500..6118344bff84 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -246,8 +246,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
 			bo->guest_blob = true;
 
-		virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
-						    ents, nents);
+		ret = virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
+							  ents, nents);
+		if (ret)
+			goto err_put_objs;
 	} else if (params->virgl) {
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
 						  objs, fence);
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index ce49282198cb..06593496c53f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -257,8 +257,11 @@ static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
 	params.blob_flags = VIRTGPU_BLOB_FLAG_USE_SHAREABLE;
 	params.size = attach->dmabuf->size;
 
-	virtio_gpu_cmd_resource_create_blob(vgdev, bo, &params,
-					    ents, nents);
+	ret = virtio_gpu_cmd_resource_create_blob(vgdev, bo, &params,
+						  ents, nents);
+	if (ret)
+		goto err_import;
+
 	bo->guest_blob = true;
 
 	dma_buf_unpin(attach);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 8181b22b9b46..d558ba2d213a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1393,6 +1393,10 @@ int virtio_gpu_cmd_map(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 	struct virtio_gpu_resp_map_info *resp_buf;
 
+	if (vgdev->has_blob_alignment &&
+	    !IS_ALIGNED(offset, vgdev->blob_alignment))
+		return -EINVAL;
+
 	resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
 	if (!resp_buf)
 		return -ENOMEM;
@@ -1426,7 +1430,7 @@ void virtio_gpu_cmd_unmap(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
 
-void
+int
 virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo,
 				    struct virtio_gpu_object_params *params,
@@ -1436,6 +1440,10 @@ virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_resource_create_blob *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 
+	if (vgdev->has_blob_alignment &&
+	    !IS_ALIGNED(params->size, vgdev->blob_alignment))
+		return -EINVAL;
+
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
@@ -1456,6 +1464,8 @@ virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
 
 	if (nents)
 		bo->attached = true;
+
+	return 0;
 }
 
 void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 5ad3b7c6f73c..6c402eca5726 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -216,8 +216,14 @@ int virtio_gpu_vram_create(struct virtio_gpu_device *vgdev,
 		return ret;
 	}
 
-	virtio_gpu_cmd_resource_create_blob(vgdev, &vram->base, params, NULL,
-					    0);
+	ret = virtio_gpu_cmd_resource_create_blob(vgdev, &vram->base, params,
+						  NULL, 0);
+	if (ret) {
+		drm_gem_free_mmap_offset(obj);
+		kfree(vram);
+		return ret;
+	}
+
 	if (params->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE) {
 		ret = virtio_gpu_vram_map(&vram->base);
 		if (ret) {
-- 
2.51.0

