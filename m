Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D5C733318
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A4A10E630;
	Fri, 16 Jun 2023 14:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C311610E630
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 93C5221E24;
 Fri, 16 Jun 2023 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686924462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L8K6naFY5Uq0zHNoZP1n4BJRY9djFe5DXNqfiTEJmyk=;
 b=AYJ+7bMi1gS8zZKMzBEIifEdFN8I5tfqoWk1PjKUXh25nlRi0GPGfGThMNUGF50R/Um1W1
 HcxBml3/kjGvSBxHaNKU3H7vKvqF7cloBmAFUvJMMMUdmCTpFYEgt2+mzG0b+ODp/NtCi6
 G0C4oNsQdMXQKebn6hBGetZMDeQ/6PA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686924462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L8K6naFY5Uq0zHNoZP1n4BJRY9djFe5DXNqfiTEJmyk=;
 b=Z/LzP+xvJNMPWYDhmPteCVN43Ia8Ha2X9biWJxAeJlyXWGVC5o01gIoHatI5fP0Ty3Sv+n
 V90WyGWLxuOfuEAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BFD81391E;
 Fri, 16 Jun 2023 14:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4JRTGa5sjGTfWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:07:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com
Subject: [PATCH 06/14] drm/ast: Set PCI config before accessing I/O registers
Date: Fri, 16 Jun 2023 15:52:28 +0200
Message-ID: <20230616140739.32042-7-tzimmermann@suse.de>
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

Access to I/O registers is required to detect and set up the
device. Enable the rsp PCI config bits before. While at it,
convert the magic number to macro constants.

Enabling the PCI config bits was done after trying to detect
the device. It was probably too late at this point.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 ++
 drivers/gpu/drm/ast/ast_main.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_post.c |  6 ------
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 0141705beaee9..555a0850957f3 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -52,6 +52,8 @@
 #define PCI_CHIP_AST2000 0x2000
 #define PCI_CHIP_AST2100 0x2010
 
+#define AST_PCI_OPTION_MEM_ACCESS_ENABLE	BIT(1)
+#define AST_PCI_OPTION_IO_ACCESS_ENABLE		BIT(0)
 
 enum ast_chip {
 	AST2000,
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index c6987e0446618..fe054739b494a 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -35,6 +35,24 @@
 
 #include "ast_drv.h"
 
+static int ast_init_pci_config(struct pci_dev *pdev)
+{
+	int err;
+	u32 pcis04;
+
+	err = pci_read_config_dword(pdev, 0x04, &pcis04);
+	if (err)
+		goto out;
+
+	pcis04 |= AST_PCI_OPTION_MEM_ACCESS_ENABLE |
+		  AST_PCI_OPTION_IO_ACCESS_ENABLE;
+
+	err = pci_write_config_dword(pdev, 0x04, pcis04);
+
+out:
+	return pcibios_err_to_errno(err);
+}
+
 static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 {
 	struct device_node *np = dev->dev->of_node;
@@ -399,6 +417,10 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 			return ERR_PTR(-EIO);
 	}
 
+	ret = ast_init_pci_config(pdev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	if (!ast_is_vga_enabled(dev)) {
 		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
 		need_post = true;
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index aa3f2cb00f82c..2da5bdb4bac45 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -361,12 +361,6 @@ static void ast_init_dram_reg(struct drm_device *dev)
 void ast_post_gpu(struct drm_device *dev)
 {
 	struct ast_device *ast = to_ast_device(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	u32 reg;
-
-	pci_read_config_dword(pdev, 0x04, &reg);
-	reg |= 0x3;
-	pci_write_config_dword(pdev, 0x04, reg);
 
 	ast_enable_vga(dev);
 	ast_open_key(ast);
-- 
2.41.0

