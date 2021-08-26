Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00343F8054
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A086E4A5;
	Thu, 26 Aug 2021 02:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6F26E484
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:05:12 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id k24so1650950pgh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DoY4+/M5KjjHUMeAom/geLoAzssxLvhNFDL9Otey2uY=;
 b=Ro0wMwPDG6yJeQ5Woie/oB8Zw6rjflii76sKsDBeDLDJFNTTJrtdMIKOVrYQ9D3/R5
 nQYcfqY3vTfIVHSbtSqYr50VhqC/YX0F46EaGh4jkbQjM9sZuHVfRzau/k0d7jTPa+Ea
 zwX22c2MfiT8UmZX+bSAH17JmQPJEAUxPQTZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DoY4+/M5KjjHUMeAom/geLoAzssxLvhNFDL9Otey2uY=;
 b=Y7fGt/yUYhsv/X7PqScBpIJKYoKEDib9b/dqrvLeTxk7kHOwBcTJIbgPREBe6aivR0
 GaEXv+q1mQzZLyG0DS7ydGUOWDUzSVpLyddHTx/km/ofSyxYQF8h2/QOYaFpbnLo04jQ
 2905ujwTn73TeXHzwFOLYt4BV4SIsuiusB+ccH8nCFZC2tp2j7YGZMyTsihQc0tid6O6
 pBES7JoQ2U65FUYdYYiZgwf584I+iQmfLKp8nAChYadO3aaeC8wK2ooT/4pomyZTFsEN
 USKgeB+GcMFNPPSzq1yb3ogfXO2kl78cV3OXdoqDH10rAZA4nhuoi+9xD+FYA9qoxbuc
 BlBQ==
X-Gm-Message-State: AOAM530WFG64wbqF6XHQQSglaoGUJdIqVAtoVteIJa7rjOhDm5cAv1rm
 ZKaNqI0zDVuVMGtnuta65lwEIBoc9GVv7Q==
X-Google-Smtp-Source: ABdhPJyiAZAG5NJRMF1D1M4NdxSN+wWHVoo0SisWlLZOXZuDYMNnYzKH5iWrXdcoLWZ0h0p0XnTVQA==
X-Received: by 2002:a63:d04c:: with SMTP id s12mr1147192pgi.148.1629943511614; 
 Wed, 25 Aug 2021 19:05:11 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:faed:1e29:6bf7:3354])
 by smtp.gmail.com with ESMTPSA id o10sm704987pjg.34.2021.08.25.19.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:05:11 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [RFC PATCH 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
Date: Wed, 25 Aug 2021 19:04:54 -0700
Message-Id: <20210826020455.1081-12-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210826020455.1081-1-gurchetansingh@chromium.org>
References: <20210826020455.1081-1-gurchetansingh@chromium.org>
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
index 1182d5e5d322..2c699b834a45 100644
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
index dbb29f99ead0..db9d908828e9 100644
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
index 8523351b523d..393897adbbaa 100644
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
2.33.0.259.gc128427fd7-goog

