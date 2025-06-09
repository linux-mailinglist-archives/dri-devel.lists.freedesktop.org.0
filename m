Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE24AD1D55
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D8F10E2A4;
	Mon,  9 Jun 2025 12:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="e6uslFg8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A787110E2C5;
 Mon,  9 Jun 2025 12:24:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55994dMj015186;
 Mon, 9 Jun 2025 12:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +A9S9bJbaG6H2VunsAKM57eRXlwRCewUNMzzyjgN0SU=; b=e6uslFg8WflpF43v
 uTcRO9whSe0DJ1OJAJmmzriGPVfDr5PAm9VhHfFh3Kx7PVaAnvCmY4edD1pFds2Z
 vt08vk5Vf25hthc5NbewwPITB3ng2Xa1axjwXDMn7psgt+d3gXyAZT/XLyGeuhIu
 NuNtjZ3vHzSHL0dNEq/pLJvt0zL/y0QFRtDastiNDsLX/ynE5CTaLrzkKEBWtB8c
 w+uy8dxEJZZ4C3AUqxNJ5X78iu2IIA2TrMRHKpqNyB7fPN0KU+JII6WnqgwUmIOL
 /5xSA6Evob48cL7Y3JfJriv5QSMFWF6czZy9eEJi/EdUYW3fwOswk0FtWZw1R+eo
 joFUWw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9p4qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CO5rc013484
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:24:05 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:01 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:39 +0800
Subject: [PATCH v2 20/38] drm/msm/dp: always program MST_FIFO_CONSTANT_FILL
 for MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-20-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471758; l=2864;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=Jm2C91S/JWGmVWHQ+1pNm+JIdti4a/hYYGmWlSIB1QI=;
 b=0A1RpO+DWIMET11PBGMqTjiofdroxiXJc18lnIapK48UJZNKLxIlwiEKk5G11qHOa3MI2Dpu1
 /ywAyNN633DDvqTzjhLxbFuxrjrjnvB6ICwAOA/oZOKwfGlcc3rfrgV
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IIxC4bJfoRKkiBOYMuHVI_470ZoAn1zk
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6846d266 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=ntf8TpgTzTPccQ4EROQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IIxC4bJfoRKkiBOYMuHVI_470ZoAn1zk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX6NJLLD8A92ee
 WVnxjAnLA6takfKVOS2O2y6YxS2s1o80UjvtsLiE5Gf7jButFHoqaS7iXz/YLpWFAXiSQ+iwS/g
 k3dYEfMezc8v9Shzn+DEJAFg/pFh9utX2Yqhq5gC2Tpcr4QHqK4B8TJxJh7Kfg90hFGLqGb9qGK
 n7Px05YPCZwRcSJ5RUUs2kdthdeboGQmU/STKqTMdd9UQKA3klHMv7I8Us/hLtMuN3muG60APcC
 /0daVLNFgfJlRk/8iL7/kc8aN2dCbdMLH2eIbnR2XsryZSVeqP6AG5l90ft2w4kO5A6SG8XAMi+
 1tTfvhYoXXJzZYGy/qdvedVSL2gjn37DgMAaQsdtgF4pHo96AJ7xXRVzYyzx4hFH+yLn5dk5Q4P
 7zTd/zr6cnqURsGa28SSGyCqRamX3xddCJEMZN3L4JMf1mheuQK0awbygIWd1oP/h4XpbFuu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

As required by the hardware programming guide, always program
the MST_FIFO_CONSTANT_FILL for MST use-cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index f2a5170723585ed6ddab2c12d2e5c5d6dee5eff5..b536530be160ed58ef17bf71385c3c4fc7617132 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1011,6 +1011,22 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog,
 	return 0;
 }
 
+int msm_dp_catalog_mst_async_fifo(struct msm_dp_catalog *msm_dp_catalog,
+				  enum msm_dp_stream_id stream_id, bool enable)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+							      struct msm_dp_catalog_private,
+							      msm_dp_catalog);
+
+	/* enable MST_FIFO_CONSTANT_FILL */
+	if (enable)
+		msm_dp_write_pn(catalog, stream_id, MMSS_DP_ASYNC_FIFO_CONFIG, 0x01);
+	else
+		msm_dp_write_pn(catalog, stream_id, MMSS_DP_ASYNC_FIFO_CONFIG, 0x00);
+
+	return 0;
+}
+
 static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
 					      enum msm_dp_stream_id stream_id,
 					      struct dp_sdp *vsc_sdp)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index a1ecab2f386f321ea9d176b3cf3f894a230c9085..7576458d4ef13def4f4d18073bd25ec0ffabde28 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -145,5 +145,7 @@ void msm_dp_catalog_mst_channel_alloc(struct msm_dp_catalog *dp_catalog,
 				      u32 tot_slot_cnt);
 void msm_dp_catalog_ctrl_update_rg(struct msm_dp_catalog *dp_catalog,
 				   enum msm_dp_stream_id stream_id, u32 x_int, u32 y_frac_enum);
+int msm_dp_catalog_mst_async_fifo(struct msm_dp_catalog *dp_catalog,
+				  enum msm_dp_stream_id stream_id, bool enable);
 
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a61514d4b5d42cd92eb13aa7d6759cdc9c0dda71..7056d5638829e8510054614b19afbcaf8aba55b5 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -236,6 +236,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	cc = msm_dp_link_get_colorimetry_config(ctrl->link);
 	msm_dp_catalog_ctrl_config_misc(ctrl->catalog, msm_dp_panel->stream_id, cc, tb);
 	msm_dp_panel_timing_cfg(msm_dp_panel);
+
+	msm_dp_catalog_mst_async_fifo(ctrl->catalog, msm_dp_panel->stream_id, ctrl->mst_active);
 }
 
 /*

-- 
2.34.1

