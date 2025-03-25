Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA0A6EE80
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 12:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237CF10E53A;
	Tue, 25 Mar 2025 11:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nCJ5DgmD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZeV8oXYE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2R87eq63";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kdJKxI+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542D010E18B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 11:04:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE3042116D;
 Tue, 25 Mar 2025 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h75NyRMGtT52fLshLjbMe/1uJ4aAHtWlbNBLEyv4Vu4=;
 b=nCJ5DgmDywc8oFcCjrDRzA2mbH+KzRhpGMzHpF/CLKlBwgldupf9uKxpGLN+0ntjzovXQV
 OWtIrV/wwxJSWsjPveVxZ5fpctQ59nE0/hr4w3BEU4eCvXClQ0SuPSWHG75IhsSm2JgAqM
 KYFHpofXUDa/YrQXIr0A3Ev+Eg4snZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h75NyRMGtT52fLshLjbMe/1uJ4aAHtWlbNBLEyv4Vu4=;
 b=ZeV8oXYEmS3YomfYXaH5mD5Gx0yS7Zm0vh06F1ZcQaVT8ap7AuQ7Yw8GZKlSpZPEteOV3f
 +RQ+8gAohXEgS7Bw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2R87eq63;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kdJKxI+v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h75NyRMGtT52fLshLjbMe/1uJ4aAHtWlbNBLEyv4Vu4=;
 b=2R87eq63NeG665P0PHh7t9f1xf5irBFPp26iZVYCYlTvu5Bvwbz+XeQaRflBHbnK6ObxNz
 VFlyJ+SlbZOd8t8wf0YoHklkP4nUJkXpUU2fp3H6hFmdkOjBp8rGSIgQnphdzhWoy5e1Ic
 sCbQnwfqJb3ZUnYeL1rXucCKlcdY/P8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h75NyRMGtT52fLshLjbMe/1uJ4aAHtWlbNBLEyv4Vu4=;
 b=kdJKxI+vEUiQHr83IV/9xDj/HlrKcSWICfcq2mZ5Y+5AM9Q5/0bab80zaBidjt7WuMhSd2
 aNScRQGoPx3Q+ACw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B752013957;
 Tue, 25 Mar 2025 11:04:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YI1GK6+N4meFVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Mar 2025 11:04:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/8] drm/format-helper: Add generic conversion to 16-bit
 formats
Date: Tue, 25 Mar 2025 11:31:09 +0100
Message-ID: <20250325110407.81107-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250325110407.81107-1-tzimmermann@suse.de>
References: <20250325110407.81107-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EE3042116D
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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

Add drm_fb_xfrm_line_32to16() to implement conversion from 32-bit
pixels to 16-bit pixels. The pixel-conversion is specified by the
given callback parameter. Mark the helper as always_inline to avoid
overhead from function calls.

Then implement all existing line-conversion functions with the new
generic call and the respective pixel-conversion helper. There's one
pixel-conversion helper that swaps output bytes. It is for gud and
requires refactoring, so don't move it into the header file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c   | 118 +++++---------------------
 drivers/gpu/drm/drm_format_internal.h |  12 +++
 2 files changed, 34 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 5a2fe3d685a2..aecf55c1fc6b 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -246,6 +246,18 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 				     xfrm_line);
 }
 
+static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf,
+						    unsigned int pixels,
+						    u32 (*xfrm_pixel)(u32))
+{
+	__le16 *dbuf16 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	const __le32 *send32 = sbuf32 + pixels;
+
+	while (sbuf32 < send32)
+		*dbuf16++ = cpu_to_le16(xfrm_pixel(le32_to_cpup(sbuf32++)));
+}
+
 static __always_inline void drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf,
 						    unsigned int pixels,
 						    u32 (*xfrm_pixel)(u32))
@@ -448,38 +460,19 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
 
 static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	__le16 *dbuf16 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u16 val16;
