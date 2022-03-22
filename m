Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C41DD4E46A8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 20:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D3410E26C;
	Tue, 22 Mar 2022 19:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2F810E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 19:27:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 252DD1F391;
 Tue, 22 Mar 2022 19:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647977268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMNDeajgJRzpzP1gn4A/YbmQGp6MMOZZHoCoY0uGsDA=;
 b=rCAqok0lBCCsuTgbnQ741UobknjQu1F64E+I3sicb6fzT6jP4pMZKMmwWenF5cxBWmfyne
 TE7NiNJkTHAGHmy1bK/yV6tL7Nv8eVFJ/7FE7yZqCYZuQ7Xlwh9+iYcCBf+qrXQovyLiji
 id1PsKeI1BbRcow0lhxxnEWgKbAnsOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647977268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMNDeajgJRzpzP1gn4A/YbmQGp6MMOZZHoCoY0uGsDA=;
 b=fQUNI3EbHQyOAgkZaT1trGpPCY7gxJVXTwh2IKzwuM2p6a2xA/ey4ijnJPkxE5cYiHJ83Q
 aBNYAiQbLTDIUTCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB7F413419;
 Tue, 22 Mar 2022 19:27:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KFWKNDMjOmIZMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Mar 2022 19:27:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, lyude@redhat.com
Subject: [PATCH 8/8] drm/display: Move SCDC helpers into display-helper library
Date: Tue, 22 Mar 2022 20:27:43 +0100
Message-Id: <20220322192743.14414-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322192743.14414-1-tzimmermann@suse.de>
References: <20220322192743.14414-1-tzimmermann@suse.de>
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
 drivers/gpu/drm/display/Makefile              |  2 +-
 .../gpu/drm/{ => display}/drm_scdc_helper.c   |  3 +-
 drivers/gpu/drm/drm_edid.c                    |  1 -
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
 drivers/gpu/drm/tegra/sor.c                   |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  2 +-
 .../{drm_scdc_helper.h => display/drm_scdc.h} | 52 +-----------
 include/drm/display/drm_scdc_helper.h         | 79 +++++++++++++++++++
 13 files changed, 94 insertions(+), 63 deletions(-)
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
index dfe21583afa0..4a36847b4aaf 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -8,6 +8,6 @@ drm_display_helper-$(CONFIG_DRM_DP_HELPER) := drm_dp_helper.o drm_dp_dual_mode_h
 drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 drm_display_helper-$(CONFIG_DRM_HDCP_HELPER) += drm_hdcp_helper.o
-drm_display_helper-$(CONFIG_DRM_HDMI_HELPER) += drm_hdmi_helper.o
+drm_display_helper-$(CONFIG_DRM_HDMI_HELPER) += drm_hdmi_helper.o drm_scdc_helper.o
 
 obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
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
index 4d865ebcd623..cf15690d4a83 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -42,7 +42,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_print.h>
-#include <drm/drm_scdc_helper.h>
 
 #include "drm_crtc_internal.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index dc208df829f1..563c3f1c49a1 100644
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
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 86d0ac1d50c6..fb573cdda57c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -35,13 +35,13 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
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
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 2b1b2f76d1fc..5911d78bc801 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -18,11 +18,11 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_scdc_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8d760dd69060..07b7b6c32cdb 100644
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

