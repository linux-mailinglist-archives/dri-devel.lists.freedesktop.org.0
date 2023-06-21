Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B7C73844C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B87B10E475;
	Wed, 21 Jun 2023 13:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DD810E469
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:00:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9865D1FE34;
 Wed, 21 Jun 2023 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687352436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2vyx4bDKPlIkMKtRzQ6Eji2iHbp2ignI6YbXl85tf8=;
 b=AMw39/CUPkvYjGiERNeAVHrNgSJ4htdC4DStA7AT8KtH8k+yaMWvkLdRzHO7N8vJ+B6hs9
 tD7ECMZIlhh5KdFy6IPOmtZwmkZ5MC8AGMvX5vEnKIgAVwAJWkHPJ3AFv9G+NNF9Ris97F
 0FDY+NBMgDeRqbmEolU7PEYXFFxOgE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687352436;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2vyx4bDKPlIkMKtRzQ6Eji2iHbp2ignI6YbXl85tf8=;
 b=V2tmncZMhC9OlnM6kecMqKdoHZZTv3vmB1Y5nvVATS2dBNvsDK8WSPj7L0O/gicSxTN/6d
 HGrcID3MUOe4M8Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7378013A66;
 Wed, 21 Jun 2023 13:00:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uAtYG3T0kmTaWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 13:00:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com, suijingfeng@loongson.cn
Subject: [PATCH v2 13/14] drm/ast: Move widescreen and tx-chip detection into
 separate helpers
Date: Wed, 21 Jun 2023 14:53:47 +0200
Message-ID: <20230621130032.3568-14-tzimmermann@suse.de>
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

Split ast_detect_chip() into three functions and call them one by
one. The new functions detect the transmitter chip and widescreen
support. This will allow for further refactoring.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn> # AST2400
---
 drivers/gpu/drm/ast/ast_main.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index f2f8a054c52cf..7ade96f1f37f9 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -156,7 +156,6 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 {
 	struct ast_device *ast = to_ast_device(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	uint32_t jreg;
 
 	/* Identify chipset */
 	if (pdev->revision >= 0x50) {
@@ -217,6 +216,13 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
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
@@ -241,6 +247,12 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
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
@@ -300,8 +312,6 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 		drm_info(dev, "Using DP501 DisplayPort transmitter\n");
 	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
 		drm_info(dev, "Using ASPEED DisplayPort transmitter\n");
-
-	return 0;
 }
 
 static int ast_get_dram_info(struct drm_device *dev)
@@ -493,6 +503,8 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	ast_detect_config_mode(dev, &scu_rev);
 
 	ast_detect_chip(dev, need_post, scu_rev);
+	ast_detect_widescreen(ast);
+	ast_detect_tx_chip(ast, need_post);
 
 	ret = ast_get_dram_info(dev);
 	if (ret)
-- 
2.41.0

