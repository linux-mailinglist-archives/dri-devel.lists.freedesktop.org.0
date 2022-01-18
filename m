Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE22493151
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 00:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7086910E3A7;
	Tue, 18 Jan 2022 23:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BBC10E563;
 Tue, 18 Jan 2022 20:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642538357; x=1674074357;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=olQj1msD4M7/FQRNOeMu67bagrHFQifrZzE3M4WfIvU=;
 b=oeDMebE3F4N1smFErAxJ+gEtisznXBdFGqutQ/5/IhTAwwa2Fp4NKppJ
 P8DUmNauQbkZ9qrkmVSu9NUNHQbiV8X30PTs7AWTyRTL6LFgksKg8kxPf
 q0SnUPzzrHWXlXUVfna5wZtGUOuMjoWqCiK2g89ZDNnBhxESoqtsSiBrM A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 18 Jan 2022 12:39:17 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Jan 2022 12:39:14 -0800
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 19 Jan 2022 02:08:48 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 38D6321A9A; Wed, 19 Jan 2022 02:08:47 +0530 (IST)
From: Rajeev Nandan <quic_rajeevny@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v3 2/3] drm/msm/dsi: Add dsi phy tuning configuration support
Date: Wed, 19 Jan 2022 02:08:39 +0530
Message-Id: <1642538320-1127-3-git-send-email-quic_rajeevny@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642538320-1127-1-git-send-email-quic_rajeevny@quicinc.com>
References: <1642538320-1127-1-git-send-email-quic_rajeevny@quicinc.com>
X-Mailman-Approved-At: Tue, 18 Jan 2022 23:17:04 +0000
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
---

Changes in v2:
 - New.
 - Split into generic code and 10nm-specific part (Dmitry Baryshkov)

Changes in v3:
 - s/ops.tuning_cfg_init/ops.parse_dt_properties
   To parse phy version specific DT properties (Dmitry Baryshkov)
 - Address comments for phy tuning data structure (Dmitry Baryshkov)


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

