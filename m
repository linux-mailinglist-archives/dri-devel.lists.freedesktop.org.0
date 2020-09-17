Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3090B26E853
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 00:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E299898BE;
	Thu, 17 Sep 2020 22:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2888893AB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 22:25:55 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id o20so2114553pfp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 15:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=slxxkPttXx89E/npUKwyp25sb5MdvAkiByWGPO08fKI=;
 b=lKBjWSanVuYWpsnBh3Amnt5RIHcOjSgdKK4ZNTWPDrvQIPSEJ2+3/zg7/5d7H2RM9q
 sLKHV7ifCsPqjGk7/whZbWC9fZHp+QdRwUf4+QXKU1F6pHByt94c4a2ekHwobrzjc2N/
 qmUktULDaF96fzOet8YWE92bl2XXsnYN73maY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=slxxkPttXx89E/npUKwyp25sb5MdvAkiByWGPO08fKI=;
 b=WmyuVYwwq6/FB7ZYR3LdjGtyr9c1hWno8FezMuNHoB9T+Y5LAxRG3LwQpO9hWap0Ss
 Ee2rZc6yJpWHPveO5JAX+vwDQrT6aRbqQbhI35xbNyeg623WcxwtRrs5x7e8uSVdytEq
 3tMihURizwjnLozvYmBzztNK3jZkPa5WcRuud28UfZWxnPEZX6DnTI83OEkG+zMK0e86
 KJgQQ99j/wXSUdAwp0yTn4agj022B+hJhp83I61HdYbBk7Z/EqQcI5zUD71PfonQhLEd
 iLec6uCBq+c9xvgGNzPW5R4QvrIXmt4RCVTbiy+az0cDjsh8Ok17Py9KDmE4r43+Bnc5
 bpGQ==
X-Gm-Message-State: AOAM531BtRO6DgHDF9YEb9OJmrzbgIXVKdE07FUdDtS1+SuGDweaZ7Pu
 D9SDqv7bGxsPdFyYZ8/e3ZpSALapru0jOA==
X-Google-Smtp-Source: ABdhPJyRUhUdbS80FWqayCfLmIz3z7Oqc5hpj4smtH0+KnokCJ6aZ2kNg0iu6yugrquc9iiiI1kmew==
X-Received: by 2002:a65:5cc5:: with SMTP id b5mr24138058pgt.417.1600381555251; 
 Thu, 17 Sep 2020 15:25:55 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id i9sm640020pfq.53.2020.09.17.15.25.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 15:25:54 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/19] drm/virtio: implement blob resources: probe for host
 visible region
Date: Thu, 17 Sep 2020 15:25:52 -0700
Message-Id: <20200917222552.713-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917094024.3d5savf3pshlst7z@sirius.home.kraxel.org>
References: <20200917094024.3d5savf3pshlst7z@sirius.home.kraxel.org>
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
