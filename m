Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289D991AB84
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3614C10EAF6;
	Thu, 27 Jun 2024 15:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C9510EAF1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 15:36:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2640D1FC06;
 Thu, 27 Jun 2024 15:36:44 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E617D1384C;
 Thu, 27 Jun 2024 15:36:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4DLZNguHfWbmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jun 2024 15:36:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/8] drm/ast: Only set VGA SCREEN_DISABLE bit in CRTC code
Date: Thu, 27 Jun 2024 17:27:51 +0200
Message-ID: <20240627153638.8765-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627153638.8765-1-tzimmermann@suse.de>
References: <20240627153638.8765-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 2640D1FC06
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

The SCREEN_DISABLE bit controls scanout from display memory. The bit
affects all planes, so set it only in the CRTC's atomic enable and
disable functions.

A number of bugs affect this fix. First of all, ast_set_std_regs()
tries to set VGASR1 except for the SD bit. Bit the read bitmask is
invert, so it preserves anything exceptt the SD bit. Fix this by
inverting the read mask.

The second issue is that primary-plane and CRTC helpers modify the
SD bit. The bit controls scanout for all planes, primary and HW
cursor, so set it only in the CRTC code.

Further add a constant to represent the SD bit in VGASR1. Keep the
plane's atomic_disable around to make the DRM framework happy.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 14 +++++++-------
 drivers/gpu/drm/ast/ast_reg.h  |  1 +
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e90179bc0842..77358b587098 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -303,7 +303,7 @@ static void ast_set_std_reg(struct ast_device *ast,
 
 	/* Set SEQ; except Screen Disable field */
 	ast_set_index_reg(ast, AST_IO_VGASRI, 0x00, 0x03);
-	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, stdtable->seq[0]);
+	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0x20, stdtable->seq[0]);
 	for (i = 1; i < 4; i++) {
 		jreg = stdtable->seq[i];
 		ast_set_index_reg(ast, AST_IO_VGASRI, (i + 1), jreg);
@@ -690,15 +690,15 @@ static void ast_primary_plane_helper_atomic_enable(struct drm_plane *plane,
 	 * Therefore only reprogram the address after enabling the plane.
 	 */
 	ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
-	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x1, 0xdf, 0x00);
 }
 
 static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 						    struct drm_atomic_state *state)
 {
-	struct ast_device *ast = to_ast_device(plane->dev);
-
-	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x1, 0xdf, 0x20);
+	/*
+	 * Keep this empty function to avoid calling
+	 * atomic_update when disabling the plane.
+	 */
 }
 
 static int ast_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
@@ -1029,14 +1029,14 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 	 */
 	switch (mode) {
 	case DRM_MODE_DPMS_ON:
-		ast_set_index_reg_mask(ast, AST_IO_VGASRI,  0x01, 0xdf, 0);
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0);
+		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0);
 		break;
 	case DRM_MODE_DPMS_STANDBY:
 	case DRM_MODE_DPMS_SUSPEND:
 	case DRM_MODE_DPMS_OFF:
 		ch = mode;
-		ast_set_index_reg_mask(ast, AST_IO_VGASRI,  0x01, 0xdf, 0x20);
+		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, ch);
 		break;
 	}
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 62dddbf3fe56..6326cbdadc82 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -22,6 +22,7 @@
 #define AST_IO_VGAER_VGA_ENABLE		BIT(0)
 
 #define AST_IO_VGASRI			(0x44)
+#define AST_IO_VGASR1_SD		BIT(5)
 #define AST_IO_VGADRR			(0x47)
 #define AST_IO_VGADWR			(0x48)
 #define AST_IO_VGAPDR		        (0x49)
-- 
2.45.2

