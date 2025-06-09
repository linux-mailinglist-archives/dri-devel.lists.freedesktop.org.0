Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DC8AD1D69
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AF310E2B6;
	Mon,  9 Jun 2025 12:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gvgeX6sn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E4710E2C5;
 Mon,  9 Jun 2025 12:24:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55995HdL015705;
 Mon, 9 Jun 2025 12:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AV2iYTfxSnaKQcRbNUAa3Zw3hcZkhKgc7i8tZDoJhuw=; b=gvgeX6sng7NMAMRu
 XP0U/9f2Fx/XNCpggDRcYxCe1DZuzRI2ecUllM9ow5WOqp844GtopiyiwlfUgqxB
 UDbtRUurPyctI1eGy5SOqhIdO+yLD5bEonuGTS4WTZSx4N6iSsPH5TEzijq7uU4C
 eitcvOjoZXkWldbX3wSw2fyb3T8Nd/BSGbqy11aOFiEx/k1bFXnEWx9FLSmT6i9C
 dVOtMl8N7hiOvfhsUzNypnBh8+IpEsSl3XEKjqSd+2FaOYjF2C2TOhz1zig5WbCV
 OU/8F8ozEozmsEOHKGS2brPsVmWmc1xOpz4LAuw2of2MnQ57kdmEdWdsq7xupXzZ
 D8KMxQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxpaj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COZR5005674
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:24:35 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:31 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:47 +0800
Subject: [PATCH v2 28/38] drm/msm/dp: add dp_mst_drm to manage DP MST
 bridge operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250609-msm-dp-mst-v2-28-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471761; l=21891;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=O7Mypdmpc7kksqQczIfMpTRxmmPtEkRHMTSyJinMT1A=;
 b=fwS7sPewl7ISqvFyx/jPV2dFdyiXLkRSMgTGE8GFPQ+MUc+ea9ZPHLJrID7YHhlLMKtPGgahE
 A6tDP6n/KX9BMJ8LeQ5qWwP0p4hPnbPXU+h1dwjg6F3j3DvXnywmyRs
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WQzWFTm-J2enXDX_K3HKTpGrUUjof1KN
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6846d284 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=UuBU2RYY_oJYeml0DocA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WQzWFTm-J2enXDX_K3HKTpGrUUjof1KN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX8+9KgmunXeNT
 GOPQMNNWtGDunNPkZJJjp3l+kbwj8CpKuEs5SPST0i/fgIZXFSSW85MAA4smWuLNVx1StJlqKlc
 PY4XXzjMYz9U0hpoYIAkonGK2HodkPv7MJZRmxh4+1RquSKK/kaB7pwijC7JDED0YPYwhrtLI7N
 Q/CDVFZUqdJR4Zsz8QlMoMFYjEtXP6TFXmQVvu+SZLWbG0MnD7XwFg1sIAdjD8/tdrBu//Cvhpv
 w2aEBu3krjr7JK7jDPdC34mofLl/FvnD/N+nlFzLVTqy2aAzmmKGPdekFXb+HSV8BLE2Dr/WpKl
 aaeS6CPYTQ+YOqbIYqSqK3h18R6tNr9a/NoaXrRW6cmgA3n01q9KZkk7Im2fCO6rHz/e0pDu5j0
 7e/MrW3Go4h5DrBsA4COEooMAfP6Pzg09c5DsmQyc4Z2vfxd1bFxCT/1ltpui5pvaMeusUlK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
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

Add a new file dp_mst_drm to manage the DP MST bridge operations
similar to the dp_drm file which manages the SST bridge operations.
Each MST encoder creates one bridge and each bridge is bound to its
own dp_panel abstraction to manage the operations of its pipeline.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile        |   3 +-
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 501 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h | 100 +++++++
 4 files changed, 606 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7a2ada6e2d74a902879e4f12a78ed475e5209ec2..d317e5ecda28dfd708ccdc5d3d27d4cf0b78b9d5 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -142,7 +142,8 @@ msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
 	dp/dp_audio.o \
-	dp/dp_utils.o
+	dp/dp_utils.o \
+	dp/dp_mst_drm.o
 
 msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 85eaa55fdcb7d9d8713849ec64a2cc9b08924425..9ca045ed2b4f1a9bc3254b733d1ce5332ebaba96 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -7,6 +7,7 @@
 #define _DP_DISPLAY_H_
 
 #include "dp_panel.h"
