Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19983AD1D71
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDF810E2CD;
	Mon,  9 Jun 2025 12:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Uvh82NQH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE7610E2E1;
 Mon,  9 Jun 2025 12:24:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599XqSI015009;
 Mon, 9 Jun 2025 12:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IlBm34GPsHOdOC/kI9Ze5WD7aNKehTMA4D+RWssWO5U=; b=Uvh82NQHTPB6HwI7
 eSr49An/Ssd43iD/9qYe55Bm+m7PU6WNFWDIfQlo9dRLLtfSgxxcCdufpZ21lhoQ
 wm0r0i2zTZo/tvSTqp5i35NNeTCWrCO4mEMNvtMt3PSo2deKthT4+uUIZRMoGhp8
 Y39LQVSXTlyy9Mw+KmX/Ai4Sydr/h3noG5Zu9l1WIgGS5iq5eT3JgR1n8jq4POIf
 EHiXBJsBFM1bMULbIqZz8jceXqIv9+A0/N5C8twkvU6vRm7gwP0qN7KHxgHhnByo
 5h0vXUeCo0WjeKC7L6RBOBcQUCbbbVtu3XL0mcFHOVZHIXVlRqeoSdGfjvT5Tpz4
 FgJ1lw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv5vn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COkgO014800
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:24:46 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:43 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:50 +0800
Subject: [PATCH v2 31/38] drm/msm/dp: propagate MST state changes to dp mst
 module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-31-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471762; l=3795;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=j6XMM4JU4fy51ITq1sk/VrBTluM4AVXuoKESWwt5azk=;
 b=Ya/kIksIDH8J+h3h7JdZ3jqwokPdD/KBTwEkF8FAWyv8Qu9LkJwAMyQM2mgjfkGoDxNsWgH6K
 ZC3q0CFnx1TBpfDEdxUCJka0QHRY0DbEW6Dc639aBkOsAcxzHVXn31B
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hL3---pek0Sq409HbsKBIWmPF2u6e0gY
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6846d28f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=E4lCa8gnfY7OAWYjri8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hL3---pek0Sq409HbsKBIWmPF2u6e0gY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX2WsQzZKgN2u3
 Ib1tb9UVBnnVZs3NNJN/TMWqhbpTts1nIw8w8U/Q/rqZdAcBjTq94L9WVmZOSUFznBMhU0LkQAh
 dzx5xVcgFkQEfPmjS5heKBxH06C1FQdrRsRRiPDv+7MLUADYxBIMPRNSkYgj/ouPCwGas7bBqQy
 ZX598wWivWS4PwJsf6FTF3FgF7D8LQWv7k6bH2/p+7JUVLq9rPYLYGZZJrjkgFphKam4SsQoIh4
 IXfGRb4yXRC3g49Gl1tzGC661uIdaKmyp3VtS/UTkJ0c88hNaWynQ03ALfS3pu0n+Jcv3Y9+BJp
 ovIauqN7pEp6WMJHKvu9E7ALi8X/nqKjcd2FszXP7Wivh+CuxLCegrrRxFsYA7n3mZ5pSB2AFPu
 mqlgrZwCALpj2GZIkkW8zSpUqh8gfDtOTHIFqD3JebcnjZH5EXM3e5X4SSPZv75L/FshMJhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
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

Introduce APIs to update the MST state change to MST framework when
device is plugged/unplugged.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 323d1c0a9efa4fa30ce97317e873607c54409a11..9dbcf4553cad70c9e3722160a87403fc815765d7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -29,6 +29,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_mst_drm.h"
 
 static bool psr_enabled = false;
 module_param(psr_enabled, bool, 0);
@@ -420,6 +421,17 @@ static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
 	msm_dp->mst_active = true;
 }
 
+static void msm_dp_display_set_mst_mgr_state(struct msm_dp_display_private *dp,
+					     bool state)
+{
+	if (!dp->msm_dp_display.mst_active)
+		return;
+
+	msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, state);
+
+	drm_dbg_dp(dp->drm_dev, "mst_mgr_state: %d\n", state);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
@@ -473,6 +485,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 		goto end;
 	}
 
+	msm_dp_display_set_mst_mgr_state(dp, true);
+
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
 end:
@@ -539,6 +553,12 @@ static int msm_dp_display_usbpd_configure_cb(struct device *dev)
 static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp *dp_display = &dp->msm_dp_display;
+
+	if (dp_display->mst_active) {
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
+		dp_display->mst_active = false;
+	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 5f00ec2f83ad09b94fd6b602fc37f91cb55acf71..e8297d2222b07146fcfb2d98ab2053dd77717744 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -998,6 +998,21 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return &mst_connector->connector;
 }
 
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+
+	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
+	if (rc < 0) {
+		DRM_ERROR("failed to set topology mgr state to %d. rc %d\n",
+			  state, rc);
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "dp_mst_display_set_mgr_state state:%d\n", state);
+	return rc;
+}
+
 static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index d40cb8483f971b1331172b4e5da2c8f67e55e119..de31baa7548a51ff02e758ec43b03a0a31a217a0 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -101,5 +101,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.34.1

