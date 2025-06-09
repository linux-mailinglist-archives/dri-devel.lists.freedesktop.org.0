Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A56AD1D51
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B4D10E254;
	Mon,  9 Jun 2025 12:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BWU/Aeo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1888F10E2B6;
 Mon,  9 Jun 2025 12:24:09 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599gUZw021017;
 Mon, 9 Jun 2025 12:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5z8JJEwt5KcNnMWIQHsJIExfX6A7mz0lNI/ZfAi9YOg=; b=BWU/Aeo/ugjZQcAp
 IvCypG+lfpd2FxS3TnAfGIcWF9So6nkC2iIxDgmQXKPIYzPRhxzd3Z7iXucjApoP
 yQyHZMr0QpIHkaWLgdC+del/ev4y5I64XKwgaJ/4I6J8CamPQ+TPVPUqi0SsTXzh
 ts5Wn6XWPvOI43qfUxp7PJaT4fLoLLRHsGzr4LoOzTQ2ob9eQyM+nGpK1Tye5Y3F
 XIXgM+G+x4VJrdMHvslgZdCRN7Y75KPGAWLiXjeui/jm9scRoHe5zTZj/SxbHI9M
 imOo2sMQ+JZohcks/mUAHRQHn13Uy38iPWOhzs1dUiw79bWNSAEfdGS82em9LOtX
 gxRyow==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpnprc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CO1sS000458
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:24:01 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:23:58 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:38 +0800
Subject: [PATCH v2 19/38] drm/msm/dp: add support to send vcpf packets in
 dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-19-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Yongxing Mou" <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471757; l=11635;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=0A2rAOV/pltOBZNHtp/a6QV9FUQg4xSjGPGw9B3yUus=;
 b=2/T43tNy3peKWSiTAhlhHx0NZwuzM+sOTMexBJHB1cmMGysiqQF0zcPtK9yeaTCfFtA0/dBH+
 cQyp05+GEdhCPq98O9fVThyJal5crsNtOfEDsJgaOY2ZI2BwJXcxyrx
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6846d262 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=3HjsJo6jA7tACSqMOxUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfXztfSFk4Ou85r
 32tsio3rk0YAQ4cUiXh92zSHxJ0r/eRUfi1KxCxrwvB0LwiL0ucUMe3zp3sfltxHdprUp7Z6Sb/
 oUhUjN/aZbR5LWj8eQC0Ja+KAxzXHgrg/XHmurjm6YB21r8DRRrV0IWyA2QzD4I0Od3MN+k/tRh
 0Ym8uWBDqZoYrxLbnPctsuy0WqRsouOVgG1PtV85Jd9YyksJolEQxT9GY5z+UK5cM9uv7Ln4Fz9
 +ATa+rHe2HFZ0GdEcxyi6CfSrb+/uefwGaZxAsxC1+/359F3ZkaXsMe/ffx0PBoNDcRI5UPoeH3
 Wcjh1SAvSmvWmRFvMhdZb6h7tMj9BWebkJtmeDbVvaAzmgHEVseJQu0o1uV1u/IH+3MW/GTU6xh
 9+1YPnXqJ/Wbp+PJ7e1D6cMUD/iPD8FxyU6NmmVlr5pkt1CkQ/Foy0JBjU2aJcTWVok8fRps
X-Proofpoint-GUID: 3VGvNLqVyyN-ZtBo4394SkpLUJEUJ_NE
X-Proofpoint-ORIG-GUID: 3VGvNLqVyyN-ZtBo4394SkpLUJEUJ_NE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

