Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A424431B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4826EAC8;
	Fri, 14 Aug 2020 02:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C51E6EAA6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:19 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id 2so3712845pjx.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gxxE2id/NIo9mtCbJh48Jgx1z0/9nDMYUaIIddFxhEc=;
 b=Daq6Te6RpfeY39ocOp7xnhD/iIcQHb17LRQH/TvFx5zvD4jjY5MJHZ7vU5QBgM4AHA
 xbAIPlZkhYzKXyLPBMGa7doSVRw430PXj779Fw7KbRN1wW5nJCNfNPtchAZCLdGKMqI6
 MBhSzi6+ijA92H4TaqcY/5wZUo9SzFzfpgDmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gxxE2id/NIo9mtCbJh48Jgx1z0/9nDMYUaIIddFxhEc=;
 b=dpNgOdyIxzkOKJjFn4qAJFbHetYsSU49cFKlEu7g42YeQ/2UaKpMNxI/dS8rBVFszl
 XdpXPIc91mX9T02KtANQuyx1bEjNyDZ4hk5veBwWxlCAcEMYM1oX0c6ShzOJE4JeCoGV
 XWl/SqD5KWrBimFMncog2/nuE9nubpt1mTuW9+WjAn0SHX7BNggFJfZMq4WZ8qksIEVS
 jpEUhaUalXg4qnclJI6A4sLkWsqL2QTJoxHkiQR93agtE8nu/dHjvkV0a4FgzxGVSd0o
 MO8ZTucJS56kqAj0mpbVCAd9c4Pga6A85iWHFjFK+nNC0+HGgAvrgnLlBI6J127UTHLS
 NXVg==
X-Gm-Message-State: AOAM531ym3sE24QVpj8AZr3jNUnac1s9++ljxgB9nqzs3WdWfWXMPX0b
 DGm7oPb0Ir8n8yiMfuQOHq1oq70Rdz0n8Q==
X-Google-Smtp-Source: ABdhPJy4FpTgZDUF7HybNiuYs42i4h83Ao8t4L1cdL8bCaTk1K+/260G9mUadjoxSL+2iCCJS6JgCg==
X-Received: by 2002:a17:90a:9405:: with SMTP id r5mr553213pjo.74.1597372818599; 
 Thu, 13 Aug 2020 19:40:18 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:18 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 13/24] drm/virtio: implement blob resources: probe for the
 feature.
Date: Thu, 13 Aug 2020 19:39:49 -0700
Message-Id: <20200814024000.2485-14-gurchetansingh@chromium.org>
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

From: Gerd Hoffmann <kraxel@redhat.com>

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
index 3221520f61f0..e99d1c3c0a66 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -48,6 +48,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 	virtio_add_bool(m, "virgl", vgdev->has_virgl_3d);
 	virtio_add_bool(m, "edid", vgdev->has_edid);
 	virtio_add_bool(m, "indirect", vgdev->has_indirect);
+	virtio_add_bool(m, "blob resources", vgdev->has_resource_blob);
 	virtio_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_add_int(m, "scanouts", vgdev->num_scanouts);
 	return 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index b039f493bda9..3d04e428be14 100644
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
index c74c38123ff6..a529727d6114 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -208,6 +208,7 @@ struct virtio_gpu_device {
 	bool has_edid;
 	bool has_indirect;
 	bool has_resource_assign_uuid;
+	bool has_resource_blob;
 
 	struct work_struct config_changed_work;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index bf060c69850f..4167673b97d6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -150,10 +150,14 @@ int virtio_gpu_init(struct drm_device *dev)
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
