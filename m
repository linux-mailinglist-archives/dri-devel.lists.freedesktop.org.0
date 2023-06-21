Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0404A73843E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5DD10E466;
	Wed, 21 Jun 2023 13:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B9010E468
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:00:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E7D921CA1;
 Wed, 21 Jun 2023 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687352436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTAIwTzSjvqs3cvd6cl7l4w4q8pO1cyOiWgYaYQ+R0w=;
 b=p8goR+pw6/N6MKC5CXnRO8SqwT7dzO2J6EJs6cjYHzwENonSoTGIQaEJgSlBsEhsfHh5zj
 eRB5IQA0YwAC0cI1fIMcwcj6sjVLocfb7OFcUZFdvkP8aHEQXj3vdAu+0UW3y3DTksAYr2
 X8XUmURRRnsEl+GWZJmdJ/6WCll+ouc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687352436;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTAIwTzSjvqs3cvd6cl7l4w4q8pO1cyOiWgYaYQ+R0w=;
 b=h4sQNzqgcRNWUTjz+3k/WLMAmvKFVlWSn0fZ4J4xlspd064fC/hbmsAgQkPm/YOr8dUF6U
 De+IKoNZIv1s2/Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A091134B1;
 Wed, 21 Jun 2023 13:00:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GBdREXT0kmTaWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 13:00:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com, suijingfeng@loongson.cn
Subject: [PATCH v2 12/14] drm/ast: Detect AST 2510 model
Date: Wed, 21 Jun 2023 14:53:46 +0200
Message-ID: <20230621130032.3568-13-tzimmermann@suse.de>
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

Detect the 6th-generation AST 2510. Allows to simplify the code
for widescreen support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 876ebbd3b60e0..3f6e0c984523a 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -75,7 +75,7 @@ enum ast_chip {
 	AST1250 = __AST_CHIP(5, 2), // unused
 	/* 6th gen */
 	AST2500 = __AST_CHIP(6, 0),
-	AST2510 = __AST_CHIP(6, 1), // unused
+	AST2510 = __AST_CHIP(6, 1),
 	AST2520 = __AST_CHIP(6, 2), // unused
 	/* 7th gen */
 	AST2600 = __AST_CHIP(7, 0),
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index cbfe93c7929d4..f2f8a054c52cf 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -163,8 +163,15 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
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
@@ -227,8 +234,7 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
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

