Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D3928831
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A952410EB8D;
	Fri,  5 Jul 2024 11:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kEBS5oz0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6ypd51Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kEBS5oz0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6ypd51Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B15010EB78
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:49:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1793921967;
 Fri,  5 Jul 2024 11:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EUM3utw+hLLeabBiVBLexld4h7DI2LoWbycfuV8TdA=;
 b=kEBS5oz00dfe7d0VlXVZKMjtW4IhZeb3y41FUZ7z8LfxnQI7bZYIl5N+Yl4ayGlid+V/ax
 Hh2IHCQbxw5yc7dOJoxU/oBKvhmBRxD2jSehxr+Yzu0qaO4tsH7oGwSC1SJtxAfScegghe
 19JggWE6Iz6+kt25q+PLxsMS/tNRlEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180148;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EUM3utw+hLLeabBiVBLexld4h7DI2LoWbycfuV8TdA=;
 b=E6ypd51Qs2STuH9hEwaBxXyu7xlx8011rt54NEefm5sagbAbpzJbyqJsuMbyERFM32bvjF
 xmvALOrsGOXH1MDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EUM3utw+hLLeabBiVBLexld4h7DI2LoWbycfuV8TdA=;
 b=kEBS5oz00dfe7d0VlXVZKMjtW4IhZeb3y41FUZ7z8LfxnQI7bZYIl5N+Yl4ayGlid+V/ax
 Hh2IHCQbxw5yc7dOJoxU/oBKvhmBRxD2jSehxr+Yzu0qaO4tsH7oGwSC1SJtxAfScegghe
 19JggWE6Iz6+kt25q+PLxsMS/tNRlEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180148;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EUM3utw+hLLeabBiVBLexld4h7DI2LoWbycfuV8TdA=;
 b=E6ypd51Qs2STuH9hEwaBxXyu7xlx8011rt54NEefm5sagbAbpzJbyqJsuMbyERFM32bvjF
 xmvALOrsGOXH1MDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB4D213974;
 Fri,  5 Jul 2024 11:49:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KOZ1MLPdh2bUcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Jul 2024 11:49:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 7/7] drm/mgag200: Implement struct
 drm_crtc_funcs.get_vblank_timestamp
Date: Fri,  5 Jul 2024 13:47:50 +0200
Message-ID: <20240705114900.572-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705114900.572-1-tzimmermann@suse.de>
References: <20240705114900.572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FROM_HAS_DN(0.00)[]; TAGGED_RCPT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Implement struct drm_crtc_funcs.get_vblank_timestamp with the DRM
helper drm_crtc_vblank_helper_get_vblank_timestamp() with its helper
get_scanout_position. Read the scanout position from the MGAREG_VCOUNT
register.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  | 10 ++++++++--
 drivers/gpu/drm/mgag200/mgag200_mode.c | 25 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index f7b22b195016..acfa05335b09 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -410,13 +410,18 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
 void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
 void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
 void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
+bool mgag200_crtc_helper_get_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
+					      int *vpos, int *hpos,
+					      ktime_t *stime, ktime_t *etime,
+					      const struct drm_display_mode *mode);
 
 #define MGAG200_CRTC_HELPER_FUNCS \
 	.mode_valid = mgag200_crtc_helper_mode_valid, \
 	.atomic_check = mgag200_crtc_helper_atomic_check, \
 	.atomic_flush = mgag200_crtc_helper_atomic_flush, \
 	.atomic_enable = mgag200_crtc_helper_atomic_enable, \
-	.atomic_disable = mgag200_crtc_helper_atomic_disable
+	.atomic_disable = mgag200_crtc_helper_atomic_disable, \
+	.get_scanout_position = mgag200_crtc_helper_get_scanout_position
 
 void mgag200_crtc_reset(struct drm_crtc *crtc);
 struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc);
@@ -432,7 +437,8 @@ void mgag200_crtc_disable_vblank(struct drm_crtc *crtc);
 	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
 	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state, \
 	.enable_vblank = mgag200_crtc_enable_vblank, \
-	.disable_vblank = mgag200_crtc_disable_vblank
+	.disable_vblank = mgag200_crtc_disable_vblank, \
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp
 
 void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode);
 void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_info *format);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index ec6fb1277d6e..fb03422c763b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -718,6 +718,31 @@ void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic
 		funcs->enable_vidrst(mdev);
 }
 
+bool mgag200_crtc_helper_get_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
+					      int *vpos, int *hpos,
+					      ktime_t *stime, ktime_t *etime,
+					      const struct drm_display_mode *mode)
+{
+	struct mga_device *mdev = to_mga_device(crtc->dev);
+	u32 vcount;
+
+	if (stime)
+		*stime = ktime_get();
+
+	if (vpos) {
+		vcount = RREG32(MGAREG_VCOUNT);
+		*vpos = vcount & GENMASK(11, 0);
+	}
+
+	if (hpos)
+		*hpos = mode->htotal >> 1; // near middle of scanline on average
+
+	if (etime)
+		*etime = ktime_get();
+
+	return true;
+}
+
 void mgag200_crtc_reset(struct drm_crtc *crtc)
 {
 	struct mgag200_crtc_state *mgag200_crtc_state;
-- 
2.45.2

