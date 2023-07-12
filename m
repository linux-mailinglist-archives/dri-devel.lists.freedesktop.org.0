Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E06975093D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD76810E528;
	Wed, 12 Jul 2023 13:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185F610E528
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:08:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 043DF1FE06;
 Wed, 12 Jul 2023 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689167308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kd/yX6A/JhsIqAGgoOQEqinl2Z4v5T4RKSf9MTqPStw=;
 b=p8vn7w/FAJXEaO5W4XYLTDUOqtBlASjcd+LF0VJ08XVF8DJEKP6QLxB5MJ1OQoHFomuHsp
 gBXlg0nHM1B5iwSXbt0J9AbOaVwOejkQ88AtGFKNzDgFlGLKQj+g0RenczFAl/tqmoJmUH
 FjHKC50sFsdVCHF52E/ShfSVuUJL8pM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689167308;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kd/yX6A/JhsIqAGgoOQEqinl2Z4v5T4RKSf9MTqPStw=;
 b=wrlZGr2a4yMtifL+SoB+Kgo6nh8QR0aHMyNPipAIdbO6cXcHhr73TmSTsH5jZxtrZuOCH2
 410bBwYL9Ac4f0DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2A6513336;
 Wed, 12 Jul 2023 13:08:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FJ2UMsulrmRhYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Jul 2023 13:08:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, suijingfeng@loongson.cn, airlied@gmail.com,
 airlied@redhat.com, daniel@ffwll.ch
Subject: [PATCH] drm/ast: Do not enable PCI resources multiple times
Date: Wed, 12 Jul 2023 15:08:10 +0200
Message-ID: <20230712130826.3318-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
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

Remove ast_init_pci_config() as the ast driver already enables the PCI
resources by calling pcim_enable_device().

Suggested-by: Sui Jingfeng <suijingfeng@loongson.cn>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 8bfbdfd86d77..dae365ed3969 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -35,23 +35,6 @@
 
 #include "ast_drv.h"
 
-static int ast_init_pci_config(struct pci_dev *pdev)
-{
-	int err;
-	u16 pcis04;
-
-	err = pci_read_config_word(pdev, PCI_COMMAND, &pcis04);
-	if (err)
-		goto out;
-
-	pcis04 |= PCI_COMMAND_MEMORY | PCI_COMMAND_IO;
-
-	err = pci_write_config_word(pdev, PCI_COMMAND, pcis04);
-
-out:
-	return pcibios_err_to_errno(err);
-}
-
 static bool ast_is_vga_enabled(struct drm_device *dev)
 {
 	struct ast_device *ast = to_ast_device(dev);
@@ -483,10 +466,6 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 			return ERR_PTR(-EIO);
 	}
 
-	ret = ast_init_pci_config(pdev);
-	if (ret)
-		return ERR_PTR(ret);
-
 	if (!ast_is_vga_enabled(dev)) {
 		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
 		need_post = true;
-- 
2.41.0

