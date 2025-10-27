Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71E6C1171E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 21:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1440010E189;
	Mon, 27 Oct 2025 20:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRylDafj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA27510E0A5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761598410; x=1793134410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QMhEx6J5+1MfzzTUYy68iwyUshDyrwhxkn1eCgHTwYQ=;
 b=mRylDafjgvQVdUuNJuPalMTOv1UQV3Ro4GqHYt7JTImfcBsfxsocIv8w
 unOXeeMua4QV8B8DMGYzEaN0FHnQvf2/oS8SR8z2djjW+fv7UkjLbtpZS
 rOVl6yqwL35oESJD/D1HybsTYQnanD+cA1U6LGD/GdBNPcV0sXqmma+O7
 67UU9EzQHAIHhI5NgjmgmTHTpRnR1Fq1D4Dps0e0EQb1+tG5GTi6EATIL
 oqCHaVR9m8jhSCv0v7aSr3OdNMRE9Vf5Mps3mI6BA7wNxXjez1+5tzn5D
 eE2OV5czkJWGUuJFlPsYTWfLfrcF3zZ+oqStBJDok+UcquahhEDqZnrXD w==;
X-CSE-ConnectionGUID: 6+fKx1O4SjmKcMsvc6mkPQ==
X-CSE-MsgGUID: VbwhLIGqRbCxaBbq4FF7yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62895992"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62895992"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:53:30 -0700
X-CSE-ConnectionGUID: AF7qlFSXRCC1rb8D+XFG2g==
X-CSE-MsgGUID: El2MQVQASaOOrO7wG+Aekg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184380560"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by orviesa010.jf.intel.com with ESMTP; 27 Oct 2025 13:53:31 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com, airlied@redhat.com, kraxel@redhat.com,
 nirmoyd@nvidia.com
Subject: [PATCH v6 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Date: Mon, 27 Oct 2025 13:53:22 -0700
Message-Id: <20251027205323.491349-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027205323.491349-1-dongwon.kim@intel.com>
References: <20251027205323.491349-1-dongwon.kim@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dongwon Kim <dongwon.kim@intel.com>

When the host KVM/QEMU resumes from hibernation, it loses all graphics
resources previously submitted by the guest OS, as the QEMU process is
terminated during the suspend-resume cycle. This leads to invalid resource
errors when the guest OS attempts to interact with the host using those
resources after resumption.

To resolve this, virtio-gpu driver tracks all active virtio_gpu_objects
and provides a mechanism to restore them by resubmitting the objects to
QEMU when needed (e.g., during resume from hibernation).

v2: - Attach backing is done if bo->attached was set before

v3: - Restoration is no longer triggered via .restore; instead, it is
      handled by a PM notifier only during hibernation.

v4: - Remove virtio_gpu_object from the restore list before freeing
      the object to prevent an use-after-free situation.
      (Nirmoy Das)

    - Protect restore list operations with a spinlock
      (Nirmoy Das)

    - Initialize ret with 0 in virtio_gpu_object_restore_all
      (Nirmoy Das)

    - Move restore list node into virtio_gpu_bo struct to reduce memory
      usage
      (Dmitry Osipenko)

v5: - Include object backed by imported dmabuf
      (Dmitry Osipenko)

    - Not storing virgl objects in the restore_list as virgl 3D objects
      are not recoverable.
      (Dmitry Osipenko)

    - Change the name 'list',a node in restore_list to 'restore_node'
      (Nirmoy Das)

    - Use mutex instead of spinlock when updating restore_list
      (Nirmoy Das)

    - Initialize restore_node when virtio_gpu_object is created - this
      is to check if the node is in the list with 'list_empty' before
      removing it.

Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Nirmoy Das <nirmoyd@nvidia.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 11 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  3 ++
 drivers/gpu/drm/virtio/virtgpu_object.c | 59 +++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_prime.c  | 44 ++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vram.c   |  2 +
 5 files changed, 119 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 1279f998c8e0..db1d4aa6eae8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -98,6 +98,10 @@ struct virtio_gpu_object {
 
 	int uuid_state;
 	uuid_t uuid;
+
+	/* for restoration of objects after hibernation */
+	struct virtio_gpu_object_params params;
+	struct list_head restore_node;
 };
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, base.base)
@@ -265,6 +269,8 @@ struct virtio_gpu_device {
 	struct work_struct obj_free_work;
 	spinlock_t obj_free_lock;
 	struct list_head obj_free_list;
+	struct mutex obj_restore_lock;
+	struct list_head obj_restore_list;
 
 	struct virtio_gpu_drv_capset *capsets;
 	uint32_t num_capsets;
@@ -479,6 +485,9 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 			       uint32_t *resid);
+
+int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev);
+
 /* virtgpu_prime.c */
 int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo);
@@ -493,6 +502,8 @@ int virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
 			       unsigned int *nents,
 			       struct virtio_gpu_object *bo,
 			       struct dma_buf_attachment *attach);
+int virtgpu_dma_buf_obj_resubmit(struct virtio_gpu_device *vgdev,
+				 struct virtio_gpu_object *bo);
 
 /* virtgpu_debugfs.c */
 void virtio_gpu_debugfs_init(struct drm_minor *minor);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index cbebe19c3fb3..8ad79de70d85 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -170,6 +170,8 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		  virtio_gpu_array_put_free_work);
 	INIT_LIST_HEAD(&vgdev->obj_free_list);
 	spin_lock_init(&vgdev->obj_free_lock);
