Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C895BCC7C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6AF10E29F;
	Mon, 19 Sep 2022 13:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FEE10E623
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ACBC022341;
 Mon, 19 Sep 2022 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2WB89OWqucI4qNe7ulm39t7Lqq73+RqIodkw4cRx9U=;
 b=YPus++14pfo34h9WaAIIl2PUbWzVzQBfqRlkmdkMs+Kw9gRQ2jKaL6zX8vZFb8AeR135Sw
 i9maXfx2tVtCJeSJXIB12EohKTheBd8a+S3CUt5R9+jbN3jBFvhk/OrtvLyBnakf9njzVP
 W9Acp/NUJC5aBSqmyEie5N7albf5oJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2WB89OWqucI4qNe7ulm39t7Lqq73+RqIodkw4cRx9U=;
 b=8xksJRgY/6XEDijK7Lrj4GiJVKP0y8Rj23aPUPVRN3tVgjLzuytDAChd3Z8pilLojj1rLf
 VSirl3ToQs78CzBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8385B13ACE;
 Mon, 19 Sep 2022 13:04:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6CXnHs1oKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 10/16] drm/udl: Use damage iterator
Date: Mon, 19 Sep 2022 15:04:02 +0200
Message-Id: <20220919130408.21486-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919130408.21486-1-tzimmermann@suse.de>
References: <20220919130408.21486-1-tzimmermann@suse.de>
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

Use a damage iterator to process damage areas individually. Merging
damage areas can resul tin large updates of unchanged framebuffer
regions. As USB is rather slow, it's better to process damage areas
individually and hence minimize USB-transfered data.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 38 +++++++++++++++----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index aaa828034a04..6fa4c8b5c2c6 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -238,15 +238,9 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 		return ret;
 	log_bpp = ret;
 
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		return ret;
-
 	urb = udl_get_urb(dev);
-	if (!urb) {
-		ret = -ENOMEM;
-		goto out_drm_gem_fb_end_cpu_access;
-	}
+	if (!urb)
+		return -ENOMEM;
 	cmd = urb->transfer_buffer;
 
 	for (i = clip->y1; i < clip->y2; i++) {
@@ -258,7 +252,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 				       &cmd, byte_offset, dev_byte_offset,
 				       byte_width);
 		if (ret)
-			goto out_drm_gem_fb_end_cpu_access;
+			return ret;
 	}
 
 	if (cmd > (char *)urb->transfer_buffer) {
@@ -272,11 +266,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 		udl_urb_completion(urb);
 	}
 
-	ret = 0;
-
-out_drm_gem_fb_end_cpu_access:
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-	return ret;
+	return 0;
 }
 
 /*
@@ -301,16 +291,26 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
-	struct drm_rect rect;
-	int idx;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect damage;
+	int ret, idx;
 
-	if (!drm_dev_enter(dev, &idx))
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
 		return;
 
-	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
-		udl_handle_damage(fb, &shadow_plane_state->data[0], &rect);
+	if (!drm_dev_enter(dev, &idx))
+		goto out_drm_gem_fb_end_cpu_access;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		udl_handle_damage(fb, &shadow_plane_state->data[0], &damage);
+	}
 
 	drm_dev_exit(idx);
+
+out_drm_gem_fb_end_cpu_access:
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 }
 
 static void udl_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-- 
2.37.3

