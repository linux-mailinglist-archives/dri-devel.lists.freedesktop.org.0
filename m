Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE453AFA687
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 18:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062F910E3B0;
	Sun,  6 Jul 2025 16:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zspxBz4t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H6gXox0G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zspxBz4t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H6gXox0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C05010E3B0
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 16:28:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A2DA81F456;
 Sun,  6 Jul 2025 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751819301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvwxE9NRzhbE4OPL6Ov0g5J+TLEAW6jer8inF0tqgdM=;
 b=zspxBz4t3pc5NxqhJi+GqutnbZx2FDR1sDPuhtooktH0cqjrxFtnJbTbgTFLBc0KAzHreF
 VtwqJxxa8fYTsuhzR1AlUsfvP2L5Gi8MjMyGJR8SGPMiunHvsDm58WAcBbAd+g11+R22QW
 M2c8WM5oRH1FWCRc8Oc2sYX92Pc9b14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751819301;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvwxE9NRzhbE4OPL6Ov0g5J+TLEAW6jer8inF0tqgdM=;
 b=H6gXox0G2rjlNATwEpxKMMy8sG7Le+9anKSNK8tb6o+Stzx0EOFBk1R84cKJlyGQJiy0fA
 8FAMKuAtyEbLTODg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zspxBz4t;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=H6gXox0G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751819301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvwxE9NRzhbE4OPL6Ov0g5J+TLEAW6jer8inF0tqgdM=;
 b=zspxBz4t3pc5NxqhJi+GqutnbZx2FDR1sDPuhtooktH0cqjrxFtnJbTbgTFLBc0KAzHreF
 VtwqJxxa8fYTsuhzR1AlUsfvP2L5Gi8MjMyGJR8SGPMiunHvsDm58WAcBbAd+g11+R22QW
 M2c8WM5oRH1FWCRc8Oc2sYX92Pc9b14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751819301;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvwxE9NRzhbE4OPL6Ov0g5J+TLEAW6jer8inF0tqgdM=;
 b=H6gXox0G2rjlNATwEpxKMMy8sG7Le+9anKSNK8tb6o+Stzx0EOFBk1R84cKJlyGQJiy0fA
 8FAMKuAtyEbLTODg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B0E413A7D;
 Sun,  6 Jul 2025 16:28:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KDGjHCWkamjJSgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Jul 2025 16:28:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/10] drm/ast: Gen7: Switch default registers to gen4+
 state
Date: Sun,  6 Jul 2025 18:26:45 +0200
Message-ID: <20250706162816.211552-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706162816.211552-1-tzimmermann@suse.de>
References: <20250706162816.211552-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A2DA81F456
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLshs48ja9yam3qja8i6gi8aeo)];
 RCVD_COUNT_TWO(0.00)[2];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
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

Change the default register settings for Gen7 to mach Gen4 and
later. Gen7 currently uses the settings for Gen1, which is most
likely incorrect.

Using Gen4+ settings enables E2M linear-access modes in VGACRA2.
It appears to be related to the chip's PCIE2MBOX feature, which
is unused.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_2600.c | 33 +--------------------------------
 drivers/gpu/drm/ast/ast_post.h |  3 ---
 2 files changed, 1 insertion(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
index 01fd0e2d96e1..8d75a47444f5 100644
--- a/drivers/gpu/drm/ast/ast_2600.c
+++ b/drivers/gpu/drm/ast/ast_2600.c
@@ -33,40 +33,9 @@
  * POST
  */
 
-void ast_2600_set_def_ext_reg(struct ast_device *ast)
-{
-	static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
-	u8 i, index, reg;
-	const u8 *ext_reg_info;
-
-	/* reset scratch */
-	for (i = 0x81; i <= 0x9f; i++)
-		ast_set_index_reg(ast, AST_IO_VGACRI, i, 0x00);
-
-	ext_reg_info = extreginfo;
-	index = 0xa0;
-	while (*ext_reg_info != 0xff) {
-		ast_set_index_reg_mask(ast, AST_IO_VGACRI, index, 0x00, *ext_reg_info);
-		index++;
-		ext_reg_info++;
-	}
-
-	/* disable standard IO/MEM decode if secondary */
-	/* ast_set_index_reg-mask(ast, AST_IO_VGACRI, 0xa1, 0xff, 0x3); */
-
-	/* Set Ext. Default */
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x8c, 0x00, 0x01);
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0x00, 0x00);
-
-	/* Enable RAMDAC for A1 */
-	reg = 0x04;
-	reg |= 0x20;
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
-}
-
 int ast_2600_post(struct ast_device *ast)
 {
-	ast_2600_set_def_ext_reg(ast);
+	ast_2300_set_def_ext_reg(ast);
 
 	if (ast->tx_chip == AST_TX_ASTDP)
 		return ast_dp_launch(ast);
diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
index 9f3108ddeae8..aa5d247bebe8 100644
--- a/drivers/gpu/drm/ast/ast_post.h
+++ b/drivers/gpu/drm/ast/ast_post.h
@@ -47,7 +47,4 @@ void ast_2000_set_def_ext_reg(struct ast_device *ast);
 /* ast_2300.c */
 void ast_2300_set_def_ext_reg(struct ast_device *ast);
 
-/* ast_2600.c */
-void ast_2600_set_def_ext_reg(struct ast_device *ast);
-
 #endif
-- 
2.50.0

