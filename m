Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729FC4042C6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4A76E41D;
	Thu,  9 Sep 2021 01:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487C36E3F9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:37:29 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso255632pjh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 18:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A/OBMGDCn78tw9KW1gw/WHKCVAHPqjUMjlZGGPO/HKE=;
 b=TS0IYVZu8oKlY9UBDaML0u30YbeMH/CvKNx0CFRMANlC3O4a/K1mT7ctnaOynj+UE0
 bFLwB2K9eMUwKR4yIpDG3/HT1akltQ3WLMKfRH+L6vEy2syq+LjdGv5cYRSV9OEHrWXD
 C6mwyV/OS6rw8bNLRpqPDij4gvgK2YfnN8UsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A/OBMGDCn78tw9KW1gw/WHKCVAHPqjUMjlZGGPO/HKE=;
 b=JocQz8+z0JWESOLH+dhgqbpysa5eA09BEaj8z9zD6LmGFzNYOaFNkU1FmQvcxwxKcK
 v0VkmzU78SMXoLEUkmbrSXYo3pC344tY+vM3S1WjeAfsH1g/eB9ONUvra38IuB7nRGWZ
 jznS+j365rB9AYEPZFOaEBS9M5Oov7e0YJvJB5U1hC09K6MQk+TQvHEKvpPsuD9EVvfI
 sMgqwj3bRF8bnxQ37tBQyn9HDHzZ6Jnedn0TeCuVSyU0xbj+srdX1/5j7KPJkcSyr+8y
 LADqNps6/N07cr9mWy84DzffbRyIKTH1NVczFv43JRfMuohHaz3h8sAXCGZYTahKbdAH
 2hVg==
X-Gm-Message-State: AOAM533vXdpY99YDKaskM2nxbkRZMZYIg62ExfmNCoYLyO+uiE2qJe2b
 5pmWpy03j/B1ITzXrACmCo0dJHAy2ei5nTs4
X-Google-Smtp-Source: ABdhPJwqgXniehSDbFpawWTilm76z2gLVeKcnjtWtntjZ09jCF4HUFJc15Wd2ySS8CdtVFdAf3grPw==
X-Received: by 2002:a17:902:b102:b0:134:a329:c2f8 with SMTP id
 q2-20020a170902b10200b00134a329c2f8mr542290plr.71.1631151448460; 
 Wed, 08 Sep 2021 18:37:28 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:b3e5:2f81:d686:bc91])
 by smtp.gmail.com with ESMTPSA id h9sm142488pjg.9.2021.09.08.18.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 18:37:28 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 09/12] drm/virtio: implement context init: allocate an
 array of fence contexts
Date: Wed,  8 Sep 2021 18:37:14 -0700
Message-Id: <20210909013717.861-10-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210909013717.861-1-gurchetansingh@chromium.org>
References: <20210909013717.861-1-gurchetansingh@chromium.org>
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
2.33.0.153.gba50c8fa24-goog

