Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D397EE12A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A058410E5D3;
	Thu, 16 Nov 2023 13:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92EA10E5D3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 13:13:37 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1f07:ca72:c5f4:4244])
 by albert.telenet-ops.be with bizsmtp
 id B1DW2B00N4CbZ7h061DWyA; Thu, 16 Nov 2023 14:13:36 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1r3cBI-009QEp-HK;
 Thu, 16 Nov 2023 14:13:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1r3c8e-007XJZ-UG;
 Thu, 16 Nov 2023 14:10:32 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-m68k@lists.linux-m68k.org
Subject: [PATCH] drm/virtio: Add suppport for non-native
Date: Thu, 16 Nov 2023 14:10:30 +0100
Message-Id: <282a31154172a78165912c832a09f6502515d139.1700140178.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When using virtgpu on a big-endian machine, e.g. powerpc QEMU:

    virtio-pci 0000:00:02.0: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-2)

or m68k/virt:

    virtio-mmio virtio-mmio.125: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-2)

and the graphical display fails to come up.

Before, the call to drm_mode_addfb() caused a translation from a fourcc
format (XR24) to a bpp/depth pair (32/24) to a potentially different fourcc
format (BX24 on big-endian), due to the quirk processing in
drm_driver_legacy_fb_format().  After, the original fourcc format (XR24)
is passed unmodified.

However, the virtgpu DRM driver supports only a single format for its
main plane: DRM_FORMAT_HOST_XRGB8888, which is XR24 on little-endian,
and BX24 on big-endian.  I.e. on big-endian, virtgpu does not support
XR24, which is the default DRM format, and must be supported by all
drivers.  Before, this was reported, but didn't lead to a failure:

    virtio-mmio virtio-mmio.125: [drm] bpp/depth value of 32/24 not supported
    virtio-mmio virtio-mmio.125: [drm] No compatible format found

As the core virtgpu driver and device support both XR24 and BX24 on both
little-endian and big-endian just fine, fix this extending the list of
supported formats for main plane and cursor plane to XR24/BX24 resp.
AR24/BA24.

Fixes: 6ae2ff23aa43a0c4 ("drm/client: Convert drm_client_buffer_addfb() to drm_mode_addfb2()")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Closes: https://lore.kernel.org/r/c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de
Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 11 +++++++++--
 drivers/gpu/drm/virtio/virtgpu_plane.c   |  6 ++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index ad924a8502e9025c..49c89000aec33f23 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -301,9 +301,16 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 	struct virtio_gpu_framebuffer *virtio_gpu_fb;
 	int ret;
 
-	if (mode_cmd->pixel_format != DRM_FORMAT_HOST_XRGB8888 &&
-	    mode_cmd->pixel_format != DRM_FORMAT_HOST_ARGB8888)
+	switch (mode_cmd->pixel_format) {
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_BGRA8888:
+		break;
+
+	default:
 		return ERR_PTR(-ENOENT);
+	}
 
 	/* lookup object associated with res handle */
 	obj = drm_gem_object_lookup(file_priv, mode_cmd->handles[0]);
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a2e045f3a0004a1b..a547d76b8fb0a77d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -30,11 +30,13 @@
 #include "virtgpu_drv.h"
 
 static const uint32_t virtio_gpu_formats[] = {
-	DRM_FORMAT_HOST_XRGB8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_BGRX8888,
 };
 
 static const uint32_t virtio_gpu_cursor_formats[] = {
-	DRM_FORMAT_HOST_ARGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGRA8888,
 };
 
 uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)
-- 
2.34.1

