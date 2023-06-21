Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B232F73843D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826AA10E465;
	Wed, 21 Jun 2023 13:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC1010E45F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:00:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 288C321C95;
 Wed, 21 Jun 2023 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687352435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faULMCHePh5aQWGjPAzbShMshET9EbYU5UBFs2UtlbA=;
 b=R+a2UhakxwRRtq2imooHXLX27MwZ/U1GYFaBfOMMc77CCi0iP+oFejkMDTVmDr9zQ0gSLt
 vxVnnpMolz9BamE8mmt+0A1hvP509aaDBn8KDKTrHylxSjgxN2GG6JPzHqUcVKqRbtPLgn
 9cM416hILUfCYph+8Xlo3TUnbic/QBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687352435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faULMCHePh5aQWGjPAzbShMshET9EbYU5UBFs2UtlbA=;
 b=LEIWNVODcOfosQ0ywGb+j6d/9+V4X5q4qj5YWZZvbHXqwBaos+H4jFFRhBc0G87xy9MWal
 HPV1a60pZlXaMVCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00659134B1;
 Wed, 21 Jun 2023 13:00:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QKbAOnL0kmTaWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 13:00:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com, suijingfeng@loongson.cn
Subject: [PATCH v2 05/14] drm/ast: Remove device POSTing and config from chip
 detection
Date: Wed, 21 Jun 2023 14:53:39 +0200
Message-ID: <20230621130032.3568-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621130032.3568-1-tzimmermann@suse.de>
References: <20230621130032.3568-1-tzimmermann@suse.de>
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

There's way too much going on in ast_detect_chip(). Move the POST
and config code from the top of the function into the caller. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
---
 drivers/gpu/drm/ast/ast_main.c | 52 ++++++++++++++++------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 862fdf02f6100..c6987e0446618 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -44,7 +44,6 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 
 	/* Defaults */
 	ast->config_mode = ast_use_defaults;
-	*scu_rev = 0xffffffff;
 
 	/* Check if we have device-tree properties */
 	if (np && !of_property_read_u32(np, "aspeed,scu-revision-id",
@@ -92,32 +91,11 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 	drm_info(dev, "P2A bridge disabled, using default configuration\n");
 }
 
-static int ast_detect_chip(struct drm_device *dev, bool *need_post)
+static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 {
 	struct ast_device *ast = to_ast_device(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	uint32_t jreg, scu_rev;
-
-	/*
-	 * If VGA isn't enabled, we need to enable now or subsequent
-	 * access to the scratch registers will fail. We also inform
-	 * our caller that it needs to POST the chip
-	 * (Assumption: VGA not enabled -> need to POST)
-	 */
-	if (!ast_is_vga_enabled(dev)) {
-		ast_enable_vga(dev);
-		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
-		*need_post = true;
-	} else
-		*need_post = false;
-
-
-	/* Enable extended register access */
-	ast_open_key(ast);
-	ast_enable_mmio(dev);
-
-	/* Find out whether P2A works or whether to use device-tree */
-	ast_detect_config_mode(dev, &scu_rev);
+	uint32_t jreg;
 
 	/* Identify chipset */
 	if (pdev->revision >= 0x50) {
@@ -195,7 +173,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 	 * is at power-on reset, otherwise we'll incorrectly "detect" a
 	 * SIL164 when there is none.
 	 */
-	if (!*need_post) {
+	if (!need_post) {
 		jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xa3, 0xff);
 		if (jreg & 0x80)
 			ast->tx_chip_types = AST_TX_SIL164_BIT;
@@ -384,8 +362,9 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 {
 	struct drm_device *dev;
 	struct ast_device *ast;
-	bool need_post;
+	bool need_post = false;
 	int ret = 0;
+	u32 scu_rev = 0xffffffff;
 
 	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
 	if (IS_ERR(ast))
@@ -420,7 +399,26 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 			return ERR_PTR(-EIO);
 	}
 
-	ast_detect_chip(dev, &need_post);
+	if (!ast_is_vga_enabled(dev)) {
+		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
+		need_post = true;
+	}
+
+	/*
+	 * If VGA isn't enabled, we need to enable now or subsequent
+	 * access to the scratch registers will fail.
+	 */
+	if (need_post)
+		ast_enable_vga(dev);
+
+	/* Enable extended register access */
+	ast_open_key(ast);
+	ast_enable_mmio(dev);
+
+	/* Find out whether P2A works or whether to use device-tree */
+	ast_detect_config_mode(dev, &scu_rev);
+
+	ast_detect_chip(dev, need_post, scu_rev);
 
 	ret = ast_get_dram_info(dev);
 	if (ret)
-- 
2.41.0

