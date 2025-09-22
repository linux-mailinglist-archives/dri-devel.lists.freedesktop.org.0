Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A314B8F952
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A0B10E3DD;
	Mon, 22 Sep 2025 08:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FoN0HDsp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rp4ufk3A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FoN0HDsp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rp4ufk3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA8F10E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:40:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A7D281F8C4;
 Mon, 22 Sep 2025 08:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758530399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLXLRUNTAG/62tY1+b85euQs4Zfas032O5F2R7G2lUA=;
 b=FoN0HDspDkG8rSiKpMaveEpUi0PEoxtjGwzWYNpSQwat0Pp5w3PNPyvz4xPnenQxdUCOY1
 wvsaaYH2fU/JC2h2M1+qmWzUkulEHCpKJ1wGBLyUtKL68IT1vQCVmvd5xn14U499+hHhm6
 z485doscrDCbX54k2jZ2ysfACZrPSt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758530399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLXLRUNTAG/62tY1+b85euQs4Zfas032O5F2R7G2lUA=;
 b=rp4ufk3Ad3L1Rj5xiliKuaPD2bYd8cB7KOIkSmtk9Bhy4ARDrSR6xvsd+A/pt6dbDlHmHv
 3ciTyEm31GJYpEAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758530399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLXLRUNTAG/62tY1+b85euQs4Zfas032O5F2R7G2lUA=;
 b=FoN0HDspDkG8rSiKpMaveEpUi0PEoxtjGwzWYNpSQwat0Pp5w3PNPyvz4xPnenQxdUCOY1
 wvsaaYH2fU/JC2h2M1+qmWzUkulEHCpKJ1wGBLyUtKL68IT1vQCVmvd5xn14U499+hHhm6
 z485doscrDCbX54k2jZ2ysfACZrPSt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758530399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLXLRUNTAG/62tY1+b85euQs4Zfas032O5F2R7G2lUA=;
 b=rp4ufk3Ad3L1Rj5xiliKuaPD2bYd8cB7KOIkSmtk9Bhy4ARDrSR6xvsd+A/pt6dbDlHmHv
 3ciTyEm31GJYpEAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DF3413A63;
 Mon, 22 Sep 2025 08:39:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WHeoGV8L0WikFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 22 Sep 2025 08:39:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/12] drm/ast: Move display-clock tables to per-Gen source
 files
Date: Mon, 22 Sep 2025 10:36:01 +0200
Message-ID: <20250922083708.45564-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922083708.45564-1-tzimmermann@suse.de>
References: <20250922083708.45564-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[8]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Move display-clock tables to the appropriate per-Gen source files.
The tables are almost identical, except for mode entries 0x17 and
0x1a. Rename to tables to match common style.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_2000.c   | 34 ++++++++++++++++++
 drivers/gpu/drm/ast/ast_2500.c   | 34 ++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h    |  2 ++
 drivers/gpu/drm/ast/ast_mode.c   |  4 +--
 drivers/gpu/drm/ast/ast_tables.h | 60 --------------------------------
 5 files changed, 72 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
index 41c2aa1e425a..a31daf7c2ceb 100644
--- a/drivers/gpu/drm/ast/ast_2000.c
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -147,3 +147,37 @@ int ast_2000_post(struct ast_device *ast)
 
 	return 0;
 }
