Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2371A14DA3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 11:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1710E3A8;
	Fri, 17 Jan 2025 10:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PJdvXwei";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="buG+U98i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PJdvXwei";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="buG+U98i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA6810E306
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 10:34:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B265C2116C;
 Fri, 17 Jan 2025 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737110096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3jEUGNVN2yR9TcoWhufkK09D1OtsHOSv+Ga6p6BOuU=;
 b=PJdvXweiNEHbr/QGlYCXSoN0jF8mPDjUR8hOxtUX6lC+mIALORvuaK/BjonUamSfHbnOne
 1EiiMk62fidBNFSkkkXdj4mY0swMwAcHoTE6YnNyeG3QpCXwuR3lntMkOvjBR8FUhNyyaj
 +wNhDR9AcXCVW2rNLxXXfsR7EzfWuV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737110096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3jEUGNVN2yR9TcoWhufkK09D1OtsHOSv+Ga6p6BOuU=;
 b=buG+U98iRGq5vkZF4ZX1EojCctGrYiOxB3P5FMmTT/uYu2y/C5bDUT3MLloTebwetswCXs
 2EcUj80zSWZXBGBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737110096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3jEUGNVN2yR9TcoWhufkK09D1OtsHOSv+Ga6p6BOuU=;
 b=PJdvXweiNEHbr/QGlYCXSoN0jF8mPDjUR8hOxtUX6lC+mIALORvuaK/BjonUamSfHbnOne
 1EiiMk62fidBNFSkkkXdj4mY0swMwAcHoTE6YnNyeG3QpCXwuR3lntMkOvjBR8FUhNyyaj
 +wNhDR9AcXCVW2rNLxXXfsR7EzfWuV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737110096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3jEUGNVN2yR9TcoWhufkK09D1OtsHOSv+Ga6p6BOuU=;
 b=buG+U98iRGq5vkZF4ZX1EojCctGrYiOxB3P5FMmTT/uYu2y/C5bDUT3MLloTebwetswCXs
 2EcUj80zSWZXBGBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5BCFD13AF2;
 Fri, 17 Jan 2025 10:34:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sBAvFVAyimewLAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jan 2025 10:34:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/8] drm/ast: Align Gen1 DVO detection to register manual
Date: Fri, 17 Jan 2025 11:29:11 +0100
Message-ID: <20250117103450.28692-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117103450.28692-1-tzimmermann@suse.de>
References: <20250117103450.28692-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO
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

Align variable names and register constants for TX-chip detection
to the names in the register manual.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 6 +++---
 drivers/gpu/drm/ast/ast_reg.h  | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 50b57bc15d53c..40d3b7770cf18 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -76,7 +76,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 	};
 
 	struct drm_device *dev = &ast->base;
-	u8 jreg, vgacrd1;
+	u8 vgacra3, vgacrd1;
 
 	/*
 	 * Several of the listed TX chips are not explicitly supported
@@ -106,8 +106,8 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 		 * SIL164 when there is none.
 		 */
 		if (!need_post) {
-			jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
-			if (jreg & 0x80)
+			vgacra3 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
+			if (vgacra3 & AST_IO_VGACRA3_DVO_ENABLED)
 				ast->tx_chip = AST_TX_SIL164;
 		}
 	} else if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 2aadf07d135af..0745d58e5b450 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -32,6 +32,7 @@
 #define AST_IO_VGACR80_PASSWORD		(0xa8)
 #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
 #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
+#define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)
 #define AST_IO_VGACRB6_HSYNC_OFF	BIT(0)
 #define AST_IO_VGACRB6_VSYNC_OFF	BIT(1)
 #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
-- 
2.47.1

