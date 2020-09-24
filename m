Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5503B276511
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203586EA1A;
	Thu, 24 Sep 2020 00:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEACE6E067
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:18 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id u3so621883pjr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V8m7qPDfB55B1mb2byxbuGqYmAz2nUtTaDYRFEV2hkc=;
 b=S/PTaQQnrFwzatjaDVA1RGYct8NNxO8G8GWmlG/E1yfldDbz2hWidmsnd7n9qCE8DU
 rojlXwSnRGjRa8OnBspCMZ/9bAsADdgA03Ket4xFkmCbX9f2Omnqbf+lsx6Z9ZWHms5c
 UipsioRWKlk2vwJDPG6OB5PS1YPHJdYYhuI78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V8m7qPDfB55B1mb2byxbuGqYmAz2nUtTaDYRFEV2hkc=;
 b=mJfmSyaOYCo9UUR2UqOY1OP/QRID74ZrPHycXBFyC7BxoN/ZeUvJlUFzjeAegTZArl
 MEVySiHxhks7AzRJkp9fA2XWJpBQ/fHBN/0fG8UAbmGCZ7iccDvNjocZi+h0Ac3j6a2M
 nPDvjAIxPMwhAebAzhLtRTgckTb8fyqeFj4bxDxT+NNLB0iHUc9tcWxfJM1gLS5M6Akr
 hi4FOgo4Pt1hQF/e5QUb6dsKWKHO2cZRD4K5ujO/hlgTDsdSjJ54LB5V+MZCvJFDJP06
 DYfNfON6I7RMOKqaKkp1VQ1wgWnNbKE5KLtuQdpyHIuQTIW0xRk0REeSoocs1GS2pnGx
 NgEA==
X-Gm-Message-State: AOAM531IdNOoRDPblMr+HPwOaa5ZloKTT/RskxXtnmVlitnIEx722ZKL
 yyEOEiX1vKr3znAr4X0pepGEBKuyzEGMIg==
X-Google-Smtp-Source: ABdhPJyuq06faHzvvJBFdx7ghVG4h+qCut/f8PbyaP2uv0IiPiIh6IIyglQT5L+3gv+eIZKbaRkeOg==
X-Received: by 2002:a17:902:8bca:b029:d2:42fe:21da with SMTP id
 r10-20020a1709028bcab02900d242fe21damr2105939plo.31.1600907538158; 
 Wed, 23 Sep 2020 17:32:18 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:17 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 02/19] drm/virtio: blob prep: make CPU responses more
 generic
Date: Wed, 23 Sep 2020 17:31:57 -0700
Message-Id: <20200924003214.662-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924003214.662-1-gurchetansingh@chromium.org>
References: <20200924003214.662-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RESOURCE_MAP_BLOB / RESOURCE_UNMAP_BLOB can use this.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 +++---
 drivers/gpu/drm/virtio/virtgpu_prime.c |  6 +++---
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 55c34b4fc3e99..272abe177ded6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -49,9 +49,9 @@
 #define DRIVER_MINOR 1
 #define DRIVER_PATCHLEVEL 0
 
-#define UUID_INITIALIZING 0
-#define UUID_INITIALIZED 1
-#define UUID_INITIALIZATION_FAILED 2
+#define STATE_INITIALIZING 0
+#define STATE_OK 1
+#define STATE_ERR 2
 
 struct virtio_gpu_object_params {
 	uint32_t format;
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index acd14ef73d563..3552db128ba3d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -34,8 +34,8 @@ static int virtgpu_virtio_get_uuid(struct dma_buf *buf,
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
 
-	wait_event(vgdev->resp_wq, bo->uuid_state != UUID_INITIALIZING);
-	if (bo->uuid_state != UUID_INITIALIZED)
+	wait_event(vgdev->resp_wq, bo->uuid_state != STATE_INITIALIZING);
+	if (bo->uuid_state != STATE_OK)
 		return -ENODEV;
 
 	uuid_copy(uuid, &bo->uuid);
@@ -81,7 +81,7 @@ struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 			return ERR_PTR(ret);
 		virtio_gpu_notify(vgdev);
 	} else {
-		bo->uuid_state = UUID_INITIALIZATION_FAILED;
+		bo->uuid_state = STATE_ERR;
 	}
 
 	exp_info.ops = &virtgpu_dmabuf_ops.ops;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index a7550044b8b2e..55529ed97d9c7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1127,14 +1127,14 @@ static void virtio_gpu_cmd_resource_uuid_cb(struct virtio_gpu_device *vgdev,
 	uint32_t resp_type = le32_to_cpu(resp->hdr.type);
 
 	spin_lock(&vgdev->resource_export_lock);
-	WARN_ON(obj->uuid_state != UUID_INITIALIZING);
+	WARN_ON(obj->uuid_state != STATE_INITIALIZING);
 
 	if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_UUID &&
-	    obj->uuid_state == UUID_INITIALIZING) {
+	    obj->uuid_state == STATE_INITIALIZING) {
 		memcpy(&obj->uuid.b, resp->uuid, sizeof(obj->uuid.b));
-		obj->uuid_state = UUID_INITIALIZED;
+		obj->uuid_state = STATE_OK;
 	} else {
-		obj->uuid_state = UUID_INITIALIZATION_FAILED;
+		obj->uuid_state = STATE_ERR;
 	}
 	spin_unlock(&vgdev->resource_export_lock);
 
@@ -1153,7 +1153,7 @@ virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 	resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
 	if (!resp_buf) {
 		spin_lock(&vgdev->resource_export_lock);
-		bo->uuid_state = UUID_INITIALIZATION_FAILED;
+		bo->uuid_state = STATE_ERR;
 		spin_unlock(&vgdev->resource_export_lock);
 		virtio_gpu_array_put_free(objs);
 		return -ENOMEM;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
