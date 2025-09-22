Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22366B8F958
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4232710E3E2;
	Mon, 22 Sep 2025 08:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C804C10E3DA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:40:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7800522045;
 Mon, 22 Sep 2025 08:40:00 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D2281388C;
 Mon, 22 Sep 2025 08:40:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8IF7DWAL0WikFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 22 Sep 2025 08:40:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/12] drm/ast: Prepare per-Gen device initialization
Date: Mon, 22 Sep 2025 10:36:04 +0200
Message-ID: <20250922083708.45564-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922083708.45564-1-tzimmermann@suse.de>
References: <20250922083708.45564-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 7800522045
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
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

Switch device creation by hardware Gen. Return the value from the
call to ast_detect_chip(). All generations are still initialized
by ast_device_create().

Also add ast_device_init() for setting some common fields in struct
ast_device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.c  | 25 ++++++++++++++++++++++---
 drivers/gpu/drm/ast/ast_drv.h  |  5 +++++
 drivers/gpu/drm/ast/ast_main.c |  5 +----
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index c653ea5570d8..a1b3c25ded20 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -47,6 +47,18 @@ static int ast_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, ast_modeset, int, 0400);
 
+void ast_device_init(struct ast_device *ast,
+		     enum ast_chip chip,
+		     enum ast_config_mode config_mode,
+		     void __iomem *regs,
+		     void __iomem *ioregs)
+{
+	ast->chip = chip;
+	ast->config_mode = config_mode;
+	ast->regs = regs;
+	ast->ioregs = ioregs;
+}
+
 void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip)
 {
 	static const char * const info_str[] = {
@@ -281,7 +293,7 @@ static int ast_detect_chip(struct pci_dev *pdev,
 	*chip_out = chip;
 	*config_mode_out = config_mode;
 
-	return 0;
+	return __AST_CHIP_GEN(chip);
 }
 
 static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
@@ -292,6 +304,7 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	void __iomem *ioregs;
 	enum ast_config_mode config_mode;
 	enum ast_chip chip;
+	unsigned int chip_gen;
 	struct drm_device *drm;
 	bool need_post = false;
 
@@ -364,10 +377,16 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return ret;
 
 	ret = ast_detect_chip(pdev, regs, ioregs, &chip, &config_mode);
-	if (ret)
+	if (ret < 0)
 		return ret;
+	chip_gen = ret;
 
-	drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs, need_post);
+	switch (chip_gen) {
+	default:
+		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
+					need_post);
+		break;
+	}
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 	pci_set_drvdata(pdev, drm);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ae8e6083bc2b..8868cbdd99d0 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -416,6 +416,11 @@ struct ast_crtc_state {
 int ast_mm_init(struct ast_device *ast);
 
 /* ast_drv.c */
+void ast_device_init(struct ast_device *ast,
+		     enum ast_chip chip,
+		     enum ast_config_mode config_mode,
+		     void __iomem *regs,
+		     void __iomem *ioregs);
 void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip);
 
 /* ast_2000.c */
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 8ed15563173c..d1c54700686b 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -112,10 +112,7 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
 		return ERR_CAST(ast);
 	dev = &ast->base;
 
-	ast->chip = chip;
-	ast->config_mode = config_mode;
-	ast->regs = regs;
-	ast->ioregs = ioregs;
+	ast_device_init(ast, chip, config_mode, regs, ioregs);
 
 	if (AST_GEN(ast) >= 4)
 		ast_2300_detect_tx_chip(ast);
-- 
2.51.0

