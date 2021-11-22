Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F3458C87
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 11:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7993A89E38;
	Mon, 22 Nov 2021 10:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 380 seconds by postgrey-1.36 at gabe;
 Mon, 22 Nov 2021 10:43:00 UTC
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381A78915E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 10:43:00 +0000 (UTC)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 1AMACeft020928
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 18:12:40 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1AMACN1m020908;
 Mon, 22 Nov 2021 18:12:23 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from localhost.localdomain.com (192.168.2.143) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 22 Nov 2021 18:36:23 +0800
From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
To: <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ast: Create the driver for ASPEED proprietory Display-Port
Date: Mon, 22 Nov 2021 18:36:17 +0800
Message-ID: <20211122103617.3496-1-kuohsiang_chou@aspeedtech.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.143]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AMACN1m020908
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
Cc: hungju_huang@aspeedtech.com, airlied@linux.ie, brandon_chen@aspeedtech.com,
 tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com, airlied@redhat.com,
 arc_sung@aspeedtech.com, luke_chen@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. The MCU FW controling ASPEED DP is loaded by BMC boot loader.
2. Driver starts after CR[3:1] == 111b that indicates Tx is ASTDP,
   and CRD1[5] has been asserted by BMVC boot loader.
3. EDID is prioritized by DP monitor.
4. DP's EDID has high priority to decide resolution supporting.

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/Makefile   |   2 +-
 drivers/gpu/drm/ast/ast_dp.c   | 286 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h  |  13 ++
 drivers/gpu/drm/ast/ast_main.c |   7 +-
 drivers/gpu/drm/ast/ast_mode.c |  50 +++++-
 drivers/gpu/drm/ast/ast_post.c |   4 +-
 6 files changed, 353 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_dp.c

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index 438a2d05b..9bd0756e0 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -3,6 +3,6 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-ast-y := ast_drv.o ast_main.o ast_mm.o ast_mode.o ast_post.o ast_dp501.o
+ast-y := ast_drv.o ast_main.o ast_mm.o ast_mode.o ast_post.o ast_dp501.o ast_dp.o
 
 obj-$(CONFIG_DRM_AST) := ast.o
diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
new file mode 100644
index 000000000..537eaf4fa
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -0,0 +1,286 @@
+/*
+ * Copyright 2012 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ */
+/*
+ * Authors: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
+ */
+
+#include <linux/firmware.h>
+#include <linux/delay.h>
+#include <drm/drm_print.h>
+#include "ast_drv.h"
+
+bool ast_dp_read_edid(struct drm_device *dev, u8 *ediddata)
+{
+	struct ast_private *ast = to_ast_private(dev);
+	u8 i = 0, j = 0;
+
+#ifdef DPControlPower
+	u8 bDPState_Change = false;
+
+	// Check DP power off or not.
+	if (ast->ASTDP_State & 0x10) {
+		// DP power on
+		ast_dp_PowerOnOff(dev, 1);
+		bDPState_Change = true;
+	}
+#endif
+
+	/*
+	 * CRD1[b5]: DP MCU FW is executing
+	 * CRDC[b0]: DP link success
+	 * CRDF[b0]: DP HPD
+	 * CRE5[b0]: Host reading EDID process is done
+	 */
+	if (!(ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 0x20) &&
+		ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 0x01) &&
+		ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, 0x01) &&
+		ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x01))) {
+#ifdef DPControlPower
+		// Set back power off
+		if (bDPState_Change)
+			ast_dp_PowerOnOff(dev, 0);
+#endif
+		return false;
+	}
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x00, 0x00);
+
+	for (i = 0; i < 32; i++) {
+		/*
+		 * CRE4[7:0]: Read-Pointer for EDID (Unit: 4bytes); valid range: 0~64
+		 */
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE4, 0x00, (u8) i);
+		j = 0;
+
+		/*
+		 * CRD7[b0]: valid flag for EDID
+		 * CRD6[b0]: mirror read pointer for EDID
+		 */
+		while ((ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD7, 0x01) != 0x01) ||
+			(ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD6, 0xFF) != i)) {
+			mdelay(j+1);
+
+			if (!(ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 0x20) &&
+				ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 0x01) &&
+				ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, 0x01))) {
+				ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x00, 0x01);
+				return false;
+			}
+
+			j++;
+			if (j > 200) {
+				ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x00, 0x01);
+				return false;
+			}
+		}
+
+		*(ediddata) = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD8, 0xFF);
+		*(ediddata + 1) = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD9, 0xFF);
+		*(ediddata + 2) = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDA, 0xFF);
+		*(ediddata + 3) = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDB, 0xFF);
+
+		if (i == 31) {
+			*(ediddata + 3) = *(ediddata + 3) + *(ediddata + 2);
+			*(ediddata + 2) = 0;
+		}
+
+		ediddata += 4;
+	}
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5, 0x00, 0x01);
+
+#ifdef DPControlPower
+	// Set back power off
+	if (bDPState_Change)
+		ast_dp_PowerOnOff(dev, 0);
+#endif
+
+	return true;
+}
+
+/*
+ * Launch Aspeed DP
+ */
+bool ast_dp_launch(struct drm_device *dev, u8 bPower)
+{
+	u32 i = 0, j = 0, WaitCount = 1;
+	u8 bDPTX = 0;
+	u8 bDPExecute = 1;
+
+	struct ast_private *ast = to_ast_private(dev);
+	// S3 come back, need more time to wait BMC ready.
+	if (bPower)
+		WaitCount = 300;
+
+	// Fill
+	ast->tx_chip_type = AST_TX_NONE;
+
+	// Wait total count by different condition.
+	// This is a temp solution for DP check
+	for (j = 0; j < WaitCount; j++) {
+		bDPTX = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 0x0E);
+
+		if (bDPTX)
+			break;
+
+		msleep(100);
+	}
+
+	// 0xE : ASTDP with DPMCU FW handling
+	if (bDPTX == 0x0E) {
+		// Wait one second then timeout.
+		i = 0;
+
+		while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 0x20) != 0x20) {
+			i++;
+			// wait 100 ms
+			msleep(100);
+
+			if (i >= 10) {
+				// DP would not be ready.
+				bDPExecute = 0;
+				break;
+			}
+		};
+
+		if (bDPExecute)
+			ast->tx_chip_type = AST_TX_ASTDP;
+	}
+
+	return true;
+}
+
+#ifdef DPControlPower
+
+void ast_dp_PowerOnOff(struct drm_device *dev, u8 Mode)
+{
+	struct ast_private *ast = to_ast_private(dev);
+	// Read and Turn off DP PHY sleep
+	u8 bE3 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE3, 0x0F);
+
+	// Turn on DP PHY sleep
+	if (!Mode)
+		bE3 |= 0x10;
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE3, 0x00, bE3); // DP Power on/off
+
+	// Save ASTDP power state
+	ast->ASTDP_State = bE3;
+}
+
+#endif
+
+void ast_dp_SetOnOff(struct drm_device *dev, u8 Mode)
+{
+	struct ast_private *ast = to_ast_private(dev);
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE3, 0x00, Mode); // video on/off
+
+	// Save ASTDP power state
+	ast->ASTDP_State = Mode;
+
+    // If DP plug in and link successful then check video on / off status
+	if (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 0x01) &&
+		ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, 0x01)) {
+		Mode <<= 4;
+		while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, 0x10) != Mode) {
+			// wait 1 ms
+			mdelay(1);
+		}
+	}
+}
+
+void ast_dp_SetOutput(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
+{
+	struct ast_private *ast = to_ast_private(crtc->dev);
+
+	u32 ulRefreshRateIndex;
+	u8 ModeIdx;
+
+	ulRefreshRateIndex = vbios_mode->enh_table->refresh_rate_index - 1;
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
+			ModeIdx = (0x17 - (u8) ulRefreshRateIndex);	// For RB/Non-RB
+		else		// 1024
+			ModeIdx = (0x0D + (u8) ulRefreshRateIndex);
+		break;
+	case 1360:
+	case 1366:
+		ModeIdx = 0x1E;
+		break;
+	case 1440:
+		ModeIdx = (0x19 - (u8) ulRefreshRateIndex);	// For RB/Non-RB
+		break;
+	case 1600:
+		if (crtc->mode.crtc_vdisplay == 900)
+			ModeIdx = (0x1D - (u8) ulRefreshRateIndex);	// For RB/Non-RB
+		else		//1200
+			ModeIdx = 0x10;
+		break;
+	case 1680:
+		ModeIdx = (0x1B - (u8) ulRefreshRateIndex);	// For RB/Non-RB
+		break;
+	case 1920:
+		if (crtc->mode.crtc_vdisplay == 1080)
+			ModeIdx = 0x15;
+		else		//1200
+			ModeIdx = 0x14;
+		break;
+	default:
+		return;
+	}
+
+	/*
+	 * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
+	 * CRE1[7:0]: MISC1 (default: 0x00)
+	 * CRE2[7:0]: video format index (0x00 ~ 0x20 or 0x40 ~ 0x50)
+	 */
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE0, 0x00, 0x20);
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE1, 0x00, 0x00);
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE2, 0x00, ModeIdx);
+}
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 2cfce7dc9..e56d5d57b 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -71,6 +71,7 @@ enum ast_tx_chip {
 	AST_TX_SIL164,
 	AST_TX_ITE66121,
 	AST_TX_DP501,
+	AST_TX_ASTDP,
 };
 
 #define AST_DRAM_512Mx16 0
