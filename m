Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7505AB59C38
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F89810E391;
	Tue, 16 Sep 2025 15:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CLsip3KL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LLeXXzXg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CLsip3KL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LLeXXzXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AFF10E391
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:36:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E28791F80F;
 Tue, 16 Sep 2025 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9ZPfy7d+zBBVQL6ZYE8eoBd1lZsZkG/d8hnrthpwLM=;
 b=CLsip3KLWlnnnPIqdGzpIu6w/dEptf/w8BHHfNihhr3LJtoMhpllVM7AGrPfdWCW5xw2Pn
 qCf2/SFd3gcjTtGG1J6NVd4mLaCfeMDQKDktqWCFr011gRYd/WMwNfj8P69IHAAIJPw28n
 klUWqVQ0sCJpNsQGCAdQ3t5RYTkmYiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036932;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9ZPfy7d+zBBVQL6ZYE8eoBd1lZsZkG/d8hnrthpwLM=;
 b=LLeXXzXg8pNHWjVtXH7QV63lUUbuKKgAKe6JyX/6tAD0C63196vjfs9bKQFHpb97oLY5+l
 k3GOXoczeafE2SBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9ZPfy7d+zBBVQL6ZYE8eoBd1lZsZkG/d8hnrthpwLM=;
 b=CLsip3KLWlnnnPIqdGzpIu6w/dEptf/w8BHHfNihhr3LJtoMhpllVM7AGrPfdWCW5xw2Pn
 qCf2/SFd3gcjTtGG1J6NVd4mLaCfeMDQKDktqWCFr011gRYd/WMwNfj8P69IHAAIJPw28n
 klUWqVQ0sCJpNsQGCAdQ3t5RYTkmYiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036932;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9ZPfy7d+zBBVQL6ZYE8eoBd1lZsZkG/d8hnrthpwLM=;
 b=LLeXXzXg8pNHWjVtXH7QV63lUUbuKKgAKe6JyX/6tAD0C63196vjfs9bKQFHpb97oLY5+l
 k3GOXoczeafE2SBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A07B6139CB;
 Tue, 16 Sep 2025 15:35:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WAoEJsSDyWjFPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Sep 2025 15:35:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/12] drm/ast: Remove generic device initialization
Date: Tue, 16 Sep 2025 17:26:22 +0200
Message-ID: <20250916153239.308027-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916153239.308027-1-tzimmermann@suse.de>
References: <20250916153239.308027-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

The code in ast_main.c has been split into several helpers in
other source files. Delete the source file. With the generic
device init gone, fail probing on unknown hardware generations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/Makefile   |   1 -
 drivers/gpu/drm/ast/ast_drv.c  |   5 +-
 drivers/gpu/drm/ast/ast_drv.h  |   8 --
 drivers/gpu/drm/ast/ast_main.c | 154 ---------------------------------
 4 files changed, 2 insertions(+), 166 deletions(-)
 delete mode 100644 drivers/gpu/drm/ast/ast_main.c

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index 0a60c9341a9f..cdbcba3b43ad 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -16,7 +16,6 @@ ast-y := \
 	ast_dp501.o \
 	ast_dp.o \
 	ast_drv.o \
-	ast_main.o \
 	ast_mm.o \
 	ast_mode.o \
 	ast_post.o \
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 5ac1d32cfe69..a89735c6a462 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -411,9 +411,8 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 					     regs, ioregs, need_post);
 		break;
 	default:
-		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
-					need_post);
-		break;
+		dev_err(&pdev->dev, "Gen%d not supported\n", chip_gen);
+		return -ENODEV;
 	}
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index a64eadc3b50f..35c476c85b9a 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -217,14 +217,6 @@ static inline struct ast_device *to_ast_device(struct drm_device *dev)
 	return container_of(dev, struct ast_device, base);
 }
 
