Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1A9AF58CD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 15:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5B510E70A;
	Wed,  2 Jul 2025 13:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ugoTBLP5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oyqJ0Cs5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ugoTBLP5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oyqJ0Cs5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C4610E700
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 13:27:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 614751F457;
 Wed,  2 Jul 2025 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGoboEPcOhVVvQJ4Ab9CuQ/a/OFLdtVKnHYzYGBDBOI=;
 b=ugoTBLP5ZyRcyDkOvBgPh3ZnwhllaW7SMpClFPBJ6Bj1YyeUFXl3pGc+sjeITNJdI0uMP/
 6/dJwm3nNEyVDSkyhI+A+YY/aLvcipXQ67l4iY6L1kiwtEUpuVV6m0l/HEaSL0FZCpCml1
 TkwISMxJExdDl7VB8LYBfbGSq0GdqoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGoboEPcOhVVvQJ4Ab9CuQ/a/OFLdtVKnHYzYGBDBOI=;
 b=oyqJ0Cs5DwM34OKaeHMtuOAmS1FapN0MGz5s2XkVTVeChDQ30PbUopaWmPDsTlT3i6l6WJ
 T7Ar369xYvGokMCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGoboEPcOhVVvQJ4Ab9CuQ/a/OFLdtVKnHYzYGBDBOI=;
 b=ugoTBLP5ZyRcyDkOvBgPh3ZnwhllaW7SMpClFPBJ6Bj1YyeUFXl3pGc+sjeITNJdI0uMP/
 6/dJwm3nNEyVDSkyhI+A+YY/aLvcipXQ67l4iY6L1kiwtEUpuVV6m0l/HEaSL0FZCpCml1
 TkwISMxJExdDl7VB8LYBfbGSq0GdqoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGoboEPcOhVVvQJ4Ab9CuQ/a/OFLdtVKnHYzYGBDBOI=;
 b=oyqJ0Cs5DwM34OKaeHMtuOAmS1FapN0MGz5s2XkVTVeChDQ30PbUopaWmPDsTlT3i6l6WJ
 T7Ar369xYvGokMCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A08A13A54;
 Wed,  2 Jul 2025 13:27:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UKgNCcozZWj0MAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Jul 2025 13:27:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/10] drm/ast: Declare helpers for POST in header
Date: Wed,  2 Jul 2025 15:12:49 +0200
Message-ID: <20250702132431.249329-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132431.249329-1-tzimmermann@suse.de>
References: <20250702132431.249329-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
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

Provide POST helpers in header file before splitting up the AST
POST code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_post.c | 10 +++++-----
 drivers/gpu/drm/ast/ast_post.h | 16 ++++++++++++++++
 2 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_post.h

diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 37568cf3822c..36542d266f9c 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -33,6 +33,7 @@
 
 #include "ast_dram_tables.h"
 #include "ast_drv.h"
+#include "ast_post.h"
 
 static void ast_post_chip_2300(struct ast_device *ast);
 static void ast_post_chip_2500(struct ast_device *ast);
@@ -75,7 +76,7 @@ static void ast_set_def_ext_reg(struct ast_device *ast)
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
 }
 
-static u32 __ast_mindwm(void __iomem *regs, u32 r)
+u32 __ast_mindwm(void __iomem *regs, u32 r)
 {
 	u32 data;
 
@@ -89,7 +90,7 @@ static u32 __ast_mindwm(void __iomem *regs, u32 r)
 	return __ast_read32(regs, 0x10000 + (r & 0x0000ffff));
 }
 
-static void __ast_moutdwm(void __iomem *regs, u32 r, u32 v)
+void __ast_moutdwm(void __iomem *regs, u32 r, u32 v)
 {
 	u32 data;
 
@@ -438,7 +439,7 @@ static const u32 pattern[8] = {
 	0x7C61D253
 };
 
-static bool mmc_test(struct ast_device *ast, u32 datagen, u8 test_ctl)
+bool mmc_test(struct ast_device *ast, u32 datagen, u8 test_ctl)
 {
 	u32 data, timeout;
 
@@ -478,8 +479,7 @@ static u32 mmc_test2(struct ast_device *ast, u32 datagen, u8 test_ctl)
 	return data;
 }
 
-
-static bool mmc_test_burst(struct ast_device *ast, u32 datagen)
+bool mmc_test_burst(struct ast_device *ast, u32 datagen)
 {
 	return mmc_test(ast, datagen, 0xc1);
 }
diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
new file mode 100644
index 000000000000..314fa0475c79
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_post.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef AST_POST_H
+#define AST_POST_H
+
+#include <linux/types.h>
+
+struct ast_device;
+
+u32 __ast_mindwm(void __iomem *regs, u32 r);
+void __ast_moutdwm(void __iomem *regs, u32 r, u32 v);
+
+bool mmc_test(struct ast_device *ast, u32 datagen, u8 test_ctl);
+bool mmc_test_burst(struct ast_device *ast, u32 datagen);
+
+#endif
-- 
2.50.0

