Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6992E22E6B2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 09:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9373289CF4;
	Mon, 27 Jul 2020 07:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC6489CE0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 07:37:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7D26B01F;
 Mon, 27 Jul 2020 07:37:24 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Subject: [PATCH 1/3] drm/ast: Do full modeset if the primary plane's format
 changes
Date: Mon, 27 Jul 2020 09:37:05 +0200
Message-Id: <20200727073707.21097-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727073707.21097-1-tzimmermann@suse.de>
References: <20200727073707.21097-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The atomic modesetting code tried to distinguish format changes from
full modesetting operations. In practice, this was buggy and the format
registers were often updated even for simple pageflips.

Instead do a full modeset if the primary plane changes formats. It's
just as rare as an actual mode change, so there will be no performance
penalty.

The patch also replaces a reference to drm_crtc_state.allow_modeset with
the correct call to drm_atomic_crtc_needs_modeset().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 4961eb60f145 ("drm/ast: Enable atomic modesetting")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>
Cc: <stable@vger.kernel.org> # v5.6+
---
 drivers/gpu/drm/ast/ast_mode.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 154cd877d9d1..3680a000b812 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -527,8 +527,8 @@ static const uint32_t ast_primary_plane_formats[] = {
 static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						 struct drm_plane_state *state)
 {
-	struct drm_crtc_state *crtc_state;
-	struct ast_crtc_state *ast_crtc_state;
+	struct drm_crtc_state *crtc_state, *old_crtc_state;
+	struct ast_crtc_state *ast_crtc_state, *old_ast_crtc_state;
 	int ret;
 
 	if (!state->crtc)
@@ -550,6 +550,15 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 
 	ast_crtc_state->format = state->fb->format;
 
+	old_crtc_state = drm_atomic_get_old_crtc_state(state->state, state->crtc);
+	if (!old_crtc_state)
+		return 0;
+	old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
+	if (!old_ast_crtc_state)
+		return 0;
+	if (ast_crtc_state->format != old_ast_crtc_state->format)
+		crtc_state->mode_changed = true;
+
 	return 0;
 }
 
@@ -775,18 +784,18 @@ static void ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 
 	ast_state = to_ast_crtc_state(crtc->state);
 
-	format = ast_state->format;
-	if (!format)
+	if (!drm_atomic_crtc_needs_modeset(crtc->state))
 		return;
 
+	format = ast_state->format;
+	if (drm_WARN_ON_ONCE(dev, !format))
+		return; /* BUG: We didn't set format in primary check(). */
+
 	vbios_mode_info = &ast_state->vbios_mode_info;
 
 	ast_set_color_reg(ast, format);
 	ast_set_vbios_color_reg(ast, format, vbios_mode_info);
 
-	if (!crtc->state->mode_changed)
-		return;
-
 	adjusted_mode = &crtc->state->adjusted_mode;
 
 	ast_set_vbios_mode_reg(ast, adjusted_mode, vbios_mode_info);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
