Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226C2951760
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 11:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E3B10E445;
	Wed, 14 Aug 2024 09:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CF/GEgti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A9910E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 09:09:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2A03E000D;
 Wed, 14 Aug 2024 09:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723626543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6UosKDJXaP2EMV5da8/JOJnKc0RgpxXz1LZ5S03/EA=;
 b=CF/GEgtiHdVa3/6r7GN6aa7bbKHLPe4+goDsESjKBidiZyTECGlqXNGU064jmas59GcNLy
 Gt5DW7mgBqZflsb7G81/RaKFp+Nr8CzD3TY1DAcE41KEWj0yl16MX6aGB3Vhg9xEbL551B
 9erkJKs2ZhErTPNOgHvrGtiXwKiAz3R4eWYE//426mfDSGen9knsrFHJpGkg8Rm/Z840OQ
 bDS+3Sfnys8TlXOMZBhn9RcgHvM8xImvGuKANYNNcnQ/jDxzTBu3BrxYhEX5T2BpQrL05y
 fhHkmXbdGdMJkFGz+ROxkWq0gEdworMbqLr13G+7CDvLQi3SCuQqwwXutoPatA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 11:08:58 +0200
Subject: [PATCH RFC 5/6] drm/vkms: Extract vkms_crtc header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-split-headers-v1-5-51712f088f5d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8322;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=DotzqndqSi4xIk8sQLLF1Io23DHzhqRU7pNYcFDY3zc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvHQost2W+mHIl0xBpYr9QzgPU/59rN3GTLDdr
 hn8RZ8gIC+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrx0KAAKCRAgrS7GWxAs
 4lTJD/0S9G9rCxmrGy7rO5dztOVxJZmO0X4ztRVcpfB30RMl+1fQpjBuay5Vd5JAgEmLAChP5OC
 5BUCfkAkVSYU22LHjCJrlOY5uuQciW3dpdLBV1v4iZuhv9OnEa81RNavE4VAgplSrdVqi7F1MSi
 BvTFB/q/iNaLcj/PZJsvsa34NQYdU+wm+B8YJlbe3LItSXDtmQmV9oa3racFvhtDYvyKnyEx495
 goGHieqqG2Xqt+iWKFrx+75yfRi3OjbMj3e1KV/CGMlOBt2wZTl6HCBgmCy0tf+cIfVwIdH0Ub3
 jlWe5b+WKOln++lZ4Wo0bBhdFzlyEU+smFruhMEnuENNx2GSq0Dug6/2wNAMlGjkWZqgOefd7YC
 wr6HUZxSVHMSWpY9zRuvADUJIHy3YXnV/Z14lLn83iz/vPOh+IKXOAK5jb34xDKXitEbl5UrOR2
 hDPstzsBJvmAmvIag7ujMk0E68lp0RpoNn2a4i2aIfjHhXb1fBUbxXh8uH85SCPu7uLaSynSLOB
 rLQnLM+717gI58NyG/1yBMlgVDd+5xDfzLF1SDBPDEovbkAVLS+dQzLdmehHWJHNaKwFCDAuVqe
 dYmM3X1gmm7q6JAroH3eLa1pZ7HhwWJwOPBCUQOok5NQVHlASF6SPIAuuVk7kh67jifCf1mWlxl
 xPyTRJhyH0j5htQ==
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

The vkms crtc functions are defined in a different .c, so make the same
thing for the function declaration in the headers and create vkms_crtc.h.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  2 +-
 drivers/gpu/drm/vkms/vkms_crtc.c      |  2 +-
 drivers/gpu/drm/vkms/vkms_crtc.h      | 87 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c       |  1 +
 drivers/gpu/drm/vkms/vkms_drv.h       | 45 ------------------
 drivers/gpu/drm/vkms/vkms_output.c    |  1 +
 drivers/gpu/drm/vkms/vkms_plane.h     |  1 -
 drivers/gpu/drm/vkms/vkms_writeback.c |  1 +
 8 files changed, 92 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 825011f696ee..139d249454c4 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -11,7 +11,7 @@
 #include <drm/drm_vblank.h>
 #include <linux/minmax.h>
 
-#include "vkms_drv.h"
+#include "vkms_crtc.h"
 #include "vkms_writeback.h"
 
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 08e5db07aca6..cb6e49a86745 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -8,7 +8,7 @@
 #include <drm/drm_vblank.h>
 #include <drm/drm_print.h>
 
-#include "vkms_drv.h"
+#include "vkms_crtc.h"
 #include "vkms_plane.h"
 
 static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.h b/drivers/gpu/drm/vkms/vkms_crtc.h
