Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FECFA14DA2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 11:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55EF10E397;
	Fri, 17 Jan 2025 10:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B99210E17D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 10:34:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DAF3721178;
 Fri, 17 Jan 2025 10:34:56 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B413B13AB2;
 Fri, 17 Jan 2025 10:34:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8BGwKlAyimewLAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jan 2025 10:34:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 8/8] drm/ast: Only warn about unsupported TX chips on Gen4 and
 later
Date: Fri, 17 Jan 2025 11:29:13 +0100
Message-ID: <20250117103450.28692-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117103450.28692-1-tzimmermann@suse.de>
References: <20250117103450.28692-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: DAF3721178
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

Only Gen4 and later read the installed TX chip from the SoC. So only
warn on those generations about unsupported chips.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 40 +++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index b0d1b99ed532b..ba69280b33e78 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -78,21 +78,6 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 	struct drm_device *dev = &ast->base;
 	u8 vgacra3, vgacrd1;
 
-	/*
-	 * Several of the listed TX chips are not explicitly supported
-	 * by the ast driver. If these exist in real-world devices, they
-	 * are most likely reported as VGA or SIL164 outputs. We warn here
-	 * to get bug reports for these devices. If none come in for some
-	 * time, we can begin to fail device probing on these values.
-	 */
-	vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, AST_IO_VGACRD1_TX_TYPE_MASK);
-	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_ITE66121_VBIOS,
-		 "ITE IT66121 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
-	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_CH7003_VBIOS,
-		 "Chrontel CH7003 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
-	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_ANX9807_VBIOS,
-		 "Analogix ANX9807 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
-
 	/* Check 3rd Tx option (digital output afaik) */
 	ast->tx_chip = AST_TX_NONE;
 
@@ -116,9 +101,9 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 		 * the SOC scratch register #1 bits 11:8 (interestingly marked
 		 * as "reserved" in the spec)
 		 */
-		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
-					      AST_IO_VGACRD1_TX_TYPE_MASK);
-		switch (jreg) {
+		vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
+						 AST_IO_VGACRD1_TX_TYPE_MASK);
+		switch (vgacrd1) {
 		/*
 		 * GEN4 to GEN6
 		 */
@@ -144,6 +129,25 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 		case AST_IO_VGACRD1_TX_ASTDP:
 			ast->tx_chip = AST_TX_ASTDP;
 			break;
+		/*
+		 * Several of the listed TX chips are not explicitly supported
+		 * by the ast driver. If these exist in real-world devices, they
+		 * are most likely reported as VGA or SIL164 outputs. We warn here
+		 * to get bug reports for these devices. If none come in for some
+		 * time, we can begin to fail device probing on these values.
+		 */
+		case AST_IO_VGACRD1_TX_ITE66121_VBIOS:
+			drm_warn(dev, "ITE IT66121 detected, 0x%x, Gen%lu\n",
+				 vgacrd1, AST_GEN(ast));
+			break;
+		case AST_IO_VGACRD1_TX_CH7003_VBIOS:
+			drm_warn(dev, "Chrontel CH7003 detected, 0x%x, Gen%lu\n",
+				 vgacrd1, AST_GEN(ast));
+			break;
+		case AST_IO_VGACRD1_TX_ANX9807_VBIOS:
+			drm_warn(dev, "Analogix ANX9807 detected, 0x%x, Gen%lu\n",
+				 vgacrd1, AST_GEN(ast));
+			break;
 		}
 	}
 
-- 
2.47.1

