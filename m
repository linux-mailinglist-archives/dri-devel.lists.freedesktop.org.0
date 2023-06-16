Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 978DB73331C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0FC10E631;
	Fri, 16 Jun 2023 14:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA38210E633
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9AAD91F8BF;
 Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686924463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TQmyCil2mzo1LEZTtd02BUWy2lBGCQDgT2YyeEyVlMg=;
 b=M1YJBaPcjcw3ysetwB9KJ3XgV8/mniUmJUF7UixFoaLPaBzwxrr7CUiWcI1OwtmpnH7Kqe
 n3ZZ60KMbNu1PsEWdj3VhFtETF3Ao4MZ7S0EBNBrFz/T7vC17ka3cI+pYjM3R5T4bMASTI
 uVp+6/pk8cdrkfB7Ug1PcaZ9abUU2ww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686924463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TQmyCil2mzo1LEZTtd02BUWy2lBGCQDgT2YyeEyVlMg=;
 b=UX23okYm/jIok61tSO9f4r+a44H51c9B44b1WGdjJ08lJTitpgEn1mNT7BNPY9ZuDxljtx
 2ly65XqLRfm/y1CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78521138E8;
 Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CFx6HK9sjGTfWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:07:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com
Subject: [PATCH 12/14] drm/ast: Detect AST 2510 model
Date: Fri, 16 Jun 2023 15:52:34 +0200
Message-ID: <20230616140739.32042-13-tzimmermann@suse.de>
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

Detect the 6th-generation AST 2510. Allows to simplify the code
for widescreen support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ef69a1535695b..c66fe0ba208e7 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -78,7 +78,7 @@ enum ast_chip {
 	AST1250 = __AST_CHIP(5, 2), // unused
 	/* 6th gen */
 	AST2500 = __AST_CHIP(6, 0),
-	AST2510 = __AST_CHIP(6, 1), // unused
+	AST2510 = __AST_CHIP(6, 1),
 	AST2520 = __AST_CHIP(6, 2), // unused
 	/* 7th gen */
 	AST2600 = __AST_CHIP(7, 0),
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 72543e97f3586..7f8fb9a613604 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -164,8 +164,15 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 		ast->chip = AST2600;
 		drm_info(dev, "AST 2600 detected\n");
 	} else if (pdev->revision >= 0x40) {
-		ast->chip = AST2500;
-		drm_info(dev, "AST 2500 detected\n");
+		switch (scu_rev & 0x300) {
+		case 0x0100:
+			ast->chip = AST2510;
+			drm_info(dev, "AST 2510 detected\n");
+			break;
+		default:
+			ast->chip = AST2500;
+			drm_info(dev, "AST 2500 detected\n");
+		}
 	} else if (pdev->revision >= 0x30) {
 		switch (scu_rev & 0x300) {
 		case 0x0100:
@@ -228,8 +235,7 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 				ast->support_wide_screen = true;
 			if (ast->chip == AST1400)
 				ast->support_wide_screen = true;
-			if (ast->chip == AST2500 &&
-			    scu_rev == 0x100)           /* ast2510 */
+			if (ast->chip == AST2510)
 				ast->support_wide_screen = true;
 			if (IS_AST_GEN7(ast))
 				ast->support_wide_screen = true;
-- 
2.41.0

