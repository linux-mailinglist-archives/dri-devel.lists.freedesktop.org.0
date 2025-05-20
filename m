Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22780ABD3CB
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 11:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D35710E435;
	Tue, 20 May 2025 09:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GTV2QGVw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R6yL2wgH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GTV2QGVw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R6yL2wgH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DB710E3B1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 09:45:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 866662242F;
 Tue, 20 May 2025 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747734312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OH35ltS9J/++lO65ukVC/C1FYtokOQ1UN12Xv7Ut4r4=;
 b=GTV2QGVwtM5jl+nUiMpOY+Lf+oNOgIWESKQO6G1OWIKbWiKFzH0ZgiHAo9tTS8EVg6H+bm
 /ikBHuS0f8mIUYL2ary6BSGEgvE0gXT+UpWZb+t3bLJ9LL57yJXE1nZEy/5f1Nv0SfWVjz
 v9YEkO9IztaoMbuIPKq0+LMArsUtrqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747734312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OH35ltS9J/++lO65ukVC/C1FYtokOQ1UN12Xv7Ut4r4=;
 b=R6yL2wgH+yw6ZubOCDaLO1j0ADMSW+fS2Avd04Lk1PQDt8snpTO0SBf+DVh0Ql2bjMm2B7
 0G1pc0ziU7ieDyCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747734312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OH35ltS9J/++lO65ukVC/C1FYtokOQ1UN12Xv7Ut4r4=;
 b=GTV2QGVwtM5jl+nUiMpOY+Lf+oNOgIWESKQO6G1OWIKbWiKFzH0ZgiHAo9tTS8EVg6H+bm
 /ikBHuS0f8mIUYL2ary6BSGEgvE0gXT+UpWZb+t3bLJ9LL57yJXE1nZEy/5f1Nv0SfWVjz
 v9YEkO9IztaoMbuIPKq0+LMArsUtrqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747734312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OH35ltS9J/++lO65ukVC/C1FYtokOQ1UN12Xv7Ut4r4=;
 b=R6yL2wgH+yw6ZubOCDaLO1j0ADMSW+fS2Avd04Lk1PQDt8snpTO0SBf+DVh0Ql2bjMm2B7
 0G1pc0ziU7ieDyCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4909B13A3F;
 Tue, 20 May 2025 09:45:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qLShEChPLGhVXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 May 2025 09:45:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, airlied@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/5] drm/vesadrm: Use helpers for programming gamma ramps
Date: Tue, 20 May 2025 11:40:07 +0200
Message-ID: <20250520094203.30545-6-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
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

Replace vesadrm's code for programming the hardware gamma LUT with
DRM helpers. Either load a provided gamma ramp or program a default.
Set the individual entries with a callback.

Each gamma value is given as 3 individual 16-bit values for red,
green and blue. The driver reduces them to 8 bit to make them fit
into hardware registers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/vesadrm.c | 100 ++++++++++++--------------------
 1 file changed, 36 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 4d62c78e7d1e..7945544ba73e 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -9,6 +9,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
