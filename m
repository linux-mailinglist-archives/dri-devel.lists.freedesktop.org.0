Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8E2969635
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6997F10E431;
	Tue,  3 Sep 2024 07:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="imZQgkQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C60F10E42E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725350083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=erfScia7MUbIuJASLSHmvw5Ni1TK9TW/zUhjcZHMUOs=;
 b=imZQgkQP8pVkDx5uOHHQOJDP709HrY2wrTxT5RD+ttdwkVODXna3D2OJVGq+PhQL7aj1Q9
 a7N4iVmQk8FEkj3nW1eJxdJywt+bSwkfxxPl0wD3PHwHLeUBXN4ihkGm4LwvHNP9mmh72D
 pkVX26t/DiMlbEpE755udjF7idI+7Yk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-aAkEcj0vMSS28F8TFPR1WQ-1; Tue,
 03 Sep 2024 03:54:39 -0400
X-MC-Unique: aAkEcj0vMSS28F8TFPR1WQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2DEE11955BF8; Tue,  3 Sep 2024 07:54:38 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.228])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4853C3001FE8; Tue,  3 Sep 2024 07:54:34 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 1/2] drm/virtio: Defer the host dumb buffer creation
Date: Tue,  3 Sep 2024 09:48:26 +0200
Message-ID: <20240903075414.297622-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

The host dumb buffer command needs a format, but the
DRM_IOCTL_MODE_CREATE_DUMB only provides a buffer size.
So wait for the DRM_IOCTL_MODE_ADDFB(2), to get the format, and create
the host resources at this time.

This will allow virtio-gpu to support multiple pixel formats.

This problem was noticed in commit 42fd9e6c29b39 ("drm/virtio: fix
DRM_FORMAT_* handling")

Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v2:
 * Move virtio_gpu_object deferred field to its own block (Geerd Hoffmann)
 * Check that the size of the dumb buffer can hold the framebuffer (Geerd Hoffmann)

 drivers/gpu/drm/virtio/virtgpu_display.c | 33 ++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  5 ++++
 drivers/gpu/drm/virtio/virtgpu_gem.c     |  1 -
 drivers/gpu/drm/virtio/virtgpu_object.c  | 13 +++++++---
 4 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 64baf2f22d9f0..5e8ca742c6d00 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -290,6 +290,30 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	return 0;
 }
 
+static int virtio_gpu_deferred_create(struct virtio_gpu_object *bo,
+				      struct virtio_gpu_device *vgdev,
+				      const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct virtio_gpu_object_params params = { 0 };
+
+	params.format = virtio_gpu_translate_format(mode_cmd->pixel_format);
+	params.dumb = true;
+	params.width = mode_cmd->width;
+	params.height = mode_cmd->height;
+	params.size = params.height * params.width * 4;
+	params.size = ALIGN(params.size, PAGE_SIZE);
+
+	if (params.size > bo->base.base.size)
+		return -EINVAL;
+
+	virtio_gpu_cmd_create_resource(vgdev, bo, &params, NULL, NULL);
+	virtio_gpu_object_attach(vgdev, bo, bo->ents, bo->nents);
+
+	bo->deferred = false;
+	bo->ents = NULL;
+	return 0;
+}
+
 static struct drm_framebuffer *
 virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 				   struct drm_file *file_priv,
@@ -297,6 +321,8 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 {
 	struct drm_gem_object *obj = NULL;
 	struct virtio_gpu_framebuffer *virtio_gpu_fb;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_object *bo;
 	int ret;
 
 	if (mode_cmd->pixel_format != DRM_FORMAT_HOST_XRGB8888 &&
@@ -308,6 +334,13 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 	if (!obj)
 		return ERR_PTR(-EINVAL);
 
+	bo = gem_to_virtio_gpu_obj(obj);
+	if (bo->deferred) {
+		ret = virtio_gpu_deferred_create(bo, vgdev, mode_cmd);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	virtio_gpu_fb = kzalloc(sizeof(*virtio_gpu_fb), GFP_KERNEL);
 	if (virtio_gpu_fb == NULL) {
 		drm_gem_object_put(obj);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 64c236169db88..4302933e5067c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -95,6 +95,11 @@ struct virtio_gpu_object {
 	bool host3d_blob, guest_blob;
 	uint32_t blob_mem, blob_flags;
 
+	/* For deferred dumb buffer creation */
+	bool deferred;
+	struct virtio_gpu_mem_entry *ents;
+	unsigned int nents;
+
 	int uuid_state;
 	uuid_t uuid;
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a8..33ad15fed30f6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -75,7 +75,6 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	args->size = pitch * args->height;
 	args->size = ALIGN(args->size, PAGE_SIZE);
 
-	params.format = virtio_gpu_translate_format(DRM_FORMAT_HOST_XRGB8888);
 	params.width = args->width;
 	params.height = args->height;
 	params.size = args->size;
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index c7e74cf130221..b5a537a761294 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -67,6 +67,8 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 	if (virtio_gpu_is_shmem(bo)) {
+		if (bo->deferred)
+			kvfree(bo->ents);
 		drm_gem_shmem_free(&bo->base);
 	} else if (virtio_gpu_is_vram(bo)) {
 		struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
@@ -228,10 +230,13 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
 						  objs, fence);
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
-	} else {
-		virtio_gpu_cmd_create_resource(vgdev, bo, params,
-					       objs, fence);
-		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+	} else if (params->dumb) {
+		/* Create the host resource in virtio_gpu_user_framebuffer_create()
+		 * because the pixel format is not specified yet
+		 */
+		bo->ents = ents;
+		bo->nents = nents;
+		bo->deferred = true;
 	}
 
 	*bo_ptr = bo;

base-commit: 9345e3aab7fef06b8908308634974ea32a29e276
-- 
2.46.0

