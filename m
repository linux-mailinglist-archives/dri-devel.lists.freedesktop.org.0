Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4D63762D0
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1016EE03;
	Fri,  7 May 2021 09:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27176EE03
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 09:27:26 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1479FNxW053276;
 Fri, 7 May 2021 17:15:23 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from localhost.localdomain.com (192.168.2.206) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 May 2021 17:27:14 +0800
From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
To: <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4] drm/ast: Disable fast reset after DRAM initial
Date: Fri, 7 May 2021 17:27:08 +0800
Message-ID: <20210507092708.39552-1-kuohsiang_chou@aspeedtech.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <bbe8ccfd-7e73-e1e6-32a5-f08f71c4ed3f@suse.de>
References: <bbe8ccfd-7e73-e1e6-32a5-f08f71c4ed3f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.206]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1479FNxW053276
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
Cc: airlied@linux.ie, jenmin_yuan@aspeedtech.com, airlied@redhat.com,
 arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Bug][AST2500]

V1:
When AST2500 acts as stand-alone VGA so that DRAM and DVO initialization
have to be achieved by VGA driver with P2A (PCI to AHB) enabling.
However, HW suggests disable Fast reset mode after DRAM initializaton,
because fast reset mode is mainly designed for ARM ICE debugger.
Once Fast reset is checked as enabling, WDT (Watch Dog Timer) should be
first enabled to avoid system deadlock before disable fast reset mode.

V2:
Use to_pci_dev() to get revision of PCI configuration.

V3:
If SCU00 is not unlocked, just enter its password again.
It is unnecessary to clear AHB lock condition and restore WDT default
setting again, before Fast-reset clearing.

V4:
repatch after "error : could not build fake ancestor" resolved.

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_main.c |  4 ++
 drivers/gpu/drm/ast/ast_post.c | 68 +++++++++++++++++++++-------------
 3 files changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 911f9f414..5ebb5905d 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -346,6 +346,7 @@ bool ast_is_vga_enabled(struct drm_device *dev);
 void ast_post_gpu(struct drm_device *dev);
 u32 ast_mindwm(struct ast_private *ast, u32 r);
 void ast_moutdwm(struct ast_private *ast, u32 r, u32 v);
+void ast_patch_ahb_2500(struct ast_private *ast);
 /* ast dp501 */
 void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
 bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 2aff2e6cf..cfb56ea3a 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -97,6 +97,10 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 	jregd0 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
 	jregd1 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
 	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
+		/* Patch AST2500 */
+		if (((pdev->revision & 0xF0) == 0x40) && ((jregd0 & 0xC0) == 0))
+			ast_patch_ahb_2500(ast);
+
 		/* Double check it's actually working */
 		data = ast_read32(ast, 0xf004);
 		if ((data != 0xFFFFFFFF) && (data != 0x00)) {
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 0607658dd..56428798a 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -2028,6 +2028,30 @@ static bool ast_dram_init_2500(struct ast_private *ast)
 	return true;
 }

+void ast_patch_ahb_2500(struct ast_private *ast)
+{
+	u32	data;
+
+	/* Clear bus lock condition */
+	ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
+	ast_moutdwm(ast, 0x1e600084, 0x00010000);
+	ast_moutdwm(ast, 0x1e600088, 0x00000000);
+	ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
+	data = ast_mindwm(ast, 0x1e6e2070);
+	if (data & 0x08000000) {					/* check fast reset */
+
+		ast_moutdwm(ast, 0x1E785004, 0x00000010);
+		ast_moutdwm(ast, 0x1E785008, 0x00004755);
+		ast_moutdwm(ast, 0x1E78500c, 0x00000033);
+		udelay(1000);
+	}
+	do {
+		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
+		data = ast_mindwm(ast, 0x1e6e2000);
+	}	while (data != 1);
+	ast_moutdwm(ast, 0x1e6e207c, 0x08000000);	/* clear fast reset */
+}
+
 void ast_post_chip_2500(struct drm_device *dev)
 {
 	struct ast_private *ast = to_ast_private(dev);
@@ -2035,39 +2059,31 @@ void ast_post_chip_2500(struct drm_device *dev)
 	u8 reg;

 	reg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
-	if ((reg & 0x80) == 0) {/* vga only */
+	if ((reg & 0xC0) == 0) {/* vga only */
 		/* Clear bus lock condition */
-		ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
-		ast_moutdwm(ast, 0x1e600084, 0x00010000);
-		ast_moutdwm(ast, 0x1e600088, 0x00000000);
-		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
-		ast_write32(ast, 0xf004, 0x1e6e0000);
-		ast_write32(ast, 0xf000, 0x1);
-		ast_write32(ast, 0x12000, 0x1688a8a8);
-		while (ast_read32(ast, 0x12000) != 0x1)
-			;
-
-		ast_write32(ast, 0x10000, 0xfc600309);
-		while (ast_read32(ast, 0x10000) != 0x1)
-			;
+		ast_patch_ahb_2500(ast);
+
+		/* Disable watchdog */
+		ast_moutdwm(ast, 0x1E78502C, 0x00000000);
+		ast_moutdwm(ast, 0x1E78504C, 0x00000000);
+		/* Reset USB port */
+		ast_moutdwm(ast, 0x1E6E2090, 0x20000000);
+		ast_moutdwm(ast, 0x1E6E2094, 0x00004000);
+		if (ast_mindwm(ast, 0x1E6E2070) & 0x00800000) {
+			ast_moutdwm(ast, 0x1E6E207C, 0x00800000);
+			mdelay(100);
+			ast_moutdwm(ast, 0x1E6E2070, 0x00800000);
+		}
+		/* Modify eSPI reset pin */
+		temp = ast_mindwm(ast, 0x1E6E2070);
+		if (temp & 0x02000000)
+			ast_moutdwm(ast, 0x1E6E207C, 0x00004000);

 		/* Slow down CPU/AHB CLK in VGA only mode */
 		temp = ast_read32(ast, 0x12008);
 		temp |= 0x73;
 		ast_write32(ast, 0x12008, temp);

-		/* Reset USB port to patch USB unknown device issue */
-		ast_moutdwm(ast, 0x1e6e2090, 0x20000000);
-		temp  = ast_mindwm(ast, 0x1e6e2094);
-		temp |= 0x00004000;
-		ast_moutdwm(ast, 0x1e6e2094, temp);
-		temp  = ast_mindwm(ast, 0x1e6e2070);
-		if (temp & 0x00800000) {
-			ast_moutdwm(ast, 0x1e6e207c, 0x00800000);
-			mdelay(100);
-			ast_moutdwm(ast, 0x1e6e2070, 0x00800000);
-		}
-
 		if (!ast_dram_init_2500(ast))
 			drm_err(dev, "DRAM init failed !\n");

--
2.18.4

