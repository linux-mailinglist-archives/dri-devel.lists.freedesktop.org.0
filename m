Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CB228FFA9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 10:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324816EA8C;
	Fri, 16 Oct 2020 08:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1300 seconds by postgrey-1.36 at gabe;
 Fri, 16 Oct 2020 08:03:15 UTC
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B966EA8C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 08:03:15 +0000 (UTC)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 09G7dB7o081524
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 15:39:11 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 09G7d3Vi081501;
 Fri, 16 Oct 2020 15:39:03 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from KuoHsiang-NB.aspeed.com (192.168.2.39) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Oct
 2020 15:41:26 +0800
From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/ast: Avoid to access BMC addressing when P2A is disabled
Date: Fri, 16 Oct 2020 15:41:18 +0800
Message-ID: <1602834078-1700-1-git-send-email-kuohsiang_chou@aspeedtech.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [192.168.2.39]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09G7d3Vi081501
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
Cc: eich@suse.com, tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 airlied@redhat.com, arc_sung@aspeedtech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch is upstreamed
1. For RHEL7.x, because its native kernel is suggested to update
   from 3.10 to 4.9 on 2 ODM's platform.
2. For AST2600.
3. For ASTDP.
4. v1.11

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/Makefile          |   2 +-
 drivers/gpu/drm/ast/ast_dp.c          | 233 ++++++++++++++
 drivers/gpu/drm/ast/ast_dram_tables.h |  59 ++++
 drivers/gpu/drm/ast/ast_drv.c         |   2 +-
 drivers/gpu/drm/ast/ast_drv.h         |  31 +-
 drivers/gpu/drm/ast/ast_main.c        | 138 +++++++--
 drivers/gpu/drm/ast/ast_mode.c        | 146 +++++++--
 drivers/gpu/drm/ast/ast_post.c        | 553 ++++++++++++++++++++++++++++++----
 drivers/gpu/drm/ast/ast_tables.h      | 238 ++++++++++-----
 9 files changed, 1214 insertions(+), 188 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_dp.c

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index 171aa06..a6974af 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -4,6 +4,6 @@

 ccflags-y := -Iinclude/drm

-ast-y := ast_drv.o ast_main.o ast_mode.o ast_fb.o ast_ttm.o ast_post.o ast_dp501.o
+ast-y := ast_drv.o ast_main.o ast_mode.o ast_fb.o ast_ttm.o ast_post.o ast_dp501.o ast_dp.o

 obj-$(CONFIG_DRM_AST) := ast.o
diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
new file mode 100644
index 00000000..2231fe1
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -0,0 +1,233 @@
+#include <linux/firmware.h>
+#include <drm/drmP.h>
+#include "ast_drv.h"
+
+bool ast_dp_read_edid(struct drm_device *dev, u8 *ediddata)
+{
+    struct ast_private *ast = dev->dev_private;
+
+    u32 i;
+
+#ifdef DPControlPower
+    u8 bDPState_Change = false;
+
+    // Check DP power off or not.
+    if (ast->ASTDP_State & 0x10) {
+		// DP power on
+		ast_dp_PowerOnOff(ast->dev, 1);
+		bDPState_Change = true;
+    }
+#endif
+
+    if (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 0xFF) == 0) {
+#ifdef DPControlPower
+		// Set back power off
+		if (bDPState_Change)
+			ast_dp_PowerOnOff(ast->dev, 0);
+#endif
+		return false;
+    }
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x00, 0x00);		// reading EDID is NOT done.
+
+	for (i = 0; i < 64; i++) {
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE4, 0x00, (u8) i);
+
+		while ((ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD7, 0xFF) != 0x01)
+			|| (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD6, 0xFF) != i)) {
+			msleep(1);
+		}
+
+		*(ediddata) = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD8, 0xFF);
+		*(ediddata + 1) = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD9, 0xFF);
+		*(ediddata + 2) = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDA, 0xFF);
+		*(ediddata + 3) = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDB, 0xFF);
+
+		ediddata += 4;
+	}
+
+    ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x00, 0x01);		// reading EDID is DONE.
+
+#ifdef DPControlPower
+    // Set back power off
+	if (bDPState_Change)
+		ast_dp_PowerOnOff(ast->dev, 0);
+#endif
+
+	return true;
+
+} /* ReadEDID_AspeedDP */
+
+/*
+ * Launch Aspeed DP
+ */
+bool ast_dp_launch(struct drm_device *dev, u8 bPower)
+{
+	u32 i = 0, j = 0, WaitCount = 5;
+	u8 bDPTX = 0;
+	u8 bDPExecute = 1;
+
+	struct ast_private *ast = dev->dev_private;
+
+    // S3 come back, need more time to wait BMC ready.
+	if (bPower)
+		WaitCount = 300;
+
+    // Fill
+	ast->tx_chip_type = AST_TX_NONE;
+
+    // Wait total count by different condition.
+    // This is a temp solution for DP check
+	for (j = 0; j < WaitCount; j++) {
+		// Wait BMC ready 100ms
+		for (i = 0; i < 100; i++) {
+			// 1ms
+			msleep(1);
+		}
+
+		bDPTX = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 0x0E);
+
+		if (bDPTX)
+			break;
+	}
+
+    // 0xE : ASTDP with DPMCU FW handling
+	if (bDPTX == 0x0E) {
+		// Wait one second then timeout.
+		i = 0;
+
+		while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 0x20) != 0x20) {
+			i++;
+			// wait 1 ms
+			msleep(1);
+
+			if (i >= 1000) {
+			// DP would not be ready.
+				bDPExecute = 0;
+				break;
+			}
+		};
+
+		if (bDPExecute)
+			ast->tx_chip_type = AST_TX_ASTDP;
+
+	}
+
+	return true;
+} /* Launch Aspeed DP */
+
+#ifdef DPControlPower
+
+void ast_dp_PowerOnOff(struct drm_device *dev, u8 Mode)
+{
+	struct ast_private *ast = dev->dev_private;
+	// Read and Turn off DP PHY sleep
+	u8 bE3 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE3, 0x0F);
+
+	// Turn on DP PHY sleep
+	if (!Mode)
+		bE3 |= 0x10;
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE3, 0x00, bE3); // DP Power on / off
+
+	// Save ASTDP power state
+	ast->ASTDP_State = bE3;
+
+} /* ASTDP_SetOnOff */
+
+#endif
+
+void ast_dp_SetOnOff(struct drm_device *dev, u8 Mode)
+{
+	struct ast_private *ast = dev->dev_private;
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE3, 0x00, Mode); // video on / off
+
+    // Save ASTDP power state
+	ast->ASTDP_State = Mode;
+
+    // If DP plug in and link successful then check video on / off status
+	if (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 0x01) &&
+			ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, 0x01)) {
+		Mode <<= 4;
+		while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, 0x10) != Mode) {
+			// wait 1 ms
+			msleep(1);
+		}
+	}
+} /* ASTDP_SetOnOff */
+
+void ast_dp_SetOutput(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
+{
+	struct ast_private *ast = crtc->dev->dev_private;
+
+	u32 ulRefreshRateIndex;
+	u8 ModeIdx;
+
+	ulRefreshRateIndex = vbios_mode->enh_table->refresh_rate_index - 1;
+
+	DRM_INFO("ulRefreshRateIndex=%x\n", ulRefreshRateIndex);
+	DRM_INFO("crtc_hdisplay=%d, crtc_vdisplay=%d\n", crtc->mode.crtc_hdisplay, crtc->mode.crtc_vdisplay);
+
+	switch (crtc->mode.crtc_hdisplay) {
+	case 320:
+		ModeIdx = 0x11;
+		break;
+	case 400:
+		ModeIdx = 0x12;
+		break;
+	case 512:
+		ModeIdx = 0x13;
+		break;
+	case 640:
+		ModeIdx = (0x00 + (u8) ulRefreshRateIndex);
+		break;
+	case 800:
+		ModeIdx = (0x04 + (u8) ulRefreshRateIndex);
+		break;
+	case 1024:
+		ModeIdx = (0x09 + (u8) ulRefreshRateIndex);
+		break;
+	case 1152:
+		ModeIdx = 0x1F;
+		break;
+	case 1280:
+		if (crtc->mode.crtc_vdisplay == 800)
+			ModeIdx = (0x17 - (u8) ulRefreshRateIndex);	//RB/Non-RB
+		else		// 1024
+			ModeIdx = (0x0D + (u8) ulRefreshRateIndex);
+		break;
+	case 1360:
+	case 1366:
+		ModeIdx = 0x1E;
+		break;
+	case 1440:
+		ModeIdx = (0x19 - (u8) ulRefreshRateIndex);	//RB/Non-RB
+		break;
+	case 1600:
+		if (crtc->mode.crtc_vdisplay == 900)
+			ModeIdx = (0x1D - (u8) ulRefreshRateIndex);	//RB/Non-RB
+		else		//1200
+			ModeIdx = 0x10;
+		break;
+	case 1680:
+		ModeIdx = (0x1B - (u8) ulRefreshRateIndex);	//RB/Non-RB
+		break;
+	case 1920:
+		if (crtc->mode.crtc_vdisplay == 1080)
+			ModeIdx = 0x15;
+		else		//1200
+			ModeIdx = 0x14;
+		break;
+	default:
+		return;
+    }
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x00, 0x01);		// reading EDID is DONE.
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE0, 0x00, 0x20);		// MISC0,0x00: 18-bpp,0x20: 24-bp
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE1, 0x00, 0x00);		// MISC1 (default: 0x00)
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE2, 0x00, ModeIdx);		// indicate mode number
+
+	return;
+
+}	//ASTDP_SetOutput
diff --git a/drivers/gpu/drm/ast/ast_dram_tables.h b/drivers/gpu/drm/ast/ast_dram_tables.h
index cc04539..ccd60a1 100644
--- a/drivers/gpu/drm/ast/ast_dram_tables.h
+++ b/drivers/gpu/drm/ast/ast_dram_tables.h
@@ -141,4 +141,63 @@ static const struct ast_dramstruct ast2100_dram_table_data[] = {
 	{ 0xffff, 0xffffffff },
 };

