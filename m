Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972C73331A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D1210E639;
	Fri, 16 Jun 2023 14:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D5F10E632
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E8CEA21E51;
 Fri, 16 Jun 2023 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686924462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cAq+gsV2yBZqCwOwftfU/6EEbsH4mR9ULOOOz3zGOQA=;
 b=zsis5w+FUxFX6dt7uL1olCbcJRS8Nq+FZTeDCcqlgPvHKRpkUFIk6wGCXe64fq9A72xLGJ
 bVMQOiHmvd7sWFWuYCG8XXwXb0SCUoo0HnOKX9Bk7qqyd/BxkndGiafw8MWw1lUz6AGvxk
 MCTG+sRbjSbXY+ldGv/l8tXb3VOqLZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686924462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cAq+gsV2yBZqCwOwftfU/6EEbsH4mR9ULOOOz3zGOQA=;
 b=cT/CKkOtIkLQ2Z+1DcoJ7ZW9vRrhCpoYvScH3KEXwdACS9P/72ie+RZ13HeChgPDJxFOQp
 GLyDZ+avZUm+fIAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4DC31391E;
 Fri, 16 Jun 2023 14:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0B0GL65sjGTfWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:07:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com
Subject: [PATCH 08/14] drm/ast: Set up release action right after enabling MMIO
Date: Fri, 16 Jun 2023 15:52:30 +0200
Message-ID: <20230616140739.32042-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616140739.32042-1-tzimmermann@suse.de>
References: <20230616140739.32042-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ast sets up a managed release of the MMIO access flags. Move this
code next to the MMIO access code, so that it runs if other errors
occur during the device initialization.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 38 +++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 3295876c09b35..6ff4b837e64d7 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -71,11 +71,25 @@ static void ast_enable_vga(struct drm_device *dev)
 	ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, 0x01);
 }
 
-static void ast_enable_mmio(struct drm_device *dev)
+/*
+ * Run this function as part of the HW device cleanup; not
+ * when the DRM device gets released.
+ */
+static void ast_enable_mmio_release(void *data)
 {
-	struct ast_device *ast = to_ast_device(dev);
+	struct ast_device *ast = data;
+
+	/* enable standard VGA decode */
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
+}
+
+static int ast_enable_mmio(struct ast_device *ast)
+{
+	struct drm_device *dev = &ast->base;
 
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
+
+	return devm_add_action_or_reset(dev->dev, ast_enable_mmio_release, ast);
 }
 
 static void ast_open_key(struct ast_device *ast)
@@ -392,18 +406,6 @@ static int ast_get_dram_info(struct drm_device *dev)
 	return 0;
 }
 
-/*
- * Run this function as part of the HW device cleanup; not
- * when the DRM device gets released.
- */
-static void ast_device_release(void *data)
-{
-	struct ast_device *ast = data;
-
-	/* enable standard VGA decode */
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
-}
-
 struct ast_device *ast_device_create(const struct drm_driver *drv,
 				     struct pci_dev *pdev,
 				     unsigned long flags)
@@ -465,7 +467,9 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 
 	/* Enable extended register access */
 	ast_open_key(ast);
-	ast_enable_mmio(dev);
+	ret = ast_enable_mmio(ast);
+	if (ret)
+		return ERR_PTR(ret);
 
 	/* Find out whether P2A works or whether to use device-tree */
 	ast_detect_config_mode(dev, &scu_rev);
@@ -498,9 +502,5 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = devm_add_action_or_reset(dev->dev, ast_device_release, ast);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return ast;
 }
-- 
2.41.0

