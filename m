Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D645F977DBD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 12:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0925910ECE0;
	Fri, 13 Sep 2024 10:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iaAOnv2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5555010ECDA;
 Fri, 13 Sep 2024 10:38:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48D9r2Nj018682;
 Fri, 13 Sep 2024 10:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:date:from:in-reply-to:message-id:references:subject:to; s=
 qcppdkim1; bh=MRwoQF8PbLzvkea1DwX2IEwwBiSeu4BazAQQVlvFEQY=; b=ia
 AOnv2rPTl1tivi4bUpqewmXX3YUfhw/XXjNXgaD3SNkgTy/qpOnLwhxRicNbEwpn
 K3TuPPK+NAcK065+pslNXaHSaruxg8f920RqP3LBkc7EJp1nzaykvLfCmc6rOoH/
 1aPZQG8jNOZ2oDu//4aSiifd1Kz5YllShRLmGb7hWx3B+CyvgSxOzU2gTmOoVZQp
 57dWlkdSJVorRVPKSIuiIw29uQhyan+Y3u7OxWmY7UQUUmKkD2+O99hFWNiZSP3g
 pz+V64FnLUIK9OW9WsTaew83h+be6/0mq90+9yPdQOVb9av/bAdG7KpzXdHOJPUy
 1WsuOnZaK0B+l0PJxXkA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41j6gn4q2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2024 10:38:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAc3pP032445; 
 Fri, 13 Sep 2024 10:38:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41h1698fea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 13 Sep 2024 10:38:03 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48DAc2Ov032412;
 Fri, 13 Sep 2024 10:38:02 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com
 [10.147.244.250])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 48DAc23B032388;
 Fri, 13 Sep 2024 10:38:02 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
 id 898A05000AD; Fri, 13 Sep 2024 16:08:01 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org,
 andersson@kernel.org, simona@ffwll.ch, dmitry.baryshkov@linaro.org,
 abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org,
 quic_parellan@quicinc.com, quic_bjorande@quicinc.com
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: [PATCH v2 2/5] phy: qcom: edp: Introduce aux_cfg array for version
 specific aux settings
Date: Fri, 13 Sep 2024 16:07:52 +0530
Message-Id: <20240913103755.7290-3-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HMwBu4zhHxLqMO1-0BhZ-XIQLbQfKwmP
X-Proofpoint-GUID: HMwBu4zhHxLqMO1-0BhZ-XIQLbQfKwmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130073
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

In order to support different HW versions, introduce aux_cfg array
to move v4 specific aux configuration settings.

Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
---
v2: Fixed review comments from Bjorn and Dmitry
	- Made aux_cfg array as const.

---
 drivers/phy/qualcomm/phy-qcom-edp.c | 37 ++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index da2b32fb5b45..bcd5aced9e06 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -90,6 +90,7 @@ struct phy_ver_ops {
 
 struct qcom_edp_phy_cfg {
 	bool is_edp;
+	const u8 *aux_cfg;
 	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
 	const struct phy_ver_ops *ver_ops;
 };
@@ -186,11 +187,15 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
 	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
 };
 
+static const u8 edp_phy_aux_cfg_v4[10] = {
+	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
+};
+
 static int qcom_edp_phy_init(struct phy *phy)
 {
 	struct qcom_edp *edp = phy_get_drvdata(phy);
+	u8 aux_cfg[10];
 	int ret;
-	u8 cfg8;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
 	if (ret)
@@ -200,6 +205,8 @@ static int qcom_edp_phy_init(struct phy *phy)
 	if (ret)
 		goto out_disable_supplies;
 
+	memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
+
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       edp->edp + DP_PHY_PD_CTL);
@@ -222,22 +229,20 @@ static int qcom_edp_phy_init(struct phy *phy)
 	 * even needed.
 	 */
 	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
-		cfg8 = 0xb7;
-	else
-		cfg8 = 0x37;
+		aux_cfg[8] = 0xb7;
 
 	writel(0xfc, edp->edp + DP_PHY_MODE);
 
-	writel(0x00, edp->edp + DP_PHY_AUX_CFG0);
-	writel(0x13, edp->edp + DP_PHY_AUX_CFG1);
-	writel(0x24, edp->edp + DP_PHY_AUX_CFG2);
-	writel(0x00, edp->edp + DP_PHY_AUX_CFG3);
-	writel(0x0a, edp->edp + DP_PHY_AUX_CFG4);
-	writel(0x26, edp->edp + DP_PHY_AUX_CFG5);
-	writel(0x0a, edp->edp + DP_PHY_AUX_CFG6);
-	writel(0x03, edp->edp + DP_PHY_AUX_CFG7);
-	writel(cfg8, edp->edp + DP_PHY_AUX_CFG8);
-	writel(0x03, edp->edp + DP_PHY_AUX_CFG9);
+	writel(aux_cfg[0], edp->edp + DP_PHY_AUX_CFG0);
+	writel(aux_cfg[1], edp->edp + DP_PHY_AUX_CFG1);
+	writel(aux_cfg[2], edp->edp + DP_PHY_AUX_CFG2);
+	writel(aux_cfg[3], edp->edp + DP_PHY_AUX_CFG3);
+	writel(aux_cfg[4], edp->edp + DP_PHY_AUX_CFG4);
+	writel(aux_cfg[5], edp->edp + DP_PHY_AUX_CFG5);
+	writel(aux_cfg[6], edp->edp + DP_PHY_AUX_CFG6);
+	writel(aux_cfg[7], edp->edp + DP_PHY_AUX_CFG7);
+	writel(aux_cfg[8], edp->edp + DP_PHY_AUX_CFG8);
+	writel(aux_cfg[9], edp->edp + DP_PHY_AUX_CFG9);
 
 	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
 	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
@@ -519,16 +524,19 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 };
 
 static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
+	.aux_cfg = edp_phy_aux_cfg_v4,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
+	.aux_cfg = edp_phy_aux_cfg_v4,
 	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
 	.is_edp = true,
+	.aux_cfg = edp_phy_aux_cfg_v4,
 	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
@@ -707,6 +715,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 };
 
 static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
+	.aux_cfg = edp_phy_aux_cfg_v4,
 	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v6,
 };
-- 
2.17.1

