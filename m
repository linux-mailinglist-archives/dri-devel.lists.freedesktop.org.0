Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE76784C7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342F910E530;
	Mon, 23 Jan 2023 18:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B59610E544;
 Mon, 23 Jan 2023 18:25:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NDvPKX006849; Mon, 23 Jan 2023 18:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=KErrjc3xgE1bMROYd6zPKW0ZtuwKlGeYv2r3etNPY6E=;
 b=nelKSCwbRedweKBhLbXaglFkAmzrqFSrsNTg7nrQIjWMTuJ4QNWJIVo0qzEyB1FHQOmn
 H4vKDIBRqzeeFMZhhuV9YnFpoVfNoyfhPslAJCzGTX7Vr7TDEnYt9Vzx2hE1fZtAHWgB
 KIqoTjJu4VmYKho4bsDsUlMKkrkGYJTPvN5wxCTNrFykxHJNHZFEqVvX9BBc8NtqRE4q
 AQy6rkYufzZ/ZlH7XBloLgmi/vgpHyg/8/socDAxAKXcUcbEEr57t+5n1+roLA5Ysx+T
 zqRelZIPgIbuuNFa0SS1km1896+jDx9ksvFQvHsqTjvsY42BYuQPTlhsygrQzTlX6CUy Aw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89dr3hcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:25:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NIPAXY032366
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:25:10 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 10:25:09 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 14/14] drm/msm/disp/dpu1: add sc7280 dsc block and sub block
Date: Mon, 23 Jan 2023 10:24:34 -0800
Message-ID: <1674498274-6010-15-git-send-email-quic_khsieh@quicinc.com>
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
X-Proofpoint-GUID: RMcxm3L4YY1LFlihdTSGZoGR1L41zBsj
X-Proofpoint-ORIG-GUID: RMcxm3L4YY1LFlihdTSGZoGR1L41zBsj
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

This patch add DSC block and sub block to support new DSC v1.2 hardware
encoder. Also sc7280 DSC related hardware information are added to allow
sc7280 DSC feature be enabled at sc7280 platform.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 50 +++++++++++++++++++-------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 7deffc9f9..2c78a46 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -476,6 +476,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_dsc_width = 2560,
 };
 
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
@@ -1707,7 +1708,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
@@ -1814,25 +1815,48 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
-#define DSC_BLK(_name, _id, _base, _features) \
+#define DSC_BLK_HW_1_1(_name, _id, _base, _features) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x140, \
-	.features = _features, \
+	.features = BIT(DPU_DSC_HW_REV_1_1) | _features, \
+	}
+
+#define DSC_BLK_HW_1_2(_name, _id, _base, _features, _sblk) \
+	{\
+	.name = _name, .id = _id, \
+	.base = _base, .len = 0x140, \
+	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
+	.sblk = &_sblk, \
 	}
 
 static struct dpu_dsc_cfg sdm845_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
+	DSC_BLK_HW_1_1("dsc_0", DSC_0, 0x80000, 0),
+	DSC_BLK_HW_1_1("dsc_1", DSC_1, 0x80400, 0),
+	DSC_BLK_HW_1_1("dsc_2", DSC_2, 0x80800, 0),
+	DSC_BLK_HW_1_1("dsc_3", DSC_3, 0x80c00, 0),
 };
 
 static struct dpu_dsc_cfg sm8150_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
-	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK_HW_1_1("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK_HW_1_1("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK_HW_1_1("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK_HW_1_1("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
+};
+
+static struct dpu_dsc_sub_blks sc7280_dsc_sblk_0 = {
+	.enc = {.base = 0x100, .len = 0x100},
+	.ctl = {.base = 0xF00, .len = 0x10},
+};
+
+static struct dpu_dsc_sub_blks sc7280_dsc_sblk_1 = {
+	.enc = {.base = 0x200, .len = 0x100},
+	.ctl = {.base = 0xF80, .len = 0x10},
+};
+
+static struct dpu_dsc_cfg sc7280_dsc[] = {
+	DSC_BLK_HW_1_2("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_NATIVE_422_EN), sc7280_dsc_sblk_0),
+	DSC_BLK_HW_1_2("dsc_1", DSC_1, 0x80000, BIT(DPU_DSC_NATIVE_422_EN), sc7280_dsc_sblk_1),
 };
 
 /*************************************************************
@@ -2809,6 +2833,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
 	.pingpong = sc7280_pp,
 	.intf_count = ARRAY_SIZE(sc7280_intf),
+	.dsc_count = ARRAY_SIZE(sc7280_dsc),
+	.dsc = sc7280_dsc,
 	.intf = sc7280_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

