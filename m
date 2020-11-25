Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C52C3B9C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144556E87C;
	Wed, 25 Nov 2020 09:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64A66E87C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 09:09:23 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0AP94FrV071855;
 Wed, 25 Nov 2020 17:04:15 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from localhost.localdomain.com (192.168.2.206) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 25 Nov 2020 17:09:14 +0800
From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
To: <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ast: Fixed CVE for DP501
Date: Wed, 25 Nov 2020 17:09:03 +0800
Message-ID: <20201125090903.4436-1-kuohsiang_chou@aspeedtech.com>
X-Mailer: git-send-email 2.18.4
MIME-Version: 1.0
X-Originating-IP: [192.168.2.206]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0AP94FrV071855
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
Cc: airlied@linux.ie, tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 airlied@redhat.com, arc_sung@aspeedtech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Bug][DP501]
1. For security concerning, P2A have to be disabled by CVE regulation.
2. FrameBuffer reverses last 2MB used for the image of DP501.
3. If P2A is disallowed, the default "ioremap()" behavior is non-cached
   and could be an alternative accessing on the image of DP501.
---
 drivers/gpu/drm/ast/ast_dp501.c | 131 +++++++++++++++++++++++---------
 drivers/gpu/drm/ast/ast_drv.h   |   2 +
 drivers/gpu/drm/ast/ast_main.c  |  12 +++
 drivers/gpu/drm/ast/ast_mm.c    |   1 +
 4 files changed, 110 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 88121c0e0d05..7640364ef2bc 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -189,6 +189,8 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size)
 	u32 i, data;
 	u32 boot_address;

