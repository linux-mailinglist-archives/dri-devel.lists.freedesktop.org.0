Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB22733316
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEF710E629;
	Fri, 16 Jun 2023 14:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928C710E62B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3CAB11F8B9;
 Fri, 16 Jun 2023 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686924462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GncNySL+WdGh3B3aBkRYx/QZGPdyxSUrGMy5GsvNGBM=;
 b=PJGMR5Vry4340pry52wArBl86p9ySadaliUyQ/Kj2B86wgTurG31p4KJUh1uCqPhmPdOqp
 PgrkEfcVMdmRgFsgK/LZdwsmgQtvb4Kjs648u77PfgAnP56V3h3YAIdUuF6tOylujsRrc1
 i/lrNDEuku4+x95JdzUdWFFbHLEL60g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686924462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GncNySL+WdGh3B3aBkRYx/QZGPdyxSUrGMy5GsvNGBM=;
 b=sJmwjvbNW8VfLelaYKfXv/2bpahnclbtIpbv/9tHD2UU0NFKsQoAqVpPfrFDA2nMbezeAh
 PCICDzkrDbfCLhAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 170651391E;
 Fri, 16 Jun 2023 14:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eMCVBK5sjGTfWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:07:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com
Subject: [PATCH 04/14] drm/ast: Remove dead else branch in POST code
Date: Fri, 16 Jun 2023 15:52:26 +0200
Message-ID: <20230616140739.32042-5-tzimmermann@suse.de>
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

According to the chip detection in ast_detect_chip(), AST2300 and
later always have a PCI revision of 0x20 or higher. Therefore the
code in ast_set_def_ext_reg() can not use the else branch when
selecing the EXT register values. Remove the dead branch and the
related values.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

