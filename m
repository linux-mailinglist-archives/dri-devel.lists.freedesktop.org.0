Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794A1BC1DC3
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC87F10E6CC;
	Tue,  7 Oct 2025 15:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="riPqOgQf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9uvzKE7b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="riPqOgQf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9uvzKE7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC6010E6CB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:06:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1851D33719;
 Tue,  7 Oct 2025 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVuKbRSUJwWFxICPnHiHP19cw7iAGIBJyc090DZadN8=;
 b=riPqOgQfAYkrIfZWiUXOC0DkgPscPGGEZcauiyQ1PjTljn1hyZmaOWAREzy8uPQig75xn4
 JFRIOpofDHG84v1dHmLVk32ypqa2s9fjVvZGqTPE+mI0hbTpiYJzXF7+XNt6YWVJEErIEO
 Y3ye40b//BR4A6xJpjIoaVTPSclwADU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVuKbRSUJwWFxICPnHiHP19cw7iAGIBJyc090DZadN8=;
 b=9uvzKE7bf+i/a+RCo6HyJI+VKvzaGFevzQkNwisK511u6jzTq81Le2a+yG4Bh1weZhZS+X
 bkN82AY1RrVIrKDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVuKbRSUJwWFxICPnHiHP19cw7iAGIBJyc090DZadN8=;
 b=riPqOgQfAYkrIfZWiUXOC0DkgPscPGGEZcauiyQ1PjTljn1hyZmaOWAREzy8uPQig75xn4
 JFRIOpofDHG84v1dHmLVk32ypqa2s9fjVvZGqTPE+mI0hbTpiYJzXF7+XNt6YWVJEErIEO
 Y3ye40b//BR4A6xJpjIoaVTPSclwADU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVuKbRSUJwWFxICPnHiHP19cw7iAGIBJyc090DZadN8=;
 b=9uvzKE7bf+i/a+RCo6HyJI+VKvzaGFevzQkNwisK511u6jzTq81Le2a+yG4Bh1weZhZS+X
 bkN82AY1RrVIrKDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E951E13ACE;
 Tue,  7 Oct 2025 15:06:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IKOHN3Us5Wh1SAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Oct 2025 15:06:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/5] drm/ast: Support device quirks
Date: Tue,  7 Oct 2025 16:54:43 +0200
Message-ID: <20251007150343.273718-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007150343.273718-1-tzimmermann@suse.de>
References: <20251007150343.273718-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[]
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

Define struct ast_device_quirks and add an instance for each hardware
generation. The type will provide information about per-gen constants
and oddities.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2000.c | 5 ++++-
 drivers/gpu/drm/ast/ast_2100.c | 5 ++++-
 drivers/gpu/drm/ast/ast_2200.c | 5 ++++-
 drivers/gpu/drm/ast/ast_2300.c | 5 ++++-
 drivers/gpu/drm/ast/ast_2400.c | 5 ++++-
 drivers/gpu/drm/ast/ast_2500.c | 5 ++++-
 drivers/gpu/drm/ast/ast_2600.c | 5 ++++-
 drivers/gpu/drm/ast/ast_drv.c  | 4 +++-
 drivers/gpu/drm/ast/ast_drv.h  | 8 +++++++-
 9 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
index 74a041e99061..ae4d7a2a0ec8 100644
--- a/drivers/gpu/drm/ast/ast_2000.c
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -211,6 +211,9 @@ void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post)
 	__ast_device_set_tx_chip(ast, tx_chip);
 }
 
+static const struct ast_device_quirks ast_2000_device_quirks = {
+};
+
 struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
 					  const struct drm_driver *drv,
 					  enum ast_chip chip,
@@ -228,7 +231,7 @@ struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
 		return ERR_CAST(ast);
 	dev = &ast->base;
 
-	ast_device_init(ast, chip, config_mode, regs, ioregs);
+	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2000_device_quirks);
 
 	ast->dclk_table = ast_2000_dclk_table;
 
diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
index eb3336c84833..01e064e67cf7 100644
--- a/drivers/gpu/drm/ast/ast_2100.c
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -432,6 +432,9 @@ static void ast_2100_detect_widescreen(struct ast_device *ast)
 		ast->support_wuxga = true;
 }
 
+static const struct ast_device_quirks ast_2100_device_quirks = {
+};
+
 struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
 					  const struct drm_driver *drv,
 					  enum ast_chip chip,
@@ -449,7 +452,7 @@ struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
 		return ERR_CAST(ast);
 	dev = &ast->base;
 
-	ast_device_init(ast, chip, config_mode, regs, ioregs);
+	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2100_device_quirks);
 
 	ast->dclk_table = ast_2000_dclk_table;
 
diff --git a/drivers/gpu/drm/ast/ast_2200.c b/drivers/gpu/drm/ast/ast_2200.c
index 391034d5f425..46b6fc6cf7eb 100644
--- a/drivers/gpu/drm/ast/ast_2200.c
+++ b/drivers/gpu/drm/ast/ast_2200.c
@@ -43,6 +43,9 @@ static void ast_2200_detect_widescreen(struct ast_device *ast)
 		ast->support_wuxga = true;
 }
 
+static const struct ast_device_quirks ast_2200_device_quirks = {
+};
+
 struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
 					  const struct drm_driver *drv,
 					  enum ast_chip chip,
