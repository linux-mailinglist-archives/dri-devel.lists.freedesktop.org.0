Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26815AD2EC0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED77110E476;
	Tue, 10 Jun 2025 07:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="eqEPyRJ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nt2iT4Wa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eqEPyRJ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nt2iT4Wa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E2A10E476
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:34:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AC3031F45E;
 Tue, 10 Jun 2025 07:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749540856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3XDM5J6sdIZXjgLeW7OEkVxm7lulmF5Rng1mfR1no8s=;
 b=eqEPyRJ+fU2ZXgKG/3W33NjTm3c03H3DphEqZNRhUahDDwHSJBv/11HCacNgYs/zXPjuWQ
 OITB5ciE6HSHZTUsle971+OZrOV7UqL5YwrgUzdWwCIp4g0MK5dlI057evb+RjDpxSe6wF
 Yj4Ig8tFqK9OTzRazwikdhZSzlU4B4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749540856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3XDM5J6sdIZXjgLeW7OEkVxm7lulmF5Rng1mfR1no8s=;
 b=nt2iT4Wa+F3VVpPNdnvpP7N4VMPOUTHtXvvG0I4qfImuKnwE7XtEfuKUQgbQqJMoVFKK+P
 IIDY4/2JWOs7mUCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eqEPyRJ+;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nt2iT4Wa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749540856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3XDM5J6sdIZXjgLeW7OEkVxm7lulmF5Rng1mfR1no8s=;
 b=eqEPyRJ+fU2ZXgKG/3W33NjTm3c03H3DphEqZNRhUahDDwHSJBv/11HCacNgYs/zXPjuWQ
 OITB5ciE6HSHZTUsle971+OZrOV7UqL5YwrgUzdWwCIp4g0MK5dlI057evb+RjDpxSe6wF
 Yj4Ig8tFqK9OTzRazwikdhZSzlU4B4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749540856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3XDM5J6sdIZXjgLeW7OEkVxm7lulmF5Rng1mfR1no8s=;
 b=nt2iT4Wa+F3VVpPNdnvpP7N4VMPOUTHtXvvG0I4qfImuKnwE7XtEfuKUQgbQqJMoVFKK+P
 IIDY4/2JWOs7mUCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C7FF13964;
 Tue, 10 Jun 2025 07:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZVBjDfjfR2jPBQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 07:34:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: liviu.dudau@arm.com,
	javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] drm/arm/hdlcd: Replace struct simplefb_format with custom
 type
Date: Tue, 10 Jun 2025 09:28:55 +0200
Message-ID: <20250610073027.322944-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: AC3031F45E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
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

Map DRM FourCC codes to pixel descriptions with an internal struct
type. Avoid simplefb's struct simplefb_format, which is for parsing
"simple-framebuffer" DT nodes. Drop the unsupported formats with
alpha channel from the list.

The HDLCD drivers uses struct simplefb_format and its default
initializer SIMPLEFB_FORMATS to map DRM_FORMAT_ constants to pixel
descriptions. The simplefb helpers are for parsing "simple-framebuffer"
DT nodes and should be avoided in other context. Therefore replace it
in hdlcd with a custom struct type and pixel descriptions from
PIXEL_FORMAT_ constants.

This change also removes including <linux/platform_data/simplefb.h>,
which includes several unrelated headers, such as <linux/fb.h>.

v2:
- drop unsupported alpha formats (Liviu)
- keep original sorting of formats (Javier)
- use anonymous type for supported_formats

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/arm/hdlcd_crtc.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 3cfefadc7c9d..806da0aaedf7 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -11,8 +11,8 @@
 
 #include <linux/clk.h>
 #include <linux/of_graph.h>
-#include <linux/platform_data/simplefb.h>
 
+#include <video/pixel_format.h>
 #include <video/videomode.h>
 
 #include <drm/drm_atomic.h>
@@ -73,7 +73,17 @@ static const struct drm_crtc_funcs hdlcd_crtc_funcs = {
 	.disable_vblank = hdlcd_crtc_disable_vblank,
 };
 
-static struct simplefb_format supported_formats[] = SIMPLEFB_FORMATS;
+static const struct {
+	u32 fourcc;
+	struct pixel_format pixel;
+} supported_formats[] = {
+	{ DRM_FORMAT_RGB565, PIXEL_FORMAT_RGB565 },
+	{ DRM_FORMAT_XRGB1555, PIXEL_FORMAT_XRGB1555 },
+	{ DRM_FORMAT_RGB888, PIXEL_FORMAT_RGB888 },
+	{ DRM_FORMAT_XRGB8888, PIXEL_FORMAT_XRGB8888 },
+	{ DRM_FORMAT_XBGR8888, PIXEL_FORMAT_XBGR8888 },
+	{ DRM_FORMAT_XRGB2101010, PIXEL_FORMAT_XRGB2101010},
+};
 
 /*
  * Setup the HDLCD registers for decoding the pixels out of the framebuffer
@@ -83,15 +93,12 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
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
-- 
2.49.0

