Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E03BCDED
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E9A6E3C6;
	Tue,  6 Jul 2021 11:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639846E3D0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:22:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76E3161DEF;
 Tue,  6 Jul 2021 11:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570529;
 bh=ysVl2OT27Hba9pwVg/HG/6EfbSOsjSKQPzfU8Qom1VU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uWnbbj3RAEJeXjOFRptgRxZSbaZWXf96oCTWFOg27t6eWPxol87Reqr3LskfE7T3w
 yGPr6H/cCXYWx59K7ePjfbKVhkPaduod0zYjWZSD88nZFcEMV5fT8+N41SIV8Zh4CT
 Zwy5UYj7wRWMFZFP+Dm+FqCdT7eqzvoPoGSwup5GVC/2N7BS3JzpTcdAT3sw8zge3Z
 prIkx8M2gQC8dR5y+uUkFqSfUB7CnCnyZvLmliQYPqUBliejIny55wQ0Y1Rfxjoyu7
 LqxRm5yUYWsf3uBzaVHw37Z2NItQwlVpKpDazP51FM8gmNj4LIFD4qc5bx7AET/WnM
 zq1cct0P7oHtQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 004/137] drm/ast: Fixed CVE for DP501
Date: Tue,  6 Jul 2021 07:19:50 -0400
Message-Id: <20210706112203.2062605-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112203.2062605-1-sashal@kernel.org>
References: <20210706112203.2062605-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>

[ Upstream commit ba4e0339a6a33e2ba341703ce14ae8ca203cb2f1 ]

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
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20210421085859.17761-1-kuohsiang_chou@aspeedtech.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ast/ast_dp501.c | 139 +++++++++++++++++++++++---------
 drivers/gpu/drm/ast/ast_drv.h   |  12 +++
 drivers/gpu/drm/ast/ast_main.c  |  10 ++-
 3 files changed, 124 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 88121c0e0d05..cd93c44f2662 100644
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
@@ -298,26 +334,57 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
 {
 	struct ast_private *ast = to_ast_private(dev);
 	u32 i, boot_address, offset, data;
+	u32 *pEDIDidx;
 
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
+			pEDIDidx = (u32 *)(ediddata + i);
+			*pEDIDidx = data;
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
+			pEDIDidx = (u32 *)(ediddata + i);
+			*pEDIDidx = data;
+		}
 	}
 
 	return true;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 467049ca8430..b68b1ddfecb7 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -120,6 +120,7 @@ struct ast_private {
 
 	void __iomem *regs;
 	void __iomem *ioregs;
+	void __iomem *dp501_fw_buf;
 
 	enum ast_chip chip;
 	bool vga2_clone;
@@ -298,6 +299,17 @@ int ast_mode_config_init(struct ast_private *ast);
 #define AST_MM_ALIGN_SHIFT 4
 #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)
 
+#define AST_DP501_FW_VERSION_MASK	GENMASK(7, 4)
+#define AST_DP501_FW_VERSION_1		BIT(4)
+#define AST_DP501_PNP_CONNECTED		BIT(1)
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
index 77066bca8793..5839bb9b1f58 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -98,7 +98,7 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
 		/* Double check it's actually working */
 		data = ast_read32(ast, 0xf004);
-		if (data != 0xFFFFFFFF) {
+		if ((data != 0xFFFFFFFF) && (data != 0x00)) {
 			/* P2A works, grab silicon revision */
 			ast->config_mode = ast_use_p2a;
 
@@ -446,6 +446,14 @@ struct ast_private *ast_device_create(struct drm_driver *drv,
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
2.30.2

