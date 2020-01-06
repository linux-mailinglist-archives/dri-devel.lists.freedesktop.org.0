Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E527130E6F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 09:10:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB66F89F99;
	Mon,  6 Jan 2020 08:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6214F6E204;
 Mon,  6 Jan 2020 05:14:34 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 06 Jan 2020 10:44:28 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg02-blr.qualcomm.com with ESMTP; 06 Jan 2020 10:44:04 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id AEB2827C8; Mon,  6 Jan 2020 10:44:03 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v2] drm/msm: add support for 2.4.1 DSI version for sc7180 soc
Date: Mon,  6 Jan 2020 10:43:49 +0530
Message-Id: <1578287629-26709-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 06 Jan 2020 08:09:58 +0000
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
Cc: Harigovindan P <harigovi@codeaurora.org>, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modify commit text to indicate DSI version and SOC detail

Changes in v1:
	-Modify commit text to indicate DSI version and SOC detail(Jeffrey Hugo).
	-Splitting visionox panel driver code out into a
	 different patch(set), since panel drivers are merged into
	 drm-next via a different tree(Rob Clark).
Changes in v2:
	-Update commit text accordingly(Matthias Kaehlcke).

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index b7b7c1a..7b967dd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -133,6 +133,10 @@ static const char * const dsi_sdm845_bus_clk_names[] = {
 	"iface", "bus",
 };
 
+static const char * const dsi_sc7180_bus_clk_names[] = {
+	"iface", "bus",
+};
+
 static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
@@ -147,6 +151,20 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.num_dsi = 2,
 };
 
+static const struct msm_dsi_config sc7180_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdda", 21800, 4 },	/* 1.2 V */
+		},
+	},
+	.bus_clk_names = dsi_sc7180_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
+	.io_start = { 0xae94000 },
+	.num_dsi = 1,
+};
+
 const static struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
 	.link_clk_enable = dsi_link_clk_enable_v2,
 	.link_clk_disable = dsi_link_clk_disable_v2,
@@ -201,6 +219,9 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
+		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index e2b7a7d..9919536 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -19,6 +19,7 @@
 #define MSM_DSI_6G_VER_MINOR_V1_4_1	0x10040001
 #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
+#define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
