Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB9FAD1D39
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C1A10E08E;
	Mon,  9 Jun 2025 12:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EuhBNoO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C838110E253;
 Mon,  9 Jun 2025 12:23:34 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55994PRH001845;
 Mon, 9 Jun 2025 12:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 12u/CLWR3gEX4dBuCDR1FHlCGlXot9aXpf/JnBZEOew=; b=EuhBNoO+5OtB9b6I
 ShEdnplOEEyZoyTd57UdJgI+ZcchJqPfqrV8EF6TB3FzlVLqt/7/QCpE4R+gDAx8
 xV7VUXhMNAwyji3Tc1/3xlDP7gDTsNpBTv3rmAcZ1ABhK6f26dkIRu9MFS6P1QhP
 oiOweAJmXSRAuhdfIUAoqbh69V5OPAn+A1uV9w/ELJHcLOihtLDBUYOTwVvmZSS2
 2Gz/7BrnvhepkgXsMLEjvj7jQbMSPdBFiNNsbfFqcU643g4xIGlN8RnPTM+vv3Jc
 GdpQXeV/AzKiBpSIio5CjS6TnVV2+4b5M9LwEddIVIb162ZQOTesZprvyRSG9u/k
 aacMyA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxpae9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:23:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CNSHg032056
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:23:28 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:23:24 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:29 +0800
Subject: [PATCH v2 10/38] drm/msm/dp: introduce the max_streams for dp
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-10-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Yongxing Mou" <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471755; l=2038;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=vC5/crJytWqzIfSLH1DZcnKnrMLZSCirOk4BNTRrFso=;
 b=BovetZoZxdkrItBG2M+dJc9j/Na6tZ37f0Krl8RShPawpXaibLN6xlw0rn9pp2tg4UguYIzjy
 5yf4OS62dEiDULKsGBfxmm+ufrve2UyZfbhzmFl8xcVxN52cDr1FddX
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Yhmm4UeR-E23cm5kShqnuiI3ekAK89oH
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6846d241 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=_tefP2QuMgGir7pkG4wA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Yhmm4UeR-E23cm5kShqnuiI3ekAK89oH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MiBTYWx0ZWRfX8gSEwwbuvWUf
 k0/nhS4vPC8c7ILvFjizD7INV7nNL9xUIqruSLFz/0kENBgnOMu9sUo5EcCBdvhN3oiGsaoWgC6
 3Fs/batL3XTvFpbi7UoWMoE/D+6+/2WvovmnlFjHWvd/D4kL5vQ0hXVZQTWG8dm4HcyFE4dGyiw
 V46dVD513HFIgWb3tfdJHmJiaIHqEfDZK/XmE9IiXK5icrCsaWlRRt/ljT0SFxnZhLKGBQTljJR
 RkBpi85k+GngY2uV5pwc6wdeLHtZTegDk40MBqJNdZLQKQBMPZP4zaPazv0lzzA/CpxZIMd16YH
 KD9gqfEtgt1A8+cbI9jNkrO06X+9YrGnh9rxvJBWbESD9bZe7VA+ngjM3L43E9Q6rJrFRIVbsu9
 ZbjYnEVCoCKWlvXzpTElei5Q7+dOGYZV6/xScmFSaKb4VzxSXGBXFynUESEsdIxuGiqV6Ivq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090092
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Introduce the mst_streams for each DP controller to specify the number
of supported MST streams. On most platforms, the supported MST streams
number is 2 or 4. For platforms that do not support MST, define
DEFAULT_STREAM_COUNT as 1. Also exist platform that DP0 supports 4
streams while DP1 support 2 streams.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7ed4034c89605596c874a6bf9a5a19586d6c13fb..4e0213cae4aafb468681db27b3c3fef28d44b2c0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -34,6 +34,7 @@ module_param(psr_enabled, bool, 0);
 MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
 
 #define HPD_STRING_SIZE 30
+#define DEFAULT_STREAM_COUNT 1
 
 enum {
 	ISR_DISCONNECTED,
@@ -83,6 +84,7 @@ struct msm_dp_display_private {
 	bool core_initialized;
 	bool phy_initialized;
 	bool audio_supported;
+	bool mst_supported;
 
 	struct drm_device *drm_dev;
 
@@ -110,12 +112,14 @@ struct msm_dp_display_private {
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
+	int max_stream;
 };
 
 struct msm_dp_desc {
 	phys_addr_t io_start;
 	unsigned int id;
 	bool wide_bus_supported;
+	int mst_streams;
 };
 
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
@@ -1330,6 +1334,14 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 	dp->msm_dp_display.is_edp =
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 
+	dp->max_stream = DEFAULT_STREAM_COUNT;
+	dp->mst_supported = FALSE;
+
+	if (desc->mst_streams > DEFAULT_STREAM_COUNT) {
+		dp->max_stream = desc->mst_streams;
+		dp->mst_supported = TRUE;
+	}
+
 	rc = msm_dp_init_sub_modules(dp);
 	if (rc) {
 		DRM_ERROR("init sub module failed\n");

-- 
2.34.1

