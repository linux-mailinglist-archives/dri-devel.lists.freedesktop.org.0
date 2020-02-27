Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8568170D28
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 01:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1D46EBE0;
	Thu, 27 Feb 2020 00:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004DE6EBDE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:26:13 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d9so363791plo.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 16:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5UXNMjqwC0/YVd3fkn1zDSBjK7GaVkht/0xi6c0xEk0=;
 b=Gfh1m/M3fxyDctoB0Cz88rrA/QEc/BOGRSX9MetssQF6kBKF473RJtP/r/nDR+3mmT
 0Jrt4OLnW6O4ZMk6mj7H/dbXwg2ez6jDu4oWZ1CnLjHn/WtxRRAebzInfScCyoe362zN
 Xjarol9RGexYvkCD4aXI7LCfhtwEmhfo7/GKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5UXNMjqwC0/YVd3fkn1zDSBjK7GaVkht/0xi6c0xEk0=;
 b=KzOvwqTvrNBNStZn8T8RCdO7xvRre8TnHx45qfd8up1h8Tvu3QLdKv62OBbgJpSSQv
 WKeEcORaZAkktXb1in4H89RYJHKUGUuJCWT8tPWy2jKh2E2zlyBzKiKxve+i3ZMOwY+m
 ocMUYPLfjE3yj+Izm9bwkuc295mM550XyaGJhdcZfoin3r2mAiQQLOC/S+bYO1k7j8JT
 sdJ/7nlPT8JQXfeX7F6EAx4bnk22yEhXJH2ofELpF2UHapwJlTF2QrzgBE9MZ9omHSQ3
 hGEnLUkUARb+IIvpDM/lBEE4re+vhoUo7I1CfKbglQ+nEkjanQHvPbaHUaw8FcC96/Kr
 RNLg==
X-Gm-Message-State: APjAAAWJ1NrSl0Aim+mS7k3NlW1aAsv4EepDyBdDKIlL0C/Kcq4hIKbM
 bw8VMC1cc4Y1FfV+JLdXYKlH88jT6ls=
X-Google-Smtp-Source: APXvYqxw0wtqJIGEfszCdfWwa8z36/2eavXWs8LdEx3z07GhslNeCptQDaIQKChpXgtIolBd02+qiQ==
X-Received: by 2002:a17:902:8f8a:: with SMTP id
 z10mr1937463plo.169.1582763173217; 
 Wed, 26 Feb 2020 16:26:13 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id d14sm4522237pfq.117.2020.02.26.16.26.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 16:26:12 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 4/8] drm/virtio: make RESOURCE_UNREF use
 virtio_gpu_get_handle(..)
Date: Wed, 26 Feb 2020 16:25:57 -0800
Message-Id: <20200227002601.745-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227002601.745-1-gurchetansingh@chromium.org>
References: <20200227002601.745-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This hypercall is reusable for both shmem and (planned) vram
based virtgpu objects.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 17 +++++++++++------
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 48ca1316ef7b..0e99487f2105 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -267,7 +267,7 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object_array *objs,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
-				   struct virtio_gpu_object *bo);
+				   struct drm_gem_object *obj);
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 283b6dadd7c8..84df573e13de 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -100,7 +100,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
 	if (bo->created) {
-		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		virtio_gpu_cmd_unref_resource(vgdev, obj);
 		virtio_gpu_notify(vgdev);
 		/* completion handler calls virtio_gpu_cleanup_object() */
 		return;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 5e2375e0f7bb..feceda66da75 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -521,28 +521,33 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 static void virtio_gpu_cmd_unref_cb(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_vbuffer *vbuf)
 {
-	struct virtio_gpu_object *bo;
+	struct drm_gem_object *obj;
 
-	bo = vbuf->resp_cb_data;
+	obj = vbuf->resp_cb_data;
 	vbuf->resp_cb_data = NULL;
 
-	virtio_gpu_cleanup_object(bo);
+	if (obj && virtio_gpu_is_shmem(obj)) {
+		struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+
+		virtio_gpu_cleanup_object(bo);
+	}
 }
 
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
-				   struct virtio_gpu_object *bo)
+				   struct drm_gem_object *obj)
 {
 	struct virtio_gpu_resource_unref *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
+	uint32_t handle = virtio_gpu_get_handle(obj);
 
 	cmd_p = virtio_gpu_alloc_cmd_cb(vgdev, &vbuf, sizeof(*cmd_p),
 					virtio_gpu_cmd_unref_cb);
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_UNREF);
-	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->resource_id = cpu_to_le32(handle);
 
-	vbuf->resp_cb_data = bo;
+	vbuf->resp_cb_data = obj;
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
 
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
