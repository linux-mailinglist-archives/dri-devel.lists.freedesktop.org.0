Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29075F63E3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD1010E285;
	Thu,  6 Oct 2022 09:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17F210E228
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:53:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3378E1F925;
 Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665050038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9O1N+auGt5yeFE/x/378x0qS2gFOymW6bpcQJB3w1Q=;
 b=T2as6SE7XIM2lb3qggY5CFudbbgg68s0yGS9GSJFQ+H00P1GdVWDrID9h99tr9uNNPmPjR
 QwC02XT5fKBBuhbO5nJh8Paa+qw+Od5i0l9Vf8QMnuh2/vVGcmraKTrlOCL9rKff+yA4/Y
 lJehu+h/ZmRHEOQHDPw5nC5EkZ0jl90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665050038;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9O1N+auGt5yeFE/x/378x0qS2gFOymW6bpcQJB3w1Q=;
 b=mvwtKnpYEVr3W8EKs91uCVaUncAG7+M0PYB2b294cpEWje7VtufCv4aOuUSheP7RndZSdY
 csYZBVCCO8BjDGBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11BE113AC8;
 Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cPKFA7alPmNnYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 09:53:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch
Subject: [PATCH v2 08/16] drm/udl: Simplify modesetting in CRTC's enable
 function
Date: Thu,  6 Oct 2022 11:53:47 +0200
Message-Id: <20221006095355.23579-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006095355.23579-1-tzimmermann@suse.de>
References: <20221006095355.23579-1-tzimmermann@suse.de>
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

Inline a modesetting helper in the CRTC's enable function. Build the
command set directly in the USB URB's buffer and drop an intermediate
buffer. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/udl/udl_drv.h     |  3 --
 drivers/gpu/drm/udl/udl_modeset.c | 61 +++++++------------------------
 2 files changed, 14 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index e96166ce2919..b090b6cebdc4 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -74,9 +74,6 @@ struct udl_device {
 	int sku_pixel_limit;
 
 	struct urb_list urbs;
-
-	char mode_buf[1024];
-	uint32_t mode_buf_len;
 };
 
 #define to_udl(x) container_of(x, struct udl_device, drm)
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 62c07289680e..a1334f4718e0 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -214,31 +214,6 @@ static char *udl_dummy_render(char *wrptr)
 	return wrptr;
 }
 
-static int udl_crtc_write_mode_to_hw(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	struct udl_device *udl = to_udl(dev);
-	struct urb *urb;
-	char *buf;
-	int retval;
-
-	if (udl->mode_buf_len == 0) {
-		DRM_ERROR("No mode set\n");
-		return -EINVAL;
-	}
-
-	urb = udl_get_urb(dev);
-	if (!urb)
-		return -ENOMEM;
-
-	buf = (char *)urb->transfer_buffer;
-
-	memcpy(buf, udl->mode_buf, udl->mode_buf_len);
-	retval = udl_submit_urb(dev, urb, udl->mode_buf_len);
-	DRM_DEBUG("write mode info %d\n", udl->mode_buf_len);
-	return retval;
-}
-
 static long udl_log_cpp(unsigned int cpp)
 {
 	if (WARN_ON(!is_power_of_2(cpp)))
@@ -360,36 +335,28 @@ static int udl_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic
 static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
-	struct udl_device *udl = to_udl(dev);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_display_mode *mode = &crtc_state->mode;
+	struct urb *urb;
 	char *buf;
-	char *wrptr;
-	int color_depth = UDL_COLOR_DEPTH_16BPP;
 
-	buf = (char *)udl->mode_buf;
-
-	/*
-	 * This first section has to do with setting the base address on
-	 * the controller associated with the display. There are 2 base
-	 * pointers. Currently, we only use the 16 bpp segment.
-	 */
+	urb = udl_get_urb(dev);
+	if (!urb)
+		return;
 
-	wrptr = udl_vidreg_lock(buf);
-	wrptr = udl_set_color_depth(wrptr, color_depth);
+	buf = (char *)urb->transfer_buffer;
+	buf = udl_vidreg_lock(buf);
+	buf = udl_set_color_depth(buf, UDL_COLOR_DEPTH_16BPP);
 	/* set base for 16bpp segment to 0 */
-	wrptr = udl_set_base16bpp(wrptr, 0);
+	buf = udl_set_base16bpp(buf, 0);
 	/* set base for 8bpp segment to end of fb */
-	wrptr = udl_set_base8bpp(wrptr, 2 * mode->vdisplay * mode->hdisplay);
-	wrptr = udl_set_vid_cmds(wrptr, mode);
-	wrptr = udl_set_blank_mode(wrptr, UDL_BLANK_MODE_ON);
-	wrptr = udl_vidreg_unlock(wrptr);
-	wrptr = udl_dummy_render(wrptr);
-
-	udl->mode_buf_len = wrptr - buf;
+	buf = udl_set_base8bpp(buf, 2 * mode->vdisplay * mode->hdisplay);
+	buf = udl_set_vid_cmds(buf, mode);
+	buf = udl_set_blank_mode(buf, UDL_BLANK_MODE_ON);
+	buf = udl_vidreg_unlock(buf);
+	buf = udl_dummy_render(buf);
 
-	/* enable display */
-	udl_crtc_write_mode_to_hw(crtc);
+	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
 }
 
 static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
-- 
2.37.3

