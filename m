Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B361079A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 04:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E4310E74A;
	Fri, 28 Oct 2022 02:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606810E74A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 02:04:13 +0000 (UTC)
X-UUID: 51ad158fb887480b97349475c6d088ac-20221028
X-CPASD-INFO: da4b9086a7f94a3095d4db7d96cbed57@rbFugmZiZmaNV6iFg6R-allmlGSUjle
 ze3CDkpOUYVeVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3s6NugmleaA==
X-CLOUD-ID: da4b9086a7f94a3095d4db7d96cbed57
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:0.0, URL:-5,
 TVAL:184.
 0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:420.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-5
 .0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:0, AD:0, FFOB:0.0, CFOB:0.0, SPC:0,
 SIG:-
 5, AUF:2, DUF:6943, ACD:123, DCD:123, SL:0, EISP:0, AG:0, CFC:0.668, CFSR:0.038,
 UAT:0, 
 RAF:0, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0, ESB:0,
 ATTNUM:0 ,EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 51ad158fb887480b97349475c6d088ac-20221028
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 51ad158fb887480b97349475c6d088ac-20221028
X-User: liweishi@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <liweishi@kylinos.cn>) (Generic MTA)
 with ESMTP id 286517487; Fri, 28 Oct 2022 10:04:09 +0800
From: liweishi <liweishi@kylinos.cn>
To: airlied@redhat.com,
	kraxel@redhat.com
Subject: [PATCH] drm/virtio: fix the black screen error when waking
Date: Fri, 28 Oct 2022 10:03:49 +0800
Message-Id: <20221028020349.8722-1-liweishi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: liweishi@kylinos.cn, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Ming Xie <xieming@kylinos.cn>,
 gurchetansingh@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mainline: NA
Category: Bugfix
CVE: NA

When the system wakes up from sleeping, all virtio devices
will be reset. However, restting virtio gpu device will delete
the virtqueue and resources saved on the virtio gpu backend,
making it impossible for the virtio gpu driver to communicate
with the virtio gpu backend and causing a black screen error.
Rebuild the virtqueue and resources can avoid this problem.

Signed-off-by: liweishi<liweishi@kylinos.cn>

Suggested-by: Ming Xie<xieming@kylinos.cn>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c    | 22 +++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 12 +++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    | 47 +++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 40 +++++++++++++++++++++
 4 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 0035affc3e59..910b146d7e52 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -129,6 +129,23 @@ static void virtio_gpu_config_changed(struct virtio_device *vdev)
 	schedule_work(&vgdev->config_changed_work);
 }
 
+#ifdef CONFIG_PM_SLEEP
+/*
+ * when the system wakes up from sleeping, all virtio devices
+ * will be reset. However, restting virtio gpu device will delete
+ * the virtqueue and resources saved on the virtio gpu backend,
+ * making it impossible for the virtio gpu driver to communicate
+ * with the virtio gpu backend and causing a black screen problem.
+ * rebuild the virtqueue and resources can avoid this problem.
+ */
+static int virtio_gpu_restore(struct virtio_device *vdev)
+{
+	struct drm_device *dev = vdev->priv;
+
+	return virtio_gpu_rebuild(dev);
+}
+#endif
+
 static struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_GPU, VIRTIO_DEV_ANY_ID },
 	{ 0 },
@@ -156,7 +173,10 @@ static struct virtio_driver virtio_gpu_driver = {
 	.id_table = id_table,
 	.probe = virtio_gpu_probe,
 	.remove = virtio_gpu_remove,
-	.config_changed = virtio_gpu_config_changed
+	.config_changed = virtio_gpu_config_changed,
+#ifdef CONFIG_PM_SLEEP
+	.restore = virtio_gpu_restore,
+#endif
 };
 
 module_virtio_driver(virtio_gpu_driver);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9b98470593b0..b652b3790bb1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -212,6 +212,13 @@ struct virtio_gpu_drv_cap_cache {
 	atomic_t is_valid;
 };
 
+struct virtio_gpu_object_resource {
+	struct list_head head;
+	struct virtio_gpu_object *bo;
+	/* parameters used in resource creation */
+	struct virtio_gpu_object_params params;
+};
+
 struct virtio_gpu_device {
 	struct drm_device *ddev;
 
@@ -262,6 +269,8 @@ struct virtio_gpu_device {
 	spinlock_t resource_export_lock;
 	/* protects map state and host_visible_mm */
 	spinlock_t host_visible_lock;
+	/* stores resource creation information */
+	struct list_head res_list;
 };
 
 struct virtio_gpu_fpriv {
@@ -285,6 +294,7 @@ void virtio_gpu_deinit(struct drm_device *dev);
 void virtio_gpu_release(struct drm_device *dev);
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
 void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file);
+int virtio_gpu_rebuild(struct drm_device *dev);
 
 /* virtgpu_gem.c */
 int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
@@ -456,6 +466,8 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 			       uint32_t *resid);
+void virtio_gpu_recreate_resource(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object_resource *vgor);
 /* virtgpu_prime.c */
 int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 27b7f14dae89..72a6bb3e9502 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -149,6 +149,7 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	spin_lock_init(&vgdev->fence_drv.lock);
 	INIT_LIST_HEAD(&vgdev->fence_drv.fences);
 	INIT_LIST_HEAD(&vgdev->cap_cache);
