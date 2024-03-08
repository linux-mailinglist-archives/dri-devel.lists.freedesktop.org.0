Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0319876C7C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 22:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E276110F6A0;
	Fri,  8 Mar 2024 21:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kh40VIxG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6907410F683;
 Fri,  8 Mar 2024 21:45:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 428LhYQR022570; Fri, 8 Mar 2024 21:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=ElXz0zL
 FBfK+NFE/x2AB4YD/fo4TcWOv2w2crSWLIPA=; b=kh40VIxG+wfkj+Pnzgfs5rm
 1LkvtFb/Z6X1K/h+D86e1sdx/IzHQDSUT+1HLvWdwB85SKifrIarA9bLl9tjX1Ta
 l94QwlqCkfZb0PbhEgWtILuTunCEIXqwf8Mi1wmHSd/inRWwaZ0dybeiej+Oxwu/
 vPeeQAfItj5wQWNNpbIsRRAGoeN3JM2sLVqcwQJIixrimo1bDMMSQc0kULEJMlVh
 Fq2dEfDBPGcp3fbGUIEXTLX9P8g/iJPFH4wYfcZUkyR9n+lGKX8NBMiD3I/uSg75
 1wUBOU6ceWSLDD/9xz/+L39uUQv8pJ/d5N1un6Z72EEcWZqVDvpj23t/9467Jvg=
 =
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wr7dp0h3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Mar 2024 21:45:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 428LjfNB012025
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Mar 2024 21:45:41 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Mar 2024 13:45:40 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>
CC: <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_parellan@quicinc.com>,
 <johan@kernel.org>, <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/dp: move link_ready out of HPD event thread
Date: Fri, 8 Mar 2024 13:45:32 -0800
Message-ID: <20240308214532.1404038-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HIDzW2aHwYrro6-NY9LdusAP-dJvRFX0
X-Proofpoint-ORIG-GUID: HIDzW2aHwYrro6-NY9LdusAP-dJvRFX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080172
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

There are cases where the userspace might still send another
frame after the HPD disconnect causing a modeset cycle after
a disconnect. This messes the internal state machine of MSM DP driver
and can lead to a crash as there can be an imbalance between
bridge_disable() and bridge_enable().

This was also previously reported on [1] for which [2] was posted
and helped resolve the issue by rejecting commits if the DP is not
in connected state.

The change resolved the bug but there can also be another race condition.
If hpd_event_thread does not pick up the EV_USER_NOTIFICATION and process it
link_ready will also not be set to false allowing the frame to sneak in.

Lets move setting link_ready outside of hpd_event_thread() processing to
eliminate a window of race condition.

[1] : https://gitlab.freedesktop.org/drm/msm/-/issues/17
[2] : https://lore.kernel.org/all/1664408211-25314-1-git-send-email-quic_khsieh@quicinc.com/

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 068d44eeaa07..e00092904ccc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -345,8 +345,6 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 							 dp->panel->downstream_ports);
 	}
 
-	dp->dp_display.link_ready = hpd;
-
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->dp_display.connector_type, hpd);
 	drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
@@ -399,6 +397,8 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 		goto end;
 	}
 
+	dp->dp_display.link_ready = true;
+
 	dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
 end:
@@ -466,6 +466,8 @@ static int dp_display_notify_disconnect(struct device *dev)
 {
 	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
+	dp->dp_display.link_ready = false;
+
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
 	return 0;
@@ -487,6 +489,7 @@ static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
+			dp->dp_display.link_ready = false;
 			dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 		}
 	} else {
-- 
2.34.1

