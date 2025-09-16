Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1796DB59C33
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C914310E390;
	Tue, 16 Sep 2025 15:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GPp9bfdr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="42vknSvq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GPp9bfdr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="42vknSvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA22710E37C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:35:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 943B122831;
 Tue, 16 Sep 2025 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7fNlNxZuSLPgqCpIPL3soYSW/8KtYPcO2PLJ2DnOBg=;
 b=GPp9bfdrEHxcDy7NGL61PYlwpmPbbfT4+nBSYHFnfdPv8iF0UDeAoOqUX5GVJfNAbgCV4Q
 pCbZSY8xsQW2an9q4HdYJK37sK4ealHBAfutwzplELKiYJFQrABYzNFJQ6kQ+n87Sj94qt
 lU48R6Libc+URmtsuXQGFKiwIGT34T8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7fNlNxZuSLPgqCpIPL3soYSW/8KtYPcO2PLJ2DnOBg=;
 b=42vknSvqm3TlOkHb3PU5eQJEm5QTgh9zUVjSDn5mthbzTdrS24WPXkjCSnYdMCc6nVvLjk
 yRXTsiNwSK5PRlAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7fNlNxZuSLPgqCpIPL3soYSW/8KtYPcO2PLJ2DnOBg=;
 b=GPp9bfdrEHxcDy7NGL61PYlwpmPbbfT4+nBSYHFnfdPv8iF0UDeAoOqUX5GVJfNAbgCV4Q
 pCbZSY8xsQW2an9q4HdYJK37sK4ealHBAfutwzplELKiYJFQrABYzNFJQ6kQ+n87Sj94qt
 lU48R6Libc+URmtsuXQGFKiwIGT34T8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7fNlNxZuSLPgqCpIPL3soYSW/8KtYPcO2PLJ2DnOBg=;
 b=42vknSvqm3TlOkHb3PU5eQJEm5QTgh9zUVjSDn5mthbzTdrS24WPXkjCSnYdMCc6nVvLjk
 yRXTsiNwSK5PRlAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A3C813AA4;
 Tue, 16 Sep 2025 15:35:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2GqUFMODyWjFPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Sep 2025 15:35:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/12] drm/ast: Move Gen3 device initialization into separate
 helper
Date: Tue, 16 Sep 2025 17:26:17 +0200
Message-ID: <20250916153239.308027-8-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

Split off device initialization for Gen3 hardware into the helpers
ast_2200_device_create() and ast_2200_detect_wide_screen(). The new
functions are duplicates form their counterparts in ast_main.c, but
stripped from most non-Gen3 support.

Simplifies maintenance as the driver's number of supported hardware
generations grows.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/Makefile   |  1 +
 drivers/gpu/drm/ast/ast_2200.c | 86 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.c  |  4 ++
 drivers/gpu/drm/ast/ast_drv.h  |  9 ++++
 4 files changed, 100 insertions(+)
 create mode 100644 drivers/gpu/drm/ast/ast_2200.c

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index 2547613155da..a7a13b6d526e 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -6,6 +6,7 @@
 ast-y := \
 	ast_2000.o \
 	ast_2100.o \
+	ast_2200.o \
 	ast_2300.o \
 	ast_2500.o \
 	ast_2600.o \
diff --git a/drivers/gpu/drm/ast/ast_2200.c b/drivers/gpu/drm/ast/ast_2200.c
new file mode 100644
index 000000000000..1952e14bab8c
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_2200.c
@@ -0,0 +1,86 @@
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
+#include <linux/pci.h>
+
+#include <drm/drm_drv.h>
+
+#include "ast_drv.h"
+
+static void ast_2200_detect_widescreen(struct ast_device *ast)
+{
+	if (__ast_2100_detect_wsxga_p(ast))
+		ast->support_wsxga_p = true;
+	if (ast->support_wsxga_p) {
+		if (ast->chip == AST2200)
+			ast->support_fullhd = true;
+	}
+	if (__ast_2100_detect_wuxga(ast))
+		ast->support_wuxga = true;
+}
+
+struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
+					  const struct drm_driver *drv,
+					  enum ast_chip chip,
+					  enum ast_config_mode config_mode,
+					  void __iomem *regs,
+					  void __iomem *ioregs,
+					  bool need_post)
+{
+	struct drm_device *dev;
+	struct ast_device *ast;
+	int ret;
+
+	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
+	if (IS_ERR(ast))
+		return ERR_CAST(ast);
+	dev = &ast->base;
+
+	ast_device_init(ast, chip, config_mode, regs, ioregs);
+
+	ast_2000_detect_tx_chip(ast, need_post);
+
+	if (need_post) {
+		ret = ast_post_gpu(ast);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	ret = ast_mm_init(ast);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ast_2200_detect_widescreen(ast);
+
+	ret = ast_mode_config_init(ast);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return dev;
+}
+
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index bcf0b318b495..caf41c31cc9d 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -390,6 +390,10 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		drm = ast_2100_device_create(pdev, &ast_driver, chip, config_mode,
 					     regs, ioregs, need_post);
 		break;
+	case 3:
+		drm = ast_2200_device_create(pdev, &ast_driver, chip, config_mode,
+					     regs, ioregs, need_post);
+		break;
 	default:
 		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
 					need_post);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 8f52ac3b0f45..8a27835fd09c 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -447,6 +447,15 @@ struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
 					  void __iomem *ioregs,
 					  bool need_post);
 
+/* ast_2200.c */
+struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
+					  const struct drm_driver *drv,
+					  enum ast_chip chip,
+					  enum ast_config_mode config_mode,
+					  void __iomem *regs,
+					  void __iomem *ioregs,
+					  bool need_post);
+
 /* ast_2300.c */
 int ast_2300_post(struct ast_device *ast);
 void ast_2300_detect_tx_chip(struct ast_device *ast);
-- 
2.51.0

