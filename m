Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B61738447
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D286010E46D;
	Wed, 21 Jun 2023 13:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53E310E460
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:00:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E11721C9A;
 Wed, 21 Jun 2023 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687352435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DB827rCp86epC8SCQUJgRjUxBWrsnPJlsRRWTz9PPLs=;
 b=Wp08IKokd/twvpjsehbYlGKFF3xQ5J2hcngnlHsyzeEBHXw/4ioQzDxfqy+gZNRFS1CKTu
 dqdfdnJObuTAbr7j1B/CN/Wz5y8y61aHh/GgpFFq4zY/0x4lZoqLA6yeJNvFFGkFLK4YZI
 t4n+AYf3/6Bsk6Nnq9J6vTxTGiDnfFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687352435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DB827rCp86epC8SCQUJgRjUxBWrsnPJlsRRWTz9PPLs=;
 b=LG714v/eNZN6mllA9aX9za//m070iX8r6dcHJaeMOSuPNI9UFK3dC3QyF4VTyiQdZDyt3Y
 C0jPhp7+85CAKmBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B21513A66;
 Wed, 21 Jun 2023 13:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IFTDCXP0kmTaWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 13:00:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com, suijingfeng@loongson.cn
Subject: [PATCH v2 06/14] drm/ast: Set PCI config before accessing I/O
 registers
Date: Wed, 21 Jun 2023 14:53:40 +0200
Message-ID: <20230621130032.3568-7-tzimmermann@suse.de>
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

Access to I/O registers is required to detect and set up the
device. Enable the rsp PCI config bits before. While at it,
convert the magic number to macro constants.

Enabling the PCI config bits was done after trying to detect
the device. It was probably too late at this point.

v2:
	* use standard 16-bit PCI r/w access (Jingfeng)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 -
 drivers/gpu/drm/ast/ast_main.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/ast/ast_post.c |  6 ------
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 0141705beaee9..630105feec18a 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -52,7 +52,6 @@
 #define PCI_CHIP_AST2000 0x2000
 #define PCI_CHIP_AST2100 0x2010
 
-
 enum ast_chip {
 	AST2000,
 	AST2100,
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index c6987e0446618..01f938c2da28f 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -35,6 +35,23 @@
 
 #include "ast_drv.h"
 
+static int ast_init_pci_config(struct pci_dev *pdev)
+{
+	int err;
+	u16 pcis04;
+
+	err = pci_read_config_word(pdev, PCI_COMMAND, &pcis04);
+	if (err)
+		goto out;
+
+	pcis04 |= PCI_COMMAND_MEMORY | PCI_COMMAND_IO;
+
+	err = pci_write_config_word(pdev, PCI_COMMAND, pcis04);
+
+out:
+	return pcibios_err_to_errno(err);
+}
+
 static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 {
 	struct device_node *np = dev->dev->of_node;
@@ -399,6 +416,10 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
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

