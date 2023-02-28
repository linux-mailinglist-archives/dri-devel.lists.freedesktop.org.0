Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DBD6A5572
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 10:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E1710E4B5;
	Tue, 28 Feb 2023 09:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5365810E4B5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677575972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QdbwjW6mh2D31Q//X6nqJgpNGXAc9BEbg23UZQeD1ZY=;
 b=MlXxH81ctTppINt6420HQO/l8SfMvDR6f5Yv6Tapfy4UDs12HM88tp//Iqr+76QucmeRaJ
 m0XFI2TvEIHJNE/fTU2GjljvNR9Cvj3wNVnUVs/F3dVayFW2ZSca++zq5fvBQuSUO2mdXN
 RaIa8g56+0Pk9R/4L8sBMn1J2cDLGE4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-74-401-6UX2Mqa7jwkIGOb-oA-1; Tue, 28 Feb 2023 04:19:30 -0500
X-MC-Unique: 401-6UX2Mqa7jwkIGOb-oA-1
Received: by mail-wr1-f70.google.com with SMTP id
 m15-20020adfa3cf000000b002be0eb97f4fso1364997wrb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 01:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677575969;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QdbwjW6mh2D31Q//X6nqJgpNGXAc9BEbg23UZQeD1ZY=;
 b=YYXlU9GHznialeYQ0QdcvLaDev+4amZTR+oO820GhLLJOp2gjF/l9GJEL91PzMBrMt
 kdh6tNk0i8AdxdsZGlnFWMAVgazX/bc+4WM8vhY2ul4cWTNbwQTkYBl2Mv7ylFafAsos
 LMvrBnMVKLWua3h8nHY6TFPjux9xr8T2m2RX5y2zgjYABBqzbdppN9GQ3Huyp6TY8JYZ
 OWs6O8aEGbos7o42lL8PziWVJW3eXsa1WgSMJjB6pqzRqimmsWg/EYgfD+zR9oHLmenu
 jbAgo3HtpTzELXFcibQbjfAZoYeN3vXWwGdpUho0ovzW9BhmjyhZG0WbX4pxr6ywRCzB
 w0sQ==
X-Gm-Message-State: AO0yUKWT5cQyJg9LOaOuxLnZ+Whhvd8Eff0/I+m8d3CWxvq37R2ugG7+
 9udEzX1+k6bBS09Wh7G3RdrqtU8/lJIbrHM4Xe51DXF2b8ZuJuOE/AtSxLmyiYi+ktltB2t0M4/
 cb34YUVGDP+JOs6SfNkTcXXariijy
X-Received: by 2002:adf:d84f:0:b0:2c7:1e16:57cf with SMTP id
 k15-20020adfd84f000000b002c71e1657cfmr1362632wrl.67.1677575969445; 
 Tue, 28 Feb 2023 01:19:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/dz651a4PoXIYeSOC9JT6wZQx3Rn5ZUvdKYAe7L6UD30v+qnszt0MT84Gs5qjY714aHC6kxw==
X-Received: by 2002:adf:d84f:0:b0:2c7:1e16:57cf with SMTP id
 k15-20020adfd84f000000b002c71e1657cfmr1362608wrl.67.1677575969096; 
 Tue, 28 Feb 2023 01:19:29 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i20-20020a5d5234000000b002c5493a17efsm9394627wra.25.2023.02.28.01.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 01:19:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/virtio: Add option to disable KMS support
In-Reply-To: <20230228062809.ccyzgnvizh6jidn4@sirius.home.kraxel.org>
References: <20230224180225.2477641-1-robdclark@gmail.com>
 <20230227063821.dg2gbjjwcekbxyzw@sirius.home.kraxel.org>
 <CAF6AEGsv1G7CPSkCPe3iHGB9JEO4iy+bTbkFLoitmx64U78RJw@mail.gmail.com>
 <20230228062809.ccyzgnvizh6jidn4@sirius.home.kraxel.org>
Date: Tue, 28 Feb 2023 10:19:27 +0100
Message-ID: <87a60yywo0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

Hello Gerd,

> On Mon, Feb 27, 2023 at 07:40:11AM -0800, Rob Clark wrote:
>> On Sun, Feb 26, 2023 at 10:38 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>> >
>> > On Fri, Feb 24, 2023 at 10:02:24AM -0800, Rob Clark wrote:
>> > > From: Rob Clark <robdclark@chromium.org>
>> > >
>> > > Add a build option to disable modesetting support.  This is useful in
>> > > cases where the guest only needs to use the GPU in a headless mode, or
>> > > (such as in the CrOS usage) window surfaces are proxied to a host
>> > > compositor.
>> >
>> > Why make that a compile time option?  There is a config option for the
>> > number of scanouts (aka virtual displays) a device has.  Just set that
>> > to zero (and fix the driver to not consider that configuration an
>> > error).
>> 
>> The goal is to not advertise DRIVER_MODESET (and DRIVER_ATOMIC).. I
>> guess that could be done based on whether there are any scanouts, but
>> it would mean making the drm_driver struct non-const.
>
> Apparently there is a drm_device->driver_features override,
> (amdgpu uses that).  The driver could simply drop the DRIVER_MODESET and
> DRIVER_ATOMIC bits in case no scanout is present instead of throwing an
> error.
>
>> And I think it is legitimate to allow the guest to make this choice,
>> regardless of what the host decides to expose, since it is about the
>> ioctl surface area that the guest kernel exposes to guest userspace.
>
> I think it is a bad idea to make that a compile time option, I'd suggest
> a runtime switch instead, for example a module parameter to ask the
> driver to ignore any scanouts.
>

