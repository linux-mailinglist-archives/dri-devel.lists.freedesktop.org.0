Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451C19A3683
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D64810E8A9;
	Fri, 18 Oct 2024 07:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UrPWEIax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85EC10E8B7;
 Fri, 18 Oct 2024 07:07:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HINIbE001599;
 Fri, 18 Oct 2024 07:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:date:from:in-reply-to:message-id:references:subject:to; s=
 qcppdkim1; bh=wlpdACvA53rb2EXphulb2RC2I/ybdq5JwnFU+8FSb8o=; b=Ur
 PWEIaxDoonWe7Sxb3bu4yWpy7+dexSH6kfchrtgU+g+su3xk1NdFsaW51/DpzoMK
 CE4T4q9v/zzTPmT3unRtOfVTxftdoR00fbOtE1oBagWWqiyNP20LKUdUz7plUgIj
 6gZC3sj3G9v5wY7FPdqYdfZLIsApi+WogY1Ysrn/yR0WcBWpmJyx3jlmsV4PkjUc
 wutxfe6HyYM5JEi6EwsGrz9ZTb4pmLAXNpnJE17ZCTDgc3360o4Z83sXTKA14KmN
 xXDCCBEJV0wubSi6ec33w2fNk91gij2irtz5K6OcGaTAznIYk/kGj2JRn6+MV1fR
 Up++W6dnkqbWOwUhndkg==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5d6x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 07:07:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49I779rg019791; 
 Fri, 18 Oct 2024 07:07:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 427j6mpjan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 18 Oct 2024 07:07:09 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49I779Me019765;
 Fri, 18 Oct 2024 07:07:09 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com
 [10.147.244.250])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 49I778MO019762;
 Fri, 18 Oct 2024 07:07:09 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
 id EA2B45299CC; Fri, 18 Oct 2024 12:37:07 +0530 (+0530)
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
Subject: [PATCH v5 2/5] phy: qcom: edp: Introduce aux_cfg array for version
 specific aux settings
Date: Fri, 18 Oct 2024 12:37:03 +0530
Message-Id: <20241018070706.28980-3-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241018070706.28980-1-quic_mukhopad@quicinc.com>
References: <20241018070706.28980-1-quic_mukhopad@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: r38blCsEIVEjFxZqkTzWI5r4V1rsskfj
X-Proofpoint-ORIG-GUID: r38blCsEIVEjFxZqkTzWI5r4V1rsskfj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180043
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
---
v2: Fixed review comments from Bjorn and Dmitry
	- Made aux_cfg array as const.

v3: Fixed review comments from Dmitry
	- Used a for loop to write the dp_phy_aux_cfg registers.
	- Pre-defined the aux_cfg size to prevent any magic numbers.

v4: No change

v5: No change

---
 drivers/phy/qualcomm/phy-qcom-edp.c | 41 ++++++++++++-----------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index da2b32fb5b45..2ecff164ec44 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -32,16 +32,8 @@
 #define DP_PHY_PD_CTL                           0x001c
 #define DP_PHY_MODE                             0x0020
 
-#define DP_PHY_AUX_CFG0				0x0024
-#define DP_PHY_AUX_CFG1				0x0028
-#define DP_PHY_AUX_CFG2				0x002C
-#define DP_PHY_AUX_CFG3				0x0030
-#define DP_PHY_AUX_CFG4				0x0034
-#define DP_PHY_AUX_CFG5				0x0038
-#define DP_PHY_AUX_CFG6				0x003C
-#define DP_PHY_AUX_CFG7				0x0040
-#define DP_PHY_AUX_CFG8				0x0044
-#define DP_PHY_AUX_CFG9				0x0048
+#define DP_AUX_CFG_SIZE                         10
+#define DP_PHY_AUX_CFG(n)                       (0x24 + (0x04 * (n)))
 
 #define DP_PHY_AUX_INTERRUPT_MASK		0x0058
 
@@ -90,6 +82,7 @@ struct phy_ver_ops {
 
 struct qcom_edp_phy_cfg {
 	bool is_edp;
+	const u8 *aux_cfg;
 	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
 	const struct phy_ver_ops *ver_ops;
 };
@@ -186,11 +179,15 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
 	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
 };
 
+static const u8 edp_phy_aux_cfg_v4[10] = {
+	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
+};
+
 static int qcom_edp_phy_init(struct phy *phy)
 {
 	struct qcom_edp *edp = phy_get_drvdata(phy);
+	u8 aux_cfg[DP_AUX_CFG_SIZE];
 	int ret;
-	u8 cfg8;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
 	if (ret)
@@ -200,6 +197,8 @@ static int qcom_edp_phy_init(struct phy *phy)
 	if (ret)
 		goto out_disable_supplies;
 
+	memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
+
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       edp->edp + DP_PHY_PD_CTL);
@@ -222,22 +221,12 @@ static int qcom_edp_phy_init(struct phy *phy)
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
+	for (int i = 0; i < DP_AUX_CFG_SIZE; i++)
+		writel(aux_cfg[i], edp->edp + DP_PHY_AUX_CFG(i));
 
 	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
 	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
@@ -519,16 +508,19 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
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
@@ -707,6 +699,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 };
 
 static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
+	.aux_cfg = edp_phy_aux_cfg_v4,
 	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v6,
 };
-- 
2.17.1

