Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7887C9023BA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 16:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8799910E14C;
	Mon, 10 Jun 2024 14:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RTNtsqxV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rgTkfL8T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RTNtsqxV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rgTkfL8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D04C10E14C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 14:11:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F22251F7F3;
 Mon, 10 Jun 2024 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718028705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGyd8CfN0KaRVsIP5hHdem1X7CgzVXavcoX3UOAHsVI=;
 b=RTNtsqxVU9Y0BfCX3rKborLB1ez6tNYSFSYK74jYkGiCTgXWJIkQL3EwuvbbtRyq+rWX8J
 2aO/zD6200LTqDYMMNf/wl/v/X65u23sPK5P3oqBfnw92rgJ341lJL3OIui6LHK4T3cbcr
 VhdzUqf2c0b2fhfpwSu+eR7AXZttddk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718028705;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGyd8CfN0KaRVsIP5hHdem1X7CgzVXavcoX3UOAHsVI=;
 b=rgTkfL8TCPMT0XZdWYmUCXPNDFVr61MtcZ+0Y53av//e7SmqJSvkTRqZgV9IdexHpyhd4M
 iIcRgqpLcKdRD3Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718028705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGyd8CfN0KaRVsIP5hHdem1X7CgzVXavcoX3UOAHsVI=;
 b=RTNtsqxVU9Y0BfCX3rKborLB1ez6tNYSFSYK74jYkGiCTgXWJIkQL3EwuvbbtRyq+rWX8J
 2aO/zD6200LTqDYMMNf/wl/v/X65u23sPK5P3oqBfnw92rgJ341lJL3OIui6LHK4T3cbcr
 VhdzUqf2c0b2fhfpwSu+eR7AXZttddk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718028705;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGyd8CfN0KaRVsIP5hHdem1X7CgzVXavcoX3UOAHsVI=;
 b=rgTkfL8TCPMT0XZdWYmUCXPNDFVr61MtcZ+0Y53av//e7SmqJSvkTRqZgV9IdexHpyhd4M
 iIcRgqpLcKdRD3Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC30813A7F;
 Mon, 10 Jun 2024 14:11:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uMejLKAJZ2Z7QQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jun 2024 14:11:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/3] drm/mgag200: Add BMC output
Date: Mon, 10 Jun 2024 16:06:05 +0200
Message-ID: <20240610141141.29527-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610141141.29527-1-tzimmermann@suse.de>
References: <20240610141141.29527-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

The BMC output can be viewed via the BMC's web interface or a
similar client. Represent it as virtual encoder and connector.
It's attached to the same CRTC as the VGA connector.

The connector's status depends on the physical connector's status.
The BMC is only connected if the physical connector is not. This
is necessary to support userspace clients that can only handle a
single output per CRTC.

The BMC is a server feature. Add a BMC output for all server chips,
but not the desktop models.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_bmc.c     | 107 ++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  10 ++
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   4 +
 9 files changed, 145 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
index 2ba2e3c5086a5..23ef85aa7e378 100644
--- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
@@ -2,8 +2,18 @@
 
 #include <linux/delay.h>
 
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_probe_helper.h>
+
 #include "mgag200_drv.h"
 
+static struct mgag200_bmc_connector *to_mgag200_bmc_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct mgag200_bmc_connector, base);
+}
+
 void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
 {
 	u8 tmp;
@@ -97,3 +107,100 @@ void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
 	tmp &= ~0x10;
 	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
 }
