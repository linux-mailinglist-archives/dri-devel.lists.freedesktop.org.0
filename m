Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4D692CD64
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 10:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F5F10E6BD;
	Wed, 10 Jul 2024 08:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="n88jUJGu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bGaazXYy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n88jUJGu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bGaazXYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E735110E6BE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:46:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7CCF821B50;
 Wed, 10 Jul 2024 08:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720601172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsGN98OQ9PDta6uXd3uV2HEUHQNIiMAaLCYufWrkuSs=;
 b=n88jUJGusLSm1wo9ihfv7xCEupMtN5Mu+bU+0pmsJISmIiII0oF6XhTm9ZoKHxtl7PAQS+
 nZsCRRFdpeg+q3DpzN4i8wM8NdoVVFK2vFWdl6gtNUW8gfshvjWU2CiLqdfh+/TgcnWHjQ
 LRvvgwxnZH0KYz9X/LIf6UCjnL8P8A4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720601172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsGN98OQ9PDta6uXd3uV2HEUHQNIiMAaLCYufWrkuSs=;
 b=bGaazXYySG7wJl8MAVazvndBM8n1/L5bsh2nCIoPqRX9SPyQHYhGEqsIpw3U8flsQm3zw3
 jSg4Dc54iodR9RBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720601172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsGN98OQ9PDta6uXd3uV2HEUHQNIiMAaLCYufWrkuSs=;
 b=n88jUJGusLSm1wo9ihfv7xCEupMtN5Mu+bU+0pmsJISmIiII0oF6XhTm9ZoKHxtl7PAQS+
 nZsCRRFdpeg+q3DpzN4i8wM8NdoVVFK2vFWdl6gtNUW8gfshvjWU2CiLqdfh+/TgcnWHjQ
 LRvvgwxnZH0KYz9X/LIf6UCjnL8P8A4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720601172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsGN98OQ9PDta6uXd3uV2HEUHQNIiMAaLCYufWrkuSs=;
 b=bGaazXYySG7wJl8MAVazvndBM8n1/L5bsh2nCIoPqRX9SPyQHYhGEqsIpw3U8flsQm3zw3
 jSg4Dc54iodR9RBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4272C13942;
 Wed, 10 Jul 2024 08:46:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EInpDlRKjmYNSwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Jul 2024 08:46:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/3] drm/mgag200: Rename BMC vidrst names
Date: Wed, 10 Jul 2024 10:42:34 +0200
Message-ID: <20240710084609.354578-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710084609.354578-1-tzimmermann@suse.de>
References: <20240710084609.354578-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
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

The BMC's scanout synchronization is only indirectly related to the
VIDRST functionality. Do some renaming.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_bmc.c    |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_drv.h    | 14 +++++++-------
 drivers/gpu/drm/mgag200/mgag200_g200er.c |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_g200ev.c |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_g200se.c |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 10 +++++-----
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
index 1c7aa4f36787..45e35dffb3ea 100644
--- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
@@ -14,7 +14,7 @@ static struct mgag200_bmc_connector *to_mgag200_bmc_connector(struct drm_connect
 	return container_of(connector, struct mgag200_bmc_connector, base);
 }
 
-void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
+void mgag200_bmc_stop_scanout(struct mga_device *mdev)
 {
 	u8 tmp;
 	int iter_max;
@@ -73,7 +73,7 @@ void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
 	}
 }
 
-void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
+void mgag200_bmc_start_scanout(struct mga_device *mdev)
 {
 	u8 tmp;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 4a46c8c006c8..f97eaa49b089 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -216,8 +216,8 @@ struct mgag200_device_info {
 	 */
 	unsigned long max_mem_bandwidth;
 
-	/* HW has external source (e.g., BMC) to synchronize with */
-	bool has_vidrst:1;
+	/* Synchronize scanout with BMC */
+	bool sync_bmc:1;
 
 	struct {
 		unsigned data_bit:3;
@@ -232,13 +232,13 @@ struct mgag200_device_info {
 };
 
 #define MGAG200_DEVICE_INFO_INIT(_max_hdisplay, _max_vdisplay, _max_mem_bandwidth, \
-				 _has_vidrst, _i2c_data_bit, _i2c_clock_bit, \
+				 _sync_bmc, _i2c_data_bit, _i2c_clock_bit, \
 				 _bug_no_startadd) \
 	{ \
 		.max_hdisplay = (_max_hdisplay), \
 		.max_vdisplay = (_max_vdisplay), \
 		.max_mem_bandwidth = (_max_mem_bandwidth), \
-		.has_vidrst = (_has_vidrst), \
+		.sync_bmc = (_sync_bmc), \
 		.i2c = { \
 			.data_bit = (_i2c_data_bit), \
 			.clock_bit = (_i2c_clock_bit), \
@@ -430,9 +430,9 @@ int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_avail
 /* mgag200_vga.c */
 int mgag200_vga_output_init(struct mga_device *mdev);
 
-				/* mgag200_bmc.c */
-void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
-void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
+/* mgag200_bmc.c */
+void mgag200_bmc_stop_scanout(struct mga_device *mdev);
+void mgag200_bmc_start_scanout(struct mga_device *mdev);
 int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector);
 
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index b3bb3e9fb0d1..737a48aa9160 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -206,8 +206,8 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->has_vidrst)
-		mgag200_bmc_enable_vidrst(mdev);
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_start_scanout(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 3ac0a508e2c5..8d1ccc2ad94a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -207,8 +207,8 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->has_vidrst)
-		mgag200_bmc_enable_vidrst(mdev);
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_start_scanout(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 7a8099eb100c..cf7f6897838f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -338,8 +338,8 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->has_vidrst)
-		mgag200_bmc_enable_vidrst(mdev);
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_start_scanout(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index fcc10723d385..735eb5906892 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -610,7 +610,7 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
 	if (ret)
 		return ret;
 
-	new_mgag200_crtc_state->set_vidrst = mdev->info->has_vidrst;
+	new_mgag200_crtc_state->set_vidrst = mdev->info->sync_bmc;
 
 	if (new_crtc_state->mode_changed) {
 		if (funcs->pixpllc_atomic_check) {
@@ -670,16 +670,16 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 
 	mgag200_enable_display(mdev);
 
-	if (mdev->info->has_vidrst)
-		mgag200_bmc_enable_vidrst(mdev);
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_start_scanout(mdev);
 }
 
 void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct mga_device *mdev = to_mga_device(crtc->dev);
 
-	if (mdev->info->has_vidrst)
-		mgag200_bmc_disable_vidrst(mdev);
+	if (mdev->info->sync_bmc)
+		mgag200_bmc_stop_scanout(mdev);
 
 	mgag200_disable_display(mdev);
 }
-- 
2.45.2

