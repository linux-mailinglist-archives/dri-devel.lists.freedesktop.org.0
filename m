Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7216825A85
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5277410E690;
	Fri,  5 Jan 2024 18:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DDF10E695
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480448;
 bh=hLZrw2uyBORbZqEow6e5Z9wt3wafG02YrAXZMmshnO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cNGAEogZcRVb+dzqTWonn6PmYnXTX/FYV6PGxzbt6f7gVux5+fwoN2dMxpElgOFUS
 +33gPf13ydlPZmcFiQTEO0+P5pqkPzdqGlyjAxqtd7FpXlOaQ65gl2/ndIE4C0mMt+
 8xHKpqYWRDi4C35UEpLbVnJYos06xo0pZuVKz0NNx3y2Xs7AbpqylorRj/8+X+u83u
 w0/28yBpFqXZ2J8n7urums5aDltS79D3CrOamytc5tdJcglGEl9gCPuFZjbk2a1G/u
 JI2WrP99ehgJFQLyAQrYZhBGs+HZl3Ow4xHiUZb2nPJV/yaI9fr42/OlV7F9uE/zH3
 nYGaYi3xmoiXw==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6FB813782058;
 Fri,  5 Jan 2024 18:47:26 +0000 (UTC)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v19 27/30] drm/virtio: Pin display framebuffer BO
Date: Fri,  5 Jan 2024 21:46:21 +0300
Message-ID: <20240105184624.508603-28-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare to addition of memory shrinker support by pinning display
framebuffer BO pages in memory while they are in use by display on host.
Shrinker is free to relocate framebuffer BO pages if it doesn't know that
pages are in use, thus pin the pages to disallow shrinker to move them.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
 drivers/gpu/drm/virtio/virtgpu_gem.c   | 19 +++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 17 +++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index bb7d86a0c6a1..83d1e4622292 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -318,6 +318,8 @@ void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
 				       struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_work(struct work_struct *work);
+int virtio_gpu_gem_pin(struct virtio_gpu_object *bo);
+void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo);
 
 /* virtgpu_vq.c */
 int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a..625c05d625bf 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -294,3 +294,22 @@ void virtio_gpu_array_put_free_work(struct work_struct *work)
 	}
 	spin_unlock(&vgdev->obj_free_lock);
 }
+
+int virtio_gpu_gem_pin(struct virtio_gpu_object *bo)
+{
+	int err;
+
+	if (virtio_gpu_is_shmem(bo)) {
+		err = drm_gem_shmem_pin(&bo->base);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo)
+{
+	if (virtio_gpu_is_shmem(bo))
+		drm_gem_shmem_unpin(&bo->base);
+}
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a72a2dbda031..162fb8a44d71 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -248,20 +248,28 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo;
+	int err;
 
 	if (!new_state->fb)
 		return 0;
 
 	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-	if (!bo || (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob))
+
+	err = virtio_gpu_gem_pin(bo);
+	if (err)
+		return err;
+
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob)
 		return 0;
 
 	if (bo->dumb && (plane->state->fb != new_state->fb)) {
 		vgfb->fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
 						     0);
-		if (!vgfb->fence)
+		if (!vgfb->fence) {
+			virtio_gpu_gem_unpin(bo);
 			return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -271,15 +279,20 @@ static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
 					struct drm_plane_state *state)
 {
 	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_object *bo;
 
 	if (!state->fb)
 		return;
 
 	vgfb = to_virtio_gpu_framebuffer(state->fb);
+	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
+
 	if (vgfb->fence) {
 		dma_fence_put(&vgfb->fence->f);
 		vgfb->fence = NULL;
 	}
+
+	virtio_gpu_gem_unpin(bo);
 }
 
 static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
-- 
2.43.0

