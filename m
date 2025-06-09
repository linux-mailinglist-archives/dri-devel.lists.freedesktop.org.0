Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D142EAD1D5E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354E310E2DF;
	Mon,  9 Jun 2025 12:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XS5MCwWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA3310E2E1;
 Mon,  9 Jun 2025 12:24:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598P7s6000976;
 Mon, 9 Jun 2025 12:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e+kTmffyePxQj27IXZtFdB7OV9y4t3RQs9UL0ltl/d8=; b=XS5MCwWtUidKh2C9
 sm7Ss20dsQXqb1eRagL5X7veMb2X/avlj+9FU07rMkh6WQm0L9Lg3QVmAZ1LKsH0
 ynxPK7bqAQrr5J/Geps1Pii5pYJSqrnYFMVLYw9wCkxFAjmb+8c5gmlg1Yogsr4n
 SPSAy1eMbPdE0NyqBjwnAg5A8JFKQLz7HmqflcaGOrHmMY+uhU98o4raiaQsqVrH
 J0KDEDsLBV31PLUCEEUqxwMUHuAftBJoSeBv8EmIP3Pa0sgEK4SCoKmw1bUM66bK
 nMOh++2WJnfp45ARSTW56YEX0axetmTVyXARryTBf04RJaOJGFTu1jScBrcE7+P9
 i+cg3A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2t8q1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COKjM013945
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:24:20 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:17 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:43 +0800
Subject: [PATCH v2 24/38] drm/msm/dp: make the SST bridge disconnected when
 mst is active
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-24-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471759; l=974;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=ECVKyTSFZtB4MmiYX3A+bYSZZRXRs3hF43egjxTDJSk=;
 b=d5j3F01FhCI8+Yvc+SE9ZecTuoHm+pZPJxyFIIHR7U1p0d0zmM2jkve+ezlDUI/3K3jjd8eBz
 BPA41vtsYmWArWlCb55bHBzu3jh0LrF3E/cf0BmxD4Nnr9Ju7sf9cpn
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JHzQqjwbK_k3pis5rKQnwSBArtjUNaCy
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6846d275 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=kAQZ93kbSALyL3n1LdQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JHzQqjwbK_k3pis5rKQnwSBArtjUNaCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX26bj374Bg9ck
 IfdWs8QKmRnyWF0+si+xyIr4yz+X77qIyNiKccRp6WzxvEyuKnIoFOGAXYMpXIFyaG05KcPSEzS
 iJZNSxiVELGNxT2bpGT+60MPbo3n4n1/ux2VD9P3smPp7mNi5mHKij0LLmU4meBDhXNuc3yngqU
 PQH7l1Ov6FGleDWhhfsTfgX9Otz/9PvC76uUeVENIIxj9mV+hup1GAB46dy+EFxTvlfsctQNP5d
 PlZNU/mUgHh5j8TuMM8FLBH32syUUFGIflOABH9NbYdsZ7co1AGgqsLsEfuz2QbRU5s4DIt5sEl
 8NnGd1UpoKvnKWA9Lo6Gsa5Bd6y05baIA+NYvE0tskKe5EUfvz/3ZkBQMmx8aS12orrMfZY9PbU
 lVAiDynT7vARikSlO1sxpiOU7QGCoypE1jgOy9vTKQ2IY+TgtnVSS9iMrx71Tr9V1YU33h83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=871 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

This bridge detect function only work for SST, MST connectors detect
controlled by MST bridges. Skip detect in MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f0144cf3c5876d94c44a44adad766f242609113e..18a6f71b2792baab461bb368c353c56885ad68fe 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -29,7 +29,7 @@ static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
 	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
 		str_true_false(dp->link_ready));
 
-	return (dp->link_ready) ? connector_status_connected :
+	return (dp->link_ready && !dp->mst_active) ? connector_status_connected :
 					connector_status_disconnected;
 }
 

-- 
2.34.1

