Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C25A214EA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 00:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9269810E1C0;
	Tue, 28 Jan 2025 23:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="oO3xkces";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D606E10E17E;
 Tue, 28 Jan 2025 23:10:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SAD43Z026568;
 Tue, 28 Jan 2025 23:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=yefMpW1C2aGI8kXUMOsgFx
 +l8rC9VdtWe1kZ0PAixY4=; b=oO3xkcesNOb3pBCrnfnRe5Hl/nl8POcSMzCpFc
 Skcj7pu19W5bXDwYWWyJJReSaNERC/nTsz2iFEmree7OM7ZWNHEHD05KcoSzByRe
 w6Uk/L2l2ZUmE5wM+YT2gOHkmwpFEw5UVn/o8XN00bhkz3YuC52C/D1FOw14IYDV
 88GKc5AoqSctwa3QRqpVHX0NJ1nFT6ckqkJ9hD2EloWim+d61GNt9PiHoDxws+qD
 iNme3OyvE4rfVv6unvhJ7MmdBtzCY1lmK3YEP9Ncw2vxYPfHQjV0zLL/mhbTAQUA
 fXvUXsBcu6l8Oy7PixwThmFPyeeAnM5m5eH1ioUXbYJrJR/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ew9n9r2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2025 23:10:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50SNAiK9009833
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2025 23:10:44 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 15:10:43 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 28 Jan 2025 15:10:27 -0800
Subject: [PATCH] drm/msm/dp: account for widebus and yuv420 during mode
 validation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOJjmWcC/x2MSQqAMAwAvyI5G6hBqfgV8WBtqrlUaXGB4t8NH
 mdgpkDmJJxhqAokviTLHhWauoJlm+PKKF4ZyFBnGrLoD7zFszszBnkwuNn2zjG15EGjI7Hqfzh
 O7/sB3RRV3WAAAAA=
X-Change-ID: 20250127-dp-widebus-fix-fba78bbe242d
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, "Stephen
 Boyd" <swboyd@chromium.org>, Paloma Arellano <quic_parellan@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738105843; l=2709;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=bNhJM9Dz+pFtEkrdraJnL0ogylvmTs5Iev48h4gj8Ck=;
 b=TSoIccbmYsisZ1vIphsvo9JGUt0NI2VguFVr0fxMABvrV4Im28gKY3qf6zdfOzhRitFo8IOrj
 dOvV1RD2QrXCHRtWijAiTWDFnLq1fXryacsh/OCvr4sp+iSs7EtM0oR
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bRgq6rU025BvzHJqCCvMavao45LlY_Uu
X-Proofpoint-ORIG-GUID: bRgq6rU025BvzHJqCCvMavao45LlY_Uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=861 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280169
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

Widebus allows the DP controller to operate in 2 pixel per clock mode.
The mode validation logic validates the mode->clock against the max
DP pixel clock. However the max DP pixel clock limit assumes widebus
is already enabled. Adjust the mode validation logic to only compare
the adjusted pixel clock which accounts for widebus against the max DP
pixel clock. Also fix the mode validation logic for YUV420 modes as in
that case as well, only half the pixel clock is needed.

Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
Fixes: 6db6e5606576 ("drm/msm/dp: change clock related programming for YUV420 over DP")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
 drivers/gpu/drm/msm/dp/dp_drm.c     |  5 ++++-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 24dd37f1682bf5016bb0efbeb44489061deff060..a4b420a2d9eb7f084194f443e84a4013c9b4ef0f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -930,16 +930,16 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
-		return MODE_CLOCK_HIGH;
-
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 	link_info = &msm_dp_display->panel->link_info;
 
-	if (drm_mode_is_420_only(&dp->connector->display_info, mode) &&
-	    msm_dp_display->panel->vsc_sdp_supported)
+	if ((drm_mode_is_420_only(&dp->connector->display_info, mode) &&
+	     msm_dp_display->panel->vsc_sdp_supported) || msm_dp_wide_bus_available(dp))
 		mode_pclk_khz /= 2;
 
+	if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
+		return MODE_CLOCK_HIGH;
+
 	mode_bpp = dp->connector->display_info.bpc * num_components;
 	if (!mode_bpp)
 		mode_bpp = default_bpp;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d3e241ea6941615b8e274dd17426c2f8557f09b5..16b7913d1eefa8c2deb44df201a1977db23f4531 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -257,7 +257,10 @@ static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
+	if (msm_dp_wide_bus_available(dp))
+		mode_pclk_khz /= 2;
+
+	if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
 		return MODE_CLOCK_HIGH;
 
 	/*

---
base-commit: 2bd7708f11777d4fd436fcba62b57cff6a92e389
change-id: 20250127-dp-widebus-fix-fba78bbe242d

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

