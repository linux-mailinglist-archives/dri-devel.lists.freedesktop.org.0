Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841075118AE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB41310F4BC;
	Wed, 27 Apr 2022 14:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3568D10E00D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 14:14:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B2849210F1;
 Wed, 27 Apr 2022 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651068853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WomITL2jRN1skvvYoN7VMixukzLKGD0jsPz3gZbHfrI=;
 b=rQLW4XuIgYw8uNg1eBL5lQNbUFw3awjb/IjB2KmOG4FrwYUTnijD/EPnsTNxIci66An4I2
 NfO9+iNFWQdksDc26IQhNAiKU5Ld0n6YqsvpwQGVhdiGVFHqN7niksX444AUWcC4cdEFnr
 3wBr8VjdieuamquHeZpbdRj8H8V0kl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651068853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WomITL2jRN1skvvYoN7VMixukzLKGD0jsPz3gZbHfrI=;
 b=Ga7NGEdVPX6ClWHT1h6kR2STFvmJ5Eh7LXLOOTptv0U4OBDTI3Irzeg/oNJ76ts1w12O/E
 agh43ovZjQPLcLBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8501313A39;
 Wed, 27 Apr 2022 14:14:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gByZH7VPaWLfbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Apr 2022 14:14:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/4] drm/format-helper: Unify the parameters of all per-line
 conversion helpers
Date: Wed, 27 Apr 2022 16:14:08 +0200
Message-Id: <20220427141409.22842-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427141409.22842-1-tzimmermann@suse.de>
References: <20220427141409.22842-1-tzimmermann@suse.de>
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

Give each per-line conversion helper pointers of type void and the
number of pixels in the line. Remove the unused swab parameters.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 87 +++++++++++++++++------------
 1 file changed, 50 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index b7daa40fc856..21d0d282c6a1 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -177,16 +177,19 @@ void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
 }
 EXPORT_SYMBOL(drm_fb_swab);
 
-static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, const __le32 *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigned int pixels,
+					   bool swab)
 {
+	u8 *dbuf8 = dbuf;
+	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
 	u32 pix;
 
 	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf[x]);
-		dbuf[x] = ((pix & 0x00e00000) >> 16) |
-			  ((pix & 0x0000e000) >> 11) |
-			  ((pix & 0x000000c0) >> 6);
+		pix = le32_to_cpu(sbuf32[x]);
+		dbuf8[x] = ((pix & 0x00e00000) >> 16) |
+			   ((pix & 0x0000e000) >> 11) |
+			   ((pix & 0x000000c0) >> 6);
 	}
 }
 
@@ -219,7 +222,7 @@ void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *sr
 	src += clip_offset(clip, fb->pitches[0], sizeof(u32));
 	for (y = 0; y < drm_rect_height(clip); y++) {
 		memcpy(sbuf, src, src_len);
-		drm_fb_xrgb8888_to_rgb332_line(dst, sbuf, width);
+		drm_fb_xrgb8888_to_rgb332_line(dst, sbuf, width, false);
 		src += fb->pitches[0];
 		dst += dst_pitch;
 	}
@@ -228,31 +231,34 @@ void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *sr
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
 
-static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, const u32 *sbuf,
-					   unsigned int pixels)
+static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
+	u16 *dbuf16 = dbuf;
+	const u32 *sbuf32 = sbuf;
 	unsigned int x;
 	u16 val16;
 
 	for (x = 0; x < pixels; x++) {
-		val16 = ((sbuf[x] & 0x00F80000) >> 8) |
-			((sbuf[x] & 0x0000FC00) >> 5) |
-			((sbuf[x] & 0x000000F8) >> 3);
-		dbuf[x] = val16;
+		val16 = ((sbuf32[x] & 0x00F80000) >> 8) |
+			((sbuf32[x] & 0x0000FC00) >> 5) |
+			((sbuf32[x] & 0x000000F8) >> 3);
+		dbuf16[x] = val16;
 	}
 }
 
-static void drm_fb_xrgb8888_to_rgb565_swab_line(u16 *dbuf, const u32 *sbuf,
+static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
 						unsigned int pixels)
 {
+	u16 *dbuf16 = dbuf;
+	const u32 *sbuf32 = sbuf;
 	unsigned int x;
 	u16 val16;
 
 	for (x = 0; x < pixels; x++) {
-		val16 = ((sbuf[x] & 0x00F80000) >> 8) |
-			((sbuf[x] & 0x0000FC00) >> 5) |
-			((sbuf[x] & 0x000000F8) >> 3);
-		dbuf[x] = swab16(val16);
+		val16 = ((sbuf32[x] & 0x00F80000) >> 8) |
+			((sbuf32[x] & 0x0000FC00) >> 5) |
+			((sbuf32[x] & 0x000000F8) >> 3);
+		dbuf16[x] = swab16(val16);
 	}
 }
 
