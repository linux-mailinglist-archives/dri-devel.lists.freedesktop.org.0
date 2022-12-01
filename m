Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FEF63FA7B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 23:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0872410E67A;
	Thu,  1 Dec 2022 22:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B421810E67A;
 Thu,  1 Dec 2022 22:23:38 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B1MMNGS005362; Thu, 1 Dec 2022 22:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=BqvH1ztPAkld+QNaf9LMrfSPdVr+UJRpC3ItvXdIn6s=;
 b=P+qde3OwtkW/RjHUpoKDmc6Feu1wAa7YR4fau4ZZm+B/XGCZffhcYk4cN78AkVh4x9/K
 pje5oNliZqKEY5smA4qNCdypBFn8v/ZXy756CE8OUX8vXwoNOIKCU41a2Rp7+VAQ9TAy
 o3yWeR9dSX23vH39zGwIBdXSd79VmfsNFvRw9ky8Gaav0XOeEhzRKtV7IaA3e7foJ1Hs
 JtVdkYSxL2FIwotkZpKXo+myUFPp0B9Gbchs2N0jbhqRw5PgiqN2oEtb7TOg6YtN7FZL
 qRNClVFZ8vojK+JSYchlV5ixYhQS6eT6VNTJq1LBErWCXBayWuFs76Q0tfVni4XGCIqM tA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m6kgmk223-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 22:23:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B1MNW2g013213
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Dec 2022 22:23:32 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 1 Dec 2022 14:23:31 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v7 4/5] drm/msm/dp: parser link-frequencies as property of
 dp_out endpoint
Date: Thu, 1 Dec 2022 14:23:24 -0800
Message-ID: <1669933404-13766-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZaaBDsvWy_BC9ncl5AHoTvqMnvUvPSh3
X-Proofpoint-GUID: ZaaBDsvWy_BC9ncl5AHoTvqMnvUvPSh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_14,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010172
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add capability to parser and retrieve max DP link supported rate from
link-frequencies property of dp_out endpoint.

Changes in v6:
-- second patch after split parser patch into two patches

Changes in v7:
-- without checking cnt against DP_MAX_NUM_DP_LANES to retrieve link rate

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 19 +++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_parser.h |  2 ++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index b5f7e70..037dad8 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -94,15 +94,28 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 static int dp_parser_misc(struct dp_parser *parser)
 {
 	struct device_node *of_node = parser->pdev->dev.of_node;
+	struct device_node *endpoint;
+	u64 frequency;
 	int cnt;
 
 	/*
 	 * data-lanes is the property of dp_out endpoint
 	 */
 	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
-	if (cnt > 0)
+	if (cnt > 0) {
 		parser->max_dp_lanes = cnt;
-	else {
+
+		endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
+		cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
+		if (cnt > 0) {
+			of_property_read_u64_index(endpoint, "link-frequencies",
+							cnt - 1, &frequency);
+			frequency /= 10;	/* from symbol rate to link rate */
+			parser->max_dp_link_rate = (frequency / 1000); /* kbits */
+		} else {
+			parser->max_dp_link_rate = DP_LINK_RATE_HBR2; /* 540000 khz */
+		}
+	} else {
 		/*
 		 * legacy code, data-lanes is the property of mdss_dp node
 		 */
@@ -111,6 +124,8 @@ static int dp_parser_misc(struct dp_parser *parser)
 			parser->max_dp_lanes = cnt;
 		else
 			parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
+
+		parser->max_dp_link_rate = DP_LINK_RATE_HBR2; /* 540000 khz */
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 866c1a8..3ddf639 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -15,6 +15,7 @@
 #define DP_LABEL "MDSS DP DISPLAY"
 #define DP_MAX_PIXEL_CLK_KHZ	675000
 #define DP_MAX_NUM_DP_LANES	4
+#define DP_LINK_RATE_HBR2       540000
 
 enum dp_pm_type {
 	DP_CORE_PM,
@@ -119,6 +120,7 @@ struct dp_parser {
 	struct dp_io io;
 	struct dp_display_data disp_data;
 	u32 max_dp_lanes;
+	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;
 
 	int (*parse)(struct dp_parser *parser);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

