Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D83356B5B5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5668C1134E3;
	Fri,  8 Jul 2022 09:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B317F10FC2A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:39:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F0A021D26;
 Fri,  8 Jul 2022 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657273173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fiy4O1b+6Ed8JZSZleS20j+vZen9Nq6YHc24cyDN+6c=;
 b=JVLVssdLF7MFh7Sk9pzfZ94H0V/8ZGuOkQfZ1QWtKQksteZ/Vcv7WxpKBwBKNswVrKHQ0g
 2+6PVNrHHWsA1RuxMbdJCCK0yvM90l0F5/W8lpHZAc2UxRI0RDLLR6sG5aJNlLGdPjTxD4
 lEUyYCEb04GJM2UD+uib5/toA4fbd8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657273173;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fiy4O1b+6Ed8JZSZleS20j+vZen9Nq6YHc24cyDN+6c=;
 b=IHngaBcfVTUAtR6YlZijgQp3ZRYXZPR0s2qWi8wd4svYM/6mqLPxL8lirsb/+v/ZkngPmU
 ygZNt61EQFZQUcBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EB57713B24;
 Fri,  8 Jul 2022 09:39:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IHKeOFT7x2J5TwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Jul 2022 09:39:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH 12/14] drm/mgag200: Move mode-config to model-specific code
Date: Fri,  8 Jul 2022 11:39:27 +0200
Message-Id: <20220708093929.4446-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708093929.4446-1-tzimmermann@suse.de>
References: <20220708093929.4446-1-tzimmermann@suse.de>
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

Move the mode-config code into model-specific code and call the
plane/CRTC helpers as needed. This will help with providing per-
model implementations of individual helpers.

Duplication of the pipeline init function is accepted. Some macros
simplify this for shared helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  78 ++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200.c    | 111 ++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 111 ++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 111 ++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 111 ++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 111 ++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 111 ++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 111 ++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 111 ++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 186 +++-------------------
 10 files changed, 977 insertions(+), 175 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 8a7204e3ff96..69bdd61e9d82 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -125,6 +125,8 @@
 #define MGA_MISC_OUT 0x1fc2
 #define MGA_MISC_IN 0x1fcc
 
+#define MGAG200_LUT_SIZE 256
+
 #define MGAG200_MAX_FB_HEIGHT 4096
 #define MGAG200_MAX_FB_WIDTH 4096
 
@@ -336,10 +338,82 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						 enum mga_type type);
 
-				/* mgag200_mode.c */
+/*
+ * mgag200_mode.c
+ */
+
+struct drm_crtc;
+struct drm_crtc_state;
+struct drm_display_mode;
+struct drm_plane;
+struct drm_atomic_state;
+
+extern const uint32_t mgag200_primary_plane_formats[];
+extern const size_t   mgag200_primary_plane_formats_size;
+extern const uint64_t mgag200_primary_plane_fmtmods[];
+
+int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_state *state);
+void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_state *old_state);
+void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
+						 struct drm_atomic_state *old_state);
+#define MGAG200_PRIMARY_PLANE_HELPER_FUNCS \
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS, \
+	.atomic_check = mgag200_primary_plane_helper_atomic_check, \
+	.atomic_update = mgag200_primary_plane_helper_atomic_update, \
+	.atomic_disable = mgag200_primary_plane_helper_atomic_disable
+
+#define MGAG200_PRIMARY_PLANE_FUNCS \
+	.update_plane = drm_atomic_helper_update_plane, \
+	.disable_plane = drm_atomic_helper_disable_plane, \
+	.destroy = drm_plane_cleanup, \
+	DRM_GEM_SHADOW_PLANE_FUNCS
+
+enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc *crtc,
+						    const struct drm_display_mode *mode);
+int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state);
+void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
+void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
+void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
+
+#define MGAG200_CRTC_HELPER_FUNCS \
+	.mode_valid = mgag200_crtc_helper_mode_valid, \
+	.atomic_check = mgag200_crtc_helper_atomic_check, \
+	.atomic_flush = mgag200_crtc_helper_atomic_flush, \
+	.atomic_enable = mgag200_crtc_helper_atomic_enable, \
+	.atomic_disable = mgag200_crtc_helper_atomic_disable
+
+void mgag200_crtc_reset(struct drm_crtc *crtc);
+struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc);
+void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state);
+
+#define MGAG200_CRTC_FUNCS \
+	.reset = mgag200_crtc_reset, \
+	.destroy = drm_crtc_cleanup, \
+	.set_config = drm_atomic_helper_set_config, \
+	.page_flip = drm_atomic_helper_page_flip, \
+	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
+	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state
+
+#define MGAG200_DAC_ENCODER_FUNCS \
+	.destroy = drm_encoder_cleanup
+
+int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector);
+
+#define MGAG200_VGA_CONNECTOR_HELPER_FUNCS \
+	.get_modes  = mgag200_vga_connector_helper_get_modes
+
+#define MGAG200_VGA_CONNECTOR_FUNCS \
+	.reset                  = drm_atomic_helper_connector_reset, \
+	.fill_modes             = drm_helper_probe_single_connector_modes, \
+	.destroy                = drm_connector_cleanup, \
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state, \
+	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state
+
 resource_size_t mgag200_device_probe_vram(struct mga_device *mdev);
 void mgag200_init_registers(struct mga_device *mdev);
