Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 551EE123C29
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 02:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F126E20B;
	Wed, 18 Dec 2019 01:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD306E207
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 01:00:08 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id s7so60722pjc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 17:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xBz2QvCyQdAN8PKqjEK90M9isdrg6itoRexVBnrC8C0=;
 b=YLnCSZmw1VCTKp01SZcMmP4A568+mKmvpfuOKS5NVS6zqftaolXlejIySKALMq4NNz
 hCTtaeP3e6PKIgk7IstuGG5vhGj2lzIIF0ZMRvTWd7VE55RJW8VI61AkuWEkfW1xKkYm
 zzAxX6DNnxP97m4K/mxoomyYw6V2flWlCPqJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xBz2QvCyQdAN8PKqjEK90M9isdrg6itoRexVBnrC8C0=;
 b=CIuvzWCY8RPj48an8JKpoWgPyjXSk9NuQZwa6FoptYqrIEgvWpdeGVp3wtfFM4Dmr0
 LIEioUtbLuMwZZbelBT0ghlLzns1J+hzI4ItdsHhNZm1ZzzL5Cz8qqVmle/dhwcI3s8i
 EdHDp8loTSPL/0V8nvtuHUGccbu6PxbCQluPPbk0v8c3ygt08ojLPOLpvSPJgYkZkOty
 vInTPgNatg3WbSIffM5Ap196bqH6GIZFHJ4xKy6qVA8bWnpud3+vaWCJTgFgnlYHHRVg
 zOVHnhB/U9T0Ns4kIvbMwm++/GW63kFpGphixVNqi+wjl0aRzIvRG8mdr/Qt+m0wdqcw
 HtZg==
X-Gm-Message-State: APjAAAVFX3ejps3h4gn/XNqL5RzkYvnIs2nkzpVeNSqnJrzPUWlFiZF2
 6ywPqT+NAWEoEkSPiyWZMfZUeh2WFx4=
X-Google-Smtp-Source: APXvYqw1gS6LQVs2Z1qoIBMrQLDNsUWJNceJXR1Kw0D8j1rRH5YvtHR6TZ8Uut/ZSeHYhrdHbGhTFA==
X-Received: by 2002:a17:90a:e98a:: with SMTP id
 v10mr228817pjy.67.1576630807755; 
 Tue, 17 Dec 2019 17:00:07 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r1sm240802pgp.15.2019.12.17.17.00.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Dec 2019 17:00:07 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/virtio: split out gem functions from virtgpu_drv.h
Date: Tue, 17 Dec 2019 16:59:29 -0800
Message-Id: <20191218005929.6709-10-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191218005929.6709-1-gurchetansingh@chromium.org>
References: <20191218005929.6709-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtgpu_drv.h is getting very big, let's try to split it into
smaller header files.  This time, GEM functions.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c    |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 34 ----------------
 drivers/gpu/drm/virtio/virtgpu_gem.c    |  1 +
 drivers/gpu/drm/virtio/virtgpu_gem.h    | 52 +++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  |  1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  1 +
 drivers/gpu/drm/virtio/virtgpu_object.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c  |  1 +
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  1 +
 9 files changed, 59 insertions(+), 34 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_gem.h

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index e942465e4fb1..7bd46e915761 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -35,6 +35,7 @@
 #include <drm/drm_file.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_gem.h"
 
 static struct drm_driver driver;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index cd98df412cda..fa921f07c331 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -216,40 +216,6 @@ void virtio_gpu_deinit(struct drm_device *dev);
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
 void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file);
 
