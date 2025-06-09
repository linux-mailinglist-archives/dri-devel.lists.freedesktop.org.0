Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B37AD1D6B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C25910E0C2;
	Mon,  9 Jun 2025 12:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YxbvD5sS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA1910E2DB;
 Mon,  9 Jun 2025 12:24:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559967HH005056;
 Mon, 9 Jun 2025 12:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RZTef0M4bLQk9nca0Evre15D7HjcsO64mBE2oXm5meE=; b=YxbvD5sSS7YvzWVh
 h9rpVtg0z/NNl7DVg5/71seY2s7DA7t/LplxOLp3Z0LE+9P7VQg8VLMSh6Cb7Tu9
 HSE8++dhzfUwQdDbaNS9u4u6io5JcZOvgMVsd9tMYvtnInsT5N25zojYtfzjeg62
 IhCzT5uwE3IpNXOY7BnV4I/GAim5bnAUf5aKrbZpLawcKrj42QtNOdGRqK1v8PP9
 WiIkQDDag+P62HdbjRmyGixlRHTTselj2GNtuGjVThHNnqsNhIlHBci6lTDzq0Xz
 qVynUU7NLqlwWX+q8V03ypI4qvGL7f5yHD9iH2OmfoysomK7bWh1h63M1bMYyYMz
 V+WXLg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcdrus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COdFK018272
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:24:39 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:35 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:48 +0800
Subject: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471761; l=17983;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=43WITtR4hLPnNH+zsOj5w3IsY5LROnSPHKMAnN1Xl0A=;
 b=drQhCSeh4Ud/WPAC4hCuoyrb9ZTgP5d8g7j3rdz17cWksUlRNo69NbSgYPef9rVOr5nSdhb9I
 94ks6jhYEtDAvC4UB2leq0Y1cRkzylWQ2xYJWuxHSLYTlFeeUiQjol0
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX/4IQFgA26e23
 7kFAmYy7vBS+nJ3DaTZoUDP8vmPW2b5yCg7wSeiaXGc64qr2xRl2w2RFYcOkbIjRJgZAlSl2UV9
 qZrdiYB/l8j6tZ6lgVIgtrxi0vzicIXlhvCV9X5go5FdAxogvcYlfTTtFti9RU92DjN1YAsJ6KV
 m15E5HK9mu66LxulfnUYiwhJHfkmBqmVEuXzPhm+vvuAU/fzG0pMR1ePBWwT9G2Zn46dr8ry0Iv
 l1GlNEG+jAR3ap9uUCoRBiwGcy3mRZEvxlYo41ljIzNjPZbeiNafVnaimBFwqEWNpErADcRkTql
 jQozhGMHVG6zTk2GeBYX/B3nV7RI1I5ygMeOJO0dsxsUnZMo34UpRtGyYi4GeOrXhfuDmj18nYo
 kKy43PwuIVxZSewSo3ITq/TAVfk12uW9O7Qj2h4aK0cq8vfCCIp1/w6wq8mN+d17UCdn0n2/
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6846d288 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=KloMMVwOUIOYMbBUgDoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vHmVKXB5j1g6XNg_7pQUfPSrVaWJMZOD
X-Proofpoint-ORIG-GUID: vHmVKXB5j1g6XNg_7pQUfPSrVaWJMZOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
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

Add connector abstraction for the DP MST. Each MST encoder
is connected through a DRM bridge to a MST connector and each
MST connector has a DP panel abstraction attached to it.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
 2 files changed, 518 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index a3ea34ae63511db0ac920cbeebe30c4e2320b8c4..489fa46aa518ff1cc5f4769b2153fc5153c4cb41 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -25,8 +25,12 @@
  * OF THIS SOFTWARE.
  */
 
+#include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
 #include "dp_mst_drm.h"
 
+#define MAX_DPCD_TRANSACTION_BYTES 16
+
 static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
 {
 	struct msm_dp_mst_bridge_state *state;
@@ -79,6 +83,61 @@ static int msm_dp_mst_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, int p
 	return num_slots;
 }
 
