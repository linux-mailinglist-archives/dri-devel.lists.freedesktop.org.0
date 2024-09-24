Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01AD984E66
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EA910E8F3;
	Tue, 24 Sep 2024 23:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fodPEM7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD0910E768;
 Tue, 24 Sep 2024 23:00:03 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OI4XAN026808;
 Tue, 24 Sep 2024 22:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5z0gEI1JlNcKcDZ8mqw5jhnX/wUBYQCElbDwE/WpQjg=; b=fodPEM7Xq6kJpbRe
 4iUYNVgbKVR8uyGWsp5mVdciDyixeSn3W4Xk345GT/C6X8dPe0LtMQ8G8qJDNB4d
 VlzuybpEvjpvBuBmFCeuhCx0K17XRl3wJiPmE8kIhDiJpIveM1YTZl8Cq8odBwiL
 sosgGuDdAqMbpoHgsGeHkGSCTm1c18J6kR33Kpfl1DYBOYfA5tpaa6qK/oYFdMdo
 GhVtsSaX5wI6ZQaBvneBbbg/4BkyM0ZavoP7DA52+h29FyE+0KmgaRZDiLxqG/N5
 WLnh0L43lCez/k9v/QOLnh6TiipCx2hqXWcmQmKL5JVbQeKVJYUMBq8aKuqXGu6o
 S/6NPg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakhu9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxuIN024981
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:56 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:56 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:24 -0700
Subject: [PATCH v2 08/22] drm/msm/dpu: Specify dedicated CWB pingpong
 blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-8-7849f900e863@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=5173;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=tRx0jSXqtFctOoEW4ZUC8IFr4NgC+vR6vK/tl4ai4uM=;
 b=WrP73dQ7RKLgZq2G0SwxVPsR0dFBT7xMc6wADEdPVLpStXrUDhneq769pRo1ALMKJJ3fiujGv
 XVHpdkyvBqxBUtfBBpkD05U1jUmulxRhmX4O3WPsVCoGMnH0DRhr3uv
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: iL0IciZoSKCCpVxea5Yz0JhqcHAwLXyo
X-Proofpoint-GUID: iL0IciZoSKCCpVxea5Yz0JhqcHAwLXyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=755
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Change pingpong index and names to distinguish between general use
pingpong blocks and pingpong blocks dedicated for concurrent writeback

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h              | 8 ++++----
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 33f5faf4833f..bfb64b7c1a47 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -252,25 +252,25 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_8", .id = PINGPONG_8,
+		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
 		.base = 0x7e000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_4,
 	}, {
-		.name = "pingpong_9", .id = PINGPONG_9,
+		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
 		.base = 0x7e400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index a1779c5597ae..08742472f9cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -257,13 +257,13 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x65800, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x65c00, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ad48defa154f..173f6f53a30c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -251,13 +251,13 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index a3e60ac70689..592ba9abd1ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -251,13 +251,13 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
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

