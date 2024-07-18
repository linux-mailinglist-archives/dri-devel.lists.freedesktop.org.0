Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4C934BDD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8906510E75F;
	Thu, 18 Jul 2024 10:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB0910E745
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 10:45:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C70331FBCD;
 Thu, 18 Jul 2024 10:45:56 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84EF3136F7;
 Thu, 18 Jul 2024 10:45:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cNtJH2TymGbeUAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Jul 2024 10:45:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 7/7] drm/mgag200: Implement struct
 drm_crtc_funcs.get_vblank_timestamp
Date: Thu, 18 Jul 2024 12:44:17 +0200
Message-ID: <20240718104551.575912-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718104551.575912-1-tzimmermann@suse.de>
References: <20240718104551.575912-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: C70331FBCD
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 TAGGED_RCPT(0.00)[]
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Score: -4.00
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
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  | 10 ++++++++--
 drivers/gpu/drm/mgag200/mgag200_mode.c | 25 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 829d32f50915..8df3c84d2405 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -400,13 +400,18 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
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
@@ -422,7 +427,8 @@ void mgag200_crtc_disable_vblank(struct drm_crtc *crtc);
 	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
 	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state, \
 	.enable_vblank = mgag200_crtc_enable_vblank, \
-	.disable_vblank = mgag200_crtc_disable_vblank
+	.disable_vblank = mgag200_crtc_disable_vblank, \
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp
 
 void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode,
 			   bool set_vidrst);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index afabf693df64..dd125ef15559 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -714,6 +714,31 @@ void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic
 	mgag200_disable_display(mdev);
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

