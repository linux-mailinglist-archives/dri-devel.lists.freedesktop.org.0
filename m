Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A4DA1B146
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68AC10E902;
	Fri, 24 Jan 2025 08:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0hAB0s68";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6FoZAVCR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0hAB0s68";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6FoZAVCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F7810E8FA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF8EB1F38F;
 Fri, 24 Jan 2025 08:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737705954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zvwJrzvd/6D2q8TwGObX9LrgyAsU8qhlujNSzBAsu64=;
 b=0hAB0s68qhJ7JLeNu5mmSwyTrkoXear1qnadKEzt75B53foEo1/veFynsfF86c0FFiSqTM
 7020wcRfU+6rLoOPWoC5775gB6h+2Wrt6ELFISoH0whAWvz/uQiUsg8xRP+7g5XUJIWaCx
 GdojWKaREduZt3AGClNfYVXu+b0GHLM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737705954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zvwJrzvd/6D2q8TwGObX9LrgyAsU8qhlujNSzBAsu64=;
 b=6FoZAVCRTDFqOd7c1FtkAw5B+tKRdp5fSkvMxr2NWNdedQphYfdJ/uXKFELruG1vY8PsaF
 tvFhdrlqIakRhdAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737705954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zvwJrzvd/6D2q8TwGObX9LrgyAsU8qhlujNSzBAsu64=;
 b=0hAB0s68qhJ7JLeNu5mmSwyTrkoXear1qnadKEzt75B53foEo1/veFynsfF86c0FFiSqTM
 7020wcRfU+6rLoOPWoC5775gB6h+2Wrt6ELFISoH0whAWvz/uQiUsg8xRP+7g5XUJIWaCx
 GdojWKaREduZt3AGClNfYVXu+b0GHLM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737705954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zvwJrzvd/6D2q8TwGObX9LrgyAsU8qhlujNSzBAsu64=;
 b=6FoZAVCRTDFqOd7c1FtkAw5B+tKRdp5fSkvMxr2NWNdedQphYfdJ/uXKFELruG1vY8PsaF
 tvFhdrlqIakRhdAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B98C8139CB;
 Fri, 24 Jan 2025 08:05:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +EwWLOJJk2coNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:05:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/15] drm/ast: Reorganize widescreen test around hardware Gens
Date: Fri, 24 Jan 2025 08:57:41 +0100
Message-ID: <20250124080546.9956-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124080546.9956-1-tzimmermann@suse.de>
References: <20250124080546.9956-1-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
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

Testing for support of widescreen modes mixes up various hardware
Gens. First branch by hardware Gen, then do specific tests for each
Gen. By default, widesscreen support is disabled.

Later patches will add more specific tests for each Gen.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 47 +++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 2a813f0128eb8..4f402e0b9b5c1 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -40,29 +40,40 @@ static void ast_detect_widescreen(struct ast_device *ast)
 {
 	u8 vgacrd0;
 
-	/* Check if we support wide screen */
-	switch (AST_GEN(ast)) {
-	case 1:
-		ast->support_wide_screen = false;
-		break;
-	default:
+	ast->support_wide_screen = false;
+
+	if (AST_GEN(ast) >= 7) {
+		ast->support_wide_screen = true;
+	} else if (AST_GEN(ast) >= 6) {
+		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
+		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
+			ast->support_wide_screen = true;
+		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
+			ast->support_wide_screen = true;
+		else if (ast->chip == AST2510)
+			ast->support_wide_screen = true;
+	} else if (AST_GEN(ast) >= 5) {
+		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
+		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
+			ast->support_wide_screen = true;
+		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
+			ast->support_wide_screen = true;
+		else if (ast->chip == AST1400)
+			ast->support_wide_screen = true;
+	} else if (AST_GEN(ast) >= 4) {
+		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
+		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
+			ast->support_wide_screen = true;
+		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
+			ast->support_wide_screen = true;
+		else if (ast->chip == AST1300)
+			ast->support_wide_screen = true;
+	} else if (AST_GEN(ast) >= 2) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
 			ast->support_wide_screen = true;
 		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
 			ast->support_wide_screen = true;
-		else {
-			ast->support_wide_screen = false;
-			if (ast->chip == AST1300)
-				ast->support_wide_screen = true;
-			if (ast->chip == AST1400)
-				ast->support_wide_screen = true;
-			if (ast->chip == AST2510)
-				ast->support_wide_screen = true;
-			if (IS_AST_GEN7(ast))
-				ast->support_wide_screen = true;
-		}
-		break;
 	}
 }
 
-- 
2.47.1

