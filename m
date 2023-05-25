Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F37112A8
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3412610E72F;
	Thu, 25 May 2023 17:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034D610E719;
 Thu, 25 May 2023 17:41:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PG1RND032208; Thu, 25 May 2023 17:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=5FeZUVhoRJtdbxiMTw7U/Xuq8FcehdixHx+resZgSGw=;
 b=Vbm+vwaXkNM7iyp2PQME1SgXMgtvDzl9SePL9K89VSQmMjurHzDt47JFxNo2s6drS38F
 a6bQRS0hkJcLiz4aj3wEoSi/3/bU7ExngmOVVE5JIufMrdYkWbSPe6HL3IdCmdZzvQsY
 jW4zp288nx/MOt0o7oL1wVuqeJIJUxGekisVA2xb1jLB1mVNNHuPBNgC0XmUNpRSgSFk
 NCIv9TwE55IgQ1asM2eUGLqV5QfLGYl5S9hoTwFS95+47iiCO47sbUw874jHt/Lno6FM
 TcYa8LYbqmKN+65P1CshWRS0v/ssCx27oblmggo4xMUeeP/B3PfNiNpBqayZNXyxCMXq 0A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qt02a9qtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 17:41:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34PHfJxe012620
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 17:41:19 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 25 May 2023 10:41:19 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v14 09/10] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
Date: Thu, 25 May 2023 10:40:57 -0700
Message-ID: <1685036458-22683-10-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1685036458-22683-1-git-send-email-quic_khsieh@quicinc.com>
References: <1685036458-22683-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: e6Ylvg_H0nZp-TmBGMiMpMQuxjygK5dq
X-Proofpoint-ORIG-GUID: e6Ylvg_H0nZp-TmBGMiMpMQuxjygK5dq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_10,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305250147
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, quic_khsieh@quicinc.com,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add DSC 1.2 hardware blocks to the catalog with necessary sub-block and
feature flag information.  Each display compression engine (DCE) contains
dual DSC encoders so both share same base address but with its own
different sub block address.

changes in v4:
-- delete DPU_DSC_HW_REV_1_1
-- re arrange sc8280xp_dsc[]

changes in v4:
-- fix checkpatch warning

changes in v10:
-- remove hard slice from commit text
-- replace DPU_DSC_NATIVE_422_EN with DPU_DSC_NATIVE_42x_EN
-- change DSC_BLK_1_2 .len from 0x100 to 0x29c

changes in v11:
-- remove comment at DSC_BLK_1_2 marco

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 14 ++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  7 +++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 14 ++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 14 ++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 20 +++++++++++++++++++-
 6 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 500cfd0..d90486f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -153,6 +153,18 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
 };
 
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg sm8350_dsc[] = {
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+};
+
 static const struct dpu_intf_cfg sm8350_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
@@ -215,6 +227,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.dspp = sm8350_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8350_pp),
 	.pingpong = sm8350_pp,
+	.dsc_count = ARRAY_SIZE(sm8350_dsc),
+	.dsc = sm8350_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
 	.merge_3d = sm8350_merge_3d,
 	.intf_count = ARRAY_SIZE(sm8350_intf),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 5646713..52609b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -93,6 +93,11 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
 };
 
+/* NOTE: sc7280 only has one DSC hard slice encoder */
+static const struct dpu_dsc_cfg sc7280_dsc[] = {
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+};
+
 static const struct dpu_intf_cfg sc7280_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
@@ -149,6 +154,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
 	.pingpong = sc7280_pp,
+	.dsc_count = ARRAY_SIZE(sc7280_dsc),
+	.dsc = sc7280_dsc,
 	.intf_count = ARRAY_SIZE(sc7280_intf),
 	.intf = sc7280_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 808aacd..a84cf36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -141,6 +141,20 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
 };
 
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x29c, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x29c, 0, dsc_sblk_1),
+};
+
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
@@ -216,6 +230,8 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.dspp = sc8280xp_dspp,
 	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
 	.pingpong = sc8280xp_pp,
+	.dsc_count = ARRAY_SIZE(sc8280xp_dsc),
+	.dsc = sc8280xp_dsc,
 	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
 	.merge_3d = sc8280xp_merge_3d,
 	.intf_count = ARRAY_SIZE(sc8280xp_intf),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 1a89ff9..1620622 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -161,6 +161,18 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
 };
 
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg sm8450_dsc[] = {
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+};
+
 static const struct dpu_intf_cfg sm8450_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
@@ -223,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.dspp = sm8450_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8450_pp),
 	.pingpong = sm8450_pp,
+	.dsc_count = ARRAY_SIZE(sm8450_dsc),
+	.dsc = sm8450_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
 	.merge_3d = sm8450_merge_3d,
 	.intf_count = ARRAY_SIZE(sm8450_intf),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 497b34c..6582a14 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -165,6 +165,18 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
 };
 
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg sm8550_dsc[] = {
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+};
+
 static const struct dpu_intf_cfg sm8550_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
@@ -227,6 +239,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.dspp = sm8550_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8550_pp),
 	.pingpong = sm8550_pp,
+	.dsc_count = ARRAY_SIZE(sm8550_dsc),
+	.dsc = sm8550_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
 	.merge_3d = sm8550_merge_3d,
 	.intf_count = ARRAY_SIZE(sm8550_intf),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f2a1535..243399d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -522,6 +522,16 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
+static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
+	.enc = {.base = 0x100, .len = 0x100},
+	.ctl = {.base = 0xF00, .len = 0x10},
+};
+
+static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
+	.enc = {.base = 0x200, .len = 0x100},
+	.ctl = {.base = 0xF80, .len = 0x10},
+};
+
 #define DSC_BLK(_name, _id, _base, _features) \
 	{\
 	.name = _name, .id = _id, \
@@ -529,6 +539,14 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.features = _features, \
 	}
 
+#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
+	{\
+	.name = _name, .id = _id, \
+	.base = _base, .len = _len, \
+	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
+	.sblk = &_sblk, \
+	}
+
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
-- 
2.7.4

