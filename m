Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2467E147
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB4C10E43E;
	Fri, 27 Jan 2023 10:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3251C10E43B;
 Fri, 27 Jan 2023 10:15:56 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30R9Dsnm030800; Fri, 27 Jan 2023 10:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=klYU2WW6Oj610KyLuzELQMiZ3+aP6za33DGSZGfHcZo=;
 b=S3JoyMCDkVXbXtIyEhSsW0Pa8bk4a/r2x6vWeD3TRcdK0068ULBS21A6D/lNxnzCvCvL
 KTva5q6+l/kMhVCU2YCkJqo19BDwY0+GoPuGI3hpftkxfUC537dt+x6O5tIsHGGlgqMA
 zaTSzNzOfylvRS+ZF3Qgt9UFcXpzEnbTCfFzAji+0OktYcRPP6HPrAPRbC8GRE4yINFr
 t4kj95YfWaWyRLgDABVV70Ykg6QW8LMUxNg0nbY/0j/HQ0juNJKPfC7h/bH7Q0JXTPEH
 vO3cz9oR2tP93IQLy422M2eaikM9EYc59lG5zhXk4fQwUKhm5DJbq1WRm9NyAHyiilp0 pg== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ncavc05c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 10:15:54 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30RAFlU9002355; 
 Fri, 27 Jan 2023 10:15:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3n894m35kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 27 Jan 2023 10:15:51 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30RAEo5i001332;
 Fri, 27 Jan 2023 10:15:50 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 30RAFokw002416;
 Fri, 27 Jan 2023 10:15:50 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id B5F224B79; Fri, 27 Jan 2023 02:15:49 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] drm/msm/disp/dpu1: reserve the resources on topology
 change
Date: Fri, 27 Jan 2023 02:15:45 -0800
Message-Id: <1674814545-9453-4-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674814545-9453-1-git-send-email-quic_kalyant@quicinc.com>
References: <1674814545-9453-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eFjpw4bID8rvCmAFgyOx3L17SupeGxfD
X-Proofpoint-ORIG-GUID: eFjpw4bID8rvCmAFgyOx3L17SupeGxfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_06,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301270096
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, robdclark@chromium.org,
 dianders@chromium.org, quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some features like ctm can be enabled dynamically. Release and reserve
the dpu resources whenever a topology change occurs such that
required hw blocks are allocated appropriately.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 ++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  4 ---
 5 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 539b68b..89afe04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -225,6 +225,7 @@ struct dpu_crtc_state {
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
+	struct msm_display_topology topology;
 };
 
 #define to_dpu_crtc_state(x) \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8d76cb3..db417f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -217,6 +217,18 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state);
+
+static bool _dpu_enc_is_topology_changed(struct drm_crtc_state *crtc_state,
+	struct msm_display_topology topology)
+{
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+
+	return !!memcmp(&cstate->topology,
+		&topology, sizeof(struct msm_display_topology));
+}
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
@@ -650,12 +662,16 @@ static int dpu_encoder_virt_atomic_check(
 		 * Release and Allocate resources on every modeset
 		 * Dont allocate when active is false.
 		 */
-		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		if (drm_atomic_crtc_needs_modeset(crtc_state) ||
+			_dpu_enc_is_topology_changed(crtc_state, topology)) {
 			dpu_rm_release(global_state, drm_enc);
 
-			if (!crtc_state->active_changed || crtc_state->active)
+			if (crtc_state->enable) {
 				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
 						drm_enc, crtc_state, topology);
+				if (!ret)
+					dpu_enc->topology = topology;
+			}
 		}
 	}
 
@@ -1089,7 +1105,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	}
 
 	cstate->num_mixers = num_lm;
-
+	cstate->topology = dpu_enc->topology;
 	dpu_enc->connector = conn_state->connector;
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
@@ -2076,11 +2092,14 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	ctl->ops.clear_pending_flush(ctl);
 }
 
-void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
+void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc,
+	struct drm_crtc_state *crtc_state)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	struct dpu_encoder_phys *phys;
 	int i;
+	struct list_head *connector_list;
+	struct drm_connector *conn = NULL, *conn_iter;
 
 	if (!drm_enc) {
 		DPU_ERROR("invalid encoder\n");
@@ -2088,6 +2107,20 @@ void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
 	}
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
+	connector_list = &drm_enc->dev->mode_config.connector_list;
+	list_for_each_entry(conn_iter, connector_list, head)
+		if (conn_iter->state->best_encoder == drm_enc)
+			conn = conn_iter;
+
+	/*
+	 * In case of modeset, DRM kernel will trigger a atomic_mode_set
+	 * call back, for usecases where there is no mode change but a topology
+	 * change, update the resources from here.
+	 */
+	if (!drm_atomic_crtc_needs_modeset(crtc_state) &&
+		_dpu_enc_is_topology_changed(crtc_state, dpu_enc->topology))
+		dpu_encoder_virt_atomic_mode_set(drm_enc, crtc_state, conn->state);
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		phys = dpu_enc->phys_encs[i];
 		if (phys->ops.prepare_commit)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 9e7236e..4cbe20c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -150,8 +150,10 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
  * dpu_encoder_prepare_commit - prepare encoder at the very beginning of an
  *	atomic commit, before any registers are written
  * @drm_enc:    Pointer to previously created drm encoder structure
+ * @crtc_state: Pointer to drm crtc state
  */
-void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
+void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc,
+		struct drm_crtc_state *crtc_state);
 
 /**
  * dpu_encoder_set_idle_timeout - set the idle timeout for video
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7a5fabc..f111120 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -455,7 +455,7 @@ static void dpu_kms_prepare_commit(struct msm_kms *kms,
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		drm_for_each_encoder_mask(encoder, crtc->dev,
 					  crtc_state->encoder_mask) {
-			dpu_encoder_prepare_commit(encoder);
+			dpu_encoder_prepare_commit(encoder, crtc_state);
 		}
 	}
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 718ea0a..341c3af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -586,10 +586,6 @@ int dpu_rm_reserve(
 	struct dpu_rm_requirements reqs;
 	int ret;
 
-	/* Check if this is just a page-flip */
-	if (!drm_atomic_crtc_needs_modeset(crtc_state))
-		return 0;
-
 	if (IS_ERR(global_state)) {
 		DPU_ERROR("failed to global state\n");
 		return PTR_ERR(global_state);
-- 
2.7.4