+#include "dp_mst_drm.h"
 #include "disp/msm_disp_snapshot.h"
 
 #define DP_MAX_PIXEL_CLK_KHZ	675000
@@ -24,6 +25,8 @@ struct msm_dp {
 	bool is_edp;
 	bool internal_hpd;
 
+	struct msm_dp_mst *msm_dp_mst;
+
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
new file mode 100644
index 0000000000000000000000000000000000000000..a3ea34ae63511db0ac920cbeebe30c4e2320b8c4
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/*
+ * Copyright © 2014 Red Hat.
+ *
+ * Permission to use, copy, modify, distribute, and sell this software and its
+ * documentation for any purpose is hereby granted without fee, provided that
+ * the above copyright notice appear in all copies and that both that copyright
+ * notice and this permission notice appear in supporting documentation, and
+ * that the name of the copyright holders not be used in advertising or
+ * publicity pertaining to distribution of the software without specific,
+ * written prior permission.  The copyright holders make no representations
+ * about the suitability of this software for any purpose.  It is provided "as
+ * is" without express or implied warranty.
+ *
+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
+ * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
+ * OF THIS SOFTWARE.
+ */
+
+#include "dp_mst_drm.h"
+
+static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
+{
+	struct msm_dp_mst_bridge_state *state;
+
+	state = kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
+
+	return &state->base;
+}
+
+static void msm_dp_mst_destroy_bridge_state(struct drm_private_obj *obj,
+					    struct drm_private_state *state)
+{
+	struct msm_dp_mst_bridge_state *priv_state =
+		to_msm_dp_mst_bridge_priv_state(state);
+
+	kfree(priv_state);
+}
+
+static const struct drm_private_state_funcs msm_dp_mst_bridge_state_funcs = {
+	.atomic_duplicate_state = msm_dp_mst_duplicate_bridge_state,
+	.atomic_destroy_state = msm_dp_mst_destroy_bridge_state,
+};
+
+/**
+ * dp_mst_find_vcpi_slots() - Find VCPI slots for this PBN value
+ * @mgr: manager to use
+ * @pbn: payload bandwidth to convert into slots.
+ *
+ * Calculate the number of VCPI slots that will be required for the given PBN
+ * value.
+ *
+ * RETURNS:
+ * The total slots required for this port, or error.
+ */
+static int msm_dp_mst_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, int pbn)
+{
+	int num_slots;
+	struct drm_dp_mst_topology_state *state;
+
+	state = to_drm_dp_mst_topology_state(mgr->base.state);
+	num_slots = DIV_ROUND_UP(pbn, dfixed_trunc(state->pbn_div));
+
+	/* max. time slots - one slot for MTP header */
+	if (num_slots > 63)
+		return -ENOSPC;
+	return num_slots;
+}
+
+static void _msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
+					 struct msm_dp_mst_bridge *mst_bridge,
+					 struct drm_dp_mst_port *port)
+{
+	int i;
+	struct msm_dp_mst_bridge *msm_dp_bridge;
+	struct drm_dp_mst_topology_state *mst_state;
+	struct drm_dp_mst_atomic_payload *payload;
+	int prev_start = 0;
+	int prev_slots = 0;
+
+	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
+	payload = drm_atomic_get_mst_payload_state(mst_state, port);
+
+	if (!payload) {
+		DRM_ERROR("mst bridge [%d] update_timeslots failed, null payload\n",
+			  mst_bridge->id);
+		return;
+	}
+
+	for (i = 0; i < mst->max_streams; i++) {
+		msm_dp_bridge = &mst->mst_bridge[i];
+		if (mst_bridge == msm_dp_bridge) {
+			/*
+			 * When a payload was removed make sure to move any payloads after it
+			 * to the left so all payloads are aligned to the left.
+			 */
+			if (payload->vc_start_slot < 0) {
+				// cache the payload
+				prev_start = msm_dp_bridge->start_slot;
+				prev_slots = msm_dp_bridge->num_slots;
+				msm_dp_bridge->pbn = 0;
+				msm_dp_bridge->start_slot = 1;
+				msm_dp_bridge->num_slots = 0;
+				msm_dp_bridge->vcpi = 0;
+			} else { //add payload
+				msm_dp_bridge->pbn = payload->pbn;
+				msm_dp_bridge->start_slot = payload->vc_start_slot;
+				msm_dp_bridge->num_slots = payload->time_slots;
+				msm_dp_bridge->vcpi = payload->vcpi;
+			}
+		}
+	}
+
+	// Now commit all the updated payloads
+	for (i = 0; i < mst->max_streams; i++) {
+		msm_dp_bridge = &mst->mst_bridge[i];
+
+		//Shift payloads to the left if there was a removed payload.
+		if (payload->vc_start_slot < 0 && msm_dp_bridge->start_slot > prev_start)
+			msm_dp_bridge->start_slot -= prev_slots;
+
+		msm_dp_display_set_stream_info(mst->msm_dp, msm_dp_bridge->msm_dp_panel,
+					       msm_dp_bridge->id, msm_dp_bridge->start_slot,
+					       msm_dp_bridge->num_slots,
+					       msm_dp_bridge->pbn, msm_dp_bridge->vcpi);
+		drm_dbg_dp(mst->msm_dp->drm_dev,
+			   "conn:%d vcpi:%d start_slot:%d num_slots:%d, pbn:%d\n",
+			   DP_MST_CONN_ID(msm_dp_bridge), msm_dp_bridge->vcpi,
+			   msm_dp_bridge->start_slot,
+			   msm_dp_bridge->num_slots, msm_dp_bridge->pbn);
+	}
+}
+
+static int _msm_dp_mst_bridge_pre_enable_part1(struct msm_dp_mst_bridge *dp_bridge,
+					       struct drm_atomic_state *state)
+{
+	struct msm_dp *msm_dp = dp_bridge->display;
+	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
+	struct drm_dp_mst_port *port = mst_conn->mst_port;
+	struct drm_dp_mst_topology_state *mst_state;
+	struct drm_dp_mst_atomic_payload *payload;
+	struct msm_dp_panel *dp_panel = mst_conn->dp_panel;
+	int pbn, slots;
+	int rc = 0;
+
+	mst_state = drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
+
+	pbn = drm_dp_calc_pbn_mode(dp_panel->msm_dp_mode.drm_mode.clock,
+				   (mst_conn->connector.display_info.bpc * 3) << 4);
+
+	slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, pbn);
+
+	drm_dbg_dp(msm_dp->drm_dev, "conn:%d pbn:%d, slots:%d\n", DP_MST_CONN_ID(dp_bridge),
+		   pbn, slots);
+
+	payload = drm_atomic_get_mst_payload_state(mst_state, port);
+	if (!payload || payload->time_slots <= 0) {
+		DRM_ERROR("time slots not allocated for conn:%d\n", DP_MST_CONN_ID(dp_bridge));
+		rc = -EINVAL;
+		return rc;
+	}
+
+	drm_dp_mst_update_slots(mst_state, DP_CAP_ANSI_8B10B);
+
+	rc = drm_dp_add_payload_part1(&mst->mst_mgr, mst_state, payload);
+	if (rc) {
+		DRM_ERROR("payload allocation failure for conn:%d\n", DP_MST_CONN_ID(dp_bridge));
+		return rc;
+	}
+
+	_msm_dp_mst_update_timeslots(mst, dp_bridge, port);
+
+	return rc;
+}
+
+static void _msm_dp_mst_bridge_pre_enable_part2(struct msm_dp_mst_bridge *dp_bridge,
+						struct drm_atomic_state *state)
+{
+	struct msm_dp *msm_dp = dp_bridge->display;
+	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
+	struct drm_dp_mst_port *port = mst_conn->mst_port;
+	struct drm_dp_mst_topology_state *mst_state;
+	struct drm_dp_mst_atomic_payload *payload;
+
+	drm_dp_check_act_status(&mst->mst_mgr);
+
+	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
+	payload = drm_atomic_get_mst_payload_state(mst_state, port);
+
+	if (!payload) {
+		DRM_ERROR("mst bridge [%d] null payload\n", dp_bridge->id);
+		return;
+	}
+
+	if (!payload->port) {
+		DRM_ERROR("mst bridge [%d] null port\n", dp_bridge->id);
+		return;
+	}
+
+	if (!payload->port->connector) {
+		DRM_ERROR("mst bridge [%d] part-2 failed, null connector\n",
+			  dp_bridge->id);
+		return;
+	}
+
+	if (payload->vc_start_slot == -1) {
+		DRM_ERROR("mst bridge [%d] part-2 failed, payload alloc part 1 failed\n",
+			  dp_bridge->id);
+		return;
+	}
+
+	drm_dp_add_payload_part2(&mst->mst_mgr, payload);
+
+	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre enable part-2 complete\n",
+		   dp_bridge->id);
+}
+
+static void _msm_dp_mst_bridge_pre_disable_part1(struct msm_dp_mst_bridge *dp_bridge,
+						 struct drm_atomic_state *state)
+{
+	struct msm_dp *msm_dp = dp_bridge->display;
+	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
+	struct drm_dp_mst_port *port = mst_conn->mst_port;
+	struct drm_dp_mst_topology_state *old_mst_state;
+	struct drm_dp_mst_topology_state *new_mst_state;
+	const struct drm_dp_mst_atomic_payload *old_payload;
+	struct drm_dp_mst_atomic_payload *new_payload;
+
+	old_mst_state = drm_atomic_get_old_mst_topology_state(state, &mst->mst_mgr);
+
+	new_mst_state = drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
+
+	old_payload = drm_atomic_get_mst_payload_state(old_mst_state, port);
+	new_payload = drm_atomic_get_mst_payload_state(new_mst_state, port);
+
+	if (!old_payload || !new_payload) {
+		DRM_ERROR("mst bridge [%d] _pre disable part-1 failed, null payload\n",
+			  dp_bridge->id);
+		return;
+	}
+
+	drm_dp_remove_payload_part1(&mst->mst_mgr, new_mst_state, new_payload);
+	drm_dp_remove_payload_part2(&mst->mst_mgr, new_mst_state, old_payload, new_payload);
+
+	_msm_dp_mst_update_timeslots(mst, dp_bridge, port);
+
+	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre disable part-1 complete\n",
+		   dp_bridge->id);
+}
+
+static void _msm_dp_mst_bridge_pre_disable_part2(struct msm_dp_mst_bridge *dp_bridge)
+{
+	struct msm_dp *msm_dp = dp_bridge->display;
+	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
+
+	drm_dp_check_act_status(&mst->mst_mgr);
+
+	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre disable part-2 complete\n",
+		   dp_bridge->id);
+}
+
+static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
+						struct drm_atomic_state *state)
+{
+	int rc = 0;
+	struct msm_dp_mst_bridge *bridge;
+	struct msm_dp *dp;
+	struct msm_dp_mst_bridge_state *msm_dp_bridge_state;
+	struct msm_dp_mst *dp_mst;
+
+	if (!drm_bridge) {
+		DRM_ERROR("Invalid params\n");
+		return;
+	}
+
+	bridge = to_msm_dp_mst_bridge(drm_bridge);
+	msm_dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
+	dp = bridge->display;
+	dp_mst = dp->msm_dp_mst;
+
+	/* to cover cases of bridge_disable/bridge_enable without modeset */
+	bridge->connector = msm_dp_bridge_state->connector;
+	bridge->msm_dp_panel = msm_dp_bridge_state->msm_dp_panel;
+
+	if (!bridge->connector) {
+		DRM_ERROR("Invalid connector\n");
+		return;
+	}
+
+	mutex_lock(&dp_mst->mst_lock);
+	msm_dp_display_atomic_prepare(dp);
+
+	rc = _msm_dp_mst_bridge_pre_enable_part1(bridge, state);
+	if (rc) {
+		DRM_ERROR("[%d] DP display pre-enable failed, rc=%d\n", bridge->id, rc);
+		msm_dp_display_unprepare(dp);
+		mutex_unlock(&dp_mst->mst_lock);
+		return;
+	}
+
+	msm_dp_display_enable_helper(dp, bridge->msm_dp_panel);
+
+	_msm_dp_mst_bridge_pre_enable_part2(bridge, state);
+
+	mutex_unlock(&dp_mst->mst_lock);
+
+	drm_dbg_dp(dp->drm_dev, "conn:%d mode:%s fps:%d vcpi:%d slots:%d to %d\n",
+		   DP_MST_CONN_ID(bridge), bridge->drm_mode.name,
+		   drm_mode_vrefresh(&bridge->drm_mode),
+		   bridge->vcpi, bridge->start_slot,
+		   bridge->start_slot + bridge->num_slots);
+}
+
+static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+					     struct drm_atomic_state *state)
+{
+	struct msm_dp_mst_bridge *bridge;
+	struct msm_dp *dp;
+	struct msm_dp_mst *mst;
+
+	if (!drm_bridge) {
+		DRM_ERROR("Invalid params\n");
+		return;
+	}
+
+	bridge = to_msm_dp_mst_bridge(drm_bridge);
+	if (!bridge->connector) {
+		DRM_ERROR("Invalid connector\n");
+		return;
+	}
+
+	dp = bridge->display;
+	mst = dp->msm_dp_mst;
+
+	mutex_lock(&mst->mst_lock);
+
+	_msm_dp_mst_bridge_pre_disable_part1(bridge, state);
+
+	msm_dp_display_disable_helper(dp, bridge->msm_dp_panel);
+
+	_msm_dp_mst_bridge_pre_disable_part2(bridge);
+
+	mutex_unlock(&mst->mst_lock);
+
+	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d disable complete\n", bridge->id,
+		   DP_MST_CONN_ID(bridge));
+}
+
+static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+						  struct drm_atomic_state *state)
+{
+	int conn = 0;
+	struct msm_dp_mst_bridge *bridge;
+	struct msm_dp *dp;
+	struct msm_dp_mst *mst;
+
+	if (!drm_bridge) {
+		DRM_ERROR("Invalid params\n");
+		return;
+	}
+
+	bridge = to_msm_dp_mst_bridge(drm_bridge);
+	if (!bridge->connector) {
+		DRM_ERROR("Invalid connector\n");
+		return;
+	}
+
+	conn = DP_MST_CONN_ID(bridge);
+
+	dp = bridge->display;
+	mst = dp->msm_dp_mst;
+
+	mutex_lock(&mst->mst_lock);
+
+	msm_dp_display_atomic_post_disable_helper(dp, bridge->msm_dp_panel);
+
+	if (!dp->mst_active)
+		msm_dp_display_unprepare(dp);
+
+	bridge->connector = NULL;
+	bridge->msm_dp_panel =  NULL;
+
+	mutex_unlock(&mst->mst_lock);
+
+	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d post disable complete\n",
+		   bridge->id, conn);
+}
+
+static void msm_dp_mst_bridge_mode_set(struct drm_bridge *drm_bridge,
+				       const struct drm_display_mode *mode,
+				       const struct drm_display_mode *adjusted_mode)
+{
+	struct msm_dp_mst_bridge *bridge;
+	struct msm_dp_mst_bridge_state *dp_bridge_state;
+	struct msm_dp *dp;
+	struct msm_dp_panel *msm_dp_panel;
+
+	if (!drm_bridge || !mode || !adjusted_mode) {
+		DRM_ERROR("Invalid params\n");
+		return;
+	}
+
+	bridge = to_msm_dp_mst_bridge(drm_bridge);
+
+	dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
+	bridge->connector = dp_bridge_state->connector;
+	bridge->msm_dp_panel = dp_bridge_state->msm_dp_panel;
+
+	msm_dp_panel = bridge->msm_dp_panel;
+	dp = bridge->display;
+
+	memcpy(&bridge->drm_mode, adjusted_mode, sizeof(bridge->drm_mode));
+	msm_dp_display_mode_set_helper(dp, mode, adjusted_mode, bridge->msm_dp_panel);
+	msm_dp_panel->pbn = drm_dp_calc_pbn_mode(msm_dp_panel->msm_dp_mode.drm_mode.clock,
+							  (msm_dp_panel->msm_dp_mode.bpp << 4));
+	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d mode set complete %s\n", bridge->id,
+		   DP_MST_CONN_ID(bridge), mode->name);
+}
+
+/* DP MST Bridge APIs */
+static const struct drm_bridge_funcs msm_dp_mst_bridge_ops = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset           = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable   = msm_dp_mst_bridge_atomic_pre_enable,
+	.atomic_disable      = msm_dp_mst_bridge_atomic_disable,
+	.atomic_post_disable = msm_dp_mst_bridge_atomic_post_disable,
+	.mode_set     = msm_dp_mst_bridge_mode_set,
+};
+
+int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder)
+{
+	int rc = 0;
+	struct msm_dp_mst_bridge *bridge = NULL;
+	struct msm_dp_mst_bridge_state *state;
+	struct drm_device *dev;
+	struct msm_dp_mst *mst = dp->msm_dp_mst;
+	int i;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (!mst->mst_bridge[i].in_use) {
+			bridge = &mst->mst_bridge[i];
+			bridge->encoder = encoder;
+			bridge->in_use = true;
+			bridge->id = i;
+			break;
+		}
+	}
+
+	if (i == mst->max_streams) {
+		DRM_ERROR("mst supports only %d bridges\n", i);
+		rc = -EACCES;
+		goto end;
+	}
+
+	dev = dp->drm_dev;
+	bridge->display = dp;
+	bridge->base.funcs = &msm_dp_mst_bridge_ops;
+	bridge->base.encoder = encoder;
+	bridge->base.type = dp->connector_type;
+	bridge->base.ops = DRM_BRIDGE_OP_MODES;
+	drm_bridge_add(&bridge->base);
+
+	rc = drm_bridge_attach(encoder, &bridge->base, NULL, 0);
+	if (rc) {
+		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
+		goto end;
+	}
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state) {
+		rc = -ENOMEM;
+		goto end;
+	}
+
+	drm_atomic_private_obj_init(dev, &bridge->obj,
+				    &state->base,
+				    &msm_dp_mst_bridge_state_funcs);
+
+	drm_dbg_dp(dp->drm_dev, "mst drm bridge init. bridge id:%d\n", i);
+
+	return 0;
+
+end:
+	return rc;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
new file mode 100644
index 0000000000000000000000000000000000000000..cdde59da7bb937ad67fa818a728082f8fd43a3a6
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ * Permission to use, copy, modify, distribute, and sell this software and its
+ * documentation for any purpose is hereby granted without fee, provided that
+ * the above copyright notice appear in all copies and that both that copyright
+ * notice and this permission notice appear in supporting documentation, and
+ * that the name of the copyright holders not be used in advertising or
+ * publicity pertaining to distribution of the software without specific,
+ * written prior permission.  The copyright holders make no representations
+ * about the suitability of this software for any purpose.  It is provided "as
+ * is" without express or implied warranty.
+ *
+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
+ * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
+ * OF THIS SOFTWARE.
+ */
+
+#ifndef _DP_MST_DRM_H_
+#define _DP_MST_DRM_H_
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/errno.h>
+#include <linux/version.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_fixed.h>
+#include <drm/drm_connector.h>
+#include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
+
+#include "dp_panel.h"
+#include "dp_display.h"
+
+#define DP_MST_CONN_ID(bridge) ((bridge)->connector ? \
+		(bridge)->connector->base.id : 0)
+
+struct msm_dp_mst_bridge {
+	struct drm_bridge base;
+	struct drm_private_obj obj;
+	u32 id;
+
+	bool in_use;
+
+	struct msm_dp *display;
+	struct drm_encoder *encoder;
+
+	struct drm_display_mode drm_mode;
+	struct drm_connector *connector;
+	struct msm_dp_panel *msm_dp_panel;
+
+	int vcpi;
+	int pbn;
+	int num_slots;
+	int start_slot;
+};
+
+struct msm_dp_mst_bridge_state {
+	struct drm_private_state base;
+	struct drm_connector *connector;
+	struct msm_dp_panel *msm_dp_panel;
+	int num_slots;
+};
+
+struct msm_dp_mst {
+	struct drm_dp_mst_topology_mgr mst_mgr;
+	struct msm_dp_mst_bridge *mst_bridge;
+	struct msm_dp *msm_dp;
+	u32 max_streams;
+	struct mutex mst_lock;
+};
+
+struct msm_dp_mst_connector {
+	struct drm_connector connector;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp *msm_dp;
+	struct msm_dp_panel *dp_panel;
+};
+
+#define to_msm_dp_mst_bridge(x)     container_of((x), struct msm_dp_mst_bridge, base)
+#define to_msm_dp_mst_bridge_priv(x) \
+		container_of((x), struct msm_dp_mst_bridge, obj)
+#define to_msm_dp_mst_bridge_priv_state(x) \
+		container_of((x), struct msm_dp_mst_bridge_state, base)
+#define to_msm_dp_mst_bridge_state(x) \
+		to_msm_dp_mst_bridge_priv_state((x)->obj.state)
+#define to_msm_dp_mst_connector(x) \
+		container_of((x), struct msm_dp_mst_connector, connector)
+int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
+
+#endif /* _DP_MST_DRM_H_ */

-- 
2.34.1

