Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EFF95175D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 11:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE8C10E442;
	Wed, 14 Aug 2024 09:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VqzqakD1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A43810E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 09:09:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C44C0E000A;
 Wed, 14 Aug 2024 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723626541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ccj83HTETu9GyQ6a2/Qu3RNL9QxAiBPKNMjAtCQjRk=;
 b=VqzqakD1uHdS3CUrmhw6oU3mEoAnv2xV35zo4W7Zm6jGw3RmTAzNXjtIK/XtUM8IGcwLa1
 5voA9KWcbmOf0QBTQV2Mu2RH5lrLFDyKhOOXuITL6VVjERZf/FdWU2NKeOcNiec653EnUi
 5kG7/zDEgsuHSI9LpREbgQRKENTtBuAt4Uo2iR2digs+J+6clP5NlqLit9c5uCS7oeBi5O
 7WRpxYUMqYRWcQCwcgc7Nyf+8aPuTtro5rum2wAkq+GHVbzhxgokXsAAaTHxozwG21ehMU
 YPrnkXdVo0yohswSB42wHSoaQCbOI1FQVddNPi2WO/D67segrkjWV97+Bm3Cxw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 11:08:56 +0200
Subject: [PATCH RFC 3/6] drm/vkms: Extract vkms_plane header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-split-headers-v1-3-51712f088f5d@bootlin.com>
References: <20240814-google-split-headers-v1-0-51712f088f5d@bootlin.com>
In-Reply-To: <20240814-google-split-headers-v1-0-51712f088f5d@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8581;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=fyAeIkGSRQVinqmyGsIRq2K9J9tzWZ2mkZ6uyv0flas=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvHQoTaeK1jbPrrdym0zeLq+7iIN7/E21ILgBX
 MuacZOA5BqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrx0KAAKCRAgrS7GWxAs
 4gfuEACHCP2YvedAr1kUJQZjd5061MCbxP2YH+90Sz4pTSku+kpDShQFucV+mIzDD5CNJSW+PGM
 uQnlQSdtVj9v60Mjm1HU4SZwJXEMyYQ6gac63UMjfFEioXMfMjJLdH1U8/vvekoGp5FcTptYFjg
 BiNcNYmg2TN0Ia9/6GXDQr2ZxmCWPr8Qdqh0wJBdYE0vaOP+lCdroBSE8/mDwDY2qYPa1OhB2Jq
 3XJX+KxpkGRI2GzXFeyN6E1ZlcGm0rbpCCjFAXe8Sh8HwnGGYVV0pmWqYIV63FGlXQe6gHj7C5p
 VllQHq7u15XN08VK1V14+/v/RMChHPLlyUYNSrS5kBNfdUHwP5Clc+8gSGkfkdYDK3WI/aqjYWZ
 AF5zF03n/TYsc5HLvUxJdOzAyf87S2tKJ8qG2mYtkq1lesS7Z2pZXZWCuFGg075EMLZF/dNhrVX
 wWaBkeokEV2bKURs7nty3EXA1wbp+w9n91oeBj6aB38tH5tJuFKbGWvNVaqdn3YzcYkA6Fsw6Rn
 KVJ6XLAYz4FCNUZJxQHsl/YEFKa2hmP9PEdBFK57W5XjQRelIVkj1OklJW9as12GOAf4r5LqLqW
 gZuQujmWgOUbzTNOSQCPPM74IKoGLJs8sBv1f1nnY1eX7uotPNlBZxvzIb0GxV0/I20afEQ2bak
 lkXggAPWBx96sfA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to properly split vkms_output function, extract all
its function to its own header.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c      |  2 ++
 drivers/gpu/drm/vkms/vkms_drv.h       | 56 ------------------------------
 drivers/gpu/drm/vkms/vkms_formats.c   |  3 +-
 drivers/gpu/drm/vkms/vkms_output.c    |  2 +-
 drivers/gpu/drm/vkms/vkms_plane.c     |  3 ++
 drivers/gpu/drm/vkms/vkms_plane.h     | 65 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  1 -
 drivers/gpu/drm/vkms/vkms_writeback.h |  1 +
 8 files changed, 74 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 06e28305d660..6a4de8f7a678 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -6,8 +6,10 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_print.h>
 
 #include "vkms_drv.h"
+#include "vkms_plane.h"
 
 static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 46daa2fab6e8..ea73f01fcc74 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -27,48 +27,6 @@
 
 #define VKMS_LUT_SIZE 256
 