+static int msm_dp_mst_get_mst_pbn_div(struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_link_info *link_info;
+
+	link_info = &msm_dp_panel->link_info;
+
+	return link_info->rate * link_info->num_lanes / 54000;
+}
+
+static int msm_dp_mst_compute_config(struct drm_atomic_state *state,
+				      struct msm_dp_mst *mst, struct drm_connector *connector,
+				      struct drm_display_mode *mode)
+{
+	int slots = 0, pbn;
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
+	int rc = 0;
+	struct drm_dp_mst_topology_state *mst_state;
+	int pbn_div;
+	struct msm_dp *dp_display = mst->msm_dp;
+	u32 bpp;
+
+	bpp = connector->display_info.bpc * 3;
+
+	pbn = drm_dp_calc_pbn_mode(mode->clock, bpp << 4);
+
+	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
+
+	if (!dfixed_trunc(mst_state->pbn_div)) {
+		pbn_div = msm_dp_mst_get_mst_pbn_div(mst_conn->dp_panel);
+		mst_state->pbn_div.full = dfixed_const(pbn_div);
+	}
+
+	rc = drm_dp_atomic_find_time_slots(state, &mst->mst_mgr, mst_conn->mst_port, pbn);
+	if (rc < 0) {
+		DRM_ERROR("conn:%d failed to find vcpi slots. pbn:%d, rc:%d\n",
+			  connector->base.id, pbn, rc);
+		goto end;
+	}
+
+	slots = rc;
+
+	rc = drm_dp_mst_atomic_check(state);
+	if (rc) {
+		DRM_ERROR("conn:%d mst atomic check failed: rc=%d\n", connector->base.id, rc);
+		slots = 0;
+		goto end;
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "conn:%d pbn:%d slots:%d rc:%d\n",
+		   connector->base.id, pbn, slots, rc);
+
+end:
+	return (rc < 0 ? rc : slots);
+}
+
 static void _msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
 					 struct msm_dp_mst_bridge *mst_bridge,
 					 struct drm_dp_mst_port *port)
@@ -499,3 +558,459 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder)
 end:
 	return rc;
 }
