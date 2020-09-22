Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695072744A7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E3C6E892;
	Tue, 22 Sep 2020 14:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7506E892
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 14:46:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7619ACC2;
 Tue, 22 Sep 2020 14:47:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/ast: Reload gamma LUT after changing primary plane's
 color format
Date: Tue, 22 Sep 2020 16:46:55 +0200
Message-Id: <20200922144655.23624-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gamma LUT has to be reloaded after changing the primary plane's
color format. This used to be done implicitly by the CRTC atomic_enable()
helper after updating the primary plane. With the recent reordering of
the steps, the primary plane's setup was moved last and invalidated
the gamma LUT. Fix this by setting the LUT from within atomic_flush().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 2f0ddd89fe32 ("drm/ast: Enable CRTC before planes")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/ast/ast_mode.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 834a156e3a75..ba3bf76e104d 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -742,7 +742,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 	case DRM_MODE_DPMS_SUSPEND:
 		if (ast->tx_chip_type == AST_TX_DP501)
 			ast_set_dp501_video_output(crtc->dev, 1);
-		ast_crtc_load_lut(ast, crtc);
 		break;
 	case DRM_MODE_DPMS_OFF:
 		if (ast->tx_chip_type == AST_TX_DP501)
@@ -777,6 +776,17 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static void
+ast_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_state *old_crtc_state)
+{
+	struct ast_private *ast = to_ast_private(crtc->dev);
+	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc->state);
+	struct ast_crtc_state *old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
+
+	if (old_ast_crtc_state->format != ast_crtc_state->format)
+		ast_crtc_load_lut(ast, crtc);
+}
+
 static void
 ast_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 			      struct drm_crtc_state *old_crtc_state)
@@ -830,6 +840,7 @@ ast_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 
 static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
 	.atomic_check = ast_crtc_helper_atomic_check,
+	.atomic_flush = ast_crtc_helper_atomic_flush,
 	.atomic_enable = ast_crtc_helper_atomic_enable,
 	.atomic_disable = ast_crtc_helper_atomic_disable,
 };
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
