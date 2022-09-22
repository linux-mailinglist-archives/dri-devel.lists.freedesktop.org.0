Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603DD5E6347
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 15:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346E610EB09;
	Thu, 22 Sep 2022 13:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E52E10EB09
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 13:09:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF2B921A2F;
 Thu, 22 Sep 2022 13:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663852186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tuf5tbatkE0a3aOgCRUpaib52pQwpg3qivdXOH4TKrA=;
 b=R5xSAQN4hmBe+ViV29pJf5fGR5Ncx+vtgC1B4AIsZgF67bRVA06wE4ersX+eVz27F/2mxM
 XhlHCFQKphEvqA7IshznHOEEYcy2vyaDcLGtT6gjJG36PQJ/nW9fgdDEBqTxz6WyUvFuoy
 8dyZl27zqQzE13fTOOk7QPpYcsMRKo8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663852186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tuf5tbatkE0a3aOgCRUpaib52pQwpg3qivdXOH4TKrA=;
 b=ykzkZmp09fgrKuOAzMvD1PaHzl6JXILCD+OOJTjYqz2mSJbc7nSu3ffLs1QQP8fgl8FNJI
 9g8liB2Ra2cNy/AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 915151346B;
 Thu, 22 Sep 2022 13:09:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oASYIppeLGMSbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Sep 2022 13:09:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 4/5] drm/simpledrm: Iterate over damage clips
Date: Thu, 22 Sep 2022 15:09:43 +0200
Message-Id: <20220922130944.27138-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922130944.27138-1-tzimmermann@suse.de>
References: <20220922130944.27138-1-tzimmermann@suse.de>
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

Iterate over all damage clips and updated them one by one. Replaces
the merging of damage areas, which can result in significant overhead
if damage areas are not close to each other.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 8fab22a26e26..5f242558891e 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -478,23 +478,25 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_device *dev = plane->dev;
 	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
-	struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);
-	struct drm_rect src_clip, dst_clip;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect damage;
 	int idx;
 
-	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
+	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	dst_clip = plane_state->dst;
-	if (!drm_rect_intersect(&dst_clip, &src_clip))
-		return;
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		struct iosys_map dst = IOSYS_MAP_INIT_VADDR(sdev->screen_base);
+		struct drm_rect dst_clip = plane_state->dst;
 
-	if (!drm_dev_enter(dev, &idx))
-		return;
+		if (!drm_rect_intersect(&dst_clip, &damage))
+			continue;
 
-	iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
-	drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data, fb,
-		    &src_clip);
+		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
+		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data, fb,
+			    &damage);
+	}
 
 	drm_dev_exit(idx);
 }
-- 
2.37.3

