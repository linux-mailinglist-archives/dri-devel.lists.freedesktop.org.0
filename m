Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922C45BB68A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 07:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38F610E2E1;
	Sat, 17 Sep 2022 05:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F23310E52B;
 Fri, 16 Sep 2022 20:11:45 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GG33s1008348;
 Fri, 16 Sep 2022 20:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=yEhxiL9xhufW1uFcqHvps7gpZ1SYtCuD6yFj9S/r3ck=;
 b=Ne72rEBbl+2+hEQMZoA8UtNfjQ3Y8KKOxNfuq12nnhNNA5EDj+AENYa4WflrAyvxcU8q
 4+cUEJVlWBwGDv6Pwbg3W5yMCbPXQpl32cX3WoFwFK6O+a3LavOdGP6eYtLdriyfcdde
 kkuAvJYpnrXnQhzQ61Iq445b8htfMFUbnTHDdk/97b+HHWoFBQMQvY41TTDoM6SBHKu8
 iSd28WhduiycVEyCqL+l+n7KRteC78k3rspuajI2mF8ywi8JRCxCJX+FwCTGvoBg5hwT
 5rsuwYpX4ZcmJN/K8pvsoGeC4DCt7fgg1RPHb77j7w4HPBlSkUIrH9SLl4gb8ts6HvzB gQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jm8xmvyk8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Sep 2022 20:11:41 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28GK0cOY017207
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Sep 2022 20:00:38 GMT
Received: from core-thresher1.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 16 Sep 2022 13:00:37 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 7/7] drm/msm/dp: HPD handling relates to next_bridge
Date: Fri, 16 Sep 2022 13:00:28 -0700
Message-ID: <20220916200028.25009-8-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220916200028.25009-1-quic_bjorande@quicinc.com>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: x9t_qC-s89WkV3QAgqbpLJU3F8bghkJg
X-Proofpoint-ORIG-GUID: x9t_qC-s89WkV3QAgqbpLJU3F8bghkJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_12,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160144
X-Mailman-Approved-At: Sat, 17 Sep 2022 05:33:33 +0000
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The DisplayPort controller's internal HPD interrupt handling is used for
cases where the HPD signal is connected to a GPIO which is pinmuxed into
the DisplayPort controller.

Most of the logic for enabling and disabling the HPD-related interrupts
is conditioned on the presence of an EDP panel, but more generically
designs that has a downstream drm_bridge (next_bridge) could use this to
handle the HPD interrupts, instead of the internal mechanism.

So replace the current is_edp-based guards with a check for the presence
of next_bridge.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3d365950de0f..224ae3aa07c4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -610,7 +610,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	/* enable HDP irq_hpd/replug interrupt */
-	if (!dp->dp_display.is_edp)
+	if (!dp->dp_display.next_bridge)
 		dp_catalog_hpd_config_intr(dp->catalog,
 					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
 					   true);
@@ -653,7 +653,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 			dp->dp_display.connector_type, state);
 
 	/* disable irq_hpd/replug interrupts */
-	if (!dp->dp_display.is_edp)
+	if (!dp->dp_display.next_bridge)
 		dp_catalog_hpd_config_intr(dp->catalog,
 					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
 					   false);
@@ -682,7 +682,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	/* disable HPD plug interrupts */
-	if (!dp->dp_display.is_edp)
+	if (!dp->dp_display.next_bridge)
 		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
 
 	/*
@@ -701,7 +701,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	dp_display_handle_plugged_change(&dp->dp_display, false);
 
 	/* enable HDP plug interrupt to prepare for next plugin */
-	if (!dp->dp_display.is_edp)
+	if (!dp->dp_display.next_bridge)
 		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
@@ -1086,8 +1086,8 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
 	dp_display_host_init(dp);
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
-	/* Enable plug and unplug interrupts only for external DisplayPort */
-	if (!dp->dp_display.is_edp)
+	/* Enable plug and unplug interrupts only if not handled by next_bridge */
+	if (!dp->dp_display.next_bridge)
 		dp_catalog_hpd_config_intr(dp->catalog,
 				DP_DP_HPD_PLUG_INT_MASK |
 				DP_DP_HPD_UNPLUG_INT_MASK,
@@ -1379,8 +1379,7 @@ static int dp_pm_resume(struct device *dev)
 
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
-
-	if (!dp->dp_display.is_edp)
+	if (!dp->dp_display.next_bridge)
 		dp_catalog_hpd_config_intr(dp->catalog,
 				DP_DP_HPD_PLUG_INT_MASK |
 				DP_DP_HPD_UNPLUG_INT_MASK,
-- 
2.17.1

