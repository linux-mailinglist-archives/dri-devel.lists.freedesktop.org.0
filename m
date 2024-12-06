Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07449E6590
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7A010E5FE;
	Fri,  6 Dec 2024 04:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JxaaW32a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5EC10E5FA;
 Fri,  6 Dec 2024 04:33:08 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B62Rk1Y003146;
 Fri, 6 Dec 2024 04:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XNPXMP9MmjCBcj3p8H4MNMf+ITI3zxyTnyQT2oNSMa0=; b=JxaaW32aoagxeHrY
 wo7Y5Tz/NVZX1ExHkY9SKf4oaS9L89WVA0k2ygbtLMj+GMmAcbGh+/rv8JsOZ7fF
 LS/dg9pZFpqU81TOx9WYA/Huc/oEcf0qbJ1GoeLqS/rTFmRvxSnQbY4MGtS+oua3
 PFyOiAKRO4bn+XCJHSslonfcQ9E3GLBy9plspuKOw7Oi0WMXZURSHUk5fq0tC1UM
 biS9fe2a545PcGloAwYPkbM3xSu9+I0gkqJf5AhGCCXOnwCMI/Hw8dxlF8WCJOvb
 DD1DDkTuloX/pNQ1jASIdn0xZh33UTIxN22E+UJCO9VnwReHZOlS35+bdKcxp52Q
 2ebdvw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43brgp08yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64Wbed007175
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:37 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:36 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:53 -0800
Subject: [PATCH 22/45] drm/msm/dp: add support to send vcpf packets in dp
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-22-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=7993;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=fnivWqGeBgtWg1snTV42ux3QssThpun7m29zCoiIMtg=;
 b=yBDh1K68DEVntHy27zVwge5PzfPpXkhm3yNMueEPhtJVXtqEQIKNoF5SdDPvf4IjjLSExfQ05
 H9WLhi69U3qA/LDyei8Dkf3uoCdywbJynVfyAA7vH7qbsgqLsg7naHI
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: l_vGSTWasaQRIKPNoV9XCmaxqG-FLaLg
X-Proofpoint-ORIG-GUID: l_vGSTWasaQRIKPNoV9XCmaxqG-FLaLg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030
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

VC payload fill sequence is inserted by the DP controller in the
absence of stream symbols that is before stream is disabled. Add
support to send the VCPF sequence for msm dp controller.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 25 +++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  4 ++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 40 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c |  5 ++++-
 drivers/gpu/drm/msm/dp/dp_reg.h     |  3 ++-
 6 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index f9d21444d7891bcd043d282b31ae75711add4817..4826a698979ce7c37112812299879411c5743fa9 100644
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
@@ -694,9 +699,12 @@ void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
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
 
@@ -850,6 +858,23 @@ int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
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
index 560016e2f929d4b92d6ea764d81a099c09c0e668..323858c587f85996d296156c7b8b201cdb7b7eb4 100644
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
 
@@ -103,6 +106,7 @@ u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog);
 u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog);
 int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
+int msm_dp_catalog_ctrl_get_interrupt_5(struct msm_dp_catalog *msm_dp_catalog);
 u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_update_transfer_unit(struct msm_dp_catalog *msm_dp_catalog,
 				u32 msm_dp_tu, u32 valid_boundary,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 14562def1e70b769434243d1ce72661a7b4d4c6b..2288c379283c721a01c81302f8d307d0b3c76527 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -27,6 +27,11 @@
 
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
+#define DP_CTRL_INTR_DP0_VCPF_SENT       BIT(0)
+#define DP_CTRL_INTR_DP1_VCPF_SENT       BIT(3)
+
+#define MST_DP0_PUSH_VCPF		BIT(12)
+#define MST_DP1_PUSH_VCPF		BIT(14)
 
 #define MR_LINK_TRAINING1  0x8
 #define MR_LINK_SYMBOL_ERM 0x80
@@ -144,6 +149,34 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
+{
+	u32 state = 0x0;
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (msm_dp_panel->stream_id >= DP_STREAM_MAX) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	if (msm_dp_panel->stream_id == DP_STREAM_0)
+		state |= MST_DP0_PUSH_VCPF;
+	else
+		state |= MST_DP1_PUSH_VCPF;
+
+	reinit_completion(&ctrl->idle_comp);
+
+	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, state);
+
+	if (!wait_for_completion_timeout(&ctrl->idle_comp,
+					 IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
+		pr_warn("PUSH_VCPF pattern timedout\n");
+
+	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
+}
+
 static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl,
 				    struct msm_dp_panel *msm_dp_panel)
 {
@@ -2332,6 +2365,13 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
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
index b126651da24b3abdaf540268758b37dca9fe1291..9ad7022d6217572395d69294c3cc4d4dbaddf0ac 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -52,5 +52,6 @@ void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl,
 void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
 				      enum msm_dp_stream_id strm,
 				      u32 start_slot, u32 tot_slots);
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2a4a79317153817cb24537ea95fad07c9bc20715..1dfc82211c50bb4ed239f9730b91c33c4897c78f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1646,7 +1646,10 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT)
+		msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
+	else
+		msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 
 	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT) {
 		msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 8bc2a431462fc1fb45b1fe8e43a0a0ec7f75e5b1..c7532217b369c6235b2fe5fe9c86642d5c2712cb 100644
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

-- 
2.34.1

