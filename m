Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8332C7A2881
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 22:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97B010E688;
	Fri, 15 Sep 2023 20:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF0210E681;
 Fri, 15 Sep 2023 20:48:36 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FEV9c2011130; Fri, 15 Sep 2023 20:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Zy5mluxT6yrUoI+hSAeHWvE0fMAoRCVNMZk2k+w9SBE=;
 b=CBMwz4PO/Lk66Zam9ydhMPbIy5fw9OWuzlJ1ujCWJpNqQXm/nOWDnp/dy5xpPEP8BsaC
 WU2hIn2+FN9o1KpZxhj6Ev0q4DJr55FvUMd/41L5k1rpRh4xSjpzkh8M36qPhKSyGs2i
 gAvTUj5wI3ikEpLkOux4c5IUjzxan7so+Fm6yBQUI+LjviSXJUmE8c+FKt9BRBBdphHx
 nfIzg6GesPHb95ZQemQq4Py4LxToY92MhLJhdCDOmjQBjMovaNcUiv51TT0qEe/A+uYt
 Z06AbHNQiTUd3ZN1doByqd1+0ViC/coMtp0M/0GePDd3QkuHVcbdr4ROThpGXYR+BVmY Kg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g86t3sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 20:48:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FKmUWT016913
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 20:48:30 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 13:48:29 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v2 3/7] drm/msm/dp: use drm_bridge_hpd_notify() to report HPD
 status changes
Date: Fri, 15 Sep 2023 13:48:04 -0700
Message-ID: <1694810888-24461-4-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694810888-24461-1-git-send-email-quic_khsieh@quicinc.com>
References: <1694810888-24461-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: shg_3opFbqDJsEng5DSgvMfMBxFRY7bR
X-Proofpoint-ORIG-GUID: shg_3opFbqDJsEng5DSgvMfMBxFRY7bR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_17,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150186
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
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently DP driver use drm_helper_hpd_irq_event(), bypassing drm bridge
framework, to report HPD status changes to user space frame work.
Replace it with drm_bridge_hpd_notify() since DP driver is part of drm
bridge.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 18d16c7..59f9d85 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -356,26 +356,10 @@ static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
 		(dp->link->sink_count == 0);
 }
 
-static void dp_display_send_hpd_event(struct msm_dp *dp_display)
-{
-	struct dp_display_private *dp;
-	struct drm_connector *connector;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-
-	connector = dp->dp_display.connector;
-	drm_helper_hpd_irq_event(connector->dev);
-}
-
 static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 					    bool hpd)
 {
-	if ((hpd && dp->dp_display.link_ready) ||
-			(!hpd && !dp->dp_display.link_ready)) {
-		drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
-				(hpd ? "on" : "off"));
-		return 0;
-	}
+	struct drm_bridge *bridge = dp->dp_display.bridge;
 
 	/* reset video pattern flag on disconnect */
 	if (!hpd)
@@ -385,7 +369,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->dp_display.connector_type, hpd);
-	dp_display_send_hpd_event(&dp->dp_display);
+	drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
 
 	return 0;
 }
-- 
2.7.4

