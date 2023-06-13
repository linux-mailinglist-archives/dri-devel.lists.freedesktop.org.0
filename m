Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3086F72EA29
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 19:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D12110E05E;
	Tue, 13 Jun 2023 17:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF5F10E05E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 17:43:10 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b3c578c602so18789575ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686678189; x=1689270189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2jUoCxG9xEyss5YkrKWQZTjrjZPoix2ScNs1wDy7ckQ=;
 b=TJ9C1fO3ROfAcUhRGtIuWr4j6lmqCoX8RNH7WRnQ9h/c1KvNMXrxti00F2jOkaXbTK
 7hN/obZ5zMroG/BKZY6ZY/L3+ekG8m+SH1A0mDGYu5N4xK4+tFIHCV523AiBTDocMVMc
 Dl7Kr+G8YLN9cf5SVvKZ3Jg0+y6AjABT6/DlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686678189; x=1689270189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2jUoCxG9xEyss5YkrKWQZTjrjZPoix2ScNs1wDy7ckQ=;
 b=Rz18lQmvdG3fECkb3SmKBznkZWZ5DdpGNO7meIWEcbpco0E26paj5QSUOGVrWWxHFk
 FsZsRpQF2i9kGRPR47ZMvrY1QujCcynQh5WtSaKQHsmFJvSXALQT0LayNPNwuxopSPUL
 lpwZwHwoZCjIm/i/Ir6mjhLFVBQlK6bhELfS37nDuIpEZQQxpbavlpxrTL1MJwca5cwu
 Babr4/9dt9jPucsIWq8xO4AtiRvCkDgGAKTufX/QjH2YH6/wZNMbyVlryj6rWTjU6e6s
 mJDTs3jQLWhswu/KRejd9dsGhb9dTXQAUdJ9jAsPrF/vSlrU5mWUIkWJz6Fs/AKVuVqw
 tl9g==
X-Gm-Message-State: AC+VfDyMQk+dP1mA0BvuLbEP07gS5x1LlEA++GJbLxPIY6COR58b8MBK
 cgVYiMua5o2nReE/ECIW6N3nyXVArK17LOy+uUc=
X-Google-Smtp-Source: ACHHUZ5cuGSH79jYNfr29fxsFdBVofJuEL60PzFqPBipscZEswGuAEiG5v1KWPCz5wF92uR3PE9jCw==
X-Received: by 2002:a17:903:1d2:b0:1b3:f5c3:7682 with SMTP id
 e18-20020a17090301d200b001b3f5c37682mr1534123plh.68.1686678189004; 
 Tue, 13 Jun 2023 10:43:09 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:a28d:9190:55d9:f0c1])
 by smtp.gmail.com with ESMTPSA id
 ji18-20020a170903325200b001b20dc1b3c9sm6498899plb.200.2023.06.13.10.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 10:43:08 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: conditionally allocate virtio_gpu_fence
Date: Tue, 13 Jun 2023 10:43:06 -0700
Message-Id: <20230613174306.1208-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
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
Cc: acourbot@chromium.org, kraxel@redhat.com, dmitry.osipenko@collabora.com
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
 drivers/gpu/drm/virtio/virtgpu_submit.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index cf3c04b16a7a..add106c06ab2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_submit.c
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -168,9 +168,13 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
 
 	memset(submit, 0, sizeof(*submit));
 
-	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
-	if (!out_fence)
-		return -ENOMEM;
+	if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) ||
+		((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
+		(vfpriv->ring_idx_mask & BIT_ULL(ring_idx))) ||
+		exbuf->num_bo_handles)
+		out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
+	else
+		out_fence = NULL;
 
 	err = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
 	if (err) {
-- 
2.34.1

