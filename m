Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02412FFE75
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E6D6E0ED;
	Fri, 22 Jan 2021 08:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC8689F45
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 05:32:04 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id b8so2608431plx.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 21:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BLXgpOXOllZOpAnIxHqD+UYHHzmwKo7AFJN3hA2f4pQ=;
 b=tbFctqzA8MbsuRfWOhF7+/+paIyBF3tGT2Xt2BFWfgMIf/864NJN5Rua+rYjyBMOAI
 iZol7ydj8ULFhwH/EXNswxfwfO4XNCypF5xO9teuC9FW2HOkXna5LhsUJ523EnWqh0B5
 QYzlKFR8seCOHX7neVmJMlFXLCQPolctCREXowxeTVA6GkdLdi3G1vJ+OtssRm/1DgYa
 qbnjJZqjEChBQZGI81Yw+MHuIM1wk6/K70lAKe+4XnoC5o/GweTdKp1qRn+mqLfyqRjf
 X2owyeS6CZD3J2TqEneV/mtHcmt1gd3TDz1pwiUuaVI8ZcoBdZjEJ/GDGcRW+Dmo4tCw
 oHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BLXgpOXOllZOpAnIxHqD+UYHHzmwKo7AFJN3hA2f4pQ=;
 b=q8bNHJY3F0NKe7zJGvs6U4bRZ1ma+fDb47VWnRBXuXz095RQSqoFAT8CmIDL8IWJnB
 +waeerQQFk+6IhUn1F2aV/Ydp7/bl7tjeJ9d19JBKvUjeLmnH54KsE46xumuK2waHWoZ
 jlDrdhc+O3eaBk+a2iP/pNymvP4nLY/EnR3U6l0GlEgPLayKhKkNENz9PLGyEDp7ECKp
 kZFbc1cGysmVC4/RPhjthWB7gUErfkbkUxHMeudTcF3SqbmUHE+Vd106rxuBDIMWyUA4
 gToEXkEbxKHCH6oZ+FZcFq7BPuyTPqx68N93egOIFtL9ut1+TaXIuVl8bvHiRwud7Y4y
 MwsQ==
X-Gm-Message-State: AOAM532gTY0f3IQvmmqjntbxnFSlxu3VTZ8sVYMj8E+noRjE/+owtOq2
 QcAU6S+LFUvFnup4IN8Bxdot1g==
X-Google-Smtp-Source: ABdhPJzvNY5BuI42QFjGI0uH6F1mNIZl44NkdqVjmfiVXaOwvVeKlvcj9wg9zceerPKtXqqBJaZ3Tw==
X-Received: by 2002:a17:90b:4b86:: with SMTP id
 lr6mr3306071pjb.107.1611293524025; 
 Thu, 21 Jan 2021 21:32:04 -0800 (PST)
Received: from zzyiwei.c.googlers.com.com
 (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
 by smtp.gmail.com with ESMTPSA id x186sm6600392pfd.57.2021.01.21.21.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 21:32:03 -0800 (PST)
From: Yiwei Zhang <zzyiwei@android.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3] drm/virtio: trace total gem bo for virtio
Date: Fri, 22 Jan 2021 05:31:59 +0000
Message-Id: <20210122053159.1720274-1-zzyiwei@android.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210121091013.wlqyukat2w7fow33@sirius.home.kraxel.org>
References: <20210121091013.wlqyukat2w7fow33@sirius.home.kraxel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Yiwei Zhang <zzyiwei@google.com>, Yiwei Zhang <zzyiwei@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yiwei Zhang <zzyiwei@google.com>

On the success of virtio_gpu_object_create, add size of newly allocated
bo to the tracked total_mem. In drm_gem_object_funcs.free, after the gem
bo lost its last refcount, subtract the bo size from the tracked
total_mem if the original underlying memory allocation is successful.

It's more accurate to do this in device driver layer to best match when
the underlying resource gets allocated and destroyed during tracing.

Signed-off-by: Yiwei Zhang <zzyiwei@android.com>
---
 drivers/gpu/drm/virtio/Kconfig          |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 ++
 drivers/gpu/drm/virtio/virtgpu_object.c | 11 +++++++++++
 3 files changed, 14 insertions(+)

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
index 6a232553c99b..7ab63ce9c6a9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -249,6 +249,8 @@ struct virtio_gpu_device {
 	spinlock_t resource_export_lock;
 	/* protects map state and host_visible_mm */
 	spinlock_t host_visible_lock;
+	/* total memory backing gem bos */
+	atomic64_t total_mem;
 };
 
 struct virtio_gpu_fpriv {
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index d69a5b6da553..e2251fc41509 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -25,12 +25,21 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/moduleparam.h>
+#include <trace/events/gpu_mem.h>
 
 #include "virtgpu_drv.h"
 
 static int virtio_gpu_virglrenderer_workaround = 1;
 module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
 
+static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *vgdev,
+					      s64 delta)
+{
+	u64 total_mem = atomic64_add_return(delta, &vgdev->total_mem);
+
+	trace_gpu_mem_total(vgdev->ddev->primary->index, 0, total_mem);
+}
+
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
 {
 	if (virtio_gpu_virglrenderer_workaround) {
@@ -104,6 +113,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
 	if (bo->created) {
+		virtio_gpu_trace_total_mem(vgdev, -(obj->size));
 		virtio_gpu_cmd_unref_resource(vgdev, bo);
 		virtio_gpu_notify(vgdev);
 		/* completion handler calls virtio_gpu_cleanup_object() */
@@ -265,6 +275,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	}
 
+	virtio_gpu_trace_total_mem(vgdev, shmem_obj->base.size);
 	*bo_ptr = bo;
 	return 0;
 
-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
