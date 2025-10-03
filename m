Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45494BB5F21
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 07:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C3A10E040;
	Fri,  3 Oct 2025 05:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGbkhHLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B8610E040
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 05:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759469644; x=1791005644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d65RWgWlXpd7kX8OrnVNXXyY72HPFKLYbzq9SfreSa4=;
 b=oGbkhHLnUWLT2HhwomwI8lHx2I52SQLtXX29lhGRMDbBQhdf6CMg1Cn+
 nu1R0vs57MV8OHQIokIJeTc/hR5CyVdENvqIL4Bl0ZDziUzCyVPdy+BfN
 kh0EO3h0p7IudTE54wYRWgxac2bVDKhaD+c29f+D8R1gtxOlTrsyjuKha
 S9m15gcpo5q12Q9jdJVsV21kLNimsRcc4pTiQjnVQXrP/mJ3hQM44tESD
 2pYiakjltQSbiP0b57DOXdLCC2HrCk8KLLVAITrrq9SAOpT47rlAwjg/X
 rH08jUMTjIzHqnXQyNAD1UKPxH4icOLp4IEfAGHhRAuPbzBbcmnlnPNHT g==;
X-CSE-ConnectionGUID: ZlRBU7lISF2s69hRsobjWw==
X-CSE-MsgGUID: hFSiER6NQ0qlqZ99mdVLjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="65393215"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="65393215"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 22:34:04 -0700
X-CSE-ConnectionGUID: d+xfZRKvSnyfPAI4e0IjDg==
X-CSE-MsgGUID: 1Kubagy+RImCU9AKWxEBMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="179154856"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2025 22:34:03 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com,
	nirmoyd@nvidia.com
Subject: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Date: Thu,  2 Oct 2025 22:34:01 -0700
Message-Id: <20251003053402.732218-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003053402.732218-1-dongwon.kim@intel.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
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

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Nirmoy Das <nirmoyd@nvidia.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  9 ++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  2 +
 drivers/gpu/drm/virtio/virtgpu_object.c | 61 +++++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 1279f998c8e0..3ddcf46b35f8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -98,6 +98,10 @@ struct virtio_gpu_object {
 
 	int uuid_state;
 	uuid_t uuid;
+
+	/* for restoration of objects after hibernation */
+	struct virtio_gpu_object_params params;
+	struct list_head list;
 };
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, base.base)
@@ -265,6 +269,8 @@ struct virtio_gpu_device {
 	struct work_struct obj_free_work;
 	spinlock_t obj_free_lock;
 	struct list_head obj_free_list;
+	spinlock_t obj_restore_lock;
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
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index cbebe19c3fb3..0135d332224b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -170,6 +170,8 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		  virtio_gpu_array_put_free_work);
 	INIT_LIST_HEAD(&vgdev->obj_free_list);
 	spin_lock_init(&vgdev->obj_free_lock);
+	INIT_LIST_HEAD(&vgdev->obj_restore_list);
+	spin_lock_init(&vgdev->obj_restore_lock);
 
 #ifdef __LITTLE_ENDIAN
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_VIRGL))
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index e6363c887500..de2452439797 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -61,10 +61,26 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
 		ida_free(&vgdev->resource_ida, id - 1);
 }
 
+static void virtio_gpu_object_del_restore_list(struct virtio_gpu_device *vgdev,
+					       struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_object *curr, *tmp;
+
+	list_for_each_entry_safe(curr, tmp, &vgdev->obj_restore_list, list) {
+		if (bo == curr) {
+			spin_lock(&vgdev->obj_restore_lock);
+			list_del(&curr->list);
+			spin_unlock(&vgdev->obj_restore_lock);
+			break;
+		}
+	}
+}
+
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 {
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
+	virtio_gpu_object_del_restore_list(vgdev, bo);
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 	if (virtio_gpu_is_shmem(bo)) {
 		drm_gem_shmem_free(&bo->base);
@@ -258,6 +274,13 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	}
 
+	/* store the params and add the object to the restore list */
+	memcpy(&bo->params, params, sizeof(*params));
+
+	spin_lock(&vgdev->obj_restore_lock);
+	list_add_tail(&bo->list, &vgdev->obj_restore_list);
+	spin_unlock(&vgdev->obj_restore_lock);
+
 	*bo_ptr = bo;
 	return 0;
 
@@ -271,3 +294,41 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
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
+	spin_lock(&vgdev->obj_restore_lock);
+	list_for_each_entry_safe(bo, tmp, &vgdev->obj_restore_list, list) {
+		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+		if (ret)
+			break;
+
+		if (bo->params.blob) {
+			virtio_gpu_cmd_resource_create_blob(vgdev, bo, &bo->params,
+							    ents, nents);
+		} else if (bo->params.virgl) {
+			virtio_gpu_cmd_resource_create_3d(vgdev, bo, &bo->params,
+							  NULL, NULL);
+
+			if (bo->attached) {
+				bo->attached = false;
+				virtio_gpu_object_attach(vgdev, bo, ents, nents);
+			}
+		} else {
+			virtio_gpu_cmd_create_resource(vgdev, bo, &bo->params,
+						       NULL, NULL);
+			if (bo->attached) {
+				bo->attached = false;
+				virtio_gpu_object_attach(vgdev, bo, ents, nents);
+			}
+		}
+	}
+	spin_unlock(&vgdev->obj_restore_lock);
+
+	return ret;
+}
-- 
2.34.1

