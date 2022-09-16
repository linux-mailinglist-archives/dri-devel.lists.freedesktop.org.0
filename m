Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2895BA92D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 11:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF7810ED08;
	Fri, 16 Sep 2022 09:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207AA10ED08
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 09:17:19 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 28G8uZ30084624;
 Fri, 16 Sep 2022 16:56:35 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 16 Sep 2022 17:17:06 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <airlied@redhat.com>, <tzimmermann@suse.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ast: Fix video broken in some resolutions on ast2600
Date: Fri, 16 Sep 2022 17:17:06 +0800
Message-ID: <20220916091706.4559-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 28G8uZ30084624
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some cases are not handled well for ast2600.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index d327dcbaf032..be9bbc888ac3 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -314,7 +314,7 @@ static void ast_set_crtc_reg(struct ast_private *ast,
 	u8 jreg05 = 0, jreg07 = 0, jreg09 = 0, jregAC = 0, jregAD = 0, jregAE = 0;
 	u16 temp, precache = 0;
 
-	if ((ast->chip == AST2500) &&
+	if ((ast->chip == AST2500 || ast->chip == AST2600) &&
 	    (vbios_mode->enh_table->flags & AST2500PreCatchCRT))
 		precache = 40;
 
@@ -355,6 +355,12 @@ static void ast_set_crtc_reg(struct ast_private *ast,
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xAC, 0x00, jregAC);
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xAD, 0x00, jregAD);
 
+	// Workaround for HSync Time non octave pixels (1920x1080@60Hz HSync 44 pixels);
+	if ((ast->chip == AST2600) && (mode->crtc_vdisplay == 1080))
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xFC, 0xFD, 0x02);
+	else
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xFC, 0xFD, 0x00);
+
 	/* vert timings */
 	temp = (mode->crtc_vtotal) - 2;
 	if (temp & 0x100)
@@ -432,7 +438,7 @@ static void ast_set_dclk_reg(struct ast_private *ast,
 {
 	const struct ast_vbios_dclk_info *clk_info;
 
-	if (ast->chip == AST2500)
+	if ((ast->chip == AST2500) || (ast->chip == AST2600))
 		clk_info = &dclk_table_ast2500[vbios_mode->enh_table->dclk_index];
 	else
 		clk_info = &dclk_table[vbios_mode->enh_table->dclk_index];
-- 
2.25.1

