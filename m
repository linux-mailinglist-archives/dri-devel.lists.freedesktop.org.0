Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B972B413DF9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 01:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112ED6E927;
	Tue, 21 Sep 2021 23:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FB16E8FE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:20:37 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso3141969pjh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OwXQ3JbeW2V7XC74biwsVORTEfYWkr3o00i1Mic24EA=;
 b=QUVROrosN7Cv8mxd0u6wUZGHPoQM0p+3PiMCoYZStEhLIkRPjGl8ECc+j//EEA3Iwy
 FOFJ0RHR3mRtpBkN04RdFUGiUxV+6gDA+sQF9DA7rqdbVGftv0tFP6TBC3SU2wocJtXm
 Orm142rcS7xEZxYUe5JClMzX+KxxnbRc/1J7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OwXQ3JbeW2V7XC74biwsVORTEfYWkr3o00i1Mic24EA=;
 b=TR9/GkAV9NbYlgpGOuXy6y8kmRbEtLJltd9JIj0YLHqqFyYV43cIYNHiQpepAg0j1V
 uFNBUmZ5yNWA7Kr2s0I+AcRfuOfdChti0b6GoCDfMyOjL4qC5/2VQO5m7WlSX65S4gHR
 JCBez2hpCqpb29FPXQt9Yu2GKZZKcqh1TTwc3qhfk204E1c2zGmmPnfzHhxbjhO/wPOU
 qBFiRxJw+QCdN4q3xA8MFYg5VL0QOnp8TElvI5FJXlCMhk/DrBa4zteTIaasauuPLcSy
 LWcxSHll8OK0I3CYRWoMl23TcqkUOexY9deitsQACumCXPVRxKCo6G/C8kfbucL3vp6E
 J1Og==
X-Gm-Message-State: AOAM532c6eDgr4WgxvDpWt87oEfLDqHqexOUZGUYAhYSik8R+5bSuzoe
 rKh8NWpEl7OsxK4W0FHNZdiGg1iXPTXDfw==
X-Google-Smtp-Source: ABdhPJwiPpOYPPHpvkjKVNyzz1/wx/qvf1QwK4FzIRPHRNrzlQFGKuC1eQF8YEj+4hflFFhv5dtrfQ==
X-Received: by 2002:a17:902:ab16:b0:13a:356c:6a02 with SMTP id
 ik22-20020a170902ab1600b0013a356c6a02mr29577492plb.66.1632266436799; 
 Tue, 21 Sep 2021 16:20:36 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a5ff:11c:6401:fce])
 by smtp.gmail.com with ESMTPSA id e2sm201906pfn.141.2021.09.21.16.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:20:36 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 10/12] drm/virtio: implement context init: handle
 VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
Date: Tue, 21 Sep 2021 16:20:22 -0700
Message-Id: <20210921232024.817-11-gurchetansingh@chromium.org>
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