+
+/*
+ * Mode setting
+ */
+
+const struct ast_vbios_dclk_info ast_2000_dclk_table[] = {
+	{0x2c, 0xe7, 0x03},			/* 00: VCLK25_175	*/
+	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
+	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
+	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
+	{0xee, 0x67, 0x01},			/* 04: VCLK40		*/
+	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
+	{0xc6, 0x64, 0x01},			/* 06: VCLK50		*/
+	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
+	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
+	{0x7b, 0x63, 0x00},			/* 09: VCLK75		*/
+	{0x67, 0x62, 0x00},			/* 0a: VCLK78_75	*/
+	{0x7c, 0x62, 0x00},			/* 0b: VCLK94_5		*/
+	{0x8e, 0x62, 0x00},			/* 0c: VCLK108		*/
+	{0x85, 0x24, 0x00},			/* 0d: VCLK135		*/
+	{0x67, 0x22, 0x00},			/* 0e: VCLK157_5	*/
+	{0x6a, 0x22, 0x00},			/* 0f: VCLK162		*/
+	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
+	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
+	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
+	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
+	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
+	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
+	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
+	{0x77, 0x58, 0x80},			/* 17: VCLK119		*/
+	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
+	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
+	{0x3b, 0x2c, 0x81},			/* 1a: VCLK118_25	*/
+};
diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
index 1e541498ea67..b12fec161f2b 100644
--- a/drivers/gpu/drm/ast/ast_2500.c
+++ b/drivers/gpu/drm/ast/ast_2500.c
@@ -567,3 +567,37 @@ int ast_2500_post(struct ast_device *ast)
 
 	return 0;
 }
+
+/*
+ * Mode setting
+ */
+
+const struct ast_vbios_dclk_info ast_2500_dclk_table[] = {
+	{0x2c, 0xe7, 0x03},			/* 00: VCLK25_175	*/
+	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
+	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
+	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
+	{0xee, 0x67, 0x01},			/* 04: VCLK40		*/
+	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
+	{0xc6, 0x64, 0x01},			/* 06: VCLK50		*/
+	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
+	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
+	{0x7b, 0x63, 0x00},			/* 09: VCLK75		*/
+	{0x67, 0x62, 0x00},			/* 0a: VCLK78_75	*/
+	{0x7c, 0x62, 0x00},			/* 0b: VCLK94_5		*/
+	{0x8e, 0x62, 0x00},			/* 0c: VCLK108		*/
+	{0x85, 0x24, 0x00},			/* 0d: VCLK135		*/
+	{0x67, 0x22, 0x00},			/* 0e: VCLK157_5	*/
+	{0x6a, 0x22, 0x00},			/* 0f: VCLK162		*/
+	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
+	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
+	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
+	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
+	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
+	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
+	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
+	{0x58, 0x01, 0x42},			/* 17: VCLK119		*/
+	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
+	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
+	{0x44, 0x20, 0x43},			/* 1a: VCLK118_25	*/
+};
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index c15aef014f69..482d1eb79d64 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -417,6 +417,7 @@ int ast_mm_init(struct ast_device *ast);
 
 /* ast_2000.c */
 int ast_2000_post(struct ast_device *ast);
+extern const struct ast_vbios_dclk_info ast_2000_dclk_table[];
 
 /* ast_2100.c */
 int ast_2100_post(struct ast_device *ast);
@@ -427,6 +428,7 @@ int ast_2300_post(struct ast_device *ast);
 /* ast_2500.c */
 void ast_2500_patch_ahb(void __iomem *regs);
 int ast_2500_post(struct ast_device *ast);
+extern const struct ast_vbios_dclk_info ast_2500_dclk_table[];
 
 /* ast_2600.c */
 int ast_2600_post(struct ast_device *ast);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index b4e8edc7c767..6b9d510c509d 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -373,9 +373,9 @@ static void ast_set_dclk_reg(struct ast_device *ast,
 	const struct ast_vbios_dclk_info *clk_info;
 
 	if (IS_AST_GEN6(ast) || IS_AST_GEN7(ast))
-		clk_info = &dclk_table_ast2500[vmode->dclk_index];
+		clk_info = &ast_2500_dclk_table[vmode->dclk_index];
 	else
-		clk_info = &dclk_table[vmode->dclk_index];
+		clk_info = &ast_2000_dclk_table[vmode->dclk_index];
 
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc0, 0x00, clk_info->param1);
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc1, 0x00, clk_info->param2);
diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
index f1c9f7e1f1fc..7da5b5c60f41 100644
--- a/drivers/gpu/drm/ast/ast_tables.h
+++ b/drivers/gpu/drm/ast/ast_tables.h
@@ -33,66 +33,6 @@
 #define HiCModeIndex		3
 #define TrueCModeIndex		4
 
