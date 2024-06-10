Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE19023BB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 16:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097EC10E489;
	Mon, 10 Jun 2024 14:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SqS1KnXm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9cLl9pTz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SqS1KnXm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9cLl9pTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7256810E0DA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 14:11:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B5D4521B79;
 Mon, 10 Jun 2024 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718028704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faOVVCAtSFL3eid7snezf7lxueDjdiLA5+KimEDN/As=;
 b=SqS1KnXmQcH/mvmBAAMfDbyycuiKLg1MQO6QI1J40h951/TfL1FDtLvmPhObJgih39pwMq
 TkVPYOlfbQDN3X5mm4r74RE+Vtg9UlbHJQ5DUQ43LIiZkTC/uTDVXVtjEmM4J0xNS1DDIm
 TU4YvcoqufiWzhT1Kxyf5m7gfkkvO3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718028704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faOVVCAtSFL3eid7snezf7lxueDjdiLA5+KimEDN/As=;
 b=9cLl9pTzi4YLAbVwhHaOUMt1NSTcC76NzVnd66L+N0xb+WEm1I0DwoDYFf47X3pfnlMtHJ
 XUEzSeKgmL+UPLBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718028704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faOVVCAtSFL3eid7snezf7lxueDjdiLA5+KimEDN/As=;
 b=SqS1KnXmQcH/mvmBAAMfDbyycuiKLg1MQO6QI1J40h951/TfL1FDtLvmPhObJgih39pwMq
 TkVPYOlfbQDN3X5mm4r74RE+Vtg9UlbHJQ5DUQ43LIiZkTC/uTDVXVtjEmM4J0xNS1DDIm
 TU4YvcoqufiWzhT1Kxyf5m7gfkkvO3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718028704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faOVVCAtSFL3eid7snezf7lxueDjdiLA5+KimEDN/As=;
 b=9cLl9pTzi4YLAbVwhHaOUMt1NSTcC76NzVnd66L+N0xb+WEm1I0DwoDYFf47X3pfnlMtHJ
 XUEzSeKgmL+UPLBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7721B13AA0;
 Mon, 10 Jun 2024 14:11:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iH3tG6AJZ2Z7QQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jun 2024 14:11:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/3] drm/mgag200: Consolidate VGA output
Date: Mon, 10 Jun 2024 16:06:04 +0200
Message-ID: <20240610141141.29527-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610141141.29527-1-tzimmermann@suse.de>
References: <20240610141141.29527-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
X-Spam-Flag: NO
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

The various models have common code for the VGA output's encoder and
connector. Move everything into a single shared source file. Remove some
obsolete initializer macros. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/Makefile          |  3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 24 +++-----
 drivers/gpu/drm/mgag200/mgag200_g200.c    | 46 +--------------
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 46 +--------------
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 46 +--------------
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 46 +--------------
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 46 +--------------
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 46 +--------------
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 46 +--------------
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 46 +--------------
 drivers/gpu/drm/mgag200/mgag200_vga.c     | 68 +++++++++++++++++++++++
 11 files changed, 95 insertions(+), 368 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_vga.c

diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
index 0b919352046eb..d1b25f9f6586e 100644
--- a/drivers/gpu/drm/mgag200/Makefile
+++ b/drivers/gpu/drm/mgag200/Makefile
@@ -11,6 +11,7 @@ mgag200-y := \
 	mgag200_g200ew3.o \
 	mgag200_g200se.o \
 	mgag200_g200wb.o \
-	mgag200_mode.o
+	mgag200_mode.o \
+	mgag200_vga.o
 
 obj-$(CONFIG_DRM_MGAG200) += mgag200.o
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 20e3710e056b3..db89fddc26dcb 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -283,8 +283,12 @@ struct mga_device {
 
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
-	struct drm_encoder encoder;
-	struct drm_connector connector;
+	struct {
+		struct {
+			struct drm_encoder encoder;
+			struct drm_connector connector;
+		} vga;
+	} output;
 };
 
 static inline struct mga_device *to_mga_device(struct drm_device *dev)
@@ -417,25 +421,15 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
 	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state
 
-#define MGAG200_DAC_ENCODER_FUNCS \
-	.destroy = drm_encoder_cleanup
-
-#define MGAG200_VGA_CONNECTOR_HELPER_FUNCS \
-	.get_modes = drm_connector_helper_get_modes
-
-#define MGAG200_VGA_CONNECTOR_FUNCS \
-	.reset                  = drm_atomic_helper_connector_reset, \
-	.fill_modes             = drm_helper_probe_single_connector_modes, \
-	.destroy                = drm_connector_cleanup, \
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state, \
-	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state
-
 void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode);
 void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_info *format);
 void mgag200_enable_display(struct mga_device *mdev);
 void mgag200_init_registers(struct mga_device *mdev);
 int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_available);
 
