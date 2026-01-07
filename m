Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF76CFF771
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AB410E64C;
	Wed,  7 Jan 2026 18:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chxwqXm2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C9210E1E9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767810757; x=1799346757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9yugk1+kyqaSZhb0k9+GKoY+TOTXQ43OYbWsoGFpzy4=;
 b=chxwqXm21aOCmtPwK8v9iQHpJqrkFTPOEnuFagJnAwX3vnUGV17h98Zn
 gX51s6ST2szekmuEfuj3VnX3uqxgee8FRKrHHzMnI5GZFpRNQiOt4AJJz
 a7fPr+vughan7tCFN9WqUgvR1w5x3NR70inYDz+wTzcagHb97h1FqDtOs
 F8y8wDJnOQVbwgVYvvFy7DCg2P0+x9FNucN7XTa1Y95/2GflkwVK1AxSD
 b53jGvmNYmXFtQSp1Hm+UrlNcYkhZpVQz+jaEU58SiETLbMTtQPJWzcUG
 XjI29MH/XSAVEpqdPNwU1aNLfnGJzhjFtG6dkyYLDY0N4x/nBxibJRlyR A==;
X-CSE-ConnectionGUID: sG7STZ2pRMiy9QMbUvXXJQ==
X-CSE-MsgGUID: GqqQntxzS7Kq6c+EXQeLRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68923705"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="68923705"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:32:37 -0800
X-CSE-ConnectionGUID: YMgRam2sTqK1K1psBAt1GQ==
X-CSE-MsgGUID: Ut58FgCnQ0WtcMzvl8Uplg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207138302"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by orviesa003.jf.intel.com with ESMTP; 07 Jan 2026 10:32:37 -0800
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org, airlied@redhat.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com
Cc: nirmoyd@nvidia.com,
	vivek.kasireddy@intel.com
Subject: [PATCH v7 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Date: Wed,  7 Jan 2026 10:27:44 -0800
Message-Id: <20260107182745.229481-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107182745.229481-1-dongwon.kim@intel.com>
References: <20260107182745.229481-1-dongwon.kim@intel.com>
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

To resolve this, the virtio-gpu driver now tracks all active virtio_gpu_objects
and provides a mechanism to restore them by re-submitting the objects to QEMU
when needed (e.g., during resume from hibernation).

v2: - Attach backing is done if bo->attached was set before

v3: - Restoration is no longer triggered via .restore; instead, it is handled
      by a PM notifier only during hibernation.

v4: - Remove virtio_gpu_object from the restore list before freeing the object
      to prevent an use-after-free situation.
      (Nirmoy Das)

    - Protect restore list operations with a spinlock
      (Nirmoy Das)

    - Initialize ret with 0 in virtio_gpu_object_restore_all
      (Nirmoy Das)

    - Move restore list node into virtio_gpu_bo struct to reduce memory usage
      (Dmitry Osipenko)

v5: - Include object backed by imported dmabuf
      (Dmitry Osipenko)

    - Not storing virgl objects in the restore_list as virgl 3D objects are not
      recoverable.
      (Dmitry Osipenko)

    - Change the name 'list',a node in restore_list to 'restore_node'
      (Nirmoy Das)

    - Use mutex instead of spinlock when updating restore_list
      (Nirmoy Das)

    - Initialize restore_node when virtio_gpu_object is created - this is to
      determine whether the object should be removed from the restore_list with
      'list_empty' function when it is time to free the object as not all objects
      will be added to the list.

v6: - Add a helper, virtio_gpu_add_object_to_restore_list
      (Dmitry Osipenko)

Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Nirmoy Das <nirmoyd@nvidia.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 14 ++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  3 ++
 drivers/gpu/drm/virtio/virtgpu_object.c | 66 +++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_prime.c  | 41 +++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vram.c   |  2 +
 5 files changed, 126 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 1279f998c8e0..1632d92ee346 100644
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
@@ -479,6 +485,12 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 			       uint32_t *resid);
+
+void virtio_gpu_add_object_to_restore_list(struct virtio_gpu_device *vgdev,
+					   struct virtio_gpu_object *bo);
+
+int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev);
+
 /* virtgpu_prime.c */
 int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo);
@@ -493,6 +505,8 @@ int virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
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
index e6363c887500..8e8a8ec4a361 100644
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
@@ -258,6 +266,12 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	}
 
+	if (!params->virgl) {
+		/* store non-virgl object with its param to the restore list */
+		bo->params = *params;
+		virtio_gpu_add_object_to_restore_list(vgdev, bo);
+	}
+
 	*bo_ptr = bo;
 	return 0;
 
@@ -271,3 +285,55 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	drm_gem_shmem_free(shmem_obj);
 	return ret;
 }
+
+void virtio_gpu_add_object_to_restore_list(struct virtio_gpu_device *vgdev,
+					   struct virtio_gpu_object *bo)
+{
+	mutex_lock(&vgdev->obj_restore_lock);
+	list_add_tail(&bo->restore_node, &vgdev->obj_restore_list);
+	mutex_unlock(&vgdev->obj_restore_lock);
+}
+
+int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev)
+{
+	struct virtio_gpu_object *bo, *tmp;
+	struct virtio_gpu_mem_entry *ents;
+	unsigned int nents;
+	int ret = 0;
+
+	mutex_lock(&vgdev->obj_restore_lock);
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
+	mutex_unlock(&vgdev->obj_restore_lock);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index ce49282198cb..088eaf000a9a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -264,6 +264,12 @@ static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
 	dma_buf_unpin(attach);
 	dma_resv_unlock(resv);
 
+	/* store the dmabuf imported object with its params to
+	 * the restore list
+	 */
+	bo->params = params;
+	virtio_gpu_add_object_to_restore_list(vgdev, bo);
+
 	return 0;
 
 err_import:
@@ -274,6 +280,39 @@ static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
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
@@ -319,6 +358,8 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
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

