Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF625B5AA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFC26E955;
	Wed,  2 Sep 2020 21:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83B06E955
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:14 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id m8so392899pfh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0O3VMg2RtyN2eoW+TkX4jpudR/HCPRICCJkwqeZRUww=;
 b=SkLfyMuNvybpMPntYpTVAJ939A5NE/n6+HbEgXCe/ckVvUcGyjCM9VaNkZFNIASo1W
 iShhtxO3JpoKNpNdsADfWGHCiOqyA1TmZI5dh2seK8AoY+0dqTOiV+5NmJgVSNUcYiWY
 0v5NXLdU898xnGpuDBzooT76JK+RX4Kl8p4TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0O3VMg2RtyN2eoW+TkX4jpudR/HCPRICCJkwqeZRUww=;
 b=o0RkTU8JT26DZ5YIRrC/3QuT+g/XEF3ZXWTywcHEx6uiRfq/NPsRBfj/EcOuydJ05a
 DZxZN7+YE/6ffQnQKOHcLg5QXFooruEIeDyExj5+uD0CWenmcvQDnp3EUyr7QTWqRe4C
 OMRN/RfuGXAtxCe8orNjYxc5Fzx80myjJn8sWSFvfDA4mvSbwrHg/BYJl9LwTkkYfLFl
 glYzETIjZ2HqTYArz41OcqLEQ3HcmLJbYYvGc+DjOhBF6/1biVqEzgytwDjJZ155MfEi
 9rU9uHCfbsKaF8VeQd0y0EmmMnulxqHqCJFH9MUYhJDv+eLjV1TV187fQZC7LyhV+Mib
 Wn/Q==
X-Gm-Message-State: AOAM533sgWjS8TuI0YicZ60YffFv0rwXkVGq2bryN//4cF9EjRf/5xkQ
 hqJtocDeGBtNREPoWNbFAisSqtAJvavy5Q==
X-Google-Smtp-Source: ABdhPJxJzwn9NT9zOvnWeViJySS+r3EBzwAUC47nOcGcNWTTmKlo2kfh6MC7IkIkHOwn9VkMZrMJag==
X-Received: by 2002:a17:902:bc85:: with SMTP id
 bb5mr271143plb.303.1599080953766; 
 Wed, 02 Sep 2020 14:09:13 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:13 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 16/23] drm/virtio: implement blob resources: implement vram
 object
Date: Wed,  2 Sep 2020 14:08:40 -0700
Message-Id: <20200902210847.2689-17-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902210847.2689-1-gurchetansingh@chromium.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gerd Hoffmann <kraxel@redhat.com>

A virtio-gpu vram object is based on range-based allocation.
No guest shmemfs backing, so we call drm_gem_private_object_init.

This is for host memory without any guest backing (atleast initially).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Co-developed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/Makefile          |   2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  20 ++-
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  26 +++-
 drivers/gpu/drm/virtio/virtgpu_kms.c     |   8 ++
 drivers/gpu/drm/virtio/virtgpu_object.c  |  12 ++
 drivers/gpu/drm/virtio/virtgpu_vq.c      |  66 +++++++++
 drivers/gpu/drm/virtio/virtgpu_vram.c    | 162 +++++++++++++++++++++++
 7 files changed, 293 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_vram.c

diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
index 92aa2b3d349d9..b99fa4a73b68e 100644
--- a/drivers/gpu/drm/virtio/Makefile
+++ b/drivers/gpu/drm/virtio/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o \
+virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o virtgpu_vram.o \
 	virtgpu_display.o virtgpu_vq.o \
 	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
 	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o
diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index a2cdd267914ac..f336a8fa66667 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -42,7 +42,7 @@ static void virtio_add_int(struct seq_file *m, const char *name,
 
 static int virtio_gpu_features(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
 
 	virtio_add_bool(m, "virgl", vgdev->has_virgl_3d);
@@ -72,9 +72,27 @@ virtio_gpu_debugfs_irq_info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int
+virtio_gpu_debugfs_host_visible_mm(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
+	struct drm_printer p;
+
+	if (!vgdev->has_host_visible) {
+		seq_puts(m, "Host allocations not visible to guest\n");
+		return 0;
+	}
+
+	p = drm_seq_file_printer(m);
+	drm_mm_print(&vgdev->host_visible_mm, &p);
+	return 0;
+}
+
 static struct drm_info_list virtio_gpu_debugfs_list[] = {
 	{ "virtio-gpu-features", virtio_gpu_features },
 	{ "virtio-gpu-irq-fence", virtio_gpu_debugfs_irq_info, 0, NULL },
+	{ "virtio-gpu-host-visible-mm", virtio_gpu_debugfs_host_visible_mm },
 };
 
 #define VIRTIO_GPU_DEBUGFS_ENTRIES ARRAY_SIZE(virtio_gpu_debugfs_list)
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 6d8c624515cd5..c3094f54598f1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -99,9 +99,19 @@ struct virtio_gpu_object_shmem {
 	uint32_t mapped;
 };
 
+struct virtio_gpu_object_vram {
+	struct virtio_gpu_object base;
+	uint32_t map_state;
+	uint32_t map_info;
+	struct drm_mm_node vram_node;
+};
+
 #define to_virtio_gpu_shmem(virtio_gpu_object) \
 	container_of((virtio_gpu_object), struct virtio_gpu_object_shmem, base)
 
+#define to_virtio_gpu_vram(virtio_gpu_object) \
+	container_of((virtio_gpu_object), struct virtio_gpu_object_vram, base)
+
 struct virtio_gpu_object_array {
 	struct ww_acquire_ctx ticket;
 	struct list_head next;
@@ -222,6 +232,7 @@ struct virtio_gpu_device {
 	bool has_resource_blob;
 	bool has_host_visible;
 	struct virtio_shm_region host_visible_region;
+	struct drm_mm host_visible_mm;
 
 	struct work_struct config_changed_work;
 
@@ -233,8 +244,10 @@ struct virtio_gpu_device {
 	uint32_t num_capsets;
 	struct list_head cap_cache;
 
-	/* protects resource state when exporting */
+	/* protects uuid state when exporting */
 	spinlock_t resource_export_lock;
+	/* protects map state and host_visible_mm */
+	spinlock_t host_visible_lock;
 };
 
 struct virtio_gpu_fpriv {
@@ -365,6 +378,12 @@ int
 virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object_array *objs);
 
+int virtio_gpu_cmd_map(struct virtio_gpu_device *vgdev,
+		       struct virtio_gpu_object_array *objs, uint64_t offset);
+
+void virtio_gpu_cmd_unmap(struct virtio_gpu_device *vgdev,
+			  struct virtio_gpu_object *bo);
+
 /* virtgpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
@@ -411,4 +430,9 @@ struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 /* virtgpu_debugfs.c */
 void virtio_gpu_debugfs_init(struct drm_minor *minor);
 
+/* virtgpu_vram.c */
+bool virtio_gpu_is_vram(struct virtio_gpu_object *bo);
+int virtio_gpu_vram_create(struct virtio_gpu_device *vgdev,
+			   struct virtio_gpu_object_params *params,
+			   struct virtio_gpu_object **bo_ptr);
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 97b6e4fb945a7..7771a6b5852ea 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -121,6 +121,7 @@ int virtio_gpu_init(struct drm_device *dev)
 
 	spin_lock_init(&vgdev->display_info_lock);
 	spin_lock_init(&vgdev->resource_export_lock);
+	spin_lock_init(&vgdev->host_visible_lock);
 	ida_init(&vgdev->ctx_id_ida);
 	ida_init(&vgdev->resource_ida);
 	init_waitqueue_head(&vgdev->resp_wq);
@@ -169,6 +170,9 @@ int virtio_gpu_init(struct drm_device *dev)
 			 (unsigned long)vgdev->host_visible_region.addr,
 			 (unsigned long)vgdev->host_visible_region.len);
 		vgdev->has_host_visible = true;
+		drm_mm_init(&vgdev->host_visible_mm,
+			    (unsigned long)vgdev->host_visible_region.addr,
+			    (unsigned long)vgdev->host_visible_region.len);
 	}
 
 	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible\n",
@@ -258,6 +262,10 @@ void virtio_gpu_release(struct drm_device *dev)
 	virtio_gpu_modeset_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
 	virtio_gpu_cleanup_cap_cache(vgdev);
+
+	if (vgdev->has_host_visible)
+		drm_mm_takedown(&vgdev->host_visible_mm);
+
 	kfree(vgdev->capsets);
 
 	if (vgdev->has_host_visible) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index f7064c1c23fd9..cef79455257df 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -83,6 +83,18 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 		}
 
 		drm_gem_shmem_free_object(&bo->base.base);
+	} else if (virtio_gpu_is_vram(bo)) {
+		struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
+
+		spin_lock(&vgdev->host_visible_lock);
+		if (drm_mm_node_allocated(&vram->vram_node))
+			drm_mm_remove_node(&vram->vram_node);
+
+		spin_unlock(&vgdev->host_visible_lock);
+
+		drm_gem_free_mmap_offset(&vram->base.base.base);
+		drm_gem_object_release(&vram->base.base.base);
+		kfree(vram);
 	}
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index deae7687eec3c..15f9d0d9aa25c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1166,3 +1166,69 @@ virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 	return 0;
 }
