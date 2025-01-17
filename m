Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7530A14DA0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 11:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1059610E301;
	Fri, 17 Jan 2025 10:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39D010E301
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 10:34:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BDF401F38C;
 Fri, 17 Jan 2025 10:34:56 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2FF1B13AF1;
 Fri, 17 Jan 2025 10:34:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ENJjClAyimewLAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jan 2025 10:34:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/8] drm/ast: Hide Gens 1 to 3 TX detection in branch
Date: Fri, 17 Jan 2025 11:29:10 +0100
Message-ID: <20250117103450.28692-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117103450.28692-1-tzimmermann@suse.de>
References: <20250117103450.28692-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BDF401F38C
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Gen7 only supports ASTDP. Gens 4 to 6 support various TX chips,
except ASTDP. These boards detect the TX chips by reading the SoC
scratch register as VGACRD1.

Gens 1 to 3 only support SIL164. These boards read the DVO bit from
VGACRA3. Hence move this test behind a branch, so that it does not
run on later generations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 474eb255b325b..50b57bc15d53c 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -96,21 +96,21 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 	/* Check 3rd Tx option (digital output afaik) */
 	ast->tx_chip = AST_TX_NONE;
 
-	/*
-	 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
-	 * enabled, in that case, assume we have a SIL164 TMDS transmitter
-	 *
-	 * Don't make that assumption if we the chip wasn't enabled and
-	 * is at power-on reset, otherwise we'll incorrectly "detect" a
-	 * SIL164 when there is none.
-	 */
-	if (!need_post) {
-		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
-		if (jreg & 0x80)
-			ast->tx_chip = AST_TX_SIL164;
-	}
-
-	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
+	if (AST_GEN(ast) <= 3) {
+		/*
+		 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
+		 * enabled, in that case, assume we have a SIL164 TMDS transmitter
+		 *
+		 * Don't make that assumption if we the chip wasn't enabled and
+		 * is at power-on reset, otherwise we'll incorrectly "detect" a
+		 * SIL164 when there is none.
+		 */
+		if (!need_post) {
+			jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
+			if (jreg & 0x80)
+				ast->tx_chip = AST_TX_SIL164;
+		}
+	} else if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
 		/*
 		 * On AST GEN4+, look the configuration set by the SoC in
 		 * the SOC scratch register #1 bits 11:8 (interestingly marked
-- 
2.47.1

