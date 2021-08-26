Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD43F8056
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CDB6E4A1;
	Thu, 26 Aug 2021 02:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097A66E484
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:05:11 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so1221807pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SZ6PEEgYy1+ZBpUxxicjnH4kRpBsEQAfEai/Tev/mrk=;
 b=SBznII6SkuRNz0t7j/2r27PTIy09LCOE+OyHbZufPy7AkgNWujqvEC1KaIZi4GHCaD
 kdMMt7VFHIN/g+G4611qIuFRhXWoDRBRx7QxjxkQU/EVBtnlLP6sbOUWOHbc9vW92kLB
 ehp1mrvNFEYAoyOryZJR/7ep1Vggn3GZwIcDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SZ6PEEgYy1+ZBpUxxicjnH4kRpBsEQAfEai/Tev/mrk=;
 b=D5ZbpzsMY4sc1PnZ31l5TCjlKTj/n8PpjHsc8bpSG5urK+fkffoJWRNtUW0Q1LHP9G
 DmHUzPPu8aqLOF7iDmLA/OAVwVORiNPNyIfU14B7MGD4jACnoYYD4Znv5kWjlcvEc7dV
 qqwaUI89omgdDkAzjRrXFZiNvefb+eAB0hCq7Ghgyubk5DKF05uuVnZl/8R5/p8k5oeB
 ihWYrDc1PQ5E0vLFUX3u1g+QN5zjj3kCTwf6lqKg3Ku8wxqvicKK8awRFZihJoM59XDe
 8D5EWPK9PmHnmPiuLLVd6GkGm4vZDCM4dbGe+WR/ImisvK4p6WgUDzDaUpSZ+bqt+WvX
 mZVA==
X-Gm-Message-State: AOAM530H48e5ZYcBlwN9zuNUSPtFwLbdLNDIpmD6hXzGHlOvfjxunKdc
 b7n+rPynsdJaQKBPscZM9rnmLd89+o3Jug==
X-Google-Smtp-Source: ABdhPJxEIoP5rdzPfO2WplRjAjGtDdRKx2qMZ1iWaubm4+wtoefTHBSmoyHzmauTGPuI21E2zufVXg==
X-Received: by 2002:a17:90b:b03:: with SMTP id
 bf3mr14128167pjb.15.1629943510381; 
 Wed, 25 Aug 2021 19:05:10 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:faed:1e29:6bf7:3354])
 by smtp.gmail.com with ESMTPSA id o10sm704987pjg.34.2021.08.25.19.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:05:10 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [RFC PATCH 10/12] drm/virtio: implement context init: handle
 VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
Date: Wed, 25 Aug 2021 19:04:53 -0700
Message-Id: <20210826020455.1081-11-gurchetansingh@chromium.org>
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
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 23 +++++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 3243d836b9c7..1182d5e5d322 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -266,6 +266,7 @@ struct virtio_gpu_fpriv {
 	bool context_created;
 	uint32_t num_rings;
 	uint64_t base_fence_ctx;
+	uint32_t ring_idx_mask;
 	struct mutex context_lock;
 };
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 262f79210283..8523351b523d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -693,7 +693,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 					 void *data, struct drm_file *file)
 {
 	int ret = 0;
-	uint32_t num_params, i, param, value;
+	uint32_t num_params, i, param, value, valid_ring_mask;
 	size_t len;
 	struct drm_virtgpu_context_set_param *ctx_set_params = NULL;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
@@ -707,7 +707,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	/* Number of unique parameters supported at this time. */
-	if (num_params > 2)
+	if (num_params > 3)
 		return -EINVAL;
 
 	ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
@@ -761,12 +761,31 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
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
2.33.0.259.gc128427fd7-goog

