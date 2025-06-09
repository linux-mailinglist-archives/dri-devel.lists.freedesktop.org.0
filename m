Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0617FAD1D47
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619C910E2AD;
	Mon,  9 Jun 2025 12:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="QQC0U7aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26ADB10E0C2;
 Mon,  9 Jun 2025 12:24:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559B9X48020311;
 Mon, 9 Jun 2025 12:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Y2VLSAa33p+BHDOAbtzOwTG5u0HGTWsyBSHz+95aRIE=; b=QQC0U7awKrphMPeO
 Cl85tROSCw0piXLcNvv1HjtomBpvY+aD3GueH3B1MAGqMhmJEzGt9X1ncDzFkwNE
 5W8TMJNAyNTBLqms3wal+KkaAZbarIG965G1jW6qGB3hXiPd78ESOLsMMjLAPr72
 gGGl8141dZlcEIkQN8yZCer/MPkDOkB/r4u5mMmgMhORDQsbLqVX/F/iE1moGps6
 N4AYOCtS1rW1RfReMdKfWg8kHBfCxjxJpNjCEPIeAJZ0ghmv5GL73eXSMHwzjUzP
 4UJIpiI8rFuRpU5i+TqiXIbDQ0Kc9DYFwu4rLIv10h2aMaLQ85cBTkY68e1QcxmS
 pEH7Ig==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qctsd4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:23:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CNswS016736
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:23:54 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:23:50 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:36 +0800
Subject: [PATCH v2 17/38] drm/msm/dp: no need to update tu calculation for mst
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-17-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471757; l=1022;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=N8xoAc6P8kRdZ8a1+edZWJqAu09q42wM1+exFZL9GC4=;
 b=IHMDQaoJKcVU7lLb1e5EK/kcxh1Xud/lZDVzGYulOtDGx8aQ2PzXRTDYITUsmPctNeo+MNVgB
 MlagZ19SXzFBGXarOZePZ0Hjg91WktIgxei306Z+xMjrstbCxrSF25X
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ne2554JdYdyRoCqAMG4kBy4lD-UOMzD-
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=6846d25b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=nb1SeSCrlpLBeGjklAIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX7/KiVBgjuSIr
 RhsjPIfHjdWLUPQE8M0umA/5m9YAD3lfPwMmJES0rHve7h4+9sEIYqTsB5qD0MT8SMRqxBYZFu8
 Tk+y8svM2cuDWHX5Z0Aqqq6/qDIxgWn6X9BtfcYNWI17XuRyEesIJQbO6Als0maejdw1hONV3yp
 IDdO/piQFkL6xi0hZjsscU0y5SB5mnXuLwQQlsObhwY/YX2/GR3r+SJwNRa13MnWNufiwnjSt5a
 4Q09ogANxYTB4nVwU2VeIJLloDdPplZUDbkZ4+YMRNHm1rpgsMzYCkGQ74c5nhiVbKkTWcp56Z/
 8FoWRRnYaWMWkp4qplLTa/jVUtQ651eyWJ2jp55it2s9epPXRBlpisimxmmUb03FczdgOVU8+kB
 xvczCHNPKPHuwCH22fz5C6q1vQ/0XoRDIBTAVG/A1ezOL0LY0uOD3Qc0L7khCeYCYK4LlNd1
X-Proofpoint-ORIG-GUID: Ne2554JdYdyRoCqAMG4kBy4lD-UOMzD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=787 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093
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

DP stream is transmitted in transfer units only for SST
case there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 64d9862841a22b8298c6e4eb6e488834e38ddcd0..596a949827a4db7c5ce3e804d31c3db8e048cebe 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2108,7 +2108,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 		pixel_rate_orig,
 		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl);
+	if (!ctrl->mst_active)
+		msm_dp_ctrl_setup_tr_unit(ctrl);
 
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.34.1

