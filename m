Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB8ABD3CF
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 11:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E13910E46B;
	Tue, 20 May 2025 09:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="d6N0Y5fJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="42MdlycN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d6N0Y5fJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="42MdlycN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2B910E46B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 09:45:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 432FB20659;
 Tue, 20 May 2025 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747734312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3MNPjYYisLyMj7hd+WhpKqMSCxXBHWbI9aHJGjNmDI=;
 b=d6N0Y5fJNYXFl4lCbG+2WtmVZH5jsYoFHCzJm8w4lPs6JfOfCOv3UEXFYKJ89+bzciX7K0
 qCdok4rWGcmiRS/RJH+fYV/k2xQWtAxtUCieKIU+IxKTa3iM666DAp5lbHGjuOo+r3EJsl
 cuAZqz8d/dznKMoywxtvEwI8BNnV1Gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747734312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3MNPjYYisLyMj7hd+WhpKqMSCxXBHWbI9aHJGjNmDI=;
 b=42MdlycNpbNvBEm11Kn1dWQO6vjtuWnL7c+bpjo3iXMflmzmPuQuqjZ39UvxlwBA+qGyfj
 bfS4zWd1h7R4+2BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747734312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3MNPjYYisLyMj7hd+WhpKqMSCxXBHWbI9aHJGjNmDI=;
 b=d6N0Y5fJNYXFl4lCbG+2WtmVZH5jsYoFHCzJm8w4lPs6JfOfCOv3UEXFYKJ89+bzciX7K0
 qCdok4rWGcmiRS/RJH+fYV/k2xQWtAxtUCieKIU+IxKTa3iM666DAp5lbHGjuOo+r3EJsl
 cuAZqz8d/dznKMoywxtvEwI8BNnV1Gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747734312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3MNPjYYisLyMj7hd+WhpKqMSCxXBHWbI9aHJGjNmDI=;
 b=42MdlycNpbNvBEm11Kn1dWQO6vjtuWnL7c+bpjo3iXMflmzmPuQuqjZ39UvxlwBA+qGyfj
 bfS4zWd1h7R4+2BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0543513A3E;
 Tue, 20 May 2025 09:45:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2OiPOydPLGhVXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 May 2025 09:45:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, airlied@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/5] drm/ofdrm: Use helpers for programming gamma ramps
Date: Tue, 20 May 2025 11:40:06 +0200
Message-ID: <20250520094203.30545-5-tzimmermann@suse.de>
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

Replace ofdrm's code for programming the hardware gamma LUT with
DRM helpers. Either load a provided gamma ramp or program a default.
Set the individual entries with a callback.

Each gamma value is given as 3 individual 16-bit values for red,
green and blue. The driver reduces them to 8 bit to make them fit
into hardware registers.

v2:
- fix coding style

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/ofdrm.c | 80 +++++++++++++----------------------
 1 file changed, 30 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index fddfe8bea9f7..c9415f0cb3ed 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -8,6 +8,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
@@ -644,36 +645,36 @@ static void ofdrm_qemu_cmap_write(struct ofdrm_device *odev, unsigned char index
 	writeb(b, data);
 }
 
