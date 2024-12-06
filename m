Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1069E65D7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C463A10E5ED;
	Fri,  6 Dec 2024 04:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WxnG//H5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B300C10F023;
 Fri,  6 Dec 2024 04:33:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5JiFgY018932;
 Fri, 6 Dec 2024 04:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsbFaoUZ6TY/SFu4F/OW7aUXZXatOdzdFXChETzI1pI=; b=WxnG//H5+mcdNywa
 DoVXBcMQJwjcqvh7ywIe7qyZGDH8rUJ0vNLm5UZ2WXg8PAa19hsTf5PfpRO4KNAl
 gyDUKqrAOGEqA1I6S4jrmFu6LZtnVjBMPU7XezuYoMSxCKVlO7qihGFT6Pi7MZ1z
 76rNtd49YZHePTad/XR/gl4y5SqtpJvfCRdw0nwJj6sf6CV0feRlgYnekiR78JW4
 08bluMPtq1Csatlf73ESoKe/MY0bEK6MWf7dnESGneQH43j/P83rZkBL21qaPlca
 yhol6w5zjLUnzvU6CyrZ8H0CEdtCPKtDpvvkEYHwm9jBAhg48lEXpxCi2rutvVHl
 cNRCVQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8s0uc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64Wgw4016393
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:42 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:41 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:02 -0800
Subject: [PATCH 31/45] drm/msm/dp: add dp_mst_drm to manage DP MST bridge
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20241205-dp_mst-v1-31-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=21958;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=YBT5cUNII9KLePpvW+Fl1wOXTD/j1oBgeO5MGMtY2H0=;
 b=2rntMTZPlXrL5ZWp3UyOvk5jjp3SHeL/V4/tKfK8JXziiI/4/iLUFlCGtbL8UyynLoCtatikg
 4yBr+aU2gbaChjfsrBTyLyxg18FQ4mYMK+0lH6OfyWEM50IMlhOxlUJ
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Wng9z_1iV4Zi3O9usclSe3ZnobCeA-8-
X-Proofpoint-GUID: Wng9z_1iV4Zi3O9usclSe3ZnobCeA-8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412060030
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

Add a new file dp_mst_drm to manage the DP MST bridge operations
similar to the dp_drm file which manages the SST bridge operations.
Each MST encoder creates one bridge and each bridge is bound to its
own dp_panel abstraction to manage the operations of its pipeline.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile        |   3 +-
 drivers/gpu/drm/msm/dp/dp_display.h |   2 +
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 490 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h | 102 ++++++++
 4 files changed, 596 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index f274d9430cc311405f890074c1466ffe2ec45ac9..b1e01b3123d9afc4818f059c5d4e7ca70dca3754 100644
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
index 6ab14e969bce0fd07b3a550bae17e99652479232..a5d4893f689c6afbbe622c9b7dfa98d23d754831 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -7,6 +7,7 @@
 #define _DP_DISPLAY_H_
 
 #include "dp_panel.h"
+#include "dp_mst_drm.h"
 #include <sound/hdmi-codec.h>
 #include "disp/msm_disp_snapshot.h"
 
