Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDD1577EA7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDB6AE536;
	Mon, 18 Jul 2022 09:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFA8A545F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:27:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1A8637427;
 Mon, 18 Jul 2022 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658136475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSyuf7AStwxol1tn1R7fJ7j0ieSS5ftZYKOuGQUcvAc=;
 b=ZpkSVWqnJK81IP3K5oq6fVm9xF9N31akNBiXrKQJ436CmKXTuzagYqXzMPW4n89BG4qfvF
 1QcC6jNciQa6dAb+GOxT8sbI05lGoRIItZN2FTWcrOU+XM3TQWOY9I5fYXjdmftbSN+mPN
 LBrGd0fN9fBHhuk2BVQI0XhiUzVm3KE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658136475;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSyuf7AStwxol1tn1R7fJ7j0ieSS5ftZYKOuGQUcvAc=;
 b=v9fLGEA+3w9TQ8paSp1KT5OjbA0JxOVGWcswOYh+FflCFDRpNHwioJPgN/sro/9H1FFQr4
 Y4hPMQza8uYsenDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BAB7C13AB4;
 Mon, 18 Jul 2022 09:27:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KMa8LJsn1WJ6LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 09:27:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, airlied@redhat.com, airlied@linux.ie,
 jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH v2 05/14] drm/mgag200: Store primary plane's color format in
 CRTC state
Date: Mon, 18 Jul 2022 11:27:44 +0200
Message-Id: <20220718092753.9598-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718092753.9598-1-tzimmermann@suse.de>
References: <20220718092753.9598-1-tzimmermann@suse.de>
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

Store the primary plane's color format in the CRTC state and use
it for programming the CRTC's gamma LUTs.

Gamma tables (i.e., color management) are provided by the CRTC, but
depend in the primary plane's color format. Store the format in the
CRTC state and use it. This has not been an issue with simple-KMS
helpers, which mix-up plane and CRTC state to some extent. For using
regular atomic helpers, it's necessary to distinguish between the two.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  3 +++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 22 ++++++++++++----------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index face2904556a..bf6a01ff9719 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -187,6 +187,9 @@ struct mgag200_pll {
 struct mgag200_crtc_state {
 	struct drm_crtc_state base;
 
+	/* Primary-plane format; required for modesetting and color mgmt. */
+	const struct drm_format_info *format;
+
 	struct mgag200_pll_values pixpllc;
 };
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 0c98742a1b65..bbd1d97a926f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -419,11 +419,9 @@ static void mgag200_set_offset(struct mga_device *mdev,
 	WREG_ECRT(0x00, crtcext0);
 }
 
-static void mgag200_set_format_regs(struct mga_device *mdev,
-				    const struct drm_framebuffer *fb)
+static void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_info *format)
 {
 	struct drm_device *dev = &mdev->base;
-	const struct drm_format_info *format = fb->format;
 	unsigned int bpp, bppshift, scale;
 	u8 crtcext3, xmulctrl;
 
@@ -502,7 +500,7 @@ static void mgag200_g200er_reset_tagfifo(struct mga_device *mdev)
 
 static void mgag200_g200se_set_hiprilvl(struct mga_device *mdev,
 					const struct drm_display_mode *mode,
-					const struct drm_framebuffer *fb)
+					const struct drm_format_info *format)
 {
 	struct mgag200_g200se_device *g200se = to_mgag200_g200se_device(&mdev->base);
 	unsigned int hiprilvl;
@@ -514,9 +512,9 @@ static void mgag200_g200se_set_hiprilvl(struct mga_device *mdev,
 		unsigned int bpp;
 		unsigned long mb;
 
-		if (fb->format->cpp[0] * 8 > 16)
+		if (format->cpp[0] * 8 > 16)
 			bpp = 32;
-		else if (fb->format->cpp[0] * 8 > 8)
+		else if (format->cpp[0] * 8 > 8)
 			bpp = 16;
 		else
 			bpp = 8;
@@ -696,6 +694,7 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
 	struct drm_framebuffer *fb = plane_state->fb;
+	const struct drm_format_info *format = mgag200_crtc_state->format;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_rect fullscreen = {
 		.x1 = 0,
@@ -707,7 +706,7 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
 		mgag200_g200wb_hold_bmc(mdev);
 
-	mgag200_set_format_regs(mdev, fb);
+	mgag200_set_format_regs(mdev, format);
 	mgag200_set_mode_regs(mdev, adjusted_mode);
 
 	pixpll->funcs->update(pixpll, &mgag200_crtc_state->pixpllc);
@@ -716,7 +715,7 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 		mgag200_g200er_reset_tagfifo(mdev);
 
 	if (IS_G200_SE(mdev))
-		mgag200_g200se_set_hiprilvl(mdev, adjusted_mode, fb);
+		mgag200_g200se_set_hiprilvl(mdev, adjusted_mode, format);
 	else if (mdev->type == G200_EV)
 		mgag200_g200ev_set_hiprilvl(mdev);
 
@@ -724,9 +723,9 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 		mgag200_g200wb_release_bmc(mdev);
 
 	if (crtc_state->gamma_lut)
-		mgag200_crtc_set_gamma(mdev, fb->format, crtc_state->gamma_lut->data);
+		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
 	else
-		mgag200_crtc_set_gamma_linear(mdev, fb->format);
+		mgag200_crtc_set_gamma_linear(mdev, format);
 
 	mgag200_enable_display(mdev);
 
@@ -769,6 +768,8 @@ mgag200_simple_display_pipe_check(struct drm_simple_display_pipe *pipe,
 	if (!fb || (fb->format != new_fb->format))
 		crtc_state->mode_changed = true; /* update PLL settings */
 
+	mgag200_crtc_state->format = new_fb->format;
+
 	if (crtc_state->mode_changed) {
 		ret = pixpll->funcs->compute(pixpll, crtc_state->mode.clock,
 					     &mgag200_crtc_state->pixpllc);
@@ -832,6 +833,7 @@ mgag200_simple_display_pipe_duplicate_crtc_state(struct drm_simple_display_pipe
 		return NULL;
 	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_mgag200_crtc_state->base);
 
+	new_mgag200_crtc_state->format = mgag200_crtc_state->format;
 	memcpy(&new_mgag200_crtc_state->pixpllc, &mgag200_crtc_state->pixpllc,
 	       sizeof(new_mgag200_crtc_state->pixpllc));
 
-- 
2.36.1

