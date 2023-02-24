Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3338C6A226D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 20:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6CD10E5CD;
	Fri, 24 Feb 2023 19:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94AB10ECEE;
 Fri, 24 Feb 2023 19:41:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31O8hKYg018518; Fri, 24 Feb 2023 19:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=piuuc2wyWBVCiJ95WfQWMKtEKTQoo3gZy+3qcnD1EOU=;
 b=j4uLb1b/Ox9CVHduWFk3GhSW9P9WaOsAPQnZ9wkkoAi9h2YdGmNSLEd+j/Tz+MFXK5nA
 lBADEDZu2zffWInrykx2zxpuIZ0rCWSgE81qIrBLW2v6L03oi+MH5uOcrgKdSUgZFrOk
 HU293AMDtiCpHc0ct5vK6eiq6l/CLgnG4DIu40fBO8NqjSNvlyK25v0rSaLTFUjXaxQ9
 oW99UtzVFzjaax+SAqLxQybNReEbBxyTaxCtNpM9HcUjPXYQoFyBUiNGa5WN2hJtxElF
 +y1td/4wZm5sJQkvrRl9XZDH+swFcifYwnubfxNILoGXiaddD+UIt4oHdOfIuilFwE1s 5w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nxsy7sv99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 19:41:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OJf3LG026677
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 19:41:03 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 24 Feb 2023 11:41:02 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [RFC PATCH 2/2] drm/msm/dsi: use new dpu_dsc_populate_dsc_config()
Date: Fri, 24 Feb 2023 11:40:47 -0800
Message-ID: <1677267647-28672-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -CeI4-AXY3I53xWRkXWvhhuSztR7-WAH
X-Proofpoint-ORIG-GUID: -CeI4-AXY3I53xWRkXWvhhuSztR7-WAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240155
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
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

use new introduced dpu_dsc_populate_dsc_config() to calculate
and populate drm_dsc_info instead of hard code value.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 78 ++++++--------------------------------
 1 file changed, 12 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 31ad193..5f3f84f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
  */
 
 #include <linux/clk.h>
@@ -21,7 +22,6 @@
 
 #include <video/mipi_display.h>
 
-#include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_of.h>
 
 #include "dsi.h"
@@ -31,6 +31,7 @@
 #include "msm_kms.h"
 #include "msm_gem.h"
 #include "phy/dsi_phy.h"
+#include "dpu_dsc_helper.h"
 
 #define DSI_RESET_TOGGLE_DELAY_MS 20
 
@@ -1819,29 +1820,8 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	return -EINVAL;
 }
 
-static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
-	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
-	0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
-};
-
-/* only 8bpc, 8bpp added */
-static char min_qp[DSC_NUM_BUF_RANGES] = {
-	0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
-};
-
-static char max_qp[DSC_NUM_BUF_RANGES] = {
-	4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
-};
-
-static char bpg_offset[DSC_NUM_BUF_RANGES] = {
-	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
-};
-
 static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc)
 {
-	int i;
-	u16 bpp = dsc->bits_per_pixel >> 4;
-
 	if (dsc->bits_per_pixel & 0xf) {
 		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support fractional bits_per_pixel\n");
 		return -EINVAL;
@@ -1852,50 +1832,16 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 		return -EOPNOTSUPP;
 	}
 
-	dsc->rc_model_size = 8192;
-	dsc->first_line_bpg_offset = 12;
-	dsc->rc_edge_factor = 6;
-	dsc->rc_tgt_offset_high = 3;
-	dsc->rc_tgt_offset_low = 3;
-	dsc->simple_422 = 0;
-	dsc->convert_rgb = 1;
-	dsc->vbr_enable = 0;
-
-	/* handle only bpp = bpc = 8 */
-	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
-		dsc->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
-
-	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
-		dsc->rc_range_params[i].range_min_qp = min_qp[i];
-		dsc->rc_range_params[i].range_max_qp = max_qp[i];
-		/*
-		 * Range BPG Offset contains two's-complement signed values that fill
-		 * 8 bits, yet the registers and DCS PPS field are only 6 bits wide.
-		 */
-		dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i] & DSC_RANGE_BPG_OFFSET_MASK;
-	}
-
-	dsc->initial_offset = 6144;		/* Not bpp 12 */
-	if (bpp != 8)
-		dsc->initial_offset = 2048;	/* bpp = 12 */
-
-	if (dsc->bits_per_component <= 10)
-		dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
-	else
-		dsc->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
-
-	dsc->initial_xmit_delay = 512;
-	dsc->initial_scale_value = 32;
-	dsc->first_line_bpg_offset = 12;
-	dsc->line_buf_depth = dsc->bits_per_component + 1;
-
-	/* bpc 8 */
-	dsc->flatness_min_qp = 3;
-	dsc->flatness_max_qp = 12;
-	dsc->rc_quant_incr_limit0 = 11;
-	dsc->rc_quant_incr_limit1 = 11;
-
-	return drm_dsc_compute_rc_parameters(dsc);
+	/*
+	 * NOTE:
+	 * dsc->dsc_version_major, dsc->dsc_version_minor
+	 * dsc->bits_per_pixel,
+	 * dsc->bits_per_component,
+	 * dsc->native_422, dsc->native_420
+	 *
+	 * above parameters must be populated
+	 */
+	return dpu_dsc_populate_dsc_config(dsc, 0);
 }
 
 static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

