Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2B3F804F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CB46E4A2;
	Thu, 26 Aug 2021 02:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB986E48B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:05:03 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id e16so904025pfc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FEQ2xX3nEVIyVouBwfITYaHoPzIgl6QCYF1QBIFkzAA=;
 b=fM4SkZDVLJOEPVU1sDSpAneUV9NR+ma4Dmh7bhu4gFbCgT6BjQCcl8FsYkiovGyR2C
 7npjyl+ktKFJYJas389gPEWPgooJhSZpdw9PhYY5SBe7eGgc8nMvDhqB4WEAtLbnGzHc
 sNWoVDlbFolgbeYP+j1kfFv+M0NpQ3wnkyqIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FEQ2xX3nEVIyVouBwfITYaHoPzIgl6QCYF1QBIFkzAA=;
 b=Y9/cPryslqFAkJft/J1ZF6MAK8+MbZiSSmUeIN/pIIJYwfHzb1nBNeSH0FRe+Lf2L1
 pBfQU8ZX4ENTejZIcaU3dRknSV7Z5hxeNQmYlSNgriwG3Tqv58lc7FF7Ulzz+8SsktNY
 j3Acws9U/EQCo2CF2vZfEZeBSnwl5b/UlBn3MeTUcDwb+VExiBQfAGwXmR1Faz5XVw+0
 oJxKAKTn03pcvGWTiPfO8oXW+Vb9qtoGN/K0752IEgcEjDV39v8RnBIHfds9p39E46yD
 AEtxRqn6C2AohqBKZTQYj2WqTaxnZOZvY2xEyuJaEYVapAb9IuA4+yn090AN3CR62hjk
 c9HA==
X-Gm-Message-State: AOAM5333/I0Bcl11pT24YCSdB/BJ5Ni/i8d9LSL70BvRoVrKz+IEnBIi
 5oZmcifAgRKgHYYq+c4bqTq+RdiAbQKWCg==
X-Google-Smtp-Source: ABdhPJyaHiHEPzEPGrk5hvkbWzJVLSpzYfV1m2sB30gDA5Jn1vFQL9ym8UNCCj4dJ4/Pjp2Ivh/inQ==
X-Received: by 2002:a63:f4b:: with SMTP id 11mr1127995pgp.189.1629943502914;
 Wed, 25 Aug 2021 19:05:02 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:faed:1e29:6bf7:3354])
 by smtp.gmail.com with ESMTPSA id o10sm704987pjg.34.2021.08.25.19.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:05:02 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [RFC PATCH 04/12] drm/virtio: implement context init: probe for
 feature
Date: Wed, 25 Aug 2021 19:04:47 -0700
Message-Id: <20210826020455.1081-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210826020455.1081-1-gurchetansingh@chromium.org>
References: <20210826020455.1081-1-gurchetansingh@chromium.org>
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
2.33.0.259.gc128427fd7-goog

