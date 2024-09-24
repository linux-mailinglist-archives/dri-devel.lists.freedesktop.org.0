Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3274F984E46
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6DC10E76D;
	Tue, 24 Sep 2024 23:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LnX+BnHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC9610E76A;
 Tue, 24 Sep 2024 23:00:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OIsLu4028605;
 Tue, 24 Sep 2024 22:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w+0qHGI77WRaIvh6JH326plqIfcdSuUh91ymPBt412o=; b=LnX+BnHDxrUCuk98
 hZAe4uErwpd3Rs4tL4ZOcMuXYXLOUZF+9Yt7fp9XoN68Bnaj6GULUSAI7dLBV4Vn
 5TfNoOvuCaLGjni8+BusfiFPKFhy5aKw+VdMyinDIs+riRJ15xbfJoAtXUrkJalt
 qv2ICqlidXkC3ToYvDoglPlfykRWI9er4bCHFeIk+dV1WOCsRdPK+eFu0exm5sUh
 hBQNEXGjrpyUo/1xNksGDyjoeS236hsNRRf++o+UkzVQgC71iZOedctbB5RMvupB
 O9rogwhgGFjg0D3Y/ZVKvEnnpQtkgMPnuI70wCSbfBkLx5WkXI/IJj4f/UD8Ucds
 Hs/KHg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skuet6gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxtnj027313
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:56 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:55 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:23 -0700
Subject: [PATCH v2 07/22] drm/msm/dpu: Add CWB entry to catalog for SM8650
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-7-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=2555;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=IkX+OpqK4f1IF+L/KY5nLbNxU3aEcm80r3xuNrtqub0=;
 b=xQOvW5pRpeFAaREm8Equ/rkMhu7j4E22nqavHYd1iQEAku0/CyfnCedIlGt7UIp/1elDbG8B/
 Zr22LhdM+otBEzyvAv6NHJ48er5icBS88YSwvddW2EXvDjDDRNgq8u6
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jqZXHya_zcS5rOaxT_t5pckzvk1lUSG4
X-Proofpoint-ORIG-GUID: jqZXHya_zcS5rOaxT_t5pckzvk1lUSG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160
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

Add a new block for concurrent writeback mux to the SM8650 HW catalog

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index eb5dfff2ec4f..33f5faf4833f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
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

-- 
2.34.1

