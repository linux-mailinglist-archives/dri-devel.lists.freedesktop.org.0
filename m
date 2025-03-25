Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAE4A6EE74
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 12:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DA310E396;
	Tue, 25 Mar 2025 11:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="P8lhq1Ax";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qu4yxj8J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P8lhq1Ax";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qu4yxj8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B08410E536
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 11:04:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7521E2116C;
 Tue, 25 Mar 2025 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2u0N00MbDVNYPaxa25FsxWkrY39Y6RNz7lugCp+Uls=;
 b=P8lhq1AxagTUo+ZFTPS7dQb+vAG8NwUpKiSgQ1pzwy0pvrC2QX75Z5YBOU7kh/U4JsMKkG
 IdaQzXjSbfDMoJFBVTi/gjfd4vzXR+1ZoLkDsH8O/h+1i1zMdnI0LyVmlyWluc+LmyyRpL
 r+LTpvmckuB3CMb9g8m1NYN+E+xG1qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2u0N00MbDVNYPaxa25FsxWkrY39Y6RNz7lugCp+Uls=;
 b=Qu4yxj8JOY8eLz1isaC17VD8lRX3vIRdp3vL2r+kB1QXWoJwdzKOHNOyIb8gNImLsxovH6
 k8K0UzUH36CAEwDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P8lhq1Ax;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Qu4yxj8J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2u0N00MbDVNYPaxa25FsxWkrY39Y6RNz7lugCp+Uls=;
 b=P8lhq1AxagTUo+ZFTPS7dQb+vAG8NwUpKiSgQ1pzwy0pvrC2QX75Z5YBOU7kh/U4JsMKkG
 IdaQzXjSbfDMoJFBVTi/gjfd4vzXR+1ZoLkDsH8O/h+1i1zMdnI0LyVmlyWluc+LmyyRpL
 r+LTpvmckuB3CMb9g8m1NYN+E+xG1qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2u0N00MbDVNYPaxa25FsxWkrY39Y6RNz7lugCp+Uls=;
 b=Qu4yxj8JOY8eLz1isaC17VD8lRX3vIRdp3vL2r+kB1QXWoJwdzKOHNOyIb8gNImLsxovH6
 k8K0UzUH36CAEwDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32FA613957;
 Tue, 25 Mar 2025 11:04:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YGgnC6+N4meFVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Mar 2025 11:04:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/8] drm/format-helper: Add generic conversion to 32-bit
 formats
Date: Tue, 25 Mar 2025 11:31:07 +0100
Message-ID: <20250325110407.81107-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250325110407.81107-1-tzimmermann@suse.de>
References: <20250325110407.81107-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7521E2116C
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

Add drm_fb_xfrm_line_32to32() to implement conversion from 32-bit
pixels to 32-bit pixels. The pixel-conversion is specified by the
given callback parameter. Mark the helper as always_inline to avoid
overhead from function calls.

Then implement all existing line-conversion functions with the new
generic call and the respective pixel-conversion helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 84 +++++++----------------------
 1 file changed, 19 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 01d3ab307ac3..abd18c23cfbb 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -20,6 +20,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 
+#include "drm_format_internal.h"
+
 /**
  * drm_format_conv_state_init - Initialize format-conversion state
  * @state: The state to initialize
@@ -244,6 +246,18 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 				     xfrm_line);
 }
 
+static __always_inline void drm_fb_xfrm_line_32to32(void *dbuf, const void *sbuf,
+						    unsigned int pixels,
+						    u32 (*xfrm_pixel)(u32))
+{
+	__le32 *dbuf32 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	const __le32 *send32 = sbuf32 + pixels;
+
+	while (sbuf32 < send32)
+		*dbuf32++ = cpu_to_le32(xfrm_pixel(le32_to_cpup(sbuf32++)));
+}
+
 /**
  * drm_fb_memcpy - Copy clip buffer
  * @dst: Array of destination buffers
@@ -755,16 +769,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_bgr888);
 
 static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	__le32 *dbuf32 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u32 pix;
-
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		pix |= GENMASK(31, 24); /* fill alpha bits */
-		dbuf32[x] = cpu_to_le32(pix);
-	}
+	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_argb8888);
 }
 
 /**
@@ -804,19 +809,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb8888);
 
 static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	__le32 *dbuf32 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u32 pix;
-
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		pix = ((pix & 0x00ff0000) >> 16) <<  0 |
-		      ((pix & 0x0000ff00) >>  8) <<  8 |
-		      ((pix & 0x000000ff) >>  0) << 16 |
-		      GENMASK(31, 24); /* fill alpha bits */
-		*dbuf32++ = cpu_to_le32(pix);
-	}
+	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_abgr8888);
 }
 
 static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
@@ -835,19 +828,7 @@ static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned in
 
 static void drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	__le32 *dbuf32 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u32 pix;
-
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		pix = ((pix & 0x00ff0000) >> 16) <<  0 |
-		      ((pix & 0x0000ff00) >>  8) <<  8 |
-		      ((pix & 0x000000ff) >>  0) << 16 |
-		      ((pix & 0xff000000) >> 24) << 24;
-		*dbuf32++ = cpu_to_le32(pix);
-	}
+	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_xbgr8888);
 }
 
 static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
@@ -866,20 +847,7 @@ static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned in
 
 static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	__le32 *dbuf32 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u32 val32;
-	u32 pix;
-
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val32 = ((pix & 0x000000FF) << 2) |
-			((pix & 0x0000FF00) << 4) |
-			((pix & 0x00FF0000) << 6);
-		pix = val32 | ((val32 >> 8) & 0x00300C03);
-		*dbuf32++ = cpu_to_le32(pix);
-	}
+	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_xrgb2101010);
 }
 
 /**
@@ -920,21 +888,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010);
 
 static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
-	__le32 *dbuf32 = dbuf;
-	const __le32 *sbuf32 = sbuf;
-	unsigned int x;
-	u32 val32;
-	u32 pix;
-
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val32 = ((pix & 0x000000ff) << 2) |
-			((pix & 0x0000ff00) << 4) |
-			((pix & 0x00ff0000) << 6);
-		pix = GENMASK(31, 30) | /* set alpha bits */
-		      val32 | ((val32 >> 8) & 0x00300c03);
-		*dbuf32++ = cpu_to_le32(pix);
-	}
+	drm_fb_xfrm_line_32to32(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_argb2101010);
 }
 
 /**
-- 
2.48.1