-/**
- * struct vkms_frame_info - Structure to store the state of a frame
- *
- * @fb: backing drm framebuffer
- * @src: source rectangle of this frame in the source framebuffer, stored in 16.16 fixed-point form
- * @dst: destination rectangle in the crtc buffer, stored in whole pixel units
- * @map: see drm_shadow_plane_state@data
- * @rotation: rotation applied to the source.
- *
- * @src and @dst should have the same size modulo the rotation.
- */
-struct vkms_frame_info {
-	struct drm_framebuffer *fb;
-	struct drm_rect src, dst;
-	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
-	unsigned int rotation;
-};
-
-
-struct vkms_plane_state;
-
-
-
-/**
- * struct vkms_plane_state - Driver specific plane state
- * @base: base plane state
- * @frame_info: data required for composing computation
- * @pixel_read_line: function to read a pixel line in this plane. The creator of a
- *		     struct vkms_plane_state must ensure that this pointer is valid
- * @conversion_matrix: matrix used for yuv formats to convert to rgb
- */
-struct vkms_plane_state {
-	struct drm_shadow_plane_state base;
-	struct vkms_frame_info *frame_info;
-	pixel_read_line_t pixel_read_line;
-	struct conversion_matrix conversion_matrix;
-};
-
-struct vkms_plane {
-	struct drm_plane base;
-};
-
 /**
  * struct vkms_crtc_state - Driver specific CRTC state
  *
@@ -174,9 +132,6 @@ struct vkms_device {
 #define to_vkms_crtc_state(target)\
 	container_of(target, struct vkms_crtc_state, base)
 
-#define to_vkms_plane_state(target)\
-	container_of(target, struct vkms_plane_state, base.base)
-
 /**
  * vkms_crtc_init() - Initialize a crtc for vkms
  * @dev: drm_device associated with the vkms buffer
@@ -196,17 +151,6 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 
 int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index);
 
-/**
- * vkms_plane_init() - Initialize a plane
- *
- * @vkmsdev: vkms device containing the plane
- * @type: type of plane to initialize
- * @possible_crtc_index: Crtc which can be attached to the plane. The caller must ensure that
- * possible_crtc_index is positive and less or equals to 31.
- */
-struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type, int possible_crtc_index);
-
 /* CRC Support */
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
 					size_t *count);
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index cbfa7943e948..4e8494d4ade4 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -11,8 +11,9 @@
 
 #include <kunit/visibility.h>
 
-#include "vkms_writeback.h"
+#include "vkms_plane.h"
 #include "vkms_formats.h"
+#include "vkms_writeback.h"
 
 /**
  * packed_pixels_offset() - Get the offset of the block containing the pixel at coordinates x/y
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 0c55682337a4..09fcf242ecf7 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0+
 
-#include "vkms_drv.h"
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 
 #include "vkms_writeback.h"
+#include "vkms_plane.h"
 
 static const struct drm_connector_funcs vkms_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 9d85464ee0e9..de2c83e1b02c 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -8,9 +8,12 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 
 #include "vkms_drv.h"
 #include "vkms_formats.h"
+#include "vkms_plane.h"
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB8888,
diff --git a/drivers/gpu/drm/vkms/vkms_plane.h b/drivers/gpu/drm/vkms/vkms_plane.h
new file mode 100644
index 000000000000..161b44da0240
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_plane.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_PLANE_H
+#define _VKMS_PLANE_H
+
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <linux/iosys-map.h>
+
+#include "vkms_drv.h"
+#include "vkms_formats.h"
+
+struct vkms_plane {
+	struct drm_plane base;
+};
+
+/**
+ * struct vkms_plane_state - Driver specific plane state
+ * @base: base plane state
+ * @frame_info: data required for composing computation
+ * @pixel_read_line: function to read a pixel line in this plane. The creator of a vkms_plane_state
+ * must ensure that this pointer is valid
+ * @conversion_matrix: matrix used for yuv formats to convert to rgb
+ */
+struct vkms_plane_state {
+	struct drm_shadow_plane_state base;
+	struct vkms_frame_info *frame_info;
+	pixel_read_line_t pixel_read_line;
+	struct conversion_matrix conversion_matrix;
+};
+
+/**
+ * struct vkms_frame_info - structure to store the state of a frame
+ *
+ * @fb: backing drm framebuffer
+ * @src: source rectangle of this frame in the source framebuffer, stored in 16.16 fixed-point form
+ * @dst: destination rectangle in the crtc buffer, stored in whole pixel units
+ * @map: see drm_shadow_plane_state@data
+ * @rotation: rotation applied to the source.
+ *
+ * @src and @dst should have the same size modulo the rotation.
+ */
+struct vkms_frame_info {
+	struct drm_framebuffer *fb;
+	struct drm_rect src, dst;
+	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
+	unsigned int rotation;
+};
+
+/**
+ * vkms_plane_init() - Initialize a plane
+ *
+ * @vkmsdev: vkms device containing the plane
+ * @type: type of plane to initialize
+ * @possible_crtc_index: Crtc which can be attached to the plane. The caller must ensure that
+ * possible_crtc_index is positive and less or equals to 31.
+ */
+struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
+				   enum drm_plane_type type, int possible_crtc_index);
+
+#define to_vkms_plane_state(target)\
+	container_of(target, struct vkms_plane_state, base.base)
+
+#endif //_VKMS_PLANE_H
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 4a830a4c4d64..740d9e2f3d71 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -12,7 +12,6 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_framebuffer.h>
 
-#include "vkms_drv.h"
 #include "vkms_writeback.h"
 #include "vkms_formats.h"
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.h b/drivers/gpu/drm/vkms/vkms_writeback.h
index 70f0c4c26c23..44dff15faff6 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.h
+++ b/drivers/gpu/drm/vkms/vkms_writeback.h
@@ -5,6 +5,7 @@
 
 #include "vkms_drv.h"
 #include "vkms_formats.h"
+#include "vkms_plane.h"
 
 struct vkms_crtc;
 

-- 
2.44.2

