Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F4348C03F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE43112E3F;
	Wed, 12 Jan 2022 08:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E446611B4C7;
 Mon, 10 Jan 2022 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1641819371; x=1673355371;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=p+GfconfbCV29XFjTmFEjVwoR0nqMLcivRQLR9DnBfk=;
 b=BkMpfGZpZiBNlfUL+5tpTcOx8/6lHxiWahK46oC1znmT5i7Ew1g0cJX+
 thhyl2kxRljNZGdG299hD+p3vgzJU9IUlAEV1vmwo1f5T43yfYQV7JU4T
 l9y/wV8VMQxsN9SlAT5cFeGVdFRb6oKV42QHlBTkAUcswcY4T3k74Z1O7 0=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 10 Jan 2022 04:56:11 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 10 Jan 2022 04:56:09 -0800
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg02-blr.qualcomm.com with ESMTP; 10 Jan 2022 18:25:48 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 2D491219EE; Mon, 10 Jan 2022 18:25:47 +0530 (IST)
From: Rajeev Nandan <quic_rajeevny@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v2 3/3] drm/msm/dsi: Add 10nm dsi phy tuning configuration support
Date: Mon, 10 Jan 2022 18:25:37 +0530
Message-Id: <1641819337-17037-4-git-send-email-quic_rajeevny@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641819337-17037-1-git-send-email-quic_rajeevny@quicinc.com>
References: <1641819337-17037-1-git-send-email-quic_rajeevny@quicinc.com>
X-Mailman-Approved-At: Wed, 12 Jan 2022 08:51:42 +0000
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
Cc: quic_kalyant@quicinc.com, jonathan@marek.ca, airlied@linux.ie,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, quic_mkrishn@quicinc.com,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clock and data lanes of the DSI PHY have a calibration circuitry
feature. As per the MSM DSI PHY tuning guidelines, the drive strength
tuning can be done by adjusting rescode offset for hstop/hsbot, and
the drive level tuning can be done by adjusting the LDO output level
for the HSTX drive.

Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
---

Changes in v2:
 - Split into generic code and 10nm-specific part (Dmitry Baryshkov)
 - Fix the backward compatibility (Dmitry Baryshkov)

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 51 ++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index d8128f5..40cd0f7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -775,10 +775,13 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG2(i), 0x0);
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG3(i),
 			      i == 4 ? 0x80 : 0x0);
-		dsi_phy_write(lane_base +
-			      REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i), 0x0);
-		dsi_phy_write(lane_base +
-			      REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i), 0x0);
+
+		/* platform specific dsi phy drive strength adjustment */
+		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i),
+				phy->tuning_cfg.rescode_offset_top[i]);
+		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i),
+				phy->tuning_cfg.rescode_offset_bot[i]);
+
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(i),
 			      tx_dctrl[i]);
 	}
@@ -834,8 +837,9 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Select MS1 byte-clk */
 	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_GLBL_CTRL, 0x10);
 
-	/* Enable LDO */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_VREG_CTRL, 0x59);
+	/* Enable LDO with platform specific drive level/amplitude adjustment */
+	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_VREG_CTRL,
+		      phy->tuning_cfg.vreg_ctrl);
 
 	/* Configure PHY lane swap (TODO: we need to calculate this) */
 	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CFG0, 0x21);
@@ -922,6 +926,39 @@ static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 	DBG("DSI%d PHY disabled", phy->id);
 }
 
+static void dsi_10nm_phy_tuning_cfg_init(struct msm_dsi_phy *phy)
+{
+	struct device *dev = &phy->pdev->dev;
+	u8 offset_top[DSI_LANE_MAX] = { 0 }; /* No offset */
+	u8 offset_bot[DSI_LANE_MAX] = { 0 }; /* No offset */
+	u8 ldo_level = 0x1; /* 400mV */
+	int ret, i;
+
+	/* Drive strength adjustment parameters */
+	ret = of_property_read_u8_array(dev->of_node, "phy-resocde-offset-top",
+					offset_top, DSI_LANE_MAX);
+	if (ret && ret != -EINVAL)
+		DRM_DEV_ERROR(dev, "failed to parse phy-resocde-offset-top, %d\n", ret);
+
+	for (i = 0; i < DSI_LANE_MAX; i++)
+		phy->tuning_cfg.rescode_offset_top[i] = 0x3f & offset_top[i];
+
+	ret = of_property_read_u8_array(dev->of_node, "phy-resocde-offset-bot",
+					offset_bot, DSI_LANE_MAX);
+	if (ret && ret != -EINVAL)
+		DRM_DEV_ERROR(dev, "failed to parse phy-resocde-offset-bot, %d\n", ret);
+
+	for (i = 0; i < DSI_LANE_MAX; i++)
+		phy->tuning_cfg.rescode_offset_bot[i] = 0x3f & offset_bot[i];
+
+	/* Drive level/amplitude adjustment parameters */
+	ret = of_property_read_u8(dev->of_node, "phy-drive-ldo-level", &ldo_level);
+	if (ret && ret != -EINVAL)
+		DRM_DEV_ERROR(dev, "failed to parse phy-drive-ldo-level, %d\n", ret);
+
+	phy->tuning_cfg.vreg_ctrl = 0x58 | (0x7 & ldo_level);
+}
+
 const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 	.has_phy_lane = true,
 	.reg_cfg = {
@@ -936,6 +973,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.pll_init = dsi_pll_10nm_init,
 		.save_pll_state = dsi_10nm_pll_save_state,
 		.restore_pll_state = dsi_10nm_pll_restore_state,
+		.tuning_cfg_init = dsi_10nm_phy_tuning_cfg_init,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
@@ -957,6 +995,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.pll_init = dsi_pll_10nm_init,
 		.save_pll_state = dsi_10nm_pll_save_state,
 		.restore_pll_state = dsi_10nm_pll_restore_state,
+		.tuning_cfg_init = dsi_10nm_phy_tuning_cfg_init,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
-- 
2.7.4

