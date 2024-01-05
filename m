Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ED9825A83
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9008310E68E;
	Fri,  5 Jan 2024 18:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF56B10E67C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480449;
 bh=YSpfUi0dYnSrHc3ISwDMoKJxIxAsvP0LFr1Z/Juj61c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WwvIxqBgT+ZF/F4QlQBuLmEywOoKoRq+iLeKYzNVyQMuowhWW+DCEGM7oFIrAd8Th
 0Pk8+srxhnBR2oIAQHFvyPQIMbPNAYiq9IZcdRiQDY31O8PqEXeAZ3dki6CqP8zb74
 JBIEIFEl4JijnEnWHmpegTWX/WYc2TMU6vm509VjjKWskS5f/fu1yawksoCYM8buxn
 gGSyF06h7/Hk9TToABuWJGUYImLpu6az6xyW95+lHV7QUEH7UTA0sRJ7kkEc1384tR
 jSJF9y26Tl/UmAYkK1nUjMWY4sNtAhntov47dqIiatlTr2aiy0ejNtcw+KkzLPS9cR
 VhVaBMV+2oQFA==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 548AE3782075;
 Fri,  5 Jan 2024 18:47:28 +0000 (UTC)
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
Subject: [PATCH v19 28/30] drm/virtio: Attach shmem BOs dynamically
Date: Fri,  5 Jan 2024 21:46:22 +0300
Message-ID: <20240105184624.508603-29-dmitry.osipenko@collabora.com>
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

Prepare for addition of memory shrinker support by attaching shmem pages
to host dynamically on first use. Previously the attachment vq command
wasn't fenced and there was no vq kick made in the BO creation code path,
hence the attachment already was happening dynamically, but implicitly.
Making attachment explicitly dynamic will allow to simplify and reuse more
code when shrinker will be added. The virtio_gpu_object_shmem_init() now
works under the held reservation lock, which will be important to have for
shrinker to avoid moving pages while they are in active use by the driver.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  7 +++
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 26 +++++++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 32 +++++++----
 drivers/gpu/drm/virtio/virtgpu_object.c | 73 ++++++++++++++++++++-----
 drivers/gpu/drm/virtio/virtgpu_submit.c | 15 ++++-
 5 files changed, 125 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 83d1e4622292..1837dc7ea9fb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -92,6 +92,7 @@ struct virtio_gpu_object {
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
+	bool detached;
 	bool host3d_blob, guest_blob;
 	uint32_t blob_mem, blob_flags;
 
@@ -318,6 +319,8 @@ void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
 				       struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_work(struct work_struct *work);
+int virtio_gpu_array_prepare(struct virtio_gpu_device *vgdev,
+			     struct virtio_gpu_object_array *objs);
 int virtio_gpu_gem_pin(struct virtio_gpu_object *bo);
 void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo);
 
@@ -458,6 +461,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
+int virtio_gpu_reattach_shmem_object_locked(struct virtio_gpu_object *bo);
+
+int virtio_gpu_reattach_shmem_object(struct virtio_gpu_object *bo);
+
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 			       uint32_t *resid);
 /* virtgpu_prime.c */
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 625c05d625bf..97e67064c97e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -295,6 +295,26 @@ void virtio_gpu_array_put_free_work(struct work_struct *work)
 	spin_unlock(&vgdev->obj_free_lock);
 }
 
+int virtio_gpu_array_prepare(struct virtio_gpu_device *vgdev,
+			     struct virtio_gpu_object_array *objs)
+{
+	struct virtio_gpu_object *bo;
+	int ret = 0;
+	u32 i;
+
+	for (i = 0; i < objs->nents; i++) {
+		bo = gem_to_virtio_gpu_obj(objs->objs[i]);
+
+		if (virtio_gpu_is_shmem(bo) && bo->detached) {
+			ret = virtio_gpu_reattach_shmem_object_locked(bo);
+			if (ret)
+				break;
+		}
+	}
+
+	return ret;
+}
+
 int virtio_gpu_gem_pin(struct virtio_gpu_object *bo)
 {
 	int err;
@@ -303,6 +323,12 @@ int virtio_gpu_gem_pin(struct virtio_gpu_object *bo)
 		err = drm_gem_shmem_pin(&bo->base);
 		if (err)
 			return err;
+
+		err = virtio_gpu_reattach_shmem_object(bo);
+		if (err) {
+			drm_gem_shmem_unpin(&bo->base);
+			return err;
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index e4f76f315550..c7da22006149 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -256,6 +256,10 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (ret != 0)
 		goto err_put_free;
 
+	ret = virtio_gpu_array_prepare(vgdev, objs);
+	if (ret)
+		goto err_unlock;
+
 	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
 	if (!fence) {
 		ret = -ENOMEM;
@@ -298,11 +302,25 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 		goto err_put_free;
 	}
 
+	ret = virtio_gpu_array_lock_resv(objs);
+	if (ret != 0)
+		goto err_put_free;
+
+	ret = virtio_gpu_array_prepare(vgdev, objs);
+	if (ret)
+		goto err_unlock;
+
+	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
+	if (!fence) {
+		ret = -ENOMEM;
+		goto err_unlock;
+	}
+
 	if (!vgdev->has_virgl_3d) {
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, offset,
 			 args->box.w, args->box.h, args->box.x, args->box.y,
-			 objs, NULL);
+			 objs, fence);
 	} else {
 		virtio_gpu_create_context(dev, file);
 
@@ -311,23 +329,13 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			goto err_put_free;
 		}
 
