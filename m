Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99272685B3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3296E3E1;
	Mon, 14 Sep 2020 07:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8788F6E288
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 07:22:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7BDCB197;
 Mon, 14 Sep 2020 07:22:53 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Subject: [PATCH v3 3/4] drm/ast: Program display mode in CRTC's atomic_enable()
Date: Mon, 14 Sep 2020 09:22:35 +0200
Message-Id: <20200914072236.19398-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914072236.19398-1-tzimmermann@suse.de>
References: <20200914072236.19398-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change simplifies ast's modesetting code. The display mode
is now programmed from within the CRTC's atomic_enable(), which
only runs if we actually want to program the mode.

Corresponding code in atomic_flush() is being removed. Also removed
is atomic_begin(), which serves no purpose at all.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 5b45b57c3d17..fd0127f48fb9 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -777,16 +777,9 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static void ast_crtc_helper_atomic_begin(struct drm_crtc *crtc,
-					 struct drm_crtc_state *old_crtc_state)
-{
-	struct ast_private *ast = to_ast_private(crtc->dev);
-
-	ast_open_key(ast);
-}
-
-static void ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
-					 struct drm_crtc_state *old_crtc_state)
+static void
+ast_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+			      struct drm_crtc_state *old_crtc_state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct ast_private *ast = to_ast_private(dev);
@@ -796,9 +789,6 @@ static void ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 		&ast_crtc_state->vbios_mode_info;
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 
-	if (!drm_atomic_crtc_needs_modeset(crtc_state))
-		return;
-
 	ast_set_vbios_mode_reg(ast, adjusted_mode, vbios_mode_info);
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
 	ast_set_std_reg(ast, adjusted_mode, vbios_mode_info);
@@ -806,12 +796,7 @@ static void ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	ast_set_dclk_reg(ast, adjusted_mode, vbios_mode_info);
 	ast_set_crtthd_reg(ast);
 	ast_set_sync_reg(ast, adjusted_mode, vbios_mode_info);
-}
 
-static void
-ast_crtc_helper_atomic_enable(struct drm_crtc *crtc,
-			      struct drm_crtc_state *old_crtc_state)
-{
 	ast_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
 }
 
@@ -845,8 +830,6 @@ ast_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 
 static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
 	.atomic_check = ast_crtc_helper_atomic_check,
-	.atomic_begin = ast_crtc_helper_atomic_begin,
-	.atomic_flush = ast_crtc_helper_atomic_flush,
 	.atomic_enable = ast_crtc_helper_atomic_enable,
 	.atomic_disable = ast_crtc_helper_atomic_disable,
 };
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
