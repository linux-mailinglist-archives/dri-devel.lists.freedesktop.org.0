Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7862A5B1958
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 11:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F80310EA1F;
	Thu,  8 Sep 2022 09:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08AE10E9F6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 09:51:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F10F1F941;
 Thu,  8 Sep 2022 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662630680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cx50lc81+Z2nMKWe4ODzX64f5+EKiSouaE6Ruy8+SJg=;
 b=dT3Zmgc2wZvFrSnbSc2Q5x2yvVKxljiNiuyAig2IGCvfsvrZmHKjaC6Q+nUxgkaly33oVz
 exkMYYjzdY//m5GN80DwKG+jPKBj/QwSd+kOqovV0qkHr0jQwFNH1XFXSStxyMVRLq2AIf
 CSbT3d+koQG1nK6672lpR2Qeewh3tms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662630680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cx50lc81+Z2nMKWe4ODzX64f5+EKiSouaE6Ruy8+SJg=;
 b=WUONBtN52/2H5YCZYKTVoAlXcFooWYXYcIrrzejuIh1kPVpm0lb6mA6buh0DsI3j7rSabF
 mjo9w44W0ouO2/CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB77B13A6D;
 Thu,  8 Sep 2022 09:51:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MOXTNBe7GWNrUgAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 08 Sep 2022 09:51:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 07/12] drm/udl: Drop unneeded alignment
Date: Thu,  8 Sep 2022 11:51:10 +0200
Message-Id: <20220908095115.23396-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220908095115.23396-1-tiwai@suse.de>
References: <20220908095115.23396-1-tiwai@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The alignment of damaged area was needed for the original udlfb driver
that tried to trim the superfluous copies between front and backend
buffers and handle data in long int.  It's not the case for udl DRM
driver, hence we can omit the whole unneeded alignment, as well as the
dead code.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c  | 28 +--------------------
 drivers/gpu/drm/udl/udl_transfer.c | 40 ------------------------------
 2 files changed, 1 insertion(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index cbdda2d8b882..c9b837ac26a7 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -242,28 +242,6 @@ static long udl_log_cpp(unsigned int cpp)
 	return __ffs(cpp);
 }
 
-static int udl_aligned_damage_clip(struct drm_rect *clip, int x, int y,
-				   int width, int height)
-{
-	int x1, x2;
-
-	if (WARN_ON_ONCE(x < 0) ||
-	    WARN_ON_ONCE(y < 0) ||
-	    WARN_ON_ONCE(width < 0) ||
-	    WARN_ON_ONCE(height < 0))
-		return -EINVAL;
-
-	x1 = ALIGN_DOWN(x, sizeof(unsigned long));
-	x2 = ALIGN(width + (x - x1), sizeof(unsigned long)) + x1;
-
-	clip->x1 = x1;
-	clip->y1 = y;
-	clip->x2 = x2;
-	clip->y2 = y + height;
-
-	return 0;
-}
-
 static int udl_handle_damage(struct drm_framebuffer *fb,
 			     const struct iosys_map *map,
 			     int x, int y, int width, int height)
@@ -281,11 +259,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 		return ret;
 	log_bpp = ret;
 
-	ret = udl_aligned_damage_clip(&clip, x, y, width, height);
-	if (ret)
-		return ret;
-	else if ((clip.x2 > fb->width) || (clip.y2 > fb->height))
-		return -EINVAL;
+	drm_rect_init(&clip, x, y, width, height);
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
diff --git a/drivers/gpu/drm/udl/udl_transfer.c b/drivers/gpu/drm/udl/udl_transfer.c
index 176ef2a6a731..a431208dda85 100644
--- a/drivers/gpu/drm/udl/udl_transfer.c
+++ b/drivers/gpu/drm/udl/udl_transfer.c
@@ -25,46 +25,6 @@
 #define MIN_RAW_PIX_BYTES	2
 #define MIN_RAW_CMD_BYTES	(RAW_HEADER_BYTES + MIN_RAW_PIX_BYTES)
 
-/*
- * Trims identical data from front and back of line
- * Sets new front buffer address and width
- * And returns byte count of identical pixels
- * Assumes CPU natural alignment (unsigned long)
- * for back and front buffer ptrs and width
- */
-#if 0
-static int udl_trim_hline(const u8 *bback, const u8 **bfront, int *width_bytes)
-{
-	int j, k;
-	const unsigned long *back = (const unsigned long *) bback;
-	const unsigned long *front = (const unsigned long *) *bfront;
-	const int width = *width_bytes / sizeof(unsigned long);
-	int identical = width;
-	int start = width;
-	int end = width;
-
-	for (j = 0; j < width; j++) {
-		if (back[j] != front[j]) {
-			start = j;
-			break;
-		}
-	}
-
-	for (k = width - 1; k > j; k--) {
-		if (back[k] != front[k]) {
-			end = k+1;
-			break;
-		}
-	}
-
-	identical = start + (width - end);
-	*bfront = (u8 *) &front[start];
-	*width_bytes = (end - start) * sizeof(unsigned long);
-
-	return identical * sizeof(unsigned long);
-}
-#endif
-
 static inline u16 pixel32_to_be16(const uint32_t pixel)
 {
 	return (((pixel >> 3) & 0x001f) |
-- 
2.35.3

