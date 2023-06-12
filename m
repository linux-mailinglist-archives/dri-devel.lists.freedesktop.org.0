Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 968CF72D42C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 00:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F2210E1E0;
	Mon, 12 Jun 2023 22:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBB710E114;
 Mon, 12 Jun 2023 22:10:55 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35CLwqfo007881; Mon, 12 Jun 2023 22:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=U8376kYwvNcLdvrh9ei6usddcwH1fXpA+G/yhvlgDh0=;
 b=dehpolmnKuIjl9bWSGOLoyv4FlXpZcwDj7Ch9iArPZZmhUjk9cvrcUpmi6Gex9kZSAKZ
 Lzl/g/z3ubv9ZmuT6XfYBGGzUzdksrA/Z3anm/EymIxPKhEeTPpQU0rkQme7QUmJzjUQ
 3TFEn4/EqmHkB4KEETSiff1vSC2l8J4/YozebhGdaXpP+AYVWpyqKbBjqQ+s7Re7Fx+9
 gmSIEQGtUBJPVvM8HorM3B7VZMVHdhLeIqO9RRTc/wlGf7i3yyrUsgveJXIz1jQ/mKrO
 yCwkoi5OIR3X73+dYSKTwxVYBSmRE2XcWN+xOIDJRH048eX0BDR36cAV0BRDNohtbS6U cg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r69gx07c2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 22:10:53 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35CMAqCi017477
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 22:10:52 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 12 Jun 2023 15:10:52 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dpu: Configure DP INTF/PHY selector
Date: Mon, 12 Jun 2023 15:10:47 -0700
Message-ID: <20230612221047.1886709-1-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qc1nfnW5ECYxH0bUVto41Lz2HY7qM3d-
X-Proofpoint-GUID: qc1nfnW5ECYxH0bUVto41Lz2HY7qM3d-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_16,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306120191
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Some platforms provides a mechanism for configuring the mapping between
(one or two) DisplayPort intfs and their PHYs.

In particular SC8180X provides this functionality, without a default
configuration, resulting in no connection between its two external
DisplayPort controllers and any PHYs.

The change implements the logic for optionally configuring which phy
each of the intfs should be connected to, provides a new entry in the
DPU catalog for specifying how many intfs to configure and marks the
SC8180X DPU to program 2 entries.

For now the request is simply to program the mapping 1:1, any support
for alternative mappings is left until the use case arrise.

Note that e.g. msm-4.14 unconditionally maps intf 0 to phy 0 on all
rlatforms, so perhaps this is needed in order to get DisplayPort working
on some other platforms as well.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 23 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h      |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 10 ++++++++
 6 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 8ed2b263c5ea..9da952692a69 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -19,6 +19,7 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.num_dp_intf_sel = 2,
 };
 
 static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ac4a9e73705c..4cb8d096d8ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -357,6 +357,7 @@ struct dpu_rotation_cfg {
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
+ * @num_dp_intf_sel    number of DP intfs to configure PHY selection for
  */
 struct dpu_caps {
 	u32 max_mixer_width;
@@ -371,6 +372,7 @@ struct dpu_caps {
 	u32 pixel_ram_size;
 	u32 max_hdeci_exp;
 	u32 max_vdeci_exp;
+	u32 num_dp_intf_sel;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 963bdb5e0252..5afa99cb148c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -250,6 +250,27 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
 	DPU_REG_WRITE(c, HDMI_DP_CORE_SELECT, 0x1);
 }
 
+static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp, unsigned int *phys,
+				   unsigned int num_intfs)
+{
+	struct dpu_hw_blk_reg_map *c = &mdp->hw;
+	unsigned int intf;
+	u32 sel = 0;
+
+	if (!num_intfs)
+		return;
+
+	for (intf = 0; intf < num_intfs; intf++) {
+		/* Specify the PHY (1-indexed) for @intf */
+		sel |= (phys[intf] + 1) << (intf * 3);
+
+		/* Specify the @intf (1-indexed) of targeted PHY */
+		sel |= (intf + 1) << (6 + phys[intf] * 3);
+	}
+
+	DPU_REG_WRITE(c, DP_PHY_INTF_SEL, sel);
+}
+
 static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 		unsigned long cap)
 {
@@ -264,6 +285,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 
 	ops->get_safe_status = dpu_hw_get_safe_status;
 
+	ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
+
 	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index a1a9e44bed36..8446d74d59b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -125,6 +125,14 @@ struct dpu_hw_mdp_ops {
 	void (*get_safe_status)(struct dpu_hw_mdp *mdp,
 			struct dpu_danger_safe_status *status);
 
+	/**
+	 * dp_phy_intf_sel - configure intf to phy mapping
+	 * @mdp: mdp top context driver
+	 * @phys: list of phys the @num_intfs intfs should be connected to
+	 * @num_intfs: number of intfs to configure
+	 */
+	void (*dp_phy_intf_sel)(struct dpu_hw_mdp *mdp, unsigned int *phys,
+			        unsigned int num_intfs);
 	/**
 	 * intf_audio_select - select the external interface for audio
 	 * @mdp: mdp top context driver
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
index 5acd5683d25a..6d31bdc7269c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
@@ -59,6 +59,7 @@
 #define MDP_WD_TIMER_4_CTL2             0x444
 #define MDP_WD_TIMER_4_LOAD_VALUE       0x448
 #define DCE_SEL                         0x450
+#define DP_PHY_INTF_SEL                 0x460
 
 #define MDP_PERIPH_TOP0			MDP_WD_TIMER_0_CTL
 #define MDP_PERIPH_TOP0_END		CLK_CTRL3
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa8499de1b9f..5dbe5d164c01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1011,6 +1011,14 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 	return clk_get_rate(clk);
 }
 
+static void dpu_kms_dp_phy_intf_sel(struct dpu_kms *dpu_kms)
+{
+	const unsigned int num_intfs = dpu_kms->catalog->caps->num_dp_intf_sel;
+	static unsigned int phy_map[] = {0, 1, 2};
+
+	dpu_kms->hw_mdp->ops.dp_phy_intf_sel(dpu_kms->hw_mdp, phy_map, num_intfs);
+}
+
 static int dpu_kms_hw_init(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms;
@@ -1122,6 +1130,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto perf_err;
 	}
 
+	dpu_kms_dp_phy_intf_sel(dpu_kms);
+
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
 	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
-- 
2.25.1

