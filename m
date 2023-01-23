Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8240E6784B1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C3210E53C;
	Mon, 23 Jan 2023 18:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655F810E534;
 Mon, 23 Jan 2023 18:25:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NF6C6A009514; Mon, 23 Jan 2023 18:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=DvToz2ismh6ZXEhHhog2aNFB9JBz0GW54SgHvvHCMmA=;
 b=WX1kOasc915onD9FPRZOX9HU6970xsAucNUhPffwCpYBwB20SPeuFlE2jgy+8ZE9MpGA
 8z5wiAI+YAD1leC2Aef8OKXW+nBwv2QbInZctPnnnt+THmi1Jdh5sUzkc0Xv5QW24k0p
 dker2tLKa8IEYZ6VFfqqkeUvdpHSDwEO3eiaR2pajsxesyA8FosKv9pefePtEcW1wrwO
 BSVi1EiEtBdX6gY+5iUJk0dmG4rXLs573Od0kyKWybuAqLw9B9NI3zRIA/oBiKNQS59h
 Jg7kTdzWjFJ+lAHp4wjKMquRp36O5YomGEX3uQj4nO8X4ePDUJ0KY4V+xearNi7umOnA oQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89dr3hbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NIOrWB025827
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:53 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 10:24:52 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 04/14] drm/msm/dp: correct configure Colorimetry Indicator
 Field at MISC0
Date: Mon, 23 Jan 2023 10:24:24 -0800
Message-ID: <1674498274-6010-5-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FDRJnU0GEKSIcLTTyz09TVpomAQzRELe
X-Proofpoint-ORIG-GUID: FDRJnU0GEKSIcLTTyz09TVpomAQzRELe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301230177
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSA MISC0 bit 1 to 7 contains Colorimetry Indicator Field. At current
implementation, Colorimetry Indicator Field of MISC0 is not configured
correctly. This patch add support of RGB formats Colorimetry.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  5 +++--
 drivers/gpu/drm/msm/dp/dp_link.c  | 29 +++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_panel.c | 45 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  1 +
 4 files changed, 71 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 959a78c..d0d1848 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2012-2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
  */
 
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
@@ -169,7 +170,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
 
 	tb = dp_link_get_test_bits_depth(ctrl->link,
 		ctrl->panel->dp_mode.bpp);
-	cc = dp_link_get_colorimetry_config(ctrl->link);
+	cc = dp_panel_get_misc_colorimetry_val(ctrl->panel);
 	dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
 	dp_panel_timing_cfg(ctrl->panel);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index f1f1d64..e957948 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2012-2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
  */
 
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
@@ -12,6 +13,12 @@
 
 #define DP_TEST_REQUEST_MASK		0x7F
 
+enum dynamic_range {
+	DP_DYNAMIC_RANGE_RGB_VESA = 0x00,
+	DP_DYNAMIC_RANGE_RGB_CEA = 0x01,
+	DP_DYNAMIC_RANGE_UNKNOWN = 0xFFFFFFFF,
+};
+
 enum audio_sample_rate {
 	AUDIO_SAMPLE_RATE_32_KHZ	= 0x00,
 	AUDIO_SAMPLE_RATE_44_1_KHZ	= 0x01,
@@ -1079,6 +1086,7 @@ int dp_link_process_request(struct dp_link *dp_link)
 int dp_link_get_colorimetry_config(struct dp_link *dp_link)
 {
 	u32 cc;
+	enum dynamic_range dr;
 	struct dp_link_private *link;
 
 	if (!dp_link) {
@@ -1088,14 +1096,21 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
 
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
+	/* Only RGB_VESA nd RGB_CEA supported for now */
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
index 36dad05..55bb6b0 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -567,6 +567,51 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 	return 0;
 }
 
+/**
+ * Mapper function which outputs colorimetry to be used for a
+ * given colorspace value when misc field of MSA is used to
+ * change the colorimetry. Currently only RGB formats have been
+ * added. This API will be extended to YUV once its supported on DP.
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
+		colorimetry = 0;
+	}
+
+	return colorimetry;
+}
+
 struct dp_panel *dp_panel_get(struct dp_panel_in *in)
 {
 	struct dp_panel_private *panel;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index fb30b92..1153e88 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -85,6 +85,7 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
 		struct drm_connector *connector);
 void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
 void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
+u8 dp_panel_get_misc_colorimetry_val(struct dp_panel *dp_panel);
 
 /**
  * is_link_rate_valid() - validates the link rate
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

