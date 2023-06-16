Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAA473331F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1501210E63D;
	Fri, 16 Jun 2023 14:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8004A10E632
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C3DFD21E54;
 Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686924463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6NwHGn584c4K6MMM5i4OTuuzZ9IVU2VbZk0VII6Sn0=;
 b=XUZzyM3cJqi8cDfTWx2z6/z+ZlAwj4jq08U6Hn5aVOauHyIBOK131qVAR3M5mHkSHdiar2
 RjG5eFAUryOWtXK0qMljxfyMkPFkjXDvU5676yfRrAJTIG8MzyOH6pvTX3yEhhq9yQLrdP
 vJBTKrVcRXFehmG8FBhKjMhR8TgUffU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686924463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6NwHGn584c4K6MMM5i4OTuuzZ9IVU2VbZk0VII6Sn0=;
 b=bYkKBXzP7Iuvp++pYCrGjYviAVct+hjoHfnRRNw0X/nOohqsgeipWAEn8Zt+kpkxr6XQ3n
 jeD3subv83TaP6DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F681138E8;
 Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OHv5Ja9sjGTfWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:07:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com
Subject: [PATCH 13/14] drm/ast: Move widescreen- and tx-chip detection into
 separate helpers
Date: Fri, 16 Jun 2023 15:52:35 +0200
Message-ID: <20230616140739.32042-14-tzimmermann@suse.de>
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

Split ast_detect_chip() into three functions and call them one by
one. The new functions detect the transmitter chip and widescreen
support. This will allow for further refactoring.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 7f8fb9a613604..f028b5b47c56e 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -157,7 +157,6 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 {
 	struct ast_device *ast = to_ast_device(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	uint32_t jreg;
 
 	/* Identify chipset */
 	if (pdev->revision >= 0x50) {
@@ -218,6 +217,13 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 		drm_info(dev, "AST 2000 detected\n");
 	}
 
+	return 0;
+}
+
+static void ast_detect_widescreen(struct ast_device *ast)
+{
+	u8 jreg;
+
 	/* Check if we support wide screen */
 	switch (AST_GEN(ast)) {
 	case 1:
@@ -242,6 +248,12 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 		}
 		break;
 	}
+}
+
+static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
+{
+	struct drm_device *dev = &ast->base;
+	u8 jreg;
 
 	/* Check 3rd Tx option (digital output afaik) */
 	ast->tx_chip_types |= AST_TX_NONE_BIT;
@@ -301,8 +313,6 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 		drm_info(dev, "Using DP501 DisplayPort transmitter\n");
 	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
 		drm_info(dev, "Using ASPEED DisplayPort transmitter\n");
-
-	return 0;
 }
 
 static int ast_get_dram_info(struct drm_device *dev)
@@ -494,6 +504,8 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	ast_detect_config_mode(dev, &scu_rev);
 
 	ast_detect_chip(dev, need_post, scu_rev);
+	ast_detect_widescreen(ast);
+	ast_detect_tx_chip(ast, need_post);
 
 	ret = ast_get_dram_info(dev);
 	if (ret)
-- 
2.41.0

