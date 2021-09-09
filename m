Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317654042C8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382536E416;
	Thu,  9 Sep 2021 01:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A726E419
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:37:30 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so260022pjc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 18:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BnbKWjcXFxbUpPdwvgR8oCgtCuBLFlivJhTim0Og3Z8=;
 b=Yk2vqclvtO8xlviMK7CKD5H1BRJCNOa1bMBZpr/9V1Zc3V/ru4Y8q09i/hyl6WkRto
 ZkAWJDXmjQo9Q8ugmX26FaUaZwlqrcw0hpdi/cgWerRnPg7XREpbicbW2WZ3HQRQ32L0
 /GSLVI77QIxDPxmSPE/qhO4+JfUb0LvJWblV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BnbKWjcXFxbUpPdwvgR8oCgtCuBLFlivJhTim0Og3Z8=;
 b=1LHvAywRWJO0DL26Q3uAAYKasDG47c9J/O3CdcT5IplDU5lb4atDYTo7FzIYXtj/09
 2qnXtChlS9RYSXMQbGK7304tbwR4Bw0d749qCBrzP0th5E2xMeGjgIJ5cJSqmrOEF516
 dkscGkYG2Qahjm1+cUhPKH+YPc8Zdlz+WGWGeMqq2p2ikkEddUM7mr9hLEyuj5mW92Vi
 sMCmWAYnrAgLO1Nzd7XfygmT0USwMiIgpV3lvrdbHrCaCq27TphsLuOjH1me8q420Uzr
 Fq6tCbQY68Hk/7PXvFoifkor2S3hInFaQeOFnJTdLAjT3EfgQPKOwSLCVkXSjjsKNBdr
 HfiQ==
X-Gm-Message-State: AOAM530/2gjAkuGcPySP2r8XkOxBZiCG3jK/hBSRv2WPs5NaersonwOr
 WqMisE7hFWWC+UuiiLJ8rwkzpfl19t7fNNU9
X-Google-Smtp-Source: ABdhPJwd14tq0vlNAC04WQncz8JI3YA//w/VT0RI+7d6PFE3Fl33etrYSQFGxKLJM7u7hcUYwFlT8A==
X-Received: by 2002:a17:90a:5511:: with SMTP id
 b17mr556527pji.222.1631151450229; 
 Wed, 08 Sep 2021 18:37:30 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:b3e5:2f81:d686:bc91])
 by smtp.gmail.com with ESMTPSA id h9sm142488pjg.9.2021.09.08.18.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 18:37:29 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
Date: Wed,  8 Sep 2021 18:37:16 -0700
Message-Id: <20210909013717.861-12-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210909013717.861-1-gurchetansingh@chromium.org>
References: <20210909013717.861-1-gurchetansingh@chromium.org>
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

Similar to DRM_VMW_EVENT_FENCE_SIGNALED.  Sends a pollable event
to the DRM file descriptor when a fence on a specific ring is
signaled.

One difference is the event is not exposed via the UAPI -- this is
because host responses are on a shared memory buffer of type
BLOB_MEM_GUEST [this is the common way to receive responses with
virtgpu].  As such, there is no context specific read(..)
implementation either -- just a poll(..) implementation.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Nicholas Verne <nverne@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c   | 43 +++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++++
 drivers/gpu/drm/virtio/virtgpu_fence.c | 10 ++++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++
 4 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 9d963f1fda8f..749db18dcfa2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -29,6 +29,8 @@
 #include <linux/module.h>
 #include <linux/console.h>
 #include <linux/pci.h>
+#include <linux/poll.h>
+#include <linux/wait.h>
 
 #include <drm/drm.h>
 #include <drm/drm_aperture.h>
@@ -155,6 +157,35 @@ static void virtio_gpu_config_changed(struct virtio_device *vdev)
 	schedule_work(&vgdev->config_changed_work);
 }
 
