Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5853E26CFC5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253A26EB52;
	Thu, 17 Sep 2020 00:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ABD6EB4D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:49 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id w7so76268pfi.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ymOxxBlf3Bu02IZ3jPmEKr++nGZ0/geoYQ1uDOjJMKE=;
 b=XL0YgefNY0jrFnPaSasaC6pXGQT+mywpQoUnRYXEVwtbi41d5KTE+i7rAP3HnL3uFb
 QRWyYqJgiND9YjFVixusmS03r5pA3CLjtIY9IYEpraPnAOhbHuXV7Yll9o+KLAz5pfKY
 1y6TZ1dt7C+xRC78YAwrPhEKb0un+HRbBjl1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ymOxxBlf3Bu02IZ3jPmEKr++nGZ0/geoYQ1uDOjJMKE=;
 b=KCIjdm0+sm1YMgiu1Jo7BunF/mcc11XCZMStP6eT1C3IzPYAYo2p1+QP77g55cbjAh
 wz+rhoDpwaitfF0WckJPK0n/+B1zsAeqdzHsSsR4UWEMlJPwBtUwexBMbkVeFq1oqSIs
 mgGsgqeEMtm3oW6j1ztz5W6dnu034oBUTVgnDnMSf2aRJoPhPiTvSC4RjHK5rQf69xFM
 5UkCS7mvyG2X3MJV7A9dXEHkxulK2xOSd3zvRMwOG8dQWLKe1yiQwPGd0+BhwIEgpmZv
 JfYk0EegMv3bHoPUDK/l2saW7adasJanoE7VG6wzxu4qdYQd82dYwZ4iGaLf1b6SWEWF
 X+PA==
X-Gm-Message-State: AOAM5332GO5XQaHMPJRZUAHbUvt60tn76fOVpIwKqBt87zDsQB/+VOaM
 maxINT81GtFrIz938NAAMoX+BXQDROy8uw==
X-Google-Smtp-Source: ABdhPJy/ykIp8K7XzITPYvo9f/VHW6C+BndSnxj0igIVJfjSt36K9zbnyhewGQmlovJ0fSngeMX0RQ==
X-Received: by 2002:a62:4ed6:0:b029:142:2501:35ec with SMTP id
 c205-20020a624ed60000b0290142250135ecmr9044927pfb.76.1600301328687; 
 Wed, 16 Sep 2020 17:08:48 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:48 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/19] drm/virtio: implement blob resources: probe for the
 feature.
Date: Wed, 16 Sep 2020 17:08:27 -0700
Message-Id: <20200917000838.735-8-gurchetansingh@chromium.org>
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
index 272abe177ded6..b53478a6a3c08 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -208,6 +208,7 @@ struct virtio_gpu_device {
 	bool has_edid;
 	bool has_indirect;
 	bool has_resource_assign_uuid;
+	bool has_resource_blob;
 
 	struct work_struct config_changed_work;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index eed57a9313098..0678e56100dae 100644
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
