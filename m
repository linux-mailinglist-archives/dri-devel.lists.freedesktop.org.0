Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1597E98A2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857B910E173;
	Mon, 13 Nov 2023 09:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905B610E011
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:14:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 44A331F6E6;
 Mon, 13 Nov 2023 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699866884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EP43gQMe4EKQJb0jXDImPQgbaNaaa3G+f1FkMzyjqfE=;
 b=ymVFpFVVz1J5FoX3Xo/oBGH6oYvFtRP3RtvO//ljT9IFJqfQyTC79IjV08GUcO3sgaEEEm
 FnrN6BDASTgTpJ9oTOrkNASPiEg0ToqhmS4nHSUA+qYnuxTPrWRVDuaV1857GzGKjReUz5
 V3G69nBqoojgyze7e5JJelgQZ7PzBbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699866884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EP43gQMe4EKQJb0jXDImPQgbaNaaa3G+f1FkMzyjqfE=;
 b=X6HTIxp5QUkhS9jsbAGl4J8GTBFUM2rQ1v4ZOmL5KM+2/blGSeZiz4HNhxYjCd71FqhJOv
 VcWL37/Pftfdk/Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B04B13398;
 Mon, 13 Nov 2023 09:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IEqzBQTpUWW0BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Nov 2023 09:14:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH 03/10] drm/ast: Retrieve I/O-memory ranges without ast device
Date: Mon, 13 Nov 2023 09:50:25 +0100
Message-ID: <20231113091439.17181-4-tzimmermann@suse.de>
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

Read the I/O-memory ranges into local variables before setting
them in the ast device instanace. We'll later need this to split
detecting the device type from the creation of the ast device
instance.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 2c2700256a966..43116df577276 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -432,6 +432,8 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	struct ast_device *ast;
 	bool need_post = false;
 	int ret = 0;
+	void __iomem *regs;
+	void __iomem *ioregs;
 
 	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
 	if (IS_ERR(ast))
@@ -440,8 +442,8 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 
 	pci_set_drvdata(pdev, dev);
 
-	ast->regs = pcim_iomap(pdev, 1, 0);
-	if (!ast->regs)
+	regs = pcim_iomap(pdev, 1, 0);
+	if (!regs)
 		return ERR_PTR(-EIO);
 
 	if (pdev->revision >= 0x40) {
@@ -455,7 +457,7 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 			return ERR_PTR(-EIO);
 		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
 			return ERR_PTR(-EIO);
-		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
+		ioregs = regs + AST_IO_MM_OFFSET;
 	} else if (pci_resource_flags(pdev, 2) & IORESOURCE_IO) {
 		/*
 		 * Map I/O registers if we have a PCI BAR for I/O.
@@ -464,8 +466,8 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 
 		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
 			return ERR_PTR(-EIO);
-		ast->ioregs = pcim_iomap(pdev, 2, 0);
-		if (!ast->ioregs)
+		ioregs = pcim_iomap(pdev, 2, 0);
+		if (!ioregs)
 			return ERR_PTR(-EIO);
 	} else {
 		/*
@@ -477,11 +479,14 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 			return ERR_PTR(-EIO);
 		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
 			return ERR_PTR(-EIO);
-		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
+		ioregs = regs + AST_IO_MM_OFFSET;
 
 		drm_info(dev, "Platform has no I/O space, using MMIO\n");
 	}
 
+	ast->regs = regs;
+	ast->ioregs = ioregs;
+
 	if (!ast_is_vga_enabled(dev)) {
 		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
 		need_post = true;
-- 
2.42.0

