Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35A57B808
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 16:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC928113EB9;
	Wed, 20 Jul 2022 14:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F37113CC7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658325753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X16iBV7KhZ9Ln6lEGuQir3iZX0VSxdQjWbZR3Ippd7s=;
 b=O0uQyRE0kUQJVnw87K/BD1/r9XCn/B9ExsLWjTGp84+jltmIdci5Js4H/rOcxST/CwK1g5
 ebpA+rGo21z2Omvhn7EsSkutZlUXSQ+bh+0aOyvWyDJVdrk+iwexZGoyM/IJ7bgMGf7Og/
 kQGtzxxJSYDGN3Twge5FebSZlSBXWZc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-XiBiyIZFOoWtHeoJ2Pm64g-1; Wed, 20 Jul 2022 10:02:24 -0400
X-MC-Unique: XiBiyIZFOoWtHeoJ2Pm64g-1
Received: by mail-ej1-f72.google.com with SMTP id
 ji2-20020a170907980200b0072b5b6d60c2so4150023ejc.22
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 07:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X16iBV7KhZ9Ln6lEGuQir3iZX0VSxdQjWbZR3Ippd7s=;
 b=rdiP19Jd90IJ8kXpqrRDe73VdY7OBuOEWBz+QjW31mK1AjU599gvrDdvkpmxXbBLYz
 M0wqeAmm03w+0TutRreI2n+VgH9NssssMLhk/R+6OrsqCQ9yqlLesubfaXHNZpM3PUiT
 H4DhMZ1BCFxiBeZcJ6rTJXgekaOmxJSEBTa50t3+nKYEb2oFsJKgyP7w/P2m0cQSRqxL
 Mt/Rf05Ii3Qxz0jrfTbG2mUmuJLzf6W7DEGIefRgA5Wg31rZq0A0k5Ld0GpCpZJH35GD
 YkSDJ436sGRVZyORk/rOcOFupjNAVpjCk1b5QB4ihki9Fc8PDxGnGfhW/0h0jwybUV83
 oeSQ==
X-Gm-Message-State: AJIora863GyTURfdxlK6nnWzj+Tat1lvNIR8RkGa22cQNJFS8bzXyy2C
 2sY6U/2/LTogz1EtMHaK2eAE0xwXRSOcVF/IFWkRDzMWIFXv03yqbLjacC3G82C+FaWdhKI8+eD
 lbEa/1ES3hbXhdee0gqUjI6jUVyZT
X-Received: by 2002:a17:906:1315:b0:72c:5348:a153 with SMTP id
 w21-20020a170906131500b0072c5348a153mr34052686ejb.446.1658325742151; 
 Wed, 20 Jul 2022 07:02:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTF7B8ym8e4HRk24BL/G1Q9N7qi8twp5++akqwci39QfFH+fylqNPAfnonNrtNAQKhrRQdUQ==
X-Received: by 2002:a17:906:1315:b0:72c:5348:a153 with SMTP id
 w21-20020a170906131500b0072c5348a153mr34052675ejb.446.1658325741955; 
 Wed, 20 Jul 2022 07:02:21 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170906560d00b006fee98045cdsm8053040ejq.10.2022.07.20.07.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 07:02:21 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kraxel@redhat.com
Subject: [PATCH RESEND 2/2] drm/virtio: kms: use drm managed resources
Date: Wed, 20 Jul 2022 16:02:14 +0200
Message-Id: <20220720140214.199492-3-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720140214.199492-1-dakr@redhat.com>
References: <20220720140214.199492-1-dakr@redhat.com>
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

