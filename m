Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6270391AB82
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCFA10EAF5;
	Thu, 27 Jun 2024 15:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17FC10E052
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 15:36:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 72F561FBFA;
 Thu, 27 Jun 2024 15:36:43 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3974613AC4;
 Thu, 27 Jun 2024 15:36:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WBrHDAuHfWbmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jun 2024 15:36:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/8] drm/ast: Move mode-setting code into mode_set_nofb CRTC
 helper
Date: Thu, 27 Jun 2024 17:27:48 +0200
Message-ID: <20240627153638.8765-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627153638.8765-1-tzimmermann@suse.de>
References: <20240627153638.8765-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 72F561FBFA
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do all mode setting in ast_crtc_helper_mode_set_nofb(), which
always runs after disabling the CRTC and before programming the
planes. Removes implicit synchronization between the CRTC's
atomic disable, enable and the vertical retrace.

Display-mode updates require HW cursors to be disabled. The HW
cursor only picks up changes at vertical retrace periods. So the
CRTC's atomic_disable helper waited for the retrace to delay any
following mode-setting operations, which then happened in
atomic_enable. See [1] for a description of the problem.

With the CRTC helper callback mode_set_nofb, we can now synchronize
and reprogram in the same place. As it always runs before the plane
update, the plane code can be reordered with the CRTC's later
atomic_enable et al.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/series/79914/ # 1
---
 drivers/gpu/drm/ast/ast_mode.c | 52 ++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 421fcdad40e4..e8312b3472ed 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1131,6 +1131,33 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
 	return status;
 }
 
+static void ast_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct ast_device *ast = to_ast_device(dev);
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
+	struct ast_vbios_mode_info *vbios_mode_info =
+		&ast_crtc_state->vbios_mode_info;
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	/*
+	 * Ensure that no scanout takes place before reprogramming mode
+	 * and format registers.
+	 *
+	 * TODO: Get vblank interrupts working and remove this line.
+	 */
+	ast_wait_for_vretrace(ast);
+
+	ast_set_vbios_mode_reg(ast, adjusted_mode, vbios_mode_info);
+	ast_set_index_reg(ast, AST_IO_VGACRI, 0xa1, 0x06);
+	ast_set_std_reg(ast, adjusted_mode, vbios_mode_info);
+	ast_set_crtc_reg(ast, adjusted_mode, vbios_mode_info);
+	ast_set_dclk_reg(ast, adjusted_mode, vbios_mode_info);
+	ast_set_crtthd_reg(ast);
+	ast_set_sync_reg(ast, adjusted_mode, vbios_mode_info);
+}
+
 static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
@@ -1207,30 +1234,12 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 
 static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
-	struct ast_device *ast = to_ast_device(dev);
-	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
-	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
-	struct ast_vbios_mode_info *vbios_mode_info =
-		&ast_crtc_state->vbios_mode_info;
-	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
-
-	ast_set_vbios_mode_reg(ast, adjusted_mode, vbios_mode_info);
-	ast_set_index_reg(ast, AST_IO_VGACRI, 0xa1, 0x06);
-	ast_set_std_reg(ast, adjusted_mode, vbios_mode_info);
-	ast_set_crtc_reg(ast, adjusted_mode, vbios_mode_info);
-	ast_set_dclk_reg(ast, adjusted_mode, vbios_mode_info);
-	ast_set_crtthd_reg(ast);
-	ast_set_sync_reg(ast, adjusted_mode, vbios_mode_info);
-
 	ast_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
 }
 
 static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
-	struct drm_device *dev = crtc->dev;
-	struct ast_device *ast = to_ast_device(dev);
 
 	ast_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
 
@@ -1245,16 +1254,11 @@ static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 	 * simple pageflips on the planes.
 	 */
 	drm_atomic_helper_disable_planes_on_crtc(old_crtc_state, false);
-
-	/*
-	 * Ensure that no scanout takes place before reprogramming mode
-	 * and format registers.
-	 */
-	ast_wait_for_vretrace(ast);
 }
 
 static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
 	.mode_valid = ast_crtc_helper_mode_valid,
+	.mode_set_nofb = ast_crtc_helper_mode_set_nofb,
 	.atomic_check = ast_crtc_helper_atomic_check,
 	.atomic_flush = ast_crtc_helper_atomic_flush,
 	.atomic_enable = ast_crtc_helper_atomic_enable,
-- 
2.45.2

