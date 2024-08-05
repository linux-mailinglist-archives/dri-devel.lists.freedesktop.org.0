Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432E0947B89
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 15:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBFB10E1FF;
	Mon,  5 Aug 2024 13:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C258D10E1DE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 13:06:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 65F171FD15;
 Mon,  5 Aug 2024 13:06:25 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D06313AEB;
 Mon,  5 Aug 2024 13:06:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SDC6CVHOsGaiMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Aug 2024 13:06:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/5] drm/mgag200: Remove BMC output
Date: Mon,  5 Aug 2024 15:06:01 +0200
Message-ID: <20240805130622.63458-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240805130622.63458-1-tzimmermann@suse.de>
References: <20240805130622.63458-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 65F171FD15
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

Mgag200's BMC connector tracks the status of an underlying physical
connector and updates the BMC status accordingly. This functionality
works around GNOME's settings app, which cannot handle multiple
outputs on the same CRTC.

The workaround is now obsolete as the VGA-BMC connector handles BMC
support internally. Hence, remove the driver's code and the BMC output
entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_bmc.c     | 102 ----------------------
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  10 ---
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |   4 -
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |   4 -
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |   4 -
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |   4 -
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   4 -
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |   4 -
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   4 -
 9 files changed, 140 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
index 45e35dffb3ea..a689c71ff165 100644
--- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
@@ -9,11 +9,6 @@
 
 #include "mgag200_drv.h"
 
-static struct mgag200_bmc_connector *to_mgag200_bmc_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct mgag200_bmc_connector, base);
-}
-
 void mgag200_bmc_stop_scanout(struct mga_device *mdev)
 {
 	u8 tmp;
@@ -102,100 +97,3 @@ void mgag200_bmc_start_scanout(struct mga_device *mdev)
 	tmp &= ~0x10;
 	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
 }
-
-static const struct drm_encoder_funcs mgag200_bmc_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-static int mgag200_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
-						   struct drm_modeset_acquire_ctx *ctx,
-						   bool force)
-{
-	struct mgag200_bmc_connector *bmc_connector = to_mgag200_bmc_connector(connector);
-	struct drm_connector *physical_connector = bmc_connector->physical_connector;
-
-	/*
-	 * Most user-space compositors cannot handle more than one connected
-	 * connector per CRTC. Hence, we only mark the BMC as connected if the
-	 * physical connector is disconnected. If the physical connector's status
-	 * is connected or unknown, the BMC remains disconnected. This has no
-	 * effect on the output of the BMC.
-	 *
-	 * FIXME: Remove this logic once user-space compositors can handle more
-	 *        than one connector per CRTC. The BMC should always be connected.
-	 */
-
-	if (physical_connector && physical_connector->status == connector_status_disconnected)
-		return connector_status_connected;
-
-	return connector_status_disconnected;
-}
-
-static int mgag200_bmc_connector_helper_get_modes(struct drm_connector *connector)
-{
-	struct drm_device *dev = connector->dev;
-	struct mga_device *mdev = to_mga_device(dev);
-	const struct mgag200_device_info *minfo = mdev->info;
-
-	return drm_add_modes_noedid(connector, minfo->max_hdisplay, minfo->max_vdisplay);
-}
-
-static const struct drm_connector_helper_funcs mgag200_bmc_connector_helper_funcs = {
-	.get_modes = mgag200_bmc_connector_helper_get_modes,
-	.detect_ctx = mgag200_bmc_connector_helper_detect_ctx,
-};
-
-static const struct drm_connector_funcs mgag200_bmc_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int mgag200_bmc_connector_init(struct drm_device *dev,
-				      struct mgag200_bmc_connector *bmc_connector,
-				      struct drm_connector *physical_connector)
-{
-	struct drm_connector *connector = &bmc_connector->base;
-	int ret;
-
-	ret = drm_connector_init(dev, connector, &mgag200_bmc_connector_funcs,
-				 DRM_MODE_CONNECTOR_VIRTUAL);
-	if (ret)
-		return ret;
-	drm_connector_helper_add(connector, &mgag200_bmc_connector_helper_funcs);
-
-	bmc_connector->physical_connector = physical_connector;
-
-	return 0;
-}
-
-int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector)
-{
-	struct drm_device *dev = &mdev->base;
-	struct drm_crtc *crtc = &mdev->crtc;
-	struct drm_encoder *encoder;
-	struct mgag200_bmc_connector *bmc_connector;
-	struct drm_connector *connector;
-	int ret;
-
-	encoder = &mdev->output.bmc.encoder;
-	ret = drm_encoder_init(dev, encoder, &mgag200_bmc_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		return ret;
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-
-	bmc_connector = &mdev->output.bmc.bmc_connector;
-	ret = mgag200_bmc_connector_init(dev, bmc_connector, physical_connector);
-	if (ret)
-		return ret;
-	connector = &bmc_connector->base;
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret)
-		return ret;
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 1301d3066a49..4760ba92871b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -188,11 +188,6 @@ static inline struct mgag200_crtc_state *to_mgag200_crtc_state(struct drm_crtc_s
 	return container_of(base, struct mgag200_crtc_state, base);
 }
 
-struct mgag200_bmc_connector {
-	struct drm_connector base;
-	struct drm_connector *physical_connector;
-};
-
 enum mga_type {
 	G200_PCI,
 	G200_AGP,
@@ -283,10 +278,6 @@ struct mga_device {
 			struct drm_encoder encoder;
 			struct drm_connector connector;
 		} vga;
-		struct {
-			struct drm_encoder encoder;
-			struct mgag200_bmc_connector bmc_connector;
-		} bmc;
 	} output;
 };
 
@@ -446,6 +437,5 @@ int mgag200_vga_output_init(struct mga_device *mdev);
 /* mgag200_bmc.c */
 void mgag200_bmc_stop_scanout(struct mga_device *mdev);
 void mgag200_bmc_start_scanout(struct mga_device *mdev);
-int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector);
 
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 1824c0e59c03..09ced65c1d2f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -219,10 +219,6 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 9cb2a165e460..5daa469137bd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -123,10 +123,6 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index b99b308a7e54..09cfffafe130 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -259,10 +259,6 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 717e4357adcc..3d48baa91d8b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -260,10 +260,6 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 7a2806be2d2e..dabc778e64e8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -132,10 +132,6 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 0db7e14e3328..9dcbe8304271 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -391,10 +391,6 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index cb971ca5e306..83a24aedbf2f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -266,10 +266,6 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
-- 
2.46.0

