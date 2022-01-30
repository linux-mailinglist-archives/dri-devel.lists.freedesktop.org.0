Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E964A38D5
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 20:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681F5113821;
	Sun, 30 Jan 2022 19:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BC3113820;
 Sun, 30 Jan 2022 19:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643572619; x=1675108619;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=e0DExOKSRqksgud5o6KyINTm4FJaKDLyTM+wfYfs0Hc=;
 b=GMbmLp/U6FGP/pjMHc+dGWSw02NPCzBaewJ8unKwKxlPcGHttmJTwGH2
 hRIszdfGAuhhdhJmsyDKLLcpFFG1jUOTcLUiStwzN0h/u8LEtGg1f/blh
 JOTja7cEGaU3F15SZNPAUN+6bhgPYyhxkiAvlCibcKKIgtGj4XKF9ro6O Q=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 30 Jan 2022 11:56:59 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 30 Jan 2022 11:56:57 -0800
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg02-blr.qualcomm.com with ESMTP; 31 Jan 2022 01:26:32 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 1FC8E21AD2; Mon, 31 Jan 2022 01:26:31 +0530 (IST)
From: Rajeev Nandan <quic_rajeevny@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v4 2/3] drm/msm/dsi: Add dsi phy tuning configuration support
Date: Mon, 31 Jan 2022 01:26:25 +0530
Message-Id: <1643572586-21331-3-git-send-email-quic_rajeevny@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643572586-21331-1-git-send-email-quic_rajeevny@quicinc.com>
References: <1643572586-21331-1-git-send-email-quic_rajeevny@quicinc.com>
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

Add support for MSM DSI PHY tuning configuration. Current design is
to support drive strength and drive level/amplitude tuning for
10nm PHY version, but this can be extended to other PHY versions.

Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes in v2:
 - New.
 - Split into generic code and 10nm-specific part (Dmitry Baryshkov)

Changes in v3:
 - s/ops.tuning_cfg_init/ops.parse_dt_properties
   To parse phy version specific DT properties (Dmitry Baryshkov)
 - Address comments for phy tuning data structure (Dmitry Baryshkov)

Changes in v4:
 - None

 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 6 ++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 8c65ef6..fcbca76 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -739,6 +739,12 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (phy->cfg->ops.parse_dt_properties) {
+		ret = phy->cfg->ops.parse_dt_properties(phy);
+		if (ret)
+			goto fail;
+	}
+
 	ret = dsi_phy_regulator_init(phy);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index b91303a..9e08081 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -25,6 +25,7 @@ struct msm_dsi_phy_ops {
 	void (*save_pll_state)(struct msm_dsi_phy *phy);
 	int (*restore_pll_state)(struct msm_dsi_phy *phy);
 	bool (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
+	int (*parse_dt_properties)(struct msm_dsi_phy *phy);
 };
 
 struct msm_dsi_phy_cfg {
@@ -81,6 +82,8 @@ struct msm_dsi_dphy_timing {
 #define DSI_PIXEL_PLL_CLK		1
 #define NUM_PROVIDED_CLKS		2
 
+#define DSI_LANE_MAX			5
+
 struct msm_dsi_phy {
 	struct platform_device *pdev;
 	void __iomem *base;
@@ -98,6 +101,7 @@ struct msm_dsi_phy {
 
 	struct msm_dsi_dphy_timing timing;
 	const struct msm_dsi_phy_cfg *cfg;
+	void *tuning_cfg;
 
 	enum msm_dsi_phy_usecase usecase;
 	bool regulator_ldo_mode;
-- 
2.7.4

