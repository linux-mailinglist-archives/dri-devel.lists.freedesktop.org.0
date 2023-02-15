Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7206669806D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C9F10EB12;
	Wed, 15 Feb 2023 16:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EE810EB0A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D5726339A2;
 Wed, 15 Feb 2023 16:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S6iebC12rYcxrX0BlN2r1mk27m3+amr+0SheMSmePmc=;
 b=xvq+jwMFSbR+NHuOvQ5dshPfLcsARaxhjihsOkc5DyxLxkYsL6cXA7elIx4ueQqtOwU78G
 SrFp5OvJhi4Ina+slz9QNBhDf1dZJQgNYRe7zn3iElvYSF5KR7EBIuDZ3dkYLe5dTb9+8r
 xyBJ2EvKbetmN2wp0/hAIxO4huAomyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477723;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S6iebC12rYcxrX0BlN2r1mk27m3+amr+0SheMSmePmc=;
 b=2hgHKUvbcVfsStpqb4gY5DMiWDTsL2pOAHWcUwgpkYs0G5uI5gpb9KkL1luw+rCsB3dU1e
 +pA11cvhc8NsYRAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03E22134BA;
 Wed, 15 Feb 2023 16:15:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UJD3NhoF7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 03/17] drm/cirrus: Use drm_fb_blit() to update scanout buffer
Date: Wed, 15 Feb 2023 17:15:03 +0100
Message-Id: <20230215161517.5113-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215161517.5113-1-tzimmermann@suse.de>
References: <20230215161517.5113-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cirrus' blit helper reimplements code from the shared blit helper
drm_fb_blit(). Use the helper instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 67e83fa42a32..71fa07535298 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -329,20 +329,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	iosys_map_set_vaddr_iomem(&dst, cirrus->vram);
 	iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
 
-	if (cirrus->format == fb->format) {
-		drm_fb_memcpy(&dst, fb->pitches, vmap, fb, rect);
-
-	} else if (fb->format->format == DRM_FORMAT_XRGB8888 &&
-		   cirrus->format->format == DRM_FORMAT_RGB565) {
-		drm_fb_xrgb8888_to_rgb565(&dst, &cirrus->pitch, vmap, fb, rect, false);
-
-	} else if (fb->format->format == DRM_FORMAT_XRGB8888 &&
-		   cirrus->format->format == DRM_FORMAT_RGB565) {
-		drm_fb_xrgb8888_to_rgb888(&dst, &cirrus->pitch, vmap, fb, rect);
-
-	} else {
-		WARN_ON_ONCE("cpp mismatch");
-	}
+	drm_fb_blit(&dst, &cirrus->pitch, cirrus->format->format, vmap, fb, rect);
 
 	drm_dev_exit(idx);
 
-- 
2.39.1

