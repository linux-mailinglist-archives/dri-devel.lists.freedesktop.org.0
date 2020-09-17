Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD5B26CFC6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378826EB53;
	Thu, 17 Sep 2020 00:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B8E6EB4A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:50 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id bd2so138422plb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8IgkXZ2JJUTWiGQqXQ8Vd9SNTv9jW0ssPoUQX6l/EeE=;
 b=fOQkqjAzPY0Xcrg2ndHoPZMkyMTrlsN0vttMtpPk0JxHGuST0Yz+w0MrDU/xXtURue
 7vqhYfsMazdRzMswzY1T2UEe1ZetzIfH/DU+Xe7MrlfiHHGnvE5gwgenxMjKetppN1aQ
 0nnRLzy6COUTACeIZK3qLRjor6IljWvVhxw7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8IgkXZ2JJUTWiGQqXQ8Vd9SNTv9jW0ssPoUQX6l/EeE=;
 b=CUNAs+IEEK1wLT+lAtwfuJazkqbvG5Ow5rwsQR2OgCy/i461muSlcQdkbuA9nLsMWu
 a3Kfh7OTIiaFoio+066MM25BBi+3PRcC/nqidEtD+i0SU5yZ6ObuKLIrErCcst904ktB
 5hWEv4nwtu4KApqirj+2GUmiC2OlJpPxrSiBVQd3FwW/2p7g8wds7JS8vqH/AMcw45O4
 95pbCGNZikXC2FzG3TALuj3cIQeD48tG1SJ5EG7tpOC8mtBLp8bs1JtsiY7ziE9zWtyn
 qJknTyQEfhuZKRGEyc536EX+csSvxTzDU99IGsViqBwJfH98KA9dupGqflm68Fge31j6
 Ly8w==
X-Gm-Message-State: AOAM531epToWpit0LPLw1Pac3dB52bam27nD+RJWLbYQB0vgxFEsw/vR
 6WsT7WG5FcGyvOUNW1r5kYIHJKJFD4BA7w==
X-Google-Smtp-Source: ABdhPJxw39tDB6kFczkqmInbqNpe1IwCFU1VX6We12ij8lNvfADKfberh7fUIrSukY/Yhmsz0SfI8Q==
X-Received: by 2002:a17:90a:6a0e:: with SMTP id
 t14mr5927800pjj.97.1600301329797; 
 Wed, 16 Sep 2020 17:08:49 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:49 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 09/19] drm/virtio: implement blob resources: probe for host
 visible region
Date: Wed, 16 Sep 2020 17:08:28 -0700
Message-Id: <20200917000838.735-9-gurchetansingh@chromium.org>
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
index b53478a6a3c08..391637f0b362d 100644
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
index 0678e56100dae..6239cc984958f 100644
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
@@ -247,6 +263,13 @@ void virtio_gpu_release(struct drm_device *dev)
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
