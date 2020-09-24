Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE1C276516
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF476EA20;
	Thu, 24 Sep 2020 00:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357E76EA1D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:25 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id mm21so668384pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ymOxxBlf3Bu02IZ3jPmEKr++nGZ0/geoYQ1uDOjJMKE=;
 b=YKP5W/CMYCXUNm6iEBohuNQ+rm8w147fBPkaVNabxX18vezauml6mliXr0CQhlB489
 bLr53SVQ1jbE2IJBoO3oVCsfFc31iNDzK+NbddSP0tiOzO2hk/W3znYBjS7yFd7PK3pc
 8EbB9bPzOJ2HiYJzWy2K+uZ3D1R5nZYJSHfDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ymOxxBlf3Bu02IZ3jPmEKr++nGZ0/geoYQ1uDOjJMKE=;
 b=EUR+VFqwyVvXxC3z4VrvD89b+sxl9WhFcOZcmoqAFKvtDxEk7TBSVlwYRGVepQJ84Q
 oKHeblE+EKIHPJZ25z1Gsn/RL0CdpgCupKUYUwjL2i9dQvQjIJk8ZSu+n2N5nQN+dT2q
 BuDeubbZbd1gZiGVWJWzsDjVyhGht3Qsgh6WuvuveX32mNL0T2FujJlH09H3/+K6wkOW
 2QriwbFRTqnOMMtWcqtBON3qN3rO97jWHaCnlAN79aFcq5nWgnWyxxXNCeRJuzgWcViL
 z0dHVTrk/0xq2BSv5PM/zlzkrzmcvopc0X7EhdfGWu+zM8Z7WN/ZNhmsAVGHLrheSRNm
 DQAw==
X-Gm-Message-State: AOAM533I/Z+UrDA3YSOWzV350LVIx2iklGEA3Z9p6CEtsLE0LcXX+bmq
 z2sIGyceK3K0HIpFVX/5zl6WfHIAl44MOg==
X-Google-Smtp-Source: ABdhPJwMtHYPePOD4GGSyHTvzKZG6z4Ulsl3i9JGb624UUYnGSH6Vh8ZvKQg1pwtAkISlb6EqAlJsw==
X-Received: by 2002:a17:902:fe0e:b029:d1:e5ec:28d6 with SMTP id
 g14-20020a170902fe0eb02900d1e5ec28d6mr2118229plj.66.1600907544507; 
 Wed, 23 Sep 2020 17:32:24 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:23 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 08/19] drm/virtio: implement blob resources: probe for the
 feature.
Date: Wed, 23 Sep 2020 17:32:03 -0700
Message-Id: <20200924003214.662-8-gurchetansingh@chromium.org>
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
