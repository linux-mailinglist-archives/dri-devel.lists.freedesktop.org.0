Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A621095175B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 11:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6604310E440;
	Wed, 14 Aug 2024 09:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="avj3XkD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AF110E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 09:09:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEB98E0009;
 Wed, 14 Aug 2024 09:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723626540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMyLkRGQhKcP4c3c0598fLvU0CW/sowhcsEn8e+aUBU=;
 b=avj3XkD8sxmz7jvZL6kdKjwcnbF8+qp9sZSWKEMDv+ysGbKqNwKTPCBlHEPF+XzSsUL8PV
 5lbK3JzzLWi5RPLsBu44nX8uu0ClgTnWV3kCgrOYp3tN2t4lILIgXwJqwgc2Hw6VD5yNjs
 2l3mrtUrtx9SBvFPS+0CMrg4ISdirKN/qJvbGRhPO1WNIOs6IyVuENxdck3fB2Y/98Wt3i
 +SKwO5OH4SK/FsG3b/PadGK4uez+Ao9Me4Gf/xl9pvgsKNx3Hg0JnD4u37E+e/gQRlGeYB
 hMSkewZ6nc+A3dRuuQO4aqkRQFBHGd6XFQsdIwBWkKL3n0/j7KXv0vF3W/7dQg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 11:08:55 +0200
Subject: [PATCH RFC 2/6] drm/vkms: Extract vkms_writeback header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-split-headers-v1-2-51712f088f5d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3863;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=fnG8pGOeJLMxmn04io3JIQ0+cXQo2UouKDjQL6gXcyc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvHQoa//98A+yCJRJ7UobkdsmAqg5qclS2rDC1
 2Mgge5m9bKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrx0KAAKCRAgrS7GWxAs
 4vP9D/9UrEwRUGijYD8URsz+RGG7Cgs4rMPsVOaHktAmO0zrOQ7UCkfBk402eMztG8dCGCrZRtG
 wbuvGiWccThGXJQJSxFyx0GCTTKKGBGYBsz5UnZAscSZG/LWRpbOPAGeWppa5agFwvecB1C9oAz
 2PG0uq4ryPRXNAGNoChMfrys8rWcaMutjwwrGNXn8CYauvmEAa0UeVBOW2PeEGSiw0tlnOV0Yo1
 oN3DN/nlg6mx+Ej2nXQIZQJLKxPal9ax9JgGx38dxfyi9jCkD3zvKtpU7b/ELBw8+Qyi0NJSwlw
 OcIP/RQXFWr/JGlnaVTq1gwgU1FXeLc1/cGNXMSiSwCzqjFSMEzIWxPcADBzN8qH/K8uynQDwmV
 4lAT2Ef2i7C/RwgDKCeTwBNgjjVvgkveZPbqGnyS9SOqfQsvMmNcmIq28EO6TstUCEfLOycU/4S
 plVuSSryKUtPYkxdTK9KquI/a/JBlidLZUk/4Lb9MLE0EixozX1WJJ5kZhBfV7K73kP1s5Xz7FN
 4jU1FBd8b1QUpiKzXzi8x5PyXRuRgulrFt6l14dgHTaZ8xg8upb0za0er/KOwp/FbUQSqLysoWJ
 9BXpAbMhJ7iF+4NDYHrQw0Ub2FSsXcuzX31Q9NCVaS1bidqdZCWPUEpdkQuNxZ1c4ef5Vwt3May
 py+nO9+T83eRu4g==
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

The vkms writeback functions are defined in a different .c, so
make the same thing for the function declaration in the headers and create
vkms_writeback.h.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  1 +
 drivers/gpu/drm/vkms/vkms_drv.h       | 10 ----------
 drivers/gpu/drm/vkms/vkms_formats.c   |  2 +-
 drivers/gpu/drm/vkms/vkms_output.c    |  2 ++
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 ++
 drivers/gpu/drm/vkms/vkms_writeback.h | 20 ++++++++++++++++++++
 6 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index f0cae142ac22..825011f696ee 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -12,6 +12,7 @@
 #include <linux/minmax.h>
 
 #include "vkms_drv.h"
+#include "vkms_writeback.h"
 
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 0db443924a15..46daa2fab6e8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -46,13 +46,6 @@ struct vkms_frame_info {
 };
 
 
-struct vkms_writeback_job {
-	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
-	struct vkms_frame_info wb_frame_info;
-	pixel_write_line_t pixel_write;
-};
-
-
 struct vkms_plane_state;
 
 
@@ -225,7 +218,4 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
 
-/* Writeback */
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
-
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 5ab84801d8da..cbfa7943e948 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -11,7 +11,7 @@
 
 #include <kunit/visibility.h>
 
-#include "vkms_drv.h"
+#include "vkms_writeback.h"
 #include "vkms_formats.h"
 
 /**
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 36db2c8923cb..0c55682337a4 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -5,6 +5,8 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 
+#include "vkms_writeback.h"
+
 static const struct drm_connector_funcs vkms_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 7e0302c0830c..4a830a4c4d64 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -10,8 +10,10 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_framebuffer.h>
 
 #include "vkms_drv.h"
+#include "vkms_writeback.h"
 #include "vkms_formats.h"
 
 static const u32 vkms_wb_formats[] = {
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.h b/drivers/gpu/drm/vkms/vkms_writeback.h
new file mode 100644
index 000000000000..70f0c4c26c23
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_writeback.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_WRITEBACK_H
+#define _VKMS_WRITEBACK_H
+
+#include "vkms_drv.h"
+#include "vkms_formats.h"
+
+struct vkms_crtc;
+
+struct vkms_writeback_job {
+	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
+	struct vkms_frame_info wb_frame_info;
+	pixel_write_line_t pixel_write;
+};
+
+/* Writeback */
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
+
+#endif //_VKMS_WRITEBACK_H

-- 
2.44.2

