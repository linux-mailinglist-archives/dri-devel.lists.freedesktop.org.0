Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDCBAC2BA2
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 00:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D79610E199;
	Fri, 23 May 2025 22:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLsp4XXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E97E10E0E1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 22:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748037779; x=1779573779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UkGR7EIE/s/zTNe2WC+Xc9zeDZQ4rrmJG81XQ8n4vLY=;
 b=NLsp4XXae2FxHjkJoBsVJmNjjhG9KiF/L4vEseFoTlzJEfKu6mv7lHHF
 WAJUA3hte1SXEu70FU7hda+KiduTPwifobogcSG0+BE+mT4kGtWtTF9NR
 ej0nSivueknXGNe5bcdCp17Ng5MxFk/uAACITX4sf8jLfF2RG5rMAgFi+
 fncGlmpcRdcTzAViV7rCPfJMX6f+U9c53d9SmWSjlxFloQ1yu7u6gbbaH
 1ykrYYw7iOQDpKSAcBuRKD4fOPslurUjwBBQYHGhUTR1q62VrU4/a0zI2
 B3z3BvNk6K3Yfu+gUSlnVczu50QA5Yeky0Z2sr21sUAhRab9uZgqSxEol Q==;
X-CSE-ConnectionGUID: oPFb7Q+7TM21OC/bWCArJg==
X-CSE-MsgGUID: Ht7KMIRgQoKKSbQkW3aKVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49994370"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="49994370"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 15:02:50 -0700
X-CSE-ConnectionGUID: egr7f1xXQuGJrFuTj8S/6g==
X-CSE-MsgGUID: mNEAyEFLRce6FbUpvQ5jbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="172272186"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.129.124])
 by fmviesa001.fm.intel.com with ESMTP; 23 May 2025 15:02:50 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC PATCH v2 2/2] drm/virtio: Implement save and restore for
 virtio_gpu_objects
Date: Fri, 23 May 2025 15:00:15 -0700
Message-Id: <20250523220015.994716-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523220015.994716-1-dongwon.kim@intel.com>
References: <20250523220015.994716-1-dongwon.kim@intel.com>
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

Host KVM/QEMU loses all graphics resources submitted by the guest OS
upon resumption from sleep or hibernation. This results in invalid
resource errors when the guest OS attempts to interact with the host
regarding those resources.

To address this issue, the virtio-gpu driver now resubmits all existing
resources upon resumption. A linked list has been introduced to maintain
references to all created `virtio_gpu_object` instances and their parameters.

Whenever a new object is created and sent to the host, it is added to this
list. During the `.resume` function, all backed-up objects are re-sent to
the host using the 'create resource' virtio GPU command, ensuring the
resources are restored seamlessly.

v2: - reset bo->attached if bo->attached was set before so that attach
      backing can be redone upon restore

Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c    |  6 +++
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 10 ++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  1 +
 drivers/gpu/drm/virtio/virtgpu_object.c | 72 +++++++++++++++++++++++++
 4 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 0b17fe18ef4e..1f591369a004 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -206,6 +206,12 @@ static int virtgpu_restore(struct virtio_device *vdev)
 
 	virtio_device_ready(vdev);
 
+	error = virtio_gpu_object_restore_all(vgdev);
+	if (error) {
+		DRM_ERROR("Failed to recover objects\n");
+		return error;
+	}
+
 	error = drm_mode_config_helper_resume(dev);
 	if (error) {
 		DRM_ERROR("resume error %d\n", error);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 1279f998c8e0..55f836378237 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -126,6 +126,12 @@ struct virtio_gpu_object_array {
 	struct drm_gem_object *objs[] __counted_by(total);
 };
 
+struct virtio_gpu_object_restore {
+	struct virtio_gpu_object *bo;
+	struct virtio_gpu_object_params params;
+	struct list_head node;
+};
+
 struct virtio_gpu_vbuffer;
 struct virtio_gpu_device;
 
@@ -265,6 +271,7 @@ struct virtio_gpu_device {
 	struct work_struct obj_free_work;
 	spinlock_t obj_free_lock;
 	struct list_head obj_free_list;
+	struct list_head obj_restore;
 
 	struct virtio_gpu_drv_capset *capsets;
 	uint32_t num_capsets;
@@ -479,6 +486,9 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 			       uint32_t *resid);
+
+int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev);
+
 /* virtgpu_prime.c */
 int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 6c1af77ea083..17d182737910 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -162,6 +162,7 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	vgdev->fence_drv.context = dma_fence_context_alloc(1);
 	spin_lock_init(&vgdev->fence_drv.lock);
 	INIT_LIST_HEAD(&vgdev->fence_drv.fences);
