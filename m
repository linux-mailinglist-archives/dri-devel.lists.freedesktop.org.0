Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AFEAC4BB0
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 11:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E0D10E46C;
	Tue, 27 May 2025 09:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="m0pSMrQ1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Osg5KLZM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m0pSMrQ1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Osg5KLZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8028E10E46C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 09:43:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38AB821ECD;
 Tue, 27 May 2025 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748339022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rU70lH7y1uFIN99HfE9Qeqj0VtBv3D/k0xQIyuRYkYU=;
 b=m0pSMrQ1jfdH++sfj/DrjJs8ygkjzARpbcSfw52wLcnxsVwDouLJD5mYOlNmPUiMjrPLzR
 bWnveUYlFHlWr82pRjwFCPNLTYYhxOus5wUC20kcoidbCWmrzfxGwAoIS9PsbHOfn+7iLp
 SrpvVSdwgQlHq4Dnl6Srz/PXxg/tSX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748339022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rU70lH7y1uFIN99HfE9Qeqj0VtBv3D/k0xQIyuRYkYU=;
 b=Osg5KLZMxZaNNgYdCqy83mECvMV1bsiJ/W+a9HBwIDYoyMYuMYf+nHsEBxS2KGXSqhwW2h
 W18/XSQsukzf5DAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748339022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rU70lH7y1uFIN99HfE9Qeqj0VtBv3D/k0xQIyuRYkYU=;
 b=m0pSMrQ1jfdH++sfj/DrjJs8ygkjzARpbcSfw52wLcnxsVwDouLJD5mYOlNmPUiMjrPLzR
 bWnveUYlFHlWr82pRjwFCPNLTYYhxOus5wUC20kcoidbCWmrzfxGwAoIS9PsbHOfn+7iLp
 SrpvVSdwgQlHq4Dnl6Srz/PXxg/tSX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748339022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rU70lH7y1uFIN99HfE9Qeqj0VtBv3D/k0xQIyuRYkYU=;
 b=Osg5KLZMxZaNNgYdCqy83mECvMV1bsiJ/W+a9HBwIDYoyMYuMYf+nHsEBxS2KGXSqhwW2h
 W18/XSQsukzf5DAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07E9C136E0;
 Tue, 27 May 2025 09:43:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id g46gAE6JNWidXQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 27 May 2025 09:43:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: liviu.dudau@arm.com,
	javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/arm/hdlcd: Replace struct simplefb_format with custom type
Date: Tue, 27 May 2025 11:42:57 +0200
Message-ID: <20250527094336.73524-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Map DRM FourCC codes to pixel descriptions with internal type struct
hdlcd_format. Reorder formats by preference. Avoid simplefb's struct
simplefb_format, which is for parsing "simple-framebuffer" DT nodes.

The HDLCD drivers uses struct simplefb_format and its default
initializer SIMPLEFB_FORMATS to map DRM_FORMAT_ constants to pixel
descriptions. The simplefb helpers are for parsing "simple-framebuffer"
DT nodes and should be avoided in other context. Therefore replace
it in hdlcd with the custom type struct hdlcd_format and the pixel
descriptions from PIXEL_FORMAT_ constants.

Plane formats exported to userspace are roughly sorted as preferred
by hardware and/or driver. SIMPLEFB_FORMATS currently puts 16-bit
formats to the top of the list. Changing to struct hdlcd_format
allows for reordering the format list. 32-bit formats are now the
preferred ones.

This change also removes including <linux/platform_data/simplefb.h>,
which includes several unrelated headers, such as <linux/fb.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/arm/hdlcd_crtc.c | 32 +++++++++++++++++++++++---------
 include/video/pixel_format.h     | 15 +++++++++++++++
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 3cfefadc7c9d..6fabe65ec0a2 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -11,8 +11,8 @@
 
 #include <linux/clk.h>
 #include <linux/of_graph.h>
-#include <linux/platform_data/simplefb.h>
 
+#include <video/pixel_format.h>
 #include <video/videomode.h>
 
 #include <drm/drm_atomic.h>
@@ -28,6 +28,25 @@
 #include "hdlcd_drv.h"
 #include "hdlcd_regs.h"
 
