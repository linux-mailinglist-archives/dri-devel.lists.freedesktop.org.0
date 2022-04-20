Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625AF5086B2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 13:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFC510F1D5;
	Wed, 20 Apr 2022 11:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D7F10ECA6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 11:09:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BB9E11F755;
 Wed, 20 Apr 2022 11:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650452944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fp1AlT+prxPFgF3CANRB9mwtI3bG5ivD05L/By/hG8w=;
 b=dFlaF3xiz9Yhop5LAqemw4I548OcYcmxHYm/b6BQClgi0n74eKgL9akiyaG+vrqKxuhEz6
 DMGlPy1O8ms8jdZsYS0+JD6BrrM5SWY7wSZdP2Abm4jFP6Ri7EOlAsT6DH+CrULIODnBoI
 ZWETiAvdE8n34JQenT1O6yv7NVlvws4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650452944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fp1AlT+prxPFgF3CANRB9mwtI3bG5ivD05L/By/hG8w=;
 b=lMdInMcKanZtFhyRcFPzQK3o9wygoa5bBZHr/EwbYmm8a7N92Gj+h3wehSiWc5YbAuTSWD
 /fFQVIzmPXEAmdAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A3D313AE0;
 Wed, 20 Apr 2022 11:09:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eJHyHNDpX2LaPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Apr 2022 11:09:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, lyude@redhat.com,
 javierm@redhat.com
Subject: [PATCH v2 8/8] drm/display: Move SCDC helpers into display-helper
 library
Date: Wed, 20 Apr 2022 13:09:00 +0200
Message-Id: <20220420110900.8707-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420110900.8707-1-tzimmermann@suse.de>
References: <20220420110900.8707-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SCDC is the Status and Control Data Channel for HDMI. Move the SCDC
helpers into display/ and split the header into files for core and
helpers. Update all affected drivers. No functional changes.

To avoid the proliferation of Kconfig options, SCDC is part of DRM's
support for HDMI. If necessary, a new option could make SCDC an
independent feature.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-kms-helpers.rst         |  6 +-
 drivers/gpu/drm/Makefile                      |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  2 +-
 drivers/gpu/drm/display/Makefile              |  3 +-
 .../gpu/drm/{ => display}/drm_scdc_helper.c   |  3 +-
 drivers/gpu/drm/drm_edid.c                    |  1 -
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  2 +-
 drivers/gpu/drm/nouveau/Kconfig               |  1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
 drivers/gpu/drm/tegra/Kconfig                 |  1 +
 drivers/gpu/drm/tegra/sor.c                   |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  2 +-
 .../{drm_scdc_helper.h => display/drm_scdc.h} | 52 +-----------
 include/drm/display/drm_scdc_helper.h         | 79 +++++++++++++++++++
 15 files changed, 97 insertions(+), 63 deletions(-)
 rename drivers/gpu/drm/{ => display}/drm_scdc_helper.c (99%)
 rename include/drm/{drm_scdc_helper.h => display/drm_scdc.h} (65%)
 create mode 100644 include/drm/display/drm_scdc_helper.h

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index cfda5a092a48..2d473bc64c9f 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -356,13 +356,13 @@ EDID Helper Functions Reference
 SCDC Helper Functions Reference
 ===============================
 
-.. kernel-doc:: drivers/gpu/drm/drm_scdc_helper.c
+.. kernel-doc:: drivers/gpu/drm/display/drm_scdc_helper.c
    :doc: scdc helpers
 
-.. kernel-doc:: include/drm/drm_scdc_helper.h
+.. kernel-doc:: include/drm/display/drm_scdc_helper.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_scdc_helper.c
+.. kernel-doc:: drivers/gpu/drm/display/drm_scdc_helper.c
    :export:
 
 HDMI Infoframes Helper Reference
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 746a3a4953f3..15fe3163f822 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -63,7 +63,7 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
 		drm_plane_helper.o drm_atomic_helper.o \
 		drm_kms_helper_common.o \
 		drm_simple_kms_helper.o drm_modeset_helper.o \