-	u32 pix;
+	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_rgb565);
+}
 
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val16 = ((pix & 0x00F80000) >> 8) |
-			((pix & 0x0000FC00) >> 5) |
-			((pix & 0x000000F8) >> 3);
-		dbuf16[x] = cpu_to_le16(val16);
-	}
+static __always_inline u32 drm_xrgb8888_to_rgb565_swab(u32 pix)
+{
+	return swab16(drm_pixel_xrgb8888_to_rgb565(pix));
 }
 
 /* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
 static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
 						unsigned int pixels)
 {
-	__le16 *dbuf16 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u16 val16;
-	u32 pix;
-
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val16 = ((pix & 0x00F80000) >> 8) |
-			((pix & 0x0000FC00) >> 5) |
-			((pix & 0x000000F8) >> 3);
-		dbuf16[x] = cpu_to_le16(swab16(val16));
-	}
+	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_xrgb8888_to_rgb565_swab);
 }
 
 /**
@@ -526,19 +519,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
 static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	__le16 *dbuf16 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u16 val16;
-	u32 pix;
-
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val16 = ((pix & 0x00f80000) >> 9) |
-			((pix & 0x0000f800) >> 6) |
-			((pix & 0x000000f8) >> 3);
-		dbuf16[x] = cpu_to_le16(val16);
-	}
+	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_xrgb1555);
 }
 
 /**
@@ -578,20 +559,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
 
 static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	__le16 *dbuf16 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u16 val16;
-	u32 pix;
-
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val16 = BIT(15) | /* set alpha bit */
-			((pix & 0x00f80000) >> 9) |
-			((pix & 0x0000f800) >> 6) |
-			((pix & 0x000000f8) >> 3);
-		dbuf16[x] = cpu_to_le16(val16);
-	}
+	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_argb1555);
 }
 
 /**
@@ -631,20 +599,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555);
 
 static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	__le16 *dbuf16 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u16 val16;
-	u32 pix;
-
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val16 = ((pix & 0x00f80000) >> 8) |
-			((pix & 0x0000f800) >> 5) |
-			((pix & 0x000000f8) >> 2) |
-			BIT(0); /* set alpha bit */
-		dbuf16[x] = cpu_to_le16(val16);
-	}
+	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_rgba5551);
 }
 
 /**
@@ -980,36 +935,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
 
 static void drm_fb_argb8888_to_argb4444_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	unsigned int pixels2 = pixels & ~GENMASK_ULL(0, 0);
-	__le32 *dbuf32 = dbuf;
-	__le16 *dbuf16 = dbuf + pixels2 * sizeof(*dbuf16);
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u32 val32;
-	u16 val16;
-	u32 pix[2];
-
-	for (x = 0; x < pixels2; x += 2, ++dbuf32) {
-		pix[0] = le32_to_cpu(sbuf32[x]);
-		pix[1] = le32_to_cpu(sbuf32[x + 1]);
-		val32 = ((pix[0] & 0xf0000000) >> 16) |
-			((pix[0] & 0x00f00000) >> 12) |
-			((pix[0] & 0x0000f000) >> 8) |
-			((pix[0] & 0x000000f0) >> 4) |
-			((pix[1] & 0xf0000000) >> 0) |
-			((pix[1] & 0x00f00000) << 4) |
-			((pix[1] & 0x0000f000) << 8) |
-			((pix[1] & 0x000000f0) << 12);
-		*dbuf32 = cpu_to_le32(val32);
-	}
-	for (; x < pixels; x++) {
-		pix[0] = le32_to_cpu(sbuf32[x]);
-		val16 = ((pix[0] & 0xf0000000) >> 16) |
-			((pix[0] & 0x00f00000) >> 12) |
-			((pix[0] & 0x0000f000) >> 8) |
-			((pix[0] & 0x000000f0) >> 4);
-		dbuf16[x] = cpu_to_le16(val16);
-	}
+	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_argb8888_to_argb4444);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
index e7fcf260a914..4f20b63cb6f6 100644
--- a/drivers/gpu/drm/drm_format_internal.h
+++ b/drivers/gpu/drm/drm_format_internal.h
@@ -128,4 +128,16 @@ static inline u32 drm_pixel_xrgb8888_to_abgr2101010(u32 pix)
 	       drm_pixel_xrgb8888_to_xbgr2101010(pix);
 }
 
+/*
+ * Conversion from ARGB8888
+ */
+
+static inline u32 drm_pixel_argb8888_to_argb4444(u32 pix)
+{
+	return ((pix & 0xf0000000) >> 16) |
+	       ((pix & 0x00f00000) >> 12) |
+	       ((pix & 0x0000f000) >> 8) |
+	       ((pix & 0x000000f0) >> 4);
+}
+
 #endif
-- 
2.48.1

