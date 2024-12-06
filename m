Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D289E65CF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567A510F023;
	Fri,  6 Dec 2024 04:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="L+1EbKa5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C121310F020;
 Fri,  6 Dec 2024 04:33:23 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HbIwr006794;
 Fri, 6 Dec 2024 04:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XeuLJmAi+uRqJ0yIkxmgI6MBu8EWFJH5JsZQu6zK2Pc=; b=L+1EbKa5EHNxveDI
 tFVHpTD1V501Te3bUZJeRQBPZ+mlJrsXJmjCADrDZ4Tucsw6SqOpqcUReDXm771J
 ALmcjKsZxJfwvyidrhMPYNM0q87qKEctQrCnWvttKxfpoBEHzPJquHnDxnYu8hzW
 oYN4un32Woej3BLfZIfgk+16KDWEtko2c9aHUgyWjL4cOEEaPV0f3HSjBSM6HvUv
 5OfhOLxcTCaRTjJYksGL21m33+YtosfhgW/ft684ACVFvsHwwutfYDFRnUrO6lxd
 6BxtmsWYsuWT7w6u4s9eekGY5Fkpj3iPy4iCxS0kIE/0pTmCmHViQLOUEw6JUFYR
 93Ff/Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba142k8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WlSV017280
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:47 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:46 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:11 -0800
Subject: [PATCH 40/45] drm/msm: add a stream to intf map for DP controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-40-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=3821;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=8CfrptsJ7cAHGdxKFVdcIs4eEtt9jbaYGPF71P7Qm6Y=;
 b=sRNfzh9gOfx0pnh1Z8PLgTJ0luSX7apE1MT0ltOtbWUE9m7aL1u3RXQE0E07551VkuOO2l80E
 daequj6m1ioDhTMFNPP0BBlJA9kYZvTEez+lOFWQ3oeXat6EORePJ1G
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jZsWhMoYxd6vtlBmPHp7HZUo8CDpUptL
X-Proofpoint-ORIG-GUID: jZsWhMoYxd6vtlBmPHp7HZUo8CDpUptL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030
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

Each DP controller capable of MST can support multiple streams
and each of the streams maps to an interface block ID which can
vary based on chipset. Add a stream to interface map for MST capable
DP controllers.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 46 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_drv.h       |  7 ++++++
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7f2eace17c126e3758c68bb0dee67662463a6e05..caac0cd3ec94e7be1389d8129fbd506998cf77da 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -116,6 +116,8 @@ struct msm_dp_display_private {
 
 	u32 active_stream_cnt;
 
+	const unsigned int *intf_map;
+
 	struct msm_dp_audio *audio;
 };
 
@@ -123,11 +125,36 @@ struct msm_dp_desc {
 	phys_addr_t io_start;
 	unsigned int id;
 	bool wide_bus_supported;
+	const unsigned int *intf_map;
+};
+
+/* to be kept in sync with enum dpu_intf of dpu_hw_mdss.h */
+enum dp_mst_intf {
+	INTF_0 = 1,
+	INTF_1,
+	INTF_2,
+	INTF_3,
+	INTF_4,
+	INTF_5,
+	INTF_6,
+	INTF_7,
+	INTF_8,
+	INTF_MAX
+};
+
+static const unsigned int stream_intf_map_sa_8775p[][DP_STREAM_MAX] = {
+	{INTF_0, INTF_3},
+	{INTF_4, INTF_8},
+	{}
 };
 
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
-	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
-	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_0],
+	},
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
+	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_1],
+	},
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
 	{}
@@ -1489,6 +1516,9 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 
 	dp->max_stream = DEFAULT_STREAM_COUNT;
+
+	dp->intf_map = desc->intf_map;
+
 	rc = msm_dp_init_sub_modules(dp);
 	if (rc) {
 		DRM_ERROR("init sub module failed\n");
@@ -1646,6 +1676,18 @@ bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
 	return dp->wide_bus_supported;
 }
 
+int msm_dp_get_mst_intf_id(struct msm_dp *dp_display, int stream_id)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	if (dp->intf_map)
+		return dp->intf_map[stream_id];
+
+	return 0;
+}
+
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *root, bool is_edp)
 {
 	struct msm_dp_display_private *dp;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 7ed0e25d6c2bc9e4e3d78895742226d22d103e4c..50719e188732acd3652e4a7063d1ba1e2963b48a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -378,6 +378,8 @@ int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encode
 
 int msm_dp_mst_register(struct msm_dp *dp_display);
 
+int msm_dp_get_mst_intf_id(struct msm_dp *dp_display, int stream_id);
+
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -430,6 +432,11 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 	return false;
 }
 
+int msm_dp_get_mst_intf_id(struct msm_dp *dp_display, int stream_id)
+{
+	return -EINVAL;
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.34.1