-		drm_scdc_helper.o drm_gem_atomic_helper.o \
+		drm_gem_atomic_helper.o \
 		drm_gem_framebuffer_helper.o \
 		drm_atomic_state_helper.o drm_damage_helper.o \
 		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a06a2d51e77f..268d1f47d58c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -26,13 +26,13 @@
 
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_scdc_helper.h>
 
 #include "dw-hdmi-audio.h"
 #include "dw-hdmi-cec.h"
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index db644e7a550d..52cdda1180d9 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -8,7 +8,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += drm_dp_dual_mode_helper.o
 						      drm_dp_mst_topology.o \
 						      drm_dsc_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
-drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += drm_hdmi_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += drm_hdmi_helper.o \
+							drm_scdc_helper.o
 drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 
diff --git a/drivers/gpu/drm/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
similarity index 99%
rename from drivers/gpu/drm/drm_scdc_helper.c
rename to drivers/gpu/drm/display/drm_scdc_helper.c
index 48a382464d54..81881e81ceae 100644
--- a/drivers/gpu/drm/drm_scdc_helper.c
+++ b/drivers/gpu/drm/display/drm_scdc_helper.c
@@ -21,11 +21,12 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
 
+#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_print.h>
-#include <drm/drm_scdc_helper.h>
 
 /**
  * DOC: scdc helpers
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8d5f0cbbf0b4..7a8482b75071 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -42,7 +42,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_print.h>
-#include <drm/drm_scdc_helper.h>
 
 #include "drm_crtc_internal.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 027cc4cc38d9..dd02afaac43f 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -27,8 +27,8 @@
 
 #include <linux/string_helpers.h>
 
+#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_privacy_screen_consumer.h>
-#include <drm/drm_scdc_helper.h>
 
 #include "i915_drv.h"
 #include "intel_audio.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index ce47ae5bab20..1ae09431f53a 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -34,10 +34,10 @@
 
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_scdc_helper.h>
 #include <drm/intel_lpe_audio.h>
 
 #include "i915_debugfs.h"
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 8ebe142c173c..34760164c271 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -5,6 +5,7 @@ config DRM_NOUVEAU
 	select IOMMU_API
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_TTM
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 45db61ac2bfe..4347f0b61797 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -34,13 +34,13 @@
 #include <linux/iopoll.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_scdc_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <nvif/push507c.h>
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 93c935902330..c36323f1c7e6 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -6,6 +6,7 @@ config DRM_TEGRA
 	depends on DRM
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_DP_AUX_BUS
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 47b6c8e190cc..8af632740673 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -17,11 +17,11 @@
 #include <soc/tegra/pmc.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_scdc_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a6243fd12e89..4553fb466e42 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -32,10 +32,10 @@
  */
 
 #include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/drm_scdc_helper.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/i2c.h>
diff --git a/include/drm/drm_scdc_helper.h b/include/drm/display/drm_scdc.h
similarity index 65%
rename from include/drm/drm_scdc_helper.h
rename to include/drm/display/drm_scdc.h
index 6a483533aae4..3d58f37e8ed8 100644
--- a/include/drm/drm_scdc_helper.h
+++ b/include/drm/display/drm_scdc.h
@@ -21,11 +21,8 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-#ifndef DRM_SCDC_HELPER_H
-#define DRM_SCDC_HELPER_H
-
-#include <linux/i2c.h>
-#include <linux/types.h>
+#ifndef DRM_SCDC_H
+#define DRM_SCDC_H
 
 #define SCDC_SINK_VERSION 0x01
 
@@ -88,49 +85,4 @@
 #define SCDC_MANUFACTURER_SPECIFIC 0xde
 #define SCDC_MANUFACTURER_SPECIFIC_SIZE 34
 