-static void ofdrm_device_set_gamma_linear(struct ofdrm_device *odev,
-					  const struct drm_format_info *format)
+static void ofdrm_set_gamma_lut(struct drm_crtc *crtc, unsigned int index,
+				u16 red, u16 green, u16 blue)
+{
+	struct drm_device *dev = crtc->dev;
+	struct ofdrm_device *odev = ofdrm_device_of_dev(dev);
+	u8 i8 = index & 0xff;
+	u8 r8 = red >> 8;
+	u8 g8 = green >> 8;
+	u8 b8 = blue >> 8;
+
+	if (drm_WARN_ON_ONCE(dev, index != i8))
+		return; /* driver bug */
+
+	odev->funcs->cmap_write(odev, i8, r8, g8, b8);
+}
+
+static void ofdrm_device_fill_gamma(struct ofdrm_device *odev,
+				    const struct drm_format_info *format)
 {
 	struct drm_device *dev = &odev->sysfb.dev;
-	int i;
+	struct drm_crtc *crtc = &odev->crtc;
 
 	switch (format->format) {
 	case DRM_FORMAT_RGB565:
 	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
-		/* Use better interpolation, to take 32 values from 0 to 255 */
-		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE / 8; i++) {
-			unsigned char r = i * 8 + i / 4;
-			unsigned char g = i * 4 + i / 16;
-			unsigned char b = i * 8 + i / 4;
-
-			odev->funcs->cmap_write(odev, i, r, g, b);
-		}
-		/* Green has one more bit, so add padding with 0 for red and blue. */
-		for (i = OFDRM_GAMMA_LUT_SIZE / 8; i < OFDRM_GAMMA_LUT_SIZE / 4; i++) {
-			unsigned char r = 0;
-			unsigned char g = i * 4 + i / 16;
-			unsigned char b = 0;
-
-			odev->funcs->cmap_write(odev, i, r, g, b);
-		}
+		drm_crtc_fill_gamma_565(crtc, ofdrm_set_gamma_lut);
 		break;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_BGRX8888:
-		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE; i++)
-			odev->funcs->cmap_write(odev, i, i, i, i);
+		drm_crtc_fill_gamma_888(crtc, ofdrm_set_gamma_lut);
 		break;
 	default:
 		drm_warn_once(dev, "Unsupported format %p4cc for gamma correction\n",
@@ -682,42 +683,21 @@ static void ofdrm_device_set_gamma_linear(struct ofdrm_device *odev,
 	}
 }
 
-static void ofdrm_device_set_gamma(struct ofdrm_device *odev,
-				   const struct drm_format_info *format,
-				   struct drm_color_lut *lut)
+static void ofdrm_device_load_gamma(struct ofdrm_device *odev,
+				    const struct drm_format_info *format,
+				    struct drm_color_lut *lut)
 {
 	struct drm_device *dev = &odev->sysfb.dev;
-	int i;
+	struct drm_crtc *crtc = &odev->crtc;
 
 	switch (format->format) {
 	case DRM_FORMAT_RGB565:
 	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
-		/* Use better interpolation, to take 32 values from lut[0] to lut[255] */
-		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE / 8; i++) {
-			unsigned char r = lut[i * 8 + i / 4].red >> 8;
-			unsigned char g = lut[i * 4 + i / 16].green >> 8;
-			unsigned char b = lut[i * 8 + i / 4].blue >> 8;
-
-			odev->funcs->cmap_write(odev, i, r, g, b);
-		}
-		/* Green has one more bit, so add padding with 0 for red and blue. */
-		for (i = OFDRM_GAMMA_LUT_SIZE / 8; i < OFDRM_GAMMA_LUT_SIZE / 4; i++) {
-			unsigned char r = 0;
-			unsigned char g = lut[i * 4 + i / 16].green >> 8;
-			unsigned char b = 0;
-
-			odev->funcs->cmap_write(odev, i, r, g, b);
-		}
+		drm_crtc_load_gamma_565_from_888(crtc, lut, ofdrm_set_gamma_lut);
 		break;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_BGRX8888:
-		for (i = 0; i < OFDRM_GAMMA_LUT_SIZE; i++) {
-			unsigned char r = lut[i].red >> 8;
-			unsigned char g = lut[i].green >> 8;
-			unsigned char b = lut[i].blue >> 8;
-
-			odev->funcs->cmap_write(odev, i, r, g, b);
-		}
+		drm_crtc_load_gamma_888(crtc, lut, ofdrm_set_gamma_lut);
 		break;
 	default:
 		drm_warn_once(dev, "Unsupported format %p4cc for gamma correction\n",
@@ -753,9 +733,9 @@ static void ofdrm_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_ato
 		const struct drm_format_info *format = sysfb_crtc_state->format;
 
 		if (crtc_state->gamma_lut)
-			ofdrm_device_set_gamma(odev, format, crtc_state->gamma_lut->data);
+			ofdrm_device_load_gamma(odev, format, crtc_state->gamma_lut->data);
 		else
-			ofdrm_device_set_gamma_linear(odev, format);
+			ofdrm_device_fill_gamma(odev, format);
 	}
 }
 
-- 
2.49.0