+/*
+ * AST2500 DRAM settings modules
+ */
+#define REGTBL_NUM           17
+#define REGIDX_010           0
+#define REGIDX_014           1
+#define REGIDX_018           2
+#define REGIDX_020           3
+#define REGIDX_024           4
+#define REGIDX_02C           5
+#define REGIDX_030           6
+#define REGIDX_214           7
+#define REGIDX_2E0           8
+#define REGIDX_2E4           9
+#define REGIDX_2E8           10
+#define REGIDX_2EC           11
+#define REGIDX_2F0           12
+#define REGIDX_2F4           13
+#define REGIDX_2F8           14
+#define REGIDX_RFC           15
+#define REGIDX_PLL           16
+
+static const u32 ast2500_ddr3_1600_timing_table[REGTBL_NUM] = {
+0x64604D38,                  /* 0x010 */
+0x29690599,                  /* 0x014 */
+0x00000300,                  /* 0x018 */
+0x00000000,                  /* 0x020 */
+0x00000000,                  /* 0x024 */
+0x02181E70,                  /* 0x02C */
+0x00000040,                  /* 0x030 */
+0x00000024,                  /* 0x214 */
+0x02001300,                  /* 0x2E0 */
+0x0E0000A0,                  /* 0x2E4 */
+0x000E001B,                  /* 0x2E8 */
+0x35B8C105,                  /* 0x2EC */
+0x08090408,                  /* 0x2F0 */
+0x9B000800,                  /* 0x2F4 */
+0x0E400A00,                  /* 0x2F8 */
+0x9971452F,                  /* tRFC  */
+0x000071C1};                 /* PLL   */
+
+static const u32 ast2500_ddr4_1600_timing_table[REGTBL_NUM] = {
+0x63604E37,                  /* 0x010 */
+0xE97AFA99,                  /* 0x014 */
+0x00019000,                  /* 0x018 */
+0x08000000,                  /* 0x020 */
+0x00000400,                  /* 0x024 */
+0x00000410,                  /* 0x02C */
+0x00000101,                  /* 0x030 */
+0x00000024,                  /* 0x214 */
+0x03002900,                  /* 0x2E0 */
+0x0E0000A0,                  /* 0x2E4 */
+0x000E001C,                  /* 0x2E8 */
+0x35B8C106,                  /* 0x2EC */
+0x08080607,                  /* 0x2F0 */
+0x9B000900,                  /* 0x2F4 */
+0x0E400A00,                  /* 0x2F8 */
+0x99714545,                  /* tRFC  */
+0x000071C1};                 /* PLL   */
 #endif
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 736133f..1203f76 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -54,6 +54,7 @@ static struct drm_driver driver;
 static const struct pci_device_id pciidlist[] = {
 	AST_VGA_DEVICE(PCI_CHIP_AST2000, NULL),
 	AST_VGA_DEVICE(PCI_CHIP_AST2100, NULL),
+	AST_VGA_DEVICE(PCI_CHIP_AIP200, NULL),
 	/*	AST_VGA_DEVICE(PCI_CHIP_AST1180, NULL), - don't bind to 1180 for now */
 	{0, 0, 0},
 };
@@ -257,4 +258,3 @@ module_exit(ast_exit);
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL and additional rights");
-
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 3bedcf7..6a42183 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -45,15 +45,16 @@

 #define DRIVER_NAME		"ast"
 #define DRIVER_DESC		"AST"
-#define DRIVER_DATE		"20120228"
+#define DRIVER_DATE		"20200729"

-#define DRIVER_MAJOR		0
-#define DRIVER_MINOR		1
+#define DRIVER_MAJOR		1
+#define DRIVER_MINOR		11
 #define DRIVER_PATCHLEVEL	0

 #define PCI_CHIP_AST2000 0x2000
 #define PCI_CHIP_AST2100 0x2010
 #define PCI_CHIP_AST1180 0x1180
+#define PCI_CHIP_AIP200  0xA200


 enum ast_chip {
@@ -64,7 +65,10 @@ enum ast_chip {
 	AST2150,
 	AST2300,
 	AST2400,
+	AST2500,
+	AST2600,
 	AST1180,
+	AIP200,
 };

 enum ast_tx_chip {
@@ -72,6 +76,7 @@ enum ast_tx_chip {
 	AST_TX_SIL164,
 	AST_TX_ITE66121,
 	AST_TX_DP501,
+	AST_TX_ASTDP,
 };

 #define AST_DRAM_512Mx16 0
@@ -80,6 +85,7 @@ enum ast_tx_chip {
 #define AST_DRAM_1Gx32   3
 #define AST_DRAM_2Gx16   6
 #define AST_DRAM_4Gx16   7
+#define AST_DRAM_8Gx16   8

 struct ast_fbdev;

@@ -88,6 +94,7 @@ struct ast_private {

 	void __iomem *regs;
 	void __iomem *ioregs;
+	void __iomem *reservedbuffer;

 	enum ast_chip chip;
 	bool vga2_clone;
@@ -113,6 +120,8 @@ struct ast_private {
 	struct ttm_bo_kmap_obj cache_kmap;
 	int next_cursor;
 	bool support_wide_screen;
+	bool support_newvga_mode;
+	bool RefCLK25MHz;
 	enum {
 		ast_use_p2a,
 		ast_use_dt,
@@ -123,6 +132,9 @@ struct ast_private {
 	u8 dp501_maxclk;
 	u8 *dp501_fw_addr;
 	const struct firmware *dp501_fw;	/* dp501 fw */
+
+    // ASTDP
+    u8 ASTDP_State;
 };

 int ast_driver_load(struct drm_device *dev, unsigned long flags);
@@ -204,6 +216,8 @@ static inline void ast_open_key(struct ast_private *ast)
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0x80, 0xA8);
 }

+static inline void ast_wait_one_vsync(struct ast_private *ast);
+
 #define AST_VIDMEM_SIZE_8M    0x00800000
 #define AST_VIDMEM_SIZE_16M   0x01000000
 #define AST_VIDMEM_SIZE_32M   0x02000000
@@ -397,6 +411,7 @@ bool ast_is_vga_enabled(struct drm_device *dev);
 void ast_post_gpu(struct drm_device *dev);
 u32 ast_mindwm(struct ast_private *ast, u32 r);
 void ast_moutdwm(struct ast_private *ast, u32 r, u32 v);
+void patch_ahb_ast2500(struct ast_private *ast);
 /* ast dp501 */
 int ast_load_dp501_microcode(struct drm_device *dev);
 void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
@@ -405,4 +420,14 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
 bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
 u8 ast_get_dp501_max_clk(struct drm_device *dev);
 void ast_init_3rdtx(struct drm_device *dev);
+void ast_release_firmware(struct drm_device *dev);
+/* aspeed DP */
+#define DPControlPower
+bool ast_dp_read_edid(struct drm_device *dev, u8 *ediddata);
+bool ast_dp_launch(struct drm_device *dev, u8 bPower);
+#ifdef DPControlPower
+void ast_dp_PowerOnOff(struct drm_device *dev, u8 Mode);
+#endif
+void ast_dp_SetOnOff(struct drm_device *dev, u8 Mode);
+void ast_dp_SetOutput(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode);
 #endif
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index fabfeeb..e85e6c8 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -93,9 +93,20 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 	jregd0 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
 	jregd1 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
 	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
+		/* Patch AST2500 */
+		if (((dev->pdev->revision & 0xF0) == 0x40) && ((jregd0 & 0xC0) == 0))
+			patch_ahb_ast2500(ast);
+
 		/* Double check it's actually working */
-		data = ast_read32(ast, 0xf004);
-		if (data != 0xFFFFFFFF) {
+		if ((dev->pdev->revision & 0xF0) >= 0x30)
+			data = ast_read32(ast, 0xf004);
+		else {	/* AST2300 and before */
+			ast_write32(ast, 0xf004, 0x1e6e0000);
+			ast_write32(ast, 0xf000, 0x1);
+			data = ast_read32(ast, 0x1207c);
+		}
+//		if (data != 0xFFFFFFFF){
+		if ((data != 0xFFFFFFFF) && (data != 0x00)) {		// for AST2600, data == 0x00
 			/* P2A works, grab silicon revision */
 			ast->config_mode = ast_use_p2a;

@@ -133,8 +144,11 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)


 	/* Enable extended register access */
-	ast_enable_mmio(dev);
 	ast_open_key(ast);
+	ast_enable_mmio(dev);
+
+	/* disable standard VGA decode */
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);

 	/* Find out whether P2A works or whether to use device-tree */
 	ast_detect_config_mode(dev, &scu_rev);
@@ -143,8 +157,17 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 	if (dev->pdev->device == PCI_CHIP_AST1180) {
 		ast->chip = AST1100;
 		DRM_INFO("AST 1180 detected\n");
+	} else if (dev->pdev->device == PCI_CHIP_AIP200) {
+		ast->chip = AIP200;
+		DRM_INFO("AIP 200 detected\n");
 	} else {
-		if (dev->pdev->revision >= 0x30) {
+		if (dev->pdev->revision >= 0x50) {
+			ast->chip = AST2600;
+			DRM_INFO("AST 2600 detected\n");
+		} else if (dev->pdev->revision >= 0x40) {
+			ast->chip = AST2500;
+			DRM_INFO("AST 2500 detected\n");
+		} else if (dev->pdev->revision >= 0x30) {
 			ast->chip = AST2400;
 			DRM_INFO("AST 2400 detected\n");
 		} else if (dev->pdev->revision >= 0x20) {
@@ -176,28 +199,49 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 		}
 	}

-	/* Check if we support wide screen */
+	/* Check 25MHz Ref CLK */
+	ast->RefCLK25MHz = false;
+	if ((ast->chip == AST2400) || (ast->chip == AST2500) || (ast->chip == AST2600)) {
+		if (ast->config_mode == ast_use_p2a) {
+			jreg = ast_read32(ast, 0x12070);
+			if (jreg & 0x00800000)
+				ast->RefCLK25MHz = true;
+		} else {
+			jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
+			if (jreg & 0x04)
+				ast->RefCLK25MHz = true;
+		}
+	}
+
+	/* Check if we newvga mode & support wide screen */
+	ast->support_wide_screen = true;
 	switch (ast->chip) {
+	case AIP200:
 	case AST1180:
-		ast->support_wide_screen = true;
+		ast->support_newvga_mode = true;
 		break;
 	case AST2000:
-		ast->support_wide_screen = false;
+		ast->support_newvga_mode = false;
 		break;
 	default:
 		jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
 		if (!(jreg & 0x80))
-			ast->support_wide_screen = true;
+			ast->support_newvga_mode = true;
 		else if (jreg & 0x01)
-			ast->support_wide_screen = true;
+			ast->support_newvga_mode = true;
 		else {
-			ast->support_wide_screen = false;
+			ast->support_newvga_mode = false;
 			if (ast->chip == AST2300 &&
 			    (scu_rev & 0x300) == 0x0) /* ast1300 */
-				ast->support_wide_screen = true;
+				ast->support_newvga_mode = true;
 			if (ast->chip == AST2400 &&
 			    (scu_rev & 0x300) == 0x100) /* ast1400 */
-				ast->support_wide_screen = true;
+				ast->support_newvga_mode = true;
+			if (ast->chip == AST2500 &&
+			    scu_rev == 0x100)           /* ast2510 */
+				ast->support_newvga_mode = true;
+			if (ast->chip == AST2600)           /* ast2600 */
+				ast->support_newvga_mode = true;
 		}
 		break;
 	}
@@ -219,7 +263,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 			ast->tx_chip_type = AST_TX_SIL164;
 	}

-	if ((ast->chip == AST2300) || (ast->chip == AST2400)) {
+	if ((ast->chip == AST2300) || (ast->chip == AST2400) || (ast->chip == AST2500)) {
 		/*
 		 * On AST2300 and 2400, look the configuration set by the SoC in
 		 * the SOC scratch register #1 bits 11:8 (interestingly marked
@@ -234,7 +278,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 			ast->dp501_fw_addr = kzalloc(32*1024, GFP_KERNEL);
 			if (ast->dp501_fw_addr) {
 				/* backup firmware */
-				if (ast_backup_fw(dev, ast->dp501_fw_addr, 32*1024)) {
+				if (ast_backup_fw(dev, ast->dp501_fw_addr, 32*1024) == false) {
 					kfree(ast->dp501_fw_addr);
 					ast->dp501_fw_addr = NULL;
 				}
@@ -243,7 +287,8 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 		case 0x0c:
 			ast->tx_chip_type = AST_TX_DP501;
 		}
-	}
+	} else if (ast->chip == AST2600)
+		ast_dp_launch(ast->dev, 0);

 	/* Print stuff for diagnostic purposes */
 	switch(ast->tx_chip_type) {
@@ -253,6 +298,9 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 	case AST_TX_DP501:
 		DRM_INFO("Using DP501 DisplayPort transmitter\n");
 		break;
+	case AST_TX_ASTDP:
+		DRM_INFO("Using ASPEED DisplayPort transmitter\n");
+		break;
 	default:
 		DRM_INFO("Analog VGA only\n");
 	}
@@ -293,7 +341,10 @@ static int ast_get_dram_info(struct drm_device *dev)
 	default:
 		ast->dram_bus_width = 16;
 		ast->dram_type = AST_DRAM_1Gx16;
-		ast->mclk = 396;
+		if (ast->chip == AST2500)
+			ast->mclk = 800;
+		else
+			ast->mclk = 396;
 		return 0;
 	}

@@ -302,7 +353,23 @@ static int ast_get_dram_info(struct drm_device *dev)
 	else
 		ast->dram_bus_width = 32;

-	if (ast->chip == AST2300 || ast->chip == AST2400) {
+	if (ast->chip == AST2500) {
+		switch (mcr_cfg & 0x03) {
+		case 0:
+			ast->dram_type = AST_DRAM_1Gx16;
+			break;
+		default:
+		case 1:
+			ast->dram_type = AST_DRAM_2Gx16;
+			break;
+		case 2:
+			ast->dram_type = AST_DRAM_4Gx16;
+			break;
+		case 3:
+			ast->dram_type = AST_DRAM_8Gx16;
+			break;
+		}
+	} else if (ast->chip == AST2300 || ast->chip == AST2400) {
 		switch (mcr_cfg & 0x03) {
 		case 0:
 			ast->dram_type = AST_DRAM_512Mx16;
@@ -356,7 +423,7 @@ static int ast_get_dram_info(struct drm_device *dev)
 		div = 0x1;
 		break;
 	}
-	ast->mclk = ref_pll * (num + 2) / (denum + 2) * (div * 1000);
+	ast->mclk = ref_pll * (num + 2) / ((denum + 2) * (div * 1000));
 	return 0;
 }

@@ -495,21 +562,32 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)

 	ast_detect_chip(dev, &need_post);

+	if (need_post)
+		ast_post_gpu(dev);
+
 	if (ast->chip != AST1180) {
 		ret = ast_get_dram_info(dev);
 		if (ret)
 			goto out_free;
 		ast->vram_size = ast_get_vram_info(dev);
-		DRM_INFO("dram %d %d %d %08x\n", ast->mclk, ast->dram_type, ast->dram_bus_width, ast->vram_size);
+		DRM_INFO("dram MCLK=%u Mhz type=%d bus_width=%d size=%08x\n",
+			 ast->mclk, ast->dram_type,
+			 ast->dram_bus_width, ast->vram_size);
 	}

-	if (need_post)
-		ast_post_gpu(dev);
-
 	ret = ast_mm_init(ast);
 	if (ret)
 		goto out_free;

+	/* map reserved buffer */
+	ast->reservedbuffer = NULL;
+	if (ast->vram_size < pci_resource_len(dev->pdev, 0)) {
+		ast->reservedbuffer = ioremap_nocache(pci_resource_start(ast->dev->pdev, 0) + (unsigned long)ast->vram_size, \
+											 pci_resource_len(dev->pdev, 0) - ast->vram_size);
+		if (!ast->reservedbuffer)
+			DRM_INFO("failed to map reserved buffer! \n");
+	}
+
 	drm_mode_config_init(dev);

 	dev->mode_config.funcs = (void *)&ast_mode_funcs;
@@ -523,6 +601,9 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 	    ast->chip == AST2200 ||
 	    ast->chip == AST2300 ||
 	    ast->chip == AST2400 ||
+	    ast->chip == AST2500 ||
+	    ast->chip == AST2600 ||
+	    ast->chip == AIP200  ||
 	    ast->chip == AST1180) {
 		dev->mode_config.max_width = 1920;
 		dev->mode_config.max_height = 2048;
@@ -550,6 +631,10 @@ int ast_driver_unload(struct drm_device *dev)
 {
 	struct ast_private *ast = dev->dev_private;

+	/* enable standard VGA decode */
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
+
+	ast_release_firmware(dev);
 	kfree(ast->dp501_fw_addr);
 	ast_mode_fini(dev);
 	ast_fbdev_fini(dev);
@@ -657,3 +742,12 @@ ast_dumb_mmap_offset(struct drm_file *file,

 }

+static inline void ast_wait_one_vsync(struct ast_private *ast)
+{
+    while (!(ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ) & 0x8))
+		;
+    while ((ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ) & 0x8))
+		;
+    while (!(ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ) & 0x8))
+		;
+}
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 201874b..3a9bcf5 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -112,6 +112,9 @@ static bool ast_get_vbios_mode_info(struct drm_crtc *crtc, struct drm_display_mo
 	case 1024:
 		vbios_mode->enh_table = &res_1024x768[refresh_rate_index];
 		break;
+	case 1152:
+		vbios_mode->enh_table = &res_1152x864[refresh_rate_index];
+		break;
 	case 1280:
 		if (crtc->mode.crtc_vdisplay == 800)
 			vbios_mode->enh_table = &res_1280x800[refresh_rate_index];
@@ -271,7 +274,11 @@ static void ast_set_crtc_reg(struct drm_crtc *crtc, struct drm_display_mode *mod
 {
 	struct ast_private *ast = crtc->dev->dev_private;
 	u8 jreg05 = 0, jreg07 = 0, jreg09 = 0, jregAC = 0, jregAD = 0, jregAE = 0;
-	u16 temp;
+	u16 temp, precache = 0;
+
+	if (((ast->chip == AST2500) || (ast->chip == AST2600)) &&
+		(vbios_mode->enh_table->flags & AST2500PreCatchCRT))
+		precache = 40;

 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0x11, 0x7f, 0x00);

@@ -297,12 +304,12 @@ static void ast_set_crtc_reg(struct drm_crtc *crtc, struct drm_display_mode *mod
 		jregAD |= 0x01;  /* HBE D[5] */
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0x03, 0xE0, (temp & 0x1f));

-	temp = (mode->crtc_hsync_start >> 3) - 1;
+	temp = ((mode->crtc_hsync_start-precache) >> 3) - 1;
 	if (temp & 0x100)
 		jregAC |= 0x40; /* HRS D[5] */
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0x04, 0x00, temp);

-	temp = ((mode->crtc_hsync_end >> 3) - 1) & 0x3f;
+	temp = (((mode->crtc_hsync_end-precache) >> 3) - 1) & 0x3f;
 	if (temp & 0x20)
 		jregAD |= 0x04; /* HRE D[5] */
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0x05, 0x60, (u8)((temp & 0x1f) | jreg05));
@@ -310,6 +317,12 @@ static void ast_set_crtc_reg(struct drm_crtc *crtc, struct drm_display_mode *mod
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xAC, 0x00, jregAC);
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xAD, 0x00, jregAD);

