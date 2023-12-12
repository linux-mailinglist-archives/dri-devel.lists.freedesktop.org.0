Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6A80F8AD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 21:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B345B10E6C0;
	Tue, 12 Dec 2023 20:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5020F10E6BF;
 Tue, 12 Dec 2023 20:54:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCH6MS4017077; Tue, 12 Dec 2023 20:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=Ux8zX7qhqt/ITxvzOxnnzn8czW9pka9rrUX4FevGf+E=; b=Xy
 UyovkSuYBQwhIIpXqaAnxh06Yi48Fcgpx7YHtyP9e/36dM6a80Y1IvYA5FcifVZg
 AKNgPsY4ADdAEGMy+khpxLYlpSasgrBX9srroLcnnYx3lIfpVSk6VNsk5A1FU8Se
 IbWMjOOohmkN227GKZ8qZ1NgZFcOKlL75ttrjAwY+bID1U4tPJO3oS0wKJcETnRH
 SHAs3l/e/LMBU2tjLKRXrKQIRoiAaemM1YhaV+LzGcyu9ccjdRN3L7t29qx2DBsx
 psusB782aXf4l5oIj73Laj+TFquaTYXYcGTQeLgxoX6dor/2CXDE0JoP1/6mzAwT
 PSqxQ1xhpzkrbpi7feGw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxkx59swv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 20:53:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCKrVT5018272
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 20:53:31 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Dec 2023 12:53:31 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v4 14/15] drm/msm/dpu: introduce separate wb2_format arrays
 for rgb and yuv
Date: Tue, 12 Dec 2023 12:52:52 -0800
Message-ID: <20231212205254.12422-15-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FD-slwgJsrGQ0aAII7QRqmPeY_D_hTQs
X-Proofpoint-ORIG-GUID: FD-slwgJsrGQ0aAII7QRqmPeY_D_hTQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxlogscore=986
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120161
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
Cc: quic_jesszhan@quicinc.com, seanpaul@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lets rename the existing wb2_formats array wb2_formats_rgb to indicate
that it has only RGB formats and can be used on any chipset having a WB
block.

Introduce a new wb2_formats_rgb_yuv array to the catalog to
indicate support for YUV formats to writeback in addition to RGB.

Chipsets which have support for CDM block will use the newly added
wb2_formats_rgb_yuv array.

changes in v3:
	- change type of wb2_formats_rgb/wb2_formats_rgb_yuv to u32
	  to fix checkpatch warnings

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_10_0_sm8650.h   |  4 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  4 +-
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  4 +-
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  4 +-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 37 ++++++++++++++++++-
 6 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 04d2a73dd942..eb5dfff2ec4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -341,8 +341,8 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats,
-		.num_formats = ARRAY_SIZE(wb2_formats),
+		.format_list = wb2_formats_rgb,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 58b0f50518c8..a57d50b1f028 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -336,8 +336,8 @@ static const struct dpu_wb_cfg sm8250_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats,
-		.num_formats = ARRAY_SIZE(wb2_formats),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index bcfedfc8251a..7382ebb6e5b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -157,8 +157,8 @@ static const struct dpu_wb_cfg sc7180_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats,
-		.num_formats = ARRAY_SIZE(wb2_formats),
+		.format_list = wb2_formats_rgb,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 19c2b7454796..2f153e0b5c6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -169,8 +169,8 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats,
-		.num_formats = ARRAY_SIZE(wb2_formats),
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index bf56265967c0..ad48defa154f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -315,8 +315,8 @@ static const struct dpu_wb_cfg sm8550_wb[] = {
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
 		.features = WB_SM8250_MASK,
-		.format_list = wb2_formats,
-		.num_formats = ARRAY_SIZE(wb2_formats),
+		.format_list = wb2_formats_rgb,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
 		.xin_id = 6,
 		.vbif_idx = VBIF_RT,
 		.maxlinewidth = 4096,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b304bebedb84..54e8717403a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -202,7 +202,7 @@ static const u32 rotation_v2_formats[] = {
 	/* TODO add formats after validation */
 };
 
-static const uint32_t wb2_formats[] = {
+static const u32 wb2_formats_rgb[] = {
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,
 	DRM_FORMAT_RGB888,
@@ -236,6 +236,41 @@ static const uint32_t wb2_formats[] = {
 	DRM_FORMAT_XBGR4444,
 };
 
+static const u32 wb2_formats_rgb_yuv[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGBX5551,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_RGBX4444,
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_XBGR1555,
+	DRM_FORMAT_BGRX5551,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_BGRX4444,
+	DRM_FORMAT_XBGR4444,
+	DRM_FORMAT_NV12,
+};
+
 /*************************************************************
  * SSPP sub blocks config
  *************************************************************/
-- 
2.40.1

