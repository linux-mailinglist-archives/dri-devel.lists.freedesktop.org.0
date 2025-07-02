Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1B6AF58D2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 15:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B096810E729;
	Wed,  2 Jul 2025 13:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LmlSvcdO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FsP8np2r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LmlSvcdO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FsP8np2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEC110E702
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 13:27:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D7241F458;
 Wed,  2 Jul 2025 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCLnTp2BAotv9II7xQvWmJ6EvtfAWFtVhMzh3SNYrMM=;
 b=LmlSvcdOEBiC/2lWTA8DcZOZV0LVLLkgN/RRV9cz8TS2tOwMAQwHQTvjqdVbmzaFA7MDc4
 /05sUKt2acl3MdjbkEcxgybe+/772F80w31JINsUGJS1wjXQY3++YBWY9tPxSCbC45TGma
 rQVeoYtkhwM/C0bBYSbJLNUlEe0ZRAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCLnTp2BAotv9II7xQvWmJ6EvtfAWFtVhMzh3SNYrMM=;
 b=FsP8np2rU+a7mHdqbmpf+QwE5vLW7t4l7J2zl8pfp22NBGt27PBuGSoNlnDSL6WrUQgSUE
 i4/psjahE/0X+UDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCLnTp2BAotv9II7xQvWmJ6EvtfAWFtVhMzh3SNYrMM=;
 b=LmlSvcdOEBiC/2lWTA8DcZOZV0LVLLkgN/RRV9cz8TS2tOwMAQwHQTvjqdVbmzaFA7MDc4
 /05sUKt2acl3MdjbkEcxgybe+/772F80w31JINsUGJS1wjXQY3++YBWY9tPxSCbC45TGma
 rQVeoYtkhwM/C0bBYSbJLNUlEe0ZRAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCLnTp2BAotv9II7xQvWmJ6EvtfAWFtVhMzh3SNYrMM=;
 b=FsP8np2rU+a7mHdqbmpf+QwE5vLW7t4l7J2zl8pfp22NBGt27PBuGSoNlnDSL6WrUQgSUE
 i4/psjahE/0X+UDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55C4E13A6E;
 Wed,  2 Jul 2025 13:27:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qBSAE8ozZWj0MAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Jul 2025 13:27:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/10] drm/ast: Move Gen7+ POST code to separate source file
Date: Wed,  2 Jul 2025 15:12:50 +0200
Message-ID: <20250702132431.249329-3-tzimmermann@suse.de>
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

Move POST code for Gen7+ to separate source file and hide it in
ast_2600_post(). There's not much going on here except for enabling
the DP transmitter chip.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/Makefile   |  1 +
 drivers/gpu/drm/ast/ast_2600.c | 46 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h  |  3 +++
 drivers/gpu/drm/ast/ast_post.c |  8 +++---
 4 files changed, 53 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_2600.c

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index 8d09ba5d5889..0f09e0fa741b 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -4,6 +4,7 @@
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
 ast-y := \
+	ast_2600.o \
 	ast_cursor.o \
 	ast_ddc.o \
 	ast_dp501.o \
diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
new file mode 100644
index 000000000000..556571efa0b2
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_2600.c
@@ -0,0 +1,46 @@
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
+#include "ast_drv.h"
+
+/*
+ * POST
+ */
+
+int ast_2600_post(struct ast_device *ast)
+{
+	int ret;
+
+	if (ast->tx_chip == AST_TX_ASTDP) {
+		ret = ast_dp_launch(ast);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 2ee402096cd9..570c2fe98b58 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -417,6 +417,9 @@ struct ast_crtc_state {
 
 int ast_mm_init(struct ast_device *ast);
 
+/* ast_2600.c */
+int ast_2600_post(struct ast_device *ast);
+
 /* ast post */
 int ast_post_gpu(struct ast_device *ast);
 u32 ast_mindwm(struct ast_device *ast, u32 r);
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 36542d266f9c..03a7367bdc71 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -348,11 +348,9 @@ int ast_post_gpu(struct ast_device *ast)
 	ast_set_def_ext_reg(ast);
 
 	if (AST_GEN(ast) >= 7) {
-		if (ast->tx_chip == AST_TX_ASTDP) {
-			ret = ast_dp_launch(ast);
-			if (ret)
-				return ret;
-		}
+		ret = ast_2600_post(ast);
+		if (ret)
+			return ret;
 	} else if (AST_GEN(ast) >= 6) {
 		if (ast->config_mode == ast_use_p2a) {
 			ast_post_chip_2500(ast);
-- 
2.50.0

