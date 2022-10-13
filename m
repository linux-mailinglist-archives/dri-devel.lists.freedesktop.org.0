Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D265FD86B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A32010E88A;
	Thu, 13 Oct 2022 11:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCA710E848
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 11:29:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D1FB21CC6;
 Thu, 13 Oct 2022 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665660567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3UlAJOpnElcvMboD6i3TmPLOV7rwvJcT4jT+xqU1ttI=;
 b=Jrd/r6vPI3a/f376eZ4ejBpfoVn4CEzdpnlWtQ9pSOCEUqHXjBmT+Hh7SlrHZkKX/1Ow4u
 i2g/tcxep3DMgHij12dbJ62pVGiw6kY9dCurtNzm4MuIZ9FCxU7wneqcR3jPKKoKtgc9pv
 vQmYWn+ho0S4bOFtz35fpzQiAgIUDH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665660567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3UlAJOpnElcvMboD6i3TmPLOV7rwvJcT4jT+xqU1ttI=;
 b=6HxF6e9kj5ipBEVYNOM+hZPNnAH3EiCmYsocQ6gF/DhRb2LY1/xL27i+qg3DEtx1ufmTAb
 BhzbMDeKkZ3N2oBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3683D13AAA;
 Thu, 13 Oct 2022 11:29:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sFsaDJf2R2NwYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Oct 2022 11:29:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 javierm@redhat.com, ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH v2 4/8] drm/ast: Remove cursor double buffering
Date: Thu, 13 Oct 2022 13:29:19 +0200
Message-Id: <20221013112923.769-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013112923.769-1-tzimmermann@suse.de>
References: <20221013112923.769-1-tzimmermann@suse.de>
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

Update the cursor image via damage handling in-place. The cursor's
double buffering has no visible effect on the output, so remove it.

