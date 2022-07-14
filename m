Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4B1574E7F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 15:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC3D10ED9A;
	Thu, 14 Jul 2022 13:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EC210E73D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657803640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X16iBV7KhZ9Ln6lEGuQir3iZX0VSxdQjWbZR3Ippd7s=;
 b=U4HDFOc+5AQ25CW6I3V1+Ylia4s/d3YttR5obHCzCmGv8hRGGsf3gkanDzQM1yH3zAHO9X
 4rMrFaDcfjQ5fCTf7y0fz3Z19f2xduubmGJ3XUrrgJVcV/4oYPdarp+ciQtQMIJctCJIqV
 nY7HRfEIQTFRoTvOd7Wrz40erer1S4I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-wEsedtpTOWeFPWYlN0RqCQ-1; Thu, 14 Jul 2022 09:00:36 -0400
X-MC-Unique: wEsedtpTOWeFPWYlN0RqCQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 m10-20020a056402510a00b0043a93d807ffso1466774edd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 06:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X16iBV7KhZ9Ln6lEGuQir3iZX0VSxdQjWbZR3Ippd7s=;
 b=vu+eDJ0heMiH/Z9egNW2PKVHsVk7JAVCrkNaB0vXraII0WfEDaLTmotZEFLeGPbgVq
 8+Lp2CBJKawqsVureEWU5wmnO2ZqPLYHKI3XxRsRLlzAEi1UugggTT2Wn2QVdr51DpPn
 sNvnSKjo0C4/KwOFPo88S3MFQH063r698H7PGFqZTGIqTLDCH+m2m87VFg/P126P7gxe
 JCHpXln5jM6pz0XQW9ix30Y4wPhFruU/kX5av4v/Twyk7gMJwJZNZpfIrg6DCvyU01E/
 2RivEZgZrJRpvumfZta4FZgAOygr+h2uLSA/C3v/tNisKS5T+xbXnGAWZ4fwwj2R3WP+
 c20A==
X-Gm-Message-State: AJIora+Ldk/tSoGy8bPEyj85AkQHFWxt3jyf6VPHJDg13+FGEF4CsSQB
 hFiTrdvhOnCF21zqUf+LbL5LwZSqplAkM6GWCjfEDcP8FVcoZIHZTfYJC3s4xVblD4rUQqBkNs9
 X07ZkHwFezhCheHJUgsB3udsRpiub
X-Received: by 2002:a17:906:6a26:b0:72e:cee5:d1b0 with SMTP id
 qw38-20020a1709066a2600b0072ecee5d1b0mr5451196ejc.404.1657803635445; 
 Thu, 14 Jul 2022 06:00:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v85WghBi+OK8f1leK61CfSKKhJ1e/q/FFkhJ0V6008dxPsF5cUEPomwzP1oAuhcv+e0UGMJg==
X-Received: by 2002:a17:906:6a26:b0:72e:cee5:d1b0 with SMTP id
 qw38-20020a1709066a2600b0072ecee5d1b0mr5451176ejc.404.1657803635237; 
 Thu, 14 Jul 2022 06:00:35 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 zk9-20020a17090733c900b0072ecef772acsm694237ejb.2.2022.07.14.06.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:00:34 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kraxel@redhat.com
Subject: [PATCH 2/2] drm/virtio: kms: use drm managed resources
Date: Thu, 14 Jul 2022 15:00:28 +0200
Message-Id: <20220714130028.2127858-3-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714130028.2127858-1-dakr@redhat.com>
References: <20220714130028.2127858-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allocate driver structures with drm managed resource allocators in order
to cleanup/simplify the drm driver .release callback.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 3313b92db531..63ebe63ef409 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -28,6 +28,7 @@
 #include <linux/virtio_ring.h>
 
 #include <drm/drm_file.h>
+#include <drm/drm_managed.h>
 
 #include "virtgpu_drv.h"
 
@@ -66,10 +67,11 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 {
 	int i, ret;
 	bool invalid_capset_id = false;
+	struct drm_device *drm = vgdev->ddev;
 
-	vgdev->capsets = kcalloc(num_capsets,
-				 sizeof(struct virtio_gpu_drv_capset),
-				 GFP_KERNEL);
+	vgdev->capsets = drmm_kcalloc(drm, num_capsets,
+				      sizeof(struct virtio_gpu_drv_capset),
+				      GFP_KERNEL);
 	if (!vgdev->capsets) {
 		DRM_ERROR("failed to allocate cap sets\n");
 		return;
@@ -94,7 +96,7 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 
 		if (ret == 0 || invalid_capset_id) {
 			spin_lock(&vgdev->display_info_lock);
-			kfree(vgdev->capsets);
+			drmm_kfree(drm, vgdev->capsets);
 			vgdev->capsets = NULL;
 			spin_unlock(&vgdev->display_info_lock);
 			return;
@@ -126,7 +128,7 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (!virtio_has_feature(dev_to_virtio(dev->dev), VIRTIO_F_VERSION_1))
 		return -ENODEV;
 
-	vgdev = kzalloc(sizeof(struct virtio_gpu_device), GFP_KERNEL);
+	vgdev = drmm_kzalloc(dev, sizeof(struct virtio_gpu_device), GFP_KERNEL);
 	if (!vgdev)
 		return -ENOMEM;
 
@@ -257,7 +259,6 @@ int virtio_gpu_init(struct drm_device *dev)
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 err_vqs:
 	dev->dev_private = NULL;
-	kfree(vgdev);
 	return ret;
 }
 
@@ -296,9 +297,6 @@ void virtio_gpu_release(struct drm_device *dev)
 
 	if (vgdev->has_host_visible)
 		drm_mm_takedown(&vgdev->host_visible_mm);
-
-	kfree(vgdev->capsets);
-	kfree(vgdev);
 }
 
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
-- 
2.36.1

