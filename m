Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB7926259
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA3A10E865;
	Wed,  3 Jul 2024 13:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IQpuZURL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KLixgJRI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IQpuZURL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KLixgJRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C19910E85D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:55:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97EFF21BC7;
 Wed,  3 Jul 2024 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720014906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0j9zRs0BYCV3mJsezWYV3hp2FBUrC91dw4YLsbDTic0=;
 b=IQpuZURLS9Kegl6cKU1d9Owc/DwlUTc9qodyTXP3x+tB6kVYbpX5qKaJr4syY3x33CAZ23
 sKyhlLDrs24ePjYwuRs0MipD6PF1Yzek64x58KkiPTlaOthKu6uRARyHL/ZIE1fq5H7/e/
 x42Bww7ULAKFMGEMli7l6HAwk3Ajgas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720014906;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0j9zRs0BYCV3mJsezWYV3hp2FBUrC91dw4YLsbDTic0=;
 b=KLixgJRIDWkMxLRKuVuz3pHol9qqYrq5xPMezUYzQjAZ56NTpyBlQ8pHNdggvT2ODbhglo
 VmJjO/0S5V0oL4Dg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IQpuZURL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KLixgJRI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720014906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0j9zRs0BYCV3mJsezWYV3hp2FBUrC91dw4YLsbDTic0=;
 b=IQpuZURLS9Kegl6cKU1d9Owc/DwlUTc9qodyTXP3x+tB6kVYbpX5qKaJr4syY3x33CAZ23
 sKyhlLDrs24ePjYwuRs0MipD6PF1Yzek64x58KkiPTlaOthKu6uRARyHL/ZIE1fq5H7/e/
 x42Bww7ULAKFMGEMli7l6HAwk3Ajgas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720014906;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0j9zRs0BYCV3mJsezWYV3hp2FBUrC91dw4YLsbDTic0=;
 b=KLixgJRIDWkMxLRKuVuz3pHol9qqYrq5xPMezUYzQjAZ56NTpyBlQ8pHNdggvT2ODbhglo
 VmJjO/0S5V0oL4Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6292D13A7F;
 Wed,  3 Jul 2024 13:55:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YGLgFjpYhWZSMwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Jul 2024 13:55:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/4] drm/mgag200: Remove vidrst callbacks from struct
 mgag200_device_funcs
Date: Wed,  3 Jul 2024 15:40:05 +0200
Message-ID: <20240703135502.29190-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703135502.29190-1-tzimmermann@suse.de>
References: <20240703135502.29190-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 97EFF21BC7
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
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

The callbacks disable_vidrst and enable_vidrst are obsolete and unused.
Their functionality has been integrated into the BMC's encoder. Remove
the fields from struct mgag200_device_funcs.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h    | 12 ------------
 drivers/gpu/drm/mgag200/mgag200_g200er.c |  6 ------
 drivers/gpu/drm/mgag200/mgag200_g200ev.c |  6 ------
 drivers/gpu/drm/mgag200/mgag200_g200se.c |  6 ------
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 13 -------------
 5 files changed, 43 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index b1365795234b..64ba8a7118dc 100644
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
index abfbed6ec390..3ab3efe74d69 100644
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
 
@@ -208,9 +205,6 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 		mgag200_crtc_set_gamma_linear(mdev, format);
 
 	mgag200_enable_display(mdev);
-
-	if (funcs->enable_vidrst)
-		funcs->enable_vidrst(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index acc99999e2b5..703aff7e7dc1 100644
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
 
@@ -209,9 +206,6 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 		mgag200_crtc_set_gamma_linear(mdev, format);
 
 	mgag200_enable_display(mdev);
-
-	if (funcs->enable_vidrst)
-		funcs->enable_vidrst(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index be4e124102c6..9a26c02c4c79 100644
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
 
@@ -340,9 +337,6 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 		mgag200_crtc_set_gamma_linear(mdev, format);
 
 	mgag200_enable_display(mdev);
-
-	if (funcs->enable_vidrst)
-		funcs->enable_vidrst(mdev);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 4f4612192e30..abf64ffe2158 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -654,9 +654,6 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	const struct drm_format_info *format = mgag200_crtc_state->format;
 
-	if (funcs->disable_vidrst)
-		funcs->disable_vidrst(mdev);
-
 	mgag200_set_format_regs(mdev, format);
 	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
 
@@ -669,23 +666,13 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 		mgag200_crtc_set_gamma_linear(mdev, format);
 
 	mgag200_enable_display(mdev);
-
-	if (funcs->enable_vidrst)
-		funcs->enable_vidrst(mdev);
 }
 
 void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
 	struct mga_device *mdev = to_mga_device(crtc->dev);
-	const struct mgag200_device_funcs *funcs = mdev->funcs;
-
-	if (funcs->disable_vidrst)
-		funcs->disable_vidrst(mdev);
 
 	mgag200_disable_display(mdev);
-
-	if (funcs->enable_vidrst)
-		funcs->enable_vidrst(mdev);
 }
 
 void mgag200_crtc_reset(struct drm_crtc *crtc)
-- 
2.45.2