+	INIT_LIST_HEAD(&vgdev->obj_restore);
 	INIT_LIST_HEAD(&vgdev->cap_cache);
 	INIT_WORK(&vgdev->config_changed_work,
 		  virtio_gpu_config_changed_work_func);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 5517cff8715c..15c2598187ed 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -61,6 +61,38 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
 	}
 }
 
+static void virtio_gpu_object_add_restore_list(struct virtio_gpu_device *vgdev,
+					       struct virtio_gpu_object *bo,
+					       struct virtio_gpu_object_params *params)
+{
+	struct virtio_gpu_object_restore *new;
+
+	new = kvmalloc(sizeof(*new), GFP_KERNEL);
+	if (!new) {
+		DRM_ERROR("Fail to allocate virtio_gpu_object_restore");
+		return;
+	}
+
+	new->bo = bo;
+	memcpy(&new->params, params, sizeof(*params));
+
+	list_add_tail(&new->node, &vgdev->obj_restore);
+}
+
+static void virtio_gpu_object_del_restore_list(struct virtio_gpu_device *vgdev,
+					       struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_object_restore *curr, *tmp;
+
+	list_for_each_entry_safe(curr, tmp, &vgdev->obj_restore, node) {
+		if (bo == curr->bo) {
+			list_del(&curr->node);
+			kvfree(curr);
+			break;
+		}
+	}
+}
+
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 {
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
@@ -84,6 +116,7 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 		drm_gem_object_release(&bo->base.base);
 		kfree(bo);
 	}
+	virtio_gpu_object_del_restore_list(vgdev, bo);
 }
 
 static void virtio_gpu_free_object(struct drm_gem_object *obj)
@@ -257,8 +290,11 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 					       objs, fence);
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	}
+	/* add submitted object to restore list */
+	virtio_gpu_object_add_restore_list(vgdev, bo, params);
 
 	*bo_ptr = bo;
+
 	return 0;
 
 err_put_objs:
@@ -271,3 +307,39 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	drm_gem_shmem_free(shmem_obj);
 	return ret;
 }
+
+int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev)
+{
+	struct virtio_gpu_object_restore *curr, *tmp;
+	struct virtio_gpu_mem_entry *ents;
+	unsigned int nents;
+	int ret;
+
+	list_for_each_entry_safe(curr, tmp, &vgdev->obj_restore, node) {
+		ret = virtio_gpu_object_shmem_init(vgdev, curr->bo, &ents, &nents);
+		if (ret)
+			break;
+
+		if (curr->params.blob) {
+			virtio_gpu_cmd_resource_create_blob(vgdev, curr->bo, &curr->params,
+							    ents, nents);
+		} else if (curr->params.virgl) {
+			virtio_gpu_cmd_resource_create_3d(vgdev, curr->bo, &curr->params,
+							  NULL, NULL);
+
+			if (curr->bo->attached) {
+				curr->bo->attached = false;
+				virtio_gpu_object_attach(vgdev, curr->bo, ents, nents);
+			}
+		} else {
+			virtio_gpu_cmd_create_resource(vgdev, curr->bo, &curr->params,
+						       NULL, NULL);
+			if (curr->bo->attached) {
+				curr->bo->attached = false;
+				virtio_gpu_object_attach(vgdev, curr->bo, ents, nents);
+			}
+		}
+	}
+
+	return ret;
+}
-- 
2.34.1

