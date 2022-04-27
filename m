Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311F25118AC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1F410E0B1;
	Wed, 27 Apr 2022 14:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83E110E0B1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 14:14:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7F3251F752;
 Wed, 27 Apr 2022 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651068853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+smXrh8EiZAErGrvr3l0R5ABoR2IBxuDd8FG2mOE5Ak=;
 b=Aru9xdqB1v57MKxgfURMP8oZJChO+/CP4bK+tnl9aY2HQjrXKCnFb9ClkrkP5Tal5aQsnR
 xMMFrTaZPWHEVNlgF5u74LtPL+9PmkmCtt+36kzjOR/dmALUga3ivJnk4R4jMS0E/+3Vl8
 EeIIuHkSTLm7UQq9S5+TaEAkrT6Hgz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651068853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+smXrh8EiZAErGrvr3l0R5ABoR2IBxuDd8FG2mOE5Ak=;
 b=9imeygXeIoF2EJHGGKibnlDvRilmJKpSt2htoZW3TIiNCT30qKZwbwLdle+nJXVd6VgnHy
 lia+iJp2NUHfr2Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51D8313A39;
 Wed, 27 Apr 2022 14:14:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KNjYErVPaWLfbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Apr 2022 14:14:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/4] drm/format-helper: Remove optional byte-swap from line
 convertion
Date: Wed, 27 Apr 2022 16:14:07 +0200
Message-Id: <20220427141409.22842-3-tzimmermann@suse.de>
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

Implement per-pixel byte swapping in a separate conversion helper
for the single function that requires it. Select the correct helper
for each conversion.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 32 +++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index f70499344a04..b7daa40fc856 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -229,8 +229,7 @@ void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *sr
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
 
 static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, const u32 *sbuf,
-					   unsigned int pixels,
-					   bool swab)
+					   unsigned int pixels)
 {
 	unsigned int x;
 	u16 val16;
@@ -239,10 +238,21 @@ static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, const u32 *sbuf,
 		val16 = ((sbuf[x] & 0x00F80000) >> 8) |
 			((sbuf[x] & 0x0000FC00) >> 5) |
 			((sbuf[x] & 0x000000F8) >> 3);
-		if (swab)
-			dbuf[x] = swab16(val16);
-		else
-			dbuf[x] = val16;
+		dbuf[x] = val16;
+	}
+}
+
+static void drm_fb_xrgb8888_to_rgb565_swab_line(u16 *dbuf, const u32 *sbuf,
+						unsigned int pixels)
+{
+	unsigned int x;
+	u16 val16;
+
+	for (x = 0; x < pixels; x++) {
+		val16 = ((sbuf[x] & 0x00F80000) >> 8) |
+			((sbuf[x] & 0x0000FC00) >> 5) |
+			((sbuf[x] & 0x000000F8) >> 3);
+		dbuf[x] = swab16(val16);
 	}
 }
 
@@ -282,7 +292,10 @@ void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *va
 	vaddr += clip_offset(clip, fb->pitches[0], sizeof(u32));
 	for (y = 0; y < lines; y++) {
 		memcpy(sbuf, vaddr, src_len);
-		drm_fb_xrgb8888_to_rgb565_line(dst, sbuf, linepixels, swab);
+		if (swab)
+			drm_fb_xrgb8888_to_rgb565_swab_line(dst, sbuf, linepixels);
+		else
+			drm_fb_xrgb8888_to_rgb565_line(dst, sbuf, linepixels);
 		vaddr += fb->pitches[0];
 		dst += dst_pitch;
 	}
@@ -321,7 +334,10 @@ void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
 
 	vaddr += clip_offset(clip, fb->pitches[0], sizeof(u32));
 	for (y = 0; y < lines; y++) {
-		drm_fb_xrgb8888_to_rgb565_line(dbuf, vaddr, linepixels, swab);
+		if (swab)
+			drm_fb_xrgb8888_to_rgb565_swab_line(dbuf, vaddr, linepixels);
+		else
+			drm_fb_xrgb8888_to_rgb565_line(dbuf, vaddr, linepixels);
 		memcpy_toio(dst, dbuf, dst_len);
 		vaddr += fb->pitches[0];
 		dst += dst_pitch;
-- 
2.36.0

