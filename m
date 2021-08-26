Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD193F8051
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B286E49D;
	Thu, 26 Aug 2021 02:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BEC6E484
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:05:09 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 7so1315637pfl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQs6GolRf7XAgqLtU5W74LElnb4PMb6J11HDyCqtXWs=;
 b=KXasVKaeg1PGfVNyn9Wa70pVU4hG7KEQ3Hfkry39IMzOSBfg/pUryFrCQHI9uDmNB1
 05Fzumku6MakcmpX+6JyfqHeL2qDSViyjOeVHtw2zi54hM7Yh3uhPEQZB0f/BW2aJC7d
 iBQYxukqEjIYQibex+6LxWIt3rFRDUuiz03yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQs6GolRf7XAgqLtU5W74LElnb4PMb6J11HDyCqtXWs=;
 b=jkl7iwDDNKtGAHUoMCQ810b3a6o92Nqkuu6VwUigKplCrEVEiW4a075Ii5M6wFmS48
 V/XpiABI/jN7FKaPKuFoJXAWs+1Itbi+Gnd8a6PGUv8Hy0krPHfVrpQVOSuM5IpUolcT
 dPZqNClf5ra43e4/jJi57nGN52u99CiPWmfp7RR/RP5Ucf/3dOVhf7Jti44Lq9gvhHLb
 K5QSW30a3PjDYywOlp6xHg7OxOM2wowZpL5orFrqL/E26kaBdb7M5MeSRWX/Ox30iZEC
 OgPQUEQKXzTLkXYwX2uB3gHCO3B7rDXA0AuNyz7unfbXzcJI2QruQrEvfNJ9Jq0JqTKp
 hxlQ==
X-Gm-Message-State: AOAM533DaVCjsi4s9ECxXoqbz3bf0fKlftA5e9LXBT74BBEO90Iu6VQx
 2Qsz7qTVMDhqu8sKZ6Tf/kOrzwZgxpgymg==
X-Google-Smtp-Source: ABdhPJwrnVGzfjMtx8WK1+oBvR1Bwea1AOznzHqJaINfL8Ktaz8HMAQS+RwUrftqG4S7xzgzIfe4MQ==
X-Received: by 2002:a63:ec06:: with SMTP id j6mr1110357pgh.259.1629943509122; 
 Wed, 25 Aug 2021 19:05:09 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:faed:1e29:6bf7:3354])
 by smtp.gmail.com with ESMTPSA id o10sm704987pjg.34.2021.08.25.19.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:05:08 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [RFC PATCH 09/12] drm/virtio: implement context init: allocate an
 array of fence contexts
Date: Wed, 25 Aug 2021 19:04:52 -0700
Message-Id: <20210826020455.1081-10-gurchetansingh@chromium.org>
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

We don't want fences from different 3D contexts (virgl, gfxstream,
venus) to be on the same timeline.  With explicit context creation,
we can specify the number of ring each context wants.

Execbuffer can specify which ring to use.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 +++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index a5142d60c2fa..3243d836b9c7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -56,6 +56,7 @@
 #define STATE_ERR 2
 
 #define MAX_CAPSET_ID 63
+#define MAX_RINGS 32
 
 struct virtio_gpu_object_params {
 	unsigned long size;
@@ -263,6 +264,8 @@ struct virtio_gpu_fpriv {
 	uint32_t ctx_id;
 	uint32_t context_init;
 	bool context_created;
+	uint32_t num_rings;
+	uint64_t base_fence_ctx;
 	struct mutex context_lock;
 };
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index f51f3393a194..262f79210283 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -99,6 +99,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	int in_fence_fd = exbuf->fence_fd;
 	int out_fence_fd = -1;
 	void *buf;
+	uint64_t fence_ctx;
+	uint32_t ring_idx;
+
+	fence_ctx = vgdev->fence_drv.context;
+	ring_idx = 0;
 
 	if (vgdev->has_virgl_3d == false)
 		return -ENOSYS;
@@ -106,6 +111,17 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	if ((exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS))
 		return -EINVAL;
 
+	if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX)) {
+		if (exbuf->ring_idx >= vfpriv->num_rings)
+			return -EINVAL;
+
+		if (!vfpriv->base_fence_ctx)
+			return -EINVAL;
+
+		fence_ctx = vfpriv->base_fence_ctx;
+		ring_idx = exbuf->ring_idx;
+	}
+
 	exbuf->fence_fd = -1;
 
 	virtio_gpu_create_context(dev, file);
@@ -173,7 +189,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 			goto out_memdup;
 	}
 
-	out_fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
+	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
 	if(!out_fence) {
 		ret = -ENOMEM;
 		goto out_unresv;
@@ -691,7 +707,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	/* Number of unique parameters supported at this time. */
-	if (num_params > 1)
+	if (num_params > 2)
 		return -EINVAL;
 
 	ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
@@ -731,6 +747,20 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 
 			vfpriv->context_init |= value;
 			break;
+		case VIRTGPU_CONTEXT_PARAM_NUM_RINGS:
+			if (vfpriv->base_fence_ctx) {
+				ret = -EINVAL;
+				goto out_unlock;
+			}
+
+			if (value > MAX_RINGS) {
+				ret = -EINVAL;
+				goto out_unlock;
+			}
+
+			vfpriv->base_fence_ctx = dma_fence_context_alloc(value);
+			vfpriv->num_rings = value;
+			break;
 		default:
 			ret = -EINVAL;
 			goto out_unlock;
-- 
2.33.0.259.gc128427fd7-goog

