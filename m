Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC4698080
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8415010EB1F;
	Wed, 15 Feb 2023 16:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E9010EB0B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DC0261FEA6;
 Wed, 15 Feb 2023 16:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Lz8YtMpwlaPc9vsob+e6Y4PRHQ9b8ltUxQiSOFrWPo=;
 b=Qkx6Jo1epm1H5ErGeXbFToLM20qzIAYR03gzunB1mLXEMoc5CRt7xFD8C/2PNM9yloqFri
 3W6rpkNdiHyLOiGrZd5WDwncreO70p9M8hcj2zEvaGh4rk8U7ySqO4ZmNDWaQfcy0H3IWv
 A3VAwi+UekmcECQN7/v07PghXIjpJdI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Lz8YtMpwlaPc9vsob+e6Y4PRHQ9b8ltUxQiSOFrWPo=;
 b=ropEMg2zetOxate/v0evIEkNGf8g9W0HswefPhdXN0o335VdZGlpOhZbFnJ9rqE2v0zFN0
 4BMIsgSLl2p9bhBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6876E134BA;
 Wed, 15 Feb 2023 16:15:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QMLJFR8F7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 10/17] drm/cirrus: Inline cirrus_fb_blit_rect()
Date: Wed, 15 Feb 2023 17:15:10 +0100
Message-Id: <20230215161517.5113-11-tzimmermann@suse.de>
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

Inline cirrus_fb_blit_rect into its only caller. While at it, update
the code to use IOSYS_MAP_INIT_OFFSET(), which is the ideomatic way
of initializing struct iosys_map with an offset.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 46c6aa34ba79..a483abc2e6ba 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -317,21 +317,6 @@ static void cirrus_pitch_set(struct cirrus_device *cirrus,
 	cirrus_set_start_address(cirrus, 0);
 }
 
-static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
-			       const struct iosys_map *vmap,
-			       struct drm_rect *rect)
-{
-	struct cirrus_device *cirrus = to_cirrus(fb->dev);
-	struct iosys_map dst;
-
-	iosys_map_set_vaddr_iomem(&dst, cirrus->vram);
-	iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
-
-	drm_fb_blit(&dst, &cirrus->pitch, cirrus->format->format, vmap, fb, rect);
-
-	return 0;
-}
-
 static int cirrus_check_size(int width, int height,
 			     struct drm_framebuffer *fb)
 {
@@ -393,6 +378,7 @@ static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct iosys_map vaddr = IOSYS_MAP_INIT_VADDR_IOMEM(cirrus->vram);
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 	int idx;
@@ -410,7 +396,11 @@ static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		cirrus_fb_blit_rect(fb, &shadow_plane_state->data[0], &damage);
+		unsigned int offset = drm_fb_clip_offset(cirrus->pitch, fb->format, &damage);
+		struct iosys_map dst = IOSYS_MAP_INIT_OFFSET(&vaddr, offset);
+
+		drm_fb_blit(&dst, &cirrus->pitch, cirrus->format->format,
+			    &shadow_plane_state->data[0], fb, &damage);
 	}
 
 	drm_dev_exit(idx);
-- 
2.39.1

