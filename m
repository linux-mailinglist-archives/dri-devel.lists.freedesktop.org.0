Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D770395CA8
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 15:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819366E4D2;
	Mon, 31 May 2021 13:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D507F6E4D2;
 Mon, 31 May 2021 13:34:42 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 31 May 2021 06:34:42 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 31 May 2021 06:34:41 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 31 May 2021 19:04:15 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 7D62421485; Mon, 31 May 2021 19:04:14 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1 3/3] drm/msm/dsi: Add DSI support for SC7280
Date: Mon, 31 May 2021 19:03:55 +0530
Message-Id: <1622468035-8453-4-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
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
Cc: mkrishn@codeaurora.org, jonathan@marek.ca,
 Rajeev Nandan <rajeevny@codeaurora.org>, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, robh+dt@kernel.org, kalyan_t@codeaurora.org,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for v2.5.0 DSI block in the SC7280 SoC.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index f3f1c03..d76a680 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -200,6 +200,24 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
 	.num_dsi = 1,
 };
 
+static const char * const dsi_sc7280_bus_clk_names[] = {
+	"iface", "bus",
+};
+
+static const struct msm_dsi_config sc7280_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdda", 8350, 0 },	/* 1.2 V */
+		},
+	},
+	.bus_clk_names = dsi_sc7280_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
+	.io_start = { 0xae94000 },
+	.num_dsi = 1,
+};
+
 static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
 	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
 	.link_clk_enable = dsi_link_clk_enable_v2,
@@ -267,6 +285,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
 		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
+		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index ade9b60..b2c4d5e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -24,6 +24,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_3_0	0x20030000
 #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
+#define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.7.4

