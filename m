Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D987392625B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8F110E867;
	Wed,  3 Jul 2024 13:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="s4DDirOR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QQKkgIdc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s4DDirOR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QQKkgIdc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6E010E85D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:55:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5CD171F453;
 Wed,  3 Jul 2024 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720014906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rzWqaBQQIkQjGkOrHzxZhHCHLyfVQ6yWMLOqtAOfqg=;
 b=s4DDirORR1L5eJ9RZ0t2lE65f351+XNNVqHOlBomF0ehflShYMkkncTLE/g1LWPD3TurS8
 gQN0R1WPIHqn9Fz1TgXLpDHlDACbt2OL8NxM4d6gKUB7QtFQkDvlKgdx+0GXj2r2CQ0Hjj
 a0lxdtTG6y9v4z3iCJJEdDVxPLQ6mS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720014906;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rzWqaBQQIkQjGkOrHzxZhHCHLyfVQ6yWMLOqtAOfqg=;
 b=QQKkgIdcWb7NY4uvivO4FuQXGT3BN3MIeJ+WaOCLHAGaaxMDBaekiY9BzfL/L2OBJ1YKgv
 MBG2YYlJ3gkcwHAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=s4DDirOR;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QQKkgIdc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720014906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rzWqaBQQIkQjGkOrHzxZhHCHLyfVQ6yWMLOqtAOfqg=;
 b=s4DDirORR1L5eJ9RZ0t2lE65f351+XNNVqHOlBomF0ehflShYMkkncTLE/g1LWPD3TurS8
 gQN0R1WPIHqn9Fz1TgXLpDHlDACbt2OL8NxM4d6gKUB7QtFQkDvlKgdx+0GXj2r2CQ0Hjj
 a0lxdtTG6y9v4z3iCJJEdDVxPLQ6mS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720014906;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rzWqaBQQIkQjGkOrHzxZhHCHLyfVQ6yWMLOqtAOfqg=;
 b=QQKkgIdcWb7NY4uvivO4FuQXGT3BN3MIeJ+WaOCLHAGaaxMDBaekiY9BzfL/L2OBJ1YKgv
 MBG2YYlJ3gkcwHAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2622213974;
 Wed,  3 Jul 2024 13:55:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YIILCDpYhWZSMwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Jul 2024 13:55:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/4] drm/mgag200: Start/stop BMC scanout in BMC encoder helpers
Date: Wed,  3 Jul 2024 15:40:04 +0200
Message-ID: <20240703135502.29190-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703135502.29190-1-tzimmermann@suse.de>
References: <20240703135502.29190-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FROM_HAS_DN(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5CD171F453
X-Spam-Flag: NO
X-Spam-Score: -3.01
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

Start and stop the BMC scanout from the BMC encoder's atomic_enable
and atomic_disable helpers. The BMC stops scanning out at the beginning
of a modeset operation and restarts the scanout at the end of the
modeset.

Only G200EW3 and G200WB require this procedure. Drop the original
vidrst callbacks for these model's support, as they are now obsolete.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_bmc.c     | 24 +++++++++++++++++++++--
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  4 +---
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 --
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 --
 4 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
index cb5400333862..74feb6d8db45 100644
--- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
@@ -14,7 +14,7 @@ static struct mgag200_bmc_connector *to_mgag200_bmc_connector(struct drm_connect
 	return container_of(connector, struct mgag200_bmc_connector, base);
 }
 
-void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
+static void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
 {
 	u8 tmp;
 	int iter_max;
@@ -73,7 +73,16 @@ void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
 	}
 }
 
-void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
+static void mgag200_bmc_encoder_helper_atomic_disable(struct drm_encoder *encoder,
+						      struct drm_atomic_state *state)
+{
+	struct mga_device *mdev = to_mga_device(encoder->dev);
+
+	if (mdev->info->has_vidrst)
+		mgag200_bmc_disable_vidrst(mdev);
+}
+
+static void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
 {
 	u8 tmp;
 
@@ -103,6 +112,15 @@ void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
 	WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
 }
 
+static void mgag200_bmc_encoder_helper_atomic_enable(struct drm_encoder *encoder,
+						     struct drm_atomic_state *state)
+{
+	struct mga_device *mdev = to_mga_device(encoder->dev);
+
+	if (mdev->info->has_vidrst)
+		mgag200_bmc_enable_vidrst(mdev);
+}
+
 static int mgag200_bmc_encoder_helper_atomic_check(struct drm_encoder *encoder,
 						   struct drm_crtc_state *crtc_state,
 						   struct drm_connector_state *conn_state)
@@ -119,6 +137,8 @@ static int mgag200_bmc_encoder_helper_atomic_check(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs mgag200_bmc_encoder_helper_funcs = {
+	.atomic_disable = mgag200_bmc_encoder_helper_atomic_disable,
+	.atomic_enable = mgag200_bmc_encoder_helper_atomic_enable,
 	.atomic_check = mgag200_bmc_encoder_helper_atomic_check,
 };
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 4b75613de882..b1365795234b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -442,9 +442,7 @@ int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_avail
 /* mgag200_vga.c */
 int mgag200_vga_output_init(struct mga_device *mdev);
 
-				/* mgag200_bmc.c */
-void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
-void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
+/* mgag200_bmc.c */
 int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector);
 
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 839401e8b465..265f3e95830a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -146,8 +146,6 @@ static const struct mgag200_device_info mgag200_g200ew3_device_info =
 	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, true, 0, 1, false);
 
 static const struct mgag200_device_funcs mgag200_g200ew3_device_funcs = {
-	.disable_vidrst = mgag200_bmc_disable_vidrst,
-	.enable_vidrst = mgag200_bmc_enable_vidrst,
 	.pixpllc_atomic_check = mgag200_g200ew3_pixpllc_atomic_check,
 	.pixpllc_atomic_update = mgag200_g200wb_pixpllc_atomic_update, // same as G200WB
 };
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 835df0f4fc13..e25477347c3e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -280,8 +280,6 @@ static const struct mgag200_device_info mgag200_g200wb_device_info =
 	MGAG200_DEVICE_INFO_INIT(1280, 1024, 31877, true, 0, 1, false);
 
 static const struct mgag200_device_funcs mgag200_g200wb_device_funcs = {
-	.disable_vidrst = mgag200_bmc_disable_vidrst,
-	.enable_vidrst = mgag200_bmc_enable_vidrst,
 	.pixpllc_atomic_check = mgag200_g200wb_pixpllc_atomic_check,
 	.pixpllc_atomic_update = mgag200_g200wb_pixpllc_atomic_update,
 };
-- 
2.45.2

