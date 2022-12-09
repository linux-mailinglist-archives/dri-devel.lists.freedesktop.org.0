Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98982648015
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 10:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A070310E235;
	Fri,  9 Dec 2022 09:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 854 seconds by postgrey-1.36 at gabe;
 Fri, 09 Dec 2022 09:25:18 UTC
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0247D10E235
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 09:25:18 +0000 (UTC)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 2B992Z7M011872
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Dec 2022 17:02:35 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2B992MCj011858;
 Fri, 9 Dec 2022 17:02:22 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 9 Dec 2022 17:10:51 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <airlied@redhat.com>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ast: Fix no display at WayLand after power-off
Date: Fri, 9 Dec 2022 17:11:43 +0800
Message-ID: <20221209091143.6290-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2B992MCj011858
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

With WayLand, there is error log when display waken up from power-off:
gnome-shell: Failed to post KMS update: CRTC property (GAMMA_LUT) not found
gnome-shell: Page flip discarded: CRTC property (GAMMA_LUT) not found

To fix the issue, enable GAMMA_LUT property on CRTC.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_drv.h  | 2 ++
 drivers/gpu/drm/ast/ast_mode.c | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 2e44b971c3a6..fd9af1cf0563 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -86,6 +86,8 @@ enum ast_tx_chip {
 #define AST_DRAM_4Gx16   7
 #define AST_DRAM_8Gx16   8
 
+#define MAX_COLOR_LUT_ENTRIES 256
+
 /*
  * Cursor plane
  */
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 1bc0220e6783..87bd9697bb44 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -74,7 +74,7 @@ static void ast_crtc_load_lut(struct ast_private *ast, struct drm_crtc *crtc)
 	g = r + crtc->gamma_size;
 	b = g + crtc->gamma_size;
 
-	for (i = 0; i < 256; i++)
+	for (i = 0; i < MAX_COLOR_LUT_ENTRIES; i++)
 		ast_load_palette_index(ast, i, *r++ >> 8, *g++ >> 8, *b++ >> 8);
 }
 
@@ -1323,7 +1323,8 @@ static int ast_crtc_init(struct drm_device *dev)
 	if (ret)
 		return ret;
 
-	drm_mode_crtc_set_gamma_size(crtc, 256);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, MAX_COLOR_LUT_ENTRIES);
+	drm_mode_crtc_set_gamma_size(crtc, MAX_COLOR_LUT_ENTRIES);
 	drm_crtc_helper_add(crtc, &ast_crtc_helper_funcs);
 
 	return 0;

base-commit: 8ed710da2873c2aeb3bb805864a699affaf1d03b
-- 
2.25.1

