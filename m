Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37F991AB81
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FDF10E052;
	Thu, 27 Jun 2024 15:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CE210EAF1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 15:36:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 60AAB1FC07;
 Thu, 27 Jun 2024 15:36:44 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BDFE13AC4;
 Thu, 27 Jun 2024 15:36:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GEd5CQyHfWbmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jun 2024 15:36:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/8] drm/ast: Inline ast_crtc_dpms() into callers
Date: Thu, 27 Jun 2024 17:27:52 +0200
Message-ID: <20240627153638.8765-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627153638.8765-1-tzimmermann@suse.de>
References: <20240627153638.8765-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Queue-Id: 60AAB1FC07
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

The function ast_crtc_dpms() is left over from when the ast driver
did not implement atomic modesetting. But DPMS is not supported by
atomic modesetting and the helper is only called to enable or
disable the CRTC sync pulses. Inline the function into its callers.

To disable the CRTC, ast sets (AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF)
in VGACRB6. Replace the constants with the correct register constants
for VGACRB6.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 36 +++++++++++-----------------------
 drivers/gpu/drm/ast/ast_reg.h  |  9 ++-------
 2 files changed, 13 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 77358b587098..d130c96edf35 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1019,29 +1019,6 @@ static int ast_cursor_plane_init(struct ast_device *ast)
  * CRTC
  */
 
-static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
-{
-	struct ast_device *ast = to_ast_device(crtc->dev);
-	u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
-
-	/* TODO: Maybe control display signal generation with
-	 *       Sync Enable (bit CR17.7).
-	 */
-	switch (mode) {
-	case DRM_MODE_DPMS_ON:
-		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0);
-		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0);
-		break;
-	case DRM_MODE_DPMS_STANDBY:
-	case DRM_MODE_DPMS_SUSPEND:
-	case DRM_MODE_DPMS_OFF:
-		ch = mode;
-		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);
-		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, ch);
-		break;
-	}
-}
-
 static enum drm_mode_status
 ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
 {
@@ -1217,14 +1194,23 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 
 static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	ast_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
+	struct ast_device *ast = to_ast_device(crtc->dev);
+
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0x00);
+	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0x00);
 }
 
 static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	struct ast_device *ast = to_ast_device(crtc->dev);
+	u8 vgacrb6;
+
+	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);
 
-	ast_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+	vgacrb6 = AST_IO_VGACRB6_VSYNC_OFF |
+		  AST_IO_VGACRB6_HSYNC_OFF;
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
 
 	/*
 	 * HW cursors require the underlying primary plane and CRTC to
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 6326cbdadc82..75671d345057 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -32,6 +32,8 @@
 #define AST_IO_VGACR80_PASSWORD		(0xa8)
 #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
 #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
+#define AST_IO_VGACRB6_HSYNC_OFF	BIT(0)
+#define AST_IO_VGACRB6_VSYNC_OFF	BIT(1)
 #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
 #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
 
@@ -76,13 +78,6 @@
 #define ASTDP_HOST_EDID_READ_DONE	BIT(0)
 #define ASTDP_HOST_EDID_READ_DONE_MASK	GENMASK(0, 0)
 
-/*
- * CRB8[b1]: Enable VSYNC off
- * CRB8[b0]: Enable HSYNC off
- */
-#define AST_DPMS_VSYNC_OFF		BIT(1)
-#define AST_DPMS_HSYNC_OFF		BIT(0)
-
 /*
  * CRDF[b4]: Mirror of AST_DP_VIDEO_ENABLE
  * Precondition:	A. ~AST_DP_PHY_SLEEP  &&
-- 
2.45.2

