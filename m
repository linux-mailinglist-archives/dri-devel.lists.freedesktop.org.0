Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64FEB1BF32
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 05:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69BC10E71B;
	Wed,  6 Aug 2025 03:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nTvjEni8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8341D10E71A;
 Wed,  6 Aug 2025 03:18:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761f9Lo001011;
 Wed, 6 Aug 2025 03:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jc/eY22T05U0ceSsVqKBE7qKAwlYmbWFYJoaOv/3pq8=; b=nTvjEni8hWvUrnRz
 aDcaSV+qGbsmjJr8hAPthwTfW7u4RFMtXIbwfxjE8Vy8IkcpBuuLUkYQfHadAlcZ
 Ke56cTkUuCVELGH0wRaF3kHRcUAyvIMb94KoSe/ZwW/D7jIuEJf9uhgNQpzbJG1q
 QEkunioKaplNcNU648L7/6bLni7QnjcpQutpwQ/VCZ/AoolGSk0wl1nLjSLi3JxQ
 pck4xbp7rRLzJrY7aoU2CYEfY5Ox9jA3H0hSYC3V7v+hxUm5FU7t9YMx+BJuUvDz
 icpgHRym9Ued6q2PFhLWI6VdmPQcBlesneNRM9JhH6YBrSW5tUqQuVdFALYtFDyn
 0nPOJw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6s8dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Aug 2025 03:18:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5763IDD7000883
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Aug 2025 03:18:13 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 Aug 2025 20:18:07 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 6 Aug 2025 11:16:49 +0800
Subject: [PATCH v6 5/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250806-mdssdt_qcs8300-v6-5-dbc17a8b86af@quicinc.com>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
In-Reply-To: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754450256; l=1064;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=fOTE/t/E8euAOByNu6M8CwIUgew+z2YghVomfn5mJm4=;
 b=hePWhAb8aJiUMmwjmd3QbWllQL3NILeZoDbv2W2HyifUJkcJCtL5BoElsZ8qI6w8VPrs/W7B3
 /2vC25vMEDSAdqIfR2NMHMc4OGf5j7kHZQraSVvyFnIdBy+EchYGhRg
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: V_aJURB-Amd8UWIZqJZ0ImcF634P2k_B
X-Proofpoint-GUID: V_aJURB-Amd8UWIZqJZ0ImcF634P2k_B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX1EQA+FivE9jZ
 FsU6/s6jQGIEk6xx7xN09zROW5LNw6zpUIZ3P8OKV7WMbMLcrNrUMxBG5j6Xm8oRvvRT5htIa6R
 9/0LPnMbyRtAPvDopQ1sGWQPWkkyEQOdPBXCNayw4QnFmHt9PL83ZN2a4U/dmeGO1Rmlnj3bxNK
 1zHGqpKvdONBkzBREsrm/S5rbNvAJhgUrciglBGFUaIgpGA4x2aCpEuBENHjCuiQ/HjD8gy+V4c
 MZ0xKd9ZjC26852KgHxsbdpdNSNX0/1KKGACA8kCxJGz5l19zVQzk2AMdHrksQWJhz4PjAYWtbv
 AALBl6bnD6Q2RY8bVDVHtRTcU3daknj0FlQ+e6gQmzk6uV3wWarJvJT+G5p+sl8uRxKc7XZ2z62
 kskIbtmo
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=6892c976 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=QthX4i1fCipBYTe6RHsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009
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

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP as fallback for QCS8300 according to the specification.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index bd0a98aad9f3b222abcf0a7af85a318caffa9841..061420826fb9946e58ac1ae5452c603193378839 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -225,6 +225,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.34.1

