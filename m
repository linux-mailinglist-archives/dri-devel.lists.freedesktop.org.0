Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E89A165DC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 04:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F7C10E296;
	Mon, 20 Jan 2025 03:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="db1U/bOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F211F10E270;
 Mon, 20 Jan 2025 03:51:47 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K3ftnK002567;
 Mon, 20 Jan 2025 03:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l9D0iGf5gfsI47OTyHusqADcAsJb13cd95a9Ia17SRI=; b=db1U/bOLE5YS9mAK
 1l0ov+EwYdbb25OiYZoSG+aoDK2ewQOLZHgJnqzmLkkp2KA3sTpDdi9v8ml65hMY
 RazpirOKNW1i2AKjyUZZdAN01T8xNHFPZ6LVEvpMfU7TfRQcJ/t6yY86ERsCyvQX
 NiiFXQA/jdF00tZcAPAFkB/zaZ55YIa580NUDCI67KJ0Tl+SqzTEr0mmuFJCSOLO
 Hz75qNYiTkPkeN9TzSqW52EIHLFE7sTpCJhAZKOh5zVU59HLvB8/VGMDy3UxRhLS
 STA6uYc8zVHEMJH7YFLJr1cZmlui8x3DqnnWMzR5P/K/WDapfzWVKUFhiEbqlzUL
 RF6IPA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449eteg0hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2025 03:51:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K3pekl002066
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2025 03:51:40 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 19:51:34 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 20 Jan 2025 11:49:21 +0800
Subject: [PATCH v4 4/4] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250120-mdssdt_qcs8300-v4-4-1687e7842125@quicinc.com>
References: <20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com>
In-Reply-To: <20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
CC: Yongxing Mou <quic_yongmou@quicinc.com>, <linux-arm-msm@vger.kernel.org>, 
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737345066; l=1622;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=T1quEqzzRYSTMr7FDeES364YwjAI1nS3gNRFG9z4HNk=;
 b=BOXhQ4xG/Uh+vxlU762NfIBfEaG/FlDDCDmVnsczhIjvXCij9ru2Foo7ss1uetRSLXHKqFNF/
 jMXesluT9r2CtKB0d3rJOsS2Qg0c+fzntXDR0knUY+UnwqnisMLRsRa
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: IB8NowB8TNPXRNBQiy6Rototq8zTgaFR
X-Proofpoint-GUID: IB8NowB8TNPXRNBQiy6Rototq8zTgaFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200028
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

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
Due to different memory type, it use different mdss_data with SA8775P
although using the same dpu.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..40c8b476763b8c39434b1448008cfa8ffac7a8ea 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -582,6 +582,16 @@ static const struct msm_mdss_data qcm2290_data = {
 	.reg_bus_bw = 76800,
 };
 
+static const struct msm_mdss_data qcs8300_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.reg_bus_bw = 74000,
+};
+
 static const struct msm_mdss_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
@@ -737,6 +747,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &qcs8300_data },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
 	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },

-- 
2.34.1

