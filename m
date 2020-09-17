Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6848926CFC1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F39A6E09E;
	Thu, 17 Sep 2020 00:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8DC6E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:43 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id z19so65408pfn.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V8m7qPDfB55B1mb2byxbuGqYmAz2nUtTaDYRFEV2hkc=;
 b=ZDGp+YY4ztgQiEho1mBRHBvjNVZTQDyA/S91eYaN8qtKN8NOCQ/gGC1lTPpofsPrCf
 yeRMY793r89nsPf/t0bcQtpU9nqJ0tsM7ID2L3j9uY2D5Db1WmRBmlTA2danDT7se58S
 qPcJg8cRHF1occcz3F7i+p5TQkbOjK4ItZ61U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V8m7qPDfB55B1mb2byxbuGqYmAz2nUtTaDYRFEV2hkc=;
 b=fTE+xPvSb9xofsJvVfLKusoEQaDmiQReNNM1AP938k0kHSPR4WfAu+1d6Vy8iz1juE
 7Sh5j66SGhoRtSnDToMsYwqRfN2mNQ6qHG1x9S7WRqN8Gh7QqGgGXM4ROpm8uCQmLRiQ
 ONEX8FWETDN/Eqy4ZczeUChVy3cn8YUGm8Te/dVJBxgsQjlbB6wSHiQCK/hqu58+Ep3h
 LlVNJXso9zTOagfrAIwUE+EK2qVx9uUZLbMeop0by3QR/MZTrQ/Tcg3Kz9gb3UXngToP
 YaUeZ8wo2qlPnyxNTt83WkTPk8495SlHiGemLGM0GxPBCwTzuLImbIAYnr+l9BkxYswp
 Dahw==
X-Gm-Message-State: AOAM5308LgcRzB+FmnlXxao3gDQaLLT4tF6yYKXPiDx6Rj27S4n+rNYp
 8fl/CdcxyrdPt0UeAAFDxQoYLr0yPiQD3g==
X-Google-Smtp-Source: ABdhPJw6CK2yJywdv3a/VTx7bPrkRQddTNkfciLS0QQvjxX/DtchLgVFdeoj/wdRUi+iLVnZcW0p3w==
X-Received: by 2002:a63:4c49:: with SMTP id m9mr3553758pgl.391.1600301322649; 
 Wed, 16 Sep 2020 17:08:42 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:42 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/19] drm/virtio: blob prep: make CPU responses more
 generic
Date: Wed, 16 Sep 2020 17:08:21 -0700
Message-Id: <20200917000838.735-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917000838.735-1-gurchetansingh@chromium.org>
References: <20200917000838.735-1-gurchetansingh@chromium.org>
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