+struct hdlcd_format {
+	u32 fourcc;
+	struct pixel_format pixel;
+};
+
+static const struct hdlcd_format supported_formats[] = {
+	{ DRM_FORMAT_XRGB8888, PIXEL_FORMAT_XRGB8888 },
+	{ DRM_FORMAT_ARGB8888, PIXEL_FORMAT_ARGB8888 },
+	{ DRM_FORMAT_XBGR8888, PIXEL_FORMAT_XBGR8888 },
+	{ DRM_FORMAT_ABGR8888, PIXEL_FORMAT_ABGR8888 },
+	{ DRM_FORMAT_XRGB2101010, PIXEL_FORMAT_XRGB2101010},
+	{ DRM_FORMAT_ARGB2101010, PIXEL_FORMAT_ARGB2101010},
+	{ DRM_FORMAT_RGB565, PIXEL_FORMAT_RGB565 },
+	{ DRM_FORMAT_RGBA5551, PIXEL_FORMAT_RGBA5551 },
+	{ DRM_FORMAT_XRGB1555, PIXEL_FORMAT_XRGB1555 },
+	{ DRM_FORMAT_ARGB1555, PIXEL_FORMAT_ARGB1555 },
+	{ DRM_FORMAT_RGB888, PIXEL_FORMAT_RGB888 },
+};
+
 /*
  * The HDLCD controller is a dumb RGB streamer that gets connected to
  * a single HDMI transmitter or in the case of the ARM Models it gets
@@ -73,8 +92,6 @@ static const struct drm_crtc_funcs hdlcd_crtc_funcs = {
 	.disable_vblank = hdlcd_crtc_disable_vblank,
 };
 
-static struct simplefb_format supported_formats[] = SIMPLEFB_FORMATS;
-
 /*
  * Setup the HDLCD registers for decoding the pixels out of the framebuffer
  */
@@ -83,15 +100,12 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
 	unsigned int btpp;
 	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
 	const struct drm_framebuffer *fb = crtc->primary->state->fb;
-	uint32_t pixel_format;
-	struct simplefb_format *format = NULL;
+	const struct pixel_format *format = NULL;
 	int i;
 
-	pixel_format = fb->format->format;
-
 	for (i = 0; i < ARRAY_SIZE(supported_formats); i++) {
-		if (supported_formats[i].fourcc == pixel_format)
-			format = &supported_formats[i];
+		if (supported_formats[i].fourcc == fb->format->format)
+			format = &supported_formats[i].pixel;
 	}
 
 	if (WARN_ON(!format))
diff --git a/include/video/pixel_format.h b/include/video/pixel_format.h
index b5104b2a3a13..5ad2386e2014 100644
--- a/include/video/pixel_format.h
+++ b/include/video/pixel_format.h
@@ -23,6 +23,12 @@ struct pixel_format {
 #define PIXEL_FORMAT_XRGB1555 \
 	{ 16, false, { .alpha = {0, 0}, .red = {10, 5}, .green = {5, 5}, .blue = {0, 5} } }
 
+#define PIXEL_FORMAT_ARGB1555 \
+	{ 16, false, { .alpha = {15, 1}, .red = {10, 5}, .green = {5, 5}, .blue = {0, 5} } }
+
+#define PIXEL_FORMAT_RGBA5551 \
+	{ 16, false, { .alpha = {0, 1}, .red = {11, 5}, .green = {6, 5}, .blue = {1, 5} } }
+
 #define PIXEL_FORMAT_RGB565 \
 	{ 16, false, { .alpha = {0, 0}, .red = {11, 5}, .green = {5, 6}, .blue = {0, 5} } }
 
@@ -32,10 +38,19 @@ struct pixel_format {
 #define PIXEL_FORMAT_XRGB8888 \
 	{ 32, false, { .alpha = {0, 0}, .red = {16, 8}, .green = {8, 8}, .blue = {0, 8} } }
 
+#define PIXEL_FORMAT_ARGB8888 \
+	{ 32, false, { .alpha = {24, 8}, .red = {16, 8}, .green = {8, 8}, .blue = {0, 8} } }
+
 #define PIXEL_FORMAT_XBGR8888 \
 	{ 32, false, { .alpha = {0, 0}, .red = {0, 8}, .green = {8, 8}, .blue = {16, 8} } }
 
+#define PIXEL_FORMAT_ABGR8888 \
+	{ 32, false, { .alpha = {24, 8}, .red = {0, 8}, .green = {8, 8}, .blue = {16, 8} } }
+
 #define PIXEL_FORMAT_XRGB2101010 \
 	{ 32, false, { .alpha = {0, 0}, .red = {20, 10}, .green = {10, 10}, .blue = {0, 10} } }
 
+#define PIXEL_FORMAT_ARGB2101010 \
+	{ 32, false, { .alpha = {30, 1}, .red = {20, 10}, .green = {10, 10}, .blue = {0, 10} } }
+
 #endif
-- 
2.49.0

