Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1CA5F63DC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C563810E0FE;
	Thu,  6 Oct 2022 09:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5D310E279
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:54:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8AFBC1F926;
 Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665050038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86yOxt4Ncdc10WxUSZWbJexfTuLsgL9Jp2N8VU/K0mo=;
 b=gNT3xR4c02QNb+V6NzGB6SFnIUJxLcCXfOx/7x8NONw8fSa7de+5/bnT8xuTpB8JG5AkRy
 Y0f+WdWaJiVZ8OVSv8oZLN2Y0kQZeeiAljY25cVgyfH8QNyhnEkPHNzA/IYW+/r2n00EJa
 2e7PRjmha91kLbaO7av9y5Ru7JKDJ/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665050038;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86yOxt4Ncdc10WxUSZWbJexfTuLsgL9Jp2N8VU/K0mo=;
 b=/KXAsJ+KiP6z/0hjFoHwEq4VH4F0PZBxkJziSIR79VL334UZtNsygk0K+NlNpg3sO/CsH6
 y9C/8H0JzpdTgkAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6406113AC8;
 Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KEWUF7alPmNnYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 09:53:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch
Subject: [PATCH v2 10/16] drm/udl: Use damage iterator
Date: Thu,  6 Oct 2022 11:53:49 +0200
Message-Id: <20221006095355.23579-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006095355.23579-1-tzimmermann@suse.de>
References: <20221006095355.23579-1-tzimmermann@suse.de>
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
damage areas can result in large updates of unchanged framebuffer
regions. As USB is rather slow, it's better to process damage areas
individually and hence minimize USB-transfered data.

As part of the change, move drm_gem_fb_{begin,end}_cpu_access() into
the plane's atomic_update helper. To avoid overhead and intermediate
writers, we want to synchronize buffers and reserve access only once
before copying damage areas of the framebuffer.

v2:
	* clarify commit message (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 42 +++++++++++++++----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 34c7fb6ecfe9..aee4fe2b5b08 100644
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
@@ -301,19 +291,29 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
-	struct drm_rect rect;
-	int idx;
-
-	if (!drm_dev_enter(dev, &idx))
-		return;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect damage;
+	int ret, idx;
 
 	if (!fb)
 		return; /* no framebuffer; plane is disabled */
 
-	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
-		udl_handle_damage(fb, &shadow_plane_state->data[0], &rect);
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return;
+
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
 
 static const struct drm_plane_helper_funcs udl_primary_plane_helper_funcs = {
-- 
2.37.3