+static __poll_t virtio_gpu_poll(struct file *filp,
+				struct poll_table_struct *wait)
+{
+	struct drm_file *drm_file = filp->private_data;
+	struct virtio_gpu_fpriv *vfpriv = drm_file->driver_priv;
+	struct drm_device *dev = drm_file->minor->dev;
+	struct drm_pending_event *e = NULL;
+	__poll_t mask = 0;
+
+	if (!vfpriv->ring_idx_mask)
+		return drm_poll(filp, wait);
+
+	poll_wait(filp, &drm_file->event_wait, wait);
+
+	if (!list_empty(&drm_file->event_list)) {
+		spin_lock_irq(&dev->event_lock);
+		e = list_first_entry(&drm_file->event_list,
+				     struct drm_pending_event, link);
+		drm_file->event_space += e->event->length;
+		list_del(&e->link);
+		spin_unlock_irq(&dev->event_lock);
+
+		kfree(e);
+		mask |= EPOLLIN | EPOLLRDNORM;
+	}
+
+	return mask;
+}
+
 static struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_GPU, VIRTIO_DEV_ANY_ID },
 	{ 0 },
@@ -194,7 +225,17 @@ MODULE_AUTHOR("Dave Airlie <airlied@redhat.com>");
 MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
 MODULE_AUTHOR("Alon Levy");
 
-DEFINE_DRM_GEM_FOPS(virtio_gpu_driver_fops);
+static const struct file_operations virtio_gpu_driver_fops = {
+	.owner          = THIS_MODULE,
+	.open           = drm_open,
+	.release        = drm_release,
+	.unlocked_ioctl = drm_ioctl,
+	.compat_ioctl   = drm_compat_ioctl,
+	.poll           = virtio_gpu_poll,
+	.read           = drm_read,
+	.llseek         = noop_llseek,
+	.mmap           = drm_gem_mmap
+};
 
 static const struct drm_driver driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index cb60d52c2bd1..e0265fe74aa5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -138,11 +138,18 @@ struct virtio_gpu_fence_driver {
 	spinlock_t       lock;
 };
 
+#define VIRTGPU_EVENT_FENCE_SIGNALED_INTERNAL 0x10000000
+struct virtio_gpu_fence_event {
+	struct drm_pending_event base;
+	struct drm_event event;
+};
+
 struct virtio_gpu_fence {
 	struct dma_fence f;
 	uint32_t ring_idx;
 	uint64_t fence_id;
 	bool emit_fence_info;
+	struct virtio_gpu_fence_event *e;
 	struct virtio_gpu_fence_driver *drv;
 	struct list_head node;
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 98a00c1e654d..f28357dbde35 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -152,11 +152,21 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 				continue;
 
 			dma_fence_signal_locked(&curr->f);
+			if (curr->e) {
+				drm_send_event(vgdev->ddev, &curr->e->base);
+				curr->e = NULL;
+			}
+
 			list_del(&curr->node);
 			dma_fence_put(&curr->f);
 		}
 
 		dma_fence_signal_locked(&signaled->f);
+		if (signaled->e) {
+			drm_send_event(vgdev->ddev, &signaled->e->base);
+			signaled->e = NULL;
+		}
+
 		list_del(&signaled->node);
 		dma_fence_put(&signaled->f);
 		break;
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index be7b22a03884..fdaa7f3d9eeb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -38,6 +38,36 @@
 				    VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
 				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
 
+static int virtio_gpu_fence_event_create(struct drm_device *dev,
+					 struct drm_file *file,
+					 struct virtio_gpu_fence *fence,
+					 uint32_t ring_idx)
+{
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
+	struct virtio_gpu_fence_event *e = NULL;
+	int ret;
+
+	if (!(vfpriv->ring_idx_mask & (1 << ring_idx)))
+		return 0;
+
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
+	if (!e)
+		return -ENOMEM;
+
+	e->event.type = VIRTGPU_EVENT_FENCE_SIGNALED_INTERNAL;
+	e->event.length = sizeof(e->event);
+
+	ret = drm_event_reserve_init(dev, file, &e->base, &e->event);
+	if (ret)
+		goto free;
+
+	fence->e = e;
+	return 0;
+free:
+	kfree(e);
+	return ret;
+}
+
 /* Must be called with &virtio_gpu_fpriv.struct_mutex held. */
 static void virtio_gpu_create_context_locked(struct virtio_gpu_device *vgdev,
 					     struct virtio_gpu_fpriv *vfpriv)
@@ -195,6 +225,10 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		goto out_unresv;
 	}
 
+	ret = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
+	if (ret)
+		goto out_unresv;
+
 	if (out_fence_fd >= 0) {
 		sync_file = sync_file_create(&out_fence->f);
 		if (!sync_file) {
-- 
2.33.0.153.gba50c8fa24-goog

