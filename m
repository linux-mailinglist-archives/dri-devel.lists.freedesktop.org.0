Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDFF643184
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 20:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8C910E282;
	Mon,  5 Dec 2022 19:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D7010E138;
 Mon,  5 Dec 2022 19:14:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B5Fu1Ec007124; Mon, 5 Dec 2022 19:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=pSnnyqswrXqnqsVTp7FpeVnzPD1GrBLVmOoY+g5lPnw=;
 b=LIu5EVss5+CH64BvbEipbslRyLBFreKgM8umea9GxMz0AZcdi+lvaugO+BSJJ69SXGwL
 cFWaxCLKKvDVg+MzpJA/ErHGePlThFxiHieHDgHv8Pcdwc0qvV6GdSnoX0hEKeewnULO
 9gDR/w1fdmIhuxz8oPcFAbBnvxzn5546YiGB+ED4zFlRbxaNoP99ovU7zD+hW4QC/3kb
 buQd4V7fyvEaF4HoB5cBo3rZokdaqK1SrxHwwfdP8QFG9YMu9SJYVWSNxrnBnOYtsYJ5
 LmvCr/6eiAm1uVZJJoD2hs2QHJm1BnaUA+UTD18dbH5IAujsv0IRMhHIyj8tBRcLZGZX 8A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7wdxw4ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 19:14:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B5JEneE026680
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Dec 2022 19:14:49 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 5 Dec 2022 11:14:49 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <andersson@kernel.org>, <konrad.dybcio@somainline.org>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <devicetree@vger.kernel.org>, <airlied@gmail.com>
Subject: [PATCH v8 5/5] drm/msm/dp: add support of max dp link rate
Date: Mon, 5 Dec 2022 11:14:30 -0800
Message-ID: <1670267670-15832-6-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1670267670-15832-1-git-send-email-quic_khsieh@quicinc.com>
References: <1670267670-15832-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: J-zb-Hko24k3jgXoAYSZp2PjllJgHUkO
X-Proofpoint-ORIG-GUID: J-zb-Hko24k3jgXoAYSZp2PjllJgHUkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050160
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

By default, HBR2 (5.4G) is the max link link be supported. This patch add
the capability to support max link rate at HBR3 (8.1G).

Changes in v2:
-- add max link rate from dtsi

Changes in v3:
-- parser max_data_lanes and max_dp_link_rate from dp_out endpoint

Changes in v4:
-- delete unnecessary pr_err

Changes in v5:
-- split parser function into different patch

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 7 ++++---
 drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bfd0aef..edee550 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -390,6 +390,10 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	struct edid *edid;
 
 	dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
+	dp->panel->max_dp_link_rate = dp->parser->max_dp_link_rate;
+
+	drm_dbg_dp(dp->drm_dev, "max_lanes=%d max_link_rate=%d\n",
+		dp->panel->max_dp_lanes, dp->panel->max_dp_link_rate);
 
 	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
 	if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 5149ceb..933fa9c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -75,12 +75,13 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 	link_info->rate = drm_dp_bw_code_to_link_rate(dpcd[DP_MAX_LINK_RATE]);
 	link_info->num_lanes = dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
 
+	/* Limit data lanes from data-lanes of endpoint properity of dtsi */
 	if (link_info->num_lanes > dp_panel->max_dp_lanes)
 		link_info->num_lanes = dp_panel->max_dp_lanes;
 
-	/* Limit support upto HBR2 until HBR3 support is added */
-	if (link_info->rate >= (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
-		link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
+	/* Limit link rate from link-frequencies of endpoint properity of dtsi */
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
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