+	//HSync Time non octave pixels (1920x1080@60Hz HSync 44 pixels); VGACRFC[1]=1 for 1080p only.
+	if ((ast->chip == AST2600) && (crtc->mode.crtc_vdisplay == 1080))
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xFC, 0xFD, 0x02);
+	else
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xFC, 0xFD, 0x00);
+
 	/* vert timings */
 	temp = (mode->crtc_vtotal) - 2;
 	if (temp & 0x100)
@@ -363,6 +376,11 @@ static void ast_set_crtc_reg(struct drm_crtc *crtc, struct drm_display_mode *mod
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0x09, 0xdf, jreg09);
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xAE, 0x00, (jregAE | 0x80));

+	if (precache)
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0x3f, 0x80);
+	else
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0x3f, 0x00);
+
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0x11, 0x7f, 0x80);
 }

@@ -381,14 +399,25 @@ static void ast_set_dclk_reg(struct drm_device *dev, struct drm_display_mode *mo
 			     struct ast_vbios_mode_info *vbios_mode)
 {
 	struct ast_private *ast = dev->dev_private;
-	struct ast_vbios_dclk_info *clk_info;
+	const struct ast_vbios_dclk_info *clk_info;

-	clk_info = &dclk_table[vbios_mode->enh_table->dclk_index];
+	if ((ast->chip == AST2500) || (ast->chip == AST2600)) {
+		if (ast->RefCLK25MHz)
+			clk_info = &dclk_table_ast2500_25MHz[vbios_mode->enh_table->dclk_index];
+		else
+			clk_info = &dclk_table_ast2500[vbios_mode->enh_table->dclk_index];
+	} else {
+		if (ast->RefCLK25MHz)
+			clk_info = &dclk_table_25MHz[vbios_mode->enh_table->dclk_index];
+		else
+			clk_info = &dclk_table[vbios_mode->enh_table->dclk_index];
+	}

 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xc0, 0x00, clk_info->param1);
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xc1, 0x00, clk_info->param2);
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xbb, 0x0f,
-			       (clk_info->param3 & 0x80) | ((clk_info->param3 & 0x3) << 4));
+			       (clk_info->param3 & 0xc0) |
+			       ((clk_info->param3 & 0x3) << 4));
 }

 static void ast_set_ext_reg(struct drm_crtc *crtc, struct drm_display_mode *mode,
@@ -421,7 +450,7 @@ static void ast_set_ext_reg(struct drm_crtc *crtc, struct drm_display_mode *mode
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xa8, 0xfd, jregA8);

 	/* Set Threshold */
-	if (ast->chip == AST2300 || ast->chip == AST2400) {
+	if (ast->chip == AST2300 || ast->chip == AST2400 || ast->chip == AST2500 || ast->chip == AST2600 || ast->chip == AIP200) {
 		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa7, 0x78);
 		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa6, 0x60);
 	} else if (ast->chip == AST2100 ||
@@ -456,6 +485,7 @@ static bool ast_set_dac_reg(struct drm_crtc *crtc, struct drm_display_mode *mode
 	case 8:
 		break;
 	default:
+		ast_crtc_load_lut(crtc);
 		return false;
 	}
 	return true;
@@ -476,23 +506,45 @@ static void ast_set_start_address_crt1(struct drm_crtc *crtc, unsigned offset)
 static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct ast_private *ast = crtc->dev->dev_private;
+	u8 ch = 0x03;

 	if (ast->chip == AST1180)
 		return;

 	switch (mode) {
 	case DRM_MODE_DPMS_ON:
-	case DRM_MODE_DPMS_STANDBY:
-	case DRM_MODE_DPMS_SUSPEND:
-		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0);
+		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0);
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, 0);
 		if (ast->tx_chip_type == AST_TX_DP501)
 			ast_set_dp501_video_output(crtc->dev, 1);
+
+		if (ast->tx_chip_type == AST_TX_ASTDP) {
+#ifdef DPControlPower
+			ast_dp_PowerOnOff(crtc->dev, 1);
+#endif
+			ast_wait_one_vsync(ast);
+			ast_dp_SetOnOff(crtc->dev, 1);
+		}
+
 		ast_crtc_load_lut(crtc);
 		break;
