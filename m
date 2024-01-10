Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F182A203
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 21:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA5110E663;
	Wed, 10 Jan 2024 20:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8154410E663;
 Wed, 10 Jan 2024 20:18:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40AIheTU017424; Wed, 10 Jan 2024 20:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type; s=
 qcppdkim1; bh=ysbxujXnPhIjHtzSYlXAMdBSwZYWEn2r0tXEe0Mnbnk=; b=Bn
 bxP8mSMcUY32JNcC6PVIW8KGgBTA28j4eRXdhRvU/3rdAH6cYzEPxhMEvMtvplex
 1tUyd4eYO9HBVWT4KfVnESniiL/bIr0GDwrDu6rjX5KfvJTySFMrjLdMHs9PeaNk
 J5FToME/HjFc91v+0TOXUdVQD2pp2j0jRmWpfWjb0+od4Gu6n6ZNXakSn3uwaTcn
 HxaFhqjcv5nNZFpSRbY/JeKZ2+p1EDUwkW4OlCeel1JgfnJH2yDXu4P5ubPfmFJZ
 xyW0wXE3ToHABX2ttWHVGtCupEi5enQC5NZkg3uExekpgalAQ6TEcpMQ9EM/T35y
 HF4xYypffaaNJiYAcs8A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhvqw0vdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 20:18:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40AKIWvC013660
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 20:18:32 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 12:18:32 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1] drm/msm/dp: correct configure Colorimetry Indicator Field
 at MISC0
Date: Wed, 10 Jan 2024 12:18:08 -0800
Message-ID: <1704917888-30039-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bdJQBRI5X5MlpzrR7E1xqCWJ8A7rHsXS
X-Proofpoint-ORIG-GUID: bdJQBRI5X5MlpzrR7E1xqCWJ8A7rHsXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401100161
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
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSA MISC0 bit 1 to 7 contains Colorimetry Indicator Field. At current
implementation, Colorimetry Indicator Field of MISC0 is not configured
correctly. This patch add support of RGB formats Colorimetry.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  5 ++--
 drivers/gpu/drm/msm/dp/dp_link.c  | 26 ++++++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_panel.c | 48 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 4 files changed, 73 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 77a8d93..2ef89fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2012-2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved
  */
 
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
@@ -172,7 +173,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
 
 	tb = dp_link_get_test_bits_depth(ctrl->link,
 		ctrl->panel->dp_mode.bpp);
-	cc = dp_link_get_colorimetry_config(ctrl->link);
+	cc = dp_panel_get_misc_colorimetry_val(ctrl->panel);
 	dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
 	dp_panel_timing_cfg(ctrl->panel);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 98427d4..21fa1a2 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved
  */
 
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
@@ -12,6 +13,11 @@
 
 #define DP_TEST_REQUEST_MASK		0x7F
 
+enum dynamic_range {
+	DP_DYNAMIC_RANGE_RGB_VESA,
+	DP_DYNAMIC_RANGE_RGB_CEA,
+};
+
 enum audio_sample_rate {
 	AUDIO_SAMPLE_RATE_32_KHZ	= 0x00,
 	AUDIO_SAMPLE_RATE_44_1_KHZ	= 0x01,
@@ -1083,6 +1089,7 @@ int dp_link_process_request(struct dp_link *dp_link)
 int dp_link_get_colorimetry_config(struct dp_link *dp_link)
 {
 	u32 cc;
+	enum dynamic_range dr;
 	struct dp_link_private *link;
 
 	if (!dp_link) {
@@ -1092,14 +1099,21 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
 
 	link = container_of(dp_link, struct dp_link_private, dp_link);
 
-	/*
-	 * Unless a video pattern CTS test is ongoing, use RGB_VESA
-	 * Only RGB_VESA and RGB_CEA supported for now
-	 */
+	/* unless a video pattern CTS test is ongoing, use CEA_VESA */
 	if (dp_link_is_video_pattern_requested(link))
-		cc = link->dp_link.test_video.test_dyn_range;
+		dr = link->dp_link.test_video.test_dyn_range;
 	else
-		cc = DP_TEST_DYNAMIC_RANGE_VESA;
+		dr = DP_DYNAMIC_RANGE_RGB_VESA;
+
+	/* Only RGB_VESA and RGB_CEA supported for now */
+	switch (dr) {
+	case DP_DYNAMIC_RANGE_RGB_CEA:
+		cc = BIT(2);
+		break;
+	case DP_DYNAMIC_RANGE_RGB_VESA:
+	default:
+		cc = 0;
+	}
 
 	return cc;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 127f6af..785bb59 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved
  */
 
 #include "dp_panel.h"
@@ -386,6 +387,53 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 	return 0;
 }
 
+/*
+ * Mapper function which outputs colorimetry to be used for a
+ * given colorspace value when misc field of MSA is used to
+ * change the colorimetry. Currently only RGB formats have been
+ * added. This API will be extended to YUV once it's supported on DP.
+ */
+u8 dp_panel_get_misc_colorimetry_val(struct dp_panel *dp_panel)
+{
+	u8 colorimetry;
+	u32 colorspace;
+	u32 cc;
+	struct dp_panel_private *panel;
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+
+	cc = dp_link_get_colorimetry_config(panel->link);
+	/*
+	 * If there is a non-zero value then compliance test-case
+	 * is going on, otherwise we can honor the colorspace setting
+	 */
+	if (cc)
+		return cc;
+
+	colorspace = dp_panel->connector->state->colorspace;
+	drm_dbg_dp(panel->drm_dev, "colorspace=%d\n", colorspace);
+
+	switch (colorspace) {
+	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
+	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
+		colorimetry = 0x7;
+		break;
+	case DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
+		colorimetry = 0x3;
+		break;
+	case DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
+		colorimetry = 0xb;
+		break;
+	case DRM_MODE_COLORIMETRY_OPRGB:
+		colorimetry = 0xc;
+		break;
+	default:
+		colorimetry = 0;	/* legacy RGB mode */
+	}
+
+	return colorimetry;
+}
+
 struct dp_panel *dp_panel_get(struct dp_panel_in *in)
 {
 	struct dp_panel_private *panel;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index a0dfc57..c34a51d 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved
  */
 
 #ifndef _DP_PANEL_H_
@@ -65,6 +66,7 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
 		struct drm_connector *connector);
 void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
 void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
+u8 dp_panel_get_misc_colorimetry_val(struct dp_panel *dp_panel);
 
 /**
  * is_link_rate_valid() - validates the link rate
-- 
2.7.4