@@ -175,6 +176,9 @@ struct ast_private {
 	u8 dp501_maxclk;
 	u8 *dp501_fw_addr;
 	const struct firmware *dp501_fw;	/* dp501 fw */
+
+    // ASTDP
+	u8 ASTDP_State;
 };
 
 static inline struct ast_private *to_ast_private(struct drm_device *dev)
@@ -356,5 +360,14 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
 bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
 u8 ast_get_dp501_max_clk(struct drm_device *dev);
 void ast_init_3rdtx(struct drm_device *dev);
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
index 79a361867..de5d69888 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -212,7 +212,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 		}
 		break;
 	}
-
+	ast->support_wide_screen = true;
 	/* Check 3rd Tx option (digital output afaik) */
 	ast->tx_chip_type = AST_TX_NONE;
 
@@ -230,7 +230,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 			ast->tx_chip_type = AST_TX_SIL164;
 	}
 
-	if ((ast->chip == AST2300) || (ast->chip == AST2400)) {
+	if ((ast->chip == AST2300) || (ast->chip == AST2400) || (ast->chip == AST2500)) {
 		/*
 		 * On AST2300 and 2400, look the configuration set by the SoC in
 		 * the SOC scratch register #1 bits 11:8 (interestingly marked
@@ -254,7 +254,8 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 		case 0x0c:
 			ast->tx_chip_type = AST_TX_DP501;
 		}
-	}
+	} else if (ast->chip == AST2600)
+		ast_dp_launch(&ast->base, 0);
 
 	/* Print stuff for diagnostic purposes */
 	switch(ast->tx_chip_type) {
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 6bfaefa01..d7347d510 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -987,20 +987,44 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct ast_private *ast = to_ast_private(crtc->dev);
+	u8 ch = 0x03;
 
 	/* TODO: Maybe control display signal generation with
 	 *       Sync Enable (bit CR17.7).
 	 */
 	switch (mode) {
 	case DRM_MODE_DPMS_ON:
-	case DRM_MODE_DPMS_STANDBY:
-	case DRM_MODE_DPMS_SUSPEND:
+		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0);
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, 0);
 		if (ast->tx_chip_type == AST_TX_DP501)
 			ast_set_dp501_video_output(crtc->dev, 1);
+
+		if (ast->tx_chip_type == AST_TX_ASTDP) {
+#ifdef DPControlPower
+			ast_dp_PowerOnOff(crtc->dev, 1);
+#endif
+			ast_wait_for_vretrace(ast);
+			ast_dp_SetOnOff(crtc->dev, 1);
+		}
+
+		ast_crtc_load_lut(ast, crtc);
 		break;
+	case DRM_MODE_DPMS_STANDBY:
+	case DRM_MODE_DPMS_SUSPEND:
 	case DRM_MODE_DPMS_OFF:
+		ch = mode;
 		if (ast->tx_chip_type == AST_TX_DP501)
 			ast_set_dp501_video_output(crtc->dev, 0);
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
@@ -1044,6 +1068,8 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	struct ast_private *ast = to_ast_private(crtc->dev);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
 	struct ast_crtc_state *old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
+struct ast_vbios_mode_info *vbios_mode_info =
+		&ast_crtc_state->vbios_mode_info;
 
 	/*
 	 * The gamma LUT has to be reloaded after changing the primary
@@ -1051,6 +1077,10 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	 */
 	if (old_ast_crtc_state->format != ast_crtc_state->format)
 		ast_crtc_load_lut(ast, crtc);
+
+	//Set Aspeed Display-Port
+	if (ast->tx_chip_type == AST_TX_ASTDP)
+		ast_dp_SetOutput(crtc, vbios_mode_info);
 }
 
 static void
@@ -1225,7 +1255,16 @@ static int ast_get_modes(struct drm_connector *connector)
 			ast->dp501_maxclk = ast_get_dp501_max_clk(connector->dev);
 		else
 			kfree(edid);
+	} else if (ast->tx_chip_type == AST_TX_ASTDP) {
+		edid = kmalloc(128, GFP_KERNEL);
+		if (!edid)
+			return -ENOMEM;
+
+		flags = ast_dp_read_edid(connector->dev, (u8 *)edid);
+		if (!flags)
+			kfree(edid);
 	}