+	case DRM_MODE_DPMS_STANDBY:
+		ch = 0x01;
+	case DRM_MODE_DPMS_SUSPEND:
+		ch = 0x02;
 	case DRM_MODE_DPMS_OFF:
 		if (ast->tx_chip_type == AST_TX_DP501)
 			ast_set_dp501_video_output(crtc->dev, 0);
-		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x20);
+
+		if (ast->tx_chip_type == AST_TX_ASTDP) {
+			ast_dp_SetOnOff(crtc->dev, 0);
+#ifdef DPControlPower
+			ast_dp_PowerOnOff(crtc->dev, 0);
+#endif
+		}
+
+		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0x20);
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, ch);
 		break;
 	}
 }
@@ -577,7 +629,7 @@ static int ast_crtc_mode_set(struct drm_crtc *crtc,
 		return -EINVAL;
 	ast_open_key(ast);

-	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xa1, 0xff, 0x04);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);

 	ast_set_std_reg(crtc, adjusted_mode, &vbios_mode);
 	ast_set_crtc_reg(crtc, adjusted_mode, &vbios_mode);
@@ -589,12 +641,33 @@ static int ast_crtc_mode_set(struct drm_crtc *crtc,

 	ast_crtc_mode_set_base(crtc, x, y, old_fb);

+    //Set Aspeed Display-Port
+	if (ast->tx_chip_type == AST_TX_ASTDP) {
+		ast_dp_SetOutput(crtc, &vbios_mode);
+    }
+
 	return 0;
 }

 static void ast_crtc_disable(struct drm_crtc *crtc)
 {
+	int ret;
+
+	DRM_DEBUG_KMS("\n");
+	ast_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
+	if (crtc->primary->fb) {
+		struct ast_framebuffer *ast_fb = to_ast_framebuffer(crtc->primary->fb);
+		struct drm_gem_object *obj = ast_fb->obj;
+		struct ast_bo *bo = gem_to_ast_bo(obj);
+
+		ret = ast_bo_reserve(bo, false);
+		if (ret)
+			return;

+		ast_bo_push_sysram(bo);
+		ast_bo_unreserve(bo);
+	}
+	crtc->primary->fb = NULL;
 }

 static void ast_crtc_prepare(struct drm_crtc *crtc)
@@ -604,8 +677,7 @@ static void ast_crtc_prepare(struct drm_crtc *crtc)

 static void ast_crtc_commit(struct drm_crtc *crtc)
 {
-	struct ast_private *ast = crtc->dev->dev_private;
-	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0);
+	ast_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
 }


@@ -763,7 +835,21 @@ static int ast_get_modes(struct drm_connector *connector)
 			ast->dp501_maxclk = ast_get_dp501_max_clk(connector->dev);
 		else
 			kfree(edid);
+	} else if (ast->tx_chip_type == AST_TX_ASTDP) {
+		edid = kmalloc(256, GFP_KERNEL);
+
+		if (!edid)
+			return -ENOMEM;
+
+		flags = ast_dp_read_edid(connector->dev, (u8 *)edid);
+		if (!flags) {
+			DRM_INFO("ReadEDID_AspeedDP(!flags)\n");
+			kfree(edid);
+		}
 	}
