Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4281173843A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660DF10E46B;
	Wed, 21 Jun 2023 13:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDCE10E465
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:00:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF3BD21BCF;
 Wed, 21 Jun 2023 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687352434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LcWBdkY8F7+OtW95Xl0YZ7rP79Q4HKHruhteDGTjIYg=;
 b=k56AEN518FO75Loi+5W9YV/nNi6xoNIWs83tmjHoxEZXg0PJCTnBbg48s3/XY1CmErNfjz
 HtSA7MKPJY/V8F/evwmO7LwjhdlvRKTTfmnYBbAKSdewEbx3WXq9YwVothgC/VIqJhzhcj
 Ryfk4QuWB+qvx+TVqCA0mkkgO18MIHI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687352434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LcWBdkY8F7+OtW95Xl0YZ7rP79Q4HKHruhteDGTjIYg=;
 b=DnuaeMfjudNn8EHNxARZt37mBApHjTv4rw0F/m+Eic5wUo2/UtnKlbFlv5DwJWffj2oMlD
 5WEmh0p5bXglR5CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C984F13A66;
 Wed, 21 Jun 2023 13:00:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eF5EMHL0kmTaWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 13:00:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com, suijingfeng@loongson.cn
Subject: [PATCH v2 04/14] drm/ast: Remove dead else branch in POST code
Date: Wed, 21 Jun 2023 14:53:38 +0200
Message-ID: <20230621130032.3568-5-tzimmermann@suse.de>
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

According to the chip detection in ast_detect_chip(), AST2300 and
later always have a PCI revision of 0x20 or higher. Therefore the
code in ast_set_def_ext_reg() can not use the else branch when
selecing the EXT register values. Remove the dead branch and the
related values.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
---
 drivers/gpu/drm/ast/ast_post.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 0262aaafdb1c5..aa3f2cb00f82c 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -64,14 +64,12 @@ bool ast_is_vga_enabled(struct drm_device *dev)
 }
 
 static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
-static const u8 extreginfo_ast2300a0[] = { 0x0f, 0x04, 0x1c, 0xff };
 static const u8 extreginfo_ast2300[] = { 0x0f, 0x04, 0x1f, 0xff };
 
 static void
 ast_set_def_ext_reg(struct drm_device *dev)
 {
 	struct ast_device *ast = to_ast_device(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	u8 i, index, reg;
 	const u8 *ext_reg_info;
 
@@ -79,13 +77,9 @@ ast_set_def_ext_reg(struct drm_device *dev)
 	for (i = 0x81; i <= 0x9f; i++)
 		ast_set_index_reg(ast, AST_IO_CRTC_PORT, i, 0x00);
 
-	if (ast->chip == AST2300 || ast->chip == AST2400 ||
-	    ast->chip == AST2500) {
-		if (pdev->revision >= 0x20)
-			ext_reg_info = extreginfo_ast2300;
-		else
-			ext_reg_info = extreginfo_ast2300a0;
-	} else
+	if (ast->chip == AST2300 || ast->chip == AST2400 || ast->chip == AST2500)
+		ext_reg_info = extreginfo_ast2300;
+	else
 		ext_reg_info = extreginfo;
 
 	index = 0xa0;
-- 
2.41.0