+
+static const struct drm_encoder_funcs mgag200_bmc_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static int mgag200_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
+						   struct drm_modeset_acquire_ctx *ctx,
+						   bool force)
+{
+	struct mgag200_bmc_connector *bmc_connector = to_mgag200_bmc_connector(connector);
+	struct drm_connector *physical_connector = bmc_connector->physical_connector;
+
+	/*
+	 * Most user-space compositors cannot handle more than one connected
+	 * connector per CRTC. Hence, we only mark the BMC as connected if the
+	 * physical connector is disconnected. If the physical connector's status
+	 * is connected or unknown, the BMC remains disconnected. This has no
+	 * effect on the output of the BMC.
+	 *
+	 * FIXME: Remove this logic once user-space compositors can handle more
+	 *        than one connector per CRTC. The BMC should always be connected.
+	 */
+
+	if (physical_connector && physical_connector->status == connector_status_disconnected)
+		return connector_status_connected;
+
+	return connector_status_disconnected;
+}
+
+static int mgag200_bmc_connector_helper_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct mga_device *mdev = to_mga_device(dev);
+	const struct mgag200_device_info *minfo = mdev->info;
+
+	return drm_add_modes_noedid(connector, minfo->max_hdisplay, minfo->max_vdisplay);
+}
+
+static const struct drm_connector_helper_funcs mgag200_bmc_connector_helper_funcs = {
+	.get_modes = mgag200_bmc_connector_helper_get_modes,
+	.detect_ctx = mgag200_bmc_connector_helper_detect_ctx,
+};
+
+static const struct drm_connector_funcs mgag200_bmc_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int mgag200_bmc_connector_init(struct drm_device *dev,
+				      struct mgag200_bmc_connector *bmc_connector,
+				      struct drm_connector *physical_connector)
+{
+	struct drm_connector *connector = &bmc_connector->base;
+	int ret;
+
+	ret = drm_connector_init(dev, connector, &mgag200_bmc_connector_funcs,
+				 DRM_MODE_CONNECTOR_VIRTUAL);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(connector, &mgag200_bmc_connector_helper_funcs);
+
+	bmc_connector->physical_connector = physical_connector;
+
+	return 0;
+}
+
+int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_crtc *crtc = &mdev->crtc;
+	struct drm_encoder *encoder;
+	struct mgag200_bmc_connector *bmc_connector;
+	struct drm_connector *connector;
+	int ret;
+
+	encoder = &mdev->output.bmc.encoder;
+	ret = drm_encoder_init(dev, encoder, &mgag200_bmc_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	bmc_connector = &mdev->output.bmc.bmc_connector;
+	ret = mgag200_bmc_connector_init(dev, bmc_connector, physical_connector);
+	if (ret)
+		return ret;
+	connector = &bmc_connector->base;
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index db89fddc26dcb..7f7dfbd0f0134 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -186,6 +186,11 @@ static inline struct mgag200_crtc_state *to_mgag200_crtc_state(struct drm_crtc_s
 	return container_of(base, struct mgag200_crtc_state, base);
 }
 
+struct mgag200_bmc_connector {
+	struct drm_connector base;
+	struct drm_connector *physical_connector;
+};
+
 enum mga_type {
 	G200_PCI,
 	G200_AGP,
@@ -288,6 +293,10 @@ struct mga_device {
 			struct drm_encoder encoder;
 			struct drm_connector connector;
 		} vga;
+		struct {
+			struct drm_encoder encoder;
+			struct mgag200_bmc_connector bmc_connector;
+		} bmc;
 	} output;
 };
 
@@ -433,5 +442,6 @@ int mgag200_vga_output_init(struct mga_device *mdev);
 				/* mgag200_bmc.c */
 void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
 void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
+int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector);
 
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index df00b25efb895..6f31c5249f0b1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -218,6 +218,10 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index be42b1291e357..5befe8da4beb2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -122,6 +122,10 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 6f2c07af38c4f..55c275180cde2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -261,6 +261,10 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 908d04d4c862c..2466126140db6 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -262,6 +262,10 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 8b69af543e2be..a52e60609c3de 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -131,6 +131,10 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 6d7fbdf62b97a..212770acdd477 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -393,6 +393,10 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 564d1f3ecc108..cb6daa0426fbc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -265,6 +265,10 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
+	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.45.2