Done in preparation of switching ast to GEM SHMEM helpers. Removing
double buffering will allow us to use the same data structure for
primary and cursor plane.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.h  | 12 ++---
 drivers/gpu/drm/ast/ast_mode.c | 83 +++++++++++++---------------------
 2 files changed, 35 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 2e44b971c3a6..12294c74d0fc 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -96,8 +96,6 @@ enum ast_tx_chip {
 #define AST_HWC_SIZE		(AST_MAX_HWC_WIDTH * AST_MAX_HWC_HEIGHT * 2)
 #define AST_HWC_SIGNATURE_SIZE	32
 
-#define AST_DEFAULT_HWC_NUM	2
-
 /* define for signature structure */
 #define AST_HWC_SIGNATURE_CHECKSUM	0x00
 #define AST_HWC_SIGNATURE_SizeX		0x04
@@ -110,13 +108,9 @@ enum ast_tx_chip {
 struct ast_cursor_plane {
 	struct drm_plane base;
 
-	struct {
-		struct drm_gem_vram_object *gbo;
-		struct iosys_map map;
-		u64 off;
-	} hwc[AST_DEFAULT_HWC_NUM];
-
-	unsigned int next_hwc_index;
+	struct drm_gem_vram_object *gbo;
+	struct iosys_map map;
+	u64 off;
 };
 
 static inline struct ast_cursor_plane *
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 059e4906507d..06ee79ec86f1 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -837,10 +837,8 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(new_state);
 	struct drm_framebuffer *fb = new_state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
-	struct iosys_map dst_map =
-		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
-	u64 dst_off =
-		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].off;
+	struct iosys_map dst_map = ast_cursor_plane->map;
+	u64 dst_off = ast_cursor_plane->off;
 	struct iosys_map src_map = shadow_plane_state->data[0];
 	unsigned int offset_x, offset_y;
 	u16 x, y;
@@ -860,13 +858,9 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 
 	ast_update_cursor_image(dst, src, fb->width, fb->height);
 
-	if (new_state->fb != old_state->fb) {
+	if (new_state->fb != old_state->fb)
 		ast_set_cursor_base(ast, dst_off);
 
-		++ast_cursor_plane->next_hwc_index;
-		ast_cursor_plane->next_hwc_index %= ARRAY_SIZE(ast_cursor_plane->hwc);
-	}
-
 	/*
 	 * Update location in HWC signature and registers.
 	 */
@@ -917,17 +911,12 @@ static const struct drm_plane_helper_funcs ast_cursor_plane_helper_funcs = {
 static void ast_cursor_plane_destroy(struct drm_plane *plane)
 {
 	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
-	size_t i;
-	struct drm_gem_vram_object *gbo;
-	struct iosys_map map;
+	struct drm_gem_vram_object *gbo = ast_cursor_plane->gbo;
+	struct iosys_map map = ast_cursor_plane->map;
 
-	for (i = 0; i < ARRAY_SIZE(ast_cursor_plane->hwc); ++i) {
-		gbo = ast_cursor_plane->hwc[i].gbo;
-		map = ast_cursor_plane->hwc[i].map;
-		drm_gem_vram_vunmap(gbo, &map);
-		drm_gem_vram_unpin(gbo);
-		drm_gem_vram_put(gbo);
-	}
+	drm_gem_vram_vunmap(gbo, &map);
+	drm_gem_vram_unpin(gbo);
+	drm_gem_vram_put(gbo);
 
 	drm_plane_cleanup(plane);
 }
@@ -944,7 +933,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 	struct drm_device *dev = &ast->base;
 	struct ast_cursor_plane *ast_cursor_plane = &ast->cursor_plane;
 	struct drm_plane *cursor_plane = &ast_cursor_plane->base;
-	size_t size, i;
+	size_t size;
 	struct drm_gem_vram_object *gbo;
 	struct iosys_map map;
 	int ret;
@@ -957,29 +946,27 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 
 	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
 
-	for (i = 0; i < ARRAY_SIZE(ast_cursor_plane->hwc); ++i) {
-		gbo = drm_gem_vram_create(dev, size, 0);
-		if (IS_ERR(gbo)) {
-			ret = PTR_ERR(gbo);
-			goto err_hwc;
-		}
-		ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
-					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
-		if (ret)
-			goto err_drm_gem_vram_put;
-		ret = drm_gem_vram_vmap(gbo, &map);
-		if (ret)
-			goto err_drm_gem_vram_unpin;
-		off = drm_gem_vram_offset(gbo);
-		if (off < 0) {
-			ret = off;
-			goto err_drm_gem_vram_vunmap;
-		}
-		ast_cursor_plane->hwc[i].gbo = gbo;
-		ast_cursor_plane->hwc[i].map = map;
-		ast_cursor_plane->hwc[i].off = off;
+	gbo = drm_gem_vram_create(dev, size, 0);
+	if (IS_ERR(gbo))
+		return PTR_ERR(gbo);
+
+	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
+				    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
+	if (ret)
+		goto err_drm_gem_vram_put;
+	ret = drm_gem_vram_vmap(gbo, &map);
+	if (ret)
+		goto err_drm_gem_vram_unpin;
+	off = drm_gem_vram_offset(gbo);
+	if (off < 0) {
+		ret = off;
+		goto err_drm_gem_vram_vunmap;
 	}
 
+	ast_cursor_plane->gbo = gbo;
+	ast_cursor_plane->map = map;
+	ast_cursor_plane->off = off;
+
 	/*
 	 * Create the cursor plane. The plane's destroy callback will release
 	 * the backing storages' BO memory.
@@ -992,24 +979,18 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 				       NULL, DRM_PLANE_TYPE_CURSOR, NULL);
 	if (ret) {
 		drm_err(dev, "drm_universal_plane failed(): %d\n", ret);
-		goto err_hwc;
+		goto err_drm_gem_vram_vunmap;
 	}
 	drm_plane_helper_add(cursor_plane, &ast_cursor_plane_helper_funcs);
 
 	return 0;
 
-err_hwc:
-	while (i) {
-		--i;
-		gbo = ast_cursor_plane->hwc[i].gbo;
-		map = ast_cursor_plane->hwc[i].map;
 err_drm_gem_vram_vunmap:
-		drm_gem_vram_vunmap(gbo, &map);
+	drm_gem_vram_vunmap(gbo, &map);
 err_drm_gem_vram_unpin:
-		drm_gem_vram_unpin(gbo);
+	drm_gem_vram_unpin(gbo);
 err_drm_gem_vram_put:
-		drm_gem_vram_put(gbo);
-	}
+	drm_gem_vram_put(gbo);
 	return ret;
 }
 
-- 
2.37.3

