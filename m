Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCA873844A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C82410E471;
	Wed, 21 Jun 2023 13:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339CF10E467
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:00:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 456B521C99;
 Wed, 21 Jun 2023 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687352436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbE4ou+y4X0W4oXh4qZ2i73cj+LyFiCoWDRXDZnKbr8=;
 b=SVRCt1TiiAUCRGwIPtRvUl9fLPXHEWkDJ1syZk1M7jBmwHxD8X9hQ3JDjOovOt0UOCtxhZ
 Rg11WYnhpjJ2kbopCAy8Pj4VT+2uN+AGQqUKKFp1qbKCIGY8eoqVZh9a+8p71Evl7L4xVT
 NvE/uJmCZ+uw0+j4mKUDJ5pVP/O18nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687352436;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbE4ou+y4X0W4oXh4qZ2i73cj+LyFiCoWDRXDZnKbr8=;
 b=uWqr4q5Xg5znYP4gdqtRODBYuH6b1c4WGoRVw7J3NU163OrPGfRUnAod2X2KMshG5EsG6q
 AIfYDzUkAWszRRDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2087213A66;
 Wed, 21 Jun 2023 13:00:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iC4QB3T0kmTaWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 13:00:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com, suijingfeng@loongson.cn
Subject: [PATCH v2 11/14] drm/ast: Detect AST 1400 model
Date: Wed, 21 Jun 2023 14:53:45 +0200
Message-ID: <20230621130032.3568-12-tzimmermann@suse.de>
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

Detect the 5th-generation AST 1400. Allows to simplify the code
for widescreen support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 8199834f8fbe0..876ebbd3b60e0 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -71,7 +71,7 @@ enum ast_chip {
 	AST1050 = __AST_CHIP(4, 2), // unused
 	/* 5th gen */
 	AST2400 = __AST_CHIP(5, 0),
-	AST1400 = __AST_CHIP(5, 1), // unused
+	AST1400 = __AST_CHIP(5, 1),
 	AST1250 = __AST_CHIP(5, 2), // unused
 	/* 6th gen */
 	AST2500 = __AST_CHIP(6, 0),
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 7513924a5437b..cbfe93c7929d4 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -166,8 +166,15 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
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
@@ -218,8 +225,7 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
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

