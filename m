Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB53890A94
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 21:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE49510E96C;
	Thu, 28 Mar 2024 20:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jgCdO+Cx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C0510F841;
 Thu, 28 Mar 2024 20:04:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42SJTMTU018793; Thu, 28 Mar 2024 20:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type; s=qcppdkim1; bh=IbMG52PyEZiDd9+bBXaA
 MVtqJGuaTM0lgaacSJ3zYzE=; b=jgCdO+CxvD7VcrEDNDkdxguYIE1Pmtz3i8Ls
 cIjKoudEmf20arorYeEzkrzFGJRYRK1W1RrkBFILZtoH1JmI92IcOQIJszHdJ6Ou
 ob6B3XYNt+00c41M8cBodQqABMcXExlEo9mVleUpqjiABVCZ7ug+2H99QOBrBAhR
 SgY4RbDv6ulURXWvHPmHXXO/rvWUlBFZTVkoCVB/HpW46Io0nw2jxpCxT3DMYHpD
 1PfHWOClA2eEaJ4Wmzvc0twLWNvhHizGBUwW69DaxmuNU6pNVRc+nYFoQs0F+vMf
 kVR0VmypwFk1OKFMtbYuWOewqO6RTB/L/AJBxwUic/jCg7MTxQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5csggdc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Mar 2024 20:04:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42SK4Med012485
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Mar 2024 20:04:22 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 13:04:21 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <abel.vesa@linaro.org>, <andersson@kernel.org>
CC: Kuogee Hsieh <quic_khsieh@quicinc.com>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
 <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] drm/msm/dp: use dp_hpd_plug_handle() and
 dp_hpd_unplug_handle() directly
Date: Thu, 28 Mar 2024 13:04:06 -0700
Message-ID: <1711656246-3483-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
References: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8HXXakpgLQ0YPBDYMXdjH4dtDjuf8YT_
X-Proofpoint-ORIG-GUID: 8HXXakpgLQ0YPBDYMXdjH4dtDjuf8YT_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_17,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=958 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280142
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

For internal HPD case, hpd_event_thread is created to handle HPD
interrupts generated by HPD block of DP controller. It converts
HPD interrupts into events and executed them under hpd_event_thread
context. For external HPD case, HPD events is delivered by way of
dp_bridge_hpd_notify() under thread context. Since they are executed
under thread context already, there is no reason to hand over those
events to hpd_event_thread. Hence dp_hpd_plug_handle() and
dp_hpd_unplug_hanlde() are called directly at dp_bridge_hpd_notify().

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 94dd60f..0476ad9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1706,7 +1706,8 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	status &= ~0x80000000;
 
 	if (!dp_display->link_ready && status == connector_status_connected)
-		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		dp_hpd_plug_handle(dp, 0);
 	else if (dp_display->link_ready && status == connector_status_disconnected)
-		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		dp_hpd_unplug_handle(dp, 0);
+
 }
-- 
2.7.4

