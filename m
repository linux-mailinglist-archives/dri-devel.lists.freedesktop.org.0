Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7725A73331E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E2010E628;
	Fri, 16 Jun 2023 14:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B686E10E62B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4CE591F8BB;
 Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686924463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ml333m9kYJ/wwQjsCCkVxR7C105jMj2jNEErnXIQRls=;
 b=hl4BBDhGwJz4bE+zXBxVl063b3YdqK/xUYMdjiUzloK8jYgo4YH2PGdnuKyMky7M7am5Ax
 ZAAkntnsb0nebxhxlaXkTxEYUE7bC7xqchrm6j8YfQjLoXlEN/hEJ6cSzeifj8jFzRAUTe
 1n9tCDgNadIfECmAwrWehyOqrxVtWao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686924463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ml333m9kYJ/wwQjsCCkVxR7C105jMj2jNEErnXIQRls=;
 b=8grOm3XXpUarQbiXtsBYmPl+pRvIUQKDRGnPLe9/E6gEaK7wCLMYIMjQhLq7/r6OeQx2XI
 v7hfBGPRqMkTb9Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 287331391E;
 Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mG7rCK9sjGTfWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:07:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com
Subject: [PATCH 10/14] drm/ast: Detect AST 1300 model
Date: Fri, 16 Jun 2023 15:52:32 +0200
Message-ID: <20230616140739.32042-11-tzimmermann@suse.de>
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

Detect the 4th-generation AST 1300. Allows to simplify the code
for widescreen support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index c209d7e4e4194..e3f82c7a823e4 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -70,7 +70,7 @@ enum ast_chip {
 	AST2150 = __AST_CHIP(3, 1),
 	/* 4th gen */
 	AST2300 = __AST_CHIP(4, 0),
-	AST1300 = __AST_CHIP(4, 1), // unused
+	AST1300 = __AST_CHIP(4, 1),
 	AST1050 = __AST_CHIP(4, 2), // unused
 	/* 5th gen */
 	AST2400 = __AST_CHIP(5, 0),
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 3cd94a74150bf..bf8606301ab26 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -170,8 +170,16 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 		ast->chip = AST2400;
 		drm_info(dev, "AST 2400 detected\n");
 	} else if (pdev->revision >= 0x20) {
-		ast->chip = AST2300;
-		drm_info(dev, "AST 2300 detected\n");
+		switch (scu_rev & 0x300) {
+		case 0x0000:
+			ast->chip = AST1300;
+			drm_info(dev, "AST 1300 detected\n");
+			break;
+		default:
+			ast->chip = AST2300;
+			drm_info(dev, "AST 2300 detected\n");
+			break;
+		}
 	} else if (pdev->revision >= 0x10) {
 		switch (scu_rev & 0x0300) {
 		case 0x0200:
@@ -209,8 +217,7 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 			ast->support_wide_screen = true;
 		else {
 			ast->support_wide_screen = false;
-			if (ast->chip == AST2300 &&
-			    (scu_rev & 0x300) == 0x0) /* ast1300 */
+			if (ast->chip == AST1300)
 				ast->support_wide_screen = true;
 			if (ast->chip == AST2400 &&
 			    (scu_rev & 0x300) == 0x100) /* ast1400 */
-- 
2.41.0