@@ -26,6 +27,7 @@ struct msm_dp {
 	bool is_edp;
 	bool internal_hpd;
 
+	struct msm_dp_mst *msm_dp_mst;
 	hdmi_codec_plugged_cb plugged_cb;
 
 	struct msm_dp_audio *msm_dp_audio;
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
new file mode 100644
index 0000000000000000000000000000000000000000..e66bd1e565aeb4da3d636eb5f4aa75504d60fd40
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -0,0 +1,490 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
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
+					       struct drm_bridge_state *bridge_state)
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
+	mst_state = drm_atomic_get_new_mst_topology_state(bridge_state->base.state,
+							  &mst->mst_mgr);
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
+						struct drm_bridge_state *bridge_state)
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
+						 struct drm_bridge_state *bridge_state)
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
+	old_mst_state = drm_atomic_get_old_mst_topology_state(bridge_state->base.state,
+							      &mst->mst_mgr);
+
+	new_mst_state = drm_atomic_get_new_mst_topology_state(bridge_state->base.state,
+							      &mst->mst_mgr);
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
+						struct drm_bridge_state *old_bridge_state)
+{
+	int rc = 0;
+	struct msm_dp_mst_bridge *bridge;
+	struct msm_dp *dp;
+	struct msm_dp_mst_bridge_state *msm_dp_bridge_state;
+
+	if (!drm_bridge) {
+		DRM_ERROR("Invalid params\n");
+		return;
+	}
+
+	bridge = to_msm_dp_mst_bridge(drm_bridge);
+	msm_dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
+	dp = bridge->display;
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
+	msm_dp_display_atomic_prepare(dp);
+
+	rc = _msm_dp_mst_bridge_pre_enable_part1(bridge, old_bridge_state);
+	if (rc) {
+		DRM_ERROR("[%d] DP display pre-enable failed, rc=%d\n", bridge->id, rc);
+		msm_dp_display_unprepare(dp);
+		return;
+	}
+
+	msm_dp_display_enable_helper(dp, bridge->msm_dp_panel);
+
+	_msm_dp_mst_bridge_pre_enable_part2(bridge, old_bridge_state);
+
+	drm_dbg_dp(dp->drm_dev, "conn:%d mode:%s fps:%d vcpi:%d slots:%d to %d\n",
+		   DP_MST_CONN_ID(bridge), bridge->drm_mode.name,
+		   drm_mode_vrefresh(&bridge->drm_mode),
+		   bridge->vcpi, bridge->start_slot,
+		   bridge->start_slot + bridge->num_slots);
+}
+
+static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+					     struct drm_bridge_state *old_bridge_state)
+{
+	struct msm_dp_mst_bridge *bridge;
+	struct msm_dp *dp;
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
+
+	_msm_dp_mst_bridge_pre_disable_part1(bridge, old_bridge_state);
+
+	msm_dp_display_disable_helper(dp, bridge->msm_dp_panel);
+
+	_msm_dp_mst_bridge_pre_disable_part2(bridge);
+
+	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d disable complete\n", bridge->id,
+		   DP_MST_CONN_ID(bridge));
+}
+
+static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+						  struct drm_bridge_state *old_bridge_state)
+{
+	int conn = 0;
+	struct msm_dp_mst_bridge *bridge;
+	struct msm_dp *dp;
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
+
+	msm_dp_display_atomic_post_disable_helper(dp, bridge->msm_dp_panel);
+
+	if (!dp->mst_active)
+		msm_dp_display_unprepare(dp);
+
+	bridge->connector = NULL;
+	bridge->msm_dp_panel =  NULL;
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
+	memset(&bridge->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
+	memcpy(&bridge->drm_mode, adjusted_mode, sizeof(bridge->drm_mode));
+	msm_dp_display_mode_set_helper(dp, mode, adjusted_mode, bridge->msm_dp_panel);
+	msm_dp_panel->mst_caps.pbn = drm_dp_calc_pbn_mode(msm_dp_panel->msm_dp_mode.drm_mode.clock,
+							  (msm_dp_panel->msm_dp_mode.bpp << 4));
+	memcpy(&bridge->msm_dp_mode, &bridge->msm_dp_panel->msm_dp_mode,
+	       sizeof(struct msm_dp_display_mode));
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
index 0000000000000000000000000000000000000000..c2a82cd3c6d6e1951a8e5905d3aa39dfc691023b
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
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
+	struct msm_dp_display_mode msm_dp_mode;
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
+	bool mst_initialized;
+	struct drm_dp_mst_topology_mgr mst_mgr;
+	struct msm_dp_mst_bridge *mst_bridge;
+	struct msm_dp *msm_dp;
+	bool mst_session_hpd_state;
+	u32 max_streams;
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

