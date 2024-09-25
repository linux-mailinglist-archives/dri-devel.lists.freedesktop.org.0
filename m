Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A0984E73
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00FB10E8FC;
	Tue, 24 Sep 2024 23:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VnzwU+vp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC08810E774;
 Tue, 24 Sep 2024 23:00:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHOkig006035;
 Tue, 24 Sep 2024 22:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hixRgyWbykaqrClU5SBvzuClsgE+272NY+kTB/Neosc=; b=VnzwU+vp+2E7RkFJ
 vFcvxbTDt6xq26R5KfxAf/QXD56xGkfCUa3rDFZF8+kVbFdC2s4J4H/Hr3HTVx5j
 JWsk/MLr6spE94Y7elUcdexeifx//wfciDTMNJK3oUvg2Ela80aJP5PgaETpN0Bh
 X+zpXD0QAvcNQaK31mAl3o5mntEQDB79MopoL11IK6QWp6c1bb3wSKo4ehTf+cyu
 Ty12/bDsKF+vhED0E8HZE011IEE6QwGlJWZeMBEg7eHhhckfF8RoXNnT9TJZmS+g
 e6tgJSk6UFgAGE8xg3kudmMxqwKJzWy1FssFiAlrIEoerrgjKt2DR+mAouSxHdvX
 IBmPDg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe99xaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxtb4024976
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:55 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:55 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:21 -0700
Subject: [PATCH v2 05/22] drm/msm/dpu: move resource allocation to CRTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-5-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=14458;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=zzRzN3kcrod15iwigTd0ej/aLFXqCPcxDIcpRxGbpPE=;
 b=d4P4A4vGHwf3HIMtOHIlf9NlAAcfkK0XU3O0jFWM08ZgR7SgvZnoCfosuuRCUd/KHh3jVd1XG
 DU7Kgfc+P4HBK8K9n7sMO88/rOBNoPqnQj97cOceuoN0eGMIjzevTQO
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: obVAzkZD4h_APklIF6fLzhhmTnUSTzIz
X-Proofpoint-GUID: obVAzkZD4h_APklIF6fLzhhmTnUSTzIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

All resource allocation is centered around the LMs. Then other blocks
(except DSCs) are allocated basing on the LMs that was selected, and LM
powers up the CRTC rather than the encoder.

Moreover if at some point the driver supports encoder cloning,
allocating resources from the encoder will be incorrect, as all clones
will have different encoder IDs, while LMs are to be shared by these
encoders.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
[quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
 3 files changed, 183 insertions(+), 123 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4c1be2f0555f..b918c80d30b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1163,6 +1163,78 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	return false;
 }
 
+#define MAX_HDISPLAY_SPLIT 1080
+
+static struct msm_display_topology dpu_crtc_get_topology(
+		struct drm_crtc *crtc,
+		struct dpu_kms *dpu_kms,
+		struct drm_crtc_state *crtc_state)
+{
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct msm_display_topology topology = {0};
+	struct drm_encoder *drm_enc;
+
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
+		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
+					    &crtc_state->adjusted_mode);
+
+	/*
+	 * Datapath topology selection
+	 *
+	 * Dual display
+	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
+	 *
+	 * Single display
+	 * 1 LM, 1 INTF
+	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
+	 *
+	 * Add dspps to the reservation requirements if ctm is requested
+	 */
+
+	if (topology.num_intf == 2)
+		topology.num_lm = 2;
+	else if (topology.num_dsc == 2)
+		topology.num_lm = 2;
+	else if (dpu_kms->catalog->caps->has_3d_merge)
+		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+	else
+		topology.num_lm = 1;
+
+	if (crtc_state->ctm)
+		topology.num_dspp = topology.num_lm;
+
+	return topology;
+}
+
+static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
+{
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	struct dpu_global_state *global_state;
+	struct msm_display_topology topology;
+	int ret;
+
+	/*
+	 * Release and Allocate resources on every modeset
+	 * Dont allocate when enable is false.
+	 */
+	global_state = dpu_kms_get_existing_global_state(dpu_kms);
+	if (IS_ERR(global_state))
+		return PTR_ERR(global_state);
+
+	dpu_rm_release(global_state, crtc);
+
+	if (!crtc_state->enable)
+		return 0;
+
+	topology = dpu_crtc_get_topology(crtc, dpu_kms, crtc_state);
+	ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
+			     crtc, &topology);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		struct drm_atomic_state *state)
 {
@@ -1174,10 +1246,24 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	const struct drm_plane_state *pstate;
 	struct drm_plane *plane;
 
+	struct drm_encoder *drm_enc;
+
 	int rc = 0;
 
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
+	/* there might be cases where encoder needs a modeset too */
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
+		if (dpu_encoder_needs_modeset(drm_enc, crtc_state->state))
+			crtc_state->mode_changed = true;
+	}
+
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		rc = dpu_crtc_assign_resources(crtc, crtc_state);
+		if (rc < 0)
+			return rc;
+	}
+
 	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4a9edcfbcaae..ada9119326ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -58,8 +58,6 @@
 
 #define IDLE_SHORT_TIMEOUT	1
 