-/* virtio_gem.c */
-void virtio_gpu_gem_free_object(struct drm_gem_object *gem_obj);
-int virtio_gpu_gem_init(struct virtio_gpu_device *vgdev);
-void virtio_gpu_gem_fini(struct virtio_gpu_device *vgdev);
-int virtio_gpu_gem_create(struct drm_file *file,
-			  struct drm_device *dev,
-			  struct virtio_gpu_object_params *params,
-			  struct drm_gem_object **obj_p,
-			  uint32_t *handle_p);
-int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
-			       struct drm_file *file);
-void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
-				 struct drm_file *file);
-int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
-				struct drm_device *dev,
-				struct drm_mode_create_dumb *args);
-int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
-			      struct drm_device *dev,
-			      uint32_t handle, uint64_t *offset_p);
-
-struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents);
-struct virtio_gpu_object_array*
-virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents);
-void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
-			      struct drm_gem_object *obj);
-int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs);
-void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs);
-void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
-				struct dma_fence *fence);
-void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
-void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
-				       struct virtio_gpu_object_array *objs);
-void virtio_gpu_array_put_free_work(struct work_struct *work);
-
 /* virtio_gpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 409dd3863c7b..61cfc9e11f75 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -27,6 +27,7 @@
 #include <drm/drm_fourcc.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_gem.h"
 #include "virtgpu_vq.h"
 
 int virtio_gpu_gem_create(struct drm_file *file,
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.h b/drivers/gpu/drm/virtio/virtgpu_gem.h
new file mode 100644
index 000000000000..2ee81980e384
--- /dev/null
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef VIRTIO_GEM_H
+#define VIRTIO_GEM_H
+
+#include <linux/types.h>
+
+struct dma_fence;
+struct drm_device;
+struct drm_file;
+struct drm_gem_object;
+
+struct virtio_gpu_device;
+struct virtio_gpu_object_array;
+struct virtio_gpu_object_params;
+
+struct work_struct;
+
+void virtio_gpu_gem_free_object(struct drm_gem_object *gem_obj);
+int virtio_gpu_gem_init(struct virtio_gpu_device *vgdev);
+void virtio_gpu_gem_fini(struct virtio_gpu_device *vgdev);
+int virtio_gpu_gem_create(struct drm_file *file,
+			  struct drm_device *dev,
+			  struct virtio_gpu_object_params *params,
+			  struct drm_gem_object **obj_p,
+			  uint32_t *handle_p);
+int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
+			       struct drm_file *file);
+void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
+				 struct drm_file *file);
+int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
+				struct drm_device *dev,
+				struct drm_mode_create_dumb *args);
+int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
+			      struct drm_device *dev,
+			      uint32_t handle, uint64_t *offset_p);
+
+struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents);
+struct virtio_gpu_object_array*
+virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles,
+			      u32 nents);
+void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
+			      struct drm_gem_object *obj);
+int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs);
+void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs);
+void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
+				struct dma_fence *fence);
+void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
+void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
+				       struct virtio_gpu_object_array *objs);
+void virtio_gpu_array_put_free_work(struct work_struct *work);
+
+#endif /* VIRTGPU_GEM_H */
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 0108945b5cae..2dc394170566 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -32,6 +32,7 @@
 #include <drm/virtgpu_drm.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_gem.h"
 #include "virtgpu_vq.h"
 
 static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 2013002d3c2f..a8aaff30d021 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -29,6 +29,7 @@
 #include <drm/drm_file.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_gem.h"
 #include "virtgpu_vq.h"
 
 static void virtio_gpu_config_changed_work_func(struct work_struct *work)
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 8df93f40d282..2060662e3f46 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -26,6 +26,7 @@
 #include <linux/moduleparam.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_gem.h"
 #include "virtgpu_vq.h"
 
 static int virtio_gpu_virglrenderer_workaround = 1;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 384796db9373..84156147d549 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -28,6 +28,7 @@
 #include <drm/drm_plane_helper.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_gem.h"
 #include "virtgpu_vq.h"
 
 static const uint32_t virtio_gpu_formats[] = {
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 4d1c357ada07..00f17a40671d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -32,6 +32,7 @@
 #include <linux/virtio_ring.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_gem.h"
 #include "virtgpu_trace.h"
 #include "virtgpu_vq.h"
 
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
