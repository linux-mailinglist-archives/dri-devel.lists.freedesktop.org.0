Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAE067DF35
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 09:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE2E10E40C;
	Fri, 27 Jan 2023 08:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71D910E3D4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 22:59:16 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id m11so2961532pji.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=74QDMdiScJ37bdDF7SctdH9jkcXdbZkF3Aa2qa6bze0=;
 b=X/ZjNLClNmW/v7/FhMe+/ztXFGNt3U1F0t96/hRnhFdwqIU1HD9SfUlCmzInWpRtJB
 SPF/imwhGztYUrZnNU8GYbknCUrm0W2plSv2VdytqsYNvnFHd1BewE8Ui0MMiDzoji51
 hZwVJO+/VksAkKomER6Wy3Ylbq/V2iTN3VkEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74QDMdiScJ37bdDF7SctdH9jkcXdbZkF3Aa2qa6bze0=;
 b=hZvicskI/vGUg6VD+ol3RizsDaoMmhRvowCW6P/ivfGNWPskmbjRmkvHPXB+SPk2Mv
 yZLFGsnyOkF+tCkXQWQyTCxulSujXlo2mckCPMhvJJ5EeQK+9+3+ELDOmLGfBnbz33JL
 d35ZSKGektsCRGff13G2/rpPVataq+0pkycI06uuNR6Ow3zYutgFRDRI5ipJ+67ZUf08
 J7PjpLJWdZ+85g13WhosYX4PDKOiuMLSNufS++MunBA/+/Tv4lvwV0h6i3SZcYpmOuMU
 qREfn4KVUFvJI7mq9D1CQJyVa8Rl8fm/TvK5bU/Yp6fCnxP9ix4wYp4Il8yWm6Gs0BNm
 ZLgQ==
X-Gm-Message-State: AFqh2kql6D2ZeUW0UkQhh+BHAPPyQM9zrWKQ2XEZ81tZJeRC3YdYgD/X
 5NVmmj5UtTP4H9B4FNp9Qd8UQw==
X-Google-Smtp-Source: AMrXdXshOT93MUx8xKFD+4qe0coPmW40yZUggqej/M3zqEz9EaS3CiQbmZb9fiop+JFmTAg/gzTDJA==
X-Received: by 2002:a17:903:31c3:b0:194:b982:d83c with SMTP id
 v3-20020a17090331c300b00194b982d83cmr29945851ple.21.1674773956246; 
 Thu, 26 Jan 2023 14:59:16 -0800 (PST)
Received: from ryanneph-glaptop.corp.google.com
 ([2620:15c:9d:200:f493:a4d0:9413:178d])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a170902e84700b001962858f990sm1475968plg.164.2023.01.26.14.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 14:59:15 -0800 (PST)
From: Ryan Neph <ryanneph@chromium.org>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/virtio: exbuf->fence_fd unmodified on interrupted wait
Date: Thu, 26 Jan 2023 14:58:15 -0800
Message-Id: <20230126225815.1518839-1-ryanneph@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Jan 2023 08:31:24 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Robert Foss <robert.foss@collabora.com>,
 Yiwei Zhang <zzyiwei@chromium.org>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Ryan Neph <ryanneph@chromium.org>, Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An interrupted dma_fence_wait() becomes an -ERESTARTSYS returned
to userspace ioctl(DRM_IOCTL_VIRTGPU_EXECBUFFER) calls, prompting to
retry the ioctl(), but the passed exbuf->fence_fd has been reset to -1,
making the retry attempt fail at sync_file_get_fence().

The uapi for DRM_IOCTL_VIRTGPU_EXECBUFFER is changed to retain the
passed value for exbuf->fence_fd when returning ERESTARTSYS or EINTR.

Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
Signed-off-by: Ryan Neph <ryanneph@chromium.org>
---

 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 9 ++++++---
 include/uapi/drm/virtgpu_drm.h         | 3 +++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 9f4a90493aea..ffce4e2a409a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -132,6 +132,8 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	uint64_t fence_ctx;
 	uint32_t ring_idx;
 
+	exbuf->fence_fd = -1;
+
 	fence_ctx = vgdev->fence_drv.context;
 	ring_idx = 0;
 
@@ -152,8 +154,6 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		ring_idx = exbuf->ring_idx;
 	}
 
-	exbuf->fence_fd = -1;
-
 	virtio_gpu_create_context(dev, file);
 	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
 		struct dma_fence *in_fence;
@@ -173,7 +173,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 		dma_fence_put(in_fence);
 		if (ret)
-			return ret;
+			goto out_err;
 	}
 
 	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) {
@@ -259,6 +259,9 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 
 	if (out_fence_fd >= 0)
 		put_unused_fd(out_fence_fd);
+out_err:
+	if (ret == -EINTR || ret == -ERESTARTSYS)
+		exbuf->fence_fd = in_fence_fd;
 
 	return ret;
 }
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 0512fde5e697..ac8d1eed12ab 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -64,6 +64,9 @@ struct drm_virtgpu_map {
 	__u32 pad;
 };
 
+/* For ioctl() returning ERESTARTSYS or EINTR, fence_fd is unmodified.
+ * For all other errors it is set to -1.
+ */
 struct drm_virtgpu_execbuffer {
 	__u32 flags;
 	__u32 size;
-- 
2.39.1.456.gfc5497dd1b-goog

