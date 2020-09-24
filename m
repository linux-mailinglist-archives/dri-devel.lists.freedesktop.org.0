Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4033927651D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9B16EA24;
	Thu, 24 Sep 2020 00:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923DB6EA25
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:27 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id w25so1059646vsk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=slxxkPttXx89E/npUKwyp25sb5MdvAkiByWGPO08fKI=;
 b=MY+mWkva7bTHYQrWTTteasjMe0u924Xkmx8Vlc3bLaA13VfKU/29elxtRZP7BMOd8U
 H2H67XSeR5cIX2Onyz/oYwCqoHUoh0a1FzTFfn0YxtndYfW/34QJlNAni8HjVu581nNx
 myt+PMgGm0T64ZZ+38LO30ghhN/HMQcQN5q38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=slxxkPttXx89E/npUKwyp25sb5MdvAkiByWGPO08fKI=;
 b=fa0jkfPnY9VIaQKnpNToAVK0IxjemDGwV/LgVuMQSRkLTuTqcLJsZYJJJEeFX7xrep
 8gSIhvt6mVxrrE1cHexM7JmocsI2jV7J2htniohNAUuY9+fsPftyj01B+vTpdAUocV4g
 cu3HJfLrpOsINs1MgZfQ1/vq4O/0BdHJYDm9eaPXKvmyyFYYZPK/oPpJPLZyoonxDYHG
 EAvTCF+BODkcxCKT340ZwV4wnctx2X2CwasBwgvw3CcuQgibJu0PhTXTG6FVWX6Bd0rP
 ZyVtAhqC4x4m19/Uy4a1ABlVS1bFNZ6A5QAhM/F5zpVqbGzmrxJYgjXjJvv5eqjwKfBk
 74tg==
X-Gm-Message-State: AOAM532Ggk4HJnk6dLKq0wD2LOR4JABE4h/0oYtw2Ox1L2hQ6+NRqij1
 jRTJ4B77AyJyJGm7fIqqnrS1VudLAfi6AA==
X-Google-Smtp-Source: ABdhPJymFegcObgsReGivdM3z7IFyC2Q2kBForMu22YUtFFzLY1pDhXCXzpsno6XzkGjqKhcJmH6JQ==
X-Received: by 2002:a62:2985:0:b029:142:2501:34d6 with SMTP id
 p127-20020a6229850000b0290142250134d6mr2016126pfp.47.1600907545565; 
 Wed, 23 Sep 2020 17:32:25 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:24 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/19] drm/virtio: implement blob resources: probe for host
 visible region
Date: Wed, 23 Sep 2020 17:32:04 -0700
Message-Id: <20200924003214.662-9-gurchetansingh@chromium.org>
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

The availability of the host visible region means host 3D
allocations can be directly mapped in the guest.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Co-developed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  5 +++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 ++
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 20 ++++++++++++++++++--
 3 files changed, 25 insertions(+), 2 deletions(-)

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
index 0678e56100dae..e17d3f5a0b54e 100644
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
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
