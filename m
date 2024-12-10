Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45139EA904
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 07:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C5A10E263;
	Tue, 10 Dec 2024 06:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="chZ8Mo09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E049510E157;
 Tue, 10 Dec 2024 06:55:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9I39iu022156;
 Tue, 10 Dec 2024 06:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VAQi3Z053lPEt8r/0kkdBqkL9Xqtz6KVsTRB4uSpfvc=; b=chZ8Mo09lc0OVq68
 CvMwuurDyighy5uPKgSqwRNw/mshGZmJ/0cWNFAyPqY8WoYZXqdgubsWVYK4G4n6
 zhu43yTzbsixJfN7xnMaTL4F/Ev84WGQ5TECC4ufhOeydTX9lzqtVI0Aan7MtFiz
 8mBcSHR+YZAm9X2GLJcWriHWQdwdwVQ77SqoWq5k58JNUWGelhFCagqtRN7s/Zvq
 QhiUhdtIBSmkidnEKDsBPNn2Dx4vhS3bA+7G/Euqx9pJ8Jtx5SbDer1uJudPuAgB
 4UuZxhk+Gm/YMRXrungakQ8n3Mkq/zBnv2yCgwiVYfrqDVNXdEKCheHYYzbhGZyA
 uAsthA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgqfg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 06:55:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA6tKB6015334
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 06:55:20 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 22:55:13 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Tue, 10 Dec 2024 14:53:55 +0800
Subject: [PATCH v4 4/9] drm/msm: mdss: Add SM6150 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-add-display-support-for-qcs615-platform-v4-4-2d875a67602d@quicinc.com>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Fange Zhang <quic_fangez@quicinc.com>, Liu Li <quic_lliu6@quicinc.com>,
 Xiangxu Yin <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733813686; l=1470;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=A5ERAGSyozpawe91R925LWA9XlMqrEHKwcZUew7KPOg=;
 b=Gu7Ari5UqywqbPFynGtDblToVlFCXB8fV0KT+E3nP/2/jqQ3jWNwaWXPAcI8kTczTQOD12JXE
 Jwoze6SkC1oBgF6MZP3NPwWEXwWDfuEg1AYgdRtONrhGVzwtO9kCk2Y
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FupSdsIxcgD6AfbRxygL3u1Kv9leu_82
X-Proofpoint-ORIG-GUID: FupSdsIxcgD6AfbRxygL3u1Kv9leu_82
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100050
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

From: Li Liu <quic_lliu6@quicinc.com>

Add support for MDSS on SM6150.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 76b6ae35a3cb5da5047e4e5628b2aab6d3e12cfc..7dfde292914dc7b940936dbcfe74aaa7afa33157 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -667,6 +667,13 @@ static const struct msm_mdss_data sm6125_data = {
 	.highest_bank_bit = 1,
 };
 
+static const struct msm_mdss_data sm6150_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 1,
+	.reg_bus_bw = 76800,
+};
+
 static const struct msm_mdss_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
@@ -724,6 +731,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm6125-mdss", .data = &sm6125_data },
+	{ .compatible = "qcom,sm6150-mdss", .data = &sm6150_data },
 	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
 	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
 	{ .compatible = "qcom,sm7150-mdss", .data = &sm7150_data },

-- 
2.34.1

