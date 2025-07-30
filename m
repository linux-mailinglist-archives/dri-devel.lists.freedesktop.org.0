Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89356B15C86
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 11:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A8E10E15D;
	Wed, 30 Jul 2025 09:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gtL7FSJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A91110E15D;
 Wed, 30 Jul 2025 09:43:38 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U90aW3027399;
 Wed, 30 Jul 2025 09:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uMuFghrd01AH/MWxPBYGy+BvAX5eeNijY9JTlrpooLE=; b=gtL7FSJl+zw9cEjI
 xjDcJGoRA6U18wViIOjtSXWLp1FnTibFdDvfO1QVlPC72KixBntrbLFntoDkvO7Q
 0FslOdTbAAfxM00wSqGddofC7J7pl2ll+Q18WsakOtury4tMUzPUGfkGzihvbpAy
 Lss4CoGBA6QRIr6FdyG/imK0U4h+IS2hSLyrrZKnZOae1g9HiWtEYW6Eo+tPQPCn
 xRl/recIIWLFUI7l3esWzspXTmncB23ljbu178xsdDQwpd1DG7xW4kU8yiQwECev
 5nXVQy3oLwH/7oiFG6sLLyWEc9fVRSodljxtOOj2n2RAFrceQQKCuIjeSd4Isj0T
 MAPvIA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm34dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jul 2025 09:43:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U9hREX005470
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jul 2025 09:43:27 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 02:43:21 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 30 Jul 2025 17:42:29 +0800
Subject: [PATCH v5 4/5] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250730-mdssdt_qcs8300-v5-4-bc8ea35bbed6@quicinc.com>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
In-Reply-To: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868578; l=972;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=NVJKK4rqt8V2ccvknALSHEvbbLNwQvJThM7B5dXpbrY=;
 b=piofK5Q2i/hOPcCuBr5QZeYa91v2eE+pU2lBGyy/q3JgpqXYPvLID1XNC4d806w+lZTtyVKSw
 n+CV6irR6WtDipnFQtqE0vyP/igxLeF6oY13Zrl82ePrKJC8MReu7oD
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6889e941 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=56KCLgTT6E_AFdM1kc8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2NyBTYWx0ZWRfX5Bjws9fkxXe/
 MZ33H/3z2xrdn9jN/TiKRobIhmRVgazA6E3U43bAusw+leNNOgr7lae7xXyx+eQ12TdkI26LZrM
 OMFHGuR8O+3pu1MAFaTURJ8cfLX0kx6lVnW8g6W8yE0p1ecO9UKbEe1R+63dE4j5ISGc0kq0G1e
 ffblCh0HdblnQrYsgx/UBId02WFdPRSYzCPWwbikUWDMVVL62y6w0+j3ZlihEISOIe+dNvM+Voy
 7jhiHHL3CNgrEdZgReOVELpD7X/TsN43qafo8g5rKPAAXx7dP40DqIIqaFX40HOoC3lTzKtqbLJ
 Kp1QyRV6TfTjoB1WNgK9Y2VflPWZuYXVkH0TmUkrmnhlqJBDhaZHpCSAKfyt8+YTujTadLhKHV1
 aYMAYJVMYhVG/O1oF/ZZZSxKTsVBY8LwbEya99op2r/NV8t812rz2p82YEUZwJD3g5GrxYhH
X-Proofpoint-ORIG-GUID: XmvpBowuftbkrzuYdWLZUdQKeWDwlDa4
X-Proofpoint-GUID: XmvpBowuftbkrzuYdWLZUdQKeWDwlDa4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300067
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

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 1f5fe7811e016909282087176a42a2349b21c9c4..d77b4dcb6d798f9f0598c64a593f0bbebe85e831 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -556,6 +556,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1