+/* mgag200_vga.c */
+int mgag200_vga_output_init(struct mga_device *mdev);
+
 				/* mgag200_bmc.c */
 void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
 void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index 39a29d8ffca6e..ff467b0f9cbf3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -9,7 +9,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
-#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 static int mgag200_g200_init_pci_options(struct pci_dev *pdev)
@@ -184,26 +183,11 @@ static const struct drm_crtc_funcs mgag200_g200_crtc_funcs = {
 	MGAG200_CRTC_FUNCS,
 };
 
-static const struct drm_encoder_funcs mgag200_g200_dac_encoder_funcs = {
-	MGAG200_DAC_ENCODER_FUNCS,
-};
-
-static const struct drm_connector_helper_funcs mgag200_g200_vga_connector_helper_funcs = {
-	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
-};
-
-static const struct drm_connector_funcs mgag200_g200_vga_connector_funcs = {
-	MGAG200_VGA_CONNECTOR_FUNCS,
-};
-
 static int mgag200_g200_pipeline_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
-	struct drm_encoder *encoder = &mdev->encoder;
-	struct drm_connector *connector = &mdev->connector;
-	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -231,35 +215,9 @@ static int mgag200_g200_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &mgag200_g200_dac_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
-	if (ret) {
-		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
-		return ret;
-	}
-
-	ddc = mgag200_ddc_create(mdev);
-	if (IS_ERR(ddc)) {
-		ret = PTR_ERR(ddc);
-		drm_err(dev, "failed to add DDC bus: %d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector,
-					  &mgag200_g200_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA, ddc);
-	if (ret) {
-		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
-		return ret;
-	}
-	drm_connector_helper_add(connector, &mgag200_g200_vga_connector_helper_funcs);
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+	ret = mgag200_vga_output_init(mdev);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 619fee7ffdf5e..df00b25efb895 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -9,7 +9,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
-#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 void mgag200_g200eh_init_registers(struct mga_device *mdev)
@@ -183,26 +182,11 @@ static const struct drm_crtc_funcs mgag200_g200eh_crtc_funcs = {
 	MGAG200_CRTC_FUNCS,
 };
 
-static const struct drm_encoder_funcs mgag200_g200eh_dac_encoder_funcs = {
-	MGAG200_DAC_ENCODER_FUNCS,
-};
-
-static const struct drm_connector_helper_funcs mgag200_g200eh_vga_connector_helper_funcs = {
-	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
-};
-
-static const struct drm_connector_funcs mgag200_g200eh_vga_connector_funcs = {
-	MGAG200_VGA_CONNECTOR_FUNCS,
-};
-
 static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
-	struct drm_encoder *encoder = &mdev->encoder;
-	struct drm_connector *connector = &mdev->connector;
-	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -230,35 +214,9 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &mgag200_g200eh_dac_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
-	if (ret) {
-		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
-		return ret;
-	}
-
-	ddc = mgag200_ddc_create(mdev);
-	if (IS_ERR(ddc)) {
-		ret = PTR_ERR(ddc);
-		drm_err(dev, "failed to add DDC bus: %d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector,
-					  &mgag200_g200eh_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA, ddc);
-	if (ret) {
-		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
-		return ret;
-	}
-	drm_connector_helper_add(connector, &mgag200_g200eh_vga_connector_helper_funcs);
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+	ret = mgag200_vga_output_init(mdev);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index a172b8a4500a0..be42b1291e357 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -8,7 +8,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
-#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 /*
@@ -87,26 +86,11 @@ static const struct drm_crtc_funcs mgag200_g200eh3_crtc_funcs = {
 	MGAG200_CRTC_FUNCS,
 };
 
-static const struct drm_encoder_funcs mgag200_g200eh3_dac_encoder_funcs = {
-	MGAG200_DAC_ENCODER_FUNCS,
-};
-
-static const struct drm_connector_helper_funcs mgag200_g200eh3_vga_connector_helper_funcs = {
-	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
-};
-
-static const struct drm_connector_funcs mgag200_g200eh3_vga_connector_funcs = {
-	MGAG200_VGA_CONNECTOR_FUNCS,
-};
-
 static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
-	struct drm_encoder *encoder = &mdev->encoder;
-	struct drm_connector *connector = &mdev->connector;
-	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -134,35 +118,9 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &mgag200_g200eh3_dac_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
-	if (ret) {
-		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
-		return ret;
-	}
-
-	ddc = mgag200_ddc_create(mdev);
-	if (IS_ERR(ddc)) {
-		ret = PTR_ERR(ddc);
-		drm_err(dev, "failed to add DDC bus: %d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector,
-					  &mgag200_g200eh3_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA, ddc);
-	if (ret) {
-		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
-		return ret;
-	}
-	drm_connector_helper_add(connector, &mgag200_g200eh3_vga_connector_helper_funcs);
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+	ret = mgag200_vga_output_init(mdev);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index a11c91331e43e..6f2c07af38c4f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -9,7 +9,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
-#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 static void mgag200_g200er_init_registers(struct mga_device *mdev)
@@ -226,26 +225,11 @@ static const struct drm_crtc_funcs mgag200_g200er_crtc_funcs = {
 	MGAG200_CRTC_FUNCS,
 };
 
-static const struct drm_encoder_funcs mgag200_g200er_dac_encoder_funcs = {
-	MGAG200_DAC_ENCODER_FUNCS,
-};
-
-static const struct drm_connector_helper_funcs mgag200_g200er_vga_connector_helper_funcs = {
-	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
-};
-
-static const struct drm_connector_funcs mgag200_g200er_vga_connector_funcs = {
-	MGAG200_VGA_CONNECTOR_FUNCS,
-};
-
 static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
-	struct drm_encoder *encoder = &mdev->encoder;
-	struct drm_connector *connector = &mdev->connector;
-	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -273,35 +257,9 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &mgag200_g200er_dac_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
-	if (ret) {
-		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
-		return ret;
-	}
-
-	ddc = mgag200_ddc_create(mdev);
-	if (IS_ERR(ddc)) {
-		ret = PTR_ERR(ddc);
-		drm_err(dev, "failed to add DDC bus: %d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector,
-					  &mgag200_g200er_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA, ddc);
-	if (ret) {
-		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
-		return ret;
-	}
-	drm_connector_helper_add(connector, &mgag200_g200er_vga_connector_helper_funcs);
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+	ret = mgag200_vga_output_init(mdev);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index dfb641b83842a..908d04d4c862c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -9,7 +9,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
-#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 static void mgag200_g200ev_init_registers(struct mga_device *mdev)
@@ -227,26 +226,11 @@ static const struct drm_crtc_funcs mgag200_g200ev_crtc_funcs = {
 	MGAG200_CRTC_FUNCS,
 };
 
-static const struct drm_encoder_funcs mgag200_g200ev_dac_encoder_funcs = {
-	MGAG200_DAC_ENCODER_FUNCS,
-};
-
-static const struct drm_connector_helper_funcs mgag200_g200ev_vga_connector_helper_funcs = {
-	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
-};
-
-static const struct drm_connector_funcs mgag200_g200ev_vga_connector_funcs = {
-	MGAG200_VGA_CONNECTOR_FUNCS,
-};
-
 static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
-	struct drm_encoder *encoder = &mdev->encoder;
-	struct drm_connector *connector = &mdev->connector;
-	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -274,35 +258,9 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &mgag200_g200ev_dac_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
-	if (ret) {
-		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
-		return ret;
-	}
-
-	ddc = mgag200_ddc_create(mdev);
-	if (IS_ERR(ddc)) {
-		ret = PTR_ERR(ddc);
-		drm_err(dev, "failed to add DDC bus: %d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector,
-					  &mgag200_g200ev_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA, ddc);
-	if (ret) {
-		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
-		return ret;
-	}
-	drm_connector_helper_add(connector, &mgag200_g200ev_vga_connector_helper_funcs);
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+	ret = mgag200_vga_output_init(mdev);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 525b7f75e6228..8b69af543e2be 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -8,7 +8,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
-#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 static void mgag200_g200ew3_init_registers(struct mga_device *mdev)
@@ -96,26 +95,11 @@ static const struct drm_crtc_funcs mgag200_g200ew3_crtc_funcs = {
 	MGAG200_CRTC_FUNCS,
 };
 
-static const struct drm_encoder_funcs mgag200_g200ew3_dac_encoder_funcs = {
-	MGAG200_DAC_ENCODER_FUNCS,
-};
-
-static const struct drm_connector_helper_funcs mgag200_g200ew3_vga_connector_helper_funcs = {
-	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
-};
-
-static const struct drm_connector_funcs mgag200_g200ew3_vga_connector_funcs = {
-	MGAG200_VGA_CONNECTOR_FUNCS,
-};
-
 static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
-	struct drm_encoder *encoder = &mdev->encoder;
-	struct drm_connector *connector = &mdev->connector;
-	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -143,35 +127,9 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &mgag200_g200ew3_dac_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
-	if (ret) {
-		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
-		return ret;
-	}
-
-	ddc = mgag200_ddc_create(mdev);
-	if (IS_ERR(ddc)) {
-		ret = PTR_ERR(ddc);
-		drm_err(dev, "failed to add DDC bus: %d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector,
-					  &mgag200_g200ew3_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA, ddc);
-	if (ret) {
-		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
-		return ret;
-	}
-	drm_connector_helper_add(connector, &mgag200_g200ew3_vga_connector_helper_funcs);
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+	ret = mgag200_vga_output_init(mdev);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index ef7606b529ea1..6d7fbdf62b97a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -9,7 +9,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
-#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 static int mgag200_g200se_init_pci_options(struct pci_dev *pdev)
@@ -358,26 +357,11 @@ static const struct drm_crtc_funcs mgag200_g200se_crtc_funcs = {
 	MGAG200_CRTC_FUNCS,
 };
 
-static const struct drm_encoder_funcs mgag200_g200se_dac_encoder_funcs = {
-	MGAG200_DAC_ENCODER_FUNCS,
-};
-
-static const struct drm_connector_helper_funcs mgag200_g200se_vga_connector_helper_funcs = {
-	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
-};
-
-static const struct drm_connector_funcs mgag200_g200se_vga_connector_funcs = {
-	MGAG200_VGA_CONNECTOR_FUNCS,
-};
-
 static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
-	struct drm_encoder *encoder = &mdev->encoder;
-	struct drm_connector *connector = &mdev->connector;
-	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -405,35 +389,9 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &mgag200_g200se_dac_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
-	if (ret) {
-		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
-		return ret;
-	}
-
-	ddc = mgag200_ddc_create(mdev);
-	if (IS_ERR(ddc)) {
-		ret = PTR_ERR(ddc);
-		drm_err(dev, "failed to add DDC bus: %d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector,
-					  &mgag200_g200se_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA, ddc);
-	if (ret) {
-		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
-		return ret;
-	}
-	drm_connector_helper_add(connector, &mgag200_g200se_vga_connector_helper_funcs);
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+	ret = mgag200_vga_output_init(mdev);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index e4def62b1e575..564d1f3ecc108 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -9,7 +9,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 
-#include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
 void mgag200_g200wb_init_registers(struct mga_device *mdev)
@@ -230,26 +229,11 @@ static const struct drm_crtc_funcs mgag200_g200wb_crtc_funcs = {
 	MGAG200_CRTC_FUNCS,
 };
 
-static const struct drm_encoder_funcs mgag200_g200wb_dac_encoder_funcs = {
-	MGAG200_DAC_ENCODER_FUNCS,
-};
-
-static const struct drm_connector_helper_funcs mgag200_g200wb_vga_connector_helper_funcs = {
-	MGAG200_VGA_CONNECTOR_HELPER_FUNCS,
-};
-
-static const struct drm_connector_funcs mgag200_g200wb_vga_connector_funcs = {
-	MGAG200_VGA_CONNECTOR_FUNCS,
-};
-
 static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	struct drm_plane *primary_plane = &mdev->primary_plane;
 	struct drm_crtc *crtc = &mdev->crtc;
-	struct drm_encoder *encoder = &mdev->encoder;
-	struct drm_connector *connector = &mdev->connector;
-	struct i2c_adapter *ddc;
 	int ret;
 
 	ret = drm_universal_plane_init(dev, primary_plane, 0,
@@ -277,35 +261,9 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
 	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
 
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_encoder_init(dev, encoder, &mgag200_g200wb_dac_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
-	if (ret) {
-		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
-		return ret;
-	}
-
-	ddc = mgag200_ddc_create(mdev);
-	if (IS_ERR(ddc)) {
-		ret = PTR_ERR(ddc);
-		drm_err(dev, "failed to add DDC bus: %d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector,
-					  &mgag200_g200wb_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA, ddc);
-	if (ret) {
-		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
-		return ret;
-	}
-	drm_connector_helper_add(connector, &mgag200_g200wb_vga_connector_helper_funcs);
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+	ret = mgag200_vga_output_init(mdev);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_vga.c b/drivers/gpu/drm/mgag200/mgag200_vga.c
new file mode 100644
index 0000000000000..6d8982990c2c3
--- /dev/null
+++ b/drivers/gpu/drm/mgag200/mgag200_vga.c
@@ -0,0 +1,68 @@
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
+	.get_modes = drm_connector_helper_get_modes
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
+int mgag200_vga_output_init(struct mga_device *mdev)
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
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
-- 
2.45.2

