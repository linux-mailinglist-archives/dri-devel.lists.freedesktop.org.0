Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5D5A50504
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 17:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD9110E807;
	Wed,  5 Mar 2025 16:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uNMvEi1D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v0DxR7eM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uNMvEi1D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v0DxR7eM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6330E10E807
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 16:35:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 23EC9211CF;
 Wed,  5 Mar 2025 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741192506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh8ZCVvlP0V76lJ+oM1/bdey6uNrFq2svDTS79Lg2E8=;
 b=uNMvEi1DCCh6HQ5Fjqg7NrVtmeF3JUKptaWR1t16BL1kLl9VsApX0XvH30Q/62be/2zqZw
 D86Z7wa5WVXQz96PG4d+jaYaDAA5vYHXZGy/jjDdehyJBaPfsD6l38w3lHNSiXGmTC2xAm
 eGbe6GM5UGdZX2oasHYJqzk/KYtebrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741192506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh8ZCVvlP0V76lJ+oM1/bdey6uNrFq2svDTS79Lg2E8=;
 b=v0DxR7eMaO7VY6eynqw14kA8+GaEAbV9xkarPvjP4RNsC4vwaQWM8LA/Cdhj2SenCu1Ryx
 zwS5knQFOqelP/Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741192506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh8ZCVvlP0V76lJ+oM1/bdey6uNrFq2svDTS79Lg2E8=;
 b=uNMvEi1DCCh6HQ5Fjqg7NrVtmeF3JUKptaWR1t16BL1kLl9VsApX0XvH30Q/62be/2zqZw
 D86Z7wa5WVXQz96PG4d+jaYaDAA5vYHXZGy/jjDdehyJBaPfsD6l38w3lHNSiXGmTC2xAm
 eGbe6GM5UGdZX2oasHYJqzk/KYtebrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741192506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh8ZCVvlP0V76lJ+oM1/bdey6uNrFq2svDTS79Lg2E8=;
 b=v0DxR7eMaO7VY6eynqw14kA8+GaEAbV9xkarPvjP4RNsC4vwaQWM8LA/Cdhj2SenCu1Ryx
 zwS5knQFOqelP/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F23241399F;
 Wed,  5 Mar 2025 16:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sLKzOTl9yGfxfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 16:35:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/7] drm/ast: Add VGACR99 register constants
Date: Wed,  5 Mar 2025 17:30:42 +0100
Message-ID: <20250305163207.267650-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305163207.267650-1-tzimmermann@suse.de>
References: <20250305163207.267650-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
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

Add register constants for VGACR99 and use them when detecting the
size of the VGA memory. Aligns the code with the programming manual.
Also replace literal size values with Linux' SZ_ size constants.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mm.c  | 13 ++++++-------
 drivers/gpu/drm/ast/ast_reg.h |  1 +
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 8d8aac8c0814..3d03ef556d0a 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -35,9 +35,8 @@
 
 static u32 ast_get_vram_size(struct ast_device *ast)
 {
-	u8 jreg;
 	u32 vram_size;
-	u8 vgacraa;
+	u8 vgacr99, vgacraa;
 
 	vgacraa = ast_get_index_reg(ast, AST_IO_VGACRI, 0xaa);
 	switch (vgacraa & AST_IO_VGACRAA_VGAMEM_SIZE_MASK) {
@@ -55,16 +54,16 @@ static u32 ast_get_vram_size(struct ast_device *ast)
 		break;
 	}
 
-	jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0x99, 0xff);
-	switch (jreg & 0x03) {
+	vgacr99 = ast_get_index_reg(ast, AST_IO_VGACRI, 0x99);
+	switch (vgacr99 & AST_IO_VGACR99_VGAMEM_RSRV_MASK) {
 	case 1:
-		vram_size -= 0x100000;
+		vram_size -= SZ_1M;
 		break;
 	case 2:
-		vram_size -= 0x200000;
+		vram_size -= SZ_2M;
 		break;
 	case 3:
-		vram_size -= 0x400000;
+		vram_size -= SZ_4M;
 		break;
 	}
 
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 039b93bed19e..e15adaf3a80e 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -30,6 +30,7 @@
 
 #define AST_IO_VGACRI			(0x54)
 #define AST_IO_VGACR80_PASSWORD		(0xa8)
+#define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
 #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
 #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
 #define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)
-- 
2.48.1

