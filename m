Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2767A500FD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DFF10E777;
	Wed,  5 Mar 2025 13:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NIzLtNHK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D6MrYk4I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NIzLtNHK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D6MrYk4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BBB10E777
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:47:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A1EF211A0;
 Wed,  5 Mar 2025 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+SSmUwv5+g0A7FJWJ5RcZviM8evW+E0urb5s/wb2uI=;
 b=NIzLtNHKZiysQAdTvEapyjra1p9+5bJpje+I9y2BYeZMAEqFAfu6RaB5Wm2Fl2rDsvpLjr
 LOdcfrYnEplRshfM/Sk3TZVYTKEYTGRfsLVKlLjX0sYseNXzM/VgAinb3SCR4mR4Zs11kb
 UPk3LGl5HoJose64RVQuHJH0qJhTWpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+SSmUwv5+g0A7FJWJ5RcZviM8evW+E0urb5s/wb2uI=;
 b=D6MrYk4I4ny4woJD/xmNbOiOBxWyTLFa81U0j1N2n7xKXxyjfuzzQzbM4j0Y5hMa3OSuks
 bvjhkEJgLjSBXtAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NIzLtNHK;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=D6MrYk4I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+SSmUwv5+g0A7FJWJ5RcZviM8evW+E0urb5s/wb2uI=;
 b=NIzLtNHKZiysQAdTvEapyjra1p9+5bJpje+I9y2BYeZMAEqFAfu6RaB5Wm2Fl2rDsvpLjr
 LOdcfrYnEplRshfM/Sk3TZVYTKEYTGRfsLVKlLjX0sYseNXzM/VgAinb3SCR4mR4Zs11kb
 UPk3LGl5HoJose64RVQuHJH0qJhTWpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+SSmUwv5+g0A7FJWJ5RcZviM8evW+E0urb5s/wb2uI=;
 b=D6MrYk4I4ny4woJD/xmNbOiOBxWyTLFa81U0j1N2n7xKXxyjfuzzQzbM4j0Y5hMa3OSuks
 bvjhkEJgLjSBXtAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D943F1399F;
 Wed,  5 Mar 2025 13:46:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KPjdM9JVyGfYQwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 13:46:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/7] drm/ast: Replace AST_VIDMEM_SIZE_ with Linux SZ_ constants
Date: Wed,  5 Mar 2025 14:35:41 +0100
Message-ID: <20250305134401.60609-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305134401.60609-1-tzimmermann@suse.de>
References: <20250305134401.60609-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1A1EF211A0
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Ast's AST_VIDMEM_SIZE_ constants enumerate supported video-memory
sizes from 8 MiB to 128 MiB. Replace them with Linux' SZ_ constants
of the same value. When expanded, the literal values remain the same.

The size constant for 128 MiB is unused and the default size is not
necessary. Remove both of them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  8 --------
 drivers/gpu/drm/ast/ast_mm.c   |  9 ++++-----
 drivers/gpu/drm/ast/ast_post.c | 24 ++++++++++++------------
 3 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index d2c2605d2728..2c7861835cfb 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -340,14 +340,6 @@ static inline void ast_set_index_reg_mask(struct ast_device *ast, u32 base, u8 i
 	__ast_write8_i_masked(ast->ioregs, base, index, preserve_mask, val);
 }
 
-#define AST_VIDMEM_SIZE_8M    0x00800000
-#define AST_VIDMEM_SIZE_16M   0x01000000
-#define AST_VIDMEM_SIZE_32M   0x02000000
-#define AST_VIDMEM_SIZE_64M   0x04000000
-#define AST_VIDMEM_SIZE_128M  0x08000000
-
-#define AST_VIDMEM_DEFAULT_SIZE AST_VIDMEM_SIZE_8M
-
 struct ast_vbios_stdtable {
 	u8 misc;
 	u8 seq[4];
diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 6dfe6d9777d4..20d833632a01 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -38,20 +38,19 @@ static u32 ast_get_vram_size(struct ast_device *ast)
 	u8 jreg;
 	u32 vram_size;
 
-	vram_size = AST_VIDMEM_DEFAULT_SIZE;
 	jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xaa, 0xff);
 	switch (jreg & 3) {
 	case 0:
-		vram_size = AST_VIDMEM_SIZE_8M;
+		vram_size = SZ_8M;
 		break;
 	case 1:
-		vram_size = AST_VIDMEM_SIZE_16M;
+		vram_size = SZ_16M;
 		break;
 	case 2:
-		vram_size = AST_VIDMEM_SIZE_32M;
+		vram_size = SZ_32M;
 		break;
 	case 3:
-		vram_size = AST_VIDMEM_SIZE_64M;
+		vram_size = SZ_64M;
 		break;
 	}
 
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 91e85e457bdf..37568cf3822c 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -1075,16 +1075,16 @@ static void get_ddr3_info(struct ast_device *ast, struct ast2300_dram_param *par
 
 	switch (param->vram_size) {
 	default:
-	case AST_VIDMEM_SIZE_8M:
+	case SZ_8M:
 		param->dram_config |= 0x00;
 		break;
-	case AST_VIDMEM_SIZE_16M:
+	case SZ_16M:
 		param->dram_config |= 0x04;
 		break;
-	case AST_VIDMEM_SIZE_32M:
+	case SZ_32M:
 		param->dram_config |= 0x08;
 		break;
-	case AST_VIDMEM_SIZE_64M:
+	case SZ_64M:
 		param->dram_config |= 0x0c;
 		break;
 	}
@@ -1446,16 +1446,16 @@ static void get_ddr2_info(struct ast_device *ast, struct ast2300_dram_param *par
 
 	switch (param->vram_size) {
 	default:
-	case AST_VIDMEM_SIZE_8M:
+	case SZ_8M:
 		param->dram_config |= 0x00;
 		break;
-	case AST_VIDMEM_SIZE_16M:
+	case SZ_16M:
 		param->dram_config |= 0x04;
 		break;
-	case AST_VIDMEM_SIZE_32M:
+	case SZ_32M:
 		param->dram_config |= 0x08;
 		break;
-	case AST_VIDMEM_SIZE_64M:
+	case SZ_64M:
 		param->dram_config |= 0x0c;
 		break;
 	}
@@ -1635,19 +1635,19 @@ static void ast_post_chip_2300(struct ast_device *ast)
                 switch (temp & 0x0c) {
                 default:
 		case 0x00:
-			param.vram_size = AST_VIDMEM_SIZE_8M;
+			param.vram_size = SZ_8M;
 			break;
 
 		case 0x04:
-			param.vram_size = AST_VIDMEM_SIZE_16M;
+			param.vram_size = SZ_16M;
 			break;
 
 		case 0x08:
-			param.vram_size = AST_VIDMEM_SIZE_32M;
+			param.vram_size = SZ_32M;
 			break;
 
 		case 0x0c:
-			param.vram_size = AST_VIDMEM_SIZE_64M;
+			param.vram_size = SZ_64M;
 			break;
 		}
 
-- 
2.48.1

