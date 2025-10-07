Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3BBC1DC9
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC7510E6CD;
	Tue,  7 Oct 2025 15:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZoUvmkiQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wmqJ9SEc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZoUvmkiQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wmqJ9SEc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA88210E6CE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:06:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6BFAB33720;
 Tue,  7 Oct 2025 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWN00GnETEXyrvgZ/ksdBdR+2+OfOEYYm8QDELeIUpE=;
 b=ZoUvmkiQFTwJcn2rBy6remquX784D7dIteUkXVn6HLQ9iYP4vtfoCRocl3LWNX24gVbx8g
 jSwuFiBDAjHYu5rFz1jJUJkol+pLWbRIfD3QBZfygYYmI6CMYDjf+PSej6oN7OrOG7M/OM
 Fh8SZwyFZUMn/Uuz2I9y+oHYLvCZYj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWN00GnETEXyrvgZ/ksdBdR+2+OfOEYYm8QDELeIUpE=;
 b=wmqJ9SEc/0p9vpPhbLd347zy5fH/MIbxxr91ZYqtHyP0RC1ER77fc3iKlUQVSHJfah9BQT
 ERZN8EgApXPN1MDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWN00GnETEXyrvgZ/ksdBdR+2+OfOEYYm8QDELeIUpE=;
 b=ZoUvmkiQFTwJcn2rBy6remquX784D7dIteUkXVn6HLQ9iYP4vtfoCRocl3LWNX24gVbx8g
 jSwuFiBDAjHYu5rFz1jJUJkol+pLWbRIfD3QBZfygYYmI6CMYDjf+PSej6oN7OrOG7M/OM
 Fh8SZwyFZUMn/Uuz2I9y+oHYLvCZYj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWN00GnETEXyrvgZ/ksdBdR+2+OfOEYYm8QDELeIUpE=;
 b=wmqJ9SEc/0p9vpPhbLd347zy5fH/MIbxxr91ZYqtHyP0RC1ER77fc3iKlUQVSHJfah9BQT
 ERZN8EgApXPN1MDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 498FB13AC2;
 Tue,  7 Oct 2025 15:06:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GOB0EHYs5Wh1SAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Oct 2025 15:06:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/5] drm/ast: Store precatch settings in struct
 ast_device_quirks
Date: Tue,  7 Oct 2025 16:54:45 +0200
Message-ID: <20251007150343.273718-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007150343.273718-1-tzimmermann@suse.de>
References: <20251007150343.273718-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Add a precatch flag in struct ast_device_info and set it on AST2500
and AST2600. Remove calls to IS_AST_GENn() from ast_set_crtc_reg().

Also fix the coding style in several places.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2500.c |  1 +
 drivers/gpu/drm/ast/ast_2600.c |  1 +
 drivers/gpu/drm/ast/ast_drv.h  |  6 ++++++
 drivers/gpu/drm/ast/ast_mode.c | 17 ++++++++---------
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
index 416bce9ea757..2a52af0ded56 100644
--- a/drivers/gpu/drm/ast/ast_2500.c
+++ b/drivers/gpu/drm/ast/ast_2500.c
@@ -621,6 +621,7 @@ static void ast_2500_detect_widescreen(struct ast_device *ast)
 static const struct ast_device_quirks ast_2500_device_quirks = {
 	.crtc_mem_req_threshold_low = 96,
 	.crtc_mem_req_threshold_high = 120,
+	.crtc_hsync_precatch_needed = true,
 };
 
 struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
index bb0a50b25766..7cde5ce9c41f 100644
--- a/drivers/gpu/drm/ast/ast_2600.c
+++ b/drivers/gpu/drm/ast/ast_2600.c
@@ -62,6 +62,7 @@ static void ast_2600_detect_widescreen(struct ast_device *ast)
 static const struct ast_device_quirks ast_2600_device_quirks = {
 	.crtc_mem_req_threshold_low = 160,
 	.crtc_mem_req_threshold_high = 224,
+	.crtc_hsync_precatch_needed = true,
 };
 
 struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 926e1c7de6f8..76969244d36f 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -170,6 +170,12 @@ struct ast_device_quirks {
 	 */
 	unsigned char crtc_mem_req_threshold_low;
 	unsigned char crtc_mem_req_threshold_high;
+
+	/*
+	 * Adjust hsync values to load next scanline early. Signalled
+	 * by AST2500PreCatchCRT in VBIOS mode flags.
+	 */
+	bool crtc_hsync_precatch_needed;
 };
 
 struct ast_device {
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index da374af9596d..ebb1ec82d904 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -241,16 +241,15 @@ static void ast_set_std_reg(struct ast_device *ast,
 		ast_set_index_reg(ast, AST_IO_VGAGRI, i, stdtable->gr[i]);
 }
 
-static void ast_set_crtc_reg(struct ast_device *ast,
-			     struct drm_display_mode *mode,
+static void ast_set_crtc_reg(struct ast_device *ast, struct drm_display_mode *mode,
 			     const struct ast_vbios_enhtable *vmode)
 {
 	u8 jreg05 = 0, jreg07 = 0, jreg09 = 0, jregAC = 0, jregAD = 0, jregAE = 0;
-	u16 temp, precache = 0;
+	u16 temp;
+	unsigned char crtc_hsync_precatch = 0;
 
-	if ((IS_AST_GEN6(ast) || IS_AST_GEN7(ast)) &&
-	    (vmode->flags & AST2500PreCatchCRT))
-		precache = 40;
+	if (ast->quirks->crtc_hsync_precatch_needed && (vmode->flags & AST2500PreCatchCRT))
+		crtc_hsync_precatch = 40;
 
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x11, 0x7f, 0x00);
 
@@ -276,12 +275,12 @@ static void ast_set_crtc_reg(struct ast_device *ast,
 		jregAD |= 0x01;  /* HBE D[5] */
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x03, 0xE0, (temp & 0x1f));
 
-	temp = ((mode->crtc_hsync_start-precache) >> 3) - 1;
+	temp = ((mode->crtc_hsync_start - crtc_hsync_precatch) >> 3) - 1;
 	if (temp & 0x100)
 		jregAC |= 0x40; /* HRS D[5] */
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x04, 0x00, temp);
 
-	temp = (((mode->crtc_hsync_end-precache) >> 3) - 1) & 0x3f;
+	temp = (((mode->crtc_hsync_end - crtc_hsync_precatch) >> 3) - 1) & 0x3f;
 	if (temp & 0x20)
 		jregAD |= 0x04; /* HRE D[5] */
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x05, 0x60, (u8)((temp & 0x1f) | jreg05));
@@ -348,7 +347,7 @@ static void ast_set_crtc_reg(struct ast_device *ast,
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x09, 0xdf, jreg09);
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xAE, 0x00, (jregAE | 0x80));
 
-	if (precache)
+	if (crtc_hsync_precatch)
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0x3f, 0x80);
 	else
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0x3f, 0x00);
-- 
2.51.0