-#define MAX_HDISPLAY_SPLIT 1080
-
 /* timeout in frames waiting for frame done */
 #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
 
@@ -544,159 +542,117 @@ void dpu_encoder_helper_split_config(
 	}
 }
 
-bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
+void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
+				 struct msm_display_topology *topology,
+				 struct drm_atomic_state *state,
+				 const struct drm_display_mode *adj_mode)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	int i, intf_count = 0, num_dsc = 0;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct msm_display_info *disp_info;
+	struct drm_framebuffer *fb;
+	struct msm_drm_private *priv;
+	int i;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
 		if (dpu_enc->phys_encs[i])
-			intf_count++;
+			topology->num_intf++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		topology->num_dsc += 2;
 
-	return (num_dsc > 0) && (num_dsc > intf_count);
-}
+	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
+	if (!connector)
+		return;
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return;
 
-struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
-{
-	struct msm_drm_private *priv = drm_enc->dev->dev_private;
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	int index = dpu_enc->disp_info.h_tile_instance[0];
+	disp_info = &dpu_enc->disp_info;
 
-	if (dpu_enc->disp_info.intf_type == INTF_DSI)
-		return msm_dsi_get_dsc_config(priv->dsi[index]);
+	priv = drm_enc->dev->dev_private;
 
-	return NULL;
+	/*
+	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
+	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
+	 * earlier.
+	 */
+	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
+		fb = conn_state->writeback_job->fb;
+
+		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
+			topology->needs_cdm = true;
+	} else if (disp_info->intf_type == INTF_DP) {
+		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
+			topology->needs_cdm = true;
+	}
 }
 