+	INIT_LIST_HEAD(&vgdev->obj_restore_list);
+	mutex_init(&vgdev->obj_restore_lock);
 
 #ifdef __LITTLE_ENDIAN
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_VIRGL))
@@ -298,6 +300,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	flush_work(&vgdev->config_changed_work);
 	virtio_reset_device(vgdev->vdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
+	mutex_destroy(&vgdev->obj_restore_lock);
 }
 
 void virtio_gpu_release(struct drm_device *dev)
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index e6363c887500..4a52235a7230 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -65,6 +65,12 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 {
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
+	if (!list_empty(&bo->restore_node)) {
+		mutex_lock(&vgdev->obj_restore_lock);
+		list_del(&bo->restore_node);
+		mutex_unlock(&vgdev->obj_restore_lock);
+	}
+
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 	if (virtio_gpu_is_shmem(bo)) {
 		drm_gem_shmem_free(&bo->base);
@@ -220,6 +226,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		return PTR_ERR(shmem_obj);
 	bo = gem_to_virtio_gpu_obj(&shmem_obj->base);
 
+	INIT_LIST_HEAD(&bo->restore_node);
+
 	ret = virtio_gpu_resource_id_get(vgdev, &bo->hw_res_handle);
 	if (ret < 0)
 		goto err_free_gem;
@@ -258,6 +266,15 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	}
 
+	if (!params->virgl) {
+		/* store non-virgl object with its param to the restore list */
+		memcpy(&bo->params, params, sizeof(*params));
+
+		mutex_lock(&vgdev->obj_restore_lock);
+		list_add_tail(&bo->restore_node, &vgdev->obj_restore_list);
+		mutex_unlock(&vgdev->obj_restore_lock);
+	}
+
 	*bo_ptr = bo;
 	return 0;
 
@@ -271,3 +288,45 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	drm_gem_shmem_free(shmem_obj);
 	return ret;
 }
+
+int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev)
+{
+	struct virtio_gpu_object *bo, *tmp;
+	struct virtio_gpu_mem_entry *ents;
+	unsigned int nents;
+	int ret = 0;
+
+	list_for_each_entry_safe(bo, tmp, &vgdev->obj_restore_list,
+				 restore_node) {
+		if (drm_gem_is_imported(&bo->base.base)) {
+			ret = virtgpu_dma_buf_obj_resubmit(vgdev, bo);
+			if (ret)
+				break;
+
+			continue;
+		}
+
+		if (bo->params.blob || bo->attached) {
+			ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents,
+							   &nents);
+			if (ret)
+				break;
+		}
+
+		if (bo->params.blob) {
+			virtio_gpu_cmd_resource_create_blob(vgdev, bo,
+							    &bo->params,
+							    ents, nents);
+		} else {
+			virtio_gpu_cmd_create_resource(vgdev, bo, &bo->params,
+						       NULL, NULL);
+			if (bo->attached) {
+				bo->attached = false;
+				virtio_gpu_object_attach(vgdev, bo, ents,
+							 nents);
+			}
+		}
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index ce49282198cb..9d2d678a1ea7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -264,6 +264,15 @@ static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
 	dma_buf_unpin(attach);
 	dma_resv_unlock(resv);
 
+	/* store the dmabuf imported object with its params to
+	 * the restore list
+	 */
+	memcpy(&bo->params, &params, sizeof(params));
+
+	mutex_lock(&vgdev->obj_restore_lock);
+	list_add_tail(&bo->restore_node, &vgdev->obj_restore_list);
+	mutex_unlock(&vgdev->obj_restore_lock);
+
 	return 0;
 
 err_import:
@@ -274,6 +283,39 @@ static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
 	return ret;
 }
 
+int virtgpu_dma_buf_obj_resubmit(struct virtio_gpu_device *vgdev,
+				 struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_mem_entry *ents;
+	struct scatterlist *sl;
+	int i;
+
+	if (!bo->sgt) {
+		DRM_ERROR("no sgt bound to virtio_gpu_object\n");
+		return -ENOMEM;
+	}
+
+	ents = kvmalloc_array(bo->sgt->nents,
+			      sizeof(struct virtio_gpu_mem_entry),
+			      GFP_KERNEL);
+	if (!ents) {
+		DRM_ERROR("failed to allocate ent list\n");
+		return -ENOMEM;
+	}
+
+	for_each_sgtable_dma_sg(bo->sgt, sl, i) {
+		ents[i].addr = cpu_to_le64(sg_dma_address(sl));
+		ents[i].length = cpu_to_le32(sg_dma_len(sl));
+		ents[i].padding = 0;
+	}
+
+	virtio_gpu_cmd_resource_create_blob(vgdev, bo, &bo->params,
+					    ents, bo->sgt->nents);
+
+	return 0;
+}
+
+
 static const struct drm_gem_object_funcs virtgpu_gem_dma_buf_funcs = {
 	.free = virtgpu_dma_buf_free_obj,
 };
@@ -319,6 +361,8 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 	if (!bo)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_LIST_HEAD(&bo->restore_node);
+
 	obj = &bo->base.base;
 	obj->resv = buf->resv;
 	obj->funcs = &virtgpu_gem_dma_buf_funcs;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 5ad3b7c6f73c..dffba04849f5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -200,6 +200,8 @@ int virtio_gpu_vram_create(struct virtio_gpu_device *vgdev,
 	obj = &vram->base.base.base;
 	obj->funcs = &virtio_gpu_vram_funcs;
 
+	INIT_LIST_HEAD(&vram->base.restore_node);
+
 	params->size = PAGE_ALIGN(params->size);
 	drm_gem_private_object_init(vgdev->ddev, obj, params->size);
 
-- 
2.34.1