+
 	if (!flags)
 		edid = drm_get_edid(connector, &ast_connector->i2c->adapter);
 	if (edid) {
@@ -1256,10 +1295,12 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
 			return MODE_OK;
 		if ((mode->hdisplay == 1600) && (mode->vdisplay == 900))
 			return MODE_OK;
+		if ((mode->hdisplay == 1152) && (mode->vdisplay == 864))
+			return MODE_OK;
 
 		if ((ast->chip == AST2100) || (ast->chip == AST2200) ||
 		    (ast->chip == AST2300) || (ast->chip == AST2400) ||
-		    (ast->chip == AST2500)) {
+		    (ast->chip == AST2500) || (ast->chip == AST2600)) {
 			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
 				return MODE_OK;
 
@@ -1400,7 +1441,8 @@ int ast_mode_config_init(struct ast_private *ast)
 	    ast->chip == AST2200 ||
 	    ast->chip == AST2300 ||
 	    ast->chip == AST2400 ||
-	    ast->chip == AST2500) {
+	    ast->chip == AST2500 ||
+	    ast->chip == AST2600) {
 		dev->mode_config.max_width = 1920;
 		dev->mode_config.max_height = 2048;
 	} else {
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index b5d92f652..0aa9cf0fb 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -379,7 +379,9 @@ void ast_post_gpu(struct drm_device *dev)
 	ast_enable_mmio(dev);
 	ast_set_def_ext_reg(dev);
 
-	if (ast->config_mode == ast_use_p2a) {
+	if (ast->chip == AST2600) {
+		ast_dp_launch(dev, 1);
+	} else if (ast->config_mode == ast_use_p2a) {
 		if (ast->chip == AST2500)
 			ast_post_chip_2500(dev);
 		else if (ast->chip == AST2300 || ast->chip == AST2400)
-- 
2.27.0