-struct drm_device *ast_device_create(struct pci_dev *pdev,
-				     const struct drm_driver *drv,
-				     enum ast_chip chip,
-				     enum ast_config_mode config_mode,
-				     void __iomem *regs,
-				     void __iomem *ioregs,
-				     bool need_post);
-
 static inline unsigned long __ast_gen(struct ast_device *ast)
 {
 	return __AST_CHIP_GEN(ast->chip);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
deleted file mode 100644
index d1c54700686b..000000000000
--- a/drivers/gpu/drm/ast/ast_main.c
+++ /dev/null
@@ -1,154 +0,0 @@
-/*
- * Copyright 2012 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- */
-/*
- * Authors: Dave Airlie <airlied@redhat.com>
- */
-
-#include <linux/of.h>
-#include <linux/pci.h>
-
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_drv.h>
-#include <drm/drm_gem.h>
-#include <drm/drm_managed.h>
-
-#include "ast_drv.h"
-
-static void ast_detect_widescreen(struct ast_device *ast)
-{
-	ast->support_wsxga_p = false;
-	ast->support_fullhd = false;
-	ast->support_wuxga = false;
-
-	if (AST_GEN(ast) >= 7) {
-		ast->support_wsxga_p = true;
-		ast->support_fullhd = true;
-		if (__ast_2100_detect_wuxga(ast))
-			ast->support_wuxga = true;
-	} else if (AST_GEN(ast) >= 6) {
-		if (__ast_2100_detect_wsxga_p(ast))
-			ast->support_wsxga_p = true;
-		else if (ast->chip == AST2510)
-			ast->support_wsxga_p = true;
-		if (ast->support_wsxga_p)
-			ast->support_fullhd = true;
-		if (__ast_2100_detect_wuxga(ast))
-			ast->support_wuxga = true;
-	} else if (AST_GEN(ast) >= 5) {
-		if (__ast_2100_detect_wsxga_p(ast))
-			ast->support_wsxga_p = true;
-		else if (ast->chip == AST1400)
-			ast->support_wsxga_p = true;
-		if (ast->support_wsxga_p)
-			ast->support_fullhd = true;
-		if (__ast_2100_detect_wuxga(ast))
-			ast->support_wuxga = true;
-	} else if (AST_GEN(ast) >= 4) {
-		if (__ast_2100_detect_wsxga_p(ast))
-			ast->support_wsxga_p = true;
-		else if (ast->chip == AST1300)
-			ast->support_wsxga_p = true;
-		if (ast->support_wsxga_p)
-			ast->support_fullhd = true;
-		if (__ast_2100_detect_wuxga(ast))
-			ast->support_wuxga = true;
-	} else if (AST_GEN(ast) >= 3) {
-		if (__ast_2100_detect_wsxga_p(ast))
-			ast->support_wsxga_p = true;
-		if (ast->support_wsxga_p) {
-			if (ast->chip == AST2200)
-				ast->support_fullhd = true;
-		}
-		if (__ast_2100_detect_wuxga(ast))
-			ast->support_wuxga = true;
-	} else if (AST_GEN(ast) >= 2) {
-		if (__ast_2100_detect_wsxga_p(ast))
-			ast->support_wsxga_p = true;
-		if (ast->support_wsxga_p) {
-			if (ast->chip == AST2100)
-				ast->support_fullhd = true;
-		}
-		if (__ast_2100_detect_wuxga(ast))
-			ast->support_wuxga = true;
-	}
-}
-
-struct drm_device *ast_device_create(struct pci_dev *pdev,
-				     const struct drm_driver *drv,
-				     enum ast_chip chip,
-				     enum ast_config_mode config_mode,
-				     void __iomem *regs,
-				     void __iomem *ioregs,
-				     bool need_post)
-{
-	struct drm_device *dev;
-	struct ast_device *ast;
-	int ret;
-
-	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
-	if (IS_ERR(ast))
-		return ERR_CAST(ast);
-	dev = &ast->base;
-
-	ast_device_init(ast, chip, config_mode, regs, ioregs);
-
-	if (AST_GEN(ast) >= 4)
-		ast_2300_detect_tx_chip(ast);
-	else
-		ast_2000_detect_tx_chip(ast, need_post);
-
-	switch (ast->tx_chip) {
-	case AST_TX_ASTDP:
-		ret = ast_post_gpu(ast);
-		break;
-	default:
-		ret = 0;
-		if (need_post)
-			ret = ast_post_gpu(ast);
-		break;
-	}
-	if (ret)
-		return ERR_PTR(ret);
-
-	ret = ast_mm_init(ast);
-	if (ret)
-		return ERR_PTR(ret);
-
-	/* map reserved buffer */
-	ast->dp501_fw_buf = NULL;
-	if (ast->vram_size < pci_resource_len(pdev, 0)) {
-		ast->dp501_fw_buf = pci_iomap_range(pdev, 0, ast->vram_size, 0);
-		if (!ast->dp501_fw_buf)
-			drm_info(dev, "failed to map reserved buffer!\n");
-	}
-
-	ast_detect_widescreen(ast);
-
-	ret = ast_mode_config_init(ast);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return dev;
-}
-- 
2.51.0

