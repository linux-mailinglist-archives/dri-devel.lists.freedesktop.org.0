Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E5893116D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 11:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCA010E2D4;
	Mon, 15 Jul 2024 09:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gsrl6zX9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ab/GbUR1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gsrl6zX9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ab/GbUR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C16510E319
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:39:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 056EF1F80F;
 Mon, 15 Jul 2024 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDLNzHaROvJiDjWphRUP69Fyd52ng3MfabQkcumg978=;
 b=gsrl6zX9lU8+QinQVUoppFMmyAa7zMo+urgqkyp70DHTTn8nanBtGc+8nIrsISS+po3z4z
 emnp7OMuaw9ukZajRKL+9hCAdSAhDzdqOiSIX/CAJD4UJr81O5tRkPtJNxNyj9FIZtQhp3
 m0DA4BZk6mzxWfqzydRGKgicCc6uFBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036388;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDLNzHaROvJiDjWphRUP69Fyd52ng3MfabQkcumg978=;
 b=ab/GbUR1qHMsM7w7I/PYIb/ePCIFC10oxvI9mM8o54a8TvbpcvMjcm6LiuZoj58k3hvahy
 iUM8ifj8pQc25NAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gsrl6zX9;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="ab/GbUR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDLNzHaROvJiDjWphRUP69Fyd52ng3MfabQkcumg978=;
 b=gsrl6zX9lU8+QinQVUoppFMmyAa7zMo+urgqkyp70DHTTn8nanBtGc+8nIrsISS+po3z4z
 emnp7OMuaw9ukZajRKL+9hCAdSAhDzdqOiSIX/CAJD4UJr81O5tRkPtJNxNyj9FIZtQhp3
 m0DA4BZk6mzxWfqzydRGKgicCc6uFBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036388;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDLNzHaROvJiDjWphRUP69Fyd52ng3MfabQkcumg978=;
 b=ab/GbUR1qHMsM7w7I/PYIb/ePCIFC10oxvI9mM8o54a8TvbpcvMjcm6LiuZoj58k3hvahy
 iUM8ifj8pQc25NAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1C0A1395F;
 Mon, 15 Jul 2024 09:39:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EFocLmPulGbTEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jul 2024 09:39:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/7] drm/mgag200: Remove struct mgag200_bmc_connector
Date: Mon, 15 Jul 2024 11:39:03 +0200
Message-ID: <20240715093936.793552-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715093936.793552-1-tzimmermann@suse.de>
References: <20240715093936.793552-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
 RCPT_COUNT_SEVEN(0.00)[8];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 056EF1F80F
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
connector and set BMC status accordingly. This functionality has
been moved into probe helpers. The BMC is always connected and the
helpers compute the correct status. Hence, remove the driver's
dedicated code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_bmc.c     | 44 +++--------------------
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  9 ++---
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 +-
 9 files changed, 13 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
index 45e35dffb3ea..1e0537f9cbea 100644
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
@@ -107,30 +102,6 @@ static const struct drm_encoder_funcs mgag200_bmc_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
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
 static int mgag200_bmc_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
@@ -142,7 +113,6 @@ static int mgag200_bmc_connector_helper_get_modes(struct drm_connector *connecto
 
 static const struct drm_connector_helper_funcs mgag200_bmc_connector_helper_funcs = {
 	.get_modes = mgag200_bmc_connector_helper_get_modes,
-	.detect_ctx = mgag200_bmc_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs mgag200_bmc_connector_funcs = {
@@ -154,10 +124,8 @@ static const struct drm_connector_funcs mgag200_bmc_connector_funcs = {
 };
 
 static int mgag200_bmc_connector_init(struct drm_device *dev,
-				      struct mgag200_bmc_connector *bmc_connector,
-				      struct drm_connector *physical_connector)
+				      struct drm_connector *connector)
 {
-	struct drm_connector *connector = &bmc_connector->base;
 	int ret;
 
 	ret = drm_connector_init(dev, connector, &mgag200_bmc_connector_funcs,
@@ -166,17 +134,14 @@ static int mgag200_bmc_connector_init(struct drm_device *dev,
 		return ret;
 	drm_connector_helper_add(connector, &mgag200_bmc_connector_helper_funcs);
 
-	bmc_connector->physical_connector = physical_connector;
-
 	return 0;
 }
 
-int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector)
+int mgag200_bmc_output_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	struct drm_crtc *crtc = &mdev->crtc;
 	struct drm_encoder *encoder;
-	struct mgag200_bmc_connector *bmc_connector;
 	struct drm_connector *connector;
 	int ret;
 
@@ -187,11 +152,10 @@ int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physi
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	bmc_connector = &mdev->output.bmc.bmc_connector;
-	ret = mgag200_bmc_connector_init(dev, bmc_connector, physical_connector);
+	connector = &mdev->output.bmc.connector;
+	ret = mgag200_bmc_connector_init(dev, connector);
 	if (ret)
 		return ret;
-	connector = &bmc_connector->base;
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index f97eaa49b089..abc7a58ed762 100644
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
@@ -285,7 +280,7 @@ struct mga_device {
 		} vga;
 		struct {
 			struct drm_encoder encoder;
-			struct mgag200_bmc_connector bmc_connector;
+			struct drm_connector connector;
 		} bmc;
 	} output;
 };
@@ -433,6 +428,6 @@ int mgag200_vga_output_init(struct mga_device *mdev);
 /* mgag200_bmc.c */
 void mgag200_bmc_stop_scanout(struct mga_device *mdev);
 void mgag200_bmc_start_scanout(struct mga_device *mdev);
-int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector);
+int mgag200_bmc_output_init(struct mga_device *mdev);
 
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index c8204e8a1daf..a0f860c394b3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -218,7 +218,7 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	ret = mgag200_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 749baefb0a7e..a7373d6572e7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -122,7 +122,7 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	ret = mgag200_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index e8c84d3258aa..0407ee540b20 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -258,7 +258,7 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	ret = mgag200_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index e2b13a90b405..51530831d5f0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -259,7 +259,7 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	ret = mgag200_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 384041e7b839..f18122230ffb 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -131,7 +131,7 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	ret = mgag200_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 95514dcb8c53..847f0859cf62 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -390,7 +390,7 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	ret = mgag200_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 0100b4d03b89..be60237680ca 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -265,7 +265,7 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
 	if (ret)
 		return ret;
 
-	ret = mgag200_bmc_output_init(mdev, &mdev->output.vga.connector);
+	ret = mgag200_bmc_output_init(mdev);
 	if (ret)
 		return ret;
 
-- 
2.45.2

