Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1981A7415E6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 17:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F0110E38D;
	Wed, 28 Jun 2023 15:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A5C10E38A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 15:58:42 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b801e6ce85so305015ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687967921; x=1690559921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dax252GScSTM72mTXN66U2/TcftXoaB8iE9QcKFRcX8=;
 b=oWg/A8ce0+VKKoR3mvXft2AsyN8EgvnVxPXkiB/ecaBO1ErFcb6mOVPQMkv1j2G9xl
 HooiRqJrPpImsBxZTgWCv00XSKXej6fkrQvGDMsQlRe4qsVBeB22Y0Zeb9hkNgfSh9VY
 m7i1/uQPlIT+anoiZC4rMkos6ZYU1yZ3jbzxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687967921; x=1690559921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dax252GScSTM72mTXN66U2/TcftXoaB8iE9QcKFRcX8=;
 b=ldkBjm5qpwmIVHMlyctg0o9qo8FwjUu6MQ5JNqOJVz6lGIkKLWCgdM+97CWypCybYZ
 hIRsTHy+XX6sonH9lPbpejT2NPnhyxr+mAylcz4cmbarVYg/1UAg1u7kaKox2rD6YKWH
 lXtGvt8lfbu6mlfDZq8Bv1vMA3oEvey0Nl6/OVy9ABEnPQJLvJ22J4njL8AsTVUUXAQJ
 UZ/AmBo0kbzSIXDkMa7w+j2LEt17n5zbL3HpGCHPb9UGjDc4p+H+wSRjH7/2z/a9kQw8
 pnZoYiV60ipKbrifIgGcLIAZSh53G85R7P9AlaZE+WBETzkaNZY39LPxfKIvTBJ1DYSu
 uRrw==
X-Gm-Message-State: AC+VfDz66X4Cm6qqWTzToYnPylm0K0zpoj1YIcO1lc0vcSg9vvqTKZ78
 KBK6GqxRjHnxdjjxtWErfmIBOseucxO1o+whfc4=
X-Google-Smtp-Source: ACHHUZ7S+m8s2pL8NytJDqLOqffPqedZz7SjFuhN0gfcpHNkurZ7knua37h28hhp5AdbHy5DgvjkaA==
X-Received: by 2002:a17:902:e84e:b0:1b7:de50:7d9c with SMTP id
 t14-20020a170902e84e00b001b7de507d9cmr2767263plg.15.1687967921015; 
 Wed, 28 Jun 2023 08:58:41 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:d2c4:f550:41b0:b602])
 by smtp.gmail.com with ESMTPSA id
 jd22-20020a170903261600b001b3c66f806bsm5500175plb.217.2023.06.28.08.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 08:58:40 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/virtio: conditionally allocate virtio_gpu_fence
Date: Wed, 28 Jun 2023 08:58:38 -0700
Message-Id: <20230628155838.589-1-gurchetansingh@chromium.org>
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
Cc: dmitry.osipenko@collabora.com, acourbot@chromium.org, kraxel@redhat.com
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

The use case for just submitting a command to the host, and expected
no response.  For example, gfxstream has GFXSTREAM_CONTEXT_PING that
just wakes up the host side worker threads.  There's also
CROSS_DOMAIN_CMD_SEND which just sends data to the Wayland server.

This prevents the need to signal the automatically created
virtio_gpu_fence.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: <dmitry.osipenko@collabora.com>
---
 v2: Fix indent (Dmitry)

 drivers/gpu/drm/virtio/virtgpu_submit.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index cf3c04b16a7a..8c7e15c31164 100644
--- a/drivers/gpu/drm/virtio/virtgpu_submit.c
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -168,9 +168,13 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
 
 	memset(submit, 0, sizeof(*submit));
 
-	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
-	if (!out_fence)
-		return -ENOMEM;
+	if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) ||
+	    ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
+	    (vfpriv->ring_idx_mask & BIT_ULL(ring_idx))) ||
+	    exbuf->num_bo_handles)
+		out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
+	else
+		out_fence = NULL;
 
 	err = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
 	if (err) {
-- 
2.41.0.162.gfafddb0af9-goog

