Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE96FE523
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 22:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8728210E51C;
	Wed, 10 May 2023 20:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA46910E51A;
 Wed, 10 May 2023 20:32:04 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AKRTbY005331; Wed, 10 May 2023 20:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=0pyAYYii88PNocNO2ga6rvzdS7SSDdvLuzat7AJ/Eoo=;
 b=gHrBE/DjWZ159+Pa7hwpFDVUEoZqnAYO+Tvo6uIp9+E2C3wUt3r6DK3/ymPPJytGuhCk
 YO5J7Eijl1CEFVs6a3TKYleeRp1usCjrbyLA/3wJAb1u06XYDRv/xrTbqT4wyH62tJqq
 pmKcqAtif+HsQd4j/OqjORUfKJAPiikGht39fSOj49X0KG0XjY/sKwsSv4quOPd3s5f8
 vwBt7Spah2UckW+HVc1u9gFD2K2SbPiUendgWMYPOEwExVbqDegXzRbMsCkxeSGfDRyF
 577e+WMvyB43ZFACAIT+iKN8QGAz18YOrx7X6mKm/Jb7c30QlhJVwSIDuCT9/BOQKwJY Rw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgdd9rpe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 20:31:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AKVMZB010765
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 20:31:22 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 10 May 2023 13:31:21 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 2/2] drm/msm/dp: add mutex to protect internal_hpd against
 race condition between different threads
Date: Wed, 10 May 2023 13:31:05 -0700
Message-ID: <1683750665-8764-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hgXO2gphRERLgHvcLi_l65kXXkJENZr_
X-Proofpoint-ORIG-GUID: hgXO2gphRERLgHvcLi_l65kXXkJENZr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100167
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

Intrenal_hpd is referenced by event thread but set by drm bridge callback
context. Add mutex to protect internal_hpd to avoid conflicts between
threads.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 71aa944..b59ea7a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1792,11 +1792,13 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
+	mutex_lock(&dp->event_mutex);
 	dp_display->internal_hpd = true;
 	dp_catalog_hpd_config_intr(dp->catalog,
 				DP_DP_HPD_PLUG_INT_MASK |
 				DP_DP_HPD_UNPLUG_INT_MASK,
 				true);
+	mutex_unlock(&dp->event_mutex);
 }
 
 void dp_bridge_hpd_disable(struct drm_bridge *bridge)
@@ -1807,11 +1809,13 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
+	mutex_lock(&dp->event_mutex);
 	dp_catalog_hpd_config_intr(dp->catalog,
 				DP_DP_HPD_PLUG_INT_MASK |
 				DP_DP_HPD_UNPLUG_INT_MASK,
 				false);
 	dp_display->internal_hpd = false;
+	mutex_unlock(&dp->event_mutex);
 }
 
 void dp_bridge_hpd_notify(struct drm_bridge *bridge,
@@ -1822,8 +1826,12 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
 
 	/* Without next_bridge interrupts are handled by the DP core directly */
-	if (dp_display->internal_hpd)
+	mutex_lock(&dp->event_mutex);
+	if (dp_display->internal_hpd) {
+		mutex_unlock(&dp->event_mutex);
 		return;
+	}
+	mutex_unlock(&dp->event_mutex);
 
 	if (!dp->core_initialized) {
 		drm_dbg_dp(dp->drm_dev, "not initialized\n");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

