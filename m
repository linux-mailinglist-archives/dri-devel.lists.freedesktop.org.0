Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA2E159DBF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 00:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560296F45F;
	Tue, 11 Feb 2020 23:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020A36F45F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 23:56:54 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id b35so77010pgm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 15:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1iXMmtGG2NwjYsNxm/I9np9THh8z6cpuXTG6KOuPO3M=;
 b=W/UPajIsQ+2H7+dYeRRKR9AylaV8gbFUcrcHfmz22wpE9vVwYpYtp2To+EXEHbY5gk
 5FkSk0chZY1QeBDR5Uv9MBIOkdPL7IEHmTrO5X1PObofo46+DDV3el7djKDOA9TlH1GF
 9CUXp/bipl6i1ocdxqNfhhD0bPiFXyPZjy80w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1iXMmtGG2NwjYsNxm/I9np9THh8z6cpuXTG6KOuPO3M=;
 b=HV3tYhYCFwnLmo6HGAjjH98uHD10nh3aGDkvAZJHGnLuvlyt4GKTlRvt+S9LlXBdn1
 sLuFR3nVU2b2hUaNRcAIqxIq0nOdKGRTZk4MT3Ltu0KCSepOLRDEYWJOYddQfy/k4wCc
 sN+8xjjZYAD/z7IfAyn7669CDapGk63PJMOzw5V31peW0d0ee70NhpXIyqqYRNSMGilO
 E1UlodwyQF07FgA1AqbYbqlSSANFCncd8yczsFbyhWgN+ypnj3IQeIvGQ6KZrmzgiL+y
 Hut1WiHOD/Bl8oXJc/kg7w0mL//r8Q+hEcwrypMbtx3ERFTtbStiri/JLDZNx1ztnhIJ
 EuTA==
X-Gm-Message-State: APjAAAUpaArVlUMT+scIyzVXgCqvVY6IGcvDvag3/VVwTRK3XbcKE5NW
 iPa6hZgwbNk10BIbXoD0tAR9UBNEo+28Nw==
X-Google-Smtp-Source: APXvYqzv/Wtn2cD6L+QeirxMwYcshrrIIJPwEGlTCRIpsd9HauEa1AFgyXwvJUcA7x6gzWnqj4hE8g==
X-Received: by 2002:a63:86c2:: with SMTP id x185mr9140620pgd.245.1581465414322; 
 Tue, 11 Feb 2020 15:56:54 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id a13sm5816291pfg.65.2020.02.11.15.56.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 11 Feb 2020 15:56:53 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/virtio: enqueue virtio_gpu_create_context after first
 3D ioctl
Date: Tue, 11 Feb 2020 15:56:35 -0800
Message-Id: <20200211235635.488-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200211235635.488-1-gurchetansingh@chromium.org>
References: <20200211235635.488-1-gurchetansingh@chromium.org>
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

With virtio_gpu_notify(..), the create context command now is batched
with the first 3D hypercall.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 5 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 1 -
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 858ee153fb18..32f9af4bcb3a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -95,6 +95,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 	exbuf->fence_fd = -1;
 
+	virtio_gpu_create_context(dev, file);
 	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
 		struct dma_fence *in_fence;
 
@@ -246,6 +247,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
+	virtio_gpu_create_context(dev, file);
 	params.format = rc->format;
 	params.width = rc->width;
 	params.height = rc->height;
@@ -319,6 +321,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (vgdev->has_virgl_3d == false)
 		return -ENOSYS;
 
+	virtio_gpu_create_context(dev, file);
 	objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
 	if (objs == NULL)
 		return -ENOENT;
@@ -367,6 +370,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			 args->box.w, args->box.h, args->box.x, args->box.y,
 			 objs, NULL);
 	} else {
+		virtio_gpu_create_context(dev, file);
 		ret = virtio_gpu_array_lock_resv(objs);
 		if (ret != 0)
 			goto err_put_free;
@@ -467,6 +471,7 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
 	spin_unlock(&vgdev->display_info_lock);
 
 	/* not in cache - need to talk to hw */
+	virtio_gpu_create_context(dev, file);
 	virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
 				  &cache_ent);
 	virtio_gpu_notify(vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 64fe5fcbedfd..277c76de8e9c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -274,7 +274,6 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 	vfpriv->ctx_id = id;
 	atomic_set(&vfpriv->context_initiated, 0);
 	file->driver_priv = vfpriv;
-	virtio_gpu_create_context(dev, file);
 
 	return 0;
 }
-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
