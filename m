Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CA19763AD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F1C10EAC8;
	Thu, 12 Sep 2024 07:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bBrWDzXt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E3D10E1F2;
 Thu, 12 Sep 2024 07:15:10 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2L2MJ029584;
 Thu, 12 Sep 2024 07:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=pifT2EiLaVv
 JilmU4UaX30atEhINZCTGLpTImn4x1/g=; b=bBrWDzXtg4gLJRY09Q/E+XEMH/A
 CtSskqWWac6QPciWPsuqzgLNcy2XsoUJqclgpclH4rnSaQD4wOEnvDmE6ouwqLHl
 wZDZZqYkt3mbXR0Z+sSnGyLc4CQ1P+F/pBGSToJUV0iRha+SvxRk5i+RZhZ2Xpx4
 3bo0/LwN7hqT2O30tTpXz5ooP3dZqewpO7XY2Z138/LTeC6vPVeodQ7lL0BJBRP+
 EH52u0PhGgA5PqUqjR3z714ncvKe0qwEPGuXyaQXHCMvHna3lU0IwpJ8sMiCqnEn
 wg1DRoNgvkvSy1M+FmSmGKOC3NNYODd0ruhWE1V0ipOYQY4SGPVZgaQUykA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5e3f9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 07:15:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48C7Etnx000426; 
 Thu, 12 Sep 2024 07:14:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41h168ypm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 07:14:55 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48C7Et34000394;
 Thu, 12 Sep 2024 07:14:55 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mahap-hyd.qualcomm.com
 [10.213.96.84])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 48C7EskQ000392
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 07:14:55 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2365311)
 id 68F18AFA; Thu, 12 Sep 2024 12:44:53 +0530 (+0530)
From: Mahadevan <quic_mahap@quicinc.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, swboyd@chromium.org, konrad.dybcio@linaro.org,
 danila@jiaxyga.com, bigfoot@classfun.cn, neil.armstrong@linaro.org,
 mailingradian@gmail.com, quic_jesszhan@quicinc.com, andersson@kernel.org
Cc: Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com,
 quic_vpolimer@quicinc.com
Subject: [PATCH 3/5] drm/msm: mdss: Add SA8775P support
Date: Thu, 12 Sep 2024 12:44:35 +0530
Message-Id: <20240912071437.1708969-4-quic_mahap@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912071437.1708969-1-quic_mahap@quicinc.com>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: L0iSBabEzSs6cORX8kVoCR26Otd2hcfc
X-Proofpoint-GUID: L0iSBabEzSs6cORX8kVoCR26Otd2hcfc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120049
X-Mailman-Approved-At: Thu, 12 Sep 2024 07:56:55 +0000
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

Add support for MDSS on SA8775P.

Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index faa88fd6eb4d..272207573dbb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -684,6 +684,15 @@ static const struct msm_mdss_data sm8350_data = {
 	.reg_bus_bw = 74000,
 };
 
+static const struct msm_mdss_data sa8775p_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 4,
+	.ubwc_static = 1,
+	.highest_bank_bit = 0,
+	.macrotile_mode = 1,
+};
+
 static const struct msm_mdss_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
@@ -725,6 +734,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
+	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
 	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
-- 
2.34.1

