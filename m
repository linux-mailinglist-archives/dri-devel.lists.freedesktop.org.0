Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091AEA14DA7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 11:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E61610EAC5;
	Fri, 17 Jan 2025 10:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="I8URgbbi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5xPbgQiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD74310EABB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 10:35:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0171321169;
 Fri, 17 Jan 2025 10:34:56 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737110096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AuWW+jH8LD4wJsotGIfuzm0Qf54CbRkyccEnf4P3IeE=;
 b=I8URgbbi1YcTCP7mYj2Sh3zs3zluyUTxJ8WGaa1R8lRdnNR9f4sT1mP6Y01rxrb6mO7gXP
 BoTm/Ury76n48pdAaiyV6bqylzMZ4/9wX0z7bvNWT1HGXvBrSFIDH+r8k3xqvkupyFavRz
 8aKfwf7qw53ybhTSLduR2IkVLCeIU7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737110096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AuWW+jH8LD4wJsotGIfuzm0Qf54CbRkyccEnf4P3IeE=;
 b=5xPbgQiSEJQcDBzQcMA/hvMtEEH41GvpZCAV7vjVDyvUN+i9PDMizR90dz3FYUa669V+HU
 807Yu9/o0OEwOGBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE32113ABA;
 Fri, 17 Jan 2025 10:34:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2DTvME8yimewLAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jan 2025 10:34:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/8] drm/ast: Refactor ast_post_gpu() by Gen
Date: Fri, 17 Jan 2025 11:29:08 +0100
Message-ID: <20250117103450.28692-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117103450.28692-1-tzimmermann@suse.de>
References: <20250117103450.28692-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 0171321169
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Reorganize ast_post_gpu() so that it first branches by Gen and then
by config mode and TX chip. This will later make it possible to split
up the function by Gen.

The helper ast_init_3rdtx() only handles Gen4 and Gen5, so leave it
out from the other Gens.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_post.c | 36 ++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 364030f97571d..49f661760f9e5 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -344,21 +344,37 @@ void ast_post_gpu(struct ast_device *ast)
 {
 	ast_set_def_ext_reg(ast);
 
-	if (IS_AST_GEN7(ast)) {
+	if (AST_GEN(ast) >= 7) {
 		if (ast->tx_chip == AST_TX_ASTDP)
 			ast_dp_launch(ast);
-	} else if (ast->config_mode == ast_use_p2a) {
-		if (IS_AST_GEN6(ast))
+	} else if (AST_GEN(ast) >= 6) {
+		if (ast->config_mode == ast_use_p2a) {
 			ast_post_chip_2500(ast);
-		else if (IS_AST_GEN5(ast) || IS_AST_GEN4(ast))
+		} else {
+			if (ast->tx_chip == AST_TX_SIL164) {
+				/* Enable DVO */
+				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);
+			}
+		}
+	} else if (AST_GEN(ast) >= 4) {
+		if (ast->config_mode == ast_use_p2a) {
 			ast_post_chip_2300(ast);
-		else
+			ast_init_3rdtx(ast);
+		} else {
+			if (ast->tx_chip == AST_TX_SIL164) {
+				/* Enable DVO */
+				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);
+			}
+		}
+	} else  {
+		if (ast->config_mode == ast_use_p2a) {
 			ast_init_dram_reg(ast);
-
-		ast_init_3rdtx(ast);
-	} else {
-		if (ast->tx_chip == AST_TX_SIL164)
-			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);	/* Enable DVO */
+		} else {
+			if (ast->tx_chip == AST_TX_SIL164) {
+				/* Enable DVO */
+				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);
+			}
+		}
 	}
 }
 
-- 
2.47.1

