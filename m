Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E9642F3F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8462810E288;
	Mon,  5 Dec 2022 17:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157BC10E272;
 Mon,  5 Dec 2022 17:44:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B5EIQ1c002334; Mon, 5 Dec 2022 17:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=V0dgC8RMGw1K5x2aNlwAq9/fzXS/Jp29/BK4r0fBNPY=;
 b=n8gnK6pUhmP0v0Xk9ebcO0+60dC5yJ4y9Nzq7+zDF5XoFrmEi+eTJ7OjWNwwTO4aVuDi
 WVB4/jLcfRlVwUL3t8VOlszPfVpiq8+IowaPEaegOCtdQVXx9exr+m7FM8+1+vf982SM
 6b8mHwKWLDyIeZYaq1TXNtxgqbAwe3m+m/69l+agVCDs0+A654w5oQMLltWsLbgUDS8a
 X9PZvkv4/snldUHxmdGbTr4tSHm5IncCMrRpn4kbCx2zwc9j2i6Rck3NSc86Bn9u4ffX
 fulhmq5a1gwvNVfhnQis/XB4pr7lsg4aVo33xCIl8JuCRUq16gFXAscU/wbH9ONWeEu/ yQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7v5md2ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 17:44:46 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B5HijEW006235
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Dec 2022 17:44:45 GMT
Received: from th-lint-050.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 5 Dec 2022 09:44:45 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 10/13] drm/msm/dp: Rely on hpd_enable/disable callbacks
Date: Mon, 5 Dec 2022 09:44:30 -0800
Message-ID: <20221205174433.16847-11-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205174433.16847-1-quic_bjorande@quicinc.com>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: UTG2bMH6GeNSSaXVCy6TvQ9V8SZ6blKD
X-Proofpoint-GUID: UTG2bMH6GeNSSaXVCy6TvQ9V8SZ6blKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=954 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050146
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The DisplayPort controller's internal HPD interrupt handling is used for
cases where the HPD signal is connected to a GPIO which is pinmuxed into
the DisplayPort controller. In other configurations the HPD notification
might be delivered by the DRM framework from an associated bridge.

This difference is not appropriately represented by the "is_edp"
boolean, but is properly represented by the frameworks invocation of the
hpd_enable() and hpd_disable() callbacks. Switch the current condition
to rely on these callbacks instead.

This ensures appropriate handling of the three cases; no bridge
connected, a bridge without DRM_BRIDGE_OP_HPD and a bridge with
DRM_BRIDGE_OP_HPD.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---

Worth mentioning, I did look into moving the HPD enablement/disablement
completely into these new callbacks, but that affect the entire power
management model of the driver, so I think it's worth to tackle that in
subsequent changes. It seems also reasonable to expect that we by such
modifications could leave the block unclocked until the external HPD
notification arrives...

Changes since v3:
- Introduced reliance on hpd_enable/disable callbacks instead of next_bridge

 drivers/gpu/drm/msm/dp/dp_display.c | 35 ++++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 4 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bb92c33beff8..3e464c33ff11 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -610,7 +610,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	/* enable HDP irq_hpd/replug interrupt */
-	if (!dp->dp_display.is_edp)
+	if (dp->dp_display.internal_hpd)
 		dp_catalog_hpd_config_intr(dp->catalog,
 					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
 					   true);
@@ -653,7 +653,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 			dp->dp_display.connector_type, state);
 
 	/* disable irq_hpd/replug interrupts */
-	if (!dp->dp_display.is_edp)
+	if (dp->dp_display.internal_hpd)
 		dp_catalog_hpd_config_intr(dp->catalog,
 					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
 					   false);
@@ -682,7 +682,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	/* disable HPD plug interrupts */
-	if (!dp->dp_display.is_edp)
+	if (dp->dp_display.internal_hpd)
 		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
 
 	/*
@@ -701,7 +701,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	dp_display_handle_plugged_change(&dp->dp_display, false);
 
 	/* enable HDP plug interrupt to prepare for next plugin */
-	if (!dp->dp_display.is_edp)
+	if (dp->dp_display.internal_hpd)
 		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
@@ -1086,8 +1086,8 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
 	dp_display_host_init(dp);
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
-	/* Enable plug and unplug interrupts only for external DisplayPort */
-	if (!dp->dp_display.is_edp)
+	/* Enable plug and unplug interrupts only if requested */
+	if (dp->dp_display.internal_hpd)
 		dp_catalog_hpd_config_intr(dp->catalog,
 				DP_DP_HPD_PLUG_INT_MASK |
 				DP_DP_HPD_UNPLUG_INT_MASK,
@@ -1379,8 +1379,7 @@ static int dp_pm_resume(struct device *dev)
 
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
-
-	if (!dp->dp_display.is_edp)
+	if (dp->dp_display.internal_hpd)
 		dp_catalog_hpd_config_intr(dp->catalog,
 				DP_DP_HPD_PLUG_INT_MASK |
 				DP_DP_HPD_UNPLUG_INT_MASK,
@@ -1778,6 +1777,22 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
 }
 
+void dp_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+
+	dp_display->internal_hpd = true;
+}
+
+void dp_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+
+	dp_display->internal_hpd = false;
+}
+
 void dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			  enum drm_connector_status status)
 {
@@ -1785,8 +1800,8 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct msm_dp *dp_display = dp_bridge->dp_display;
 	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	/* Without next_bridge interrupts are handled by the DP core directly */
-	if (!dp_display->next_bridge)
+	/* Plug events are generated by the dp_display_irq_handler() */
+	if (dp_display->internal_hpd)
 		return;
 
 	if (!dp->core_initialized) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index dcedf021f7fe..371337d0fae2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -21,6 +21,7 @@ struct msm_dp {
 	bool power_on;
 	unsigned int connector_type;
 	bool is_edp;
+	bool internal_hpd;
 
 	hdmi_codec_plugged_cb plugged_cb;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 3898366ebd5e..275370f21115 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -102,6 +102,8 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.get_modes    = dp_bridge_get_modes,
 	.detect       = dp_bridge_detect,
 	.atomic_check = dp_bridge_atomic_check,
+	.hpd_enable   = dp_bridge_hpd_enable,
+	.hpd_disable  = dp_bridge_hpd_disable,
 	.hpd_notify   = dp_bridge_hpd_notify,
 };
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 79e6b2cf2d25..250f7c66201f 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -32,6 +32,8 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 			const struct drm_display_mode *mode,
 			const struct drm_display_mode *adjusted_mode);
+void dp_bridge_hpd_enable(struct drm_bridge *bridge);
+void dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			  enum drm_connector_status status);
 
-- 
2.37.3

