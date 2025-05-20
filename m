Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120D9ABD3CC
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 11:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C50010E462;
	Tue, 20 May 2025 09:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PIvwgGo/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JNaZLsyH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PIvwgGo/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JNaZLsyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D18210E43D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 09:45:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2C3320656;
 Tue, 20 May 2025 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747734312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBMKU6J0ofBbqH+4oJE/byUz/Xjqus3wx5ybuxsnhWE=;
 b=PIvwgGo/2K9lCehWQ0vR//OA3ThyVGZhgtTpPBgGvB4Qm1LIbq8oEdI53F+xIjG2DfU4vZ
 vcUEa9bqbj/nHur4BVWdly1gvo6GFIWHcst9XNSyxFj+EWoNbrg6uulXktdgk8FmBKaXpa
 9ZUWPFy4A672EYbl3C6MbZ7Vq5vRdr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747734312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBMKU6J0ofBbqH+4oJE/byUz/Xjqus3wx5ybuxsnhWE=;
 b=JNaZLsyH4u/sUKSb0I4AQPu7NU8jxRwWINiJ1rbV3OjMQXj2QiaHbI1UeBp7REoA42xlih
 Vgv5JWd17xwO0lCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747734312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBMKU6J0ofBbqH+4oJE/byUz/Xjqus3wx5ybuxsnhWE=;
 b=PIvwgGo/2K9lCehWQ0vR//OA3ThyVGZhgtTpPBgGvB4Qm1LIbq8oEdI53F+xIjG2DfU4vZ
 vcUEa9bqbj/nHur4BVWdly1gvo6GFIWHcst9XNSyxFj+EWoNbrg6uulXktdgk8FmBKaXpa
 9ZUWPFy4A672EYbl3C6MbZ7Vq5vRdr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747734312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBMKU6J0ofBbqH+4oJE/byUz/Xjqus3wx5ybuxsnhWE=;
 b=JNaZLsyH4u/sUKSb0I4AQPu7NU8jxRwWINiJ1rbV3OjMQXj2QiaHbI1UeBp7REoA42xlih
 Vgv5JWd17xwO0lCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B647D13A3F;
 Tue, 20 May 2025 09:45:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MBMyKydPLGhVXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 May 2025 09:45:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, airlied@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/5] drm/mgag200: Use helpers for programming gamma ramps
Date: Tue, 20 May 2025 11:40:05 +0200
Message-ID: <20250520094203.30545-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520094203.30545-1-tzimmermann@suse.de>
References: <20250520094203.30545-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Replace mgag200's code for programming the hardware gamma LUT with
DRM helpers. Either load a provided gamma ramp or program a default.
Set the individual entries with a callback.

Each gamma value is given as 3 individual 16-bit values for red,
green and blue. The driver reduces them to 8 bit to make them fit
into hardware registers.

v2:
- fix coding style

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  8 +--
 drivers/gpu/drm/mgag200/mgag200_g200er.c |  4 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c |  4 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c |  4 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 82 ++++++++++--------------
 5 files changed, 44 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 819a7e9381e3..f4bf40cd7c88 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -382,10 +382,10 @@ int mgag200_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
 	.destroy = drm_plane_cleanup, \
 	DRM_GEM_SHADOW_PLANE_FUNCS
 
-void mgag200_crtc_set_gamma_linear(struct mga_device *mdev, const struct drm_format_info *format);
-void mgag200_crtc_set_gamma(struct mga_device *mdev,
-			    const struct drm_format_info *format,
-			    struct drm_color_lut *lut);
+void mgag200_crtc_fill_gamma(struct mga_device *mdev, const struct drm_format_info *format);
+void mgag200_crtc_load_gamma(struct mga_device *mdev,
+			     const struct drm_format_info *format,
+			     struct drm_color_lut *lut);
 
 enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc *crtc,
 						    const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index c20ed0ab50ec..23debc70dc54 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -200,9 +200,9 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 	mgag200_g200er_reset_tagfifo(mdev);
 
 	if (crtc_state->gamma_lut)
-		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
+		mgag200_crtc_load_gamma(mdev, format, crtc_state->gamma_lut->data);
 	else
-		mgag200_crtc_set_gamma_linear(mdev, format);
+		mgag200_crtc_fill_gamma(mdev, format);
 
 	mgag200_enable_display(mdev);
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 78be964eb97c..f8796e2b7a0f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -201,9 +201,9 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 	mgag200_g200ev_set_hiprilvl(mdev);
 
 	if (crtc_state->gamma_lut)
-		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
+		mgag200_crtc_load_gamma(mdev, format, crtc_state->gamma_lut->data);
 	else
-		mgag200_crtc_set_gamma_linear(mdev, format);
+		mgag200_crtc_fill_gamma(mdev, format);
 
 	mgag200_enable_display(mdev);
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 7a32d3b1d226..e80da12ba1fe 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -332,9 +332,9 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 	mgag200_g200se_set_hiprilvl(mdev, adjusted_mode, format);
 
 	if (crtc_state->gamma_lut)
-		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
+		mgag200_crtc_load_gamma(mdev, format, crtc_state->gamma_lut->data);
 	else
