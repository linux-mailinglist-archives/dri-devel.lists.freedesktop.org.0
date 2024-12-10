Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869359EA90A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 07:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053E610E378;
	Tue, 10 Dec 2024 06:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dl8v7R1J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2B510E384;
 Tue, 10 Dec 2024 06:55:38 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9IgcSv015737;
 Tue, 10 Dec 2024 06:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Yc2PtW5yyNzZBMicbxKBQeB8xMCcHY6QG1yD/ZctLlE=; b=dl8v7R1JQ0zXd4zJ
 fA9pef358rIcslM6B80MKwQOc8Tg4Zi0DvN8qFFdgVQeSrmR0H2zAQ/z7wg14VJ4
 Yq3kuues5spM4dJ+ADP4suaA8LFBjeKXv2UbVIb/p7hDjshyzIK1iXhMD29DM0K5
 7FqXYk4rDWXrIy57gdT5uFO3+YQznA030AHRKcMhZLCpTRVJk6xeTFaXSnNS+EKy
 8wb1CBPkVtWK4KDvpF/G5cdBuRyZVbZuhChnjPz6Oi0VsCC57NLAkEqrR54IycMM
 KCBMzkAQ3WbUmee1+/eVewhnsiysXgMGyLZ1ObZOm+zHmWnSlg8pCXY+gzJivRFx
 hYWL0g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dy8tu0mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 06:55:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA6tXxI004041
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 06:55:33 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 22:55:26 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Tue, 10 Dec 2024 14:53:57 +0800
Subject: [PATCH v4 6/9] drm/msm/dsi: Add dsi phy support for SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-add-display-support-for-qcs615-platform-v4-6-2d875a67602d@quicinc.com>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Fange Zhang <quic_fangez@quicinc.com>, Liu Li <quic_lliu6@quicinc.com>,
 Xiangxu Yin <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733813687; l=3272;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=O8+ldMo7RBtiNgUHcF32YKbaoaqudqu+xuNbIbo120E=;
 b=FTeYH03RpmeRyNkVNB+ZvotzV0WOhnjr9JajAm+cYnDcinVRUrhMuaH7RhNfJrQRypKdIzRjr
 HASmreTkXGBDrcY/qLqB1Mj8zpezL/xOvWDBY46iRhFet9+u6Pnbblj
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: C5Ha-RjoQ_5KQSBoPYtAKZfz5oV_IvYn
X-Proofpoint-GUID: C5Ha-RjoQ_5KQSBoPYtAKZfz5oV_IvYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412100051
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

From: Li Liu <quic_lliu6@quicinc.com>

Add phy configuration for SM6150

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index dd58bc0a49eb5ca96370f7832d9251609ac0c552..c0bcc68289633fd7506ce4f1f963655d862e8f08 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -567,6 +567,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_14nm_8953_cfgs },
 	{ .compatible = "qcom,sm6125-dsi-phy-14nm",
 	  .data = &dsi_phy_14nm_2290_cfgs },
+	{ .compatible = "qcom,sm6150-dsi-phy-14nm",
+	  .data = &dsi_phy_14nm_6150_cfgs },
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
 	{ .compatible = "qcom,dsi-phy-10nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 4953459edd636363614ecad85654614fc95cfa1d..8985818bb2e0934e9084a420c90e2269c2e1c414 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -46,6 +46,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8937_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_14nm_6150_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 1723f0e4faa4e4fd612d66f9976e80e045eafcc8..2c3cbe0f2870e7d68b9563957de8621f7cd36b78 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1032,6 +1032,10 @@ static const struct regulator_bulk_data dsi_phy_14nm_73p4mA_regulators[] = {
 	{ .supply = "vcca", .init_load_uA = 73400 },
 };
 
+static const struct regulator_bulk_data dsi_phy_14nm_36mA_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 36000 },
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_14nm_17mA_regulators,
@@ -1097,3 +1101,20 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs = {
 	.io_start = { 0x5e94400 },
 	.num_dsi_phy = 1,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_14nm_6150_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_14nm_36mA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_14nm_36mA_regulators),
+	.ops = {
+		.enable = dsi_14nm_phy_enable,
+		.disable = dsi_14nm_phy_disable,
+		.pll_init = dsi_pll_14nm_init,
+		.save_pll_state = dsi_14nm_pll_save_state,
+		.restore_pll_state = dsi_14nm_pll_restore_state,
+	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
+	.io_start = { 0xae94400 },
+	.num_dsi_phy = 1,
+};

-- 
2.34.1

