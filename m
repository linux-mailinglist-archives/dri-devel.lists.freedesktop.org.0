Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE66051F670
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 10:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDCB10E054;
	Mon,  9 May 2022 08:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6647910E054
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 08:16:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4E9D91FA07;
 Mon,  9 May 2022 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652084165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EsHRgGgr2qLLcU5F5OLeRe1E/EelhEnsNV8ITvIANWg=;
 b=pkxkTg+P3PFC94R3r6yE1JSVGqZe1OkQlFFk+p5lYHX2nmsDzN5vynYBiVvYCREWiAMZDP
 twDKnwFgW2POREP5wedLZswAHy/isEwrZ4TCEHb1bl0GOll1KOIFuAO3hc5TAmRTXRn7q4
 5gCJzMrHJuMORoLmB1nJgtQRO1zOsFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652084165;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EsHRgGgr2qLLcU5F5OLeRe1E/EelhEnsNV8ITvIANWg=;
 b=+5IZyDKPPTSky5mtr7JrlmWK8bbY1mLqfxtdJuOVt1RK+NAIwXwtklU6GZFNZ+0bJWkDl9
 6hBgqpftKvApP0CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2506E13B12;
 Mon,  9 May 2022 08:16:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +MA0CMXNeGL5OgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 08:16:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 christian.koenig@amd.com
Subject: [PATCH 3/4] drm/gem-vram: Ignore planes that are unused by
 framebuffer format
Date: Mon,  9 May 2022 10:16:01 +0200
Message-Id: <20220509081602.474-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220509081602.474-1-tzimmermann@suse.de>
References: <20220509081602.474-1-tzimmermann@suse.de>
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

Only handle color planes that exist in a framebuffer's color format.
Ignore non-existing planes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 36 ++++++++++++++++++---------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 123045b58fec..3305541a10ab 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -9,6 +9,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
@@ -648,17 +649,22 @@ int
 drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
 				     struct drm_plane_state *new_state)
 {
-	size_t i;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_vram_object *gbo;
+	struct drm_gem_object *obj;
+	unsigned int i;
 	int ret;
 
-	if (!new_state->fb)
+	if (!fb)
 		return 0;
 
-	for (i = 0; i < ARRAY_SIZE(new_state->fb->obj); ++i) {
-		if (!new_state->fb->obj[i])
-			continue;
-		gbo = drm_gem_vram_of_gem(new_state->fb->obj[i]);
+	for (i = 0; i < fb->format->num_planes; ++i) {
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj) {
+			ret = -EINVAL;
+			goto err_drm_gem_vram_unpin;
+		}
+		gbo = drm_gem_vram_of_gem(obj);
 		ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
 		if (ret)
 			goto err_drm_gem_vram_unpin;
@@ -673,7 +679,10 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
 err_drm_gem_vram_unpin:
 	while (i) {
 		--i;
-		gbo = drm_gem_vram_of_gem(new_state->fb->obj[i]);
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		gbo = drm_gem_vram_of_gem(obj);
 		drm_gem_vram_unpin(gbo);
 	}
 	return ret;
@@ -694,16 +703,19 @@ void
 drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
-	size_t i;
+	struct drm_framebuffer *fb = old_state->fb;
 	struct drm_gem_vram_object *gbo;
+	struct drm_gem_object *obj;
+	unsigned int i;
 
-	if (!old_state->fb)
+	if (!fb)
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(old_state->fb->obj); ++i) {
-		if (!old_state->fb->obj[i])
+	for (i = 0; i < fb->format->num_planes; ++i) {
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
 			continue;
-		gbo = drm_gem_vram_of_gem(old_state->fb->obj[i]);
+		gbo = drm_gem_vram_of_gem(obj);
 		drm_gem_vram_unpin(gbo);
 	}
 }
-- 
2.36.0