-		mgag200_crtc_set_gamma_linear(mdev, format);
+		mgag200_crtc_fill_gamma(mdev, format);
 
 	mgag200_enable_display(mdev);
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 6067d08aeee3..951d715dea30 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_format_helper.h>
@@ -30,35 +31,37 @@
  * This file contains setup code for the CRTC.
  */
 
-void mgag200_crtc_set_gamma_linear(struct mga_device *mdev,
-				   const struct drm_format_info *format)
+static void mgag200_set_gamma_lut(struct drm_crtc *crtc, unsigned int index,
+				  u16 red, u16 green, u16 blue)
 {
-	int i;
+	struct drm_device *dev = crtc->dev;
+	struct mga_device *mdev = to_mga_device(dev);
+	u8 i8 = index & 0xff;
+	u8 r8 = red >> 8;
+	u8 g8 = green >> 8;
+	u8 b8 = blue >> 8;
+
+	if (drm_WARN_ON_ONCE(dev, index != i8))
+		return; /* driver bug */
+
+	WREG8(DAC_INDEX + MGA1064_INDEX, i8);
+	WREG8(DAC_INDEX + MGA1064_COL_PAL, r8);
+	WREG8(DAC_INDEX + MGA1064_COL_PAL, g8);
+	WREG8(DAC_INDEX + MGA1064_COL_PAL, b8);
+}
 
-	WREG8(DAC_INDEX + MGA1064_INDEX, 0);
+void mgag200_crtc_fill_gamma(struct mga_device *mdev,
+			     const struct drm_format_info *format)
+{
+	struct drm_crtc *crtc = &mdev->crtc;
 
 	switch (format->format) {
 	case DRM_FORMAT_RGB565:
-		/* Use better interpolation, to take 32 values from 0 to 255 */
-		for (i = 0; i < MGAG200_LUT_SIZE / 8; i++) {
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 8 + i / 4);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 4 + i / 16);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 8 + i / 4);
-		}
-		/* Green has one more bit, so add padding with 0 for red and blue. */
-		for (i = MGAG200_LUT_SIZE / 8; i < MGAG200_LUT_SIZE / 4; i++) {
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 4 + i / 16);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
-		}
+		drm_crtc_fill_gamma_565(crtc, mgag200_set_gamma_lut);
 		break;
 	case DRM_FORMAT_RGB888:
 	case DRM_FORMAT_XRGB8888:
-		for (i = 0; i < MGAG200_LUT_SIZE; i++) {
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
-		}
+		drm_crtc_fill_gamma_888(crtc, mgag200_set_gamma_lut);
 		break;
 	default:
 		drm_warn_once(&mdev->base, "Unsupported format %p4cc for gamma correction\n",
@@ -67,36 +70,19 @@ void mgag200_crtc_set_gamma_linear(struct mga_device *mdev,
 	}
 }
 
-void mgag200_crtc_set_gamma(struct mga_device *mdev,
-			    const struct drm_format_info *format,
-			    struct drm_color_lut *lut)
+void mgag200_crtc_load_gamma(struct mga_device *mdev,
+			     const struct drm_format_info *format,
+			     struct drm_color_lut *lut)
 {
-	int i;
-
-	WREG8(DAC_INDEX + MGA1064_INDEX, 0);
+	struct drm_crtc *crtc = &mdev->crtc;
 
 	switch (format->format) {
 	case DRM_FORMAT_RGB565:
-		/* Use better interpolation, to take 32 values from lut[0] to lut[255] */
-		for (i = 0; i < MGAG200_LUT_SIZE / 8; i++) {
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 8 + i / 4].red >> 8);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 4 + i / 16].green >> 8);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 8 + i / 4].blue >> 8);
-		}
-		/* Green has one more bit, so add padding with 0 for red and blue. */
-		for (i = MGAG200_LUT_SIZE / 8; i < MGAG200_LUT_SIZE / 4; i++) {
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 4 + i / 16].green >> 8);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
-		}
+		drm_crtc_load_gamma_565_from_888(crtc, lut, mgag200_set_gamma_lut);
 		break;
 	case DRM_FORMAT_RGB888:
 	case DRM_FORMAT_XRGB8888:
-		for (i = 0; i < MGAG200_LUT_SIZE; i++) {
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].red >> 8);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].blue >> 8);
-		}
+		drm_crtc_load_gamma_888(crtc, lut, mgag200_set_gamma_lut);
 		break;
 	default:
 		drm_warn_once(&mdev->base, "Unsupported format %p4cc for gamma correction\n",
@@ -642,9 +628,9 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
 		const struct drm_format_info *format = mgag200_crtc_state->format;
 
 		if (crtc_state->gamma_lut)
-			mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
+			mgag200_crtc_load_gamma(mdev, format, crtc_state->gamma_lut->data);
 		else
-			mgag200_crtc_set_gamma_linear(mdev, format);
+			mgag200_crtc_fill_gamma(mdev, format);
 	}
 }
 
@@ -665,9 +651,9 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 		funcs->pixpllc_atomic_update(crtc, old_state);
 
 	if (crtc_state->gamma_lut)
-		mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut->data);
+		mgag200_crtc_load_gamma(mdev, format, crtc_state->gamma_lut->data);
 	else
-		mgag200_crtc_set_gamma_linear(mdev, format);
+		mgag200_crtc_fill_gamma(mdev, format);
 
 	mgag200_enable_display(mdev);
 }
-- 
2.49.0