+
+static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomic_state *st,
+								struct msm_dp_mst_bridge *bridge)
+{
+	struct drm_device *dev = bridge->base.dev;
+
+	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
+
+	return to_msm_dp_mst_bridge_priv_state(drm_atomic_get_private_obj_state(st,
+										&bridge->obj));
+}
+
+/* DP MST Connector OPs */
+static int
+msm_dp_mst_connector_detect(struct drm_connector *connector,
+			    struct drm_modeset_acquire_ctx *ctx,
+			    bool force)
+{
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
+	struct msm_dp *dp_display = mst_conn->msm_dp;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	enum drm_connector_status status = connector_status_disconnected;
+
+	if (drm_connector_is_unregistered(&mst_conn->connector))
+		return status;
+
+	if (dp_display->link_ready && dp_display->mst_active)
+		status = drm_dp_mst_detect_port(connector,
+						ctx, &mst->mst_mgr, mst_conn->mst_port);
+
+	drm_dbg_dp(dp_display->drm_dev, "conn:%d status:%d\n", connector->base.id, status);
+
+	return status;
+}
+
+static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
+	struct msm_dp *dp_display = mst_conn->msm_dp;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	const struct drm_edid *drm_edid;
+	int ret;
+
+	if (drm_connector_is_unregistered(&mst_conn->connector))
+		return drm_edid_connector_update(connector, NULL);
+
+	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
+	drm_edid_connector_update(connector, drm_edid);
+	ret = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
+
+	return ret;
+}
+
+static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
+							    const struct drm_display_mode *mode)
+{
+	struct msm_dp_mst_connector *mst_conn;
+	struct msm_dp *dp_display;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp_panel *dp_panel;
+	struct msm_dp_mst *mst;
+	u16 full_pbn, required_pbn;
+	int available_slots, required_slots;
+	struct msm_dp_mst_bridge_state *dp_bridge_state;
+	int i, slots_in_use = 0, active_enc_cnt = 0;
+	const u32 tot_slots = 63;
+
+	if (drm_connector_is_unregistered(connector))
+		return 0;
+
+	mst_conn = to_msm_dp_mst_connector(connector);
+	dp_display = mst_conn->msm_dp;
+	mst = dp_display->msm_dp_mst;
+	mst_port = mst_conn->mst_port;
+	dp_panel = mst_conn->dp_panel;
+
+	if (!dp_panel || !mst_port)
+		return MODE_ERROR;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		dp_bridge_state = to_msm_dp_mst_bridge_state(&mst->mst_bridge[i]);
+		if (dp_bridge_state->connector &&
+		    dp_bridge_state->connector != connector) {
+			active_enc_cnt++;
+			slots_in_use += dp_bridge_state->num_slots;
+		}
+	}
+
+	if (active_enc_cnt < DP_STREAM_MAX) {
+		full_pbn = mst_port->full_pbn;
+		available_slots = tot_slots - slots_in_use;
+	} else {
+		DRM_ERROR("all mst streams are active\n");
+		return MODE_BAD;
+	}
+
+	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
+
+	required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, required_pbn);
+
+	if (required_pbn > full_pbn || required_slots > available_slots) {
+		drm_dbg_dp(dp_display->drm_dev,
+			   "mode:%s not supported. pbn %d vs %d slots %d vs %d\n",
+			   mode->name, required_pbn, full_pbn,
+			   required_slots, available_slots);
+		return MODE_BAD;
+	}
+
+	return msm_dp_display_mode_valid(dp_display, &dp_display->connector->display_info, mode);
+}
+
+static struct drm_encoder *
+msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_state *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
+	struct msm_dp *dp_display = mst_conn->msm_dp;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	struct drm_encoder *enc = NULL;
+	struct msm_dp_mst_bridge_state *bridge_state;
+	u32 i;
+	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
+										    connector);
+
+	if (conn_state && conn_state->best_encoder)
+		return conn_state->best_encoder;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		bridge_state = msm_dp_mst_br_priv_state(state, &mst->mst_bridge[i]);
+		if (IS_ERR(bridge_state))
+			goto end;
+
+		if (bridge_state->connector == connector) {
+			enc = mst->mst_bridge[i].encoder;
+			goto end;
+		}
+	}
+
+	for (i = 0; i < mst->max_streams; i++) {
+		bridge_state = msm_dp_mst_br_priv_state(state, &mst->mst_bridge[i]);
+
+		if (!bridge_state->connector) {
+			bridge_state->connector = connector;
+			bridge_state->msm_dp_panel = mst_conn->dp_panel;
+			enc = mst->mst_bridge[i].encoder;
+			break;
+		}
+	}
+
+end:
+	if (enc)
+		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder:%d\n",
+			   connector->base.id, i);
+	else
+		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder failed\n",
+			   connector->base.id);
+
+	return enc;
+}
+
+static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_state *state)
+{
+	int rc = 0, slots, i;
+	bool vcpi_released = false;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc *old_crtc;
+	struct drm_crtc_state *crtc_state;
+	struct msm_dp_mst_bridge *bridge;
+	struct msm_dp_mst_bridge_state *bridge_state;
+	struct drm_bridge *drm_bridge;
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
+	struct msm_dp *dp_display = mst_conn->msm_dp;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+
+	if (!state)
+		return rc;
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!new_conn_state)
+		return rc;
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, connector);
+	if (!old_conn_state)
+		goto mode_set;
+
+	old_crtc = old_conn_state->crtc;
+	if (!old_crtc)
+		goto mode_set;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, old_crtc);
+
+	for (i = 0; i < mst->max_streams; i++) {
+		bridge = &mst->mst_bridge[i];
+		drm_dbg_dp(dp_display->drm_dev, "bridge id:%d, vcpi:%d, pbn:%d, slots:%d\n",
+			   bridge->id, bridge->vcpi, bridge->pbn,
+			   bridge->num_slots);
+	}
+
+	/*attempt to release vcpi slots on a modeset change for crtc state*/
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		if (WARN_ON(!old_conn_state->best_encoder)) {
+			rc = -EINVAL;
+			goto end;
+		}
+
+		drm_bridge = drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);
+		if (WARN_ON(!drm_bridge)) {
+			rc = -EINVAL;
+			goto end;
+		}
+		bridge = to_msm_dp_mst_bridge(drm_bridge);
+
+		bridge_state = msm_dp_mst_br_priv_state(state, bridge);
+		if (IS_ERR(bridge_state)) {
+			rc = PTR_ERR(bridge_state);
+			goto end;
+		}
+
+		if (WARN_ON(bridge_state->connector != connector)) {
+			rc = -EINVAL;
+			goto end;
+		}
+
+		slots = bridge_state->num_slots;
+		if (slots > 0) {
+			rc = drm_dp_atomic_release_time_slots(state,
+							      &mst->mst_mgr,
+							      mst_conn->mst_port);
+			if (rc) {
+				DRM_ERROR("failed releasing %d vcpi slots %d\n", slots, rc);
+				goto end;
+			}
+			vcpi_released = true;
+		}
+
+		if (!new_conn_state->crtc) {
+			/* for cases where crtc is not disabled the slots are not
+			 * freed by drm_dp_atomic_release_time_slots. this results
+			 * in subsequent atomic_check failing since internal slots
+			 * were freed but not the dp mst mgr's
+			 */
+			bridge_state->num_slots = 0;
+			bridge_state->connector = NULL;
+			bridge_state->msm_dp_panel = NULL;
+
+			drm_dbg_dp(dp_display->drm_dev, "clear best encoder: %d\n", bridge->id);
+		}
+	}
+
+mode_set:
+	if (!new_conn_state->crtc)
+		goto end;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
+
+	if (drm_atomic_crtc_needs_modeset(crtc_state) && crtc_state->active) {
+		if (WARN_ON(!new_conn_state->best_encoder)) {
+			rc = -EINVAL;
+			goto end;
+		}
+
+		drm_bridge = drm_bridge_chain_get_first_bridge(new_conn_state->best_encoder);
+		if (WARN_ON(!drm_bridge)) {
+			rc = -EINVAL;
+			goto end;
+		}
+		bridge = to_msm_dp_mst_bridge(drm_bridge);
+
+		bridge_state = msm_dp_mst_br_priv_state(state, bridge);
+		if (IS_ERR(bridge_state)) {
+			rc = PTR_ERR(bridge_state);
+			goto end;
+		}
+
+		if (WARN_ON(bridge_state->connector != connector)) {
+			rc = -EINVAL;
+			goto end;
+		}
+
+		/*
+		 * check if vcpi slots are trying to get allocated in same phase
+		 * as deallocation. If so, go to end to avoid allocation.
+		 */
+		if (vcpi_released) {
+			drm_dbg_dp(dp_display->drm_dev,
+				   "skipping allocation since vcpi was released in the same state\n");
+			goto end;
+		}
+
+		if (WARN_ON(bridge_state->num_slots)) {
+			rc = -EINVAL;
+			goto end;
+		}
+
+		slots = msm_dp_mst_compute_config(state, mst, connector, &crtc_state->mode);
+		if (slots < 0) {
+			rc = slots;
+			goto end;
+		}
+
+		bridge_state->num_slots = slots;
+	}
+
+end:
+	drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic check ret %d\n",
+		   connector->base.id, rc);
+	return rc;
+}
+
+static void dp_mst_connector_destroy(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
+
+	drm_connector_cleanup(connector);
+	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
+}
+
+/* DRM MST callbacks */
+static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
+	.get_modes =    msm_dp_mst_connector_get_modes,
+	.detect_ctx =   msm_dp_mst_connector_detect,
+	.mode_valid =   msm_dp_mst_connector_mode_valid,
+	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
+	.atomic_check = msm_dp_mst_connector_atomic_check,
+};
+
+static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.destroy = dp_mst_connector_destroy,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static struct drm_connector *
+msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
+			 struct drm_dp_mst_port *port, const char *pathprop)
+{
+	struct msm_dp_mst *dp_mst;
+	struct drm_device *dev;
+	struct msm_dp *dp_display;
+	struct msm_dp_mst_connector *mst_connector;
+	struct drm_connector *connector;
+	int rc, i;
+
+	dp_mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+
+	dp_display = dp_mst->msm_dp;
+	dev = dp_display->drm_dev;
+
+	mst_connector = devm_kzalloc(dev->dev, sizeof(*mst_connector), GFP_KERNEL);
+
+	drm_modeset_lock_all(dev);
+
+	rc = drm_connector_dynamic_init(dev, &mst_connector->connector,
+					&msm_dp_drm_mst_connector_funcs,
+					DRM_MODE_CONNECTOR_DisplayPort, NULL);
+	if (rc) {
+		drm_modeset_unlock_all(dev);
+		return NULL;
+	}
+
+	mst_connector->dp_panel = msm_dp_display_get_panel(dp_display);
+	if (!mst_connector->dp_panel) {
+		DRM_ERROR("failed to get dp_panel for connector\n");
+		drm_modeset_unlock_all(dev);
+		return NULL;
+	}
+
+	mst_connector->dp_panel->connector = &mst_connector->connector;
+	mst_connector->msm_dp = dp_display;
+	connector = &mst_connector->connector;
+	drm_connector_helper_add(&mst_connector->connector, &msm_dp_drm_mst_connector_helper_funcs);
+
+	if (connector->funcs->reset)
+		connector->funcs->reset(connector);
+
+	/* add all encoders as possible encoders */
+	for (i = 0; i < dp_mst->max_streams; i++) {
+		rc = drm_connector_attach_encoder(&mst_connector->connector,
+						  dp_mst->mst_bridge[i].encoder);
+		if (rc) {
+			DRM_ERROR("failed to attach encoder to connector, %d\n", rc);
+			drm_modeset_unlock_all(dev);
+			return NULL;
+		}
+	}
+
+	mst_connector->mst_port = port;
+	drm_dp_mst_get_port_malloc(mst_connector->mst_port);
+
+	drm_object_attach_property(&mst_connector->connector.base,
+				   dev->mode_config.path_property, 0);
+	drm_object_attach_property(&mst_connector->connector.base,
+				   dev->mode_config.tile_property, 0);
+
+	drm_modeset_unlock_all(dev);
+
+	drm_dbg_dp(dp_display->drm_dev, "add mst connector id:%d\n",
+		   mst_connector->connector.base.id);
+
+	return &mst_connector->connector;
+}
+
+static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
+	.add_connector = msm_dp_mst_add_connector,
+};
+
+int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
+{
+	struct drm_device *dev;
+	int conn_base_id = 0;
+	int ret;
+	struct msm_dp_mst *msm_dp_mst;
+
+	if (!dp_display) {
+		DRM_ERROR("invalid params\n");
+		return 0;
+	}
+
+	dev = dp_display->drm_dev;
+
+	msm_dp_mst = devm_kzalloc(dev->dev, sizeof(*msm_dp_mst), GFP_KERNEL);
+	if (!msm_dp_mst)
+		return -ENOMEM;
+
+	memset(&msm_dp_mst->mst_mgr, 0, sizeof(msm_dp_mst->mst_mgr));
+	msm_dp_mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
+	conn_base_id = dp_display->connector->base.id;
+	msm_dp_mst->msm_dp = dp_display;
+	msm_dp_mst->max_streams = max_streams;
+
+	msm_dp_mst->mst_bridge = drmm_kzalloc(dev, max_streams * sizeof(struct msm_dp_mst_bridge),
+					      GFP_KERNEL);
+
+	msm_dp_mst->dp_aux = drm_aux;
+
+	ret = drm_dp_mst_topology_mgr_init(&msm_dp_mst->mst_mgr, dev,
+					   drm_aux,
+					   MAX_DPCD_TRANSACTION_BYTES,
+					   max_streams,
+					   conn_base_id);
+	if (ret) {
+		DRM_ERROR("dp drm mst topology manager init failed\n");
+		return ret;
+	}
+
+	dp_display->msm_dp_mst = msm_dp_mst;
+
+	mutex_init(&msm_dp_mst->mst_lock);
+
+	drm_dbg_dp(dp_display->drm_dev, "dp drm mst topology manager init completed\n");
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index cdde59da7bb937ad67fa818a728082f8fd43a3a6..7b08346e0bb9189009c02745c243722c01d79493 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -75,6 +75,7 @@ struct msm_dp_mst {
 	struct drm_dp_mst_topology_mgr mst_mgr;
 	struct msm_dp_mst_bridge *mst_bridge;
 	struct msm_dp *msm_dp;
+	struct drm_dp_aux *dp_aux;
 	u32 max_streams;
 	struct mutex mst_lock;
 };
@@ -97,4 +98,6 @@ struct msm_dp_mst_connector {
 		container_of((x), struct msm_dp_mst_connector, connector)
 int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
 
+int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
+
 #endif /* _DP_MST_DRM_H_ */

-- 
2.34.1

