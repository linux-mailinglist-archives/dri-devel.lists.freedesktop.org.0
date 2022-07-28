Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42226583F18
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 14:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A03F8AFC3;
	Thu, 28 Jul 2022 12:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45FF95DF5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 12:41:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A96A33839;
 Thu, 28 Jul 2022 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659012067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lqvddiew682wufQ1a8wXlwR8LokwnRmdKmylH/8Fn4c=;
 b=rSfjLziHJyFpqN8D66+niLPAAf4dtkXapiEb8LxmDRXjCOcWAI6H9XR0+9H+I85WVXXzQp
 ufb0TxRuL4SdhfJ+mJHZ4/i2iccyg5HESLhJhRJg/y3GVA7wzZcn3MB40+eOzibyzhTVK+
 m7oitcqYvZMVxgLBQDFlrAGC/NugAIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659012067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lqvddiew682wufQ1a8wXlwR8LokwnRmdKmylH/8Fn4c=;
 b=SAzRsO3106mmhDTpzsCOcyZVVokY9GyXvXI/yJiEclFQ9DYpa0i/2rTSUEs/yl5gqREqIh
 pxs3ms1TEPnE14Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C71213A7E;
 Thu, 28 Jul 2022 12:41:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OHb4DeOD4mJwMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Jul 2022 12:41:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, sam@ravnborg.org, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 12/14] drm/mgag200: Move mode-config to model-specific code
Date: Thu, 28 Jul 2022 14:41:01 +0200
Message-Id: <20220728124103.30159-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728124103.30159-1-tzimmermann@suse.de>
References: <20220728124103.30159-1-tzimmermann@suse.de>
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

v3:
	* clean up style

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 185 +++-------------------
 10 files changed, 977 insertions(+), 174 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index cc14028df395..1e7de8b12e75 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -152,6 +152,8 @@
 	/* 0x40: */        0,    0,    0,    0,    0,    0,    0,    0,				\
 	/* 0x48: */        0,    0,    0,    0,    0,    0,    0,    0				\
 
+#define MGAG200_LUT_SIZE 256
+
 #define MGAG200_MAX_FB_HEIGHT 4096
 #define MGAG200_MAX_FB_WIDTH 4096
 
@@ -363,10 +365,82 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
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
+					      struct drm_atomic_state *new_state);
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
+int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *new_state);
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
index ae1669d208f8..dffcfa83ae74 100644
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
 
@@ -160,6 +163,106 @@ static void mgag200_g200_pixpllc_atomic_update(struct drm_crtc *crtc,
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
@@ -331,9 +434,15 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
 
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
index fd44d19c729a..54568d1f603a 100644
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
 
@@ -159,6 +162,106 @@ void mgag200_g200eh_pixpllc_atomic_update(struct drm_crtc *crtc,
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
@@ -203,9 +306,15 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
 
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
index b47b100d219d..3e2929fd6145 100644
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
index 8a85fd034e3d..399f2443cb47 100644
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
 
@@ -149,6 +152,106 @@ static void mgag200_g200er_pixpllc_atomic_update(struct drm_crtc *crtc,
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
@@ -189,9 +292,15 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
 
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
index 54c80562900d..2165ec7d63e8 100644
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
 
@@ -161,6 +164,106 @@ static void mgag200_g200ev_pixpllc_atomic_update(struct drm_crtc *crtc,
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
@@ -205,9 +308,15 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
 
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
index 29aa8a3d4522..25b7bce31e0b 100644
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
index ca9ea26219ca..a28f5203a95a 100644
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
 
@@ -250,6 +253,106 @@ static void mgag200_g200se_04_pixpllc_atomic_update(struct drm_crtc *crtc,
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
@@ -362,9 +465,15 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 
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
index 1e0c80c2787d..01d21b6a4ce9 100644
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
 
@@ -206,6 +209,106 @@ void mgag200_g200wb_pixpllc_atomic_update(struct drm_crtc *crtc,
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
@@ -252,9 +355,15 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
 
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
index 65709b2fc2bc..b468cda64a80 100644
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
@@ -26,8 +24,6 @@
 
 #include "mgag200_drv.h"
 
-#define MGAG200_LUT_SIZE 256
-
 /*
  * This file contains setup code for the CRTC.
  */
@@ -515,19 +511,21 @@ static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_ma
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
-						     struct drm_atomic_state *new_state)
+int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_state *new_state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
 	struct drm_framebuffer *new_fb = new_plane_state->fb;
@@ -561,8 +559,8 @@ static int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
-static void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
-						       struct drm_atomic_state *old_state)
+void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = plane->dev;
 	struct mga_device *mdev = to_mga_device(dev);
@@ -594,8 +592,8 @@ static void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	}
 }
 
-static void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-							struct drm_atomic_state *old_state)
+void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
+						 struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = plane->dev;
 	struct mga_device *mdev = to_mga_device(dev);
@@ -607,26 +605,12 @@ static void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
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
@@ -655,8 +639,7 @@ static enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc *crtc
 	return MODE_OK;
 }
 
-static int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc,
-					    struct drm_atomic_state *new_state)
+int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *new_state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
@@ -690,8 +673,7 @@ static int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	return drm_atomic_add_affected_planes(new_state, crtc);
 }
 
-static void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc,
-					     struct drm_atomic_state *old_state)
+void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -708,8 +690,7 @@ static void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	}
 }
 
-static void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
-					      struct drm_atomic_state *old_state)
+void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
@@ -742,8 +723,7 @@ static void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 		funcs->enable_vidrst(mdev);
 }
 
-static void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc,
-					       struct drm_atomic_state *old_state)
+void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct mga_device *mdev = to_mga_device(crtc->dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
@@ -757,15 +737,7 @@ static void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc,
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
 
@@ -779,7 +751,7 @@ static void mgag200_crtc_reset(struct drm_crtc *crtc)
 		__drm_atomic_helper_crtc_reset(crtc, NULL);
 }
 
-static struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 {
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -800,8 +772,7 @@ static struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crt
 	return &new_mgag200_crtc_state->base;
 }
 
-static void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc,
-					      struct drm_crtc_state *crtc_state)
+void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
 {
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 
@@ -809,28 +780,11 @@ static void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc,
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
@@ -846,18 +800,6 @@ static int mgag200_vga_connector_helper_get_modes(struct drm_connector *connecto
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
@@ -944,7 +886,7 @@ static const struct drm_mode_config_funcs mgag200_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_available)
+int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_available)
 {
 	struct drm_device *dev = &mdev->base;
 	int ret;
@@ -966,88 +908,3 @@ static int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vra
 
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
2.37.1

