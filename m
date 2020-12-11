Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E161F2D7195
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221546ECAF;
	Fri, 11 Dec 2020 08:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0CE6ECAF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 08:22:55 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0BB8JbUk086397;
 Fri, 11 Dec 2020 16:19:37 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from localhost.localdomain.com (192.168.2.206) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Dec 2020 16:22:36 +0800
From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
To: <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/ast: Fixed CVE for DP501
Date: Fri, 11 Dec 2020 16:22:29 +0800
Message-ID: <20201211082229.71269-1-kuohsiang_chou@aspeedtech.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <4d9d5c42-842b-1152-1b81-da634fe4f124@suse.de>
References: <4d9d5c42-842b-1152-1b81-da634fe4f124@suse.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.2.206]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0BB8JbUk086397
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
If ASPEED P2A (PCI to AHB) bridge is disabled and disallowed for
CVE_2019_6260 item3, and then the monitor's EDID is unable read through
Parade DP501.
The reason is the DP501's FW is mapped to BMC addressing space rather
than Host addressing space.
The resolution is that using "pci_iomap_range()" maps to DP501's FW that
stored on the end of FB (Frame Buffer).
In this case, FrameBuffer reserves the last 2MB used for the image of
DP501.

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_dp501.c | 136 +++++++++++++++++++++++---------
 drivers/gpu/drm/ast/ast_drv.h   |  12 +++
 drivers/gpu/drm/ast/ast_main.c  |   8 ++
 3 files changed, 120 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 88121c0e0d05..aef9bbace99f 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -189,6 +189,9 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size)
 	u32 i, data;
 	u32 boot_address;

+	if (ast->config_mode != ast_use_p2a)
+		return false;
+
 	data = ast_mindwm(ast, 0x1e6e2100) & 0x01;
 	if (data) {
 		boot_address = get_fw_base(ast);
@@ -207,6 +210,9 @@ static bool ast_launch_m68k(struct drm_device *dev)
 	u8 *fw_addr = NULL;
 	u8 jreg;

+	if (ast->config_mode != ast_use_p2a)
+		return false;
+
 	data = ast_mindwm(ast, 0x1e6e2100) & 0x01;
 	if (!data) {

@@ -271,25 +277,55 @@ u8 ast_get_dp501_max_clk(struct drm_device *dev)
 	struct ast_private *ast = to_ast_private(dev);
 	u32 boot_address, offset, data;
 	u8 linkcap[4], linkrate, linklanes, maxclk = 0xff;
+	u32 *plinkcap;

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
+		offset = AST_DP501_GBL_VERSION;
+		data = ast_mindwm(ast, boot_address + offset);
+		if ((data & AST_DP501_FW_VERSION_MASK) != AST_DP501_FW_VERSION_1) /* version: 1x */
+			return maxclk;
+
+		/* Read Link Capability */
+		offset  = AST_DP501_LINKRATE;
+		plinkcap = (u32 *)linkcap;
+		*plinkcap  = ast_mindwm(ast, boot_address + offset);
+		if (linkcap[2] == 0) {
+			linkrate = linkcap[0];
+			linklanes = linkcap[1];
+			data = (linkrate == 0x0a) ? (90 * linklanes) : (54 * linklanes);
+			if (data > 0xff)
+				data = 0xff;
+			maxclk = (u8)data;
+		}
+	} else {
+		if (!ast->dp501_fw_buf)
+			return AST_DP501_DEFAULT_DCLK;	/* 1024x768 as default */
+
+		/* dummy read */
+		offset = 0x0000;
+		data = readl(ast->dp501_fw_buf + offset);
+
+		/* validate FW version */
+		offset = AST_DP501_GBL_VERSION;
+		data = readl(ast->dp501_fw_buf + offset);
+		if ((data & AST_DP501_FW_VERSION_MASK) != AST_DP501_FW_VERSION_1) /* version: 1x */
+			return maxclk;
+
+		/* Read Link Capability */
+		offset = AST_DP501_LINKRATE;
+		plinkcap = (u32 *)linkcap;
+		*plinkcap = readl(ast->dp501_fw_buf + offset);
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
@@ -299,25 +335,53 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
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
+		offset = AST_DP501_GBL_VERSION;
+		data = ast_mindwm(ast, boot_address + offset);
+		if ((data & AST_DP501_FW_VERSION_MASK) != AST_DP501_FW_VERSION_1)
+			return false;
+
+		/* validate PnP Monitor */
+		offset = AST_DP501_PNPMONITOR;
+		data = ast_mindwm(ast, boot_address + offset);
+		if (!(data & AST_DP501_PNP_CONNECTED))
+			return false;
+
+		/* Read EDID */
+		offset = AST_DP501_EDID_DATA;
+		for (i = 0; i < 128; i += 4) {
+			data = ast_mindwm(ast, boot_address + offset + i);
+			writel(data, (u32 *)(ediddata + i));
+		}
+	} else {
+		if (!ast->dp501_fw_buf)
+			return false;
+
+		/* dummy read */
+		offset = 0x0000;
+		data = readl(ast->dp501_fw_buf + offset);
+
+		/* validate FW version */
+		offset = AST_DP501_GBL_VERSION;
+		data = readl(ast->dp501_fw_buf + offset);
+		if ((data & AST_DP501_FW_VERSION_MASK) != AST_DP501_FW_VERSION_1)
+			return false;
+
+		/* validate PnP Monitor */
+		offset = AST_DP501_PNPMONITOR;
+		data = readl(ast->dp501_fw_buf + offset);
+		if (!(data & AST_DP501_PNP_CONNECTED))
+			return false;
+
+		/* Read EDID */
+		offset = AST_DP501_EDID_DATA;
+		for (i = 0; i < 128; i += 4) {
+			data = readl(ast->dp501_fw_buf + offset + i);
+			writel(data, (u32 *)(ediddata + i));
+		}
 	}

 	return true;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 6b9e3b94a712..da6dfb677540 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -121,6 +121,7 @@ struct ast_private {

 	void __iomem *regs;
 	void __iomem *ioregs;
+	void __iomem *dp501_fw_buf;

 	enum ast_chip chip;
 	bool vga2_clone;
@@ -299,6 +300,17 @@ int ast_mode_config_init(struct ast_private *ast);
 #define AST_MM_ALIGN_SHIFT 4
 #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)

+#define AST_DP501_FW_VERSION_MASK	GENMASK(7, 4)
+#define AST_DP501_FW_VERSION_1		BIT(4)
+#define AST_DP501_PNP_CONNECTED	BIT(1)
+
+#define AST_DP501_DEFAULT_DCLK	65
+
+#define AST_DP501_GBL_VERSION	0xf000
+#define AST_DP501_PNPMONITOR	0xf010
+#define AST_DP501_LINKRATE	0xf014
+#define AST_DP501_EDID_DATA	0xf020
+
 int ast_mm_init(struct ast_private *ast);

 /* ast post */
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 4ec6884f6c65..3775fe26f792 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -449,6 +449,14 @@ struct ast_private *ast_device_create(struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);

+	/* map reserved buffer */
+	ast->dp501_fw_buf = NULL;
+	if (dev->vram_mm->vram_size < pci_resource_len(dev->pdev, 0)) {
+		ast->dp501_fw_buf = pci_iomap_range(dev->pdev, 0, dev->vram_mm->vram_size, 0);
+		if (!ast->dp501_fw_buf)
+			drm_info(dev, "failed to map reserved buffer!\n");
+	}
+
 	ret = ast_mode_config_init(ast);
 	if (ret)
 		return ERR_PTR(ret);
--
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
