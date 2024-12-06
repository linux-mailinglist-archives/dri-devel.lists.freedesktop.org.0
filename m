Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D89E65D9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C39F10F02D;
	Fri,  6 Dec 2024 04:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Y0s1iH8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2350B10F024;
 Fri,  6 Dec 2024 04:33:25 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Jhc3Q018547;
 Fri, 6 Dec 2024 04:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EXUClhOnfceOtMBiMtOi24mb+xLCgyUlPl7qQIrozrw=; b=Y0s1iH8JzDlc2zMT
 rBvgB2PM2kZ9RC9Vzipjy+gh/bi/VaXU8HFLZd0s2Eq/rgfAHXaZu2RVyxXr+DLl
 +8ZFRJVzJNUKEe8rAFeDHXdrlBV2Z+W9/bEOOe1NWD7xcFCOd81g2QaRrIl3HhQr
 muHNO5eurv7flzdaM3vdVmOTB7X5OKWUeK/TyVyKN01BGd5sSkTCL1NMABDrlH1C
 eB6ZHmZUBuYaTlHf8TDhn7S/UW5jI/EXVBmfUb/1/w+gHHwKeby6HtIRc8eYytKZ
 3RfBsPkSYgF/29RJRNlqQ7o1Dca/xGVDwYoKrjpmU39vv/oYEaMjW11Su53srqG2
 P3qMzg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8s0up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64Wn7I007226
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:49 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:48 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:14 -0800
Subject: [PATCH 43/45] drm/msm/dp: populate the max_streams for sa8775 mst
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-43-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=3833;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=VSEnbGRKR9lj57a3s/bAUOkQa3M22jVdB2RTu7CdC0M=;
 b=gBumdM2ec8mriXUPme+X9pF7Qu+k5YRby2Q1zXqcFM3e7CH20RHzQ6Qy9PKitehWEe9TCggwi
 lNxFKCISuMKB8Cd0zSoHdlg1KVPb8ai0BhgsUDOSM5V5et3kJcNz4fI
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ClMaWGXv0F_wvqLpVWLf2Sbit77BZUnD
X-Proofpoint-GUID: ClMaWGXv0F_wvqLpVWLf2Sbit77BZUnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412060030
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

Populate the max_streams for DP controllers to indicate MST support.

If the pixel clock handle for the second stream fails, treat it as
SST case rather than a complete failure.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 ++
 drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++++++---
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d4915a962f97b3d2a347456e197265a5dc043eb0..0e5ebcdab00936cf0ce6e35514f2932158530cc0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2438,6 +2438,15 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 	return 0;
 }
 
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->num_pixel_clks;
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
 			struct msm_dp_catalog *catalog,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 9ad7022d6217572395d69294c3cc4d4dbaddf0ac..f72a499809ec01a9cc5bb79762bc2604820426a1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -54,4 +54,6 @@ void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
 				      u32 start_slot, u32 tot_slots);
 void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 528cda1453a85f5f8dd37bb0d2366548016c88e4..db563af19461089dbcaccce0d03fd03d5aa567aa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -126,6 +126,7 @@ struct msm_dp_desc {
 	unsigned int id;
 	bool wide_bus_supported;
 	const unsigned int *intf_map;
+	unsigned int max_streams;
 };
 
 /* to be kept in sync with enum dpu_intf of dpu_hw_mdss.h */
@@ -149,10 +150,10 @@ static const unsigned int stream_intf_map_sa_8775p[][DP_STREAM_MAX] = {
 };
 
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
-	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true, .max_streams = 2,
 	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_0],
 	},
-	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true, .max_streams = 2,
 	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_1],
 	},
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -1481,7 +1482,10 @@ int msm_dp_get_mst_max_stream(const struct msm_dp *dp_display)
 
 	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	return dp_priv->max_stream;
+	if (dp_priv->max_stream == msm_dp_ctrl_get_stream_cnt(dp_priv->ctrl))
+		return dp_priv->max_stream;
+	else
+		return DEFAULT_STREAM_COUNT;
 }
 
 int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
@@ -1517,6 +1521,9 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 
 	dp->max_stream = DEFAULT_STREAM_COUNT;
 
+	if (desc->max_streams > DEFAULT_STREAM_COUNT)
+		dp->max_stream = desc->max_streams;
+
 	dp->intf_map = desc->intf_map;
 
 	rc = msm_dp_init_sub_modules(dp);

-- 
2.34.1

