Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED5260B8C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0216E155;
	Tue,  8 Sep 2020 07:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786036E150
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 07:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599548850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kffflXJQA9mHzXutJDI5yKO9Fa0soJ0Z8mgh5sqbbw0=;
 b=fwyLT1s5VIeWphNW2c0z1zfH8HN2Zhz4VlwzsBFRwa4XEmEO7GEq+TdEBgJnYN3ONSfJlJ
 Sd2QrnPVX72NyJwMhpLfCv3Ow0FiFhWe12XWrOMg5bQssb4YmLsYelCDsPVGDWnuX7gmQr
 ZcZiULXogBhRzPDEhYZhd10DK2n1tGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-L9QCSGZ3O6mgMlJv14p_Jw-1; Tue, 08 Sep 2020 03:07:28 -0400
X-MC-Unique: L9QCSGZ3O6mgMlJv14p_Jw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 795751007461;
 Tue,  8 Sep 2020 07:07:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 693785C1BB;
 Tue,  8 Sep 2020 07:07:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9C75D9C87; Tue,  8 Sep 2020 09:07:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/virtio: use drmm_mode_config_init
Date: Tue,  8 Sep 2020 09:07:21 +0200
Message-Id: <20200908070723.6394-2-kraxel@redhat.com>
In-Reply-To: <20200908070723.6394-1-kraxel@redhat.com>
References: <20200908070723.6394-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c | 11 +++++++----
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  6 +++++-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index a52b7a39f286..55c34b4fc3e9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -352,7 +352,7 @@ virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object_array *objs);
 
 /* virtgpu_display.c */
-void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
+int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
 
 /* virtgpu_plane.c */
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index effea07abe62..f84b7e61311b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -325,11 +325,14 @@ static const struct drm_mode_config_funcs virtio_gpu_mode_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
+int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 {
-	int i;
+	int i, ret;
+
+	ret = drmm_mode_config_init(vgdev->ddev);
+	if (ret)
+		return ret;
 
-	drm_mode_config_init(vgdev->ddev);
 	vgdev->ddev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 	vgdev->ddev->mode_config.funcs = &virtio_gpu_mode_funcs;
 
@@ -343,6 +346,7 @@ void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 		vgdev_output_init(vgdev, i);
 
 	drm_mode_config_reset(vgdev->ddev);
+	return 0;
 }
 
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
@@ -351,5 +355,4 @@ void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
 
 	for (i = 0 ; i < vgdev->num_scanouts; ++i)
 		kfree(vgdev->outputs[i].edid);
-	drm_mode_config_cleanup(vgdev->ddev);
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 75d0dc2f6d28..6ea74a99d8ad 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -184,7 +184,11 @@ int virtio_gpu_init(struct drm_device *dev)
 			num_capsets, &num_capsets);
 	DRM_INFO("number of cap sets: %d\n", num_capsets);
 
-	virtio_gpu_modeset_init(vgdev);
+	ret = virtio_gpu_modeset_init(vgdev);
+	if (ret) {
+		DRM_ERROR("modeset init failed\n");
+		goto err_scanouts;
+	}
 
 	virtio_device_ready(vgdev->vdev);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
