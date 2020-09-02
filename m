Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 211D025B5A2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0316E55E;
	Wed,  2 Sep 2020 21:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5966E55E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:01 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 31so307860pgy.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1bz6Y5p2PjcNKqFjDBBbB8FbTu6Dfdqz0e+0mGX9GLE=;
 b=E4Ib1SZZz7qqGPJx6PLBYhUcnBwgDhCmisDvOwwCAxvcI/xVQBzhu8rdSp2MKNdZe6
 HqNRmOIBwm7XRdB2yXs4oiUOmtBGTJAoPAbY0ybRfwkkKcPU7wjC/F/nWxiJmF1EcpB+
 SMBvYd/NLrIwB6BoGxGgIu4BTTSbXjBKnzfsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1bz6Y5p2PjcNKqFjDBBbB8FbTu6Dfdqz0e+0mGX9GLE=;
 b=eMjbh/ZNeH6iakET7oO6aVSM9Et8Q+8FuTcpPhlRjinMqjWi9RLgVHr2Jk1+sBmEJc
 NsAUy4ADfInSHqhLzlfcwXSeWrnVl70jL5koUndOcUkRIcP/EVTq2mlf4vEXYf19VcRx
 zfm4XwKkE0Pbq+bagAkf2Y93txS3H50oUFMxRDHQMV49Avd+ysRReCRiWG+XjP7kvxTy
 yRLvtjRb0xCDw96VHav9JZd/A1tj4BUcjupUMvLF+R1tXfe3S+iAsjX34SyfQRUDJ9/A
 BIMz/I0ODgpkppDCpJQBzi+GUBe4uXv7Jquy3Dsgm/ZtvAXpBWrvs44MHjdIPsXl2MkC
 9hcg==
X-Gm-Message-State: AOAM530bnX7SwwMLSJv0bs2ofN1UIw1IIhmz61IUwVppVks41qT7m1Zn
 FMnyp1G/agy6uCnzG8DS/c1ezS3PFwGSdA==
X-Google-Smtp-Source: ABdhPJwLuXFkSEYDyzBLyiu6th6rU0C9G3uYU08N1JgUmKz14L+SXPl+nNv3kqv4E6k2pBwV1MR7tw==
X-Received: by 2002:a63:c543:: with SMTP id g3mr3404453pgd.203.1599080940620; 
 Wed, 02 Sep 2020 14:09:00 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:00 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 08/23] drm/virtio: blob prep: make CPU responses more
 generic
Date: Wed,  2 Sep 2020 14:08:32 -0700
Message-Id: <20200902210847.2689-9-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902210847.2689-1-gurchetansingh@chromium.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
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
index a52b7a39f286e..f88e8902e1d61 100644
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
index 7436705ba5a22..deae7687eec3c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1122,14 +1122,14 @@ static void virtio_gpu_cmd_resource_uuid_cb(struct virtio_gpu_device *vgdev,
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
 
@@ -1148,7 +1148,7 @@ virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
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
