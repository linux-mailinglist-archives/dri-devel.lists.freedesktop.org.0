Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ACF2FB440
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D686E84F;
	Tue, 19 Jan 2021 08:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82A16E492
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 22:47:05 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id kx7so1240090pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 14:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c/nlLYINAVyRBHFgQGInQrmkjIpXuU+UuJDo8Ulbu0g=;
 b=GPFjx/SnWQ82B/V+bAwLmGmXSSgr6QwsKFAd/bg+BMIaPaBYURo5KVdmUnOFKtRTlM
 UMvpCEv8uqOaEJ3fvG2KOZlu1pfOK4ctOdLk2UFmifYLE/NdunE2K7j3Mxp8V6iyOC9D
 jZHgN6cWgDMIk0QIYnkkO3emElS3N3CMRFxmAj0uRoGLH5o6KhGhDF2UY743SiCsa54v
 HuZYx5oFPaXnXLRRlh5psG4H8/2bSTvwmRCpfiPtPSNgWhXXXccuOdTHzG4WDeDIjue0
 D5zG7YR/2Na6gzapDjILRG4q4MYSz0UDDZaYR3UnuOZqnqZmw8ixFDMT+GMqUENADyCa
 oQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c/nlLYINAVyRBHFgQGInQrmkjIpXuU+UuJDo8Ulbu0g=;
 b=tcc9XY0hfpBg1Eofr/rKdLe47D8lhinWrEwxdnIhJYuz6Cuiyw05PG2iIpFdczxkAh
 CkD7JuQIztzyVDg26CViiuWVUTh5yi3SoNOd928ff6JRwRmC6VYkdTbJ8mNx7jhBPcwR
 XRScAWavlZd8UzDxoxyNUeNr2LNqbkNw+CRYsQ7IadqJqJIlVWbQxWJ2d+u8PKbvp9aR
 bSashWkGTyQxT2AQe7+dsHGsDnYbUOQQo6XupPGqBq8OUmqzQErRXBj5LzIDQdovdr/4
 ACXKzlfHksAWX3znuzhwODb6HPOfaobfFgLEzKugHruBumaV62RPz8KzECPfBJawLgbZ
 YzDA==
X-Gm-Message-State: AOAM533KfHX04W+jCRs2tfemA9sP1CW1mCMqLLv7WhTaoHJlZPoQAhOw
 3K6/p/3/ar7dHwtyA+dE37mB/Q==
X-Google-Smtp-Source: ABdhPJzPNdKwsBB0RLPb1pPxKSIfEoy3HG7qnr37F+0VD63H8quyExVgfKgyQDT4XpFSowzQjkKWew==
X-Received: by 2002:a17:90b:1649:: with SMTP id
 il9mr1655405pjb.62.1611010025406; 
 Mon, 18 Jan 2021 14:47:05 -0800 (PST)
Received: from zzyiwei.c.googlers.com.com
 (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
 by smtp.gmail.com with ESMTPSA id c18sm16818415pfj.200.2021.01.18.14.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 14:47:04 -0800 (PST)
From: Yiwei Zhang <zzyiwei@android.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] Track total GPU memory for virtio driver
Date: Mon, 18 Jan 2021 22:46:59 +0000
Message-Id: <20210118224659.263928-1-zzyiwei@android.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
Cc: android-kernel-team@google.com, Yiwei Zhang <zzyiwei@android.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the success of virtio_gpu_object_create, add size of newly allocated
bo to the tracled total_mem. In drm_gem_object_funcs.free, after the gem
bo lost its last refcount, subtract the bo size from the tracked
total_mem if the original underlying memory allocation is successful.

Signed-off-by: Yiwei Zhang <zzyiwei@android.com>
---
 drivers/gpu/drm/virtio/Kconfig          |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  4 ++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 19 +++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
index b925b8b1da16..e103b7e883b1 100644
--- a/drivers/gpu/drm/virtio/Kconfig
+++ b/drivers/gpu/drm/virtio/Kconfig
@@ -5,6 +5,7 @@ config DRM_VIRTIO_GPU
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	select VIRTIO_DMA_SHARED_BUFFER
+	select TRACE_GPU_MEM
 	help
 	   This is the virtual GPU driver for virtio.  It can be used with
 	   QEMU based VMMs (like KVM or Xen).
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 6a232553c99b..7c60e7486bc4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -249,6 +249,10 @@ struct virtio_gpu_device {
 	spinlock_t resource_export_lock;
 	/* protects map state and host_visible_mm */
 	spinlock_t host_visible_lock;
+
+#ifdef CONFIG_TRACE_GPU_MEM
+	atomic64_t total_mem;
+#endif
 };
 
 struct virtio_gpu_fpriv {
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index d69a5b6da553..1e16226cebbe 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -25,12 +25,29 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/moduleparam.h>
+#ifdef CONFIG_TRACE_GPU_MEM
+#include <trace/events/gpu_mem.h>
+#endif
 
 #include "virtgpu_drv.h"
 
 static int virtio_gpu_virglrenderer_workaround = 1;
 module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
 
+#ifdef CONFIG_TRACE_GPU_MEM
+static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *vgdev,
+					      s64 delta)
+{
+	u64 total_mem = atomic64_add_return(delta, &vgdev->total_mem);
+
+	trace_gpu_mem_total(0, 0, total_mem);
+}
+#else
+static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *, s64)
+{
+}
+#endif
+
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
 {
 	if (virtio_gpu_virglrenderer_workaround) {
@@ -104,6 +121,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
 	if (bo->created) {
+		virtio_gpu_trace_total_mem(vgdev, -(obj->size));
 		virtio_gpu_cmd_unref_resource(vgdev, bo);
 		virtio_gpu_notify(vgdev);
 		/* completion handler calls virtio_gpu_cleanup_object() */
@@ -265,6 +283,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	}
 
+	virtio_gpu_trace_total_mem(vgdev, shmem_obj->base.size);
 	*bo_ptr = bo;
 	return 0;
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
