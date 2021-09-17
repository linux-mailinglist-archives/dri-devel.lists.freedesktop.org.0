Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1826440EE97
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F9F6EA8D;
	Fri, 17 Sep 2021 01:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2386EA7E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:08:49 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id g14so7645970pfm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7TDgLUtOHBlPYUwP/BRzfIzeeouh//eK65GeOs/m5Y=;
 b=AluX33+rQjBduXn/aJwWKcOQww/QkGfpC5riFf2LNJI48ARs6F3gTqoJo+N7B8ovlt
 /SfKlovgvA142iQ2532a9TYQNQq7+l3F3u7Q0Hwwzw2oqXar2eI43czHFBOz7dhYat/Y
 uqHKF7o9aC3ZkjJKd+4P7pV7wludxbEA0VTaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k7TDgLUtOHBlPYUwP/BRzfIzeeouh//eK65GeOs/m5Y=;
 b=65GabKjYYUxcfOTf+fFBeLpZ/CMr3nwBkDlrzM0KBHseiFv2fz/wq46yG3dH7Sb1mD
 z9X6H5HosvhLurF6GGzuRSankAfVD3d21O1fQqSX/pvCI+p4FHKtmetX/W/OOE/t/Ylz
 bZ82aryerI4FZwx/PG8ynfRvV7C5ZbsDqrbI5PD4eTn2meZA8iW9cI19r3oSeLao46SF
 UqG7n8fNym/eHo/a+TeS4WlaV3SCXAQHUZuI3K4BFrjyieLwIR3VQ5F26P74lHz28ja6
 wZw2xgJCGig3/X2YT/Gytgg0oueIP26icvZPgG6XJ19uKmuqqFicnjm5hOg8oa0OmU6w
 PhXw==
X-Gm-Message-State: AOAM532nqiBP7mo0uNpW4j+4+FGAqV8+CYORKJhfzh4nXN5lwr9aC1nP
 MaVdLqE1ZQyoLQUqjkbNGuB/PfjnRgyH8ABE
X-Google-Smtp-Source: ABdhPJxM6Jc4d6rYEvhqjdJJ6dOmLd/5RWoQVv97z40vF9UdtEsPeSSxyH3UFNBXaX7MsekPXDmykw==
X-Received: by 2002:a65:4008:: with SMTP id f8mr7367809pgp.310.1631840928855; 
 Thu, 16 Sep 2021 18:08:48 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:dc20:9a88:c41:f0dd])
 by smtp.gmail.com with ESMTPSA id v4sm4215812pff.11.2021.09.16.18.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:08:48 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v2 04/12] drm/virtio: implement context init: probe for feature
Date: Thu, 16 Sep 2021 18:08:34 -0700
Message-Id: <20210917010842.503-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210917010842.503-1-gurchetansingh@chromium.org>
References: <20210917010842.503-1-gurchetansingh@chromium.org>
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

From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

Let's probe for VIRTIO_GPU_F_CONTEXT_INIT.

Create a new DRM_INFO(..) line since the current one is getting
too long.

Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 8 +++++++-
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index c2b20e0ee030..b6954e2f75e6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -52,6 +52,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 			    vgdev->has_resource_assign_uuid);
 
 	virtio_gpu_add_bool(m, "blob resources", vgdev->has_resource_blob);
+	virtio_gpu_add_bool(m, "context init", vgdev->has_context_init);
 	virtio_gpu_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_gpu_add_int(m, "scanouts", vgdev->num_scanouts);
 	if (vgdev->host_visible_region.len) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ed85a7863256..9d963f1fda8f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -172,6 +172,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_EDID,
 	VIRTIO_GPU_F_RESOURCE_UUID,
 	VIRTIO_GPU_F_RESOURCE_BLOB,
+	VIRTIO_GPU_F_CONTEXT_INIT,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 3023e16be0d6..5e1958a522ff 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -236,6 +236,7 @@ struct virtio_gpu_device {
 	bool has_resource_assign_uuid;
 	bool has_resource_blob;
 	bool has_host_visible;
+	bool has_context_init;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 58a65121c200..21f410901694 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -191,13 +191,19 @@ int virtio_gpu_init(struct drm_device *dev)
 			    (unsigned long)vgdev->host_visible_region.addr,
 			    (unsigned long)vgdev->host_visible_region.len);
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_CONTEXT_INIT)) {
+		vgdev->has_context_init = true;
+	}
 
-	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible\n",
+	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible",
 		 vgdev->has_virgl_3d    ? '+' : '-',
 		 vgdev->has_edid        ? '+' : '-',
 		 vgdev->has_resource_blob ? '+' : '-',
 		 vgdev->has_host_visible ? '+' : '-');
 
+	DRM_INFO("features: %ccontext_init\n",
+		 vgdev->has_context_init ? '+' : '-');
+
 	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
 	if (ret) {
 		DRM_ERROR("failed to find virt queues\n");
-- 
2.33.0.464.g1972c5931b-goog

