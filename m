Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA342EE767
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 22:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAAD89471;
	Thu,  7 Jan 2021 21:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1E189471
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 21:07:36 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id b5so4692084pjl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 13:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OrN+lJPZAVaPbSPAKRAxToTohe9/d8hMRrN8IRfPx/I=;
 b=f6DcwaYF3ckzwD+fgyOdJbNAiOpOVKlGTKgZBu692ZrMOd0+ubKx1fFEGS2p+GN90H
 J4GnwP3ZFHGspMxVYv4bp0/e1LOM/e9XRuY7C7SuwhSCte0VGhLcxCFvMXkHTEzkgnh5
 WFQ2msTIu/IkCPSDUzilp65NbRVNWMr+s96/FGwmNpta+iBR/Qxn1scY2Ptrk9xeCe4q
 4cmYY8seyqGhB6j6mnxoVQ3dN0kf0J9r+iX1ifZANVVAYclIfXjxA3oBXlWsN5OjiItw
 w9383AQxVtVM6vTw9BY5BptiH5ctyFOBI1TOEM4tS51uhIRMgnSFrxhicvNLdjaVUIby
 4jtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OrN+lJPZAVaPbSPAKRAxToTohe9/d8hMRrN8IRfPx/I=;
 b=T+NnH1UBRgpdKW3wg89lHivTbe2/9JUZJxST/+nX2cDOknUMaAIgtTEP5SqED54Fe6
 lcV529nDIxE61vo9i/5dskeY/nUksMFYrOD01q812HoAcreX85GLnVnFZY8suL1/V+Kz
 tjN1FPgPQYm7zJcHEE+faKWWkHqXQcp1RmQxcVzJpIuizLdnQHH8Y8KOY/cNXlTNCbas
 jUDwHkFKnxTMUBZPEbUvNh2lULIA4zXkhthqF7qNzy7QOt2wmi2dXhJL2WrIG1geL2OK
 RS0p0Ve/rd3bKhCh6OY+3Mx0eBnpMVSCwVtCCBHemsLffPU8dtA68tjX4D3mC+IT7M7V
 1/bA==
X-Gm-Message-State: AOAM5309b3fmZ8Krdz+irt+lfxfX+gRoCiBmN3jdxb1h5ju/gHs+TiUP
 R9tytASvUcSpHLS5HFYFu0jNc2GRjF5yeA==
X-Google-Smtp-Source: ABdhPJwufKb/oR4Wr93Dn41WYDqT8qXnGw2TRB5I65bS5qzNNta4ieGIL6XGR2wBuwBckZocmMKZ6g==
X-Received: by 2002:a17:902:6b84:b029:dc:3419:b555 with SMTP id
 p4-20020a1709026b84b02900dc3419b555mr617087plk.77.1610053655771; 
 Thu, 07 Jan 2021 13:07:35 -0800 (PST)
Received: from olv-glaptop3.lan (c-76-103-101-107.hsd1.ca.comcast.net.
 [76.103.101.107])
 by smtp.gmail.com with ESMTPSA id 72sm6815285pfw.177.2021.01.07.13.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 13:07:35 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: make sure context is created in gem open
Date: Thu,  7 Jan 2021 13:07:26 -0800
Message-Id: <20210107210726.269584-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The context might still be missing when DRM_IOCTL_PRIME_FD_TO_HANDLE is
the first ioctl on the drm_file.

Fixes: 72b48ae800da ("drm/virtio: enqueue virtio_gpu_create_context after the first 3D ioctl")
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index c30c75ee83fc..8502400b2f9c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -39,9 +39,6 @@ static int virtio_gpu_gem_create(struct drm_file *file,
 	int ret;
 	u32 handle;
 
-	if (vgdev->has_virgl_3d)
-		virtio_gpu_create_context(dev, file);
-
 	ret = virtio_gpu_object_create(vgdev, params, &obj, NULL);
 	if (ret < 0)
 		return ret;
@@ -119,6 +116,11 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 	if (!vgdev->has_virgl_3d)
 		goto out_notify;
 
+	/* the context might still be missing when the first ioctl is
+	 * DRM_IOCTL_MODE_CREATE_DUMB or DRM_IOCTL_PRIME_FD_TO_HANDLE
+	 */
+	virtio_gpu_create_context(obj->dev, file);
+
 	objs = virtio_gpu_array_alloc(1);
 	if (!objs)
 		return -ENOMEM;
-- 
2.29.2.729.g45daf8777d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