@@ -347,15 +353,16 @@ void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_toio);
 
-static void drm_fb_xrgb8888_to_rgb888_line(u8 *dbuf, const u32 *sbuf,
-					   unsigned int pixels)
+static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
+	u8 *dbuf8 = dbuf;
+	const u32 *sbuf32 = sbuf;
 	unsigned int x;
 
 	for (x = 0; x < pixels; x++) {
-		*dbuf++ = (sbuf[x] & 0x000000FF) >>  0;
-		*dbuf++ = (sbuf[x] & 0x0000FF00) >>  8;
-		*dbuf++ = (sbuf[x] & 0x00FF0000) >> 16;
+		*dbuf8++ = (sbuf32[x] & 0x000000FF) >>  0;
+		*dbuf8++ = (sbuf32[x] & 0x0000FF00) >>  8;
+		*dbuf8++ = (sbuf32[x] & 0x00FF0000) >> 16;
 	}
 }
 
@@ -521,17 +528,18 @@ static void drm_fb_rgb888_to_xrgb8888_toio(void __iomem *dst, unsigned int dst_p
 	kfree(dbuf);
 }
 
-static void drm_fb_xrgb8888_to_xrgb2101010_line(u32 *dbuf, const u32 *sbuf,
-						unsigned int pixels)
+static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
+	u32 *dbuf32 = dbuf;
+	const u32 *sbuf32 = sbuf;
 	unsigned int x;
 	u32 val32;
 
 	for (x = 0; x < pixels; x++) {
-		val32 = ((sbuf[x] & 0x000000FF) << 2) |
-			((sbuf[x] & 0x0000FF00) << 4) |
-			((sbuf[x] & 0x00FF0000) << 6);
-		*dbuf++ = val32 | ((val32 >> 8) & 0x00300C03);
+		val32 = ((sbuf32[x] & 0x000000FF) << 2) |
+			((sbuf32[x] & 0x0000FF00) << 4) |
+			((sbuf32[x] & 0x00FF0000) << 6);
+		*dbuf32++ = val32 | ((val32 >> 8) & 0x00300C03);
 	}
 }
 
@@ -576,18 +584,20 @@ void drm_fb_xrgb8888_to_xrgb2101010_toio(void __iomem *dst,
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010_toio);
 
-static void drm_fb_xrgb8888_to_gray8_line(u8 *dst, const u32 *src, unsigned int pixels)
+static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
+	u8 *dbuf8 = dbuf;
+	const u32 *sbuf32 = sbuf;
 	unsigned int x;
 
 	for (x = 0; x < pixels; x++) {
-		u8 r = (*src & 0x00ff0000) >> 16;
-		u8 g = (*src & 0x0000ff00) >> 8;
-		u8 b =  *src & 0x000000ff;
+		u8 r = (*sbuf32 & 0x00ff0000) >> 16;
+		u8 g = (*sbuf32 & 0x0000ff00) >> 8;
+		u8 b =  *sbuf32 & 0x000000ff;
 
 		/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
-		*dst++ = (3 * r + 6 * g + b) / 10;
-		src++;
+		*dbuf8++ = (3 * r + 6 * g + b) / 10;
+		sbuf32++;
 	}
 }
 
@@ -716,17 +726,20 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 EXPORT_SYMBOL(drm_fb_blit_toio);
 
 
-static void drm_fb_gray8_to_mono_line(u8 *dst, const u8 *src, unsigned int pixels)
+static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
+	u8 *dbuf8 = dbuf;
+	const u8 *sbuf8 = sbuf;
+
 	while (pixels) {
 		unsigned int i, bits = min(pixels, 8U);
 		u8 byte = 0;
 
 		for (i = 0; i < bits; i++, pixels--) {
-			if (*src++ >= 128)
+			if (*sbuf8++ >= 128)
 				byte |= BIT(i);
 		}
-		*dst++ = byte;
+		*dbuf8++ = byte;
 	}
 }
 
-- 
2.36.0