new file mode 100644
index 000000000000..9f5ce21f3425
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_crtc.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_CRTC_H
+#define _VKMS_CRTC_H
+
+#include <drm/drm_writeback.h>
+#include <drm/drm_crtc.h>
+#include <linux/workqueue_types.h>
+
+#include "vkms_writeback.h"
+#include "vkms_plane.h"
+
+/**
+ * struct vkms_crtc_state - Driver specific CRTC state
+ *
+ * @base: base CRTC state
+ * @composer_work: work struct to compose and add CRC entries
+ *
+ * @num_active_planes: Number of active planes
+ * @active_planes: List containing all the active planes (counted by
+ *  @num_active_planes). They should be stored in z-order.
+ * @active_writeback: Current active writeback job
+ * @gamma_lut: Look up table for gamma used in this CRTC
+ * @crc_pending: Protected by @vkms_output.composer_lock.
+ * @wb_pending: Protected by @vkms_output.composer_lock.
+ * @frame_start: Protected by @vkms_output.composer_lock.
+ * @frame_end: Protected by @vkms_output.composer_lock.
+ */
+struct vkms_crtc_state {
+	struct drm_crtc_state base;
+	struct work_struct composer_work;
+
+	int num_active_planes;
+	struct vkms_plane_state **active_planes;
+	struct vkms_writeback_job *active_writeback;
+	struct vkms_color_lut gamma_lut;
+
+	bool crc_pending;
+	bool wb_pending;
+	u64 frame_start;
+	u64 frame_end;
+};
+
+/**
+ * struct vkms_crtc - crtc internal representation
+ *
+ * @crtc: Base crtc in drm
+ * @wb_connecter: DRM writeback connector used for this output
+ * @vblank_hrtimer:
+ * @period_ns:
+ * @event:
+ * @composer_workq: Ordered workqueue for composer_work
+ * @lock: Lock used to project concurrent acces to the composer
+ * @composer_enabled: Protected by @lock.
+ * @composer_lock: Lock used internally to protect @composer_state members
+ * @composer_state: Protected by @lock.
+ */
+struct vkms_crtc {
+	struct drm_crtc base;
+
+	struct drm_writeback_connector wb_connector;
+	struct hrtimer vblank_hrtimer;
+	ktime_t period_ns;
+	struct drm_pending_vblank_event *event;
+	struct workqueue_struct *composer_workq;
+	spinlock_t lock;
+
+	bool composer_enabled;
+	struct vkms_crtc_state *composer_state;
+
+	spinlock_t composer_lock;
+};
+
+#define to_vkms_crtc_state(target)\
+	container_of(target, struct vkms_crtc_state, base)
+
+/**
+ * vkms_crtc_init() - Initialize a crtc for vkms
+ * @dev: drm_device associated with the vkms buffer
+ * @crtc: uninitialized crtc device
+ * @primary: primary plane to attach to the crtc
+ * @cursor plane to attach to the crtc
+ */
+int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
+		   struct drm_plane *primary, struct drm_plane *cursor);
+
+#endif //_VKMS_CRTC_H
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5aeb43592960..5907877bdfa0 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -27,6 +27,7 @@
 #include <drm/drm_vblank.h>
 
 #include "vkms_drv.h"
+#include "vkms_crtc.h"
 
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index ea73f01fcc74..943ad55e0172 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -12,8 +12,6 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_writeback.h>
 
-#include "vkms_formats.h"
-
 #define XRES_MIN    10
 #define YRES_MIN    10
 
@@ -27,37 +25,6 @@
 
 #define VKMS_LUT_SIZE 256
 
-/**
- * struct vkms_crtc_state - Driver specific CRTC state
- *
- * @base: base CRTC state
- * @composer_work: work struct to compose and add CRC entries
- *
- * @num_active_planes: Number of active planes
- * @active_planes: List containing all the active planes (counted by
- *  @num_active_planes). They should be stored in z-order.
- * @active_writeback: Current active writeback job
- * @gamma_lut: Look up table for gamma used in this CRTC
- * @crc_pending: Protected by @vkms_output.composer_lock.
- * @wb_pending: Protected by @vkms_output.composer_lock.
- * @frame_start: Protected by @vkms_output.composer_lock.
- * @frame_end: Protected by @vkms_output.composer_lock.
- */
-struct vkms_crtc_state {
-	struct drm_crtc_state base;
-	struct work_struct composer_work;
-
-	int num_active_planes;
-	struct vkms_plane_state **active_planes;
-	struct vkms_writeback_job *active_writeback;
-	struct vkms_color_lut gamma_lut;
-
-	bool crc_pending;
-	bool wb_pending;
-	u64 frame_start;
-	u64 frame_end;
-};
-
 /**
  * struct vkms_output - Internal representation of all output components in vkms
  *
@@ -129,18 +96,6 @@ struct vkms_device {
 #define drm_device_to_vkms_device(target) \
 	container_of(target, struct vkms_device, drm)
 
-#define to_vkms_crtc_state(target)\
-	container_of(target, struct vkms_crtc_state, base)
-
-/**
- * vkms_crtc_init() - Initialize a crtc for vkms
- * @dev: drm_device associated with the vkms buffer
- * @crtc: uninitialized crtc device
- * @primary: primary plane to attach to the crtc
- * @cursor plane to attach to the crtc
- */
-int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor);
 /**
  * vkms_output_init() - Initialize all sub-components needed for a vkms device.
  *
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 09fcf242ecf7..20073a00b200 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -6,6 +6,7 @@
 
 #include "vkms_writeback.h"
 #include "vkms_plane.h"
+#include "vkms_crtc.h"
 
 static const struct drm_connector_funcs vkms_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
diff --git a/drivers/gpu/drm/vkms/vkms_plane.h b/drivers/gpu/drm/vkms/vkms_plane.h
index 68170a75e9c9..90554c9fe250 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.h
+++ b/drivers/gpu/drm/vkms/vkms_plane.h
@@ -8,7 +8,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <linux/iosys-map.h>
 
-#include "vkms_drv.h"
 #include "vkms_formats.h"
 
 struct vkms_plane {
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 740d9e2f3d71..48f3f7f2e2a4 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -13,6 +13,7 @@
 #include <drm/drm_framebuffer.h>
 
 #include "vkms_writeback.h"
+#include "vkms_crtc.h"
 #include "vkms_formats.h"
 
 static const u32 vkms_wb_formats[] = {

-- 
2.44.2

