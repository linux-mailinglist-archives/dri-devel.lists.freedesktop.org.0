Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CB4244319
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3256E5AB;
	Fri, 14 Aug 2020 02:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2306E5A5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:14 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id c6so3722112pje.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vCkHi3Zgj7BANIiUb5BE30kLWbBpH+05MInM8wAWAo4=;
 b=hvhuj6swyowN3ebv7vvAuDqdKLaVtilByEVErAJ3f0QmTu0uHDuQME25RkP6kby4GJ
 LfTxW84CSh6Nh9fdaVzAcvpKsoTTg8+P8gkzdg+lR77rPYen94P7Mzx4Ip/ZeI6QacMu
 RN+S5MftjS6fNmH0phoeEGLUC6eTbVFQydD6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vCkHi3Zgj7BANIiUb5BE30kLWbBpH+05MInM8wAWAo4=;
 b=hzIaMKbv6OVvNfOIKyNvxrRVSrq0DeDa2pZw8lqRxFfhORLQeTCdkZGTF7Ar/Ybe3/
 x7lDFKTgW8RhgNsO5iGy96/jwnSIiD8BkWq8cnV7k06lykUiyk0+JFxNOHK+GKtCNEMz
 uStfW5RcKhf9cUJcAIqgdR7PgXdFKpRpnQ/J9m9IThudRG23rgWRu2FDVt1v1DBhZSWN
 4zArMQrA4QrE/F6HFZRyAObeStCdwaAGWK+vbmzcfBKQF4XqszCQw1armQDc7Zll1Ici
 u5ha/6U1JeIvwrzGGMMs0DM/v87UPICSpqkRK4rjwXgD4AAwqr3tjkFB/HEX6rVDhT1g
 PKQw==
X-Gm-Message-State: AOAM530wr78fa78QkpoAhkggEV7/Zl3T4X+H7nn6gP09TiFG1P9aRlM3
 PEfdmojiOoyPYEzBdqvYA1TuV0zfz8o42w==
X-Google-Smtp-Source: ABdhPJwmqrlofUwG7WKfWNMs8J0hFLlIrIYX4CJX7ToMJR6Sr0tSR0jglT+VjgMgQlWhwcjPeIKszQ==
X-Received: by 2002:a17:90b:796:: with SMTP id l22mr543608pjz.46.1597372813761; 
 Thu, 13 Aug 2020 19:40:13 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:13 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 09/24] drm/virtio: blob prep: make CPU responses more generic
Date: Thu, 13 Aug 2020 19:39:45 -0700
Message-Id: <20200814024000.2485-10-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
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
index fc84b4b526ff..c74c38123ff6 100644
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
index acd14ef73d56..3552db128ba3 100644
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
index 55af6fc7bc7c..3f225a08ecf3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1118,14 +1118,14 @@ static void virtio_gpu_cmd_resource_uuid_cb(struct virtio_gpu_device *vgdev,
 	uint32_t resp_type = le32_to_cpu(resp->hdr.type);
 
 	spin_lock(&vgdev->resource_export_lock);
-	WARN_ON(obj->uuid_state != UUID_INITIALIZING);
+	WARN_ON(obj->uuid_state != STATE_INITIALIZING);
 
 	if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_UUID &&
-			obj->uuid_state == UUID_INITIALIZING) {
+	    obj->uuid_state == STATE_INITIALIZING) {
 		memcpy(&obj->uuid.b, resp->uuid, sizeof(obj->uuid.b));
-		obj->uuid_state = UUID_INITIALIZED;
+		obj->uuid_state = STATE_OK;
 	} else {
-		obj->uuid_state = UUID_INITIALIZATION_FAILED;
+		obj->uuid_state = STATE_ERR;
 	}
 	spin_unlock(&vgdev->resource_export_lock);
 
@@ -1144,7 +1144,7 @@ virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 	resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
 	if (!resp_buf) {
 		spin_lock(&vgdev->resource_export_lock);
-		bo->uuid_state = UUID_INITIALIZATION_FAILED;
+		bo->uuid_state = STATE_ERR;
 		spin_unlock(&vgdev->resource_export_lock);
 		virtio_gpu_array_put_free(objs);
 		return -ENOMEM;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
