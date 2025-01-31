Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6F2A23B4C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 10:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA22A10E197;
	Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="J6BgTRUs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2qvikTRE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J6BgTRUs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2qvikTRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0164E10E169
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5E3221173;
 Fri, 31 Jan 2025 09:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8uSswUA70rDsLsgY1y7Vn+Y1BPh985dMY7P2cIIr9w=;
 b=J6BgTRUskOdi/RNY2e2EoWwvWN+Oer4Ue91ZSLKIylOCRziZMXqVr6P1NaQxCoT4f34UMw
 id+gM31DKq1efx/R0aivCLO9cnZM5oUuNT4jgqOUI6h6bu0EIGjUFZpMUemVphNtYupoi3
 vmhCH0JzGwoZ8V0OrBUT0erNLimCHfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8uSswUA70rDsLsgY1y7Vn+Y1BPh985dMY7P2cIIr9w=;
 b=2qvikTRE68ebFI+fXnWFg6m3N/fujDcz8AC6B6U3xo2W95ZqkGPefZrIueuM34q4I/2dIJ
 Yha0Ft9yIUXwcaAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8uSswUA70rDsLsgY1y7Vn+Y1BPh985dMY7P2cIIr9w=;
 b=J6BgTRUskOdi/RNY2e2EoWwvWN+Oer4Ue91ZSLKIylOCRziZMXqVr6P1NaQxCoT4f34UMw
 id+gM31DKq1efx/R0aivCLO9cnZM5oUuNT4jgqOUI6h6bu0EIGjUFZpMUemVphNtYupoi3
 vmhCH0JzGwoZ8V0OrBUT0erNLimCHfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8uSswUA70rDsLsgY1y7Vn+Y1BPh985dMY7P2cIIr9w=;
 b=2qvikTRE68ebFI+fXnWFg6m3N/fujDcz8AC6B6U3xo2W95ZqkGPefZrIueuM34q4I/2dIJ
 Yha0Ft9yIUXwcaAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A07371364B;
 Fri, 31 Jan 2025 09:23:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yPj1JXaWnGd+GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:23:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 02/16] drm/ast: Align naming in widescreen detection code
 to manual
Date: Fri, 31 Jan 2025 10:21:02 +0100
Message-ID: <20250131092257.115596-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131092257.115596-1-tzimmermann@suse.de>
References: <20250131092257.115596-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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

Rename variables and register constants to align with the programming
manual. Add new constants where necessary.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.c  |  2 +-
 drivers/gpu/drm/ast/ast_main.c |  8 ++++----
 drivers/gpu/drm/ast/ast_post.c |  2 +-
 drivers/gpu/drm/ast/ast_reg.h  | 11 ++++++-----
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index cddd69972e89d..6fbf62a99c48d 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -170,7 +170,7 @@ static int ast_detect_chip(struct pci_dev *pdev,
 
 			/* Patch AST2500/AST2510 */
 			if ((pdev->revision & 0xf0) == 0x40) {
-				if (!(vgacrd0 & AST_VRAM_INIT_STATUS_MASK))
+				if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK))
 					ast_patch_ahb_2500(regs);
 			}
 
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index ba69280b33e78..2a813f0128eb8 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -38,7 +38,7 @@
 
 static void ast_detect_widescreen(struct ast_device *ast)
 {
-	u8 jreg;
+	u8 vgacrd0;
 
 	/* Check if we support wide screen */
 	switch (AST_GEN(ast)) {
@@ -46,10 +46,10 @@ static void ast_detect_widescreen(struct ast_device *ast)
 		ast->support_wide_screen = false;
 		break;
 	default:
-		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
-		if (!(jreg & 0x80))
+		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
+		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
 			ast->support_wide_screen = true;
-		else if (jreg & 0x01)
+		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
 			ast->support_wide_screen = true;
 		else {
 			ast->support_wide_screen = false;
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 0daa8e52a092a..91e85e457bdf3 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -2062,7 +2062,7 @@ void ast_post_chip_2500(struct ast_device *ast)
 	u8 reg;
 
 	reg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
-	if ((reg & AST_VRAM_INIT_STATUS_MASK) == 0) {/* vga only */
+	if ((reg & AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK) == 0) {/* vga only */
 		/* Clear bus lock condition */
 		ast_patch_ahb_2500(ast->regs);
 
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 0745d58e5b450..b4ff38949a565 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -38,6 +38,12 @@
 #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
 #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
 
+/* mirrors SCU100[7:0] */
+#define AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK	GENMASK(7, 6)
+#define AST_IO_VGACRD0_VRAM_INIT_BY_BMC		BIT(7)
+#define AST_IO_VGACRD0_VRAM_INIT_READY		BIT(6)
+#define AST_IO_VGACRD0_IKVM_WIDESCREEN		BIT(0)
+
 #define AST_IO_VGACRD1_MCU_FW_EXECUTING		BIT(5)
 /* Display Transmitter Type */
 #define AST_IO_VGACRD1_TX_TYPE_MASK		GENMASK(3, 1)
@@ -61,11 +67,6 @@
 #define AST_IO_VGAIR1_R			(0x5A)
 #define AST_IO_VGAIR1_VREFRESH		BIT(3)
 
-
-#define AST_VRAM_INIT_STATUS_MASK	GENMASK(7, 6)
-//#define AST_VRAM_INIT_BY_BMC		BIT(7)
-//#define AST_VRAM_INIT_READY		BIT(6)
-
 /*
  * AST DisplayPort
  */
-- 
2.48.1