VC payload fill sequence is inserted by the DP controller in the
absence of stream symbols that is before stream is disabled. Add
support to send the VCPF sequence for msm dp controller.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 38 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_catalog.h | 10 ++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 46 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c |  5 +++-
 drivers/gpu/drm/msm/dp/dp_reg.h     |  4 +++-
 6 files changed, 96 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index baa3a93a9bb3109c3110503e4d1dc1f6e3cdc2f8..f2a5170723585ed6ddab2c12d2e5c5d6dee5eff5 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -50,6 +50,11 @@
 	(PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
 	PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
 
+#define DP_INTERRUPT_STATUS5 \
+	(DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)
+#define DP_INTERRUPT_STATUS5_MASK \
+	(DP_INTERRUPT_STATUS5 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
 #define DP_INTERRUPT_MASK4 \
 	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
 	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
@@ -355,6 +360,15 @@ void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 s
 	msm_dp_write_link(catalog, REG_DP_STATE_CTRL, state);
 }
 
+void msm_dp_catalog_ctrl_mst_state_ctrl(struct msm_dp_catalog *msm_dp_catalog,
+					enum msm_dp_stream_id stream_id, u32 state)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+
+	msm_dp_write_mst_link(catalog, stream_id, REG_DP_MST_LINK_STATE_CTRL, state);
+}
+
 void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog,
 				     enum msm_dp_stream_id stream_id, u32 cfg)
 {
@@ -682,9 +696,12 @@ void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
 				DP_INTERRUPT_STATUS1_MASK);
 		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
 				DP_INTERRUPT_STATUS2_MASK);
+		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS5,
+				 DP_INTERRUPT_STATUS5_MASK);
 	} else {
 		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS, 0x00);
 		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2, 0x00);
+		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS5, 0x00);
 	}
 }
 
@@ -808,7 +825,7 @@ u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog)
 	return isr & (mask | ~DP_DP_HPD_INT_MASK);
 }
 
-u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog)
+u32 msm_dp_catalog_ctrl_get_interrupt_4(struct msm_dp_catalog *msm_dp_catalog)
 {
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
@@ -822,7 +839,7 @@ u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_
 	return intr;
 }
 
-int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
+int msm_dp_catalog_ctrl_get_interrupt_2(struct msm_dp_catalog *msm_dp_catalog)
 {
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
@@ -838,6 +855,23 @@ int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
 	return intr;
 }
 
+int msm_dp_catalog_ctrl_get_interrupt_5(struct msm_dp_catalog *msm_dp_catalog)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+							      struct msm_dp_catalog_private,
+							      msm_dp_catalog);
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(catalog, REG_DP_INTR_STATUS5);
+	intr &= ~DP_INTERRUPT_STATUS5_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS5)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS5,
+			 intr_ack | DP_INTERRUPT_STATUS5_MASK);
+
+	return intr;
+}
+
 void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 8d3887e00cfd4e62aacf51795fb54aef071e34ee..a1ecab2f386f321ea9d176b3cf3f894a230c9085 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -28,6 +28,9 @@
 #define DP_INTR_FRAME_END		BIT(6)
 #define DP_INTR_CRC_UPDATED		BIT(9)
 
+#define DP_INTR_DP0_VCPF_SENT		BIT(0)
+#define DP_INTR_DP1_VCPF_SENT		BIT(3)
+
 #define DP_HW_VERSION_1_0	0x10000000
 #define DP_HW_VERSION_1_2	0x10020000
 
@@ -63,6 +66,8 @@ u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Controller APIs */
 void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 state);
+void msm_dp_catalog_ctrl_mst_state_ctrl(struct msm_dp_catalog *msm_dp_catalog,
+					enum msm_dp_stream_id stream_id, u32 state);
 void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog,
 				     enum msm_dp_stream_id stream_id, u32 config);
 void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog);
@@ -88,8 +93,9 @@ void msm_dp_catalog_ctrl_set_psr(struct msm_dp_catalog *msm_dp_catalog, bool ent
 u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog);
 u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog);