-static struct msm_display_topology dpu_encoder_get_topology(
-			struct dpu_encoder_virt *dpu_enc,
-			struct dpu_kms *dpu_kms,
-			struct drm_display_mode *mode,
-			struct drm_crtc_state *crtc_state,
-			struct drm_dsc_config *dsc)
+static bool dpu_encoder_needs_dsc_merge(struct drm_encoder *drm_enc)
 {
-	struct msm_display_topology topology = {0};
-	int i, intf_count = 0;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	u32 num_intf = 0;
+	u32 num_dsc = 0;
+	int i;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
 		if (dpu_enc->phys_encs[i])
-			intf_count++;
-
-	/* Datapath topology selection
-	 *
-	 * Dual display
-	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
-	 *
-	 * Single display
-	 * 1 LM, 1 INTF
-	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
-	 *
-	 * Add dspps to the reservation requirements if ctm is requested
-	 */
-	if (intf_count == 2)
-		topology.num_lm = 2;
-	else if (!dpu_kms->catalog->caps->has_3d_merge)
-		topology.num_lm = 1;
-	else
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
-
-	if (crtc_state->ctm)
-		topology.num_dspp = topology.num_lm;
-
-	topology.num_intf = intf_count;
+			num_intf++;
 
-	if (dsc) {
-		/*
-		 * In case of Display Stream Compression (DSC), we would use
-		 * 2 DSC encoders, 2 layer mixers and 1 interface
-		 * this is power optimal and can drive up to (including) 4k
-		 * screens
-		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
-		topology.num_intf = 1;
-	}
+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
+	if (dpu_enc->dsc)
+		num_dsc += 2;
 
-	return topology;
+	return (num_dsc > 0) && (num_dsc > num_intf);
 }
 
-static int dpu_encoder_virt_atomic_check(
-		struct drm_encoder *drm_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
+bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
 {
-	struct dpu_encoder_virt *dpu_enc;
-	struct msm_drm_private *priv;
-	struct dpu_kms *dpu_kms;
-	struct drm_display_mode *adj_mode;
-	struct msm_display_topology topology;
-	struct msm_display_info *disp_info;
-	struct dpu_global_state *global_state;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
 	struct drm_framebuffer *fb;
-	struct drm_dsc_config *dsc;
-	int ret = 0;
-
-	if (!drm_enc || !crtc_state || !conn_state) {
-		DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
-				drm_enc != NULL, crtc_state != NULL, conn_state != NULL);
-		return -EINVAL;
-	}
-
-	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	DPU_DEBUG_ENC(dpu_enc, "\n");
-
-	priv = drm_enc->dev->dev_private;
-	disp_info = &dpu_enc->disp_info;
-	dpu_kms = to_dpu_kms(priv->kms);
-	adj_mode = &crtc_state->adjusted_mode;
-	global_state = dpu_kms_get_global_state(crtc_state->state);
-	if (IS_ERR(global_state))
-		return PTR_ERR(global_state);
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 
-	trace_dpu_enc_atomic_check(DRMID(drm_enc));
+	if (!drm_enc || !state)
+		return false;
 
-	dsc = dpu_encoder_get_dsc_config(drm_enc);
+	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
+	if (!connector)
+		return false;
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
 
-	/*
-	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
-	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
-	 * earlier.
-	 */
-	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
+	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
 		fb = conn_state->writeback_job->fb;
-
-		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
-			topology.needs_cdm = true;
-	} else if (disp_info->intf_type == INTF_DP) {
-		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
-			topology.needs_cdm = true;
+		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb))) {
+			if (!dpu_enc->cur_master->hw_cdm)
+				return true;
+		} else {
+			if (dpu_enc->cur_master->hw_cdm)
+				return true;
+		}
 	}
 
-	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
-	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
-	/*
-	 * Release and Allocate resources on every modeset
-	 * Dont allocate when active is false.
-	 */
-	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-		dpu_rm_release(global_state, crtc_state->crtc);
+	return false;
+}
 
-		if (!crtc_state->active_changed || crtc_state->enable)
-			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					crtc_state->crtc, &topology);
-	}
+struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
+{
+	struct msm_drm_private *priv = drm_enc->dev->dev_private;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	int index = dpu_enc->disp_info.h_tile_instance[0];
 
-	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
+	if (dpu_enc->disp_info.intf_type == INTF_DSI)
+		return msm_dsi_get_dsc_config(priv->dsi[index]);
 
-	return ret;
+	return NULL;
+}
+
+bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
+{
+	return dpu_encoder_needs_dsc_merge(drm_enc);
 }
 
 static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
@@ -2449,7 +2405,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
 	.atomic_disable = dpu_encoder_virt_atomic_disable,
 	.atomic_enable = dpu_encoder_virt_atomic_enable,
-	.atomic_check = dpu_encoder_virt_atomic_check,
 };
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index f7465a1774aa..0d27e50384f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -169,6 +169,25 @@ int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
  */
 bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_update_topology - update topology with the requirements for the encoder
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @topology:   Topology to be updated
+ * @state:      Current DRM atomic state
+ * @adj_mode:   Current DRM display mode associated with the crtc
+ */
+void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
+				 struct msm_display_topology *topology,
+				 struct drm_atomic_state *state,
+				 const struct drm_display_mode *adj_mode);
+
+/**
+ * dpu_encoder_update_topology - update topology with the requirements for the encoder
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @topology:   Current DRM atomic state
+ */
+bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state);
+
 /**
  * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
  * @drm_enc:    Pointer to previously created drm encoder structure

-- 
2.34.1

