Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EAD92CD63
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 10:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06C410E6C3;
	Wed, 10 Jul 2024 08:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="J/vzDEWz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N0U4Ds0l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J/vzDEWz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N0U4Ds0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B40110E6C0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:46:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3AE4121B4F;
 Wed, 10 Jul 2024 08:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720601172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnnWz4pX2/0MGem7dgB1ouaNxEyjnmYeT41TmGzZLG8=;
 b=J/vzDEWzIvsm8dX+3Lxs1ViBU5H7Uw87OjL9Kv6j1/WG2j68WIJLlrIJ3lsTjtzjScqN5U
 vkgc8u57wj+OBtj/hR1GgNLebSI/TC9z9QUfet88Z9pzejvihyZ8Y4PtvPaJAGs0HeTbya
 61cN/Vy0c76cWsz+qqXqKaDD6tWZ/fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720601172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnnWz4pX2/0MGem7dgB1ouaNxEyjnmYeT41TmGzZLG8=;
 b=N0U4Ds0lyU5sstO5rgX0A7b88cRnI/whHQ8A1FzD4XoORS1LD12QtfSssrWW3MvkUCYlv/
 n+cWBXRq84PUTdBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720601172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnnWz4pX2/0MGem7dgB1ouaNxEyjnmYeT41TmGzZLG8=;
 b=J/vzDEWzIvsm8dX+3Lxs1ViBU5H7Uw87OjL9Kv6j1/WG2j68WIJLlrIJ3lsTjtzjScqN5U
 vkgc8u57wj+OBtj/hR1GgNLebSI/TC9z9QUfet88Z9pzejvihyZ8Y4PtvPaJAGs0HeTbya
 61cN/Vy0c76cWsz+qqXqKaDD6tWZ/fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720601172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnnWz4pX2/0MGem7dgB1ouaNxEyjnmYeT41TmGzZLG8=;
 b=N0U4Ds0lyU5sstO5rgX0A7b88cRnI/whHQ8A1FzD4XoORS1LD12QtfSssrWW3MvkUCYlv/
 n+cWBXRq84PUTdBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 02B551369A;
 Wed, 10 Jul 2024 08:46:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yPEKO1NKjmYNSwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Jul 2024 08:46:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/3] drm/mgag200: Remove vidrst callbacks from struct
 mgag200_device_funcs
Date: Wed, 10 Jul 2024 10:42:33 +0200
Message-ID: <20240710084609.354578-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710084609.354578-1-tzimmermann@suse.de>
References: <20240710084609.354578-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
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

The callbacks disable_vidrst and enable_vidrst are obsolete. Remove
the fields from struct mgag200_device_funcs. Instead call their
implementations directly of the field 'has_vidrst' has been set in
struct mgag200_device_info.

Also change the logic slightly. The BMC used to start and stop scanout
during the CRTC's atomic_enable and atomic_disable. Plane updates were
done while the BMC scanned out the display. Now only stop once in
atomic_disable at the beginning of a modeset and then restart the
scanout at the end of a modeset in atomic_enable. While the modeset
takes place, the BMC does not scanout at all.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 12 ------------
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  7 ++-----
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  7 ++-----
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 --
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |  7 ++-----
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 --
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 15 ++++-----------
 7 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 4b75613de882..4a46c8c006c8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -247,18 +247,6 @@ struct mgag200_device_info {
 	}
 
 struct mgag200_device_funcs {
-	/*
-	 * Disables an external reset source (i.e., BMC) before programming
-	 * a new display mode.
-	 */
-	void (*disable_vidrst)(struct mga_device *mdev);
-
-	/*
-	 * Enables an external reset source (i.e., BMC) after programming
-	 * a new display mode.
-	 */
-	void (*enable_vidrst)(struct mga_device *mdev);
-
 	/*
 	 * Validate that the given state can be programmed into PIXPLLC. On
 	 * success, the calculated parameters should be stored in the CRTC's
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index abfbed6ec390..b3bb3e9fb0d1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -191,9 +191,6 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	const struct drm_format_info *format = mgag200_crtc_state->format;
 
-	if (funcs->disable_vidrst)
-		funcs->disable_vidrst(mdev);
-
 	mgag200_set_format_regs(mdev, format);
 	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
 
@@ -209,8 +206,8 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (funcs->enable_vidrst)
-		funcs->enable_vidrst(mdev);
+	if (mdev->info->has_vidrst)
+		mgag200_bmc_enable_vidrst(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index acc99999e2b5..3ac0a508e2c5 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -192,9 +192,6 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	const struct drm_format_info *format = mgag200_crtc_state->format;
 
-	if (funcs->disable_vidrst)
-		funcs->disable_vidrst(mdev);
-
 	mgag200_set_format_regs(mdev, format);
 	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
 
@@ -210,8 +207,8 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (funcs->enable_vidrst)
-		funcs->enable_vidrst(mdev);
+	if (mdev->info->has_vidrst)
+		mgag200_bmc_enable_vidrst(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
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
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index be4e124102c6..7a8099eb100c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -323,9 +323,6 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	const struct drm_format_info *format = mgag200_crtc_state->format;
 
-	if (funcs->disable_vidrst)
-		funcs->disable_vidrst(mdev);
-
 	mgag200_set_format_regs(mdev, format);
 	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
 
@@ -341,8 +338,8 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	mgag200_enable_display(mdev);
 
-	if (funcs->enable_vidrst)
-		funcs->enable_vidrst(mdev);
+	if (mdev->info->has_vidrst)
+		mgag200_bmc_enable_vidrst(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
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
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index e746f365fecf..fcc10723d385 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -657,9 +657,6 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	const struct drm_format_info *format = mgag200_crtc_state->format;
 
-	if (funcs->disable_vidrst)
-		funcs->disable_vidrst(mdev);
-
 	mgag200_set_format_regs(mdev, format);
 	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
 
@@ -673,22 +670,18 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 
 	mgag200_enable_display(mdev);
 
-	if (funcs->enable_vidrst)
-		funcs->enable_vidrst(mdev);
+	if (mdev->info->has_vidrst)
+		mgag200_bmc_enable_vidrst(mdev);
 }
 
 void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct mga_device *mdev = to_mga_device(crtc->dev);
-	const struct mgag200_device_funcs *funcs = mdev->funcs;
 
-	if (funcs->disable_vidrst)
-		funcs->disable_vidrst(mdev);
+	if (mdev->info->has_vidrst)
+		mgag200_bmc_disable_vidrst(mdev);
 
 	mgag200_disable_display(mdev);
-
-	if (funcs->enable_vidrst)
-		funcs->enable_vidrst(mdev);
 }
 
 void mgag200_crtc_reset(struct drm_crtc *crtc)
-- 
2.45.2

