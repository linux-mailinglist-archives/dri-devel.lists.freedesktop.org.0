Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBD15ECC0B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 20:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3820210E071;
	Tue, 27 Sep 2022 18:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2769910E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 18:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664302684; x=1695838684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ft89LrxA3mMGP7w3ZsycDCt3q9BHQmaWGFSysLcNRGo=;
 b=HiY1RP+2R6THQQTBIf6lveyKAAGuIgh2Qlbt1s/ZNbBBefkVQSQ9nHb4
 Hm8pmk8ZszcKSVVXK8i4D3KwbiyCit4JHHB55W8oC4qZFtdD3K6hh/1fu
 SbvIc3HtNz0AWv6iUqBkHSfVsivRx+y44QZtktA4C/5FcF0VaGOtR/nW0
 FV3lhVdTRsW4HovYKz9Daez5S6fghf1Hh4LiSzGvnNS8OxPp9L6hIhxc8
 n8O/yti054iUXxuS3X3gUMk0/ypy+WA301vNlXmgE3OaTvpujV8Q+Vtjp
 2HBwex+2X418fITBpFGgTetTwCJIW15nGDbTCkXORx8RR34zGY/gkhJSY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281762899"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="281762899"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 11:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="623849344"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="623849344"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2022 11:18:03 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/2] drm/virtio: restore virtio_gpu_objects upon suspend
 and resume
Date: Tue, 27 Sep 2022 11:07:27 -0700
Message-Id: <20220927180727.5323-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220927180727.5323-1-dongwon.kim@intel.com>
References: <20220927180727.5323-1-dongwon.kim@intel.com>
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
Cc: dongwon.kim@intel.com, kraxel@redhat.com, vivek.kasireddy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio-gpu host(e.g. QEMU) deletes all virtio-gpu resourses when guest
is suspended then resumed. This behavior is invisible to the guest. As
a result, the guest can send out virtio-gpu commands for those deleted
resources with an assumption they are still there on host's side when
the guest wakes up. All of those comamnds are eventually ended up with
invalid resource errors.

There should be some sort of host and guest resource synchronization to
address this problem, which is the motivation of this new restoration
mechanism.

It is designed in a way that the driver saves virtio-gpu resource
objects somewhere then resumitting them to the host. More details are as
followed.

- Whenever a new virtio-gpu object is created, a list element containing
the object and object params is also created in "virtio_gpu_object_create".
This list element is then added to the linked list "obj_list".

- All list elements in the list are restored by virtio_gpu_object_restore
in virtio-gpu's .restore hook (virtiogpu_restore). virtio_gpu_object_restore
iterates "obj_list" and send the host resource-creation command for each
virtio-gpu object which let the host recreated those active resources.

- List elements in the list are removed when virtio-gpu objects are
unreferenced.

- A part of code in "virtio_gpu_object_create" that sets up shmem for
the object and submit it to the host is reused during restoring process so
it was taken out and defined as a new function, "virtio_gpu_object_pin".

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c    |   6 ++
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  10 ++
 drivers/gpu/drm/virtio/virtgpu_kms.c    |   1 +
 drivers/gpu/drm/virtio/virtgpu_object.c | 122 ++++++++++++++++++------
 4 files changed, 110 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 2738589a04e4..0547b15772f8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -185,6 +185,12 @@ static int virtgpu_restore(struct virtio_device *vdev)
 
 	virtio_device_ready(vdev);
 
+	error = virtio_gpu_object_restore(vgdev);
+	if (error) {
+		DRM_ERROR("Failed to recover objects\n");
+		return error;
+	}
+
 	error = drm_mode_config_helper_resume(dev);
 	if (error) {
 		DRM_ERROR("resume error %d\n", error);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 646f7674a496..cc417f5b127c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -123,6 +123,12 @@ struct virtio_gpu_object_array {
 	struct drm_gem_object *objs[];
 };
 
+struct virtio_gpu_object_list {
+	struct virtio_gpu_object *bo;
+	struct virtio_gpu_object_params params;
+	struct list_head list;
+};
+
 struct virtio_gpu_vbuffer;
 struct virtio_gpu_device;
 
@@ -259,6 +265,7 @@ struct virtio_gpu_device {
 	struct work_struct obj_free_work;
 	spinlock_t obj_free_lock;
 	struct list_head obj_free_list;
+	struct list_head obj_list;
 
 	struct virtio_gpu_drv_capset *capsets;
 	uint32_t num_capsets;
@@ -464,6 +471,9 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 			       uint32_t *resid);
+
+int virtio_gpu_object_restore(struct virtio_gpu_device *vgdev);
+
 /* virtgpu_prime.c */
 int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 3a1d164eaf10..4fb034fbdf0b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -160,6 +160,7 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	vgdev->fence_drv.context = dma_fence_context_alloc(1);
 	spin_lock_init(&vgdev->fence_drv.lock);
 	INIT_LIST_HEAD(&vgdev->fence_drv.fences);
+	INIT_LIST_HEAD(&vgdev->obj_list);
 	INIT_LIST_HEAD(&vgdev->cap_cache);
 	INIT_WORK(&vgdev->config_changed_work,
 		  virtio_gpu_config_changed_work_func);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 8d7728181de0..49660932c822 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -61,6 +61,38 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
 	}
 }
 
