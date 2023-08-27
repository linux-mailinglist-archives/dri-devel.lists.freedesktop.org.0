Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C726C78A0AD
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 19:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECFA10E1F5;
	Sun, 27 Aug 2023 17:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F4910E1E1;
 Sun, 27 Aug 2023 17:56:28 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DEA1F6607318;
 Sun, 27 Aug 2023 18:56:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693158987;
 bh=RA+A0kUbp1llMe7XUDKjCL+L8m+dYX+5lkVHEZr8h5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JpxAMajyS3+RLYyniTlTzHIoN+2YugJY9chGYDTrTlp6TWW7G8uJpoKU4Hir3JfTP
 4PNVN27fjefJa7/SME/YtiEVjk9Ig7uYsd4gt3qQp6KxocxRMqEtV0MVHfhsn7e6oB
 oPxKtn2bAvzXLr0ZKCZqtlUOpK45LrjEQMcrUWOxyO5N6V+tCVd/KO4Opwe975pvgY
 fBLd8VpxRvTVh+b+1+H4m74JQtOdsoyjv/zx6IGqXLzNadDiSVFhC5muWSlT+RmMgU
 pYFYwgza2n2ILiIqVFi7UMeDP2G1M1K70N8uLf1kDlzbH1vsA4qDgIouNpbGJ/9FKc
 5zlGxLcaUj9wg==
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
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v15 21/23] drm/virtio: Attach shmem BOs dynamically
Date: Sun, 27 Aug 2023 20:54:47 +0300
Message-ID: <20230827175449.1766701-22-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for addition of memory shrinker support by attaching shmem pages
to host dynamically on first use. The attachment vq command wasn't fenced
and there was no vq kick made in the BO creation code path, hence the
the attachment already was happening dynamically, but implicitly. Making
attachment explicitly dynamic will allow to simplify and reuse more code
when shrinker will be added. The virtio_gpu_object_shmem_init() now works
under held reservation lock, which will be important to have for shrinker.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  7 +++
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 26 ++++++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 32 ++++++----
 drivers/gpu/drm/virtio/virtgpu_object.c | 80 ++++++++++++++++++++-----
 drivers/gpu/drm/virtio/virtgpu_submit.c | 15 ++++-
 5 files changed, 132 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 5a4b74b7b318..8c82530eae82 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -89,6 +89,7 @@ struct virtio_gpu_object {
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
+	bool detached;
 	bool host3d_blob, guest_blob;
 	uint32_t blob_mem, blob_flags;
 
@@ -313,6 +314,8 @@ void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
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
index b24b11f25197..070c29cea26a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -246,6 +246,10 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (ret != 0)
 		goto err_put_free;
 
+	ret = virtio_gpu_array_prepare(vgdev, objs);
+	if (ret)
+		goto err_unlock;
+
 	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
 	if (!fence) {
 		ret = -ENOMEM;
@@ -288,11 +292,25 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
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
 
@@ -301,23 +319,13 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
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
index 97020ed56b81..044b08aa78ac 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -142,10 +142,13 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	struct sg_table *pages;
 	int si;
 
-	pages = drm_gem_shmem_get_pages_sgt(&bo->base);
+	pages = drm_gem_shmem_get_pages_sgt_locked(&bo->base);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
+	if (!ents)
+		return 0;
+
 	if (use_dma_api)
 		*nents = pages->nents;
 	else
@@ -176,6 +179,40 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
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
@@ -202,45 +239,60 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
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
+		ret = virtio_gpu_object_shmem_init(vgdev, bo, NULL, NULL);
+		if (ret)
+			goto err_unlock_objs;
 
+		bo->detached = true;
+	}
+
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
 err_free_gem:
diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index 3c00135ead45..94867f485a64 100644
--- a/drivers/gpu/drm/virtio/virtgpu_submit.c
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -465,8 +465,19 @@ static void virtio_gpu_install_out_fence_fd(struct virtio_gpu_submit *submit)
 
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
2.41.0

