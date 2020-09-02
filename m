Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA125B5A7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9016E950;
	Wed,  2 Sep 2020 21:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A3B6E94B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:09 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id o68so395083pfg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=83HLxMAEwlQlkAQW/Hd4+D+W1HUznlttjj691evAops=;
 b=kZbE4gHsbTvE1cUS3GOCBsESGr/3rkm3DWePYHelUUZoVW8yELBaJwoi2XrkKYxcbL
 3bzlLXDdnTipP0ogxRLAjOSWOQsctpOznctKo9ZuUkB91lx4phHXYjrldweoL0BKFs/U
 o09GYyb2AVcx/hx/+kHkmrfNvfwjNmpc7K+AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=83HLxMAEwlQlkAQW/Hd4+D+W1HUznlttjj691evAops=;
 b=Hg5PVcuOKQp9H/TdhKIqJ6DB+plMMLQRRCg439gWh1sVVlFRZ1DRlnrrGFdx+O9Yn7
 YmeTtgkql2IFLIDTmiJtFUhkpzx9Yuiqr29ED7UuT5Jrd3UO9hetlelbA9fLhid47wui
 HKA72jFx3aX5s0VELj84jr1LtvEyxdiAmbmSLwXQYlCkPlptyoJip8o1ICIR8y7eeCws
 He48LW5R7OrxWgmIE5JA3b4A4kFoEHoKYXyYivnmCPQq4XQOwNH1wk7zzMu3ypbPabdv
 xK6TLhm7vYX+/m6DG96vtNLtSeYAu0eZrZ/doXShtv5FJwtUVp/QtCQE2OXo4hkqOt0X
 wKUw==
X-Gm-Message-State: AOAM531V3egiAvKTuBifCiwqQtBgm9pnjCZ1AqW+VRJlQlG6DatTCa8F
 jeb0xHSGUOfn5oOQEMfNtVj7Ap1ObnSvMg==
X-Google-Smtp-Source: ABdhPJw/iM/3DxwXLdtgemUSiU+fuXf5RjkGE3ZkuUiBO0bVZUlWFeDMoAw1kEYiq9921E2C6aW9zA==
X-Received: by 2002:a63:3e0c:: with SMTP id l12mr3401666pga.190.1599080948983; 
 Wed, 02 Sep 2020 14:09:08 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:08 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 13/23] drm/virtio: implement blob resources: probe for host
 visible region
Date: Wed,  2 Sep 2020 14:08:37 -0700
Message-Id: <20200902210847.2689-14-gurchetansingh@chromium.org>
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

The availability of the host visible region means host 3D
allocations can be directly mapped in the guest.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Co-developed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  5 +++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 ++
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 27 ++++++++++++++++++++++--
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 6b9b8376613f0..a2cdd267914ac 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -52,6 +52,11 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 	virtio_add_bool(m, "blob resources", vgdev->has_resource_blob);
 	virtio_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_add_int(m, "scanouts", vgdev->num_scanouts);
+	if (vgdev->host_visible_region.len) {
+		seq_printf(m, "%-16s : 0x%lx +0x%lx\n", "host visible region",
+			   (unsigned long)vgdev->host_visible_region.addr,
+			   (unsigned long)vgdev->host_visible_region.len);
+	}
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f73e184f79e1a..72abeaa3c4872 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -209,6 +209,8 @@ struct virtio_gpu_device {
 	bool has_indirect;
 	bool has_resource_assign_uuid;
 	bool has_resource_blob;
+	bool has_host_visible;
+	struct virtio_shm_region host_visible_region;
 
 	struct work_struct config_changed_work;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 6cc08f234ad5e..97b6e4fb945a7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -155,11 +155,27 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
 		vgdev->has_resource_blob = true;
 	}
+	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
+				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
+		if (!devm_request_mem_region(&vgdev->vdev->dev,
+					     vgdev->host_visible_region.addr,
+					     vgdev->host_visible_region.len,
+					     dev_name(&vgdev->vdev->dev))) {
+			DRM_ERROR("Could not reserve host visible region\n");
+			goto err_vqs;
+		}
+
+		DRM_INFO("Host memory window: 0x%lx +0x%lx\n",
+			 (unsigned long)vgdev->host_visible_region.addr,
+			 (unsigned long)vgdev->host_visible_region.len);
+		vgdev->has_host_visible = true;
+	}
 
-	DRM_INFO("features: %cvirgl %cedid %cresource_blob\n",
+	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible\n",
 		 vgdev->has_virgl_3d    ? '+' : '-',
 		 vgdev->has_edid        ? '+' : '-',
-		 vgdev->has_resource_blob ? '+' : '-');
+		 vgdev->has_resource_blob ? '+' : '-',
+		 vgdev->has_host_visible ? '+' : '-');
 
 	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
 	if (ret) {
@@ -243,6 +259,13 @@ void virtio_gpu_release(struct drm_device *dev)
 	virtio_gpu_free_vbufs(vgdev);
 	virtio_gpu_cleanup_cap_cache(vgdev);
 	kfree(vgdev->capsets);
+
+	if (vgdev->has_host_visible) {
+		devm_release_mem_region(&vgdev->vdev->dev,
+					vgdev->host_visible_region.addr,
+					vgdev->host_visible_region.len);
+	}
+
 	kfree(vgdev);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