+	INIT_LIST_HEAD(&vgdev->res_list);
 	INIT_WORK(&vgdev->config_changed_work,
 		  virtio_gpu_config_changed_work_func);
 
@@ -271,6 +272,15 @@ static void virtio_gpu_cleanup_cap_cache(struct virtio_gpu_device *vgdev)
 	}
 }
 
+static void virtio_gpu_cleanup_object_resources(struct virtio_gpu_device *vgdev)
+{
+	struct virtio_gpu_object_resource *vgor, *tmp;
+
+	list_for_each_entry_safe(vgor, tmp, &vgdev->res_list, head) {
+		kfree(vgor);
+	}
+}
+
 void virtio_gpu_deinit(struct drm_device *dev)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
@@ -293,11 +303,48 @@ void virtio_gpu_release(struct drm_device *dev)
 	virtio_gpu_modeset_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
 	virtio_gpu_cleanup_cap_cache(vgdev);
+	virtio_gpu_cleanup_object_resources(vgdev);
 
 	if (vgdev->has_host_visible)
 		drm_mm_takedown(&vgdev->host_visible_mm);
 }
 
+int virtio_gpu_rebuild(struct drm_device *dev)
+{
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_device *vdev = vgdev->vdev;
+
+	/* rebuild vgdev->ctrlq.vq and vgdev->cursorq.vq */
+	struct virtqueue *vqs[2];
+	int ret;
+
+	static vq_callback_t *callbacks[] = {
+		virtio_gpu_ctrl_ack, virtio_gpu_cursor_ack
+	};
+	static const char * const names[] = { "control", "cursor" };
+
+	vdev->config->del_vqs(vdev);
+	ret = virtio_find_vqs(vdev, 2, vqs, callbacks, names, NULL);
+	if (ret)
+		return ret;
+
+	vgdev->ctrlq.vq = vqs[0];
+	vgdev->cursorq.vq = vqs[1];
+
+	/*
+	 * if resource_blob and virgl 3d are not used,
+	 * all resources should be recreated.
+	 */
+	if (!vgdev->has_resource_blob && !vgdev->has_virgl_3d) {
+		struct virtio_gpu_object_resource *vgor;
+
+		list_for_each_entry(vgor, &vgdev->res_list, head) {
+			virtio_gpu_recreate_resource(vgdev, vgor);
+		}
+	}
+	return 0;
+}
+
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 8d7728181de0..349a62a4992b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -83,6 +83,30 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 	}
 }
 
+static void virtio_gpu_object_resource_restore(struct virtio_gpu_device *vgdev,
+						struct virtio_gpu_object *bo,
+						struct virtio_gpu_object_params *params)
+{
+	struct virtio_gpu_object_resource *vgor;
+
+	vgor = kzalloc(sizeof(*vgor), GFP_KERNEL);
+	vgor->bo = bo;
+	memcpy(&vgor->params, params, sizeof(*params));
+	list_add_tail(&vgor->head, &vgdev->res_list);
+}
+
+static void virtio_gpu_object_resource_remove(struct virtio_gpu_device *vgdev,
+						struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_object_resource *vgor, *tmp;
+
+	list_for_each_entry_safe(vgor, tmp, &vgdev->res_list, head) {
+		if (vgor->bo->hw_res_handle == bo->hw_res_handle) {
+			list_del(&vgor->head);
+		}
+	}
+}
+
 static void virtio_gpu_free_object(struct drm_gem_object *obj)
 {
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
@@ -92,6 +116,8 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 		virtio_gpu_cmd_unref_resource(vgdev, bo);
 		virtio_gpu_notify(vgdev);
 		/* completion handler calls virtio_gpu_cleanup_object() */
+
+		virtio_gpu_object_resource_remove(vgdev, bo);
 		return;
 	}
 	virtio_gpu_cleanup_object(bo);
@@ -232,6 +258,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		virtio_gpu_cmd_create_resource(vgdev, bo, params,
 					       objs, fence);
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+		/* records information related to resource creation  */
+		virtio_gpu_object_resource_restore(vgdev, bo, params);
 	}
 
 	*bo_ptr = bo;
@@ -245,3 +273,15 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	drm_gem_shmem_free(shmem_obj);
 	return ret;
 }
+
+void virtio_gpu_recreate_resource(struct virtio_gpu_device *vgdev,
+			     struct virtio_gpu_object_resource *vgor)
+{
+	struct virtio_gpu_mem_entry *ents;
+	unsigned int nents;
+
+	if (virtio_gpu_object_shmem_init(vgdev, vgor->bo, &ents, &nents) != 0)
+		return;
+	virtio_gpu_cmd_create_resource(vgdev, vgor->bo, &vgor->params, NULL, NULL);
+	virtio_gpu_object_attach(vgdev, vgor->bo, ents, nents);
+}
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
