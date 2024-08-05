Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F90947B85
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 15:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C96910E1EA;
	Mon,  5 Aug 2024 13:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B1910E1DE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 13:06:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5EE9A218E4;
 Mon,  5 Aug 2024 13:06:24 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2671713AEB;
 Mon,  5 Aug 2024 13:06:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6BEhCFDOsGaiMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Aug 2024 13:06:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/5] drm/mgag200: Add VGA-BMC output
Date: Mon,  5 Aug 2024 15:05:57 +0200
Message-ID: <20240805130622.63458-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240805130622.63458-1-tzimmermann@suse.de>
References: <20240805130622.63458-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 5EE9A218E4
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Duplicate VGA output to VGA-BMC output and update all code for Matrox
server chips. The new output represents a VGA output that has a BMC
attached to it. No functional changes so far.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/Makefile          |  1 +
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  3 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 72 +++++++++++++++++++++++
 10 files changed, 83 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c

diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
index d1b25f9f6586..5a02203fad12 100644
--- a/drivers/gpu/drm/mgag200/Makefile
+++ b/drivers/gpu/drm/mgag200/Makefile
@@ -12,6 +12,7 @@ mgag200-y := \
 	mgag200_g200se.o \
 	mgag200_g200wb.o \
 	mgag200_mode.o \
+	mgag200_vga_bmc.o \
 	mgag200_vga.o
 
 obj-$(CONFIG_DRM_MGAG200) += mgag200.o
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 8df3c84d2405..1301d3066a49 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -437,6 +437,9 @@ void mgag200_enable_display(struct mga_device *mdev);
 void mgag200_init_registers(struct mga_device *mdev);
 int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_available);
 
+/* mgag200_vga_bmc.c */
+int mgag200_vga_bmc_output_init(struct mga_device *mdev);
+
 /* mgag200_vga.c */
 int mgag200_vga_output_init(struct mga_device *mdev);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 72bd8e3421c2..1824c0e59c03 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -215,7 +215,7 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	ret = mgag200_vga_output_init(mdev);
+	ret = mgag200_vga_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 1bbb0745b84a..9cb2a165e460 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -119,7 +119,7 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	ret = mgag200_vga_output_init(mdev);
+	ret = mgag200_vga_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index e65d59173939..e0f7816ad87a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -258,7 +258,7 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	ret = mgag200_vga_output_init(mdev);
+	ret = mgag200_vga_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index a4890b496050..a2c683f82127 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -259,7 +259,7 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	ret = mgag200_vga_output_init(mdev);
+	ret = mgag200_vga_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index fbaa97c7e0da..7a2806be2d2e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -128,7 +128,7 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	ret = mgag200_vga_output_init(mdev);
+	ret = mgag200_vga_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index fcb97e4253c4..b83f3f31ed0e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -390,7 +390,7 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	ret = mgag200_vga_output_init(mdev);
+	ret = mgag200_vga_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 33ef35c95acb..cb971ca5e306 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -262,7 +262,7 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	ret = mgag200_vga_output_init(mdev);
+	ret = mgag200_vga_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
new file mode 100644
index 000000000000..b6b90632b3c6
--- /dev/null
+++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+
+#include "mgag200_ddc.h"
+#include "mgag200_drv.h"
+
+static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
+	.destroy = drm_encoder_cleanup
+};
+
+static const struct drm_connector_helper_funcs mgag200_vga_connector_helper_funcs = {
+	.get_modes = drm_connector_helper_get_modes,
+	.detect_ctx = drm_connector_helper_detect_from_ddc
+};
+
+static const struct drm_connector_funcs mgag200_vga_connector_funcs = {
+	.reset                  = drm_atomic_helper_connector_reset,
+	.fill_modes             = drm_helper_probe_single_connector_modes,
+	.destroy                = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state
+};
+
+int mgag200_vga_bmc_output_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_crtc *crtc = &mdev->crtc;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
+	struct i2c_adapter *ddc;
+	int ret;
+
+	encoder = &mdev->output.vga.encoder;
+	ret = drm_encoder_init(dev, encoder, &mgag200_dac_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret) {
+		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
+		return ret;
+	}
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ddc = mgag200_ddc_create(mdev);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
+		drm_err(dev, "failed to add DDC bus: %d\n", ret);
+		return ret;
+	}
+
+	connector = &mdev->output.vga.connector;
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &mgag200_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA, ddc);
+	if (ret) {
+		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
+		return ret;
+	}
+	drm_connector_helper_add(connector, &mgag200_vga_connector_helper_funcs);
+
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
-- 
2.46.0