-ssize_t drm_scdc_read(struct i2c_adapter *adapter, u8 offset, void *buffer,
-		      size_t size);
-ssize_t drm_scdc_write(struct i2c_adapter *adapter, u8 offset,
-		       const void *buffer, size_t size);
-
-/**
- * drm_scdc_readb - read a single byte from SCDC
- * @adapter: I2C adapter
- * @offset: offset of register to read
- * @value: return location for the register value
- *
- * Reads a single byte from SCDC. This is a convenience wrapper around the
- * drm_scdc_read() function.
- *
- * Returns:
- * 0 on success or a negative error code on failure.
- */
-static inline int drm_scdc_readb(struct i2c_adapter *adapter, u8 offset,
-				 u8 *value)
-{
-	return drm_scdc_read(adapter, offset, value, sizeof(*value));
-}
-
-/**
- * drm_scdc_writeb - write a single byte to SCDC
- * @adapter: I2C adapter
- * @offset: offset of register to read
- * @value: return location for the register value
- *
- * Writes a single byte to SCDC. This is a convenience wrapper around the
- * drm_scdc_write() function.
- *
- * Returns:
- * 0 on success or a negative error code on failure.
- */
-static inline int drm_scdc_writeb(struct i2c_adapter *adapter, u8 offset,
-				  u8 value)
-{
-	return drm_scdc_write(adapter, offset, &value, sizeof(value));
-}
-
-bool drm_scdc_get_scrambling_status(struct i2c_adapter *adapter);
-
-bool drm_scdc_set_scrambling(struct i2c_adapter *adapter, bool enable);
-bool drm_scdc_set_high_tmds_clock_ratio(struct i2c_adapter *adapter, bool set);
 #endif
diff --git a/include/drm/display/drm_scdc_helper.h b/include/drm/display/drm_scdc_helper.h
new file mode 100644
index 000000000000..ded01fd948b4
--- /dev/null
+++ b/include/drm/display/drm_scdc_helper.h
@@ -0,0 +1,79 @@
+/*
+ * Copyright (c) 2015 NVIDIA Corporation. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sub license,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef DRM_SCDC_HELPER_H
+#define DRM_SCDC_HELPER_H
+
+#include <linux/types.h>
+
+#include <drm/display/drm_scdc.h>
+
+struct i2c_adapter;
+
+ssize_t drm_scdc_read(struct i2c_adapter *adapter, u8 offset, void *buffer,
+		      size_t size);
+ssize_t drm_scdc_write(struct i2c_adapter *adapter, u8 offset,
+		       const void *buffer, size_t size);
+
+/**
+ * drm_scdc_readb - read a single byte from SCDC
+ * @adapter: I2C adapter
+ * @offset: offset of register to read
+ * @value: return location for the register value
+ *
+ * Reads a single byte from SCDC. This is a convenience wrapper around the
+ * drm_scdc_read() function.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+static inline int drm_scdc_readb(struct i2c_adapter *adapter, u8 offset,
+				 u8 *value)
+{
+	return drm_scdc_read(adapter, offset, value, sizeof(*value));
+}
+
+/**
+ * drm_scdc_writeb - write a single byte to SCDC
+ * @adapter: I2C adapter
+ * @offset: offset of register to read
+ * @value: return location for the register value
+ *
+ * Writes a single byte to SCDC. This is a convenience wrapper around the
+ * drm_scdc_write() function.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+static inline int drm_scdc_writeb(struct i2c_adapter *adapter, u8 offset,
+				  u8 value)
+{
+	return drm_scdc_write(adapter, offset, &value, sizeof(value));
+}
+
+bool drm_scdc_get_scrambling_status(struct i2c_adapter *adapter);
+
+bool drm_scdc_set_scrambling(struct i2c_adapter *adapter, bool enable);
+bool drm_scdc_set_high_tmds_clock_ratio(struct i2c_adapter *adapter, bool set);
+
+#endif
-- 
2.35.1