I don't think there's a need for a new module parameter, there's already
the virtio-gpu 'modeset' module parameter to enable/disable modsetting
and the global 'nomodeset' kernel cmdline parameter to do it for all DRM
drivers.

Currently, many drivers just fail to probe when 'nomodeset' is present,
but others only disable modsetting but keep the rendering part. In fact,
most DRM only drivers just ignore the 'nomodeset' parameter.

We could make virtio-gpu driver to only disable KMS with these params,
something like the following (untested) patch:

From 9cddee7f696f37c34d80d6160e87827f3d7a0237 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Tue, 28 Feb 2023 10:09:11 +0100
Subject: [PATCH] drm/virtio: Only disable KMS with nomodeset

The virtio-gpu driver currently fails to probe if either the "nomodeset"
kernel cmdline parameter is used or the module "modeset" parameter used.

But there may be cases where the rendering part of the driver is needed
and only the mode setting part needs to be disabled. So let's change the
logic to only disable the KMS part but still keep the DRM side of it.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 16 +++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.c     | 23 ++++++++++++++--------
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 25 +-----------------------
 3 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 9ea7611a9e0f..e176e5e8c1a0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -335,6 +335,22 @@ static const struct drm_mode_config_funcs virtio_gpu_mode_funcs = {
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 {
 	int i, ret;
+	u32 num_scanouts;
+
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
+		vgdev->has_edid = true;
+	}
+
+	/* get display info */
+	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
+			num_scanouts, &num_scanouts);
+	vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
+				    VIRTIO_GPU_MAX_SCANOUTS);
+	if (!vgdev->num_scanouts) {
+		DRM_ERROR("num_scanouts is zero\n");
+		return -EINVAL;
+	}
+	DRM_INFO("number of scanouts: %d\n", num_scanouts);
 
 	ret = drmm_mode_config_init(vgdev->ddev);
 	if (ret)
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ae97b98750b6..979b5b177f49 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -40,7 +40,7 @@
 
 #include "virtgpu_drv.h"
 
-static const struct drm_driver driver;
+static struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
@@ -69,13 +69,12 @@ static int virtio_gpu_pci_quirk(struct drm_device *dev)
 static int virtio_gpu_probe(struct virtio_device *vdev)
 {
 	struct drm_device *dev;
+	struct virtio_gpu_device *vgdev;
 	int ret;
 
-	if (drm_firmware_drivers_only() && virtio_gpu_modeset == -1)
-		return -EINVAL;
-
-	if (virtio_gpu_modeset == 0)
-		return -EINVAL;
+	if ((drm_firmware_drivers_only() && virtio_gpu_modeset == -1) ||
+	    (virtio_gpu_modeset == 0))
+		driver.driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
 
 	/*
 	 * The virtio-gpu device is a virtual device that doesn't have DMA
@@ -98,11 +97,19 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 	if (ret)
 		goto err_free;
 
+	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
+		vgdev = dev->dev_private;
+		ret = virtio_gpu_modeset_init(vgdev);
+		if (ret)
+			goto err_deinit;
+	}
+
 	ret = drm_dev_register(dev, 0);
 	if (ret)
 		goto err_deinit;
 
-	drm_fbdev_generic_setup(vdev->priv, 32);
+	if (drm_core_check_feature(dev, DRIVER_MODESET))
+		drm_fbdev_generic_setup(vdev->priv, 32);
 	return 0;
 
 err_deinit:
@@ -171,7 +178,7 @@ MODULE_AUTHOR("Alon Levy");
 
 DEFINE_DRM_GEM_FOPS(virtio_gpu_driver_fops);
 
-static const struct drm_driver driver = {
+static struct drm_driver driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
 	.open = virtio_gpu_driver_open,
 	.postclose = virtio_gpu_driver_postclose,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 27b7f14dae89..2f5f2aac6b71 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -122,7 +122,7 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	struct virtio_gpu_device *vgdev;
 	/* this will expand later */
 	struct virtqueue *vqs[2];
-	u32 num_scanouts, num_capsets;
+	u32 num_capsets;
 	int ret = 0;
 
 	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
@@ -161,9 +161,6 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_VIRGL))
 		vgdev->has_virgl_3d = true;
 #endif
-	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
-		vgdev->has_edid = true;
-	}
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
 		vgdev->has_indirect = true;
 	}
@@ -218,28 +215,10 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		goto err_vbufs;
 	}
 
-	/* get display info */
-	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
-			num_scanouts, &num_scanouts);
-	vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
-				    VIRTIO_GPU_MAX_SCANOUTS);
-	if (!vgdev->num_scanouts) {
-		DRM_ERROR("num_scanouts is zero\n");
-		ret = -EINVAL;
-		goto err_scanouts;
-	}
-	DRM_INFO("number of scanouts: %d\n", num_scanouts);
-
 	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
 			num_capsets, &num_capsets);
 	DRM_INFO("number of cap sets: %d\n", num_capsets);
 
-	ret = virtio_gpu_modeset_init(vgdev);
-	if (ret) {
-		DRM_ERROR("modeset init failed\n");
-		goto err_scanouts;
-	}
-
 	virtio_device_ready(vgdev->vdev);
 
 	if (num_capsets)
@@ -252,8 +231,6 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 			   5 * HZ);
 	return 0;
 
-err_scanouts:
-	virtio_gpu_free_vbufs(vgdev);
 err_vbufs:
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 err_vqs:
-- 
2.39.2

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

