Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2645A733321
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BED410E62F;
	Fri, 16 Jun 2023 14:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DDE10E62C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 73EA021E53;
 Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686924463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7D+1rp/zACcTYVX2Zyqcs/wlq/Y0+pnhfZVwDL9xX0=;
 b=lCNxPqYz/KzAXKJt82f4J8qG83VDwrDQdTlYMAP5bOM7t/r0fE4qJ0NcM8t6mjss06ajLK
 ByYCbzq0hywH7GbzTh4+m1kVocyZZ0tDkyV7UoxRq9Yj7vhNe/6kQdo6orc6cei8BeU+KR
 8JJFDOFKOmP6PxkCId+tPizRVBxQp+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686924463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7D+1rp/zACcTYVX2Zyqcs/wlq/Y0+pnhfZVwDL9xX0=;
 b=FzJg5pm90iC+TXCHLITIS7HHAqlC3n6U2OIjcsMz0KD3b+EY1i3b4PNukiZAdlX3Eharqv
 zv5SDV1MTY7S49BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50AFA138E8;
 Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IHraEq9sjGTfWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:07:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com
Subject: [PATCH 11/14] drm/ast: Detect AST 1400 model
Date: Fri, 16 Jun 2023 15:52:33 +0200
Message-ID: <20230616140739.32042-12-tzimmermann@suse.de>
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

Detect the 5th-generation AST 1400. Allows to simplify the code
for widescreen support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index e3f82c7a823e4..ef69a1535695b 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -74,7 +74,7 @@ enum ast_chip {
 	AST1050 = __AST_CHIP(4, 2), // unused
 	/* 5th gen */
 	AST2400 = __AST_CHIP(5, 0),
-	AST1400 = __AST_CHIP(5, 1), // unused
+	AST1400 = __AST_CHIP(5, 1),
 	AST1250 = __AST_CHIP(5, 2), // unused
 	/* 6th gen */
 	AST2500 = __AST_CHIP(6, 0),
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index bf8606301ab26..72543e97f3586 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -167,8 +167,15 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 		ast->chip = AST2500;
 		drm_info(dev, "AST 2500 detected\n");
 	} else if (pdev->revision >= 0x30) {
-		ast->chip = AST2400;
-		drm_info(dev, "AST 2400 detected\n");
+		switch (scu_rev & 0x300) {
+		case 0x0100:
+			ast->chip = AST1400;
+			drm_info(dev, "AST 1400 detected\n");
+			break;
+		default:
+			ast->chip = AST2400;
+			drm_info(dev, "AST 2400 detected\n");
+		}
 	} else if (pdev->revision >= 0x20) {
 		switch (scu_rev & 0x300) {
 		case 0x0000:
@@ -219,8 +226,7 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
 			ast->support_wide_screen = false;
 			if (ast->chip == AST1300)
 				ast->support_wide_screen = true;
-			if (ast->chip == AST2400 &&
-			    (scu_rev & 0x300) == 0x100) /* ast1400 */
+			if (ast->chip == AST1400)
 				ast->support_wide_screen = true;
 			if (ast->chip == AST2500 &&
 			    scu_rev == 0x100)           /* ast2510 */
-- 
2.41.0

