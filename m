Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9612971546B
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 06:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C41610E32A;
	Tue, 30 May 2023 04:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9BE10E32A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 04:12:44 +0000 (UTC)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 May 2023 12:12:42 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <tzimmermann@suse.de>, <airlied@redhat.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH v3] drm/ast: Fix long time waiting on s3/s4 resume
Date: Tue, 30 May 2023 12:12:40 +0800
Message-ID: <20230530041240.13427-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
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
Cc: wendy.wang@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In resume, DP's launch function, ast_dp_launch, could wait at most 30
seconds before timeout to check if DP is enabled. It could lead to 'DPM
device timeout' and trigger unrecoverable kernel panic.

To avoid this problem, we check if DP enable or not at driver probe only.

Reported-and-tested-by: Wendy Wang <wendy.wang@intel.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217278
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 v3 changes:
  - Update comments
 v2 changes:
  - Fix build error.
---
 drivers/gpu/drm/ast/ast_dp.c   | 55 +++++++++++-----------------------
 drivers/gpu/drm/ast/ast_drv.h  |  5 +---
 drivers/gpu/drm/ast/ast_main.c | 11 +++++--
 drivers/gpu/drm/ast/ast_post.c |  3 +-
 4 files changed, 29 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index fbb070f63e36..6dc1a09504e1 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -119,53 +119,32 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 /*
  * Launch Aspeed DP
  */
-void ast_dp_launch(struct drm_device *dev, u8 bPower)
+void ast_dp_launch(struct drm_device *dev)
 {
-	u32 i = 0, j = 0, WaitCount = 1;
-	u8 bDPTX = 0;
+	u32 i = 0;
 	u8 bDPExecute = 1;
-
 	struct ast_device *ast = to_ast_device(dev);
-	// S3 come back, need more time to wait BMC ready.
-	if (bPower)
-		WaitCount = 300;
-
-
-	// Wait total count by different condition.
-	for (j = 0; j < WaitCount; j++) {
-		bDPTX = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, TX_TYPE_MASK);
-
-		if (bDPTX)
-			break;
 
+	// Wait one second then timeout.
+	while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, ASTDP_MCU_FW_EXECUTING) !=
+		ASTDP_MCU_FW_EXECUTING) {
+		i++;
+		// wait 100 ms
 		msleep(100);
-	}
 
-	// 0xE : ASTDP with DPMCU FW handling
-	if (bDPTX == ASTDP_DPMCU_TX) {
-		// Wait one second then timeout.
-		i = 0;
-
-		while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, COPROCESSOR_LAUNCH) !=
-			COPROCESSOR_LAUNCH) {
-			i++;
-			// wait 100 ms
-			msleep(100);
-
-			if (i >= 10) {
-				// DP would not be ready.
-				bDPExecute = 0;
-				break;
-			}
+		if (i >= 10) {
+			// DP would not be ready.
+			bDPExecute = 0;
+			break;
 		}
+	}
 
-		if (bDPExecute)
-			ast->tx_chip_types |= BIT(AST_TX_ASTDP);
+	if (!bDPExecute)
+		drm_err(dev, "Wait DPMCU executing timeout\n");
 
-		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5,
-							(u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
-							ASTDP_HOST_EDID_READ_DONE);
-	}
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5,
+			       (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
+			       ASTDP_HOST_EDID_READ_DONE);
 }
 
 
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index a501169cddad..5498a6676f2e 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -350,9 +350,6 @@ int ast_mode_config_init(struct ast_device *ast);
 #define AST_DP501_LINKRATE	0xf014
 #define AST_DP501_EDID_DATA	0xf020
 
-/* Define for Soc scratched reg */
-#define COPROCESSOR_LAUNCH			BIT(5)
-
 /*
  * Display Transmitter Type:
  */
@@ -480,7 +477,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
 
 /* aspeed DP */
 int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
-void ast_dp_launch(struct drm_device *dev, u8 bPower);
+void ast_dp_launch(struct drm_device *dev);
 void ast_dp_power_on_off(struct drm_device *dev, bool no);
 void ast_dp_set_on_off(struct drm_device *dev, bool no);
 void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index f32ce29edba7..1f35438f614a 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -254,8 +254,13 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 		case 0x0c:
 			ast->tx_chip_types = AST_TX_DP501_BIT;
 		}
-	} else if (ast->chip == AST2600)
-		ast_dp_launch(&ast->base, 0);
+	} else if (ast->chip == AST2600) {
+		if (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, TX_TYPE_MASK) ==
+		    ASTDP_DPMCU_TX) {
+			ast->tx_chip_types = AST_TX_ASTDP_BIT;
+			ast_dp_launch(&ast->base);
+		}
+	}
 
 	/* Print stuff for diagnostic purposes */
 	if (ast->tx_chip_types & AST_TX_NONE_BIT)
@@ -264,6 +269,8 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 		drm_info(dev, "Using Sil164 TMDS transmitter\n");
 	if (ast->tx_chip_types & AST_TX_DP501_BIT)
 		drm_info(dev, "Using DP501 DisplayPort transmitter\n");
+	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
+		drm_info(dev, "Using ASPEED DisplayPort transmitter\n");
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 71bb36b865fd..a005aec18a02 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -380,7 +380,8 @@ void ast_post_gpu(struct drm_device *dev)
 	ast_set_def_ext_reg(dev);
 
 	if (ast->chip == AST2600) {
-		ast_dp_launch(dev, 1);
+		if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
+			ast_dp_launch(dev);
 	} else if (ast->config_mode == ast_use_p2a) {
 		if (ast->chip == AST2500)
 			ast_post_chip_2500(dev);

base-commit: 933174ae28ba72ab8de5b35cb7c98fc211235096
-- 
2.25.1

