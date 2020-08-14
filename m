Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089F6244320
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5AD6EACD;
	Fri, 14 Aug 2020 02:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89586EAA6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:20 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id o13so3834136pgf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RDBQ17l/UDp4leM852x7NYU8BnFTzcc9cBLinYV/S00=;
 b=c1J37XAF1gH8JtAo2vqGOiKJNqcWAQQNEahoUKpU2KzLeJ93qzi4+MaoSsyZwNbxOt
 pTF2LpO+iXkWrQ++/pyIMUTzJ6oUoVHHE62JVapT8JeU8EnVEPFlOBdm5NkkYN4Us3dz
 PAElSpN3LtUWnVG312khJ9DdqOOW5kQGK6vg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RDBQ17l/UDp4leM852x7NYU8BnFTzcc9cBLinYV/S00=;
 b=rqVDTojfM7bX7Z4jeGHANUyPQlRSduPrNt6R013iBS6UkfX1mlyZoWVtMQd+MlrmOj
 ZRBEqLLjoN9erQtyvboK4AExPfrHiwUuq32Pyed0UYMCfFwjbba0ZEPSjRBat4W1o6US
 C1mJSxKT8KEyFbQxEOuWsZ/q6R3adblOvg3Fo298/V8FZ24zfb9OUgCmVePaQyrAAicT
 MHd37TN+GRnVjPPfLAuCcLqQvkNDTQEuqYf+Y6+5+WHET64NkPYtfLx77Dcqrr05zXD9
 /L/bnStbv3v9zV2ug3pjc4xy5RFiWFYuJecm5gCL8pDqlYHRQl67wxCxqZjPjyHYCVs+
 hMCA==
X-Gm-Message-State: AOAM5330dB7ZQIKfiPm4AeRrgGrLljj9eXEGRjlxW0157a8YFHQKvtIE
 PcsZnYQyFiXEeDunDgwgl7EcNwCx9u8xHQ==
X-Google-Smtp-Source: ABdhPJxyAsJ0pJ/aUVRoXWdyhIw0Rcp8RDKrXHLQhNIu3V7U5S72FPmtmE6uvPCiYluLKn420TRNNw==
X-Received: by 2002:a63:ff18:: with SMTP id k24mr382291pgi.109.1597372819956; 
 Thu, 13 Aug 2020 19:40:19 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:19 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 14/24] drm/virtio: implement blob resources: probe for host
 visible region
Date: Thu, 13 Aug 2020 19:39:50 -0700
Message-Id: <20200814024000.2485-15-gurchetansingh@chromium.org>
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
index e99d1c3c0a66..ea27cae28ab4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -51,6 +51,11 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
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
index a529727d6114..c8405449c4a3 100644
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
index 4167673b97d6..d3641eda7077 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -153,11 +153,27 @@ int virtio_gpu_init(struct drm_device *dev)
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
@@ -241,6 +257,13 @@ void virtio_gpu_release(struct drm_device *dev)
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