@@ -87,15 +88,10 @@ static struct vesadrm_device *to_vesadrm_device(struct drm_device *dev)
 static void vesadrm_vga_cmap_write(struct vesadrm_device *vesa, unsigned int index,
 				   u16 red, u16 green, u16 blue)
 {
-	u8 i8, r8, g8, b8;
-
-	if (index > 255)
-		return;
-
-	i8 = index;
-	r8 = red >> 8;
-	g8 = green >> 8;
-	b8 = blue >> 8;
+	u8 i8 = index;
+	u8 r8 = red >> 8;
+	u8 g8 = green >> 8;
+	u8 b8 = blue >> 8;
 
 	outb_p(i8, VGA_PEL_IW);
 	outb_p(r8, VGA_PEL_D);
@@ -120,9 +116,6 @@ static void vesadrm_pmi_cmap_write(struct vesadrm_device *vesa, unsigned int ind
 		0x00,
 	};
 
-	if (index > 255)
-		return;
-
 	__asm__ __volatile__ (
 		"call *(%%esi)"
 		: /* no return value */
@@ -135,43 +128,36 @@ static void vesadrm_pmi_cmap_write(struct vesadrm_device *vesa, unsigned int ind
 }
 #endif
 
-static void vesadrm_set_gamma_linear(struct vesadrm_device *vesa,
-				     const struct drm_format_info *format)
+static void vesadrm_set_gamma_lut(struct drm_crtc *crtc, unsigned int index,
+				  u16 red, u16 green, u16 blue)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vesadrm_device *vesa = to_vesadrm_device(dev);
+	u8 i8 = index & 0xff;
+
+	if (drm_WARN_ON_ONCE(dev, index != i8))
+		return; /* driver bug */
+
+	vesa->cmap_write(vesa, i8, red, green, blue);
+}
+
+static void vesadrm_fill_gamma_lut(struct vesadrm_device *vesa,
+				   const struct drm_format_info *format)
 {
 	struct drm_device *dev = &vesa->sysfb.dev;
-	size_t i;
-	u16 r16, g16, b16;
+	struct drm_crtc *crtc = &vesa->crtc;
 
 	switch (format->format) {
 	case DRM_FORMAT_XRGB1555:
-		for (i = 0; i < 32; ++i) {
-			r16 = i * 8 + i / 4;
-			r16 |= (r16 << 8) | r16;
-			vesa->cmap_write(vesa, i, r16, r16, r16);
-		}
+		drm_crtc_fill_gamma_555(crtc, vesadrm_set_gamma_lut);
 		break;
 	case DRM_FORMAT_RGB565:
-		for (i = 0; i < 32; ++i) {
-			r16 = i * 8 + i / 4;
-			r16 |= (r16 << 8) | r16;
-			g16 = i * 4 + i / 16;
-			g16 |= (g16 << 8) | g16;
-			b16 = r16;
-			vesa->cmap_write(vesa, i, r16, g16, b16);
-		}
-		for (i = 32; i < 64; ++i) {
-			g16 = i * 4 + i / 16;
-			g16 |= (g16 << 8) | g16;
-			vesa->cmap_write(vesa, i, 0, g16, 0);
-		}
+		drm_crtc_fill_gamma_565(crtc, vesadrm_set_gamma_lut);
 		break;
 	case DRM_FORMAT_RGB888:
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_BGRX8888:
-		for (i = 0; i < 256; ++i) {
-			r16 = (i << 8) | i;
-			vesa->cmap_write(vesa, i, r16, r16, r16);
-		}
+		drm_crtc_fill_gamma_888(crtc, vesadrm_set_gamma_lut);
 		break;
 	default:
 		drm_warn_once(dev, "Unsupported format %p4cc for gamma correction\n",
@@ -180,38 +166,24 @@ static void vesadrm_set_gamma_linear(struct vesadrm_device *vesa,
 	}
 }
 
-static void vesadrm_set_gamma_lut(struct vesadrm_device *vesa,
-				  const struct drm_format_info *format,
-				  struct drm_color_lut *lut)
+static void vesadrm_load_gamma_lut(struct vesadrm_device *vesa,
+				   const struct drm_format_info *format,
+				   struct drm_color_lut *lut)
 {
 	struct drm_device *dev = &vesa->sysfb.dev;
-	size_t i;
-	u16 r16, g16, b16;
+	struct drm_crtc *crtc = &vesa->crtc;
 
 	switch (format->format) {
 	case DRM_FORMAT_XRGB1555:
-		for (i = 0; i < 32; ++i) {
-			r16 = lut[i * 8 + i / 4].red;
-			g16 = lut[i * 8 + i / 4].green;
-			b16 = lut[i * 8 + i / 4].blue;
-			vesa->cmap_write(vesa, i, r16, g16, b16);
-		}
+		drm_crtc_load_gamma_555_from_888(crtc, lut, vesadrm_set_gamma_lut);
 		break;
 	case DRM_FORMAT_RGB565:
-		for (i = 0; i < 32; ++i) {
-			r16 = lut[i * 8 + i / 4].red;
-			g16 = lut[i * 4 + i / 16].green;
-			b16 = lut[i * 8 + i / 4].blue;
-			vesa->cmap_write(vesa, i, r16, g16, b16);
-		}
-		for (i = 32; i < 64; ++i)
-			vesa->cmap_write(vesa, i, 0, lut[i * 4 + i / 16].green, 0);
+		drm_crtc_load_gamma_565_from_888(crtc, lut, vesadrm_set_gamma_lut);
 		break;
 	case DRM_FORMAT_RGB888:
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_BGRX8888:
-		for (i = 0; i < 256; ++i)
-			vesa->cmap_write(vesa, i, lut[i].red, lut[i].green, lut[i].blue);
+		drm_crtc_load_gamma_888(crtc, lut, vesadrm_set_gamma_lut);
 		break;
 	default:
 		drm_warn_once(dev, "Unsupported format %p4cc for gamma correction\n",
@@ -253,13 +225,13 @@ static void vesadrm_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
 		if (sysfb_crtc_state->format == sysfb->fb_format) {
 			if (crtc_state->gamma_lut)
-				vesadrm_set_gamma_lut(vesa,
-						      sysfb_crtc_state->format,
-						      crtc_state->gamma_lut->data);
+				vesadrm_load_gamma_lut(vesa,
+						       sysfb_crtc_state->format,
+						       crtc_state->gamma_lut->data);
 			else
-				vesadrm_set_gamma_linear(vesa, sysfb_crtc_state->format);
+				vesadrm_fill_gamma_lut(vesa, sysfb_crtc_state->format);
 		} else {
-			vesadrm_set_gamma_linear(vesa, sysfb_crtc_state->format);
+			vesadrm_fill_gamma_lut(vesa, sysfb_crtc_state->format);
 		}
 	}
 }
-- 
2.49.0