-int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
-u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
+int msm_dp_catalog_ctrl_get_interrupt_2(struct msm_dp_catalog *msm_dp_catalog);
+int msm_dp_catalog_ctrl_get_interrupt_5(struct msm_dp_catalog *msm_dp_catalog);
+u32 msm_dp_catalog_ctrl_get_interrupt_4(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_update_transfer_unit(struct msm_dp_catalog *msm_dp_catalog,
 				u32 msm_dp_tu, u32 valid_boundary,
 				u32 valid_boundary2);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 5c3bfc39ebeaee1cd88f9cd9ced80b92fba21669..a61514d4b5d42cd92eb13aa7d6759cdc9c0dda71 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -28,6 +28,12 @@
 
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
+#define DP_CTRL_INTR_DP0_VCPF_SENT       BIT(0)
+#define DP_CTRL_INTR_DP1_VCPF_SENT       BIT(3)
+
+#define MST_DP0_PUSH_VCPF		BIT(12)
+#define MST_DP1_PUSH_VCPF		BIT(14)
+#define MST_LINK_PUSH_VCPF		BIT(12)
 
 #define MR_LINK_TRAINING1  0x8
 #define MR_LINK_SYMBOL_ERM 0x80
@@ -143,6 +149,35 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	enum msm_dp_stream_id stream_id = msm_dp_panel->stream_id;
+	u32 state = 0x0;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (msm_dp_panel->stream_id == DP_STREAM_0)
+		state |= MST_DP0_PUSH_VCPF;
+	else if (msm_dp_panel->stream_id == DP_STREAM_1)
+		state |= MST_DP1_PUSH_VCPF;
+	else
+		state |= MST_LINK_PUSH_VCPF;
+
+	reinit_completion(&ctrl->idle_comp);
+
+	if (stream_id > DP_STREAM_1)
+		msm_dp_catalog_ctrl_mst_state_ctrl(ctrl->catalog, stream_id, state);
+	else
+		msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, state);
+
+	if (!wait_for_completion_timeout(&ctrl->idle_comp,
+					 IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
+		pr_warn("PUSH_VCPF pattern timedout\n");
+
+	drm_dbg_dp(ctrl->drm_dev, "dp ctrl push vcpf\n");
+}
+
 static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl,
 				    struct msm_dp_panel *msm_dp_panel)
 {
@@ -2337,7 +2372,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	if (ctrl->panel->psr_cap.version) {
-		isr = msm_dp_catalog_ctrl_read_psr_interrupt_status(ctrl->catalog);
+		isr = msm_dp_catalog_ctrl_get_interrupt_4(ctrl->catalog);
 
 		if (isr)
 			complete(&ctrl->psr_op_comp);
@@ -2352,7 +2387,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 			drm_dbg_dp(ctrl->drm_dev, "PSR frame capture done\n");
 	}
 
-	isr = msm_dp_catalog_ctrl_get_interrupt(ctrl->catalog);
+	isr = msm_dp_catalog_ctrl_get_interrupt_2(ctrl->catalog);
 
 
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
@@ -2367,6 +2402,13 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 		ret = IRQ_HANDLED;
 	}
 
+	isr = msm_dp_catalog_ctrl_get_interrupt_5(ctrl->catalog);
+	if (isr & (DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)) {
+		drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
+		complete(&ctrl->idle_comp);
+		ret = IRQ_HANDLED;
+	}
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 074efc0cc80bcc19d8beba8c831c6ed16ab9eb9a..98d779599be7d04e1c8a7f8b473a3496a119a9c1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -51,5 +51,6 @@ void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl,
 void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
 				      enum msm_dp_stream_id strm,
 				      u32 start_slot, u32 tot_slots);
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 47475e4c76d5d701890b8ace0b63685fd4466c94..754e6e1fedf2c116911e85e4cdac1110e88b2056 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1633,7 +1633,10 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	if (msm_dp_display->mst_supported)
+		msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
+	else
+		msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 
 	if (msm_dp_display->mst_supported) {
 		msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 16182c7298eb351fd261391498e031d6213e96df..9d15f3fc26a28fba1ae960bff67bd9976f664eaa 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -24,8 +24,9 @@
 #define REG_DP_INTR_STATUS			(0x00000020)
 #define REG_DP_INTR_STATUS2			(0x00000024)
 #define REG_DP_INTR_STATUS3			(0x00000028)
-
 #define REG_DP_INTR_STATUS4			(0x0000002C)
+#define REG_DP_INTR_STATUS5			(0x00000034)
+
 #define PSR_UPDATE_INT				(0x00000001)
 #define PSR_CAPTURE_INT				(0x00000004)
 #define PSR_EXIT_INT				(0x00000010)
@@ -112,6 +113,7 @@
 #define DP_MAINLINK_CTRL_MST_EN			(0x04000100)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
+#define REG_DP_MST_LINK_STATE_CTRL		(0x00000000)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN2	(0x00000002)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN3	(0x00000004)

-- 
2.34.1

