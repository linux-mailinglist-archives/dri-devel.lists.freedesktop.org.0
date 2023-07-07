Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF5B74B47B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 17:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADEE10E5B9;
	Fri,  7 Jul 2023 15:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E130410E5B5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 15:43:41 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-666e5f0d60bso1260244b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688744621; x=1691336621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4+2aqhdyJ9CC3HhRBHLYi6gjI+QLGM2TOWGh+d6Y1FI=;
 b=WEsBuN8tWNaZZ/GsTWcW8mH2Q0A/+H+UQYENqbJfh5tZ52uu90ztK9wGFgVERn0C4W
 Kyf6WgNoYhK46gGDX2BR+fVGPVwphjTz5HPVf3PJolKg3/lMKmbDI66WY8YYnUOB+RJr
 zXvfxKm1JXyy67WdbB0nUAV5UWcFOHD+uSBXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688744621; x=1691336621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+2aqhdyJ9CC3HhRBHLYi6gjI+QLGM2TOWGh+d6Y1FI=;
 b=gjWN4+rlLAtiXnK6Z3EDvFCwcHYyGZdjc69FdlslJpaFAJdsEQ/md23r03UmlTjozB
 1vdM+h73iAUdubkV5s8gc6ut+2pmPLWNpXK3NPEPXxaywc94O+ETpequRH7s89i0vQ2x
 psh/P992tgedWH+1QomHRAhccHN83sO5Rz2mUoMPUQKxwNvITSmx4tGmoF3l39+Xh3dJ
 W48Xp8sdh2+7k6+U3BoD5lqQniCc/e15ZlgFf9v8j9wp1bzg5/xG3G3DgJ/zPOkUECcD
 bRJFJQ88dSQtsbV3AVHAOppJOsjtsfi2i/jlORh0YIojLi8RyEpG0k9lcyqfSVxv1TCc
 S47A==
X-Gm-Message-State: ABy/qLY8ahvrMqHlL8DpT+Lxv03lCPCuUkijlJbtmufcc4D2MVMTILsz
 YDjBtJ8FVcxFUilJyS3gdPQNdPSW7Zb1z8IsN64=
X-Google-Smtp-Source: APBJJlH+tkZIzc+Xb6PFR0rPyJqNzxX2OyJp9oGB+tDDpnqTJXpX8mZcFx6Sf47xGNbAFvxdtWb+/g==
X-Received: by 2002:a05:6a00:230b:b0:662:f0d0:a77d with SMTP id
 h11-20020a056a00230b00b00662f0d0a77dmr5514959pfh.30.1688744620722; 
 Fri, 07 Jul 2023 08:43:40 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:dbc3:2cd5:1afc:3f78])
 by smtp.gmail.com with ESMTPSA id
 t24-20020aa79398000000b00675701f456csm3032397pfe.54.2023.07.07.08.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 08:43:40 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	dmitry.osipenko@collabora.com
Subject: [PATCH v3] drm/virtio: conditionally allocate virtio_gpu_fence
Date: Fri,  7 Jul 2023 08:43:37 -0700
Message-Id: <20230707154337.620-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <77c241ff-b3b6-d399-59db-0291dc9d2812@collabora.com>
References: <77c241ff-b3b6-d399-59db-0291dc9d2812@collabora.com>
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

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 v2: Fix indent (Dmitry)
 v3: Refactor drm fence event checks to avoid possible NULL deref (Dmitry)

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

