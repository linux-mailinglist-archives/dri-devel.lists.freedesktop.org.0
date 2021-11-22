Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3AF45985E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 00:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6714789F01;
	Mon, 22 Nov 2021 23:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC1489E0D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 23:22:15 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id p18so15408590plf.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cXUPdzwTaRWfRhMlLXTbFXxHT+3uijlVCr9e0/e5vIw=;
 b=McZ16wgGgP7agc4NPbUKqztuThw1hq/p5+/QLkvfmWIE17ZM/mutBq5/CEv0B/ra+b
 LUV0QVDakggGfnPaRao7pft8kVgVuwFsVUoWYMkSI4wR1+/4J7suxAO96zpnmFDJyrlD
 eVV4q/lprKupxttJBZZg4BfTZhncF5G0Z+Ykg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cXUPdzwTaRWfRhMlLXTbFXxHT+3uijlVCr9e0/e5vIw=;
 b=IezNqO5cC/kBgpHxxMogaNuayk1mU4bXip7XaSJpJ0CTiXR7weKe+bb2ZFAc9a/Cq/
 12B5M1L30Hy1c2LhJscQ+7ZDx1NuV/s3tHZx/BYnMpbVsxpK5Y97Gdb39AESRQTDu8uh
 0JTbYcKp/zb7hzc2L260k/UNTawDScEp9HRU4tXOlyUSMnEjSYJfERvyY6kOBavMnoRP
 McZnBvAPOwSO8LC658h609Q9tyBo0Ay31tqcK1I6t3GegXZYf80qPIdkum+oFr+dh53j
 teABgI0x7c/gpMWd3ZsTTjf0IGEklx053XhxvD7cSPVkaFYKMSGs0yrdk+jp++b7bpzv
 ABKA==
X-Gm-Message-State: AOAM532vsuJG+edERPGTkMcv6lDTh6/dnA1umptoZcGLZK/vFmeEEHcg
 5csllfXpAfop4M2bSzLrN313yFN5EQqyNg==
X-Google-Smtp-Source: ABdhPJxlwp5oQidv3xdUxSXEr4KT/61tACAKyAs5i4kU/ouGEVeeBy7dgcBdHGhCjnfbpCbXcBXtQg==
X-Received: by 2002:a17:90b:1bc4:: with SMTP id
 oa4mr36728872pjb.179.1637623334436; 
 Mon, 22 Nov 2021 15:22:14 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:f3a1:7064:7e03:2f0a])
 by smtp.gmail.com with ESMTPSA id b15sm10539045pfl.118.2021.11.22.15.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 15:22:14 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/virtio: use drm_poll(..) instead of
 virtio_gpu_poll(..)
Date: Mon, 22 Nov 2021 15:22:10 -0800
Message-Id: <20211122232210.602-3-gurchetansingh@google.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211122232210.602-1-gurchetansingh@google.com>
References: <20211122232210.602-1-gurchetansingh@google.com>
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
Cc: kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gurchetan Singh <gurchetansingh@chromium.org>

With the use of dummy events, we can drop virtgpu specific
behavior.

Fixes: cd7f5ca33585 ("drm/virtio: implement context init: add virtio_gpu_fence_event")
Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 42 +---------------------------
 1 file changed, 1 insertion(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index d86e1ad4a972..5072dbb0669a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -157,36 +157,6 @@ static void virtio_gpu_config_changed(struct virtio_device *vdev)
 	schedule_work(&vgdev->config_changed_work);
 }
 
-static __poll_t virtio_gpu_poll(struct file *filp,
-				struct poll_table_struct *wait)
-{
-	struct drm_file *drm_file = filp->private_data;
-	struct virtio_gpu_fpriv *vfpriv = drm_file->driver_priv;
-	struct drm_device *dev = drm_file->minor->dev;
-	struct virtio_gpu_device *vgdev = dev->dev_private;
-	struct drm_pending_event *e = NULL;
-	__poll_t mask = 0;
-
-	if (!vgdev->has_virgl_3d || !vfpriv || !vfpriv->ring_idx_mask)
-		return drm_poll(filp, wait);
-
-	poll_wait(filp, &drm_file->event_wait, wait);
-
-	if (!list_empty(&drm_file->event_list)) {
-		spin_lock_irq(&dev->event_lock);
-		e = list_first_entry(&drm_file->event_list,
-				     struct drm_pending_event, link);
-		drm_file->event_space += e->event->length;
-		list_del(&e->link);
-		spin_unlock_irq(&dev->event_lock);
-
-		kfree(e);
-		mask |= EPOLLIN | EPOLLRDNORM;
-	}
-
-	return mask;
-}
-
 static struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_GPU, VIRTIO_DEV_ANY_ID },
 	{ 0 },
@@ -226,17 +196,7 @@ MODULE_AUTHOR("Dave Airlie <airlied@redhat.com>");
 MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
 MODULE_AUTHOR("Alon Levy");
 
-static const struct file_operations virtio_gpu_driver_fops = {
-	.owner          = THIS_MODULE,
-	.open           = drm_open,
-	.release        = drm_release,
-	.unlocked_ioctl = drm_ioctl,
-	.compat_ioctl   = drm_compat_ioctl,
-	.poll           = virtio_gpu_poll,
-	.read           = drm_read,
-	.llseek         = noop_llseek,
-	.mmap           = drm_gem_mmap
-};
+DEFINE_DRM_GEM_FOPS(virtio_gpu_driver_fops);
 
 static const struct drm_driver driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
-- 
2.34.0.rc2.393.gf8c9666880-goog

