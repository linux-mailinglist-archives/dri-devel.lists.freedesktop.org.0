Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C21948337
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 22:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3CF10E2B2;
	Mon,  5 Aug 2024 20:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OSnRosY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742DE10E2B2;
 Mon,  5 Aug 2024 20:21:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475B9Bxo014256;
 Mon, 5 Aug 2024 20:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=egZuFsuZto1SqcIaxNFXzN
 5CTbrwJyyfmgxzlobuFsM=; b=OSnRosY/Ow4cKWaocUuBFyMN0H9jByHdqdXOJK
 HeP4x/k2kTWbTCcTtQCgXy7WpDXYIzD0c3YaXqs2IyBpVd2c5wdLVWfTyR0pCJwY
 omzSZAvVyWB6IV3zCyjKwKyyLyZYhmC2gqdbrU8riJUSIprG0ekv/meTf9db6pxJ
 zQOiAn/s9thh9ny/4yZACfVnQqy9mYeK+/JdUOZ03Q9zBrDTdNreT86L57axJo3f
 y9izVwqxbp8YeLTWeL+JDgID3kGhcQuX6KeNntBue/oysFYlZ4ngDuVxqUvVe7nc
 BtersA5h1kM0wFKRO+h6MAuMPwve3FkkfqiA7jt9WZuz59tQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sdu9520g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Aug 2024 20:20:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 475KKQGM002188
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Aug 2024 20:20:26 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 13:20:26 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Tanmay
 Shah <tanmay@codeaurora.org>, Guenter Roeck <groeck@chromium.org>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <swboyd@chromium.org>, <dianders@chromium.org>,
 <neil.armstrong@linaro.org>, <andersson@kernel.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] drm/msm/dp: fix the max supported bpp logic
Date: Mon, 5 Aug 2024 13:20:08 -0700
Message-ID: <20240805202009.1120981-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: RFa42TrQE1efk3rUkDfVjwSDV3l3V7s1
X-Proofpoint-GUID: RFa42TrQE1efk3rUkDfVjwSDV3l3V7s1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_08,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408050144
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

Fix the dp_panel_get_supported_bpp() API to return the minimum
supported bpp correctly for relevant cases and use this API
to correct the behavior of DP driver which hard-codes the max supported
bpp to 30.

This is incorrect because the number of lanes and max data rate
supported by the lanes need to be taken into account.

Replace the hardcoded limit with the appropriate math which accounts
for the accurate number of lanes and max data rate.

changes in v2:
	- Fix the dp_panel_get_supported_bpp() and use it
	- Drop the max_t usage as dp_panel_get_supported_bpp() already
	  returns the min_bpp correctly now

changes in v3:
	- replace min_t with just min as all params are u32

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/43
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index a916b5f3b317..6ff6c9ef351f 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -90,22 +90,22 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
-	struct dp_link_info *link_info;
+	const struct dp_link_info *link_info;
 	const u32 max_supported_bpp = 30, min_supported_bpp = 18;
-	u32 bpp = 0, data_rate_khz = 0;
+	u32 bpp, data_rate_khz;
 
-	bpp = min_t(u32, mode_edid_bpp, max_supported_bpp);
+	bpp = min(mode_edid_bpp, max_supported_bpp);
 
 	link_info = &dp_panel->link_info;
 	data_rate_khz = link_info->num_lanes * link_info->rate * 8;
 
-	while (bpp > min_supported_bpp) {
+	do {
 		if (mode_pclk_khz * bpp <= data_rate_khz)
-			break;
+			return bpp;
 		bpp -= 6;
-	}
+	} while (bpp > min_supported_bpp);
 
-	return bpp;
+	return min_supported_bpp;
 }
 
 int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
@@ -423,8 +423,9 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 				drm_mode->clock);
 	drm_dbg_dp(panel->drm_dev, "bpp = %d\n", dp_panel->dp_mode.bpp);
 
-	dp_panel->dp_mode.bpp = max_t(u32, 18,
-				min_t(u32, dp_panel->dp_mode.bpp, 30));
+	dp_panel->dp_mode.bpp = dp_panel_get_mode_bpp(dp_panel, dp_panel->dp_mode.bpp,
+						      dp_panel->dp_mode.drm_mode.clock);
+
 	drm_dbg_dp(panel->drm_dev, "updated bpp = %d\n",
 				dp_panel->dp_mode.bpp);
 
-- 
2.44.0

