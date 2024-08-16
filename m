Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDAE954AD3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 15:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DAE10E69F;
	Fri, 16 Aug 2024 13:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OixDsCtj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD7410E69F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 13:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723814014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gThAvDFAM8lggv8ks98g9opU/1cKGSqDwfjQUvT5tFM=;
 b=OixDsCtjKZBUNNlKcto+ZS7B+BoCUCvIA1oqtvFnQWCX+i0cHGzCBvB1+r+Bpkg+5yhfs6
 K+E8J4WP4BZCS7XGJ7j01Rjyob88xsA+gzx8alHx84oCIPyw5KwuEo0vBSsVwG2dOBPrVN
 UguM7V6BWH5iuUsHmbdD4jPaIQrzCAc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-222-foT7GbZyOlKkU1qFPnkM3w-1; Fri,
 16 Aug 2024 09:13:30 -0400
X-MC-Unique: foT7GbZyOlKkU1qFPnkM3w-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 542491955D4F; Fri, 16 Aug 2024 13:13:26 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.28])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4026F1955EBE; Fri, 16 Aug 2024 13:13:21 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] drm/virtio: Use XRGB8888 also for big endian systems
Date: Fri, 16 Aug 2024 15:13:02 +0200
Message-ID: <20240816131310.1008205-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Mesa doesn't support BGRX8888, that means most wayland compositors
doesn't work on big endian guests.

Also the colors are inverted when testing a s390x VM on a s390x host.
So I fixed the DRM_FORMAT -> VIRTIO_GPU_FORMAT on big endian guests.
It may break big-endian guest on little-endian host, but then the
fix should be in qemu, because we don't know the host endianess in
the guest VM.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c |  4 ++--
 drivers/gpu/drm/virtio/virtgpu_gem.c     |  2 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 22 ++++++++++++----------
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 64baf2f22d9f0..3572a53ea2061 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -299,8 +299,8 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 	struct virtio_gpu_framebuffer *virtio_gpu_fb;
 	int ret;
 
-	if (mode_cmd->pixel_format != DRM_FORMAT_HOST_XRGB8888 &&
-	    mode_cmd->pixel_format != DRM_FORMAT_HOST_ARGB8888)
+	if (mode_cmd->pixel_format != DRM_FORMAT_XRGB8888 &&
+	    mode_cmd->pixel_format != DRM_FORMAT_ARGB8888)
 		return ERR_PTR(-ENOENT);
 
 	/* lookup object associated with res handle */
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a8..601e06962530f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -75,7 +75,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	args->size = pitch * args->height;
 	args->size = ALIGN(args->size, PAGE_SIZE);
 
-	params.format = virtio_gpu_translate_format(DRM_FORMAT_HOST_XRGB8888);
+	params.format = virtio_gpu_translate_format(DRM_FORMAT_XRGB8888);
 	params.width = args->width;
 	params.height = args->height;
 	params.size = args->size;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a72a2dbda031c..0ec6ecc96eb13 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -30,29 +30,31 @@
 #include "virtgpu_drv.h"
 
 static const uint32_t virtio_gpu_formats[] = {
-	DRM_FORMAT_HOST_XRGB8888,
+	DRM_FORMAT_XRGB8888,
 };
 
 static const uint32_t virtio_gpu_cursor_formats[] = {
-	DRM_FORMAT_HOST_ARGB8888,
+	DRM_FORMAT_ARGB8888,
 };
 
+#ifdef __BIG_ENDIAN
+#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM
+#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM
+#else
+#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM
+#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM
+#endif
+
 uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)
 {
 	uint32_t format;
 
 	switch (drm_fourcc) {
 	case DRM_FORMAT_XRGB8888:
-		format = VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM;
+		format = VIRTIO_GPU_HOST_XRGB8888;
 		break;
 	case DRM_FORMAT_ARGB8888:
-		format = VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM;
-		break;
-	case DRM_FORMAT_BGRX8888:
-		format = VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM;
-		break;
-	case DRM_FORMAT_BGRA8888:
-		format = VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM;
+		format = VIRTIO_GPU_HOST_ARGB8888;
 		break;
 	default:
 		/*

base-commit: 8befe8fa5a4e4b30787b17e078d9d7b5cb92ea19
-- 
2.46.0