+
+
+
 	if (!flags)
 		edid = drm_get_edid(connector, &ast_connector->i2c->adapter);
 	if (edid) {
@@ -783,7 +869,11 @@ static int ast_mode_valid(struct drm_connector *connector,
 	int flags = MODE_NOMODE;
 	uint32_t jtemp;

-	if (ast->support_wide_screen) {
+	if (ast->support_newvga_mode) {
+		if ((mode->hdisplay == 1152) && (mode->vdisplay == 864))
+			return MODE_OK;
+	}
+	if ((ast->support_wide_screen) && (ast->support_newvga_mode)) {
 		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
 			return MODE_OK;
 		if ((mode->hdisplay == 1280) && (mode->vdisplay == 800))
@@ -795,7 +885,7 @@ static int ast_mode_valid(struct drm_connector *connector,
 		if ((mode->hdisplay == 1600) && (mode->vdisplay == 900))
 			return MODE_OK;

-		if ((ast->chip == AST2100) || (ast->chip == AST2200) || (ast->chip == AST2300) || (ast->chip == AST2400) || (ast->chip == AST1180)) {
+		if ((ast->chip == AST2100) || (ast->chip == AST2200) || (ast->chip == AST2300) || (ast->chip == AST2400) || (ast->chip == AST2500) || (ast->chip == AST2600) || (ast->chip == AST1180) || ast->chip == AIP200) {
 			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
 				return MODE_OK;

@@ -954,18 +1044,18 @@ static int get_clock(void *i2c_priv)
 {
 	struct ast_i2c_chan *i2c = i2c_priv;
 	struct ast_private *ast = i2c->dev->dev_private;
-	uint32_t val, val2, count, pass;
+	volatile uint32_t val, val2, count, pass;

 	count = 0;
-	pass = 0;
-	val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
+	pass  = 0;
+	val   = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
 	do {
 		val2 = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
-		if (val == val2) {
+		if (val == val2)
 			pass++;
-		} else {
+		else {
 			pass = 0;
-			val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
+			val   = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
 		}
 	} while ((pass < 5) && (count++ < 0x10000));

@@ -976,18 +1066,18 @@ static int get_data(void *i2c_priv)
 {
 	struct ast_i2c_chan *i2c = i2c_priv;
 	struct ast_private *ast = i2c->dev->dev_private;
-	uint32_t val, val2, count, pass;
+	volatile uint32_t val, val2, count, pass;

 	count = 0;
-	pass = 0;
-	val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
+	pass  = 0;
+	val   = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
 	do {
 		val2 = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
-		if (val == val2) {
+		if (val == val2)
 			pass++;
-		} else {
+		else {
 			pass = 0;
-			val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
+			val   = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
 		}
 	} while ((pass < 5) && (count++ < 0x10000));

diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index c7c58be..e3cfb42 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -31,21 +31,24 @@

 #include "ast_dram_tables.h"

-static void ast_init_dram_2300(struct drm_device *dev);
+static void ast_post_chip_2300(struct drm_device *dev);
+static void ast_post_chip_2500(struct drm_device *dev);

 void ast_enable_vga(struct drm_device *dev)
 {
 	struct ast_private *ast = dev->dev_private;
+	u8 ch;

 	ast_io_write8(ast, AST_IO_VGA_ENABLE_PORT, 0x01);
-	ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, 0x01);
+	ch = ast_io_read8(ast, AST_IO_MISC_PORT_READ);
+	ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, ch | 0x01);
 }

 void ast_enable_mmio(struct drm_device *dev)
 {
 	struct ast_private *ast = dev->dev_private;

-	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xa1, 0xff, 0x04);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
 }


@@ -75,10 +78,10 @@ ast_set_def_ext_reg(struct drm_device *dev)
 	const u8 *ext_reg_info;

 	/* reset scratch */
-	for (i = 0x81; i <= 0x8f; i++)
+	for (i = 0x81; i <= 0x9f; i++)
 		ast_set_index_reg(ast, AST_IO_CRTC_PORT, i, 0x00);

-	if (ast->chip == AST2300 || ast->chip == AST2400) {
+	if (ast->chip == AST2300 || ast->chip == AST2400 || ast->chip == AST2500 || ast->chip == AST2600 || ast->chip == AIP200) {
 		if (dev->pdev->revision >= 0x20)
 			ext_reg_info = extreginfo_ast2300;
 		else
@@ -102,9 +105,13 @@ ast_set_def_ext_reg(struct drm_device *dev)

 	/* Enable RAMDAC for A1 */
 	reg = 0x04;
-	if (ast->chip == AST2300 || ast->chip == AST2400)
+	if (ast->chip == AST2300 || ast->chip == AST2400 || ast->chip == AST2500 || ast->chip == AST2600 || ast->chip == AIP200)
 		reg |= 0x20;
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xff, reg);
+
+	/* Screen off */
+	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xff, 0x20);	// for AST2600 SLT testing
+	udelay(10);
 }

 u32 ast_mindwm(struct ast_private *ast, u32 r)
@@ -375,9 +382,13 @@ void ast_post_gpu(struct drm_device *dev)
 	ast_enable_mmio(dev);
 	ast_set_def_ext_reg(dev);

-	if (ast->config_mode == ast_use_p2a) {
-		if (ast->chip == AST2300 || ast->chip == AST2400)
-			ast_init_dram_2300(dev);
+	if (ast->chip == AST2600) {
+		ast_dp_launch(dev, 1);
+	} else if (ast->config_mode == ast_use_p2a) {
+		if (ast->chip == AST2500)
+			ast_post_chip_2500(dev);
+		else if (ast->chip == AST2300 || ast->chip == AST2400)
+			ast_post_chip_2300(dev);
 		else
 			ast_init_dram_reg(dev);

@@ -441,85 +452,70 @@ static const u32 pattern[8] = {
 	0x7C61D253
 };

-static int mmc_test_burst(struct ast_private *ast, u32 datagen)
+static bool mmc_test(struct ast_private *ast, u32 datagen, u8 test_ctl)
 {
 	u32 data, timeout;

 	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-	ast_moutdwm(ast, 0x1e6e0070, 0x000000c1 | (datagen << 3));
+	ast_moutdwm(ast, 0x1e6e0070, (datagen << 3) | test_ctl);
 	timeout = 0;
 	do {
 		data = ast_mindwm(ast, 0x1e6e0070) & 0x3000;
-		if (data & 0x2000) {
-			return 0;
-		}
+		if (data & 0x2000)
+			return false;
 		if (++timeout > TIMEOUT) {
 			ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-			return 0;
+			return false;
 		}
 	} while (!data);
-	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-	return 1;
+	ast_moutdwm(ast, 0x1e6e0070, 0x0);
+	return true;
 }

-static int mmc_test_burst2(struct ast_private *ast, u32 datagen)
+static u32 mmc_test2(struct ast_private *ast, u32 datagen, u8 test_ctl)
 {
 	u32 data, timeout;

 	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-	ast_moutdwm(ast, 0x1e6e0070, 0x00000041 | (datagen << 3));
+	ast_moutdwm(ast, 0x1e6e0070, (datagen << 3) | test_ctl);
 	timeout = 0;
 	do {
 		data = ast_mindwm(ast, 0x1e6e0070) & 0x1000;
 		if (++timeout > TIMEOUT) {
 			ast_moutdwm(ast, 0x1e6e0070, 0x0);
-			return -1;
+			return 0xffffffff;
 		}
 	} while (!data);
 	data = ast_mindwm(ast, 0x1e6e0078);
 	data = (data | (data >> 16)) & 0xffff;
-	ast_moutdwm(ast, 0x1e6e0070, 0x0);
+	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
 	return data;
 }

-static int mmc_test_single(struct ast_private *ast, u32 datagen)
+
+static bool mmc_test_burst(struct ast_private *ast, u32 datagen)
 {
-	u32 data, timeout;
+	return mmc_test(ast, datagen, 0xc1);
+}

-	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-	ast_moutdwm(ast, 0x1e6e0070, 0x000000c5 | (datagen << 3));
-	timeout = 0;
-	do {
-		data = ast_mindwm(ast, 0x1e6e0070) & 0x3000;
-		if (data & 0x2000)
-			return 0;
-		if (++timeout > TIMEOUT) {
-			ast_moutdwm(ast, 0x1e6e0070, 0x0);
-			return 0;
-		}
-	} while (!data);
-	ast_moutdwm(ast, 0x1e6e0070, 0x0);
-	return 1;
+static u32 mmc_test_burst2(struct ast_private *ast, u32 datagen)
+{
+	return mmc_test2(ast, datagen, 0x41);
 }

-static int mmc_test_single2(struct ast_private *ast, u32 datagen)
+static bool mmc_test_single(struct ast_private *ast, u32 datagen)
 {
-	u32 data, timeout;
+	return mmc_test(ast, datagen, 0xc5);
+}

-	ast_moutdwm(ast, 0x1e6e0070, 0x00000000);
-	ast_moutdwm(ast, 0x1e6e0070, 0x00000005 | (datagen << 3));
-	timeout = 0;
-	do {
-		data = ast_mindwm(ast, 0x1e6e0070) & 0x1000;
-		if (++timeout > TIMEOUT) {
-			ast_moutdwm(ast, 0x1e6e0070, 0x0);
-			return -1;
-		}
-	} while (!data);
-	data = ast_mindwm(ast, 0x1e6e0078);
-	data = (data | (data >> 16)) & 0xffff;
-	ast_moutdwm(ast, 0x1e6e0070, 0x0);
-	return data;
+static u32 mmc_test_single2(struct ast_private *ast, u32 datagen)
+{
+	return mmc_test2(ast, datagen, 0x05);
+}
+
+static bool mmc_test_single_2500(struct ast_private *ast, u32 datagen)
+{
+	return mmc_test(ast, datagen, 0x85);
 }

 static int cbr_test(struct ast_private *ast)
@@ -597,16 +593,16 @@ static u32 cbr_scan2(struct ast_private *ast)
 	return data2;
 }

-static u32 cbr_test3(struct ast_private *ast)
+static bool cbr_test3(struct ast_private *ast)
 {
 	if (!mmc_test_burst(ast, 0))
-		return 0;
+		return false;
 	if (!mmc_test_single(ast, 0))
-		return 0;
-	return 1;
+		return false;
+	return true;
 }

-static u32 cbr_scan3(struct ast_private *ast)
+static bool cbr_scan3(struct ast_private *ast)
 {
 	u32 patcnt, loop;

@@ -617,9 +613,9 @@ static u32 cbr_scan3(struct ast_private *ast)
 				break;
 		}
 		if (loop == 2)
-			return 0;
+			return false;
 	}
-	return 1;
+	return true;
 }

 static bool finetuneDQI_L(struct ast_private *ast, struct ast2300_dram_param *param)
@@ -1605,7 +1601,7 @@ static void ddr2_init(struct ast_private *ast, struct ast2300_dram_param *param)

 }

-static void ast_init_dram_2300(struct drm_device *dev)
+static void ast_post_chip_2300(struct drm_device *dev)
 {
 	struct ast_private *ast = dev->dev_private;
 	struct ast2300_dram_param param;
@@ -1636,7 +1632,7 @@ static void ast_init_dram_2300(struct drm_device *dev)
 		temp = ast_mindwm(ast, 0x1e6e2070);
 		if (temp & 0x01000000)
 			param.dram_type = AST_DDR2;
-                switch (temp & 0x18000000) {
+				switch (temp & 0x18000000) {
 		case 0:
 			param.dram_chipid = AST_DRAM_512Mx16;
 			break;
@@ -1651,8 +1647,8 @@ static void ast_init_dram_2300(struct drm_device *dev)
 			param.dram_chipid = AST_DRAM_4Gx16;
 			break;
 		}
-                switch (temp & 0x0c) {
-                default:
+				switch (temp & 0x0c) {
+				default:
 		case 0x00:
 			param.vram_size = AST_VIDMEM_SIZE_8M;
 			break;
@@ -1688,3 +1684,432 @@ static void ast_init_dram_2300(struct drm_device *dev)
 	} while ((reg & 0x40) == 0);
 }

+static bool cbr_test_2500(struct ast_private *ast)
+{
+	ast_moutdwm(ast, 0x1E6E0074, 0x0000FFFF);
+	ast_moutdwm(ast, 0x1E6E007C, 0xFF00FF00);
+	if (!mmc_test_burst(ast, 0))
+		return false;
+	if (!mmc_test_single_2500(ast, 0))
+		return false;
+	return true;
+}
+
+static bool ddr_test_2500(struct ast_private *ast)
+{
+	ast_moutdwm(ast, 0x1E6E0074, 0x0000FFFF);
+	ast_moutdwm(ast, 0x1E6E007C, 0xFF00FF00);
+	if (!mmc_test_burst(ast, 0))
+		return false;
+	if (!mmc_test_burst(ast, 1))
+		return false;
+	if (!mmc_test_burst(ast, 2))
+		return false;
+	if (!mmc_test_burst(ast, 3))
+		return false;
+	if (!mmc_test_single_2500(ast, 0))
+		return false;
+	return true;
+}
+
+static void ddr_init_common_2500(struct ast_private *ast)
+{
+	ast_moutdwm(ast, 0x1E6E0034, 0x00020080);
+	ast_moutdwm(ast, 0x1E6E0008, 0x2003000F);
+	ast_moutdwm(ast, 0x1E6E0038, 0x00000FFF);
+	ast_moutdwm(ast, 0x1E6E0040, 0x88448844);
+	ast_moutdwm(ast, 0x1E6E0044, 0x24422288);
+	ast_moutdwm(ast, 0x1E6E0048, 0x22222222);
+	ast_moutdwm(ast, 0x1E6E004C, 0x22222222);
+	ast_moutdwm(ast, 0x1E6E0050, 0x80000000);
+	ast_moutdwm(ast, 0x1E6E0208, 0x00000000);
+	ast_moutdwm(ast, 0x1E6E0218, 0x00000000);
+	ast_moutdwm(ast, 0x1E6E0220, 0x00000000);
+	ast_moutdwm(ast, 0x1E6E0228, 0x00000000);
+	ast_moutdwm(ast, 0x1E6E0230, 0x00000000);
+	ast_moutdwm(ast, 0x1E6E02A8, 0x00000000);
+	ast_moutdwm(ast, 0x1E6E02B0, 0x00000000);
+	ast_moutdwm(ast, 0x1E6E0240, 0x86000000);
+	ast_moutdwm(ast, 0x1E6E0244, 0x00008600);
+	ast_moutdwm(ast, 0x1E6E0248, 0x80000000);
+	ast_moutdwm(ast, 0x1E6E024C, 0x80808080);
+}
+
+static void ddr_phy_init_2500(struct ast_private *ast)
+{
+	u32 data, pass, timecnt;
+
+	pass = 0;
+	ast_moutdwm(ast, 0x1E6E0060, 0x00000005);
+	while (!pass) {
+		for (timecnt = 0; timecnt < TIMEOUT; timecnt++) {
+			data = ast_mindwm(ast, 0x1E6E0060) & 0x1;
+			if (!data)
+				break;
+		}
+		if (timecnt != TIMEOUT) {
+			data = ast_mindwm(ast, 0x1E6E0300) & 0x000A0000;
+			if (!data)
+				pass = 1;
+		}
+		if (!pass) {
+			ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
+			udelay(10); /* delay 10 us */
+			ast_moutdwm(ast, 0x1E6E0060, 0x00000005);
+		}
+	}
+
+	ast_moutdwm(ast, 0x1E6E0060, 0x00000006);
+}
+
+/*
+ * Check DRAM Size
+ * 1Gb : 0x80000000 ~ 0x87FFFFFF
+ * 2Gb : 0x80000000 ~ 0x8FFFFFFF
+ * 4Gb : 0x80000000 ~ 0x9FFFFFFF
+ * 8Gb : 0x80000000 ~ 0xBFFFFFFF
+ */
+static void check_dram_size_2500(struct ast_private *ast, u32 tRFC)
+{
+	u32 reg_04, reg_14;
+
+	reg_04 = ast_mindwm(ast, 0x1E6E0004) & 0xfffffffc;
+	reg_14 = ast_mindwm(ast, 0x1E6E0014) & 0xffffff00;
+
+	ast_moutdwm(ast, 0xA0100000, 0x41424344);
+	ast_moutdwm(ast, 0x90100000, 0x35363738);
+	ast_moutdwm(ast, 0x88100000, 0x292A2B2C);
+	ast_moutdwm(ast, 0x80100000, 0x1D1E1F10);
+
+	/* Check 8Gbit */
+	if (ast_mindwm(ast, 0xA0100000) == 0x41424344) {
+		reg_04 |= 0x03;
+		reg_14 |= (tRFC >> 24) & 0xFF;
+		/* Check 4Gbit */
+	} else if (ast_mindwm(ast, 0x90100000) == 0x35363738) {
+		reg_04 |= 0x02;
+		reg_14 |= (tRFC >> 16) & 0xFF;
+		/* Check 2Gbit */
+	} else if (ast_mindwm(ast, 0x88100000) == 0x292A2B2C) {
+		reg_04 |= 0x01;
+		reg_14 |= (tRFC >> 8) & 0xFF;
+	} else {
+		reg_14 |= tRFC & 0xFF;
+	}
+	ast_moutdwm(ast, 0x1E6E0004, reg_04);
+	ast_moutdwm(ast, 0x1E6E0014, reg_14);
+}
+
+static void enable_cache_2500(struct ast_private *ast)
+{
+	u32 reg_04, data;
+
+	reg_04 = ast_mindwm(ast, 0x1E6E0004);
+	ast_moutdwm(ast, 0x1E6E0004, reg_04 | 0x1000);
+
+	do
+		data = ast_mindwm(ast, 0x1E6E0004);
+	while (!(data & 0x80000));
+	ast_moutdwm(ast, 0x1E6E0004, reg_04 | 0x400);
+}
+
+static void set_mpll_2500(struct ast_private *ast)
+{
+	u32 addr, data, param;
+
+	/* Reset MMC */
+	ast_moutdwm(ast, 0x1E6E0000, 0xFC600309);
+	ast_moutdwm(ast, 0x1E6E0034, 0x00020080);
+	for (addr = 0x1e6e0004; addr < 0x1e6e0090;) {
+		ast_moutdwm(ast, addr, 0x0);
+		addr += 4;
+	}
+	ast_moutdwm(ast, 0x1E6E0034, 0x00020000);
+
+	ast_moutdwm(ast, 0x1E6E2000, 0x1688A8A8);
+	data = ast_mindwm(ast, 0x1E6E2070) & 0x00800000;
+	if (data) {
+		/* CLKIN = 25MHz */
+		param = 0x930023E0;
+		ast_moutdwm(ast, 0x1E6E2160, 0x00011320);
+	} else {
+		/* CLKIN = 24MHz */
+		param = 0x93002400;
+	}
+	ast_moutdwm(ast, 0x1E6E2020, param);
+	udelay(100);
+}
+
+static void reset_mmc_2500(struct ast_private *ast)
+{
+	u32 data;
+
+	ast_moutdwm(ast, 0x1E78505C, 0x00000004);
+	ast_moutdwm(ast, 0x1E785044, 0x00000001);
+	ast_moutdwm(ast, 0x1E785048, 0x00004755);
+	ast_moutdwm(ast, 0x1E78504C, 0x00000013);
+	mdelay(100);
+	ast_moutdwm(ast, 0x1E78505c, 0x023FFFF3);
+	ast_moutdwm(ast, 0x1E785054, 0x00000077);
+	do {
+		ast_moutdwm(ast, 0x1E6E0000, 0xFC600309);
+		data = ast_mindwm(ast, 0x1E6E0000);
+	} while (data == 0);
+	ast_moutdwm(ast, 0x1E6E0034, 0x00020000);
+}
+
+static void ddr3_init_2500(struct ast_private *ast, const u32 *ddr_table)
+{
+
+	ast_moutdwm(ast, 0x1E6E0004, 0x00000303);
+	ast_moutdwm(ast, 0x1E6E0010, ddr_table[REGIDX_010]);
+	ast_moutdwm(ast, 0x1E6E0014, ddr_table[REGIDX_014]);
+	ast_moutdwm(ast, 0x1E6E0018, ddr_table[REGIDX_018]);
+	ast_moutdwm(ast, 0x1E6E0020, ddr_table[REGIDX_020]);		 /* MODEREG4/6 */
+	ast_moutdwm(ast, 0x1E6E0024, ddr_table[REGIDX_024]);		 /* MODEREG5 */
+	ast_moutdwm(ast, 0x1E6E002C, ddr_table[REGIDX_02C] | 0x100); /* MODEREG0/2 */
+	ast_moutdwm(ast, 0x1E6E0030, ddr_table[REGIDX_030]);		 /* MODEREG1/3 */
+
+	/* DDR PHY Setting */
+	ast_moutdwm(ast, 0x1E6E0200, 0x02492AAE);
+	ast_moutdwm(ast, 0x1E6E0204, 0x00001001);
+	ast_moutdwm(ast, 0x1E6E020C, 0x55E00B0B);
+	ast_moutdwm(ast, 0x1E6E0210, 0x20000000);
+	ast_moutdwm(ast, 0x1E6E0214, ddr_table[REGIDX_214]);
+	ast_moutdwm(ast, 0x1E6E02E0, ddr_table[REGIDX_2E0]);
+	ast_moutdwm(ast, 0x1E6E02E4, ddr_table[REGIDX_2E4]);
+	ast_moutdwm(ast, 0x1E6E02E8, ddr_table[REGIDX_2E8]);
+	ast_moutdwm(ast, 0x1E6E02EC, ddr_table[REGIDX_2EC]);
+	ast_moutdwm(ast, 0x1E6E02F0, ddr_table[REGIDX_2F0]);
+	ast_moutdwm(ast, 0x1E6E02F4, ddr_table[REGIDX_2F4]);
+	ast_moutdwm(ast, 0x1E6E02F8, ddr_table[REGIDX_2F8]);
+	ast_moutdwm(ast, 0x1E6E0290, 0x00100008);
+	ast_moutdwm(ast, 0x1E6E02C0, 0x00000006);
+
+	/* Controller Setting */
+	ast_moutdwm(ast, 0x1E6E0034, 0x00020091);
+
+	/* Wait DDR PHY init done */
+	ddr_phy_init_2500(ast);
+
+	ast_moutdwm(ast, 0x1E6E0120, ddr_table[REGIDX_PLL]);
+	ast_moutdwm(ast, 0x1E6E000C, 0x42AA5C81);
+	ast_moutdwm(ast, 0x1E6E0034, 0x0001AF93);
+
+	check_dram_size_2500(ast, ddr_table[REGIDX_RFC]);
+	enable_cache_2500(ast);
+	ast_moutdwm(ast, 0x1E6E001C, 0x00000008);
+	ast_moutdwm(ast, 0x1E6E0038, 0xFFFFFF00);
+}
+
+static void ddr4_init_2500(struct ast_private *ast, const u32 *ddr_table)
+{
+	u32 data, data2, pass, retrycnt;
+	u32 ddr_vref, phy_vref;
+	u32 min_ddr_vref = 0, min_phy_vref = 0;
+	u32 max_ddr_vref = 0, max_phy_vref = 0;
+
+	ast_moutdwm(ast, 0x1E6E0004, 0x00000313);
+	ast_moutdwm(ast, 0x1E6E0010, ddr_table[REGIDX_010]);
+	ast_moutdwm(ast, 0x1E6E0014, ddr_table[REGIDX_014]);
+	ast_moutdwm(ast, 0x1E6E0018, ddr_table[REGIDX_018]);
+	ast_moutdwm(ast, 0x1E6E0020, ddr_table[REGIDX_020]);		 /* MODEREG4/6 */
+	ast_moutdwm(ast, 0x1E6E0024, ddr_table[REGIDX_024]);		 /* MODEREG5 */
+	ast_moutdwm(ast, 0x1E6E002C, ddr_table[REGIDX_02C] | 0x100); /* MODEREG0/2 */
+	ast_moutdwm(ast, 0x1E6E0030, ddr_table[REGIDX_030]);		 /* MODEREG1/3 */
+
+	/* DDR PHY Setting */
+	ast_moutdwm(ast, 0x1E6E0200, 0x42492AAE);
+	ast_moutdwm(ast, 0x1E6E0204, 0x09002800);					/* modify at V1.3 */
+	ast_moutdwm(ast, 0x1E6E020C, 0x55E00B0B);
+	ast_moutdwm(ast, 0x1E6E0210, 0x20000000);
+	ast_moutdwm(ast, 0x1E6E0214, ddr_table[REGIDX_214]);
+	ast_moutdwm(ast, 0x1E6E02E0, ddr_table[REGIDX_2E0]);
+	ast_moutdwm(ast, 0x1E6E02E4, ddr_table[REGIDX_2E4]);
+	ast_moutdwm(ast, 0x1E6E02E8, ddr_table[REGIDX_2E8]);
+	ast_moutdwm(ast, 0x1E6E02EC, ddr_table[REGIDX_2EC]);
+	ast_moutdwm(ast, 0x1E6E02F0, ddr_table[REGIDX_2F0]);
+	ast_moutdwm(ast, 0x1E6E02F4, ddr_table[REGIDX_2F4]);
+	ast_moutdwm(ast, 0x1E6E02F8, ddr_table[REGIDX_2F8]);
+	ast_moutdwm(ast, 0x1E6E0290, 0x00100008);
+	ast_moutdwm(ast, 0x1E6E02C4, 0x3C183C3C);
+	ast_moutdwm(ast, 0x1E6E02C8, 0x00631E0E);
+
+	/* Controller Setting */
+	ast_moutdwm(ast, 0x1E6E0034, 0x0001A991);
+
+	/* Train PHY Vref first */
+	pass = 0;
+
+	for (retrycnt = 0; retrycnt < 4 && pass == 0; retrycnt++) {
+		max_phy_vref = 0x0;
+		pass = 0;
+		ast_moutdwm(ast, 0x1E6E02C0, 0x00001C06);
+		for (phy_vref = 0x40; phy_vref < 0x80; phy_vref++) {
+			ast_moutdwm(ast, 0x1E6E000C, 0x00000000);
+			ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
+			ast_moutdwm(ast, 0x1E6E02CC, phy_vref | (phy_vref << 8));
+			/* Fire DFI Init */
+			ddr_phy_init_2500(ast);
+			ast_moutdwm(ast, 0x1E6E000C, 0x00005C01);
+			if (cbr_test_2500(ast)) {
+				pass++;
+				data = ast_mindwm(ast, 0x1E6E03D0);
+				data2 = data >> 8;
+				data  = data & 0xff;
+				if (data > data2)
+					data = data2;
+				if (max_phy_vref < data) {
+					max_phy_vref = data;
+					min_phy_vref = phy_vref;
+				}
+			} else if (pass > 0)
+				break;
+		}
+	}
+	ast_moutdwm(ast, 0x1E6E02CC, min_phy_vref | (min_phy_vref << 8));
+
+	/* Train DDR Vref next */
+	pass = 0;
+
+	for (retrycnt = 0; retrycnt < 4 && pass == 0; retrycnt++) {
+		min_ddr_vref = 0xFF;
+		max_ddr_vref = 0x0;
+		pass = 0;
+		for (ddr_vref = 0x00; ddr_vref < 0x40; ddr_vref++) {
+			ast_moutdwm(ast, 0x1E6E000C, 0x00000000);
+			ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
+			ast_moutdwm(ast, 0x1E6E02C0, 0x00000006 | (ddr_vref << 8));
+			/* Fire DFI Init */
+			ddr_phy_init_2500(ast);
+			ast_moutdwm(ast, 0x1E6E000C, 0x00005C01);
+			if (cbr_test_2500(ast)) {
+				pass++;
+				if (min_ddr_vref > ddr_vref)
+					min_ddr_vref = ddr_vref;
+				if (max_ddr_vref < ddr_vref)
+					max_ddr_vref = ddr_vref;
+			} else if (pass != 0)
+				break;
+		}
+	}
+
+	ast_moutdwm(ast, 0x1E6E000C, 0x00000000);
+	ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
+	ddr_vref = (min_ddr_vref + max_ddr_vref + 1) >> 1;
+	ast_moutdwm(ast, 0x1E6E02C0, 0x00000006 | (ddr_vref << 8));
+
+	/* Wait DDR PHY init done */
+	ddr_phy_init_2500(ast);
+
+	ast_moutdwm(ast, 0x1E6E0120, ddr_table[REGIDX_PLL]);
+	ast_moutdwm(ast, 0x1E6E000C, 0x42AA5C81);
+	ast_moutdwm(ast, 0x1E6E0034, 0x0001AF93);
+
+	check_dram_size_2500(ast, ddr_table[REGIDX_RFC]);
+	enable_cache_2500(ast);
+	ast_moutdwm(ast, 0x1E6E001C, 0x00000008);
+	ast_moutdwm(ast, 0x1E6E0038, 0xFFFFFF00);
+}
+
+static bool ast_dram_init_2500(struct ast_private *ast)
+{
+	u32 data;
+	u32 max_tries = 5;
+
+	do {
+		if (max_tries-- == 0)
+			return false;
+		set_mpll_2500(ast);
+		reset_mmc_2500(ast);
+		ddr_init_common_2500(ast);
+
+		data = ast_mindwm(ast, 0x1E6E2070);
+		if (data & 0x01000000)
+			ddr4_init_2500(ast, ast2500_ddr4_1600_timing_table);
+		else
+			ddr3_init_2500(ast, ast2500_ddr3_1600_timing_table);
+	} while (!ddr_test_2500(ast));
+
+	ast_moutdwm(ast, 0x1E6E2040, ast_mindwm(ast, 0x1E6E2040) | 0x41);
+
+	/* Patch code */
+	data = ast_mindwm(ast, 0x1E6E200C) & 0xF9FFFFFF;
+	ast_moutdwm(ast, 0x1E6E200C, data | 0x10000000);
+	/* Version Number */
+	data = ast_mindwm(ast, 0x1E6E0004);															 /* add at V1.3 */
+	ast_moutdwm(ast, 0x1E6E0004, data | 0x08300000);												 /* add at V1.3 */
+	ast_moutdwm(ast, 0x1E6E0088, 0x20161229);														 /* add at V1.3 */
+
+	return true;
+}
+
+void patch_ahb_ast2500(struct ast_private *ast)
+{
+	u32	data;
+
+	/* Clear bus lock condition */
+	ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
+	ast_moutdwm(ast, 0x1e600084, 0x00010000);
+	ast_moutdwm(ast, 0x1e600088, 0x00000000);
+	ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
+	data = ast_mindwm(ast, 0x1e6e2070);
+	if (data & 0x08000000) {
+		/* check fast reset */
+		ast_moutdwm(ast, 0x1E785004, 0x00000010);
+		ast_moutdwm(ast, 0x1E785008, 0x00004755);
+		ast_moutdwm(ast, 0x1E78500c, 0x00000033);
+		udelay(1000);
+	}
+	do {
+		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
+		data = ast_mindwm(ast, 0x1e6e2000);
+	} while (data != 1);
+	ast_moutdwm(ast, 0x1e6e207c, 0x08000000);		/* clear fast reset */
+}
+
+void ast_post_chip_2500(struct drm_device *dev)
+{
+	struct ast_private *ast = dev->dev_private;
+	u32 temp;
+	u8 reg;
+
+	reg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
+	if ((reg & 0xC0) == 0) {/* vga only */
+		/* Clear bus lock condition */
+		patch_ahb_ast2500(ast);
+
+		/* Disable watchdog */
+		ast_moutdwm(ast, 0x1E78502C, 0x00000000);
+		ast_moutdwm(ast, 0x1E78504C, 0x00000000);
+		/* Reset USB port */
+		ast_moutdwm(ast, 0x1E6E2090, 0x20000000);					/* add at V1.2 */
+		ast_moutdwm(ast, 0x1E6E2094, 0x00004000);					/* add at V1.2 */
+		if (ast_mindwm(ast, 0x1E6E2070) & 0x00800000) {				/* add at V1.2 */
+			ast_moutdwm(ast, 0x1E6E207C, 0x00800000);				/* add at V1.2 */
+			mdelay(100);											/* add at V1.2 */
+			ast_moutdwm(ast, 0x1E6E2070, 0x00800000);				/* add at V1.2 */
+		}															/* add at V1.2 */
+		/* Modify eSPI reset pin */
+		temp = ast_mindwm(ast, 0x1E6E2070);						/* add at V1.3 */
+		if (temp & 0x02000000) {										/* add at V1.3 */
+			ast_moutdwm(ast, 0x1E6E207C, 0x00004000);				/* add at V1.3 */
+		}
+
+		/* Slow down CPU/AHB CLK in VGA only mode */
+		temp = ast_read32(ast, 0x12008);
+		temp |= 0x73;
+		ast_write32(ast, 0x12008, temp);
+
+		if (!ast_dram_init_2500(ast))
+			DRM_ERROR("DRAM init failed !\n");
+
+		temp = ast_mindwm(ast, 0x1e6e2040);
+		ast_moutdwm(ast, 0x1e6e2040, temp | 0x40);
+	}
+
+	/* wait ready */
+	do {
+		reg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
+	} while ((reg & 0x40) == 0);
+}
diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
index 3608d5a..e1c9af26 100644
--- a/drivers/gpu/drm/ast/ast_tables.h
+++ b/drivers/gpu/drm/ast/ast_tables.h
@@ -37,66 +37,67 @@
 #define LineCompareOff          0x00000008
 #define HBorder                 0x00000020
 #define VBorder                 0x00000010
-#define WideScreenMode		0x00000100
-#define NewModeInfo		0x00000200
-#define NHSync			0x00000400
-#define PHSync			0x00000800
-#define NVSync			0x00001000
-#define PVSync			0x00002000
-#define SyncPP			(PVSync | PHSync)
-#define SyncPN			(PVSync | NHSync)
-#define SyncNP			(NVSync | PHSync)
-#define SyncNN			(NVSync | NHSync)
+#define WideScreenMode			0x00000100
+#define NewModeInfo				0x00000200
+#define NHSync					0x00000400
+#define PHSync					0x00000800
+#define NVSync					0x00001000
+#define PVSync					0x00002000
+#define	SyncPP					(PVSync | PHSync)
+#define	SyncPN					(PVSync | NHSync)
+#define	SyncNP					(NVSync | PHSync)
+#define	SyncNN					(NVSync | NHSync)
+#define AST2500PreCatchCRT		0x00004000

 /* DCLK Index */
-#define VCLK25_175     		0x00
-#define VCLK28_322     		0x01
-#define VCLK31_5       		0x02
-#define VCLK36         		0x03
-#define VCLK40         		0x04
-#define VCLK49_5       		0x05
-#define VCLK50         		0x06
-#define VCLK56_25      		0x07
-#define VCLK65		 	0x08
-#define VCLK75	        	0x09
-#define VCLK78_75      		0x0A
-#define VCLK94_5       		0x0B
-#define VCLK108        		0x0C
-#define VCLK135        		0x0D
-#define VCLK157_5      		0x0E
-#define VCLK162        		0x0F
-/* #define VCLK193_25     		0x10 */
-#define VCLK154     		0x10
-#define VCLK83_5    		0x11
-#define VCLK106_5   		0x12
-#define VCLK146_25  		0x13
-#define VCLK148_5   		0x14
-#define VCLK71      		0x15
-#define VCLK88_75   		0x16
-#define VCLK119     		0x17
-#define VCLK85_5     		0x18
-#define VCLK97_75     		0x19
+#define VCLK25_175		0x00
+#define VCLK28_322		0x01
+#define VCLK31_5		0x02
+#define VCLK36			0x03
+#define VCLK40			0x04
+#define VCLK49_5		0x05
+#define VCLK50			0x06
+#define VCLK56_25		0x07
+#define VCLK65			0x08
+#define VCLK75			0x09
+#define VCLK78_75		0x0A
+#define VCLK94_5		0x0B
+#define VCLK108			0x0C
+#define VCLK135			0x0D
+#define VCLK157_5		0x0E
+#define VCLK162			0x0F
+/* #define VCLK193_25			0x10 */
+#define VCLK154			0x10
+#define VCLK83_5		0x11
+#define VCLK106_5		0x12
+#define VCLK146_25		0x13
+#define VCLK148_5		0x14
+#define VCLK71			0x15
+#define VCLK88_75		0x16
+#define VCLK119			0x17
+#define VCLK85_5		0x18
+#define VCLK97_75		0x19
 #define VCLK118_25			0x1A

 static struct ast_vbios_dclk_info dclk_table[] = {
 	{0x2C, 0xE7, 0x03},					/* 00: VCLK25_175	*/
 	{0x95, 0x62, 0x03},				        /* 01: VCLK28_322	*/
 	{0x67, 0x63, 0x01},				        /* 02: VCLK31_5         */
-	{0x76, 0x63, 0x01},				        /* 03: VCLK36         	*/
-	{0xEE, 0x67, 0x01},				        /* 04: VCLK40          	*/
-	{0x82, 0x62, 0x01}, 			        /* 05: VCLK49_5        	*/
-	{0xC6, 0x64, 0x01},                        	        /* 06: VCLK50          	*/
-	{0x94, 0x62, 0x01},                        	        /* 07: VCLK56_25       	*/
-	{0x80, 0x64, 0x00},                        	        /* 08: VCLK65		*/
-	{0x7B, 0x63, 0x00},                        	        /* 09: VCLK75	        */
-	{0x67, 0x62, 0x00},				        /* 0A: VCLK78_75       	*/
-	{0x7C, 0x62, 0x00},                        	        /* 0B: VCLK94_5        	*/
-	{0x8E, 0x62, 0x00},                        	        /* 0C: VCLK108         	*/
-	{0x85, 0x24, 0x00},                        	        /* 0D: VCLK135         	*/
-	{0x67, 0x22, 0x00},                        	        /* 0E: VCLK157_5       	*/
-	{0x6A, 0x22, 0x00},				        /* 0F: VCLK162         	*/
-	{0x4d, 0x4c, 0x80},				        /* 10: VCLK154      	*/
-	{0xa7, 0x78, 0x80},					/* 11: VCLK83.5         */
+	{0x76, 0x63, 0x01},				        /* 03: VCLK36		*/
+	{0xEE, 0x67, 0x01},				        /* 04: VCLK40		*/
+	{0x82, 0x62, 0x01},			        /* 05: VCLK49_5		*/
+	{0xC6, 0x64, 0x01},				        /* 06: VCLK50		*/
+	{0x94, 0x62, 0x01},				        /* 07: VCLK56_25	*/
+	{0x80, 0x64, 0x00},				        /* 08: VCLK65		*/
+	{0x7B, 0x63, 0x00},				        /* 09: VCLK75	        */
+	{0x67, 0x62, 0x00},				        /* 0A: VCLK78_75	*/
+	{0x7C, 0x62, 0x00},				        /* 0B: VCLK94_5		*/
+	{0x8E, 0x62, 0x00},				        /* 0C: VCLK108		*/
+	{0x85, 0x24, 0x00},				        /* 0D: VCLK135		*/
+	{0x67, 0x22, 0x00},				        /* 0E: VCLK157_5	*/
+	{0x6A, 0x22, 0x00},				        /* 0F: VCLK162		*/
+	{0x4d, 0x4c, 0x80},				        /* 10: VCLK154		*/
+	{0x68, 0x6f, 0x80},					/* 11: VCLK83.5         */
 	{0x28, 0x49, 0x80},					/* 12: VCLK106.5        */
 	{0x37, 0x49, 0x80},					/* 13: VCLK146.25       */
 	{0x1f, 0x45, 0x80},					/* 14: VCLK148.5        */
@@ -108,6 +109,96 @@ static struct ast_vbios_dclk_info dclk_table[] = {
 	{0x3b, 0x2c, 0x81},					/* 1A: VCLK118_25	*/
 };

+static struct ast_vbios_dclk_info dclk_table_25MHz[] = {
+    {0x2C, 0xE7, 0x03},					/* 00: VCLK25_175	*/
+    {0x95, 0x62, 0x03},					/* 01: VCLK28_322	*/
+    {0x67, 0x63, 0x01},					/* 02: VCLK31_5         */
+    {0x76, 0x63, 0x01},					/* 03: VCLK36		*/
+    {0xEE, 0x67, 0x01},					/* 04: VCLK40		*/
+    {0x82, 0x62, 0x01},					/* 05: VCLK49_5		*/
+    {0xC6, 0x64, 0x01},					/* 06: VCLK50		*/
+    {0x94, 0x62, 0x01},					/* 07: VCLK56_25	*/
+    {0x80, 0x64, 0x00},					/* 08: VCLK65		*/
+    {0x7B, 0x63, 0x00},					/* 09: VCLK75		*/
+    {0x67, 0x62, 0x00},					/* 0A: VCLK78_75	*/
+    {0x7C, 0x62, 0x00},					/* 0B: VCLK94_5		*/
+    {0x8E, 0x62, 0x00},					/* 0C: VCLK108		*/
+    {0x85, 0x24, 0x00},					/* 0D: VCLK135		*/
+    {0x67, 0x22, 0x00},					/* 0E: VCLK157_5	*/
+    {0x6A, 0x22, 0x00},					/* 0F: VCLK162		*/
+    {0x25, 0x46, 0x80},				        /* 10: VCLK154		*/
+    {0x14, 0x63, 0x80},					/* 11: VCLK83.5         */
+    {0x11, 0x44, 0x80},					/* 12: VCLK106.5        */
+    {0x23, 0x46, 0x80},					/* 13: VCLK146.25       */
+    {0x4d, 0x4d, 0x80},					/* 14: VCLK148.5        */
+    {0x11, 0x63, 0x80},					/* 15: VCLK71           */
+    {0x47, 0x6a, 0x80},					/* 16: VCLK88.75        */
+    {0x13, 0x44, 0x80},					/* 17: VCLK119          */
+    {0x29, 0x66, 0x80},				        /* 18: VCLK85_5         */
+    {0x2f, 0x66, 0x80},					/* 19: VCLK97_75 */
+    {0x21, 0x47, 0x80},					/* 1A: VCLK118_25 */
+};
+
+static struct ast_vbios_dclk_info dclk_table_ast2500[] = {
+	{0x2C, 0xE7, 0x03},					/* 00: VCLK25_175	*/
+	{0x95, 0x62, 0x03},				        /* 01: VCLK28_322	*/
+	{0x67, 0x63, 0x01},				        /* 02: VCLK31_5         */
+	{0x76, 0x63, 0x01},				        /* 03: VCLK36		*/
+	{0xEE, 0x67, 0x01},				        /* 04: VCLK40		*/
+	{0x82, 0x62, 0x01},			        /* 05: VCLK49_5		*/
+	{0xC6, 0x64, 0x01},				        /* 06: VCLK50		*/
+	{0x94, 0x62, 0x01},				        /* 07: VCLK56_25	*/
+	{0x80, 0x64, 0x00},				        /* 08: VCLK65		*/
+	{0x7B, 0x63, 0x00},				        /* 09: VCLK75	        */
+	{0x67, 0x62, 0x00},				        /* 0A: VCLK78_75	*/
+	{0x7C, 0x62, 0x00},				        /* 0B: VCLK94_5		*/
+	{0x8E, 0x62, 0x00},				        /* 0C: VCLK108		*/
+	{0x85, 0x24, 0x00},				        /* 0D: VCLK135		*/
+	{0x67, 0x22, 0x00},				        /* 0E: VCLK157_5	*/
+	{0x6A, 0x22, 0x00},				        /* 0F: VCLK162		*/
+	{0x4d, 0x4c, 0x80},				        /* 10: VCLK154		*/
+	{0x68, 0x6f, 0x80},					/* 11: VCLK83.5         */
+	{0x28, 0x49, 0x80},					/* 12: VCLK106.5        */
+	{0x37, 0x49, 0x80},					/* 13: VCLK146.25       */
+	{0x1f, 0x45, 0x80},					/* 14: VCLK148.5        */
+	{0x47, 0x6c, 0x80},					/* 15: VCLK71       */
+	{0x25, 0x65, 0x80},					/* 16: VCLK88.75    */
+	{0x58, 0x01, 0x42},					/* 17: VCLK119      */
+	{0x32, 0x67, 0x80},				    /* 18: VCLK85_5     */
+	{0x6a, 0x6d, 0x80},					/* 19: VCLK97_75	*/
+	{0x44, 0x20, 0x43},					/* 1A: VCLK118_25	*/
+};
+
+static struct ast_vbios_dclk_info dclk_table_ast2500_25MHz[] = {
+    {0x2C, 0xE7, 0x03},					/* 00: VCLK25_175	*/
+    {0x95, 0x62, 0x03},					/* 01: VCLK28_322	*/
+    {0x67, 0x63, 0x01},					/* 02: VCLK31_5         */
+    {0x76, 0x63, 0x01},					/* 03: VCLK36		*/
+    {0xEE, 0x67, 0x01},					/* 04: VCLK40		*/
+    {0x82, 0x62, 0x01},					/* 05: VCLK49_5		*/
+    {0xC6, 0x64, 0x01},					/* 06: VCLK50		*/
+    {0x94, 0x62, 0x01},					/* 07: VCLK56_25	*/
+    {0x80, 0x64, 0x00},					/* 08: VCLK65		*/
+    {0x7B, 0x63, 0x00},					/* 09: VCLK75		*/
+    {0x67, 0x62, 0x00},					/* 0A: VCLK78_75	*/
+    {0x7C, 0x62, 0x00},					/* 0B: VCLK94_5		*/
+    {0x8E, 0x62, 0x00},					/* 0C: VCLK108		*/
+    {0x85, 0x24, 0x00},					/* 0D: VCLK135		*/
+    {0x67, 0x22, 0x00},					/* 0E: VCLK157_5	*/
+    {0x6A, 0x22, 0x00},					/* 0F: VCLK162		*/
+    {0x4d, 0x4c, 0x80},				        /* 10: VCLK154		*/
+    {0x68, 0x6f, 0x80},					/* 11: VCLK83.5         */
+    {0x28, 0x49, 0x80},					/* 12: VCLK106.5        */
+    {0x37, 0x49, 0x80},					/* 13: VCLK146.25       */
+    {0x1f, 0x45, 0x80},					/* 14: VCLK148.5        */
+    {0x47, 0x6c, 0x80},					/* 15: VCLK71           */
+    {0x25, 0x65, 0x80},					/* 16: VCLK88.75        */
+    {0x38, 0x60, 0x42},					/* 17: VCLK119          */
+    {0x32, 0x67, 0x80},				        /* 18: VCLK85_5         */
+    {0x6a, 0x6d, 0x80},					/* 19: VCLK97_75 */
+    {0x41, 0x20, 0x43},					/* 1A: VCLK118_25 */
+};
+
 static struct ast_vbios_stdtable vbios_stdtable[] = {
 	/* MD_2_3_400 */
 	{
@@ -241,65 +332,74 @@ static struct ast_vbios_enhtable res_1600x1200[] = {
 	 (SyncPP | Charx8Dot), 0xFF, 1, 0x33 },
 };

+static struct ast_vbios_enhtable res_1152x864[] = {
+	{1600, 1152, 64, 128,  900,  864, 1, 3, VCLK108,	/* 75Hz */
+	 (SyncPP | Charx8Dot | NewModeInfo), 75, 1, 0x3B },
+	{1600, 1152, 64, 128,  900,  864, 1, 3, VCLK108,	/* end */
+	 (SyncPP | Charx8Dot | NewModeInfo), 0xFF, 1, 0x3B },
+};
+
 /* 16:9 */
 static struct ast_vbios_enhtable res_1360x768[] = {
 	{1792, 1360, 64,112, 795,  768, 3, 6, VCLK85_5,	         /* 60Hz */
-	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x39 },
+	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo | AST2500PreCatchCRT), 60, 1, 0x39 },
 	{1792, 1360, 64,112, 795,  768, 3, 6, VCLK85_5,	         /* end */
 	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 1, 0x39 },
 };

 static struct ast_vbios_enhtable res_1600x900[] = {
+	{1800, 1600, 24, 80, 1000,  900, 1, 3, VCLK108,	/* 60Hz */
+	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 3, 0x3A },
 	{1760, 1600, 48, 32, 926,  900, 3, 5, VCLK97_75,	/* 60Hz CVT RB */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x3A },
-	{2112, 1600, 88,168, 934,  900, 3, 5, VCLK118_25,	/* 60Hz CVT */
+	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo | AST2500PreCatchCRT), 60, 1, 0x3A },
+	{2112, 1600, 88, 168, 934,  900, 3, 5, VCLK118_25,	/* 60Hz CVT */
 	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x3A },
-	{2112, 1600, 88,168, 934,  900, 3, 5, VCLK118_25,	/* 60Hz CVT */
+    {2112, 1600, 88, 168, 934,  900, 3, 5, VCLK118_25,	/* 60Hz CVT */
 	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 2, 0x3A },
 };

 static struct ast_vbios_enhtable res_1920x1080[] = {
 	{2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60Hz */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x38 },
+	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo | AST2500PreCatchCRT), 60, 1, 0x38 },
 	{2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60Hz */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 1, 0x38 },
+	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo | AST2500PreCatchCRT), 0xFF, 1, 0x38 },
 };


 /* 16:10 */
 static struct ast_vbios_enhtable res_1280x800[] = {
 	{1440, 1280, 48, 32,  823,  800, 3, 6, VCLK71,	/* 60Hz RB */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x35 },
-	{1680, 1280, 72,128,  831,  800, 3, 6, VCLK83_5,	/* 60Hz */
+	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo | AST2500PreCatchCRT), 60, 1, 0x35 },
+	{1680, 1280, 72, 128,  831,  800, 3, 6, VCLK83_5,	/* 60Hz */
 	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x35 },
-	{1680, 1280, 72,128,  831,  800, 3, 6, VCLK83_5,	/* 60Hz */
+	{1680, 1280, 72, 128,  831,  800, 3, 6, VCLK83_5,	/* 60Hz */
 	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 2, 0x35 },

 };

 static struct ast_vbios_enhtable res_1440x900[] = {
 	{1600, 1440, 48, 32,  926,  900, 3, 6, VCLK88_75,	/* 60Hz RB */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x36 },
-	{1904, 1440, 80,152,  934,  900, 3, 6, VCLK106_5,	/* 60Hz */
+	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo | AST2500PreCatchCRT), 60, 1, 0x36 },
+	{1904, 1440, 80, 152,  934,  900, 3, 6, VCLK106_5,	/* 60Hz */
 	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x36 },
-	{1904, 1440, 80,152,  934,  900, 3, 6, VCLK106_5,	/* 60Hz */
+	{1904, 1440, 80, 152,  934,  900, 3, 6, VCLK106_5,	/* 60Hz */
 	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 2, 0x36 },
 };

 static struct ast_vbios_enhtable res_1680x1050[] = {
 	{1840, 1680, 48, 32, 1080, 1050, 3, 6, VCLK119,	/* 60Hz RB */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x37 },
-	{2240, 1680,104,176, 1089, 1050, 3, 6, VCLK146_25,	/* 60Hz */
+	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo | AST2500PreCatchCRT), 60, 1, 0x37 },
+	{2240, 1680, 104, 176, 1089, 1050, 3, 6, VCLK146_25,	/* 60Hz */
 	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x37 },
-	{2240, 1680,104,176, 1089, 1050, 3, 6, VCLK146_25,	/* 60Hz */
+	{2240, 1680, 104, 176, 1089, 1050, 3, 6, VCLK146_25,	/* 60Hz */
 	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 2, 0x37 },
 };

 static struct ast_vbios_enhtable res_1920x1200[] = {
 	{2080, 1920, 48, 32, 1235, 1200, 3, 6, VCLK154,	/* 60Hz RB*/
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x34 },
+	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo | AST2500PreCatchCRT), 60, 1, 0x34 },
 	{2080, 1920, 48, 32, 1235, 1200, 3, 6, VCLK154,	/* 60Hz RB */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 1, 0x34 },
+	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo | AST2500PreCatchCRT), 0xFF, 1, 0x34 },
 };

 #endif
--
2.7.2.windows.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
