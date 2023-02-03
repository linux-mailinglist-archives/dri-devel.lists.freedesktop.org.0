Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F38968B851
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A09010E338;
	Mon,  6 Feb 2023 09:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4707910E949
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 23:34:13 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id g13so2044464ple.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 15:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6oU+/BUJEqSH1rwyi+AFr1P0CnGEURs/L67LaOUlsvI=;
 b=MWi1HGbriGJlFR7rmopelt7eIZpVNld6It8CyxxIDjlZVJBvAIJsiQfdo0sxwXjFHK
 NRBzgZpd9fyRXRg9WozmvwZ//jCcAp+z2BfHA0oMliaqBGjUw7rE2dCKNhrbMZpIPvTc
 RzOQgSSAn1wa199dehrjf8zmZy/nmSut7c58g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6oU+/BUJEqSH1rwyi+AFr1P0CnGEURs/L67LaOUlsvI=;
 b=nh1a0lz0Qky14Gi3KZraQWOtp5mIFw2o0oWs1lgwSvi0pKvPpT9plU0XTNOx9ka4FH
 Jx3A0gi9HGPHrzsMyh2F+1+UIoRhVpKGS/w5Hxb4m0fnwdxQwkQUVGCy3mni8TI0+aIj
 fpYm3GykMkqnWaJGIEK9bqDhbXpHprf6Am4uK8Zm4TKy43Muw0tE+Sa/Lbe2A0197mLY
 kXF0jXTIq3cEtEi32dbIUR2xyzhXFMf8kF/WcCB9qTdN1wZQdG5ujH/lagQpyJ20dE4H
 u4xmf4h7o15TqV/ks3qIrDr4/otNA2PaF1cFV6WwqTzPWgf0AovL+AW50VEfJVfxng8I
 taOw==
X-Gm-Message-State: AO0yUKXk/WHRRqxKWK2h2NRhMfvdRzP/yMMPH6gyJMfPu4UoXPfvA9ut
 bH5Ralxf0SBpqVtHR08U/gl78A==
X-Google-Smtp-Source: AK7set9LBswFtzsZwcR9gI92dra3cplBvHIJtb4P0+iR/Itdg7R5FNXZd6oCRgXiBpg57MuEu89ZQA==
X-Received: by 2002:a17:902:c20c:b0:194:9b4e:1c90 with SMTP id
 12-20020a170902c20c00b001949b4e1c90mr11508975pll.57.1675467252881; 
 Fri, 03 Feb 2023 15:34:12 -0800 (PST)
Received: from ryanneph-glaptop.corp.google.com
 ([2620:15c:9d:200:7617:a96c:96d2:ed12])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a170902ea9500b001947c617c45sm2144320plb.221.2023.02.03.15.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 15:34:12 -0800 (PST)
From: Ryan Neph <ryanneph@chromium.org>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/virtio: exbuf->fence_fd unmodified on interrupted wait
Date: Fri,  3 Feb 2023 15:33:44 -0800
Message-Id: <20230203233345.2477767-1-ryanneph@chromium.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Feb 2023 09:10:58 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Ryan Neph <ryanneph@chromium.org>,
 Yiwei Zhang <zzyiwei@chromium.org>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An interrupted dma_fence_wait() becomes an -ERESTARTSYS returned
to userspace ioctl(DRM_IOCTL_VIRTGPU_EXECBUFFER) calls, prompting to
retry the ioctl(), but the passed exbuf->fence_fd has been reset to -1,
making the retry attempt fail at sync_file_get_fence().

The uapi for DRM_IOCTL_VIRTGPU_EXECBUFFER is changed to retain the
passed value for exbuf->fence_fd when returning anything besides a
successful result from the ioctl.

Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
Signed-off-by: Ryan Neph <ryanneph@chromium.org>
Reviewed-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

---

Changes in v2:
- No longer modifies exbuf->fence_fd unless DRM_IOCTL_VIRTGPU_EXECBUFFER
  succeeds.
- Added r-b tags (Rob/Dmitry) from v1.

 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 5 +----
 include/uapi/drm/virtgpu_drm.h         | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 9f4a90493aea..da45215a933d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -126,7 +126,6 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	void __user *user_bo_handles = NULL;
 	struct virtio_gpu_object_array *buflist = NULL;
 	struct sync_file *sync_file;
-	int in_fence_fd = exbuf->fence_fd;
 	int out_fence_fd = -1;
 	void *buf;
 	uint64_t fence_ctx;
@@ -152,13 +151,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		ring_idx = exbuf->ring_idx;
 	}
 
-	exbuf->fence_fd = -1;
-
 	virtio_gpu_create_context(dev, file);
 	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
 		struct dma_fence *in_fence;
 
-		in_fence = sync_file_get_fence(in_fence_fd);
+		in_fence = sync_file_get_fence(exbuf->fence_fd);
 
 		if (!in_fence)
 			return -EINVAL;
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 0512fde5e697..7b158fcb02b4 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -64,6 +64,7 @@ struct drm_virtgpu_map {
 	__u32 pad;
 };
 
+/* fence_fd is modified on success if VIRTGPU_EXECBUF_FENCE_FD_OUT flag is set. */
 struct drm_virtgpu_execbuffer {
 	__u32 flags;
 	__u32 size;
-- 
2.39.1.519.gcb327c4b5f-goog

