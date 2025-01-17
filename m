Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FA3A14DA8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 11:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2737110EAC0;
	Fri, 17 Jan 2025 10:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1Vr0eMkI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Fo/TDMC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Vr0eMkI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Fo/TDMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C9310EAC5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 10:35:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4DEC21177;
 Fri, 17 Jan 2025 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737110096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNEto94XdYBZKneev6sZpD1YkqCV11HkA06HKh9xGoU=;
 b=1Vr0eMkI3k2y+GiZ/6E5SttwApRA7+2o+YlijeFZmjjOwvzRiGINI8tBSQvBVIs3SWkIVO
 ANZpFuxY+JrcHD8ljOdYgsaWLSwfiZn7WvjMA/lFi6/pFwbJ8ocyXhj07PugYkXY8PzQ/o
 kTp8bJsRK5y2vOGN0J5M59xb49SN430=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737110096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNEto94XdYBZKneev6sZpD1YkqCV11HkA06HKh9xGoU=;
 b=9Fo/TDMCMSLCiFKxlfBR8logt9x674W5hK4hQ2unpRzLULN0rZb40K02MwjGAEImNV8j96
 eHmDAX3iEG3ZjvCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737110096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNEto94XdYBZKneev6sZpD1YkqCV11HkA06HKh9xGoU=;
 b=1Vr0eMkI3k2y+GiZ/6E5SttwApRA7+2o+YlijeFZmjjOwvzRiGINI8tBSQvBVIs3SWkIVO
 ANZpFuxY+JrcHD8ljOdYgsaWLSwfiZn7WvjMA/lFi6/pFwbJ8ocyXhj07PugYkXY8PzQ/o
 kTp8bJsRK5y2vOGN0J5M59xb49SN430=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737110096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNEto94XdYBZKneev6sZpD1YkqCV11HkA06HKh9xGoU=;
 b=9Fo/TDMCMSLCiFKxlfBR8logt9x674W5hK4hQ2unpRzLULN0rZb40K02MwjGAEImNV8j96
 eHmDAX3iEG3ZjvCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8889C13AF3;
 Fri, 17 Jan 2025 10:34:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sH8ZIFAyimewLAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jan 2025 10:34:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/8] drm/ast: Merge TX-chip detection code for Gen4 and later
Date: Fri, 17 Jan 2025 11:29:12 +0100
Message-ID: <20250117103450.28692-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117103450.28692-1-tzimmermann@suse.de>
References: <20250117103450.28692-1-tzimmermann@suse.de>
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

Gens 4 to 6 and Gen7 use the same pattern for detecting the installed
TX chips. Merge the code into a single branch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 40d3b7770cf18..b0d1b99ed532b 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -110,15 +110,18 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 			if (vgacra3 & AST_IO_VGACRA3_DVO_ENABLED)
 				ast->tx_chip = AST_TX_SIL164;
 		}
-	} else if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
+	} else {
 		/*
-		 * On AST GEN4+, look the configuration set by the SoC in
+		 * On AST GEN4+, look at the configuration set by the SoC in
 		 * the SOC scratch register #1 bits 11:8 (interestingly marked
 		 * as "reserved" in the spec)
 		 */
 		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
 					      AST_IO_VGACRD1_TX_TYPE_MASK);
 		switch (jreg) {
+		/*
+		 * GEN4 to GEN6
+		 */
 		case AST_IO_VGACRD1_TX_SIL164_VBIOS:
 			ast->tx_chip = AST_TX_SIL164;
 			break;
@@ -134,11 +137,13 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 			fallthrough;
 		case AST_IO_VGACRD1_TX_FW_EMBEDDED_FW:
 			ast->tx_chip = AST_TX_DP501;
-		}
-	} else if (IS_AST_GEN7(ast)) {
-		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, AST_IO_VGACRD1_TX_TYPE_MASK) ==
-		    AST_IO_VGACRD1_TX_ASTDP) {
+			break;
+		/*
+		 * GEN7+
+		 */
+		case AST_IO_VGACRD1_TX_ASTDP:
 			ast->tx_chip = AST_TX_ASTDP;
+			break;
 		}
 	}
 
-- 
2.47.1