-		ret = virtio_gpu_array_lock_resv(objs);
-		if (ret != 0)
-			goto err_put_free;
-
-		ret = -ENOMEM;
-		fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
-					       0);
-		if (!fence)
-			goto err_unlock;
-
 		virtio_gpu_cmd_transfer_to_host_3d
 			(vgdev,
 			 vfpriv ? vfpriv->ctx_id : 0, offset, args->level,
 			 args->stride, args->layer_stride, &args->box, objs,
 			 fence);
-		dma_fence_put(&fence->f);
 	}
+	dma_fence_put(&fence->f);
 	virtio_gpu_notify(vgdev);
 	return 0;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index e58528c562ef..de347aa3b9a8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -143,7 +143,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	struct sg_table *pages;
 	int si;
 
-	pages = drm_gem_shmem_get_pages_sgt(&bo->base);
+	pages = drm_gem_shmem_get_pages_sgt_locked(&bo->base);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
@@ -177,6 +177,40 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	return 0;
 }
 
+int virtio_gpu_reattach_shmem_object_locked(struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_mem_entry *ents;
+	unsigned int nents;
+	int err;
+
+	if (!bo->detached)
+		return 0;
+
+	err = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+	if (err)
+		return err;
+
+	virtio_gpu_object_attach(vgdev, bo, ents, nents);
+
+	bo->detached = false;
+
+	return 0;
+}
+
+int virtio_gpu_reattach_shmem_object(struct virtio_gpu_object *bo)
+{
+	int ret;
+
+	ret = dma_resv_lock_interruptible(bo->base.base.resv, NULL);
+	if (ret)
+		return ret;
+	ret = virtio_gpu_reattach_shmem_object_locked(bo);
+	dma_resv_unlock(bo->base.base.resv);
+
+	return ret;
+}
+
 int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object_params *params,
 			     struct virtio_gpu_object **bo_ptr,
@@ -207,45 +241,56 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 	bo->dumb = params->dumb;
 
-	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
-	if (ret != 0)
-		goto err_put_id;
+	if (bo->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
+		bo->guest_blob = true;
 
 	if (fence) {
 		ret = -ENOMEM;
 		objs = virtio_gpu_array_alloc(1);
 		if (!objs)
-			goto err_free_entry;
+			goto err_put_id;
 		virtio_gpu_array_add_obj(objs, &bo->base.base);
 
 		ret = virtio_gpu_array_lock_resv(objs);
 		if (ret != 0)
 			goto err_put_objs;
+	} else {
+		ret = dma_resv_lock(bo->base.base.resv, NULL);
+		if (ret)
+			goto err_put_id;
 	}
 
 	if (params->blob) {
-		if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
-			bo->guest_blob = true;
+		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+		if (ret)
+			goto err_unlock_objs;
+	} else {
+		bo->detached = true;
+	}
 
+	if (params->blob)
 		virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
 						    ents, nents);
-	} else if (params->virgl) {
+	else if (params->virgl)
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
 						  objs, fence);
-		virtio_gpu_object_attach(vgdev, bo, ents, nents);
-	} else {
+	else
 		virtio_gpu_cmd_create_resource(vgdev, bo, params,
 					       objs, fence);
-		virtio_gpu_object_attach(vgdev, bo, ents, nents);
-	}
+
+	if (!fence)
+		dma_resv_unlock(bo->base.base.resv);
 
 	*bo_ptr = bo;
 	return 0;
 
+err_unlock_objs:
+	if (fence)
+		virtio_gpu_array_unlock_resv(objs);
+	else
+		dma_resv_unlock(bo->base.base.resv);
 err_put_objs:
 	virtio_gpu_array_put_free(objs);
-err_free_entry:
-	kvfree(ents);
 err_put_id:
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 err_put_pages:
diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index 5c514946bbad..6e4ef2593e8f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_submit.c
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -464,8 +464,19 @@ static void virtio_gpu_install_out_fence_fd(struct virtio_gpu_submit *submit)
 
 static int virtio_gpu_lock_buflist(struct virtio_gpu_submit *submit)
 {
-	if (submit->buflist)
-		return virtio_gpu_array_lock_resv(submit->buflist);
+	int err;
+
+	if (submit->buflist) {
+		err = virtio_gpu_array_lock_resv(submit->buflist);
+		if (err)
+			return err;
+
+		err = virtio_gpu_array_prepare(submit->vgdev, submit->buflist);
+		if (err) {
+			virtio_gpu_array_unlock_resv(submit->buflist);
+			return err;
+		}
+	}
 
 	return 0;
 }
-- 
2.43.0

