Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042BD6E1974
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 03:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EF910E15A;
	Fri, 14 Apr 2023 01:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D7210EB08
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:12:05 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 33E0tprI098251;
 Fri, 14 Apr 2023 08:55:51 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 14 Apr 2023 09:11:51 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <airlied@redhat.com>, <tzimmermann@suse.de>
Subject: [PATCH] drm/ast: Fix long time waiting on s3/s4 resume
Date: Fri, 14 Apr 2023 09:11:47 +0800
Message-ID: <20230414011147.3858-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 33E0tprI098251
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In resume, DP's launch function, ast_dp_launch, could wait at most 30
seconds before timeout to check if DP is enabled.

To avoid this problem, we only check if DP enable or not at driver probe.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217278
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_dp.c   | 53 ++++++++++------------------------
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c | 11 +++++--
 drivers/gpu/drm/ast/ast_post.c |  3 +-
 4 files changed, 28 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 56483860306b..3a4218102631 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -121,51 +121,30 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
  */
 void ast_dp_launch(struct drm_device *dev, u8 bPower)
 {
-	u32 i = 0, j = 0, WaitCount = 1;
-	u8 bDPTX = 0;
+	u32 i = 0;
 	u8 bDPExecute = 1;
-
 	struct ast_private *ast = to_ast_private(dev);
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
+	while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, COPROCESSOR_LAUNCH) !=
+		COPROCESSOR_LAUNCH) {
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
index d51b81fea9c8..15e86394be4f 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -498,7 +498,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
 
 /* aspeed DP */
 int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
-void ast_dp_launch(struct drm_device *dev, u8 bPower);
+void ast_dp_launch(struct drm_device *dev);
 void ast_dp_power_on_off(struct drm_device *dev, bool no);
 void ast_dp_set_on_off(struct drm_device *dev, bool no);
 void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index f83ce77127cb..8ecddf20113f 100644
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
index 82fd3c8adee1..90e40f59aff7 100644
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

base-commit: e62252bc55b6d4eddc6c2bdbf95a448180d6a08d
-- 
2.25.1

