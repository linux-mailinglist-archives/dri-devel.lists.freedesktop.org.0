Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B09F5118B0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1313410F4BD;
	Wed, 27 Apr 2022 14:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607D710E93A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 14:14:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D4B21F74F;
 Wed, 27 Apr 2022 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651068853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqL9dGiT73OmRuxxZpAjWDw0ITAGjSuhlXbEqS6UMF0=;
 b=a/UKHBJZjlLaHw1bf1/KiRTqQM5nEKOoEyGPRkdM/Z7cZYGleHMwU5Ky3sLzmz3T8LNcGe
 0eUU7XMU+EHMYmtYI9iIrSON39PAIMC5+/kl+f5tqfINHavN+3BQeja5QUA5G5zlaScTPf
 MtHlSMgxY1BYYgjgvdfWf1B1K83I4FM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651068853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqL9dGiT73OmRuxxZpAjWDw0ITAGjSuhlXbEqS6UMF0=;
 b=wZRFHKZxX1h1JO8VQLGcMtz86LhvfHwYPrtNoB94rzNtGaKn+hYzy0J64u8+Jh3BV9N2XV
 8XH/r0hXH9IlRzAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 256D013A39;
 Wed, 27 Apr 2022 14:14:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0GgoCLVPaWLfbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Apr 2022 14:14:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/4] drm/format-helper: Implement drm_fb_swab() with per-line
 helpers
Date: Wed, 27 Apr 2022 16:14:06 +0200
Message-Id: <20220427141409.22842-2-tzimmermann@suse.de>
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

Replace the inner loop of drm_fb_swab() with helper functions that
swap the bytes in each pixel. This will allow to share the outer
loop with other conversion helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 60 +++++++++++++++++------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 34b7ef443ad2..f70499344a04 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -100,6 +100,26 @@ void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch, const void *v
 }
 EXPORT_SYMBOL(drm_fb_memcpy_toio);
 
+static void drm_fb_swab16_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	u16 *dbuf16 = dbuf;
+	const u16 *sbuf16 = sbuf;
+	const u16 *send16 = sbuf16 + pixels;
+
+	while (sbuf16 < send16)
+		*dbuf16++ = swab16(*sbuf16++);
+}
+
+static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	u32 *dbuf32 = dbuf;
+	const u32 *sbuf32 = sbuf;
+	const u32 *send32 = sbuf32 + pixels;
+
+	while (sbuf32 < send32)
+		*dbuf32++ = swab32(*sbuf32++);
+}
+
 /**
  * drm_fb_swab - Swap bytes into clip buffer
  * @dst: Destination buffer
@@ -120,12 +140,11 @@ void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
 		 bool cached)
 {
 	u8 cpp = fb->format->cpp[0];
-	size_t len = drm_rect_width(clip) * cpp;
-	const u16 *src16;
-	const u32 *src32;
-	u16 *dst16;
-	u32 *dst32;
-	unsigned int x, y;
+	unsigned long linepixels = drm_rect_width(clip);
+	size_t len = linepixels * cpp;
+	const void *sbuf;
+	void *dbuf;
+	unsigned int y;
 	void *buf = NULL;
 
 	if (WARN_ON_ONCE(cpp != 2 && cpp != 4))
@@ -133,31 +152,22 @@ void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
 
 	if (!dst_pitch)
 		dst_pitch = len;
+	src += clip_offset(clip, fb->pitches[0], cpp);
 
 	if (!cached)
 		buf = kmalloc(len, GFP_KERNEL);
 
-	src += clip_offset(clip, fb->pitches[0], cpp);
-
 	for (y = clip->y1; y < clip->y2; y++) {
-		if (buf) {
-			memcpy(buf, src, len);
-			src16 = buf;
-			src32 = buf;
-		} else {
-			src16 = src;
-			src32 = src;
-		}
-
-		dst16 = dst;
-		dst32 = dst;
+		if (buf)
+			sbuf = memcpy(buf, src, len);
+		else
+			sbuf = src;
+		dbuf = dst + clip->x1 * cpp;
 
-		for (x = clip->x1; x < clip->x2; x++) {
-			if (cpp == 4)
-				*dst32++ = swab32(*src32++);
-			else
-				*dst16++ = swab16(*src16++);
-		}
+		if (cpp == 4)
+			drm_fb_swab32_line(dbuf, sbuf, linepixels);
+		else
+			drm_fb_swab16_line(dbuf, sbuf, linepixels);
 
 		src += fb->pitches[0];
 		dst += dst_pitch;
-- 
2.36.0

