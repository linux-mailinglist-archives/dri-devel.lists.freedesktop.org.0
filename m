Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E658440EE9B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96FF6EAAD;
	Fri, 17 Sep 2021 01:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7BE6EA88
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:08:55 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id y8so7552871pfa.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OwXQ3JbeW2V7XC74biwsVORTEfYWkr3o00i1Mic24EA=;
 b=DhJ7c0G064CSXqEK895+iq6e1w347NHKZbqHx58vHhiISuYGIvHocOxtBnlqCslUXb
 ZQP7tSP6mQzjibjK0s8X1X8C2hb/vFB1MUhcx9czz57wb3A+bhxYspDVuXxABxX70PBW
 sohxW7U/V/Z+jUinJ3iHwpmzZOVgTZRbzQHRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OwXQ3JbeW2V7XC74biwsVORTEfYWkr3o00i1Mic24EA=;
 b=7MgbL28s0GQPuK2uGfnGg/7iJzg410Ul2JUY2gV96UpjOSQ2KzFqYWgYH2MNvteguH
 YuMXhHdmkmSSib00xnMZk9vLlf36JQNFnZQ9iDjswknGl1YmMQSJK57h3jmVmj+CaPC8
 jPV43zPLG5l6io/XwwcQZEVJTIpTDaMhFxHLaRv3Sd0l+gsCwPy9G7xGI8INwiCnftJm
 fW/Yj/xXiibdRZaTtAnvTcl/omjsWUV31ogxx0MQT8DSZjwohgQNuqCErMRRe+zwbzWz
 z6LKfdDcJbGVbmA1D5Nt5KIYhSItTSxtYWnOIORGYeTubREUU1uAIjUzyHxOPgmCJvwt
 xPFg==
X-Gm-Message-State: AOAM532Kt5rDsUFLmmrOvAHh64Z8mi3a7/Z91PUyKfBwfxF1ZDi4idQb
 iBuHiGb/a1dmMKhCPAIod/cjp1sbuZLiKSam
X-Google-Smtp-Source: ABdhPJyq4QU+hevT9v27Afh7SUKG1vBJYaAYG7ErKYw6eZMQi0rVRwa0JJAPf/p33eOtJWMs5RtJqQ==
X-Received: by 2002:a63:5064:: with SMTP id q36mr7591390pgl.307.1631840934884; 
 Thu, 16 Sep 2021 18:08:54 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:dc20:9a88:c41:f0dd])
 by smtp.gmail.com with ESMTPSA id v4sm4215812pff.11.2021.09.16.18.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:08:54 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v2 10/12] drm/virtio: implement context init: handle
 VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
Date: Thu, 16 Sep 2021 18:08:40 -0700
Message-Id: <20210917010842.503-11-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210917010842.503-1-gurchetansingh@chromium.org>
References: <20210917010842.503-1-gurchetansingh@chromium.org>
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

For the Sommelier guest Wayland proxy, it's desirable for the
DRM fd to be pollable in response to an host compositor event.
This can also be used by the 3D driver to poll events on a CPU
timeline.

This enables the DRM fd associated with a particular 3D context
to be polled independent of KMS events.  The parameter
VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK specifies the pollable
rings.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Nicholas Verne <nverne@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 22 +++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index cca9ab505deb..cb60d52c2bd1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -266,6 +266,7 @@ struct virtio_gpu_fpriv {
 	bool context_created;
 	uint32_t num_rings;
 	uint64_t base_fence_ctx;
+	uint64_t ring_idx_mask;
 	struct mutex context_lock;
 };
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 262f79210283..be7b22a03884 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -694,6 +694,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 {
 	int ret = 0;
 	uint32_t num_params, i, param, value;
+	uint64_t valid_ring_mask;
 	size_t len;
 	struct drm_virtgpu_context_set_param *ctx_set_params = NULL;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
@@ -707,7 +708,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	/* Number of unique parameters supported at this time. */
-	if (num_params > 2)
+	if (num_params > 3)
 		return -EINVAL;
 
 	ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
@@ -761,12 +762,31 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 			vfpriv->base_fence_ctx = dma_fence_context_alloc(value);
 			vfpriv->num_rings = value;
 			break;
+		case VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK:
+			if (vfpriv->ring_idx_mask) {
+				ret = -EINVAL;
+				goto out_unlock;
+			}
+
+			vfpriv->ring_idx_mask = value;
+			break;
 		default:
 			ret = -EINVAL;
 			goto out_unlock;
 		}
 	}
 
+	if (vfpriv->ring_idx_mask) {
+		valid_ring_mask = 0;
+		for (i = 0; i < vfpriv->num_rings; i++)
+			valid_ring_mask |= 1 << i;
+
+		if (~valid_ring_mask & vfpriv->ring_idx_mask) {
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+	}
+
 	virtio_gpu_create_context_locked(vgdev, vfpriv);
 	virtio_gpu_notify(vgdev);
 
-- 
2.33.0.464.g1972c5931b-goog

