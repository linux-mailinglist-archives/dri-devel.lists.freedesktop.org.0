Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD9552586
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 22:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC48110EFEB;
	Mon, 20 Jun 2022 20:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C300810EFD3;
 Mon, 20 Jun 2022 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655755958; x=1687291958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=VDfaibFCTe3jpGHCmuuyfA8jD3qAMCpmRAJWmR+DhAs=;
 b=XX4rmDRlYPAXbPEXbXgmdDjy0Nljtwl2RLE7vKhWylhn2/ZEWLVqZ6OK
 OeMwK08s33nsh3uO3NDM34myK2Sv3N62LDViwDJM+og7lfkIT1wPd71Dw
 xOP+lf9jAru/MWQtxIgZ7pkiaJk0uwnQGjvOBnM02wUwmX2gw4aqbzVk9 c=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 20 Jun 2022 13:12:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 13:12:37 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 20 Jun 2022 13:12:37 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 20 Jun 2022 13:12:36 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v14 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
Date: Mon, 20 Jun 2022 13:12:22 -0700
Message-ID: <1655755943-28594-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655755943-28594-1-git-send-email-quic_khsieh@quicinc.com>
References: <1655755943-28594-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch add regulator_set_load() before enable regulator at
DP phy driver.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 40 ++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index c7309e981..e5836ea 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3119,6 +3119,17 @@ static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN, 0x2e),
 };
 
+/* list of regulators */
+struct qmp_regulator_data {
+	const char *name;
+	unsigned int enable_load;
+};
+
+struct qmp_regulator_data qmp_phy_vreg_l[] = {
+	{ .name = "vdda-phy", .enable_load = 21800 },
+	{ .name = "vdda-pll", .enable_load = 36000 },
+};
+
 struct qmp_phy;
 
 /* struct qmp_phy_cfg - per-PHY initialization config */
@@ -3173,7 +3184,7 @@ struct qmp_phy_cfg {
 	const char * const *reset_list;
 	int num_resets;
 	/* regulators to be requested */
-	const char * const *vreg_list;
+	const struct qmp_regulator_data *vreg_list;
 	int num_vregs;
 
 	/* array of registers with different offsets */
@@ -3385,11 +3396,6 @@ static const char * const sdm845_pciephy_reset_l[] = {
 	"phy",
 };
 
-/* list of regulators */
-static const char * const qmp_phy_vreg_l[] = {
-	"vdda-phy", "vdda-pll",
-};
-
 static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -5561,16 +5567,32 @@ static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int num = cfg->num_vregs;
-	int i;
+	int ret, i;
 
 	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
 	if (!qmp->vregs)
 		return -ENOMEM;
 
 	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
+		qmp->vregs[i].supply = cfg->vreg_list[i].name;
 
-	return devm_regulator_bulk_get(dev, num, qmp->vregs);
+	ret = devm_regulator_bulk_get(dev, num, qmp->vregs);
+	if (ret) {
+		dev_err(dev, "failed at devm_regulator_bulk_get\n");
+		return ret;
+	}
+
+	for (i = 0; i < num; i++) {
+		ret = regulator_set_load(qmp->vregs[i].consumer,
+					 cfg->vreg_list[i].enable_load);
+		if (ret) {
+			dev_err(dev, "failed to set load at %s\n",
+				qmp->vregs[i].supply);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

