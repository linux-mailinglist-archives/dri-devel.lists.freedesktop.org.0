Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E699E0D35
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 21:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1A010E84A;
	Mon,  2 Dec 2024 20:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="a9AA9Nqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4232810E841;
 Mon,  2 Dec 2024 20:42:39 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2IU6fV030649;
 Mon, 2 Dec 2024 20:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GlLdvDlRzxdx5tP7v68vMBpASgo7Y0IjadtFWKOVMbM=; b=a9AA9NqzxjvZK59X
 y2/sFVlMka69A0u3rQZGQxVQ07eMCM8KZWo9RCJjF21vajyq5r6NJoYix2hTaoRc
 CgBPNpOxaiR2QBWMFc4LfaVCIJi8TxIV4oP3jMfBl7Dr09EUSDNap9Bi5u6djTn3
 lj4n+ec8wCIzfhXMAoIoXX0s0zwkutHsnkX3V1JF6fgIxJx9XhY3nvsJWoKnLTQP
 As9S1OhNC27toy7SVTECzKsxXUJy2ZWjLX1MQS2+S7CwvDaTcJ+hB/B2zUN1yEce
 fj28MpzFe/hW4m6LK8nZ8ZrzJkNCBS7VFucdPvTXYXyAqdgBN4w1VaJtWKdMNcS1
 fyHKpQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1ge15w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2024 20:42:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2KgZ1M019541
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Dec 2024 20:42:35 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 12:42:34 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 2 Dec 2024 12:41:58 -0800
Subject: [PATCH 1/3] drm/msm/dp: account for widebus in
 msm_dp_catalog_panel_tpg_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-tpg-v1-1-0fd6b518b914@quicinc.com>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
In-Reply-To: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733172154; l=1329;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=jn+N9zwIOsPHht+9CIjwP5bJju34BSnF8zN3S7G1imQ=;
 b=3cKObY/EEQ7Wt+Pxq+KLoA5TrTbhA/vocKACaaY10Z1XzeLCocFPlgRvxKndNgK4RpW0LxIqk
 HfAalffFinmCBGiAiBvIfVM5huvk89Q7QJK4rF4Wu1Ed7wmB1IUSaEo
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: N63Ymxed8R_ETFDIoL6dXhi0Z5GWXAXt
X-Proofpoint-ORIG-GUID: N63Ymxed8R_ETFDIoL6dXhi0Z5GWXAXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020174
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

Adjust the h_active calculation to account for widebus in tpg.

Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b4c8856fb25d..05c8e1996f60 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1011,9 +1011,21 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 	u32 v_sync_width;
 	u32 hsync_ctl;
 	u32 display_hctl;
+	u32 h_sync_width;
+	u32 h_front_porch;
+	u32 h_back_porch;
+	u32 h_active;
+
+	h_active = drm_mode->hdisplay;
+	h_back_porch = drm_mode->htotal - drm_mode->hsync_end;
+	h_sync_width = drm_mode->htotal - (drm_mode->hsync_start + h_back_porch);
+	h_front_porch = drm_mode->hsync_start - drm_mode->hdisplay;
+
+	if (msm_dp_catalog->wide_bus_en)
+		h_active /= 2;
 
 	/* TPG config parameters*/
-	hsync_period = drm_mode->htotal;
+	hsync_period = h_sync_width + h_back_porch + h_active + h_front_porch;
 	vsync_period = drm_mode->vtotal;
 
 	display_v_start = ((drm_mode->vtotal - drm_mode->vsync_start) *

-- 
2.34.1

