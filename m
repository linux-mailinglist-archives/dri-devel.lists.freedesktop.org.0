Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5EE623299
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 19:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D8610E61B;
	Wed,  9 Nov 2022 18:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C2710E61B;
 Wed,  9 Nov 2022 18:35:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9HDNAE003198; Wed, 9 Nov 2022 18:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=v7koiuvu/gyqhO/5ZoqF+RWnk2RfCKuzIzs3HzNtxxI=;
 b=jCaefVQhf8+ryxfgfw1srJcwyvY4vsW3mNu/K8JiRVeTv0U8qztCJfvSnXbGyNW4BtcX
 ezgvjLYt7YwsqnBwwg3IcLSlmbz1D2IuGQtpOqK6czwmN2WS+z9tELSae9LPEOR+vrjK
 bHGJ7IV5vCf9dEXGP+yHXtHP2qvBAURk6t1dePnAqWmh8DU8gS9OEQwPmpW29LUE6pA8
 oRTdq5bXTjo7PmpbnuLaxHaWDN4YuJe+2crFtqfQsdZIwGxG9ucueKYIaBl0qEGIACl4
 K1iw372VX0uq7dkFQ6u2rM4Qxhqzkj//ZnpTlaXNVXPERYtLQO9AmzGeZl6HOlUuen+a Rg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3krgd8871p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 18:35:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A9IZBR7021936
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 9 Nov 2022 18:35:11 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 9 Nov 2022 10:35:11 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/2] drm/msm/dp: add support of max dp link rate
Date: Wed, 9 Nov 2022 10:34:55 -0800
Message-ID: <1668018895-29023-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668018895-29023-1-git-send-email-quic_khsieh@quicinc.com>
References: <1668018895-29023-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 01Mz0FYI0j6C4c-7VTb-K0OfqjPxQ2UT
X-Proofpoint-GUID: 01Mz0FYI0j6C4c-7VTb-K0OfqjPxQ2UT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090139
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since it is not every platform supports HBR3 link rate, this patch
limit the DP link rate at max link rate if it is specified at DTS file.
Otherwise, the max dp link rate will be limited at HBR2 as before.

Changes in v2:
-- add max link rate from dtsi

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   | 5 ++---
 drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
 drivers/gpu/drm/msm/dp/dp_parser.c  | 8 ++++++++
 drivers/gpu/drm/msm/dp/dp_parser.h  | 1 +
 5 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 29c9845..0e1a9b3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -390,6 +390,7 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	struct edid *edid;
 
 	dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
+	dp->panel->max_dp_link_rate = dp->parser->max_dp_link_rate;
 
 	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
 	if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 5149ceb..87c27ca 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -78,9 +78,8 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 	if (link_info->num_lanes > dp_panel->max_dp_lanes)
 		link_info->num_lanes = dp_panel->max_dp_lanes;
 
-	/* Limit support upto HBR2 until HBR3 support is added */
-	if (link_info->rate >= (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
-		link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
+	if (link_info->rate > dp_panel->max_dp_link_rate)
+		link_info->rate = dp_panel->max_dp_link_rate;
 
 	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
 	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index d861197a..f04d021 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -50,6 +50,7 @@ struct dp_panel {
 
 	u32 vic;
 	u32 max_dp_lanes;
+	u32 max_dp_link_rate;
 
 	u32 max_bw_code;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index dd73221..d2e31c2 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -95,6 +95,7 @@ static int dp_parser_misc(struct dp_parser *parser)
 {
 	struct device_node *of_node = parser->pdev->dev.of_node;
 	int len;
+	u32	rate;
 
 	len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
 	if (len < 0) {
@@ -104,6 +105,13 @@ static int dp_parser_misc(struct dp_parser *parser)
 	}
 
 	parser->max_dp_lanes = len;
+
+	len = of_property_read_s32(of_node, "link-frequencies", &rate);
+	if (len >= 0)
+		parser->max_dp_link_rate = rate;
+	else
+		parser->max_dp_link_rate = 540000;	/* default HBR2 */
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 866c1a8..ba63375 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -119,6 +119,7 @@ struct dp_parser {
 	struct dp_io io;
 	struct dp_display_data disp_data;
 	u32 max_dp_lanes;
+	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;
 
 	int (*parse)(struct dp_parser *parser);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

