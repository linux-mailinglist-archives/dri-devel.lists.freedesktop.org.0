Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA6C3BBD06
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3C289C1F;
	Mon,  5 Jul 2021 12:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0E889915
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:45:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE41522664;
 Mon,  5 Jul 2021 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625489119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTASwHsAuatxHWBKwWzIN5XzfqBqqiwGVAHldWXtwpo=;
 b=pqlYh/VJBfA2JCTAoE4un1q0qfmIW3NmcIyzfF8gnmRCGK9JoriTJqfOG5n2ID24v7r1T+
 8cy/IVi7N0G8cAWlyqUFuyPCKQpaY0Uz3rxtkuJkHA7bCVjEyGKoMPpu3AooUIfLfjkFZI
 KMPQlLA8UiTAkQ1rZJVbJSQIXj9Brp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625489119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTASwHsAuatxHWBKwWzIN5XzfqBqqiwGVAHldWXtwpo=;
 b=HEiSy7pi3T8QF7rLpae8Unw/CkbDq/Fy2CJUA7GApu9ja5rBToRmIK6dkMESUaaoaR53Tt
 zoOLmEy5uVa3QWAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A97D0139F6;
 Mon,  5 Jul 2021 12:45:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gPlTKN/+4mDkcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 12:45:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 emil.velikov@collabora.com, John.p.donnelly@oracle.com
Subject: [PATCH 12/12] drm/mgag200: Compute PLL values during atomic check
Date: Mon,  5 Jul 2021 14:45:15 +0200
Message-Id: <20210705124515.27253-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705124515.27253-1-tzimmermann@suse.de>
References: <20210705124515.27253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PLL setup can fail if the display mode's clock is not supported by
any PLL configuration. Compute the PLL values during atomic check, so
that atomic commits can fail at the appropriate time. If successful,
use the values in the atomic-update phase.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  2 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 20 +++++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index c813d6c15f70..6473e9c037d0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -129,6 +129,8 @@ struct mgag200_pll_values {
 
 struct mgag200_crtc_state {
 	struct drm_crtc_state base;
+
+	struct mgag200_pll_values pixpll;
 };
 
 static inline struct mgag200_crtc_state *to_mgag200_crtc_state(struct drm_crtc_state *base)
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 6a5c419c6641..55c4f76175bd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1802,6 +1802,7 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_rect fullscreen = {
@@ -1810,15 +1811,13 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 		.y1 = 0,
 		.y2 = fb->height,
 	};
-	struct mgag200_pll_values pixpll;
 
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
 		mgag200_g200wb_hold_bmc(mdev);
 
 	mgag200_set_format_regs(mdev, fb);
 	mgag200_set_mode_regs(mdev, adjusted_mode);
-	mgag200_compute_pixpll_values(mdev, adjusted_mode->clock, &pixpll);
-	mgag200_set_pixpll(mdev, &pixpll);
+	mgag200_set_pixpll(mdev, &mgag200_crtc_state->pixpll);
 
 	if (mdev->type == G200_ER)
 		mgag200_g200er_reset_tagfifo(mdev);
@@ -1852,8 +1851,12 @@ mgag200_simple_display_pipe_check(struct drm_simple_display_pipe *pipe,
 				  struct drm_crtc_state *crtc_state)
 {
 	struct drm_plane *plane = plane_state->plane;
+	struct drm_device *dev = plane->dev;
+	struct mga_device *mdev = to_mga_device(dev);
+	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	struct drm_framebuffer *new_fb = plane_state->fb;
 	struct drm_framebuffer *fb = NULL;
+	int ret;
 
 	if (!new_fb)
 		return 0;
@@ -1864,6 +1867,13 @@ mgag200_simple_display_pipe_check(struct drm_simple_display_pipe *pipe,
 	if (!fb || (fb->format != new_fb->format))
 		crtc_state->mode_changed = true; /* update PLL settings */
 
+	if (crtc_state->mode_changed) {
+		ret = mgag200_compute_pixpll_values(mdev, crtc_state->mode.clock,
+						    &mgag200_crtc_state->pixpll);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -1891,6 +1901,7 @@ mgag200_simple_display_pipe_duplicate_crtc_state(struct drm_simple_display_pipe
 {
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_crtc_state *crtc_state = crtc->state;
+	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	struct mgag200_crtc_state *new_mgag200_crtc_state;
 
 	if (!crtc_state)
@@ -1901,6 +1912,9 @@ mgag200_simple_display_pipe_duplicate_crtc_state(struct drm_simple_display_pipe
 		return NULL;
 	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_mgag200_crtc_state->base);
 
+	memcpy(&new_mgag200_crtc_state->pixpll, &mgag200_crtc_state->pixpll,
+	       sizeof(new_mgag200_crtc_state->pixpll));
+
 	return &new_mgag200_crtc_state->base;
 }
 
-- 
2.32.0