@@ -60,7 +63,7 @@ struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
 		return ERR_CAST(ast);
 	dev = &ast->base;
 
-	ast_device_init(ast, chip, config_mode, regs, ioregs);
+	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2200_device_quirks);
 
 	ast->dclk_table = ast_2000_dclk_table;
 
diff --git a/drivers/gpu/drm/ast/ast_2300.c b/drivers/gpu/drm/ast/ast_2300.c
index 3c9e1960b90c..b76a80d6aea6 100644
--- a/drivers/gpu/drm/ast/ast_2300.c
+++ b/drivers/gpu/drm/ast/ast_2300.c
@@ -1407,6 +1407,9 @@ static void ast_2300_detect_widescreen(struct ast_device *ast)
 		ast->support_wuxga = true;
 }
 
+static const struct ast_device_quirks ast_2300_device_quirks = {
+};
+
 struct drm_device *ast_2300_device_create(struct pci_dev *pdev,
 					  const struct drm_driver *drv,
 					  enum ast_chip chip,
@@ -1424,7 +1427,7 @@ struct drm_device *ast_2300_device_create(struct pci_dev *pdev,
 		return ERR_CAST(ast);
 	dev = &ast->base;
 
-	ast_device_init(ast, chip, config_mode, regs, ioregs);
+	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2300_device_quirks);
 
 	ast->dclk_table = ast_2000_dclk_table;
 
diff --git a/drivers/gpu/drm/ast/ast_2400.c b/drivers/gpu/drm/ast/ast_2400.c
index be866d1cd06a..2b41ff69ab0b 100644
--- a/drivers/gpu/drm/ast/ast_2400.c
+++ b/drivers/gpu/drm/ast/ast_2400.c
@@ -44,6 +44,9 @@ static void ast_2400_detect_widescreen(struct ast_device *ast)
 		ast->support_wuxga = true;
 }
 
+static const struct ast_device_quirks ast_2400_device_quirks = {
+};
+
 struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
 					  const struct drm_driver *drv,
 					  enum ast_chip chip,
@@ -61,7 +64,7 @@ struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
 		return ERR_CAST(ast);
 	dev = &ast->base;
 
-	ast_device_init(ast, chip, config_mode, regs, ioregs);
+	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2400_device_quirks);
 
 	ast->dclk_table = ast_2000_dclk_table;
 
diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
index 086c74682a55..6d305a8ccc51 100644
--- a/drivers/gpu/drm/ast/ast_2500.c
+++ b/drivers/gpu/drm/ast/ast_2500.c
@@ -618,6 +618,9 @@ static void ast_2500_detect_widescreen(struct ast_device *ast)
 		ast->support_wuxga = true;
 }
 
+static const struct ast_device_quirks ast_2500_device_quirks = {
+};
+
 struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
 					  const struct drm_driver *drv,
 					  enum ast_chip chip,
@@ -635,7 +638,7 @@ struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
 		return ERR_CAST(ast);
 	dev = &ast->base;
 
-	ast_device_init(ast, chip, config_mode, regs, ioregs);
+	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2500_device_quirks);
 
 	ast->dclk_table = ast_2500_dclk_table;
 
diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
index 1f709486f491..df3b429e8174 100644
--- a/drivers/gpu/drm/ast/ast_2600.c
+++ b/drivers/gpu/drm/ast/ast_2600.c
@@ -59,6 +59,9 @@ static void ast_2600_detect_widescreen(struct ast_device *ast)
 		ast->support_wuxga = true;
 }
 
+static const struct ast_device_quirks ast_2600_device_quirks = {
+};
+
 struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
 					  const struct drm_driver *drv,
 					  enum ast_chip chip,
@@ -76,7 +79,7 @@ struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
 		return ERR_CAST(ast);
 	dev = &ast->base;
 
-	ast_device_init(ast, chip, config_mode, regs, ioregs);
+	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2600_device_quirks);
 
 	ast->dclk_table = ast_2500_dclk_table;
 
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index a89735c6a462..b9a9b050b546 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -51,8 +51,10 @@ void ast_device_init(struct ast_device *ast,
 		     enum ast_chip chip,
 		     enum ast_config_mode config_mode,
 		     void __iomem *regs,
-		     void __iomem *ioregs)
+		     void __iomem *ioregs,
+		     const struct ast_device_quirks *quirks)
 {
+	ast->quirks = quirks;
 	ast->chip = chip;
 	ast->config_mode = config_mode;
 	ast->regs = regs;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index b2b30a0e4ffb..2a2c28693dc6 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -164,9 +164,14 @@ to_ast_connector(struct drm_connector *connector)
  * Device
  */
 
+struct ast_device_quirks {
+};
+
 struct ast_device {
 	struct drm_device base;
 
+	const struct ast_device_quirks *quirks;
+
 	void __iomem *regs;
 	void __iomem *ioregs;
 	void __iomem *dp501_fw_buf;
@@ -414,7 +419,8 @@ void ast_device_init(struct ast_device *ast,
 		     enum ast_chip chip,
 		     enum ast_config_mode config_mode,
 		     void __iomem *regs,
-		     void __iomem *ioregs);
+		     void __iomem *ioregs,
+		     const struct ast_device_quirks *quirks);
 void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip);
 
 /* ast_2000.c */
-- 
2.51.0

