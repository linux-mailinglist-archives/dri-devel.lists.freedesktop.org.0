Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6AF23CA10
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 12:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8F96E0D5;
	Wed,  5 Aug 2020 10:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1389337
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 10:54:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2A3DB694;
 Wed,  5 Aug 2020 10:54:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Subject: [PATCH v1 1/4] drm/ast: Only set format registers if primary plane's
 format changes
Date: Wed,  5 Aug 2020 12:54:25 +0200
Message-Id: <20200805105428.2590-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200805105428.2590-1-tzimmermann@suse.de>
References: <20200805105428.2590-1-tzimmermann@suse.de>
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
full modesetting operations. But the implementation was buggy and the
format registers were often updated even for simple pageflips.

Fix this problem by distinguishing between format and mode changes; and
handle each in it's own branch.

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
 drivers/gpu/drm/ast/ast_mode.c | 52 ++++++++++++++++------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 62fe682a7de6..b129833c0821 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -768,34 +768,32 @@ static void ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct ast_private *ast = to_ast_private(dev);
-	struct ast_crtc_state *ast_state;
-	const struct drm_format_info *format;
-	struct ast_vbios_mode_info *vbios_mode_info;
-	struct drm_display_mode *adjusted_mode;
-
-	ast_state = to_ast_crtc_state(crtc->state);
-
-	format = ast_state->format;
-	if (!format)
-		return;
-
-	vbios_mode_info = &ast_state->vbios_mode_info;
-
-	ast_set_color_reg(ast, format);
-	ast_set_vbios_color_reg(ast, format, vbios_mode_info);
-
-	if (!crtc->state->mode_changed)
-		return;
-
-	adjusted_mode = &crtc->state->adjusted_mode;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
+	struct ast_crtc_state *old_ast_crtc_state =
+		to_ast_crtc_state(old_crtc_state);
+	const struct drm_format_info *format = ast_crtc_state->format;
+	struct ast_vbios_mode_info *vbios_mode_info =
+		&ast_crtc_state->vbios_mode_info;
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	if (drm_WARN_ON_ONCE(dev, !format))
+		return; /* BUG: We didn't set format in primary check(). */
+
+	if (format != old_ast_crtc_state->format) {
+		ast_set_color_reg(ast, format);
+		ast_set_vbios_color_reg(ast, format, vbios_mode_info);
+	}
 
-	ast_set_vbios_mode_reg(ast, adjusted_mode, vbios_mode_info);
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
-	ast_set_std_reg(ast, adjusted_mode, vbios_mode_info);
-	ast_set_crtc_reg(ast, adjusted_mode, vbios_mode_info);
-	ast_set_dclk_reg(ast, adjusted_mode, vbios_mode_info);
-	ast_set_crtthd_reg(ast);
-	ast_set_sync_reg(ast, adjusted_mode, vbios_mode_info);
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		ast_set_vbios_mode_reg(ast, adjusted_mode, vbios_mode_info);
+		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
+		ast_set_std_reg(ast, adjusted_mode, vbios_mode_info);
+		ast_set_crtc_reg(ast, adjusted_mode, vbios_mode_info);
+		ast_set_dclk_reg(ast, adjusted_mode, vbios_mode_info);
+		ast_set_crtthd_reg(ast);
+		ast_set_sync_reg(ast, adjusted_mode, vbios_mode_info);
+	}
 }
 
 static void
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