-static const struct ast_vbios_dclk_info dclk_table[] = {
-	{0x2C, 0xE7, 0x03},			/* 00: VCLK25_175	*/
-	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
-	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
-	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
-	{0xEE, 0x67, 0x01},			/* 04: VCLK40		*/
-	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
-	{0xC6, 0x64, 0x01},			/* 06: VCLK50		*/
-	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
-	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
-	{0x7B, 0x63, 0x00},			/* 09: VCLK75		*/
-	{0x67, 0x62, 0x00},			/* 0A: VCLK78_75	*/
-	{0x7C, 0x62, 0x00},			/* 0B: VCLK94_5		*/
-	{0x8E, 0x62, 0x00},			/* 0C: VCLK108		*/
-	{0x85, 0x24, 0x00},			/* 0D: VCLK135		*/
-	{0x67, 0x22, 0x00},			/* 0E: VCLK157_5	*/
-	{0x6A, 0x22, 0x00},			/* 0F: VCLK162		*/
-	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
-	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
-	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
-	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
-	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
-	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
-	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
-	{0x77, 0x58, 0x80},			/* 17: VCLK119		*/
-	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
-	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
-	{0x3b, 0x2c, 0x81},			/* 1A: VCLK118_25	*/
-};
-
-static const struct ast_vbios_dclk_info dclk_table_ast2500[] = {
-	{0x2C, 0xE7, 0x03},			/* 00: VCLK25_175	*/
-	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
-	{0x67, 0x63, 0x01},			/* 02: VCLK31_5		*/
-	{0x76, 0x63, 0x01},			/* 03: VCLK36		*/
-	{0xEE, 0x67, 0x01},			/* 04: VCLK40		*/
-	{0x82, 0x62, 0x01},			/* 05: VCLK49_5		*/
-	{0xC6, 0x64, 0x01},			/* 06: VCLK50		*/
-	{0x94, 0x62, 0x01},			/* 07: VCLK56_25	*/
-	{0x80, 0x64, 0x00},			/* 08: VCLK65		*/
-	{0x7B, 0x63, 0x00},			/* 09: VCLK75		*/
-	{0x67, 0x62, 0x00},			/* 0A: VCLK78_75	*/
-	{0x7C, 0x62, 0x00},			/* 0B: VCLK94_5		*/
-	{0x8E, 0x62, 0x00},			/* 0C: VCLK108		*/
-	{0x85, 0x24, 0x00},			/* 0D: VCLK135		*/
-	{0x67, 0x22, 0x00},			/* 0E: VCLK157_5	*/
-	{0x6A, 0x22, 0x00},			/* 0F: VCLK162		*/
-	{0x4d, 0x4c, 0x80},			/* 10: VCLK154		*/
-	{0x68, 0x6f, 0x80},			/* 11: VCLK83.5		*/
-	{0x28, 0x49, 0x80},			/* 12: VCLK106.5	*/
-	{0x37, 0x49, 0x80},			/* 13: VCLK146.25	*/
-	{0x1f, 0x45, 0x80},			/* 14: VCLK148.5	*/
-	{0x47, 0x6c, 0x80},			/* 15: VCLK71		*/
-	{0x25, 0x65, 0x80},			/* 16: VCLK88.75	*/
-	{0x58, 0x01, 0x42},			/* 17: VCLK119		*/
-	{0x32, 0x67, 0x80},			/* 18: VCLK85_5		*/
-	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
-	{0x44, 0x20, 0x43},			/* 1A: VCLK118_25	*/
-};
-
 static const struct ast_vbios_stdtable vbios_stdtable[] = {
 	/* MD_2_3_400 */
 	{
-- 
2.51.0

