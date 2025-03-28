Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FE0A74C58
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672F910EA37;
	Fri, 28 Mar 2025 14:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1mSicGHE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N3IVSGBn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1mSicGHE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N3IVSGBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B3110EA35
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 14:21:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D676211D5;
 Fri, 28 Mar 2025 14:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743171657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBYgeg9BBrn+sRheTc0T807FpePX2vfBRU9Y081EBLA=;
 b=1mSicGHEfWjSxvthih/qCDnjG6stBOjEfvvaroSIhS7E5roHzIMUYD7tSKKb48nH40xm4P
 bv6g9lyM6dlPyR3g5cKxY42Jo/kQkR9KLpmKkzHQgI/v3hJtecvOBbsc/rxgQpc2w9kFsO
 w1/efcezJYtMc4mC09znlAI9wO2e3to=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743171657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBYgeg9BBrn+sRheTc0T807FpePX2vfBRU9Y081EBLA=;
 b=N3IVSGBnLFluVEVRTASQNBiMCY1ycHh3wFyTrEaqfU/H5/ZkftATyefS9aqToR1Ugs5kSj
 XGeVQ4QLwr5hdWBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743171657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBYgeg9BBrn+sRheTc0T807FpePX2vfBRU9Y081EBLA=;
 b=1mSicGHEfWjSxvthih/qCDnjG6stBOjEfvvaroSIhS7E5roHzIMUYD7tSKKb48nH40xm4P
 bv6g9lyM6dlPyR3g5cKxY42Jo/kQkR9KLpmKkzHQgI/v3hJtecvOBbsc/rxgQpc2w9kFsO
 w1/efcezJYtMc4mC09znlAI9wO2e3to=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743171657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBYgeg9BBrn+sRheTc0T807FpePX2vfBRU9Y081EBLA=;
 b=N3IVSGBnLFluVEVRTASQNBiMCY1ycHh3wFyTrEaqfU/H5/ZkftATyefS9aqToR1Ugs5kSj
 XGeVQ4QLwr5hdWBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11D5E139D4;
 Fri, 28 Mar 2025 14:20:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uAQEA0mw5mdOdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Mar 2025 14:20:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, jani.nikula@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/8] drm/format-helper: Add generic conversion to 24-bit
 formats
Date: Fri, 28 Mar 2025 15:14:59 +0100
Message-ID: <20250328141709.217283-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328141709.217283-1-tzimmermann@suse.de>
References: <20250328141709.217283-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.987];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,ffwll.ch,gmail.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
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

Add drm_fb_xfrm_line_32to24() to implement conversion from 32-bit
pixels to 24-bit pixels. The pixel-conversion is specified by the
given callback parameter. Mark the helper as always_inline to avoid
overhead from function calls.

Then implement all existing line-conversion functions with the new
generic call and the respective pixel-conversion helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c   | 43 ++++++++++++---------------
 drivers/gpu/drm/drm_format_internal.h | 12 ++++++++
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index abd18c23cfbb5..5a2fe3d685a2c 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -246,6 +246,23 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 				     xfrm_line);
 }
 
+static __always_inline void drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf,
+						    unsigned int pixels,
+						    u32 (*xfrm_pixel)(u32))
+{
+	u8 *dbuf8 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	const __le32 *send32 = sbuf32 + pixels;
+
+	while (sbuf32 < send32) {
+		u32 val24 = xfrm_pixel(le32_to_cpup(sbuf32++));
+		/* write output in reverse order for little endianness */
+		*dbuf8++ = (val24 & 0x000000ff);
+		*dbuf8++ = (val24 & 0x0000ff00) >>  8;
+		*dbuf8++ = (val24 & 0x00ff0000) >> 16;
+	}
+}
+
 static __always_inline void drm_fb_xfrm_line_32to32(void *dbuf, const void *sbuf,
 						    unsigned int pixels,
 						    u32 (*xfrm_pixel)(u32))
@@ -667,18 +684,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551);
 
 static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	u8 *dbuf8 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u32 pix;
-
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		/* write blue-green-red to output in little endianness */
-		*dbuf8++ = (pix & 0x000000FF) >>  0;
-		*dbuf8++ = (pix & 0x0000FF00) >>  8;
-		*dbuf8++ = (pix & 0x00FF0000) >> 16;
-	}
+	drm_fb_xfrm_line_32to24(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_rgb888);
 }
 
 /**
@@ -718,18 +724,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
 
 static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	u8 *dbuf8 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u32 pix;
-
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		/* write red-green-blue to output in little endianness */
-		*dbuf8++ = (pix & 0x00ff0000) >> 16;
-		*dbuf8++ = (pix & 0x0000ff00) >> 8;
-		*dbuf8++ = (pix & 0x000000ff) >> 0;
-	}
+	drm_fb_xfrm_line_32to24(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_bgr888);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
index 5f82f0b9c8e81..e7fcf260a9146 100644
--- a/drivers/gpu/drm/drm_format_internal.h
+++ b/drivers/gpu/drm/drm_format_internal.h
@@ -68,6 +68,18 @@ static inline u32 drm_pixel_xrgb8888_to_argb1555(u32 pix)
 	       drm_pixel_xrgb8888_to_xrgb1555(pix);
 }
 
+static inline u32 drm_pixel_xrgb8888_to_rgb888(u32 pix)
+{
+	return pix & GENMASK(23, 0);
+}
+
+static inline u32 drm_pixel_xrgb8888_to_bgr888(u32 pix)
+{
+	return ((pix & 0x00ff0000) >> 16) |
+	       ((pix & 0x0000ff00)) |
+	       ((pix & 0x000000ff) << 16);
+}
+
 static inline u32 drm_pixel_xrgb8888_to_argb8888(u32 pix)
 {
 	return GENMASK(31, 24) | /* fill alpha bits */
-- 
2.48.1

