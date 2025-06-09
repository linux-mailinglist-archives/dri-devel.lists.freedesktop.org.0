Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E4EAD1D7B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BDB10E2E1;
	Mon,  9 Jun 2025 12:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OoPi23Zm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FC310E2E1;
 Mon,  9 Jun 2025 12:25:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598P033003426;
 Mon, 9 Jun 2025 12:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EXW2fw4gKKLBYPAt6nrGAu+93fAB/A+cxRP0dYbGD8Q=; b=OoPi23ZmmLh1i5cC
 WjrXZfu16su3a6fUz8oiHo8XnjrNsD8H60HCkPahJErnx2XjBrcVBubDGDqPRV95
 S/DPY/GY0Yz6SRxdbw6DfWXhR8rxtxZ/CKPMXvlB7tGHwK8rS6hN/YNQFOqGZ/WO
 u42ZJPo+KKjjqC/RaBjMP/qnUkyiQ2luLt/jAfP2H8kPbndxA71lZ7t0lhQc6kXZ
 QiITZydQ1kAb84oD3t59fPO7K4Hkjo0n3WmcIsZGxB+Vi5duzEE1hAN3CPaEI4st
 bigOr/AssQtFlOkGVGtIupNXdiOcDTGYO8VCd3zwugonZ8Vv7gPAQ1h+Y2mhoxci
 TQ4oJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y0q9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:25:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CP5iL015387
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:25:05 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:25:01 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:55 +0800
Subject: [PATCH v2 36/38] drm/msm/dp: mark ST_DISCONNECTED only if all
 streams are disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-36-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471765; l=1056;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=buSFm0NQq33aIAbuMwYXYsQRWBvHZz+UYRxfjD/pFCE=;
 b=knOItuG8RrKAKN0xzMu5EBRkwr20zYPFNGdk9NrKR3Qi3lCEW2onJabfpKSEDIhtO6MIv86s5
 CT/+EWzSwz/DLndlnCMskawxOOsO5qn/qvmXcE5XHTCKSZe5lWfGp4n
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfXxO5+z5Uu2sMd
 bqe6rKZlC8GtY/o5GedwG5LrDqDdeK2NC0DbPGGomWCHeHlBHcmTjfTwDxHFhK7/1cOIMZZJ4mH
 cuvZXyaoKD0aLdOPxZQwF4vn37gDrovjg9Mufl5n8dVTTysGlMbZK7vMsyb/XAHlcCbojM8HeWI
 7CKt2nQ87tAuf1z5W/lAWEsK8EX/KuoDybSky3Wd3KrLadAAAqwmodGO0QF573lrd5Jq8q5RRcM
 sSmrh45/rwD1zw748607m7WmBQ9qXkOtCILuJNwyFS1+6KjCAi3s/UH4qmeO63XyJrMZprlENVB
 jWa3SXv4knDRp0vb4PAPe2+uvhaBgNPjKAqs47YGUWLuQ0NgOG5xd5gJfb0FAED5jjXDDgm3dH2
 TCmG2nN+cnJ3ChASqxAbpvZmhbOa5MVkegeIGSWd5Rn8j3R+zBxiMeRo/psD73pfT9wxgqK8
X-Proofpoint-GUID: ZhPzYvK9o3_pEuV1ZDyRBMXxOPjNEdwl
X-Proofpoint-ORIG-GUID: ZhPzYvK9o3_pEuV1ZDyRBMXxOPjNEdwl
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846d2a2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=IMwXfr57aaYnDS71XcoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=684 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090093
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

HPD state machine assumes only one active stream. Fix it to account
for both while marking the state of the hpd as disconnected.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 526389c718edccbac9b5a91e8dabf0d84ed1a8b0..75f2fd7c75eae81e5c843f8ae2d1ce12ad0cad7e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1824,7 +1824,7 @@ void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_
 	msm_dp_display_disable(msm_dp_display, msm_dp_panel);
 
 	hpd_state =  msm_dp_display->hpd_state;
-	if (hpd_state == ST_DISCONNECT_PENDING) {
+	if (hpd_state == ST_DISCONNECT_PENDING && !msm_dp_display->active_stream_cnt) {
 		/* completed disconnection */
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
 	}

-- 
2.34.1

