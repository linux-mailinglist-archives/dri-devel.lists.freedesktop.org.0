Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3066598379
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 14:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6454B4867;
	Thu, 18 Aug 2022 12:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (unknown [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D792A9230
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 12:50:53 +0000 (UTC)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 27I5UVqh001968
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 13:30:31 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 27I5UHL3001948;
 Thu, 18 Aug 2022 13:30:17 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from localhost.localdomain.com (192.168.2.138) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 18 Aug 2022 13:49:09 +0800
From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
To: <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ast: Fix NO EDID on DP501
Date: Thu, 18 Aug 2022 13:49:02 +0800
Message-ID: <20220818054902.40837-1-kuohsiang_chou@aspeedtech.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.138]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 27I5UHL3001948
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
Cc: hungju_huang@aspeedtech.com, airlied@linux.ie, tommy_huang@aspeedtech.com,
 airlied@redhat.com, arc_sung@aspeedtech.com, luke_chen@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Corrected the definition of AST_DP501_PNP_CONNECTED.
2. Created the Base address for DP501 MCU.

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_dp501.c | 10 ++++++++--
 drivers/gpu/drm/ast/ast_drv.h   |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 4f75a9efb..4693d68ca 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -180,7 +180,10 @@ void ast_set_dp501_video_output(struct drm_device *dev, u8 mode)

 static u32 get_fw_base(struct ast_private *ast)
 {
-	return ast_mindwm(ast, 0x1e6e2104) & 0x7fffffff;
+	if (ast->chip == AST2500)
+		return ast_mindwm(ast, 0x1e6e2104) & 0xfffffffe;
+	else
+		return ast_mindwm(ast, 0x1e6e2104) & 0x7fffffff;
 }

 bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size)
@@ -257,7 +260,10 @@ static bool ast_launch_m68k(struct drm_device *dev)
 		ast_moutdwm(ast, 0x1e6e2000, 0x1688a8a8);

 		/* Launch FW */
-		ast_moutdwm(ast, 0x1e6e2104, 0x80000000 + boot_address);
+		if (ast->chip == AST2500)
+			ast_moutdwm(ast, 0x1e6e2104, boot_address | 0x00000001);
+		else
+			ast_moutdwm(ast, 0x1e6e2104, boot_address | 0x80000000);
 		ast_moutdwm(ast, 0x1e6e2100, 1);

 		/* Update Scratch */
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 2e44b971c..81e1317d3 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -358,7 +358,7 @@ int ast_mode_config_init(struct ast_private *ast);

 #define AST_DP501_FW_VERSION_MASK	GENMASK(7, 4)
 #define AST_DP501_FW_VERSION_1		BIT(4)
-#define AST_DP501_PNP_CONNECTED		BIT(1)
+#define AST_DP501_PNP_CONNECTED		BIT(0)

 #define AST_DP501_DEFAULT_DCLK	65


base-commit: 8953e41fa70d4507c6f5508e030347f7eda3ba8a
--
2.27.0

