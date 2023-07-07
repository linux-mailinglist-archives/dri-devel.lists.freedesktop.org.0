Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501374B8AC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 23:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7670010E076;
	Fri,  7 Jul 2023 21:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ED610E076
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 21:31:28 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b8a8154f9cso16423735ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 14:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688765487; x=1691357487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RpejIRNS3BMeBlkDs+abZmtHRdLVMB3Ko+KfE13G42g=;
 b=bOOIXznbt0mHv3vW5e8k4Eb+PWxonAwfS5N++nOJf2nHedDAtli+vH7XRUKHjxqBGq
 Lj2nokle/VG60VpcoBD3Cf5J8aLyJN3AKm27FgR3sX6GL24A4K015bX11CBazlUnWIiJ
 /p3OUcxO2+hpaOu5SVAXjb7gU5PMeDlzO6qU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688765487; x=1691357487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RpejIRNS3BMeBlkDs+abZmtHRdLVMB3Ko+KfE13G42g=;
 b=fQnb+SLm0iLi2kK0OvN3R82ApeE8JLd1S+uJF21GEhAuWQsws4ozJYINeyMZ0aJJTY
 mHIledtTBls3mx/qfwKD4ANjm8eD45VBP9bVOBUrHwSg3pOmfau3zuuhaDfAvWNHZqsX
 0Inu6/79JakCU/S1H2DT3B1yt3r1XkpL4EizoqlVNq2Wf1TQQv0oD1Np0eB6qq6VVA35
 9ukUSwkEP3Fj78yxacjUGxwpXJzpwEuLctqVKydGQZmSFezoD1QIUOYx2qWbM3Q5c5/n
 wSIBatTs0jMwTwEo0t1513QYVVTU2dvXZJHM7XpstRmdulrrHf3ZTN5MHSR9065ThK9U
 uDig==
X-Gm-Message-State: ABy/qLY7V4XTkaX9rXSuaNzOxZ0dQ6VzdDQOVv36/u4IcHLg235BfMDO
 M2yWnYp0kk7LuqKh8Rp6cGaD1AK/DE9yN2lxfyQGog==
X-Google-Smtp-Source: APBJJlF8ahNo7Z/IP1jzW7/e3iJ7FdeMb1s/jeM2eO2tfkSWmdIC57NVRz+zknPMzDndCCDmlp9n5g==
X-Received: by 2002:a17:903:32ce:b0:1b8:c6f8:d9b with SMTP id
 i14-20020a17090332ce00b001b8c6f80d9bmr8113980plr.34.1688765487339; 
 Fri, 07 Jul 2023 14:31:27 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:dbc3:2cd5:1afc:3f78])
 by smtp.gmail.com with ESMTPSA id
 ju5-20020a170903428500b001b077301a58sm3695432plb.79.2023.07.07.14.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 14:31:26 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	dmitry.osipenko@collabora.com
Subject: [PATCH v4] drm/virtio: conditionally allocate virtio_gpu_fence
Date: Fri,  7 Jul 2023 14:31:24 -0700
Message-Id: <20230707213124.494-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <2cc27163-c8d2-45bc-abd7-26ea567c4aea@collabora.com>
References: <2cc27163-c8d2-45bc-abd7-26ea567c4aea@collabora.com>
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

We don't want to create a fence for every command submission.  It's
only necessary when userspace provides a waitable token for submission.
This could be:

1) bo_handles, to be used with VIRTGPU_WAIT
2) out_fence_fd, to be used with dma_fence apis
3) a ring_idx provided with VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
   + DRM event API
4) syncobjs in the future

The use case for just submitting a command to the host, and expecting
no response.  For example, gfxstream has GFXSTREAM_CONTEXT_PING that
just wakes up the host side worker threads.  There's also
CROSS_DOMAIN_CMD_SEND which just sends data to the Wayland server.

This prevents the need to signal the automatically created
virtio_gpu_fence.

In addition, VIRTGPU_EXECBUF_RING_IDX is checked when creating a
DRM event object.  VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is
already defined in terms of per-context rings.  It was theoretically
possible to create a DRM event on the global timeline (ring_idx == 0),
if the context enabled DRM event polling.  However, that wouldn't
work and userspace (Sommelier).  Explicitly disallow it for
clarity.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 v2: Fix indent (Dmitry)
 v3: Refactor drm fence event checks to avoid possible NULL deref (Dmitry)
 v4: More detailed commit message about addition drm fence event checks (Dmitry)

 drivers/gpu/drm/virtio/virtgpu_submit.c | 28 +++++++++++++------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index cf3c04b16a7a..004364cf86d7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_submit.c
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -64,13 +64,9 @@ static int virtio_gpu_fence_event_create(struct drm_device *dev,
 					 struct virtio_gpu_fence *fence,
 					 u32 ring_idx)
 {
-	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct virtio_gpu_fence_event *e = NULL;
 	int ret;
 
-	if (!(vfpriv->ring_idx_mask & BIT_ULL(ring_idx)))
-		return 0;
-
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
 	if (!e)
 		return -ENOMEM;
@@ -161,21 +157,27 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
 				  struct drm_file *file,
 				  u64 fence_ctx, u32 ring_idx)
 {
+	int err;
+	struct virtio_gpu_fence *out_fence;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
-	struct virtio_gpu_fence *out_fence;
-	int err;
+	bool drm_fence_event = (exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
+			       (vfpriv->ring_idx_mask & BIT_ULL(ring_idx));
 
 	memset(submit, 0, sizeof(*submit));
 
-	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
-	if (!out_fence)
-		return -ENOMEM;
+	if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) || drm_fence_event ||
+	     exbuf->num_bo_handles)
+		out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
+	else
+		out_fence = NULL;
 
-	err = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
-	if (err) {
-		dma_fence_put(&out_fence->f);
-		return err;
+	if (drm_fence_event) {
+		err = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
+		if (err) {
+			dma_fence_put(&out_fence->f);
+			return err;
+		}
 	}
 
 	submit->out_fence = out_fence;
-- 
2.41.0.255.g8b1d071c50-goog