+static void virtio_gpu_object_list_add(struct virtio_gpu_device *vgdev,
+				       struct virtio_gpu_object *bo,
+				       struct virtio_gpu_object_params *params)
+{
+	struct virtio_gpu_object_list *new;
+
+	new = kvmalloc(sizeof(*new), GFP_KERNEL);
+	if (!new) {
+		DRM_ERROR("Fail to allocate virtio_gpu_object_list");
+		return;
+	}
+
+	new->bo = bo;
+	memcpy(&new->params, params, sizeof(*params));
+
+	list_add_tail(&new->list, &vgdev->obj_list);
+}
+
+static void virtio_gpu_object_list_del(struct virtio_gpu_device *vgdev,
+				       struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_object_list *curr, *tmp;
+
+	list_for_each_entry_safe(curr, tmp, &vgdev->obj_list, list) {
+		if (bo == curr->bo) {
+			list_del(&curr->list);
+			kvfree(curr);
+			break;
+		}
+	}
+}
+
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 {
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
@@ -81,6 +113,7 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 		drm_gem_object_release(&vram->base.base.base);
 		kfree(vram);
 	}
+	virtio_gpu_object_list_del(vgdev, bo);
 }
 
 static void virtio_gpu_free_object(struct drm_gem_object *obj)
@@ -176,46 +209,31 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	return 0;
 }
 
-int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
-			     struct virtio_gpu_object_params *params,
-			     struct virtio_gpu_object **bo_ptr,
-			     struct virtio_gpu_fence *fence)
+static int virtio_gpu_object_pin(struct virtio_gpu_device *vgdev,
+				 struct virtio_gpu_object *bo,
+				 struct virtio_gpu_object_params *params,
+				 struct virtio_gpu_fence *fence)
 {
-	struct virtio_gpu_object_array *objs = NULL;
-	struct drm_gem_shmem_object *shmem_obj;
-	struct virtio_gpu_object *bo;
+	int ret;
 	struct virtio_gpu_mem_entry *ents;
+	struct virtio_gpu_object_array *objs;
 	unsigned int nents;
-	int ret;
-
-	*bo_ptr = NULL;
-
-	params->size = roundup(params->size, PAGE_SIZE);
-	shmem_obj = drm_gem_shmem_create(vgdev->ddev, params->size);
-	if (IS_ERR(shmem_obj))
-		return PTR_ERR(shmem_obj);
-	bo = gem_to_virtio_gpu_obj(&shmem_obj->base);
-
-	ret = virtio_gpu_resource_id_get(vgdev, &bo->hw_res_handle);
-	if (ret < 0)
-		goto err_free_gem;
-
-	bo->dumb = params->dumb;
 
 	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
 	if (ret != 0)
-		goto err_put_id;
+		return ret;
 
 	if (fence) {
-		ret = -ENOMEM;
 		objs = virtio_gpu_array_alloc(1);
 		if (!objs)
-			goto err_put_id;
+			return -ENOMEM;
 		virtio_gpu_array_add_obj(objs, &bo->base.base);
 
 		ret = virtio_gpu_array_lock_resv(objs);
-		if (ret != 0)
-			goto err_put_objs;
+		if (ret != 0) {
+			virtio_gpu_array_put_free(objs);
+			return ret;
+		}
 	}
 
 	if (params->blob) {
@@ -234,14 +252,60 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	}
 
+	return 0;
+}
+
+int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
+			     struct virtio_gpu_object_params *params,
+			     struct virtio_gpu_object **bo_ptr,
+			     struct virtio_gpu_fence *fence)
+{
+	struct drm_gem_shmem_object *shmem_obj;
+	struct virtio_gpu_object *bo;
+	int ret;
+
+	*bo_ptr = NULL;
+
+	params->size = roundup(params->size, PAGE_SIZE);
+	shmem_obj = drm_gem_shmem_create(vgdev->ddev, params->size);
+	if (IS_ERR(shmem_obj))
+		return PTR_ERR(shmem_obj);
+	bo = gem_to_virtio_gpu_obj(&shmem_obj->base);
+
+	ret = virtio_gpu_resource_id_get(vgdev, &bo->hw_res_handle);
+	if (ret < 0)
+		goto err_free_gem;
+
+	bo->dumb = params->dumb;
+
+	ret = virtio_gpu_object_pin(vgdev, bo, params, fence);
+	if (ret != 0)
+		goto err_put_id;
+
+	/* add submitted object to restore list */
+	virtio_gpu_object_list_add(vgdev, bo, params);
+
 	*bo_ptr = bo;
 	return 0;
 
-err_put_objs:
-	virtio_gpu_array_put_free(objs);
 err_put_id:
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 err_free_gem:
 	drm_gem_shmem_free(shmem_obj);
 	return ret;
 }
+
+int virtio_gpu_object_restore(struct virtio_gpu_device *vgdev)
+{
+	struct virtio_gpu_object_list *curr, *tmp;
+	int ret = 0;
+
+	list_for_each_entry_safe(curr, tmp, &vgdev->obj_list, list) {
+		ret = virtio_gpu_object_pin(vgdev, curr->bo, &curr->params,
+					    NULL);
+		if (ret != 0)
+			break;
+	}
+
+	return ret;
+}
-- 
2.20.1

