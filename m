Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDBD413DF0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 01:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B96C6E900;
	Tue, 21 Sep 2021 23:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BAD6E8FE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:20:36 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id n2so473601plk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZsfcIzkwhwBQ89BKvSpvb5VtRfJ5S6bNJn/tgHeiyyU=;
 b=H6zBG3UKetpgkEQ1KDKvDKIE3e1fTfr5nhLZ9qDZQtASVHprkzGTJ6w9A6XtBpsDlm
 rKIJaZNtbQE8hpwzqjvKzi+lOoiqh4B6st0hTxvm6l2ouhpUeuZZzo73bUXV79xFs74q
 9Wl5/TKH68ANgA0iwk2k7LHkkPWNokICi3niU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZsfcIzkwhwBQ89BKvSpvb5VtRfJ5S6bNJn/tgHeiyyU=;
 b=e3bnMp35HhbrpK/Whp0X4dCB2OZbAP6eqiMFq0WoEljlMMJctDpcvk9NTy4vzHVsFC
 8xmhNcyqdXzB2PCzf1zFXkB92FZufLXSwXWvYgJ3nNdCGSuE4Vpnzm74mTToGIJ1qdZd
 dlcE9cuuZwk9E9vCeUnLcUhZyJ5QU+sveEX0/Z8EIQl9ND+178WmIU9y5QNzHF5k+Wsa
 AmuPwZXD7IUo0Q7nKpL+0OEwx3rcde1Iywqmnd74qMVTRPyKaCuN1R4ICYCZSBhflvgY
 b0SI7+DlgbV2AboC9Foti9TB1Hq01M767fjSPzY+uaT55hncGOthob0R4ck7+1OaPK0D
 y6/A==
X-Gm-Message-State: AOAM5335a0bdSscD3+6sEeHzFpQDUKqRUj6pMMHKMjGMxaoJ2t29yG8Y
 VRp/TqSvDZG2bORyqrBrjyijrQZ9vwb4Wg==
X-Google-Smtp-Source: ABdhPJzzkOMLKhEcAV+e4yHIsB2jhHyzd2nlw+vo+c9PLTXE6rPKc9T07y0yzgyR5O7uGJsxLlg5lw==
X-Received: by 2002:a17:90b:314a:: with SMTP id
 ip10mr7862284pjb.77.1632266435899; 
 Tue, 21 Sep 2021 16:20:35 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a5ff:11c:6401:fce])
 by smtp.gmail.com with ESMTPSA id e2sm201906pfn.141.2021.09.21.16.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:20:35 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 09/12] drm/virtio: implement context init: allocate an
 array of fence contexts
Date: Tue, 21 Sep 2021 16:20:21 -0700
Message-Id: <20210921232024.817-10-gurchetansingh@chromium.org>
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
index a5142d60c2fa..cca9ab505deb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -56,6 +56,7 @@
 #define STATE_ERR 2
 
 #define MAX_CAPSET_ID 63
+#define MAX_RINGS 64
 
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
2.33.0.464.g1972c5931b-goog

