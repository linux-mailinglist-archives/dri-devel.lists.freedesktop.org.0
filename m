Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB12965103
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 22:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17E110E704;
	Thu, 29 Aug 2024 20:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bM2yjMsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A03A10E73B;
 Thu, 29 Aug 2024 20:49:15 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TGteHm023072;
 Thu, 29 Aug 2024 20:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +ZeUUL918hB5/3j1/SiUmUATGuqYer+DI/apE79HVpA=; b=bM2yjMsmNgr3VNA0
 g1rOXlqWhxnBtfj3VZV2TIwvBW/uKFRiZKtotWogClrKU2Lda6OXtQBZtYL+5y1l
 NOibqy11dtkmUrgmUpW2D6znrc4t5dpi5QiwzJvgaCMIliCUWtwzpfxitC5/7SDf
 GkQbN5U1dK769ppB9nil+DkhSsF+IFxNrtD/DT2VuLJp//m2O7ZupsX+PE49bG0X
 3moYdQrttI2uFGVrLN+CDZDDtiuFZ2yCfqh41bRgzADyhg+2xfrYsaKT11Pmcejq
 5AA4lJp+XaY+yY+pyH6Fe4sXofwQgDjQ5cTfajBkznoqyq19Awfi8NtbrMRX/h+6
 tk9XFA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41a612mhra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TKn1jH016028
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:01 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 13:49:01 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Aug 2024 13:48:29 -0700
Subject: [PATCH 08/21] drm/msm/dpu: add CWB entry to catalog for SM8650
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240829-concurrent-wb-v1-8-502b16ae2ebb@quicinc.com>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
In-Reply-To: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724964539; l=7161;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=846JHV+mtQr7NiOLUZ1OiNov0n5kp+HPtQKYkefdNkM=;
 b=vjf8dkS2BsFm1NdR2IfWiV+o06plDp8niVADM23gwoVuQBsQ4nt8J51g2pyN0AS9fwVrF9Kf9
 Q1JBA33gaFoDyDbslBBeiBUBpXPZqgF/5fxs7mY22qMNYSSZskjDYxc
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: DwKBKJhkT12OhQMhYYPIEXTmVYsQ0qUv
X-Proofpoint-ORIG-GUID: DwKBKJhkT12OhQMhYYPIEXTmVYsQ0qUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290147
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

From: Esha Bharadwaj <quic_ebharadw@quicinc.com>

Add new block for concurrent writeback mux to HW catalog and change
pingpong index names to distinguish between general use pingpong blocks
and pingpong blocks dedicated for concurrent writeback

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 29 +++++++++++++++++++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  4 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  4 +--
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 13 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  8 +++---
 6 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index eb5dfff2ec4f..ce2773029763 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -252,25 +252,25 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_6", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_7", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_8", .id = PINGPONG_8,
+		.name = "pingpong_8", .id = PINGPONG_CWB_2,
 		.base = 0x7e000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_4,
 	}, {
-		.name = "pingpong_9", .id = PINGPONG_9,
+		.name = "pingpong_9", .id = PINGPONG_CWB_3,
 		.base = 0x7e400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
@@ -350,6 +350,25 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
 	},
 };
 
+static const struct dpu_cwb_cfg sm8650_cwb[] = {
+	{
+		.name = "cwb_0", .id = CWB_0,
+		.base = 0x66200, .len = 0x8,
+	},
+	{
+		.name = "cwb_1", .id = CWB_1,
+		.base = 0x66600, .len = 0x8,
+	},
+	{
+		.name = "cwb_2", .id = CWB_2,
+		.base = 0x7E200, .len = 0x8,
+	},
+	{
+		.name = "cwb_3", .id = CWB_3,
+		.base = 0x7E600, .len = 0x8,
+	},
+};
+
 static const struct dpu_intf_cfg sm8650_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -447,6 +466,8 @@ const struct dpu_mdss_cfg dpu_sm8650_cfg = {
 	.merge_3d = sm8650_merge_3d,
 	.wb_count = ARRAY_SIZE(sm8650_wb),
 	.wb = sm8650_wb,
+	.cwb_count = ARRAY_SIZE(sm8650_cwb),
+	.cwb = sm8650_cwb,
 	.intf_count = ARRAY_SIZE(sm8650_intf),
 	.intf = sm8650_intf,
 	.vbif_count = ARRAY_SIZE(sm8650_vbif),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index a1779c5597ae..c5c95c6654dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -257,13 +257,13 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_6", .id = PINGPONG_CWB_0,
 		.base = 0x65800, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_7", .id = PINGPONG_CWB_1,
 		.base = 0x65c00, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ad48defa154f..31c4a3025e51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -251,13 +251,13 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_6", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_7", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index a3e60ac70689..24bb6b13eaba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -251,13 +251,13 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_6", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_7", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 37e18e820a20..b42d8b3640e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -621,6 +621,16 @@ struct dpu_wb_cfg {
 	enum dpu_clk_ctrl_type clk_ctrl;
 };
 
+/*
+ * struct dpu_cwb_cfg : MDP CWB mux instance info
+ * @id:                enum identifying this block
+ * @base:              register base offset to mdss
+ * @features           bit mask identifying sub-blocks/features
+ */
+struct dpu_cwb_cfg {
+	DPU_HW_BLK_INFO;
+};
+
 /**
  * struct dpu_vbif_dynamic_ot_cfg - dynamic OT setting
  * @pps                pixel per seconds
@@ -823,6 +833,9 @@ struct dpu_mdss_cfg {
 	u32 dspp_count;
 	const struct dpu_dspp_cfg *dspp;
 
+	u32 cwb_count;
+	const struct dpu_cwb_cfg *cwb;
+
 	/* Add additional block data structures here */
 
 	const struct dpu_perf_cfg *perf;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index a2eff36a2224..c17d2d356f7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -181,10 +181,10 @@ enum dpu_pingpong {
 	PINGPONG_3,
 	PINGPONG_4,
 	PINGPONG_5,
-	PINGPONG_6,
-	PINGPONG_7,
-	PINGPONG_8,
-	PINGPONG_9,
+	PINGPONG_CWB_0,
+	PINGPONG_CWB_1,
+	PINGPONG_CWB_2,
+	PINGPONG_CWB_3,
 	PINGPONG_S0,
 	PINGPONG_MAX
 };

-- 
2.34.1

