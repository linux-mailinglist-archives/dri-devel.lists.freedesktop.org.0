Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D11D7E98AC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7A210E182;
	Mon, 13 Nov 2023 09:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925DE10E17A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:14:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D52F621905;
 Mon, 13 Nov 2023 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699866884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cbwIU9Qq9EMTtNa58u4UO1xcpDoYZGQmLFIj33J4ZQ0=;
 b=AaXjyxBNMHqjM3Zwu4dmXgdHQLPSnNGDjfd9qBiHEzKw8aeUz+nr437l90/JadxmvvS2Ju
 Vb6af8XgV4d2DDD9AOjacqfnvAsFzZEpiUsFfuIoeNYSAxxP6/ETr+2HKGx5odJREXLdXJ
 iVA2bew2FWhv2P4LxgfKQquRZ99ZaK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699866884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cbwIU9Qq9EMTtNa58u4UO1xcpDoYZGQmLFIj33J4ZQ0=;
 b=F2S8kvW13JfFVenlD5IRvviI3ZItXRiOvEBqqOyoZD6/kxCLATnxOnBTuyPqLkpHDtD9+N
 HQur/yZMoINnqYAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A88F113907;
 Mon, 13 Nov 2023 09:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IBY9KATpUWW0BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Nov 2023 09:14:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH 06/10] drm/ast: Enable MMIO without ast device instance
Date: Mon, 13 Nov 2023 09:50:28 +0100
Message-ID: <20231113091439.17181-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113091439.17181-1-tzimmermann@suse.de>
References: <20231113091439.17181-1-tzimmermann@suse.de>
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

We'll have to enable the MMIO access for detecting the ast device
type. Make this work without an instance of the ast device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 16 +++++++++-------
 drivers/gpu/drm/ast/ast_reg.h  |  2 ++
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 1d2ec77c1d8d9..a24d3529373c1 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -54,19 +54,21 @@ static void ast_enable_vga(void __iomem *ioregs)
  */
 static void ast_enable_mmio_release(void *data)
 {
-	struct ast_device *ast = data;
+	void __iomem *ioregs = (void __force __iomem *)data;
 
 	/* enable standard VGA decode */
-	ast_set_index_reg(ast, AST_IO_VGACRI, 0xa1, 0x04);
+	__ast_write8_i(ioregs, AST_IO_VGACRI, 0xa1, AST_IO_VGACRA1_MMIO_ENABLED);
 }
 
-static int ast_enable_mmio(struct ast_device *ast)
+static int ast_enable_mmio(struct device *dev, void __iomem *ioregs)
 {
-	struct drm_device *dev = &ast->base;
+	void *data = (void __force *)ioregs;
 
-	ast_set_index_reg(ast, AST_IO_VGACRI, 0xa1, 0x06);
+	__ast_write8_i(ioregs, AST_IO_VGACRI, 0xa1,
+		       AST_IO_VGACRA1_MMIO_ENABLED |
+		       AST_IO_VGACRA1_VGAIO_DISABLED);
 
-	return devm_add_action_or_reset(dev->dev, ast_enable_mmio_release, ast);
+	return devm_add_action_or_reset(dev, ast_enable_mmio_release, data);
 }
 
 static void ast_open_key(void __iomem *ioregs)
@@ -496,7 +498,7 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	/* Enable extended register access */
 	ast_open_key(ioregs);
 
-	ret = ast_enable_mmio(ast);
+	ret = ast_enable_mmio(&pdev->dev, ioregs);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 826fcb08398ec..236547a0280d9 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -29,6 +29,8 @@
 
 #define AST_IO_VGACRI			(0x54)
 #define AST_IO_VGACR80_PASSWORD		(0xa8)
+#define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
+#define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
 #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
 #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
 
-- 
2.42.0

