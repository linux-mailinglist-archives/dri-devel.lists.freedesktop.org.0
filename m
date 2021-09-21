Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB5413DF3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 01:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4A56E913;
	Tue, 21 Sep 2021 23:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A1A6E8FE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:20:38 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so847247pji.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q23MohTc1v5zJi+i8pjaOJ4Mb0N3L8JGeyMBLtocvNw=;
 b=Qk/eNcQfdycUC9C7iFSIZf+yHqQKP2O/z7/XAkaVMEgxKEGTaufj3fPR1lDDdq/KjZ
 EB2f6aDg6IpTLt9gtIHt+cqV1bPJ2tTZngnMD/NQZnG9FmiZrT3e+jPxZd4qFgCvqISB
 R1AgFA0YF+eSi3e6uN7VFX2q20gGhQcDv/gOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q23MohTc1v5zJi+i8pjaOJ4Mb0N3L8JGeyMBLtocvNw=;
 b=g0gOYLYQ0y1RrQDqBSyOtU5DZ1d5crrGSkd5YYBusC7OGxaf/s81QqEFOpcCiMI20w
 HFfmZ+ga0Bz8bYRDKEfCAhA4bMzjF4m6ib0u5dZ5dRe0K1BTwYtjVKQyOwsj/EQxQCQ2
 +ttxTHBBCz0z6ylVK7NBYvzfkD/rywq4iWo1TmUospzIYA6Cj9FXF7u2bXm5szLQUDmt
 dZ7PK0J2NUCth/P4aN0WVZFJbgcBZ3fe3FXhvdcXsyUKibfmcp0Jp10DHq7dBJCfJYi7
 dvTEpMuCq6t+xOgtA2KfjaSzMCxAQdAavXUfDAQjoNaeAdmKCcTXVTX3pqklpybkqRKz
 oyAg==
X-Gm-Message-State: AOAM532cQcE41GWKBeSfQHDlOO4TncmGkR6pEbLlJ32dIqk56pzfAAr9
 dkBhJGCv1Rbnq3aK8WNqzam6C8XCUkdHIA==
X-Google-Smtp-Source: ABdhPJwRQU08y4wpG9ekANjWd3zsG3imqh5YVs412HyTSvvwivImwroYW0nLSRyGw8BKpkWAcT2+3g==
X-Received: by 2002:a17:90b:384a:: with SMTP id
 nl10mr8029960pjb.65.1632266437732; 
 Tue, 21 Sep 2021 16:20:37 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a5ff:11c:6401:fce])
 by smtp.gmail.com with ESMTPSA id e2sm201906pfn.141.2021.09.21.16.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:20:37 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
Date: Tue, 21 Sep 2021 16:20:23 -0700
Message-Id: <20210921232024.817-12-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210921232024.817-1-gurchetansingh@chromium.org>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
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
2.33.0.464.g1972c5931b-goog