+
+static void virtio_gpu_cmd_resource_map_cb(struct virtio_gpu_device *vgdev,
+					   struct virtio_gpu_vbuffer *vbuf)
+{
+	struct virtio_gpu_object *bo =
+		gem_to_virtio_gpu_obj(vbuf->objs->objs[0]);
+	struct virtio_gpu_resp_map_info *resp =
+		(struct virtio_gpu_resp_map_info *)vbuf->resp_buf;
+	struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
+	uint32_t resp_type = le32_to_cpu(resp->hdr.type);
+
+	spin_lock(&vgdev->host_visible_lock);
+
+	if (resp_type == VIRTIO_GPU_RESP_OK_MAP_INFO) {
+		vram->map_info = resp->map_info;
+		vram->map_state = STATE_OK;
+	} else {
+		vram->map_state = STATE_ERR;
+	}
+
+	spin_unlock(&vgdev->host_visible_lock);
+	wake_up_all(&vgdev->resp_wq);
+}
+
+int virtio_gpu_cmd_map(struct virtio_gpu_device *vgdev,
+		       struct virtio_gpu_object_array *objs, uint64_t offset)
+{
+	struct virtio_gpu_resource_map_blob *cmd_p;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	struct virtio_gpu_vbuffer *vbuf;
+	struct virtio_gpu_resp_map_info *resp_buf;
+
+	resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
+	if (!resp_buf) {
+		virtio_gpu_array_put_free(objs);
+		return -ENOMEM;
+	}
+
+	cmd_p = virtio_gpu_alloc_cmd_resp
+		(vgdev, virtio_gpu_cmd_resource_map_cb, &vbuf, sizeof(*cmd_p),
+		 sizeof(struct virtio_gpu_resp_map_info), resp_buf);
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->offset = cpu_to_le64(offset);
+	vbuf->objs = objs;
+
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	return 0;
+}
+
+void virtio_gpu_cmd_unmap(struct virtio_gpu_device *vgdev,
+			  struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_resource_unmap_blob *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+
+	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+}
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
new file mode 100644
index 0000000000000..087945fcd230f
--- /dev/null
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "virtgpu_drv.h"
+
+static void virtio_gpu_vram_free(struct drm_gem_object *obj)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
+	bool unmap;
+
+	if (bo->created) {
+		spin_lock(&vgdev->host_visible_lock);
+		unmap = drm_mm_node_allocated(&vram->vram_node);
+		spin_unlock(&vgdev->host_visible_lock);
+
+		if (unmap)
+			virtio_gpu_cmd_unmap(vgdev, bo);
+
+		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		virtio_gpu_notify(vgdev);
+		return;
+	}
+}
+
+static const struct vm_operations_struct virtio_gpu_vram_vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+static int virtio_gpu_vram_mmap(struct drm_gem_object *obj,
+				struct vm_area_struct *vma)
+{
+	int ret;
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
+	unsigned long vm_size = vma->vm_end - vma->vm_start;
+
+	if (!(bo->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE))
+		return -EINVAL;
+
+	wait_event(vgdev->resp_wq, vram->map_state != STATE_INITIALIZING);
+	if (vram->map_state != STATE_OK)
+		return -EINVAL;
+
+	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
+	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+	vma->vm_ops = &virtio_gpu_vram_vm_ops;
+
+	if (vram->map_info == VIRTIO_GPU_MAP_CACHE_WC)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+	else if (vram->map_info == VIRTIO_GPU_MAP_CACHE_UNCACHED)
+		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+
+	/* Partial mappings of GEM buffers don't happen much in practice. */
+	if (vm_size != vram->vram_node.size)
+		return -EINVAL;
+
+	ret = io_remap_pfn_range(vma, vma->vm_start,
+				 vram->vram_node.start >> PAGE_SHIFT,
+				 vm_size, vma->vm_page_prot);
+	return ret;
+}
+
+static const struct drm_gem_object_funcs virtio_gpu_vram_funcs = {
+	.open = virtio_gpu_gem_object_open,
+	.close = virtio_gpu_gem_object_close,
+	.free = virtio_gpu_vram_free,
+	.mmap = virtio_gpu_vram_mmap,
+};
+
+bool virtio_gpu_is_vram(struct virtio_gpu_object *bo)
+{
+	return bo->base.base.funcs == &virtio_gpu_vram_funcs;
+}
+
+static int virtio_gpu_vram_map(struct virtio_gpu_object *bo)
+{
+	int ret;
+	uint64_t offset;
+	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
+
+	if (!vgdev->has_host_visible)
+		return -EINVAL;
+
+	spin_lock(&vgdev->host_visible_lock);
+	ret = drm_mm_insert_node(&vgdev->host_visible_mm, &vram->vram_node,
+				 bo->base.base.size);
+	spin_unlock(&vgdev->host_visible_lock);
+
+	if (ret)
+		return ret;
+
+	objs = virtio_gpu_array_alloc(1);
+	if (!objs) {
+		ret = -ENOMEM;
+		goto err_remove_node;
+	}
+
+	virtio_gpu_array_add_obj(objs, &bo->base.base);
+	/*TODO: Add an error checking helper function in drm_mm.h */
+	offset = vram->vram_node.start - vgdev->host_visible_region.addr;
+
+	ret = virtio_gpu_cmd_map(vgdev, objs, offset);
+	if (ret) {
+		virtio_gpu_array_put_free(objs);
+		goto err_remove_node;
+	}
+
+	return 0;
+
+err_remove_node:
+	spin_lock(&vgdev->host_visible_lock);
+	drm_mm_remove_node(&vram->vram_node);
+	spin_unlock(&vgdev->host_visible_lock);
+	return ret;
+}
+
+int virtio_gpu_vram_create(struct virtio_gpu_device *vgdev,
+			   struct virtio_gpu_object_params *params,
+			   struct virtio_gpu_object **bo_ptr)
+{
+	struct drm_gem_object *obj;
+	struct virtio_gpu_object_vram *vram;
+	int ret;
+
+	vram = kzalloc(sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	obj = &vram->base.base.base;
+	obj->funcs = &virtio_gpu_vram_funcs;
+	drm_gem_private_object_init(vgdev->ddev, obj, params->size);
+
+	/* Create fake offset */
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret) {
+		kfree(vram);
+		return ret;
+	}
+
+	ret = virtio_gpu_resource_id_get(vgdev, &vram->base.hw_res_handle);
+	if (ret) {
+		kfree(vram);
+		return ret;
+	}
+
+	if (params->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE) {
+		ret = virtio_gpu_vram_map(&vram->base);
+		if (ret) {
+			virtio_gpu_vram_free(obj);
+			return ret;
+		}
+	}
+
+	*bo_ptr = &vram->base;
+	return 0;
+}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