+	if (ast->config_mode != ast_use_p2a) return false;
+
 	data = ast_mindwm(ast, 0x1e6e2100) & 0x01;
 	if (data) {
 		boot_address = get_fw_base(ast);
@@ -207,6 +209,8 @@ static bool ast_launch_m68k(struct drm_device *dev)
 	u8 *fw_addr = NULL;
 	u8 jreg;

+	if (ast->config_mode != ast_use_p2a) return false;
+
 	data = ast_mindwm(ast, 0x1e6e2100) & 0x01;
 	if (!data) {

@@ -272,24 +276,51 @@ u8 ast_get_dp501_max_clk(struct drm_device *dev)
 	u32 boot_address, offset, data;
 	u8 linkcap[4], linkrate, linklanes, maxclk = 0xff;

-	boot_address = get_fw_base(ast);
-
-	/* validate FW version */
-	offset = 0xf000;
-	data = ast_mindwm(ast, boot_address + offset);
-	if ((data & 0xf0) != 0x10) /* version: 1x */
-		return maxclk;
-
-	/* Read Link Capability */
-	offset  = 0xf014;
-	*(u32 *)linkcap = ast_mindwm(ast, boot_address + offset);
-	if (linkcap[2] == 0) {
-		linkrate = linkcap[0];
-		linklanes = linkcap[1];
-		data = (linkrate == 0x0a) ? (90 * linklanes) : (54 * linklanes);
-		if (data > 0xff)
-			data = 0xff;
-		maxclk = (u8)data;
+	if (ast->config_mode == ast_use_p2a) {
+		boot_address = get_fw_base(ast);
+
+		/* validate FW version */
+		offset = 0xf000;
+		data = ast_mindwm(ast, boot_address + offset);
+		if ((data & 0xf0) != 0x10) /* version: 1x */
+			return maxclk;
+
+		/* Read Link Capability */
+		offset  = 0xf014;
+		*(u32 *)linkcap = ast_mindwm(ast, boot_address + offset);
+		if (linkcap[2] == 0) {
+			linkrate = linkcap[0];
+			linklanes = linkcap[1];
+			data = (linkrate == 0x0a) ? (90 * linklanes) : (54 * linklanes);
+			if (data > 0xff)
+				data = 0xff;
+			maxclk = (u8)data;
+		}
+	}
+	else {
+		if (!ast->reservedbuffer) return 65;	/* 1024x768 as default */
+
+		/* dummy read */
+		offset = 0x0000;
+		data = *(u32 *) (ast->reservedbuffer + offset);
+
+			/* validate FW version */
+			offset = 0xf000;
+		data = *(u32 *) (ast->reservedbuffer + offset);
+			if ((data & 0xf0) != 0x10) /* version: 1x */
+				return maxclk;
+
+		/* Read Link Capability */
+		offset  = 0xf014;
+		*(u32 *)linkcap = *(u32 *) (ast->reservedbuffer + offset);
+		if (linkcap[2] == 0) {
+			linkrate = linkcap[0];
+			linklanes = linkcap[1];
+			data = (linkrate == 0x0a) ? (90 * linklanes) : (54 * linklanes);
+			if (data > 0xff)
+				data = 0xff;
+			maxclk = (u8)data;
+		}
 	}
 	return maxclk;
 }
@@ -299,25 +330,53 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
 	struct ast_private *ast = to_ast_private(dev);
 	u32 i, boot_address, offset, data;

-	boot_address = get_fw_base(ast);
-
-	/* validate FW version */
-	offset = 0xf000;
-	data = ast_mindwm(ast, boot_address + offset);
-	if ((data & 0xf0) != 0x10)
-		return false;
-
-	/* validate PnP Monitor */
-	offset = 0xf010;
-	data = ast_mindwm(ast, boot_address + offset);
-	if (!(data & 0x01))
-		return false;
+	if (ast->config_mode == ast_use_p2a) {
+		boot_address = get_fw_base(ast);

-	/* Read EDID */
-	offset = 0xf020;
-	for (i = 0; i < 128; i += 4) {
-		data = ast_mindwm(ast, boot_address + offset + i);
-		*(u32 *)(ediddata + i) = data;
+		/* validate FW version */
+		offset = 0xf000;
+		data = ast_mindwm(ast, boot_address + offset);
+		if ((data & 0xf0) != 0x10)
+			return false;
+
+		/* validate PnP Monitor */
+		offset = 0xf010;
+		data = ast_mindwm(ast, boot_address + offset);
+		if (!(data & 0x01))
+			return false;
+
+		/* Read EDID */
+		offset = 0xf020;
+		for (i = 0; i < 128; i += 4) {
+			data = ast_mindwm(ast, boot_address + offset + i);
+			*(u32 *)(ediddata + i) = data;
+		}
+	}
+	else {
+		if (!ast->reservedbuffer) return false;
+
+		/* dummy read */
+		offset = 0x0000;
+		data = *(u32 *) (ast->reservedbuffer + offset);
+
+		/* validate FW version */
+		offset = 0xf000;
+		data = *(u32 *) (ast->reservedbuffer + offset);
+		if ((data & 0xf0) != 0x10)
+			return false;
+
+		/* validate PnP Monitor */
+		offset = 0xf010;
+		data = *(u32 *) (ast->reservedbuffer + offset);
+		if (!(data & 0x01))
+			return false;
+
+		/* Read EDID */
+		offset = 0xf020;
+		for (i = 0; i < 128; i+=4) {
+			data = *(u32 *) (ast->reservedbuffer + offset + i);
+			*(u32 *)(ediddata + i) = data;
+		}
 	}

 	return true;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 6b9e3b94a712..cd17e0683fd7 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -121,12 +121,14 @@ struct ast_private {

 	void __iomem *regs;
 	void __iomem *ioregs;
+	void __iomem *reservedbuffer;

 	enum ast_chip chip;
 	bool vga2_clone;
 	uint32_t dram_bus_width;
 	uint32_t dram_type;
 	uint32_t mclk;
+	uint32_t vram_size;

 	int fb_mtrr;

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 4ec6884f6c65..4477b4cf1b06 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -393,6 +393,7 @@ static void ast_device_release(void *data)

 	/* enable standard VGA decode */
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
+	pci_iounmap(ast->base.pdev, ast->reservedbuffer);
 }

 struct ast_private *ast_device_create(struct drm_driver *drv,
@@ -449,6 +450,17 @@ struct ast_private *ast_device_create(struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);

+	/* map reserved buffer */
+	ast->reservedbuffer = NULL;
+	if (ast->vram_size < pci_resource_len(dev->pdev, 0)) {
+		ast->reservedbuffer = ioremap( \
+			pci_resource_start(ast->base.pdev, 0) + (unsigned long)ast->vram_size, \
+			pci_resource_len(dev->pdev, 0) - ast->vram_size);
+		if (!ast->reservedbuffer) {
+			DRM_INFO("failed to map reserved buffer! \n");
+		}
+	}
+
 	ret = ast_mode_config_init(ast);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 8392ebde504b..c6fd24493fb3 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -90,6 +90,7 @@ int ast_mm_init(struct ast_private *ast)
 	int ret;

 	vram_size = ast_get_vram_size(ast);
+	ast->vram_size = (uint32_t) vram_size;

 	ret = drmm_vram_helper_init(dev, pci_resource_start(dev->pdev, 0),
 				    vram_size);
--
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
