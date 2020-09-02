Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1CA25B5A6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121546E94F;
	Wed,  2 Sep 2020 21:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FF16E94B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:08 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 31so308066pgy.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4pxJznT18t3ilHxTZA9sDqFXEut5u1oYwy/X8zuj2M0=;
 b=K+JBdZ3+jT1/pEyPE746QdSlwPYFGu3JnoR+4e00Fw29+mHx8+lf7y9YfZHfTS1ZPB
 err6LKYggGvov/wQNyaYqRSV/TAbs4SEyMdBBeFuTw/VKyXFmvpsQF3dDdQCOE/GKEhA
 kyX7HMXMCrO4Oab0JcwoiyQrFNfn1oWhDMGZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4pxJznT18t3ilHxTZA9sDqFXEut5u1oYwy/X8zuj2M0=;
 b=gBShWWqNLIyV20nDp5tTkwGZ+9nzRgHVKgJMUricCyttLdDcDo83hDEsjbkAu3DG2V
 G3+c+vvzcnb2IYXRRp36Pr6L/408PfU8EgPZ195xVl34H4NBfOWAj9ILx91N+ukdt8xe
 gzOKmluBK2hZ5pp/QAOCOblrC0PuCzp+34cCY5RrsRgArXiIJTzQ/kCCyHD1L94t55fT
 l0ZgHJFKN6GKbJHH4SafFwxQhv8TX6Fqd7BXnxd8Bhw+L6XthX2Tx4AvPd9CB6hsr8R2
 SgtmbyrgHSQZLWnT7spslmf0SzRoJ8ms6WWa0HmRSA23WosE2kAqyXkfZiGB5r8Jv4p2
 HJHg==
X-Gm-Message-State: AOAM5331rDuLUujN1v9+MgUEC7hZE+lJ9Rk1BhUI27Dfyja8Hc11XqB4
 8cvV2BC4QrHzq8BCbJBmMFFAaxG8+oGSfg==
X-Google-Smtp-Source: ABdhPJw9RVeWI04drWuGRKlK3g1glvfiKLLGTFP1YEvv1DEYdk/f+xEagI4weur9y7za4/H8Xrbz8g==
X-Received: by 2002:a63:594a:: with SMTP id j10mr3115221pgm.402.1599080947577; 
 Wed, 02 Sep 2020 14:09:07 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:05 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 12/23] drm/virtio: implement blob resources: probe for the
 feature.
Date: Wed,  2 Sep 2020 14:08:36 -0700
Message-Id: <20200902210847.2689-13-gurchetansingh@chromium.org>
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

From: Gerd Hoffmann <kraxel@redhat.com>

Let's proble for VIRTIO_GPU_F_RESOURCE_BLOB.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 10 +++++++---
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index d5b0c543bd6d7..6b9b8376613f0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -49,6 +49,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 	virtio_add_bool(m, "edid", vgdev->has_edid);
 	virtio_add_bool(m, "indirect", vgdev->has_indirect);
 	virtio_add_bool(m, "resource uuid", vgdev->has_resource_assign_uuid);
+	virtio_add_bool(m, "blob resources", vgdev->has_resource_blob);
 	virtio_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_add_int(m, "scanouts", vgdev->num_scanouts);
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index b039f493bda99..3d04e428be140 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -166,6 +166,7 @@ static unsigned int features[] = {
 #endif
 	VIRTIO_GPU_F_EDID,
 	VIRTIO_GPU_F_RESOURCE_UUID,
+	VIRTIO_GPU_F_RESOURCE_BLOB,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f88e8902e1d61..f73e184f79e1a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -208,6 +208,7 @@ struct virtio_gpu_device {
 	bool has_edid;
 	bool has_indirect;
 	bool has_resource_assign_uuid;
+	bool has_resource_blob;
 
 	struct work_struct config_changed_work;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 06af537b0091d..6cc08f234ad5e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -152,10 +152,14 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
 		vgdev->has_resource_assign_uuid = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
+		vgdev->has_resource_blob = true;
+	}
 
-	DRM_INFO("features: %cvirgl %cedid\n",
-		 vgdev->has_virgl_3d ? '+' : '-',
-		 vgdev->has_edid     ? '+' : '-');
+	DRM_INFO("features: %cvirgl %cedid %cresource_blob\n",
+		 vgdev->has_virgl_3d    ? '+' : '-',
+		 vgdev->has_edid        ? '+' : '-',
+		 vgdev->has_resource_blob ? '+' : '-');
 
 	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
 	if (ret) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
