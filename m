Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FA14D77FC
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 20:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3EF10E2B2;
	Sun, 13 Mar 2022 19:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B233E10E2AD
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 19:29:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5F8151F38F;
 Sun, 13 Mar 2022 19:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647199794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5Y7xtLg1mBmYxCAbh/wtl/cBwYYKhHRj5izkiLR5/0=;
 b=ljP/2qPg9PsOeJIoGNYXCtkh8tn+ZvClm8Nsi3Oaq3e2HvSh2ZitFZwz/DxmXMg1c8t0/X
 Y0EqtmIcISoq/Fi7fnzCSdq2eumwjnLOdN+5ScMWNI1jp8CUn2U6NSRhD+mado5/+7pyqx
 QJSUG/2Wx/yVPy7FCCC03ZPKLy101oM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647199794;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5Y7xtLg1mBmYxCAbh/wtl/cBwYYKhHRj5izkiLR5/0=;
 b=EaggkOgIuzf3Zrptg7canmlbETUnwuljnX0ZN8fDLSzJHy41Aq2Ml/1YhCQZxbtehuA+mw
 yTY5oYGlD0FtFVAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 301B813FA7;
 Sun, 13 Mar 2022 19:29:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iK3OCjJGLmIiFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 13 Mar 2022 19:29:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, deller@gmx.de, m.szyprowski@samsung.com,
 geert@linux-m68k.org, javierm@redhat.com, sam@ravnborg.org
Subject: [PATCH 1/2] fbdev: Fix sys_imageblit() for arbitrary image widths
Date: Sun, 13 Mar 2022 20:29:51 +0100
Message-Id: <20220313192952.12058-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220313192952.12058-1-tzimmermann@suse.de>
References: <20220313192952.12058-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 6f29e04938bf ("fbdev: Improve performance of sys_imageblit()")
broke sys_imageblit() for image width that are not aligned to 8-bit
boundaries. Fix this by handling the trailing pixels on each line
separately. The performance improvements in the original commit do not
regress by this change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 6f29e04938bf ("fbdev: Improve performance of sys_imageblit()")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/sysimgblt.c | 29 ++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/sysimgblt.c b/drivers/video/fbdev/core/sysimgblt.c
index 722c327a381b..335e92b813fc 100644
--- a/drivers/video/fbdev/core/sysimgblt.c
+++ b/drivers/video/fbdev/core/sysimgblt.c
@@ -188,7 +188,7 @@ static void fast_imageblit(const struct fb_image *image, struct fb_info *p,
 {
 	u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
 	u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
-	u32 bit_mask, eorx;
+	u32 bit_mask, eorx, shift;
 	const char *s = image->data, *src;
 	u32 *dst;
 	const u32 *tab;
@@ -229,17 +229,23 @@ static void fast_imageblit(const struct fb_image *image, struct fb_info *p,
 
 	for (i = image->height; i--; ) {
 		dst = dst1;
+		shift = 8;
 		src = s;
 
+		/*
+		 * Manually unroll the per-line copying loop for better
+		 * performance. This works until we processed the last
+		 * completely filled source byte (inclusive).
+		 */
 		switch (ppw) {
 		case 4: /* 8 bpp */
-			for (j = k; j; j -= 2, ++src) {
+			for (j = k; j >= 2; j -= 2, ++src) {
 				*dst++ = colortab[(*src >> 4) & bit_mask];
 				*dst++ = colortab[(*src >> 0) & bit_mask];
 			}
 			break;
 		case 2: /* 16 bpp */
-			for (j = k; j; j -= 4, ++src) {
+			for (j = k; j >= 4; j -= 4, ++src) {
 				*dst++ = colortab[(*src >> 6) & bit_mask];
 				*dst++ = colortab[(*src >> 4) & bit_mask];
 				*dst++ = colortab[(*src >> 2) & bit_mask];
@@ -247,7 +253,7 @@ static void fast_imageblit(const struct fb_image *image, struct fb_info *p,
 			}
 			break;
 		case 1: /* 32 bpp */
-			for (j = k; j; j -= 8, ++src) {
+			for (j = k; j >= 8; j -= 8, ++src) {
 				*dst++ = colortab[(*src >> 7) & bit_mask];
 				*dst++ = colortab[(*src >> 6) & bit_mask];
 				*dst++ = colortab[(*src >> 5) & bit_mask];
@@ -259,6 +265,21 @@ static void fast_imageblit(const struct fb_image *image, struct fb_info *p,
 			}
 			break;
 		}
+
+		/*
+		 * For image widths that are not a multiple of 8, there
+		 * are trailing pixels left on the current line. Print
+		 * them as well.
+		 */
+		for (; j--; ) {
+			shift -= ppw;
+			*dst++ = colortab[(*src >> shift) & bit_mask];
+			if (!shift) {
+				shift = 8;
+				++src;
+			}
+		}
+
 		dst1 += p->fix.line_length;
 		s += spitch;
 	}
-- 
2.35.1

