Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E72B9BC56
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 21:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB9F10E7CD;
	Wed, 24 Sep 2025 19:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZN+On0yD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EF510E7C9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758743468; x=1790279468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UoImaAaRkSBvmLrr1xoZyqQMiIMaLj3fMdbsTl1NFMg=;
 b=ZN+On0yDK+SUW0no3QafYpgQPZlGlYu7bInJn4ofArSZl4PJnbxqq+9m
 ILfTBJhVBURaYulQo0biBT0J3rWndpB1sHKX0KPAO0DMnuZVO6VmqfAJg
 ik+mLPNSHsx544h3ZGX1M60kNJTf7fcET3+G3zp7T+/lWSd0uLTgzS81v
 6VBYrpJXqskHZg4cYBWJ2OPaGl7ubIKq/MgnGqQFwFbvwaM8kfPuQ6pZ4
 Ba4pCCP8jID1AFE5RQglaXUsoksRhsjv64iDxCSF53QmB8vhYZgzF97by
 upwAovYjM7asMYtFTXNi0WO21Q07Blq/Qatjk+c54gzNYwVvv8aGVIK5u g==;
X-CSE-ConnectionGUID: e1A2av0aTE+VN7kwEukBmg==
X-CSE-MsgGUID: iI20eSxZSxyhQcwBRmsA2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64889875"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="64889875"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:51:08 -0700
X-CSE-ConnectionGUID: vhkCrANPQ0e/w/JITZ7nMA==
X-CSE-MsgGUID: XMsVW/I/SbGs3/D5bulSeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176966247"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by orviesa007.jf.intel.com with ESMTP; 24 Sep 2025 12:51:08 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com
Subject: [PATCH v4 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Date: Wed, 24 Sep 2025 12:47:54 -0700
Message-Id: <20250924194755.1265531-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924194755.1265531-1-dongwon.kim@intel.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
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

v3: - Restoration of virtio-gpu resources is no longer triggered via .restore;
      instead, it is handled by a PM notifier only during hibernation.

Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 10 ++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  1 +
 drivers/gpu/drm/virtio/virtgpu_object.c | 71 +++++++++++++++++++++++++
 3 files changed, 82 insertions(+)

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
index cbebe19c3fb3..08f8e71a7072 100644
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
index e6363c887500..28fdfc70fa49 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -61,6 +61,38 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
 		ida_free(&vgdev->resource_ida, id - 1);
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
@@ -258,6 +291,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	}
 
+	/* add submitted object to restore list */
+	virtio_gpu_object_add_restore_list(vgdev, bo, params);
 	*bo_ptr = bo;
 	return 0;
 
@@ -271,3 +306,39 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
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

