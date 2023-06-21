Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCC8738440
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D7810E467;
	Wed, 21 Jun 2023 13:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0625C10E464
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:00:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1CC2021CA0;
 Wed, 21 Jun 2023 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687352436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9Vt/L2zplwK1/as9bVR2NRx8rsYp/w3S2DKYfX9ixo=;
 b=yWJXjr1XaHKc0ZZbrGngLtL0LDyWqRY83HEgglt1r93yQgwxfE2XPsV4B75saUsy4TO+ap
 Ys/5FV8I3ScIhRu2Vdww3slMItlPqb/1agSLlZ+x8XYsHbj9Btvg2GEv2WEZVmn5Y4jT1x
 byy35fjJyKf+/b90tdrB6nSMB15dds8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687352436;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9Vt/L2zplwK1/as9bVR2NRx8rsYp/w3S2DKYfX9ixo=;
 b=j6j8he9DxHeekDqf3eZmIPej21H6SdHmeW/9IhDZ0Ogjg1UoSS8v8dlOKIdHTpD1fZxZgu
 FIW6v/wwHw+OSrCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAF43134B1;
 Wed, 21 Jun 2023 13:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UEJ7OHP0kmTaWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 13:00:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com, suijingfeng@loongson.cn
Subject: [PATCH v2 10/14] drm/ast: Detect AST 1300 model
Date: Wed, 21 Jun 2023 14:53:44 +0200
Message-ID: <20230621130032.3568-11-tzimmermann@suse.de>
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

Detect the 4th-generation AST 1300. Allows to simplify the code
for widescreen support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 803d72a60506c..8199834f8fbe0 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -67,7 +67,7 @@ enum ast_chip {
 	AST2150 = __AST_CHIP(3, 1),
 	/* 4th gen */
 	AST2300 = __AST_CHIP(4, 0),
-	AST1300 = __AST_CHIP(4, 1), // unused
+	AST1300 = __AST_CHIP(4, 1),
 	AST1050 = __AST_CHIP(4, 2), // unused
 	/* 5th gen */
 	AST2400 = __AST_CHIP(5, 0),
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 8fc412fe296c2..7513924a5437b 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -169,8 +169,16 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
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
@@ -208,8 +216,7 @@ static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
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

