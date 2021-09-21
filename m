Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8013413DED
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 01:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F406E8FB;
	Tue, 21 Sep 2021 23:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6456E8EA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:20:31 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id t20so694389pju.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7TDgLUtOHBlPYUwP/BRzfIzeeouh//eK65GeOs/m5Y=;
 b=d0RPgbvZixf2LM2PpkbiQBj7F2HRDGALWQourqb5Y2yMPE1Hn6nCp7+yHp3YMjsyUx
 E9mU+DgsiYDY1kk8+P/475Gg9k1hLtGo871MOHggynowj1VKGYjErd069G0ja0BvGH26
 Jnsqy0ZGYcHcZ5AY0XVUp6iHzAkntbFSZ6+J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k7TDgLUtOHBlPYUwP/BRzfIzeeouh//eK65GeOs/m5Y=;
 b=3bewz0l520zHVVMB92WcXMA+YJCkllfss5L2Oy9YDSO3cIM1n5q58HWBA5e/1LjqBe
 NfpzuNOrAJhVhFoivK/2DYjd6gCSYOHmfC+7+HXNftBJb18Yxe6MBqlAmw4DMEhTBURy
 /CNjqTuTbA6t9k5XjUyQC59OKNShOHTFpO6gh+JnnjdaL2k8Mq8rDHDN/4yTDbgzpjfb
 HAIVqhmXX8U+BbNNH3Q1bHxf0GlQ0WuVMW6EHDVMOltPUtkrxIEfsRm3r8QKSGAvWzua
 98IUtU291jQ76hQH5FlLFMtARZsgScPZCKbdeefrxyxdrS9/fLYnqbmrANbyKf1BS5cX
 fgHQ==
X-Gm-Message-State: AOAM533U/6D0Se7Fjk3SHWafAOS6HeOYJncK7rcyfJ4zq0Yfrj28iZcU
 25EHIw+tFnGzY6+UD1KU6sVmvWF8BPez5A==
X-Google-Smtp-Source: ABdhPJx0cV2v0MWsoxIaM2Xmr+mqHAGIWRBDUB+9AzbUnKEbezhjubY9n1BcuQmaDWKgLLT1RmNw1Q==
X-Received: by 2002:a17:90b:1b06:: with SMTP id
 nu6mr7844473pjb.15.1632266430691; 
 Tue, 21 Sep 2021 16:20:30 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a5ff:11c:6401:fce])
 by smtp.gmail.com with ESMTPSA id e2sm201906pfn.141.2021.09.21.16.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:20:30 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 04/12] drm/virtio: implement context init: probe for feature
Date: Tue, 21 Sep 2021 16:20:16 -0700
Message-Id: <20210921232024.817-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210921232024.817-1-gurchetansingh@chromium.org>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
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

