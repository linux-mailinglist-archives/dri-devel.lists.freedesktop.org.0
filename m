Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FBEAF58D0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 15:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5045A10E721;
	Wed,  2 Jul 2025 13:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aR73rmSx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xforr8DP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aR73rmSx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xforr8DP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D2110E709
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 13:27:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 21FDB21190;
 Wed,  2 Jul 2025 13:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMhRJbVpQtNNEzAlx8Md0/VGnd01yEsXCxQfL+zPhS8=;
 b=aR73rmSxByhrYmVq+hDhuszzmZzQcuuePYE9GPjVUSCxtIPdhvx0GiQenyys4SgvghAu8m
 V/ZLrDRFsordSEIIQU0V1whBbIdQIvKtoAuEA0rs+VOphtdXGuRKRVGrFCc1A5SCo/TRsk
 6xbstw0QTO7evAw6kb4O9Tkjfdo/K1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMhRJbVpQtNNEzAlx8Md0/VGnd01yEsXCxQfL+zPhS8=;
 b=xforr8DPDdTyXcap6CA4Sr4xh6yU/sOva58epzBLk5Zsn5i/MImqSdH8a+/8dcDuSrNHV9
 9UVdFAEXGe5ylLDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMhRJbVpQtNNEzAlx8Md0/VGnd01yEsXCxQfL+zPhS8=;
 b=aR73rmSxByhrYmVq+hDhuszzmZzQcuuePYE9GPjVUSCxtIPdhvx0GiQenyys4SgvghAu8m
 V/ZLrDRFsordSEIIQU0V1whBbIdQIvKtoAuEA0rs+VOphtdXGuRKRVGrFCc1A5SCo/TRsk
 6xbstw0QTO7evAw6kb4O9Tkjfdo/K1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMhRJbVpQtNNEzAlx8Md0/VGnd01yEsXCxQfL+zPhS8=;
 b=xforr8DPDdTyXcap6CA4Sr4xh6yU/sOva58epzBLk5Zsn5i/MImqSdH8a+/8dcDuSrNHV9
 9UVdFAEXGe5ylLDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE28D1369C;
 Wed,  2 Jul 2025 13:27:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UMbiOMozZWj0MAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Jul 2025 13:27:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/10] drm/ast: Move Gen2+ and Gen1 POST code to separate
 source files
Date: Wed,  2 Jul 2025 15:12:53 +0200
Message-ID: <20250702132431.249329-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132431.249329-1-tzimmermann@suse.de>
References: <20250702132431.249329-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Move POST code for Gen2+ and Gen1 to separate source files and
hide it in ast_2100_post() ans ast_2000_post(). With P2A
configuration, the POST logic for these chip generations has
been mingled in ast_init_dram_reg(). Hence, handle all generations
in a single change. The split simplifies both cases. Also move
the DRAM init tables for each Gen into the respective source
file. No changes to the overall logic.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/Makefile          |   2 +
 drivers/gpu/drm/ast/ast_2000.c        | 117 +++++++++
 drivers/gpu/drm/ast/ast_2100.c        | 346 ++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_dram_tables.h | 134 ----------
 drivers/gpu/drm/ast/ast_drv.h         |   6 +
 drivers/gpu/drm/ast/ast_post.c        | 243 +-----------------
 6 files changed, 478 insertions(+), 370 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_2000.c
 create mode 100644 drivers/gpu/drm/ast/ast_2100.c

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index ccb2ff3e8eac..2547613155da 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -4,6 +4,8 @@
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
 ast-y := \
+	ast_2000.o \
+	ast_2100.o \
 	ast_2300.o \
 	ast_2500.o \
 	ast_2600.o \
diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
new file mode 100644
index 000000000000..099c90e1402f
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2012 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+/*
+ * Authors: Dave Airlie <airlied@redhat.com>
+ */
+
+#include <linux/delay.h>
+
+#include "ast_dram_tables.h"
+#include "ast_drv.h"
+
+/*
+ * POST
+ */
+
+static const struct ast_dramstruct ast2000_dram_table_data[] = {
+	{ 0x0108, 0x00000000 },
+	{ 0x0120, 0x00004a21 },
+	{ 0xFF00, 0x00000043 },
+	{ 0x0000, 0xFFFFFFFF },
+	{ 0x0004, 0x00000089 },
+	{ 0x0008, 0x22331353 },
+	{ 0x000C, 0x0d07000b },
+	{ 0x0010, 0x11113333 },
+	{ 0x0020, 0x00110350 },
+	{ 0x0028, 0x1e0828f0 },
+	{ 0x0024, 0x00000001 },
+	{ 0x001C, 0x00000000 },
+	{ 0x0014, 0x00000003 },
+	{ 0xFF00, 0x00000043 },
+	{ 0x0018, 0x00000131 },
+	{ 0x0014, 0x00000001 },
+	{ 0xFF00, 0x00000043 },
+	{ 0x0018, 0x00000031 },
+	{ 0x0014, 0x00000001 },
+	{ 0xFF00, 0x00000043 },
+	{ 0x0028, 0x1e0828f1 },
+	{ 0x0024, 0x00000003 },
+	{ 0x002C, 0x1f0f28fb },
+	{ 0x0030, 0xFFFFFE01 },
+	{ 0xFFFF, 0xFFFFFFFF }
+};
+
+static void ast_post_chip_2000(struct ast_device *ast)
+{
+	u8 j;
+	u32 temp, i;
+	const struct ast_dramstruct *dram_reg_info;
+
+	j = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
+
+	if ((j & 0x80) == 0) { /* VGA only */
+		dram_reg_info = ast2000_dram_table_data;
+		ast_write32(ast, 0xf004, 0x1e6e0000);
+		ast_write32(ast, 0xf000, 0x1);
+		ast_write32(ast, 0x10100, 0xa8);
+
+		do {
+			;
+		} while (ast_read32(ast, 0x10100) != 0xa8);
+
+		while (dram_reg_info->index != 0xffff) {
+			if (dram_reg_info->index == 0xff00) {/* delay fn */
+				for (i = 0; i < 15; i++)
+					udelay(dram_reg_info->data);
+			} else {
+				ast_write32(ast, 0x10000 + dram_reg_info->index,
+					    dram_reg_info->data);
+			}
+			dram_reg_info++;
+		}
+
+		temp = ast_read32(ast, 0x10140);
+		ast_write32(ast, 0x10140, temp | 0x40);
+	}
+
+	/* wait ready */
+	do {
+		j = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
+	} while ((j & 0x40) == 0);
+}
+
+int ast_2000_post(struct ast_device *ast)
+{
+	if (ast->config_mode == ast_use_p2a) {
+		ast_post_chip_2000(ast);
+	} else {
+		if (ast->tx_chip == AST_TX_SIL164) {
+			/* Enable DVO */
+			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
new file mode 100644
index 000000000000..f41c778e02da
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -0,0 +1,346 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2012 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+/*
+ * Authors: Dave Airlie <airlied@redhat.com>
+ */
+
+#include <linux/delay.h>
+
+#include "ast_dram_tables.h"
+#include "ast_drv.h"
+
+/*
+ * POST
+ */
+
+static const struct ast_dramstruct ast1100_dram_table_data[] = {
+	{ 0x2000, 0x1688a8a8 },
+	{ 0x2020, 0x000041f0 },
+	{ 0xFF00, 0x00000043 },
+	{ 0x0000, 0xfc600309 },
+	{ 0x006C, 0x00909090 },
+	{ 0x0064, 0x00050000 },
+	{ 0x0004, 0x00000585 },
+	{ 0x0008, 0x0011030f },
+	{ 0x0010, 0x22201724 },
+	{ 0x0018, 0x1e29011a },
+	{ 0x0020, 0x00c82222 },
+	{ 0x0014, 0x01001523 },
+	{ 0x001C, 0x1024010d },
+	{ 0x0024, 0x00cb2522 },
+	{ 0x0038, 0xffffff82 },
+	{ 0x003C, 0x00000000 },
+	{ 0x0040, 0x00000000 },
+	{ 0x0044, 0x00000000 },
+	{ 0x0048, 0x00000000 },
+	{ 0x004C, 0x00000000 },
+	{ 0x0050, 0x00000000 },
+	{ 0x0054, 0x00000000 },
+	{ 0x0058, 0x00000000 },
+	{ 0x005C, 0x00000000 },
+	{ 0x0060, 0x032aa02a },
+	{ 0x0064, 0x002d3000 },
+	{ 0x0068, 0x00000000 },
+	{ 0x0070, 0x00000000 },
+	{ 0x0074, 0x00000000 },
+	{ 0x0078, 0x00000000 },
+	{ 0x007C, 0x00000000 },
+	{ 0x0034, 0x00000001 },
+	{ 0xFF00, 0x00000043 },
+	{ 0x002C, 0x00000732 },
+	{ 0x0030, 0x00000040 },
+	{ 0x0028, 0x00000005 },
+	{ 0x0028, 0x00000007 },
+	{ 0x0028, 0x00000003 },
+	{ 0x0028, 0x00000001 },
+	{ 0x000C, 0x00005a08 },
+	{ 0x002C, 0x00000632 },
+	{ 0x0028, 0x00000001 },
+	{ 0x0030, 0x000003c0 },
+	{ 0x0028, 0x00000003 },
+	{ 0x0030, 0x00000040 },
+	{ 0x0028, 0x00000003 },
+	{ 0x000C, 0x00005a21 },
+	{ 0x0034, 0x00007c03 },
+	{ 0x0120, 0x00004c41 },
+	{ 0xffff, 0xffffffff },
+};
+
+static const struct ast_dramstruct ast2100_dram_table_data[] = {
+	{ 0x2000, 0x1688a8a8 },
+	{ 0x2020, 0x00004120 },
+	{ 0xFF00, 0x00000043 },
+	{ 0x0000, 0xfc600309 },
+	{ 0x006C, 0x00909090 },
+	{ 0x0064, 0x00070000 },
+	{ 0x0004, 0x00000489 },
+	{ 0x0008, 0x0011030f },
+	{ 0x0010, 0x32302926 },
+	{ 0x0018, 0x274c0122 },
+	{ 0x0020, 0x00ce2222 },
+	{ 0x0014, 0x01001523 },
+	{ 0x001C, 0x1024010d },
+	{ 0x0024, 0x00cb2522 },
+	{ 0x0038, 0xffffff82 },
+	{ 0x003C, 0x00000000 },
+	{ 0x0040, 0x00000000 },
+	{ 0x0044, 0x00000000 },
+	{ 0x0048, 0x00000000 },
+	{ 0x004C, 0x00000000 },
+	{ 0x0050, 0x00000000 },
+	{ 0x0054, 0x00000000 },
+	{ 0x0058, 0x00000000 },
+	{ 0x005C, 0x00000000 },
+	{ 0x0060, 0x0f2aa02a },
+	{ 0x0064, 0x003f3005 },
+	{ 0x0068, 0x02020202 },
+	{ 0x0070, 0x00000000 },
+	{ 0x0074, 0x00000000 },
+	{ 0x0078, 0x00000000 },
+	{ 0x007C, 0x00000000 },
+	{ 0x0034, 0x00000001 },
+	{ 0xFF00, 0x00000043 },
+	{ 0x002C, 0x00000942 },
+	{ 0x0030, 0x00000040 },
+	{ 0x0028, 0x00000005 },
+	{ 0x0028, 0x00000007 },
+	{ 0x0028, 0x00000003 },
+	{ 0x0028, 0x00000001 },
+	{ 0x000C, 0x00005a08 },
+	{ 0x002C, 0x00000842 },
+	{ 0x0028, 0x00000001 },
+	{ 0x0030, 0x000003c0 },
+	{ 0x0028, 0x00000003 },
+	{ 0x0030, 0x00000040 },
+	{ 0x0028, 0x00000003 },
+	{ 0x000C, 0x00005a21 },
+	{ 0x0034, 0x00007c03 },
+	{ 0x0120, 0x00005061 },
+	{ 0xffff, 0xffffffff },
+};
+
+/*
+ * AST2100/2150 DLL CBR Setting
+ */
+#define CBR_SIZE_AST2150	     ((16 << 10) - 1)
+#define CBR_PASSNUM_AST2150          5
+#define CBR_THRESHOLD_AST2150        10
+#define CBR_THRESHOLD2_AST2150       10
+#define TIMEOUT_AST2150              5000000
+
+#define CBR_PATNUM_AST2150           8
+
+static const u32 pattern_AST2150[14] = {
+	0xFF00FF00,
+	0xCC33CC33,
+	0xAA55AA55,
+	0xFFFE0001,
+	0x683501FE,
+	0x0F1929B0,
+	0x2D0B4346,
+	0x60767F02,
+	0x6FBE36A6,
+	0x3A253035,
+	0x3019686D,
+	0x41C6167E,
+	0x620152BF,
+	0x20F050E0
+};
+
+static u32 mmctestburst2_ast2150(struct ast_device *ast, u32 datagen)
+{
+	u32 data, timeout;
+
+	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
+	ast_moutdwm(ast, 0x1e6e0070, 0x00000001 | (datagen << 3));
+	timeout = 0;
+	do {
+		data = ast_mindwm(ast, 0x1e6e0070) & 0x40;
+		if (++timeout > TIMEOUT_AST2150) {
+			ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
+			return 0xffffffff;
+		}
+	} while (!data);
+	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
+	ast_moutdwm(ast, 0x1e6e0070, 0x00000003 | (datagen << 3));
+	timeout = 0;
+	do {
+		data = ast_mindwm(ast, 0x1e6e0070) & 0x40;
+		if (++timeout > TIMEOUT_AST2150) {
+			ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
+			return 0xffffffff;
+		}
+	} while (!data);
+	data = (ast_mindwm(ast, 0x1e6e0070) & 0x80) >> 7;
+	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
+	return data;
+}
+
+static int cbrtest_ast2150(struct ast_device *ast)
+{
+	int i;
+
+	for (i = 0; i < 8; i++)
+		if (mmctestburst2_ast2150(ast, i))
+			return 0;
+	return 1;
+}
+
+static int cbrscan_ast2150(struct ast_device *ast, int busw)
+{
+	u32 patcnt, loop;
+
+	for (patcnt = 0; patcnt < CBR_PATNUM_AST2150; patcnt++) {
+		ast_moutdwm(ast, 0x1e6e007c, pattern_AST2150[patcnt]);
+		for (loop = 0; loop < CBR_PASSNUM_AST2150; loop++) {
+			if (cbrtest_ast2150(ast))
+				break;
+		}
+		if (loop == CBR_PASSNUM_AST2150)
+			return 0;
+	}
+	return 1;
+}
+
+static void cbrdlli_ast2150(struct ast_device *ast, int busw)
+{
+	u32 dll_min[4], dll_max[4], dlli, data, passcnt;
+
+cbr_start:
+	dll_min[0] = 0xff;
+	dll_min[1] = 0xff;
+	dll_min[2] = 0xff;
+	dll_min[3] = 0xff;
+	dll_max[0] = 0x00;
+	dll_max[1] = 0x00;
+	dll_max[2] = 0x00;
+	dll_max[3] = 0x00;
+	passcnt = 0;
+
+	for (dlli = 0; dlli < 100; dlli++) {
+		ast_moutdwm(ast, 0x1e6e0068, dlli | (dlli << 8) | (dlli << 16) | (dlli << 24));
+		data = cbrscan_ast2150(ast, busw);
+		if (data != 0) {
+			if (data & 0x1) {
+				if (dll_min[0] > dlli)
+					dll_min[0] = dlli;
+				if (dll_max[0] < dlli)
+					dll_max[0] = dlli;
+			}
+			passcnt++;
+		} else if (passcnt >= CBR_THRESHOLD_AST2150) {
+			goto cbr_start;
+		}
+	}
+	if (dll_max[0] == 0 || (dll_max[0] - dll_min[0]) < CBR_THRESHOLD_AST2150)
+		goto cbr_start;
+
+	dlli = dll_min[0] + (((dll_max[0] - dll_min[0]) * 7) >> 4);
+	ast_moutdwm(ast, 0x1e6e0068, dlli | (dlli << 8) | (dlli << 16) | (dlli << 24));
+}
+
+static void ast_post_chip_2100(struct ast_device *ast)
+{
+	u8 j;
+	u32 data, temp, i;
+	const struct ast_dramstruct *dram_reg_info;
+
+	j = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
+
+	if ((j & 0x80) == 0) { /* VGA only */
+		if (ast->chip == AST2100 || ast->chip == AST2200)
+			dram_reg_info = ast2100_dram_table_data;
+		else
+			dram_reg_info = ast1100_dram_table_data;
+
+		ast_write32(ast, 0xf004, 0x1e6e0000);
+		ast_write32(ast, 0xf000, 0x1);
+		ast_write32(ast, 0x12000, 0x1688A8A8);
+		do {
+			;
+		} while (ast_read32(ast, 0x12000) != 0x01);
+
+		ast_write32(ast, 0x10000, 0xfc600309);
+		do {
+			;
+		} while (ast_read32(ast, 0x10000) != 0x01);
+
+		while (dram_reg_info->index != 0xffff) {
+			if (dram_reg_info->index == 0xff00) {/* delay fn */
+				for (i = 0; i < 15; i++)
+					udelay(dram_reg_info->data);
+			} else if (dram_reg_info->index == 0x4) {
+				data = dram_reg_info->data;
+				if (ast->dram_type == AST_DRAM_1Gx16)
+					data = 0x00000d89;
+				else if (ast->dram_type == AST_DRAM_1Gx32)
+					data = 0x00000c8d;
+
+				temp = ast_read32(ast, 0x12070);
+				temp &= 0xc;
+				temp <<= 2;
+				ast_write32(ast, 0x10000 + dram_reg_info->index, data | temp);
+			} else {
+				ast_write32(ast, 0x10000 + dram_reg_info->index,
+					    dram_reg_info->data);
+			}
+			dram_reg_info++;
+		}
+
+		/* AST 2100/2150 DRAM calibration */
+		data = ast_read32(ast, 0x10120);
+		if (data == 0x5061) { /* 266Mhz */
+			data = ast_read32(ast, 0x10004);
+			if (data & 0x40)
+				cbrdlli_ast2150(ast, 16); /* 16 bits */
+			else
+				cbrdlli_ast2150(ast, 32); /* 32 bits */
+		}
+
+		temp = ast_read32(ast, 0x1200c);
+		ast_write32(ast, 0x1200c, temp & 0xfffffffd);
+		temp = ast_read32(ast, 0x12040);
+		ast_write32(ast, 0x12040, temp | 0x40);
+	}
+
+	/* wait ready */
+	do {
+		j = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
+	} while ((j & 0x40) == 0);
+}
+
+int ast_2100_post(struct ast_device *ast)
+{
+	if (ast->config_mode == ast_use_p2a) {
+		ast_post_chip_2100(ast);
+	} else {
+		if (ast->tx_chip == AST_TX_SIL164) {
+			/* Enable DVO */
+			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/ast/ast_dram_tables.h b/drivers/gpu/drm/ast/ast_dram_tables.h
index 45bd1afab0d5..6c191e2c4e6c 100644
--- a/drivers/gpu/drm/ast/ast_dram_tables.h
+++ b/drivers/gpu/drm/ast/ast_dram_tables.h
@@ -8,138 +8,4 @@ struct ast_dramstruct {
 	u32 data;
 };
 
-static const struct ast_dramstruct ast2000_dram_table_data[] = {
-	{ 0x0108, 0x00000000 },
-	{ 0x0120, 0x00004a21 },
-	{ 0xFF00, 0x00000043 },
-	{ 0x0000, 0xFFFFFFFF },
-	{ 0x0004, 0x00000089 },
-	{ 0x0008, 0x22331353 },
-	{ 0x000C, 0x0d07000b },
-	{ 0x0010, 0x11113333 },
-	{ 0x0020, 0x00110350 },
-	{ 0x0028, 0x1e0828f0 },
-	{ 0x0024, 0x00000001 },
-	{ 0x001C, 0x00000000 },
-	{ 0x0014, 0x00000003 },
-	{ 0xFF00, 0x00000043 },
-	{ 0x0018, 0x00000131 },
-	{ 0x0014, 0x00000001 },
-	{ 0xFF00, 0x00000043 },
-	{ 0x0018, 0x00000031 },
-	{ 0x0014, 0x00000001 },
-	{ 0xFF00, 0x00000043 },
-	{ 0x0028, 0x1e0828f1 },
-	{ 0x0024, 0x00000003 },
-	{ 0x002C, 0x1f0f28fb },
-	{ 0x0030, 0xFFFFFE01 },
-	{ 0xFFFF, 0xFFFFFFFF }
-};
-
-static const struct ast_dramstruct ast1100_dram_table_data[] = {
-	{ 0x2000, 0x1688a8a8 },
-	{ 0x2020, 0x000041f0 },
-	{ 0xFF00, 0x00000043 },
-	{ 0x0000, 0xfc600309 },
-	{ 0x006C, 0x00909090 },
-	{ 0x0064, 0x00050000 },
-	{ 0x0004, 0x00000585 },
-	{ 0x0008, 0x0011030f },
-	{ 0x0010, 0x22201724 },
-	{ 0x0018, 0x1e29011a },
-	{ 0x0020, 0x00c82222 },
-	{ 0x0014, 0x01001523 },
-	{ 0x001C, 0x1024010d },
-	{ 0x0024, 0x00cb2522 },
-	{ 0x0038, 0xffffff82 },
-	{ 0x003C, 0x00000000 },
-	{ 0x0040, 0x00000000 },
-	{ 0x0044, 0x00000000 },
-	{ 0x0048, 0x00000000 },
-	{ 0x004C, 0x00000000 },
-	{ 0x0050, 0x00000000 },
-	{ 0x0054, 0x00000000 },
-	{ 0x0058, 0x00000000 },
-	{ 0x005C, 0x00000000 },
-	{ 0x0060, 0x032aa02a },
-	{ 0x0064, 0x002d3000 },
-	{ 0x0068, 0x00000000 },
-	{ 0x0070, 0x00000000 },
-	{ 0x0074, 0x00000000 },
-	{ 0x0078, 0x00000000 },
-	{ 0x007C, 0x00000000 },
-	{ 0x0034, 0x00000001 },
-	{ 0xFF00, 0x00000043 },
-	{ 0x002C, 0x00000732 },
-	{ 0x0030, 0x00000040 },
-	{ 0x0028, 0x00000005 },
-	{ 0x0028, 0x00000007 },
-	{ 0x0028, 0x00000003 },
-	{ 0x0028, 0x00000001 },
-	{ 0x000C, 0x00005a08 },
-	{ 0x002C, 0x00000632 },
-	{ 0x0028, 0x00000001 },
-	{ 0x0030, 0x000003c0 },
-	{ 0x0028, 0x00000003 },
-	{ 0x0030, 0x00000040 },
-	{ 0x0028, 0x00000003 },
-	{ 0x000C, 0x00005a21 },
-	{ 0x0034, 0x00007c03 },
-	{ 0x0120, 0x00004c41 },
-	{ 0xffff, 0xffffffff },
-};
-
-static const struct ast_dramstruct ast2100_dram_table_data[] = {
-	{ 0x2000, 0x1688a8a8 },
-	{ 0x2020, 0x00004120 },
-	{ 0xFF00, 0x00000043 },
-	{ 0x0000, 0xfc600309 },
-	{ 0x006C, 0x00909090 },
-	{ 0x0064, 0x00070000 },
-	{ 0x0004, 0x00000489 },
-	{ 0x0008, 0x0011030f },
-	{ 0x0010, 0x32302926 },
-	{ 0x0018, 0x274c0122 },
-	{ 0x0020, 0x00ce2222 },
-	{ 0x0014, 0x01001523 },
-	{ 0x001C, 0x1024010d },
-	{ 0x0024, 0x00cb2522 },
-	{ 0x0038, 0xffffff82 },
-	{ 0x003C, 0x00000000 },
-	{ 0x0040, 0x00000000 },
-	{ 0x0044, 0x00000000 },
-	{ 0x0048, 0x00000000 },
-	{ 0x004C, 0x00000000 },
-	{ 0x0050, 0x00000000 },
-	{ 0x0054, 0x00000000 },
-	{ 0x0058, 0x00000000 },
-	{ 0x005C, 0x00000000 },
-	{ 0x0060, 0x0f2aa02a },
-	{ 0x0064, 0x003f3005 },
-	{ 0x0068, 0x02020202 },
-	{ 0x0070, 0x00000000 },
-	{ 0x0074, 0x00000000 },
-	{ 0x0078, 0x00000000 },
-	{ 0x007C, 0x00000000 },
-	{ 0x0034, 0x00000001 },
-	{ 0xFF00, 0x00000043 },
-	{ 0x002C, 0x00000942 },
-	{ 0x0030, 0x00000040 },
-	{ 0x0028, 0x00000005 },
-	{ 0x0028, 0x00000007 },
-	{ 0x0028, 0x00000003 },
-	{ 0x0028, 0x00000001 },
-	{ 0x000C, 0x00005a08 },
-	{ 0x002C, 0x00000842 },
-	{ 0x0028, 0x00000001 },
-	{ 0x0030, 0x000003c0 },
-	{ 0x0028, 0x00000003 },
-	{ 0x0030, 0x00000040 },
-	{ 0x0028, 0x00000003 },
-	{ 0x000C, 0x00005a21 },
-	{ 0x0034, 0x00007c03 },
-	{ 0x0120, 0x00005061 },
-	{ 0xffff, 0xffffffff },
-};
-
 #endif
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 653e93b05859..e37a55295ed7 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -417,6 +417,12 @@ struct ast_crtc_state {
 
 int ast_mm_init(struct ast_device *ast);
 
+/* ast_2000.c */
+int ast_2000_post(struct ast_device *ast);
+
+/* ast_2100.c */
+int ast_2100_post(struct ast_device *ast);
+
 /* ast_2300.c */
 int ast_2300_post(struct ast_device *ast);
 
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index a08264210d77..8e575e713f19 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -31,7 +31,6 @@
 
 #include <drm/drm_print.h>
 
-#include "ast_dram_tables.h"
 #include "ast_drv.h"
 #include "ast_post.h"
 
@@ -111,233 +110,6 @@ void ast_moutdwm(struct ast_device *ast, u32 r, u32 v)
 	__ast_moutdwm(ast->regs, r, v);
 }
 
-/*
- * AST2100/2150 DLL CBR Setting
- */
-#define CBR_SIZE_AST2150	     ((16 << 10) - 1)
-#define CBR_PASSNUM_AST2150          5
-#define CBR_THRESHOLD_AST2150        10
-#define CBR_THRESHOLD2_AST2150       10
-#define TIMEOUT_AST2150              5000000
-
-#define CBR_PATNUM_AST2150           8
-
-static const u32 pattern_AST2150[14] = {
-	0xFF00FF00,
-	0xCC33CC33,
-	0xAA55AA55,
-	0xFFFE0001,
-	0x683501FE,
-	0x0F1929B0,
-	0x2D0B4346,
-	0x60767F02,
-	0x6FBE36A6,
-	0x3A253035,
-	0x3019686D,
-	0x41C6167E,
-	0x620152BF,
-	0x20F050E0
-};
-
-static u32 mmctestburst2_ast2150(struct ast_device *ast, u32 datagen)
-{
-	u32 data, timeout;
-
-	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-	ast_moutdwm(ast, 0x1e6e0070, 0x00000001 | (datagen << 3));
-	timeout = 0;
-	do {
-		data = ast_mindwm(ast, 0x1e6e0070) & 0x40;
-		if (++timeout > TIMEOUT_AST2150) {
-			ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-			return 0xffffffff;
-		}
-	} while (!data);
-	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-	ast_moutdwm(ast, 0x1e6e0070, 0x00000003 | (datagen << 3));
-	timeout = 0;
-	do {
-		data = ast_mindwm(ast, 0x1e6e0070) & 0x40;
-		if (++timeout > TIMEOUT_AST2150) {
-			ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-			return 0xffffffff;
-		}
-	} while (!data);
-	data = (ast_mindwm(ast, 0x1e6e0070) & 0x80) >> 7;
-	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-	return data;
-}
-
-#if 0 /* unused in DDX driver - here for completeness */
-static u32 mmctestsingle2_ast2150(struct ast_device *ast, u32 datagen)
-{
-	u32 data, timeout;
-
-	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-	ast_moutdwm(ast, 0x1e6e0070, 0x00000005 | (datagen << 3));
-	timeout = 0;
-	do {
-		data = ast_mindwm(ast, 0x1e6e0070) & 0x40;
-		if (++timeout > TIMEOUT_AST2150) {
-			ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-			return 0xffffffff;
-		}
-	} while (!data);
-	data = (ast_mindwm(ast, 0x1e6e0070) & 0x80) >> 7;
-	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-	return data;
-}
-#endif
-
-static int cbrtest_ast2150(struct ast_device *ast)
-{
-	int i;
-
-	for (i = 0; i < 8; i++)
-		if (mmctestburst2_ast2150(ast, i))
-			return 0;
-	return 1;
-}
-
-static int cbrscan_ast2150(struct ast_device *ast, int busw)
-{
-	u32 patcnt, loop;
-
-	for (patcnt = 0; patcnt < CBR_PATNUM_AST2150; patcnt++) {
-		ast_moutdwm(ast, 0x1e6e007c, pattern_AST2150[patcnt]);
-		for (loop = 0; loop < CBR_PASSNUM_AST2150; loop++) {
-			if (cbrtest_ast2150(ast))
-				break;
-		}
-		if (loop == CBR_PASSNUM_AST2150)
-			return 0;
-	}
-	return 1;
-}
-
-
-static void cbrdlli_ast2150(struct ast_device *ast, int busw)
-{
-	u32 dll_min[4], dll_max[4], dlli, data, passcnt;
-
-cbr_start:
-	dll_min[0] = dll_min[1] = dll_min[2] = dll_min[3] = 0xff;
-	dll_max[0] = dll_max[1] = dll_max[2] = dll_max[3] = 0x0;
-	passcnt = 0;
-
-	for (dlli = 0; dlli < 100; dlli++) {
-		ast_moutdwm(ast, 0x1e6e0068, dlli | (dlli << 8) | (dlli << 16) | (dlli << 24));
-		data = cbrscan_ast2150(ast, busw);
-		if (data != 0) {
-			if (data & 0x1) {
-				if (dll_min[0] > dlli)
-					dll_min[0] = dlli;
-				if (dll_max[0] < dlli)
-					dll_max[0] = dlli;
-			}
-			passcnt++;
-		} else if (passcnt >= CBR_THRESHOLD_AST2150)
-			goto cbr_start;
-	}
-	if (dll_max[0] == 0 || (dll_max[0]-dll_min[0]) < CBR_THRESHOLD_AST2150)
-		goto cbr_start;
-
-	dlli = dll_min[0] + (((dll_max[0] - dll_min[0]) * 7) >> 4);
-	ast_moutdwm(ast, 0x1e6e0068, dlli | (dlli << 8) | (dlli << 16) | (dlli << 24));
-}
-
-
-
-static void ast_init_dram_reg(struct ast_device *ast)
-{
-	u8 j;
-	u32 data, temp, i;
-	const struct ast_dramstruct *dram_reg_info;
-
-	j = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
-
-	if ((j & 0x80) == 0) { /* VGA only */
-		if (IS_AST_GEN1(ast)) {
-			dram_reg_info = ast2000_dram_table_data;
-			ast_write32(ast, 0xf004, 0x1e6e0000);
-			ast_write32(ast, 0xf000, 0x1);
-			ast_write32(ast, 0x10100, 0xa8);
-
-			do {
-				;
-			} while (ast_read32(ast, 0x10100) != 0xa8);
-		} else { /* GEN2/GEN3 */
-			if (ast->chip == AST2100 || ast->chip == AST2200)
-				dram_reg_info = ast2100_dram_table_data;
-			else
-				dram_reg_info = ast1100_dram_table_data;
-
-			ast_write32(ast, 0xf004, 0x1e6e0000);
-			ast_write32(ast, 0xf000, 0x1);
-			ast_write32(ast, 0x12000, 0x1688A8A8);
-			do {
-				;
-			} while (ast_read32(ast, 0x12000) != 0x01);
-
-			ast_write32(ast, 0x10000, 0xfc600309);
-			do {
-				;
-			} while (ast_read32(ast, 0x10000) != 0x01);
-		}
-
-		while (dram_reg_info->index != 0xffff) {
-			if (dram_reg_info->index == 0xff00) {/* delay fn */
-				for (i = 0; i < 15; i++)
-					udelay(dram_reg_info->data);
-			} else if (dram_reg_info->index == 0x4 && !IS_AST_GEN1(ast)) {
-				data = dram_reg_info->data;
-				if (ast->dram_type == AST_DRAM_1Gx16)
-					data = 0x00000d89;
-				else if (ast->dram_type == AST_DRAM_1Gx32)
-					data = 0x00000c8d;
-
-				temp = ast_read32(ast, 0x12070);
-				temp &= 0xc;
-				temp <<= 2;
-				ast_write32(ast, 0x10000 + dram_reg_info->index, data | temp);
-			} else
-				ast_write32(ast, 0x10000 + dram_reg_info->index, dram_reg_info->data);
-			dram_reg_info++;
-		}
-
-		/* AST 2100/2150 DRAM calibration */
-		data = ast_read32(ast, 0x10120);
-		if (data == 0x5061) { /* 266Mhz */
-			data = ast_read32(ast, 0x10004);
-			if (data & 0x40)
-				cbrdlli_ast2150(ast, 16); /* 16 bits */
-			else
-				cbrdlli_ast2150(ast, 32); /* 32 bits */
-		}
-
-		switch (AST_GEN(ast)) {
-		case 1:
-			temp = ast_read32(ast, 0x10140);
-			ast_write32(ast, 0x10140, temp | 0x40);
-			break;
-		case 2:
-		case 3:
-			temp = ast_read32(ast, 0x1200c);
-			ast_write32(ast, 0x1200c, temp & 0xfffffffd);
-			temp = ast_read32(ast, 0x12040);
-			ast_write32(ast, 0x12040, temp | 0x40);
-			break;
-		default:
-			break;
-		}
-	}
-
-	/* wait ready */
-	do {
-		j = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
-	} while ((j & 0x40) == 0);
-}
-
 int ast_post_gpu(struct ast_device *ast)
 {
 	int ret;
@@ -356,15 +128,14 @@ int ast_post_gpu(struct ast_device *ast)
 		ret = ast_2300_post(ast);
 		if (ret)
 			return ret;
+	} else  if (AST_GEN(ast) >= 2) {
+		ret = ast_2100_post(ast);
+		if (ret)
+			return ret;
 	} else  {
-		if (ast->config_mode == ast_use_p2a) {
-			ast_init_dram_reg(ast);
-		} else {
-			if (ast->tx_chip == AST_TX_SIL164) {
-				/* Enable DVO */
-				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);
-			}
-		}
+		ret = ast_2000_post(ast);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
-- 
2.50.0