-int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_fb_available);
+int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_available);
 
 				/* mgag200_bmc.c */
 void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index 1f7dde2d7547..e0c0fd224c5e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -4,7 +4,10 @@
 #include <linux/vmalloc.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
 
@@ -172,6 +175,106 @@ static void mgag200_g200_pixpllc_atomic_update(struct drm_crtc *crtc,
 	WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
 }
 
+/*
+ * Mode-setting pipeline
+ */
+
+static const struct drm_plane_helper_funcs mgag200_g200_primary_plane_helper_funcs = {
+	MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs mgag200_g200_primary_plane_funcs = {
+	MGAG200_PRIMARY_PLANE_FUNCS,
+};
+
+static const struct drm_crtc_helper_funcs mgag200_g200_crtc_helper_funcs = {
+	MGAG200_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs mgag200_g200_crtc_funcs = {
+	MGAG200_CRTC_FUNCS,
+};
+
+static const struct drm_encoder_funcs mgag200_g200_dac_encoder_funcs = {
+	MGAG200_DAC_ENCODER_FUNCS,
+};
+
+static const struct drm_connector_helper_funcs mgag200_g200_vga_connector_helper_funcs = {
+	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs mgag200_g200_vga_connector_funcs = {
+	MGAG200_VGA_CONNECTOR_FUNCS,
+};
+
+static int mgag200_g200_pipeline_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_plane *primary_plane = &mdev->primary_plane;
+	struct drm_crtc *crtc = &mdev->crtc;
+	struct drm_encoder *encoder = &mdev->encoder;
+	struct mga_i2c_chan *i2c = &mdev->i2c;
+	struct drm_connector *connector = &mdev->connector;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+				       &mgag200_g200_primary_plane_funcs,
+				       mgag200_primary_plane_formats,
+				       mgag200_primary_plane_formats_size,
+				       mgag200_primary_plane_fmtmods,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(primary_plane, &mgag200_g200_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&mgag200_g200_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
+		return ret;
+	}
+	drm_crtc_helper_add(crtc, &mgag200_g200_crtc_helper_funcs);
+
+	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
+	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	ret = drm_encoder_init(dev, encoder, &mgag200_g200_dac_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret) {
+		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = mgag200_i2c_init(mdev, i2c);
+	if (ret) {
+		drm_err(dev, "failed to add DDC bus: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &mgag200_g200_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &i2c->adapter);
+	if (ret) {
+		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
+		return ret;
+	}
+	drm_connector_helper_add(connector, &mgag200_g200_vga_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * DRM Device
  */
@@ -343,9 +446,15 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 
 	vram_available = mgag200_device_probe_vram(mdev);
 
-	ret = mgag200_modeset_init(mdev, vram_available);
+	ret = mgag200_mode_config_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_g200_pipeline_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_mode_config_reset(dev);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index b59ba115bda3..205540e33237 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -4,7 +4,10 @@
 #include <linux/pci.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
 
@@ -169,6 +172,106 @@ void mgag200_g200eh_pixpllc_atomic_update(struct drm_crtc *crtc,
 	}
 }
 
+/*
+ * Mode-setting pipeline
+ */
+
+static const struct drm_plane_helper_funcs mgag200_g200eh_primary_plane_helper_funcs = {
+	MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs mgag200_g200eh_primary_plane_funcs = {
+	MGAG200_PRIMARY_PLANE_FUNCS,
+};
+
+static const struct drm_crtc_helper_funcs mgag200_g200eh_crtc_helper_funcs = {
+	MGAG200_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs mgag200_g200eh_crtc_funcs = {
+	MGAG200_CRTC_FUNCS,
+};
+
+static const struct drm_encoder_funcs mgag200_g200eh_dac_encoder_funcs = {
+	MGAG200_DAC_ENCODER_FUNCS,
+};
+
+static const struct drm_connector_helper_funcs mgag200_g200eh_vga_connector_helper_funcs = {
+	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs mgag200_g200eh_vga_connector_funcs = {
+	MGAG200_VGA_CONNECTOR_FUNCS,
+};
+
+static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_plane *primary_plane = &mdev->primary_plane;
+	struct drm_crtc *crtc = &mdev->crtc;
+	struct drm_encoder *encoder = &mdev->encoder;
+	struct mga_i2c_chan *i2c = &mdev->i2c;
+	struct drm_connector *connector = &mdev->connector;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+				       &mgag200_g200eh_primary_plane_funcs,
+				       mgag200_primary_plane_formats,
+				       mgag200_primary_plane_formats_size,
+				       mgag200_primary_plane_fmtmods,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(primary_plane, &mgag200_g200eh_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&mgag200_g200eh_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
+		return ret;
+	}
+	drm_crtc_helper_add(crtc, &mgag200_g200eh_crtc_helper_funcs);
+
+	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
+	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	ret = drm_encoder_init(dev, encoder, &mgag200_g200eh_dac_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret) {
+		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = mgag200_i2c_init(mdev, i2c);
+	if (ret) {
+		drm_err(dev, "failed to add DDC bus: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &mgag200_g200eh_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &i2c->adapter);
+	if (ret) {
+		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
+		return ret;
+	}
+	drm_connector_helper_add(connector, &mgag200_g200eh_vga_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * DRM device
  */
@@ -213,9 +316,15 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 
 	vram_available = mgag200_device_probe_vram(mdev);
 
-	ret = mgag200_modeset_init(mdev, vram_available);
+	ret = mgag200_mode_config_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_g200eh_pipeline_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_mode_config_reset(dev);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 9998197c6446..69ce68efe16c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -3,7 +3,10 @@
 #include <linux/pci.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
 
@@ -63,6 +66,106 @@ static int mgag200_g200eh3_pixpllc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+/*
+ * Mode-setting pipeline
+ */
+
+static const struct drm_plane_helper_funcs mgag200_g200eh3_primary_plane_helper_funcs = {
+	MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs mgag200_g200eh3_primary_plane_funcs = {
+	MGAG200_PRIMARY_PLANE_FUNCS,
+};
+
+static const struct drm_crtc_helper_funcs mgag200_g200eh3_crtc_helper_funcs = {
+	MGAG200_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs mgag200_g200eh3_crtc_funcs = {
+	MGAG200_CRTC_FUNCS,
+};
+
+static const struct drm_encoder_funcs mgag200_g200eh3_dac_encoder_funcs = {
+	MGAG200_DAC_ENCODER_FUNCS,
+};
+
+static const struct drm_connector_helper_funcs mgag200_g200eh3_vga_connector_helper_funcs = {
+	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs mgag200_g200eh3_vga_connector_funcs = {
+	MGAG200_VGA_CONNECTOR_FUNCS,
+};
+
+static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_plane *primary_plane = &mdev->primary_plane;
+	struct drm_crtc *crtc = &mdev->crtc;
+	struct drm_encoder *encoder = &mdev->encoder;
+	struct mga_i2c_chan *i2c = &mdev->i2c;
+	struct drm_connector *connector = &mdev->connector;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+				       &mgag200_g200eh3_primary_plane_funcs,
+				       mgag200_primary_plane_formats,
+				       mgag200_primary_plane_formats_size,
+				       mgag200_primary_plane_fmtmods,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(primary_plane, &mgag200_g200eh3_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&mgag200_g200eh3_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
+		return ret;
+	}
+	drm_crtc_helper_add(crtc, &mgag200_g200eh3_crtc_helper_funcs);
+
+	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
+	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	ret = drm_encoder_init(dev, encoder, &mgag200_g200eh3_dac_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret) {
+		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = mgag200_i2c_init(mdev, i2c);
+	if (ret) {
+		drm_err(dev, "failed to add DDC bus: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &mgag200_g200eh3_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &i2c->adapter);
+	if (ret) {
+		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
+		return ret;
+	}
+	drm_connector_helper_add(connector, &mgag200_g200eh3_vga_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * DRM device
  */
@@ -108,9 +211,15 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 
 	vram_available = mgag200_device_probe_vram(mdev);
 
-	ret = mgag200_modeset_init(mdev, vram_available);
+	ret = mgag200_mode_config_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_g200eh3_pipeline_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_mode_config_reset(dev);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index b18fc5862b7c..8dbb61c1a975 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -4,7 +4,10 @@
 #include <linux/pci.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
 
@@ -158,6 +161,106 @@ static void mgag200_g200er_pixpllc_atomic_update(struct drm_crtc *crtc,
 	udelay(50);
 }
 
+/*
+ * Mode-setting pipeline
+ */
+
+static const struct drm_plane_helper_funcs mgag200_g200er_primary_plane_helper_funcs = {
+	MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs mgag200_g200er_primary_plane_funcs = {
+	MGAG200_PRIMARY_PLANE_FUNCS,
+};
+
+static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
+	MGAG200_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs mgag200_g200er_crtc_funcs = {
+	MGAG200_CRTC_FUNCS,
+};
+
+static const struct drm_encoder_funcs mgag200_g200er_dac_encoder_funcs = {
+	MGAG200_DAC_ENCODER_FUNCS,
+};
+
+static const struct drm_connector_helper_funcs mgag200_g200er_vga_connector_helper_funcs = {
+	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs mgag200_g200er_vga_connector_funcs = {
+	MGAG200_VGA_CONNECTOR_FUNCS,
+};
+
+static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_plane *primary_plane = &mdev->primary_plane;
+	struct drm_crtc *crtc = &mdev->crtc;
+	struct drm_encoder *encoder = &mdev->encoder;
+	struct mga_i2c_chan *i2c = &mdev->i2c;
+	struct drm_connector *connector = &mdev->connector;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+				       &mgag200_g200er_primary_plane_funcs,
+				       mgag200_primary_plane_formats,
+				       mgag200_primary_plane_formats_size,
+				       mgag200_primary_plane_fmtmods,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(primary_plane, &mgag200_g200er_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&mgag200_g200er_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
+		return ret;
+	}
+	drm_crtc_helper_add(crtc, &mgag200_g200er_crtc_helper_funcs);
+
+	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
+	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	ret = drm_encoder_init(dev, encoder, &mgag200_g200er_dac_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret) {
+		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = mgag200_i2c_init(mdev, i2c);
+	if (ret) {
+		drm_err(dev, "failed to add DDC bus: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &mgag200_g200er_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &i2c->adapter);
+	if (ret) {
+		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
+		return ret;
+	}
+	drm_connector_helper_add(connector, &mgag200_g200er_vga_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * DRM device
  */
@@ -198,9 +301,15 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 
 	vram_available = mgag200_device_probe_vram(mdev);
 
-	ret = mgag200_modeset_init(mdev, vram_available);
+	ret = mgag200_mode_config_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_g200er_pipeline_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_mode_config_reset(dev);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 95681796ccd6..996e228de8bf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -4,7 +4,10 @@
 #include <linux/pci.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
 
@@ -174,6 +177,106 @@ static void mgag200_g200ev_pixpllc_atomic_update(struct drm_crtc *crtc,
 	WREG8(DAC_DATA, tmp);
 }
 
+/*
+ * Mode-setting pipeline
+ */
+
+static const struct drm_plane_helper_funcs mgag200_g200ev_primary_plane_helper_funcs = {
+	MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs mgag200_g200ev_primary_plane_funcs = {
+	MGAG200_PRIMARY_PLANE_FUNCS,
+};
+
+static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
+	MGAG200_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs mgag200_g200ev_crtc_funcs = {
+	MGAG200_CRTC_FUNCS,
+};
+
+static const struct drm_encoder_funcs mgag200_g200ev_dac_encoder_funcs = {
+	MGAG200_DAC_ENCODER_FUNCS,
+};
+
+static const struct drm_connector_helper_funcs mgag200_g200ev_vga_connector_helper_funcs = {
+	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs mgag200_g200ev_vga_connector_funcs = {
+	MGAG200_VGA_CONNECTOR_FUNCS,
+};
+
+static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_plane *primary_plane = &mdev->primary_plane;
+	struct drm_crtc *crtc = &mdev->crtc;
+	struct drm_encoder *encoder = &mdev->encoder;
+	struct mga_i2c_chan *i2c = &mdev->i2c;
+	struct drm_connector *connector = &mdev->connector;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+				       &mgag200_g200ev_primary_plane_funcs,
+				       mgag200_primary_plane_formats,
+				       mgag200_primary_plane_formats_size,
+				       mgag200_primary_plane_fmtmods,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(primary_plane, &mgag200_g200ev_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&mgag200_g200ev_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
+		return ret;
+	}
+	drm_crtc_helper_add(crtc, &mgag200_g200ev_crtc_helper_funcs);
+
+	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
+	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	ret = drm_encoder_init(dev, encoder, &mgag200_g200ev_dac_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret) {
+		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = mgag200_i2c_init(mdev, i2c);
+	if (ret) {
+		drm_err(dev, "failed to add DDC bus: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &mgag200_g200ev_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &i2c->adapter);
+	if (ret) {
+		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
+		return ret;
+	}
+	drm_connector_helper_add(connector, &mgag200_g200ev_vga_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * DRM device
  */
@@ -218,9 +321,15 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 
 	vram_available = mgag200_device_probe_vram(mdev);
 
-	ret = mgag200_modeset_init(mdev, vram_available);
+	ret = mgag200_mode_config_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_g200ev_pipeline_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_mode_config_reset(dev);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index a7f5e8fe56d0..86ace6b861cd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -3,7 +3,10 @@
 #include <linux/pci.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
 
@@ -72,6 +75,106 @@ static int mgag200_g200ew3_pixpllc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+/*
+ * Mode-setting pipeline
+ */
+
+static const struct drm_plane_helper_funcs mgag200_g200ew3_primary_plane_helper_funcs = {
+	MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs mgag200_g200ew3_primary_plane_funcs = {
+	MGAG200_PRIMARY_PLANE_FUNCS,
+};
+
+static const struct drm_crtc_helper_funcs mgag200_g200ew3_crtc_helper_funcs = {
+	MGAG200_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs mgag200_g200ew3_crtc_funcs = {
+	MGAG200_CRTC_FUNCS,
+};
+
+static const struct drm_encoder_funcs mgag200_g200ew3_dac_encoder_funcs = {
+	MGAG200_DAC_ENCODER_FUNCS,
+};
+
+static const struct drm_connector_helper_funcs mgag200_g200ew3_vga_connector_helper_funcs = {
+	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs mgag200_g200ew3_vga_connector_funcs = {
+	MGAG200_VGA_CONNECTOR_FUNCS,
+};
+
+static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_plane *primary_plane = &mdev->primary_plane;
+	struct drm_crtc *crtc = &mdev->crtc;
+	struct drm_encoder *encoder = &mdev->encoder;
+	struct mga_i2c_chan *i2c = &mdev->i2c;
+	struct drm_connector *connector = &mdev->connector;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+				       &mgag200_g200ew3_primary_plane_funcs,
+				       mgag200_primary_plane_formats,
+				       mgag200_primary_plane_formats_size,
+				       mgag200_primary_plane_fmtmods,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(primary_plane, &mgag200_g200ew3_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&mgag200_g200ew3_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
+		return ret;
+	}
+	drm_crtc_helper_add(crtc, &mgag200_g200ew3_crtc_helper_funcs);
+
+	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
+	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	ret = drm_encoder_init(dev, encoder, &mgag200_g200ew3_dac_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret) {
+		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = mgag200_i2c_init(mdev, i2c);
+	if (ret) {
+		drm_err(dev, "failed to add DDC bus: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &mgag200_g200ew3_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &i2c->adapter);
+	if (ret) {
+		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
+		return ret;
+	}
+	drm_connector_helper_add(connector, &mgag200_g200ew3_vga_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * DRM device
  */
@@ -128,9 +231,15 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
 
 	vram_available = mgag200_g200ew3_device_probe_vram(mdev);
 
-	ret = mgag200_modeset_init(mdev, vram_available);
+	ret = mgag200_mode_config_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_g200ew3_pipeline_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_mode_config_reset(dev);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 04637b42af77..59191b0c9f2e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -4,7 +4,10 @@
 #include <linux/pci.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
 
@@ -265,6 +268,106 @@ static void mgag200_g200se_04_pixpllc_atomic_update(struct drm_crtc *crtc,
 	WREG_DAC(0x1a, 0x01);
 }
 
+/*
+ * Mode-setting pipeline
+ */
+
+static const struct drm_plane_helper_funcs mgag200_g200se_primary_plane_helper_funcs = {
+	MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs mgag200_g200se_primary_plane_funcs = {
+	MGAG200_PRIMARY_PLANE_FUNCS,
+};
+
+static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
+	MGAG200_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs mgag200_g200se_crtc_funcs = {
+	MGAG200_CRTC_FUNCS,
+};
+
+static const struct drm_encoder_funcs mgag200_g200se_dac_encoder_funcs = {
+	MGAG200_DAC_ENCODER_FUNCS,
+};
+
+static const struct drm_connector_helper_funcs mgag200_g200se_vga_connector_helper_funcs = {
+	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs mgag200_g200se_vga_connector_funcs = {
+	MGAG200_VGA_CONNECTOR_FUNCS,
+};
+
+static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_plane *primary_plane = &mdev->primary_plane;
+	struct drm_crtc *crtc = &mdev->crtc;
+	struct drm_encoder *encoder = &mdev->encoder;
+	struct mga_i2c_chan *i2c = &mdev->i2c;
+	struct drm_connector *connector = &mdev->connector;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+				       &mgag200_g200se_primary_plane_funcs,
+				       mgag200_primary_plane_formats,
+				       mgag200_primary_plane_formats_size,
+				       mgag200_primary_plane_fmtmods,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(primary_plane, &mgag200_g200se_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&mgag200_g200se_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
+		return ret;
+	}
+	drm_crtc_helper_add(crtc, &mgag200_g200se_crtc_helper_funcs);
+
+	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
+	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	ret = drm_encoder_init(dev, encoder, &mgag200_g200se_dac_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret) {
+		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = mgag200_i2c_init(mdev, i2c);
+	if (ret) {
+		drm_err(dev, "failed to add DDC bus: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &mgag200_g200se_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &i2c->adapter);
+	if (ret) {
+		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
+		return ret;
+	}
+	drm_connector_helper_add(connector, &mgag200_g200se_vga_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * DRM device
  */
@@ -377,9 +480,15 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 
 	vram_available = mgag200_device_probe_vram(mdev);
 
-	ret = mgag200_modeset_init(mdev, vram_available);
+	ret = mgag200_mode_config_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_g200se_pipeline_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_mode_config_reset(dev);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index f71b786079fc..2a7812adf2cd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -4,7 +4,10 @@
 #include <linux/pci.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
 
@@ -216,6 +219,106 @@ void mgag200_g200wb_pixpllc_atomic_update(struct drm_crtc *crtc,
 	WREG_DAC(MGA1064_REMHEADCTL, tmp);
 }
 
+/*
+ * Mode-setting pipeline
+ */
+
+static const struct drm_plane_helper_funcs mgag200_g200wb_primary_plane_helper_funcs = {
+	MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs mgag200_g200wb_primary_plane_funcs = {
+	MGAG200_PRIMARY_PLANE_FUNCS,
+};
+
+static const struct drm_crtc_helper_funcs mgag200_g200wb_crtc_helper_funcs = {
+	MGAG200_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs mgag200_g200wb_crtc_funcs = {
+	MGAG200_CRTC_FUNCS,
+};
+
+static const struct drm_encoder_funcs mgag200_g200wb_dac_encoder_funcs = {
+	MGAG200_DAC_ENCODER_FUNCS,
+};
+
+static const struct drm_connector_helper_funcs mgag200_g200wb_vga_connector_helper_funcs = {
+	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs mgag200_g200wb_vga_connector_funcs = {
+	MGAG200_VGA_CONNECTOR_FUNCS,
+};
+
+static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_plane *primary_plane = &mdev->primary_plane;
+	struct drm_crtc *crtc = &mdev->crtc;
+	struct drm_encoder *encoder = &mdev->encoder;
+	struct mga_i2c_chan *i2c = &mdev->i2c;
+	struct drm_connector *connector = &mdev->connector;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+				       &mgag200_g200wb_primary_plane_funcs,
+				       mgag200_primary_plane_formats,
+				       mgag200_primary_plane_formats_size,
+				       mgag200_primary_plane_fmtmods,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(primary_plane, &mgag200_g200wb_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&mgag200_g200wb_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
+		return ret;
+	}
+	drm_crtc_helper_add(crtc, &mgag200_g200wb_crtc_helper_funcs);
+
+	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
+	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	ret = drm_encoder_init(dev, encoder, &mgag200_g200wb_dac_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret) {
+		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = mgag200_i2c_init(mdev, i2c);
+	if (ret) {
+		drm_err(dev, "failed to add DDC bus: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &mgag200_g200wb_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &i2c->adapter);
+	if (ret) {
+		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
+		return ret;
+	}
+	drm_connector_helper_add(connector, &mgag200_g200wb_vga_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * DRM device
  */
@@ -262,9 +365,15 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 
 	vram_available = mgag200_device_probe_vram(mdev);
 
-	ret = mgag200_modeset_init(mdev, vram_available);
+	ret = mgag200_mode_config_init(mdev, vram_available);
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = mgag200_g200wb_pipeline_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_mode_config_reset(dev);
+
 	return mdev;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index e3e40b25caa6..639c33ce6090 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -13,8 +13,6 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_atomic_state_helper.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
@@ -22,13 +20,10 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
-#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
 
-#define MGAG200_LUT_SIZE 256
-
 /*
  * This file contains setup code for the CRTC.
  */
@@ -516,19 +511,21 @@ static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_ma
  * Primary plane
  */
 
-static const uint32_t mgag200_primary_plane_formats[] = {
+const uint32_t mgag200_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_RGB888,
 };
 
-static const uint64_t mgag200_primary_plane_fmtmods[] = {
+const size_t mgag200_primary_plane_formats_size = ARRAY_SIZE(mgag200_primary_plane_formats);
+
+const uint64_t mgag200_primary_plane_fmtmods[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
 };
 
-static int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
-						     struct drm_atomic_state *state)
+int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_framebuffer *new_fb = new_plane_state->fb;
@@ -564,8 +561,8 @@ static int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
-static void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
-						       struct drm_atomic_state *old_state)
+void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = plane->dev;
 	struct mga_device *mdev = to_mga_device(dev);
@@ -595,8 +592,8 @@ static void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	msleep(20);
 }
 
-static void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-							struct drm_atomic_state *old_state)
+void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
+						 struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = plane->dev;
 	struct mga_device *mdev = to_mga_device(dev);
@@ -608,26 +605,12 @@ static void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 	msleep(20);
 }
 
-static const struct drm_plane_helper_funcs mgag200_primary_plane_helper_funcs = {
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = mgag200_primary_plane_helper_atomic_check,
-	.atomic_update = mgag200_primary_plane_helper_atomic_update,
-	.atomic_disable = mgag200_primary_plane_helper_atomic_disable,
-};
-
-static const struct drm_plane_funcs mgag200_primary_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = drm_plane_cleanup,
-	DRM_GEM_SHADOW_PLANE_FUNCS,
-};
-
 /*
  * CRTC
  */
 
-static enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc *crtc,
-							   const struct drm_display_mode *mode)
+enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc *crtc,
+						    const struct drm_display_mode *mode)
 {
 	struct mga_device *mdev = to_mga_device(crtc->dev);
 	const struct mgag200_device_info *info = mdev->info;
@@ -656,8 +639,7 @@ static enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc *crtc
 	return MODE_OK;
 }
 
-static int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc,
-					    struct drm_atomic_state *state)
+int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
@@ -692,8 +674,7 @@ static int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	return drm_atomic_add_affected_planes(state, crtc);
 }
 
-static void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc,
-					     struct drm_atomic_state *old_state)
+void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -710,8 +691,7 @@ static void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	}
 }
 
-static void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
-					      struct drm_atomic_state *old_state)
+void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
@@ -744,8 +724,7 @@ static void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 		funcs->enable_vidrst(mdev);
 }
 
-static void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc,
-					       struct drm_atomic_state *old_state)
+void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct mga_device *mdev = to_mga_device(crtc->dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
@@ -759,15 +738,7 @@ static void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 		funcs->enable_vidrst(mdev);
 }
 
-static const struct drm_crtc_helper_funcs mgag200_crtc_helper_funcs = {
-	.mode_valid = mgag200_crtc_helper_mode_valid,
-	.atomic_check = mgag200_crtc_helper_atomic_check,
-	.atomic_flush = mgag200_crtc_helper_atomic_flush,
-	.atomic_enable = mgag200_crtc_helper_atomic_enable,
-	.atomic_disable = mgag200_crtc_helper_atomic_disable,
-};
-
-static void mgag200_crtc_reset(struct drm_crtc *crtc)
+void mgag200_crtc_reset(struct drm_crtc *crtc)
 {
 	struct mgag200_crtc_state *mgag200_crtc_state;
 
@@ -781,7 +752,7 @@ static void mgag200_crtc_reset(struct drm_crtc *crtc)
 		__drm_atomic_helper_crtc_reset(crtc, NULL);
 }
 
-static struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 {
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -802,8 +773,7 @@ static struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crt
 	return &new_mgag200_crtc_state->base;
 }
 
-static void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc,
-					      struct drm_crtc_state *crtc_state)
+void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
 {
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 
@@ -811,28 +781,11 @@ static void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc,
 	kfree(mgag200_crtc_state);
 }
 
-static const struct drm_crtc_funcs mgag200_crtc_funcs = {
-	.reset = mgag200_crtc_reset,
-	.destroy = drm_crtc_cleanup,
-	.set_config = drm_atomic_helper_set_config,
-	.page_flip = drm_atomic_helper_page_flip,
-	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state,
-	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state,
-};
-
-/*
- * Encoder
- */
-
-static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 /*
  * Connector
  */
 
-static int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector)
+int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct mga_device *mdev = to_mga_device(connector->dev);
 	int ret;
@@ -848,18 +801,6 @@ static int mgag200_vga_connector_helper_get_modes(struct drm_connector *connecto
 	return ret;
 }
 
-static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
-	.get_modes  = mgag200_vga_connector_helper_get_modes,
-};
-
-static const struct drm_connector_funcs mga_vga_connector_funcs = {
-	.reset                  = drm_atomic_helper_connector_reset,
-	.fill_modes             = drm_helper_probe_single_connector_modes,
-	.destroy                = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
-};
-
 /*
  * Mode config
  */
@@ -946,7 +887,7 @@ static const struct drm_mode_config_funcs mgag200_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_available)
+int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_available)
 {
 	struct drm_device *dev = &mdev->base;
 	int ret;
@@ -968,88 +909,3 @@ static int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vra
 
 	return 0;
 }
-
-static int mgag200_pipeline_init(struct mga_device *mdev)
-{
-	struct drm_device *dev = &mdev->base;
-	struct drm_plane *primary_plane = &mdev->primary_plane;
-	struct drm_crtc *crtc = &mdev->crtc;
-	struct drm_encoder *encoder = &mdev->encoder;
-	struct mga_i2c_chan *i2c = &mdev->i2c;
-	struct drm_connector *connector = &mdev->connector;
-	int ret;
-
-	ret = drm_universal_plane_init(dev, primary_plane, 0,
-				       &mgag200_primary_plane_funcs,
-				       mgag200_primary_plane_formats,
-				       ARRAY_SIZE(mgag200_primary_plane_formats),
-				       mgag200_primary_plane_fmtmods,
-				       DRM_PLANE_TYPE_PRIMARY, NULL);
-	if (ret) {
-		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
-		return ret;
-	}
-	drm_plane_helper_add(primary_plane, &mgag200_primary_plane_helper_funcs);
-	drm_plane_enable_fb_damage_clips(primary_plane);
-
-	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL, &mgag200_crtc_funcs, NULL);
-	if (ret) {
-		drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
-		return ret;
-	}
-	drm_crtc_helper_add(crtc, &mgag200_crtc_helper_funcs);
-
-	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
-	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
-	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
-
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &mgag200_dac_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
-	if (ret) {
-		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = mgag200_i2c_init(mdev, i2c);
-	if (ret) {
-		drm_err(dev, "failed to add DDC bus: %d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector,
-					  &mga_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA,
-					  &i2c->adapter);
-	if (ret) {
-		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
-		return ret;
-	}
-	drm_connector_helper_add(connector, &mga_vga_connector_helper_funcs);
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available)
-{
-	struct drm_device *dev = &mdev->base;
-	int ret;
-
-	ret = mgag200_mode_config_init(mdev, vram_available);
-	if (ret)
-		return ret;
-
-	ret = mgag200_pipeline_init(mdev);
-	if (ret)
-		return ret;
-
-	drm_mode_config_reset(dev);
-
-	return 0;
-}
-- 
2.36.1

