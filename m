Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D139AFA67E
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 18:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C993C10E2C6;
	Sun,  6 Jul 2025 16:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="L5/NEjh/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bq3SmTZ8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L5/NEjh/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bq3SmTZ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D0D10E2C6
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 16:28:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C52B91F388;
 Sun,  6 Jul 2025 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751819299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpcV9LCjnwRAADvH7gAtsLPW37CscUessM0e2RK/eOk=;
 b=L5/NEjh/z6NOvvezloz1n9rLLoJ2/wDFkp9XXlHZPoo8URQgmFnXktACvamnsVsPgAmW6S
 B/UxPx+hmp5U6+hYbXYIURM5vczRRHibEIQODb+LphG3tdnw1xAfEB/FW+OVnsZZipUlqZ
 TfOkb+kCzrpc/8kCWlF0PzN+Eq03v7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751819299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpcV9LCjnwRAADvH7gAtsLPW37CscUessM0e2RK/eOk=;
 b=Bq3SmTZ8AwaCmyOmnT0DBGyYQc+p/VtAww8/qTUUT88WF38dSNUhDPO9bdl1URbMVJXNiF
 mMjQ7rkpGksoa1CA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="L5/NEjh/";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Bq3SmTZ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751819299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpcV9LCjnwRAADvH7gAtsLPW37CscUessM0e2RK/eOk=;
 b=L5/NEjh/z6NOvvezloz1n9rLLoJ2/wDFkp9XXlHZPoo8URQgmFnXktACvamnsVsPgAmW6S
 B/UxPx+hmp5U6+hYbXYIURM5vczRRHibEIQODb+LphG3tdnw1xAfEB/FW+OVnsZZipUlqZ
 TfOkb+kCzrpc/8kCWlF0PzN+Eq03v7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751819299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpcV9LCjnwRAADvH7gAtsLPW37CscUessM0e2RK/eOk=;
 b=Bq3SmTZ8AwaCmyOmnT0DBGyYQc+p/VtAww8/qTUUT88WF38dSNUhDPO9bdl1URbMVJXNiF
 mMjQ7rkpGksoa1CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9AE5713A7D;
 Sun,  6 Jul 2025 16:28:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UJZoJCOkamjJSgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Jul 2025 16:28:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/10] drm/ast: Declare helpers for POST in header
Date: Sun,  6 Jul 2025 18:26:36 +0200
Message-ID: <20250706162816.211552-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706162816.211552-1-tzimmermann@suse.de>
References: <20250706162816.211552-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: C52B91F388
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Provide POST helpers in header file before splitting up the AST
POST code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
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

