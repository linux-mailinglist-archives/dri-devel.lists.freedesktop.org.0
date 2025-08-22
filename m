Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77A4B31999
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 15:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4996210E10D;
	Fri, 22 Aug 2025 13:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Npj4oktZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XF1ZFCfJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Npj4oktZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XF1ZFCfJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C0C10E10D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 13:31:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E7292220B;
 Fri, 22 Aug 2025 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755869497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiWmEg2f7MuAOJxy0pv+aQ7qwdJTzcMr4yVsbolov4o=;
 b=Npj4oktZg1Ro/OpVilX4+3wp8H/lZblikD9wrb2eGGs1W+04xkCYUrt2LgZzidgFsYBFAi
 aRgzxJ3xoVe099v0tXPvf22gxk8uo5KS/7ls4XhIr0hgFXjrf7J2JIT5Byt1GT/uqFXmG3
 XmdrbattrCs+iJVRdn/kgkui7fQpUxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755869497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiWmEg2f7MuAOJxy0pv+aQ7qwdJTzcMr4yVsbolov4o=;
 b=XF1ZFCfJC+XQZFQ8vQxxdK6uyio7YDjlN6mB+25n8ZBgKuVmppkVIzg8oxmPzKXRJJCPv4
 DSl8emf9XZnWuNBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Npj4oktZ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XF1ZFCfJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755869497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiWmEg2f7MuAOJxy0pv+aQ7qwdJTzcMr4yVsbolov4o=;
 b=Npj4oktZg1Ro/OpVilX4+3wp8H/lZblikD9wrb2eGGs1W+04xkCYUrt2LgZzidgFsYBFAi
 aRgzxJ3xoVe099v0tXPvf22gxk8uo5KS/7ls4XhIr0hgFXjrf7J2JIT5Byt1GT/uqFXmG3
 XmdrbattrCs+iJVRdn/kgkui7fQpUxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755869497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiWmEg2f7MuAOJxy0pv+aQ7qwdJTzcMr4yVsbolov4o=;
 b=XF1ZFCfJC+XQZFQ8vQxxdK6uyio7YDjlN6mB+25n8ZBgKuVmppkVIzg8oxmPzKXRJJCPv4
 DSl8emf9XZnWuNBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F46613A31;
 Fri, 22 Aug 2025 13:31:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mJhDDjlxqGgneAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Aug 2025 13:31:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/6] drm/ast: Put AST_DRAM_ constants into enum ast_dram_layout
Date: Fri, 22 Aug 2025 14:52:13 +0200
Message-ID: <20250822132846.25376-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822132846.25376-1-tzimmermann@suse.de>
References: <20250822132846.25376-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7E7292220B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

The AST_DRAM_ constants belong together, so put them in an enum
type. Rename type and variables to 'drm_layout', as there's already
another DRAM type in the ast driver (AST_DDR2, AST_DDR3).

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2100.c | 20 +++++++++-----------
 drivers/gpu/drm/ast/ast_drv.h  | 16 +++++++++-------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
index 44c33dd050eb..736866763349 100644
--- a/drivers/gpu/drm/ast/ast_2100.c
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -35,10 +35,10 @@
  * DRAM type
  */
 
-static int ast_2100_get_dram_type_p2a(struct ast_device *ast)
+static enum ast_dram_layout ast_2100_get_dram_layout_p2a(struct ast_device *ast)
 {
 	u32 mcr_cfg;
-	int dram_type;
+	enum ast_dram_layout dram_layout;
 
 	ast_write32(ast, 0xf004, 0x1e6e0000);
 	ast_write32(ast, 0xf000, 0x1);
@@ -47,20 +47,20 @@ static int ast_2100_get_dram_type_p2a(struct ast_device *ast)
 	switch (mcr_cfg & 0x0c) {
 	case 0:
 	case 4:
-		dram_type = AST_DRAM_512Mx16;
+		dram_layout = AST_DRAM_512Mx16;
 		break;
 	case 8:
 		if (mcr_cfg & 0x40)
-			dram_type = AST_DRAM_1Gx16;
+			dram_layout = AST_DRAM_1Gx16;
 		else
-			dram_type = AST_DRAM_512Mx32;
+			dram_layout = AST_DRAM_512Mx32;
 		break;
 	case 0xc:
-		dram_type = AST_DRAM_1Gx32;
+		dram_layout = AST_DRAM_1Gx32;
 		break;
 	}
 
-	return dram_type;
+	return dram_layout;
 }
 
 /*
@@ -298,9 +298,7 @@ static void ast_post_chip_2100(struct ast_device *ast)
 	u8 j;
 	u32 data, temp, i;
 	const struct ast_dramstruct *dram_reg_info;
-	int dram_type;
-
-	dram_type = ast_2100_get_dram_type_p2a(ast);
+	enum ast_dram_layout dram_layout  = ast_2100_get_dram_layout_p2a(ast);
 
 	j = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
 
@@ -327,7 +325,7 @@ static void ast_post_chip_2100(struct ast_device *ast)
 				for (i = 0; i < 15; i++)
 					udelay(dram_reg_info->data);
 			} else if (AST_DRAMSTRUCT_IS(dram_reg_info, DRAM_TYPE)) {
-				switch (dram_type) {
+				switch (dram_layout) {
 				case AST_DRAM_1Gx16:
 					data = 0x00000d89;
 					break;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 4c29ae9fb511..c15aef014f69 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -98,13 +98,15 @@ enum ast_config_mode {
 	ast_use_defaults
 };
 
-#define AST_DRAM_512Mx16 0
-#define AST_DRAM_1Gx16   1
-#define AST_DRAM_512Mx32 2
-#define AST_DRAM_1Gx32   3
-#define AST_DRAM_2Gx16   6
-#define AST_DRAM_4Gx16   7
-#define AST_DRAM_8Gx16   8
+enum ast_dram_layout {
+	AST_DRAM_512Mx16 = 0,
+	AST_DRAM_1Gx16 = 1,
+	AST_DRAM_512Mx32 = 2,
+	AST_DRAM_1Gx32 = 3,
+	AST_DRAM_2Gx16 = 6,
+	AST_DRAM_4Gx16 = 7,
+	AST_DRAM_8Gx16 = 8,
+};
 
 /*
  * Hardware cursor
-- 
2.50.1

