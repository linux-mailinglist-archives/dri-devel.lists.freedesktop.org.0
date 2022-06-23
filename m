Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD3C55757E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF2411A28D;
	Thu, 23 Jun 2022 08:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A8D11A295
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:31:31 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 25N8FfJP034709;
 Thu, 23 Jun 2022 16:15:41 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from localhost.localdomain.com (192.168.2.148) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 23 Jun 2022 16:31:22 +0800
From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
To: <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] drm/ast: Fixed the casting issue reported by sparse
Date: Thu, 23 Jun 2022 16:31:16 +0800
Message-ID: <20220623083116.35365-1-kuohsiang_chou@aspeedtech.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <d6c93aa6-db63-2e16-83f3-057cef30e9d4@suse.de>
References: <d6c93aa6-db63-2e16-83f3-057cef30e9d4@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.148]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 25N8FfJP034709
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
Cc: kernel test robot <lkp@intel.com>, hungju_huang@aspeedtech.com,
 airlied@linux.ie, airlied@redhat.com, luke_chen@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V1:
1.Fixed sparse:cast truncates bits form constant value ()cast
  truncates bits from constant value (ffffffffffffff00 becomes 0)

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_dp.c  | 8 ++++----
 drivers/gpu/drm/ast/ast_drv.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index f573d5824..2c71b8eef 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -34,7 +34,7 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 		 * CRE4[7:0]: Read-Pointer for EDID (Unit: 4bytes); valid range: 0~64
 		 */
 		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE4,
-					(u8) ~ASTDP_EDID_READ_POINTER_MASK, (u8) i);
+					ASTDP_AND_CLEAR_MASK, (u8) i);
 		j = 0;

 		/*
@@ -274,8 +274,8 @@ void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mo
 	 * CRE1[7:0]: MISC1 (default: 0x00)
 	 * CRE2[7:0]: video format index (0x00 ~ 0x20 or 0x40 ~ 0x50)
 	 */
-	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE0, (u8) ~ASTDP_CLEAR_MASK,
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE0, ASTDP_AND_CLEAR_MASK,
 				ASTDP_MISC0_24bpp);
-	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE1, (u8) ~ASTDP_CLEAR_MASK, ASTDP_MISC1);
-	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE2, (u8) ~ASTDP_CLEAR_MASK, ModeIdx);
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE1, ASTDP_AND_CLEAR_MASK, ASTDP_MISC1);
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE2, ASTDP_AND_CLEAR_MASK, ModeIdx);
 }
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index a34db4380..2e44b971c 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -433,7 +433,7 @@ int ast_mode_config_init(struct ast_private *ast);
  */
 #define ASTDP_MISC0_24bpp			BIT(5)
 #define ASTDP_MISC1				0
-#define ASTDP_CLEAR_MASK			GENMASK(7, 0)
+#define ASTDP_AND_CLEAR_MASK		0x00

 /*
  * ASTDP resoultion table:

base-commit: ab3bfa333f25d26bb8bf414419f9a2e6a46a141f
--
2.27.0

