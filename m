Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660439FC2F3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 01:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C9B10E06E;
	Wed, 25 Dec 2024 00:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FECF10E06E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 00:32:18 +0000 (UTC)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 25 Dec
 2024 08:32:15 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 25 Dec 2024 08:32:15 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <tzimmermann@suse.de>, <jfalempe@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@redhat.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] drm/ast: Support timings, 1280x720/1280x960/1600x900
Date: Wed, 25 Dec 2024 08:32:15 +0800
Message-ID: <20241225003215.1343996-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

In this patch, 3 new timings are added into support list.

If you want to have new timings, 1280x720 and 1280x960 on DisplayPort,
your dp-fw should be newer than version, 20240502.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
v2:
 - Fix build errors.
v3:
 - Fix typo.
---
 drivers/gpu/drm/ast/ast_dp.c     |  9 ++++++++-
 drivers/gpu/drm/ast/ast_drv.h    |  3 +++
 drivers/gpu/drm/ast/ast_mode.c   | 14 ++++++++++++++
 drivers/gpu/drm/ast/ast_tables.h | 18 ++++++++++++++++++
 4 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 0e282b7b167c..0b56f0335871 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -255,6 +255,10 @@ static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *v
 	case 1280:
 		if (crtc->mode.crtc_vdisplay == 800)
 			ModeIdx = (ASTDP_1280x800_60_RB - (u8) ulRefreshRateIndex);
+		else if (crtc->mode.crtc_vdisplay == 720)
+			ModeIdx = ASTDP_1280x720_60;
+		else if (crtc->mode.crtc_vdisplay == 960)
+			ModeIdx = ASTDP_1280x960_60;
 		else		// 1024
 			ModeIdx = (ASTDP_1280x1024_60 + (u8) ulRefreshRateIndex);
 		break;
@@ -267,7 +271,10 @@ static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *v
 		break;
 	case 1600:
 		if (crtc->mode.crtc_vdisplay == 900)
-			ModeIdx = (ASTDP_1600x900_60_RB - (u8) ulRefreshRateIndex);
+			if (ulRefreshRateIndex == 2)
+				ModeIdx = ASTDP_1600x900_60_DMT;
+			else
+				ModeIdx = (ASTDP_1600x900_60_RB - (u8) ulRefreshRateIndex);
 		else		//1200
 			ModeIdx = ASTDP_1600x1200_60;
 		break;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 21ce3769bf0d..e7cef334b3ec 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -442,6 +442,9 @@ int ast_mode_config_init(struct ast_device *ast);
 #define ASTDP_1600x900_60_RB	0x1D
 #define ASTDP_1366x768_60		0x1E
 #define ASTDP_1152x864_75		0x1F
+#define ASTDP_1600x900_60_DMT		0x51
+#define ASTDP_1280x720_60		0x52
+#define ASTDP_1280x960_60		0x53
 
 int ast_mm_init(struct ast_device *ast);
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 9d5321c81e68..48d1065846a2 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -147,6 +147,10 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
 	case 1280:
 		if (mode->crtc_vdisplay == 800)
 			vbios_mode->enh_table = &res_1280x800[refresh_rate_index];
+		else if (mode->crtc_vdisplay == 720)
+			vbios_mode->enh_table = &res_1280x720[refresh_rate_index];
+		else if (mode->crtc_vdisplay == 960)
+			vbios_mode->enh_table = &res_1280x960[refresh_rate_index];
 		else
 			vbios_mode->enh_table = &res_1280x1024[refresh_rate_index];
 		break;
@@ -475,6 +479,12 @@ static void ast_set_dclk_reg(struct ast_device *ast,
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xbb, 0x0f,
 			       (clk_info->param3 & 0xc0) |
 			       ((clk_info->param3 & 0x3) << 4));
+
+	/* Set SEQ; Half dclk for this timing */
+	if (vbios_mode->enh_table->flags & HalfDCLK)
+		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xff, 0x08);
+	else
+		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xf7, 0x00);
 }
 
 static void ast_set_color_reg(struct ast_device *ast,
@@ -1027,8 +1037,12 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
 	if (ast->support_wide_screen) {
 		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
 			return MODE_OK;
+		if ((mode->hdisplay == 1280) && (mode->vdisplay == 960))
+			return MODE_OK;
 		if ((mode->hdisplay == 1280) && (mode->vdisplay == 800))
 			return MODE_OK;
+		if ((mode->hdisplay == 1280) && (mode->vdisplay == 720))
+			return MODE_OK;
 		if ((mode->hdisplay == 1440) && (mode->vdisplay == 900))
 			return MODE_OK;
 		if ((mode->hdisplay == 1360) && (mode->vdisplay == 768))
diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
index 0378c9bc079b..329d6bac867b 100644
--- a/drivers/gpu/drm/ast/ast_tables.h
+++ b/drivers/gpu/drm/ast/ast_tables.h
@@ -254,6 +254,13 @@ static const struct ast_vbios_enhtable res_1024x768[] = {
 	 (SyncPP | Charx8Dot), 0xFF, 4, 0x31 },
 };
 
+static const struct ast_vbios_enhtable res_1280x960[] = {
+	{1800, 1280, 96, 112, 1000, 960, 1, 3, VCLK108, /* 60Hz */
+	 (SyncPP | Charx8Dot), 60, 1, 0x3E },
+	{1800, 1280, 96, 112, 1000, 960, 1, 3, VCLK108, /* end */
+	 (SyncPP | Charx8Dot), 0xFF, 1, 0x3E },
+};
+
 static const struct ast_vbios_enhtable res_1280x1024[] = {
 	{1688, 1280, 48, 112, 1066, 1024, 1, 3, VCLK108,	/* 60Hz */
 	 (SyncPP | Charx8Dot), 60, 1, 0x32 },
@@ -280,6 +287,15 @@ static const struct ast_vbios_enhtable res_1152x864[] = {
 };
 
 /* 16:9 */
+static const struct ast_vbios_enhtable res_1280x720[] = {
+	{1650, 1280, 110, 40, 750, 720, 5, 5, VCLK148_5,	/* 60Hz */
+	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	  HalfDCLK), 60, 1, 0x3D },
+	{1650, 1280, 110, 40, 750, 720, 5, 5, VCLK148_5,	/* end */
+	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	  HalfDCLK), 0xFF, 1, 0x3D },
+};
+
 static const struct ast_vbios_enhtable res_1360x768[] = {
 	{1792, 1360, 64, 112, 795, 768, 3, 6, VCLK85_5,		/* 60Hz */
 	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x39 },
@@ -294,6 +310,8 @@ static const struct ast_vbios_enhtable res_1600x900[] = {
 	  AST2500PreCatchCRT), 60, 1, 0x3A },
 	{2112, 1600, 88, 168, 934, 900, 3, 5, VCLK118_25,	/* 60Hz CVT */
 	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x3A },
+	{1800, 1600, 24, 80, 1000, 900, 1, 3, VCLK108,		/* 60Hz DMT */
+	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 3, 0x3A },
 	{2112, 1600, 88, 168, 934, 900, 3, 5, VCLK118_25,	/* 60Hz CVT */
 	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 2, 0x3A },
 };

base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
-- 
2.25.1

