Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C34891AB7C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC49210E00C;
	Thu, 27 Jun 2024 15:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2312E10E052
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 15:36:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B3F8921BFA;
 Thu, 27 Jun 2024 15:36:43 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7401713ADF;
 Thu, 27 Jun 2024 15:36:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gOgSGwuHfWbmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jun 2024 15:36:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/8] drm/ast: Handle primary-plane format setup in
 atomic_update
Date: Thu, 27 Jun 2024 17:27:49 +0200
Message-ID: <20240627153638.8765-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627153638.8765-1-tzimmermann@suse.de>
References: <20240627153638.8765-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: B3F8921BFA
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

Several color registers are programmed in the DPMS code of the CRTC's
atomic_enable helper. This code will not be executed if the color format
changes without a full mode switch. The same code already exists in the
atomic_update helper of the primary plane. There, the code will not run
if only the display mode changes.

The color format is a property of the primary plane, so consolidate all
code in the plane's atomic_update.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e8312b3472ed..6a81d657175d 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -649,12 +649,12 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_framebuffer *old_fb = old_plane_state->fb;
 	struct ast_plane *ast_plane = to_ast_plane(plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_rect damage;
 	struct drm_atomic_helper_damage_iter iter;
 
-	if (!old_fb || (fb->format != old_fb->format)) {
-		struct drm_crtc *crtc = plane_state->crtc;
-		struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (!old_fb || (fb->format != old_fb->format) || crtc_state->mode_changed) {
 		struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
 		struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
 
@@ -1025,7 +1025,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 	u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
-	struct ast_vbios_mode_info *vbios_mode_info;
 
 	/* TODO: Maybe control display signal generation with
 	 *       Sync Enable (bit CR17.7).
@@ -1039,10 +1038,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 		format = ast_state->format;
 
 		if (format) {
-			vbios_mode_info = &ast_state->vbios_mode_info;
-
-			ast_set_color_reg(ast, format);
-			ast_set_vbios_color_reg(ast, format, vbios_mode_info);
 			if (crtc->state->gamma_lut)
 				ast_crtc_set_gamma(ast, format, crtc->state->gamma_lut->data);
 			else
-- 
2.45.2

