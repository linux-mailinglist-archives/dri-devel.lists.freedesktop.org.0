Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8785A369C1
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 01:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC46910ED59;
	Sat, 15 Feb 2025 00:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ASPjyUPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D3410E119;
 Sat, 15 Feb 2025 00:15:35 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EECt9K020743;
 Sat, 15 Feb 2025 00:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Iai7Dxj+oAL7f1O9OqOlOJXdUF+w6cLlfrkif/n1nas=; b=ASPjyUPJKoxyvKQS
 ZyGvtJwL2CymQxfK9XxUZb5kExQBXvjBM5qElbbLD6nmggsyixcBw0zA2sLNFcYc
 aqBOS7Mz9TCTremIgs7EWhcJbXNyKOItuCHltgzJc0WVIPZHb2C3Py2Ns+Ze4uuA
 ZPFxGaCasoxqdNYiF+PeI4RCinF0IfqJqOjQI5qJ35T7vnTKI48d1W1enznwwwGH
 cpxm8Rjsu32ejWANPijE5ODp7QIvFohFmROXUEDhQis+tEtiqVzFCNJdDxxV3QKi
 yP0v2m9qc5XoQ6ynIRABXUCDciUtDuYw6iIcQBmxOcyE46XZJj8+igmq2oMJY+Um
 FGG5wQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44t7d898bf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:15:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0FPIv017121
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:15:25 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 16:15:24 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 14 Feb 2025 16:14:25 -0800
Subject: [PATCH v6 02/14] drm/msm/dpu: move resource allocation to CRTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250214-concurrent-wb-v6-2-a44c293cf422@quicinc.com>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
In-Reply-To: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739578524; l=16481;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=rAFNeBU1I6UjIjFNZgJdrH0fdmG6YSQt8Mocof+lsPY=;
 b=vCoi0/1ZhIdarJXFK7d26L0upAFZMMAn/eQ6Ydt/T5wZib85igQ/Bz40v1lmBrhB9kB4Y9dn4
 qIQSl2hSLt0BS2BKuEZpXmxUg7F+yP0mnNlCgnIG3QICZ0/TQ+/SVv5
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 62Owm_uC15uOmmKeuwqF045-KKn226KO
X-Proofpoint-ORIG-GUID: 62Owm_uC15uOmmKeuwqF045-KKn226KO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150000
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

In addition, move mode_changed() to dpu_crtc as encoder no longer has
access to topology information

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
[quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

---
Changes in v6:
- Added note on duplicated checks in dpu_encoder_needs_modeset() and
  dpu_encoder_update_topology() (Dmitry)

Changes in v5:
- Reordered to prevent breaking CI and upon partial applciation
- Moved mode_changed() from dpu_encoder to dpu_crtc
- Dropped dpu_encoder_needs_dsc_merge() refactor to clean up commit
- In dpu_encoder_update_topology(), grab DSC config using dpu_encoder
  helper as dpu_encoder->dsc hasn't been set yet
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  79 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 176 +++++++++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  19 +--
 5 files changed, 147 insertions(+), 140 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 90fc94d1a2b3..79fdee54716b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1231,6 +1231,50 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 }
 
 #define MAX_CHANNELS_PER_CRTC 2
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
+	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
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
 
 static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 				     struct drm_crtc_state *crtc_state)
@@ -1243,6 +1287,8 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 	struct dpu_global_state *global_state;
 	struct dpu_crtc_state *cstate;
 	struct drm_encoder *drm_enc;
+	struct msm_display_topology topology;
+	int ret;
 
 	/*
 	 * For now, grab the first encoder in the crtc state as we don't
@@ -1251,13 +1297,24 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		break;
 
+	/*
+	 * Release and Allocate resources on every modeset
+	 */
 	global_state = dpu_kms_get_global_state(crtc_state->state);
 	if (IS_ERR(global_state))
 		return PTR_ERR(global_state);
 
+	dpu_rm_release(global_state, drm_enc);
+
 	if (!crtc_state->enable)
 		return 0;
 
+	topology = dpu_crtc_get_topology(crtc, dpu_kms, crtc_state);
+	ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
+			     drm_enc, crtc_state, &topology);
+	if (ret)
+		return ret;
+
 	cstate = to_dpu_crtc_state(crtc_state);
 
 	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
@@ -1287,6 +1344,28 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 	return 0;
 }
 
+/**
+ * dpu_crtc_check_mode_changed: check if full modeset is required
+ * @crtc_state:	Corresponding CRTC state to be checked
+ *
+ * Check if the changes in the object properties demand full mode set.
+ */
+int dpu_crtc_check_mode_changed(struct drm_crtc_state *crtc_state)
+{
+	struct drm_encoder *drm_enc;
+	struct drm_crtc *crtc = crtc_state->crtc;
+
+	DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
+
+	/* there might be cases where encoder needs a modeset too */
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
+		if (dpu_encoder_needs_modeset(drm_enc, crtc_state->state))
+			crtc_state->mode_changed = true;
+	}
+
+	return 0;
+}
+
 static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		struct drm_atomic_state *state)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 0b148f3ce0d7..51a3b5fc879a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -239,6 +239,8 @@ static inline int dpu_crtc_frame_pending(struct drm_crtc *crtc)
 	return crtc ? atomic_read(&to_dpu_crtc(crtc)->frame_pending) : -EINVAL;
 }
 
+int dpu_crtc_check_mode_changed(struct drm_crtc_state *crtc_state);
+
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en);
 
 void dpu_crtc_vblank_callback(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d6ca499cef18..924d5600bd60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -58,8 +58,6 @@
 
 #define IDLE_SHORT_TIMEOUT	1
 
-#define MAX_HDISPLAY_SPLIT 1080
-
 /* timeout in frames waiting for frame done */
 #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
 
@@ -622,7 +620,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
+	/* See dpu_crtc_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
 		num_dsc = 2;
 
@@ -647,153 +645,92 @@ struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 	return NULL;
 }
 
-static struct msm_display_topology dpu_encoder_get_topology(
-			struct dpu_encoder_virt *dpu_enc,
-			struct drm_display_mode *mode,
-			struct drm_crtc_state *crtc_state,
-			struct drm_connector_state *conn_state)
+void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
+				 struct msm_display_topology *topology,
+				 struct drm_atomic_state *state,
+				 const struct drm_display_mode *adj_mode)
 {
-	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
-	struct msm_display_info *disp_info = &dpu_enc->disp_info;
-	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
-	struct drm_dsc_config *dsc = dpu_encoder_get_dsc_config(&dpu_enc->base);
-	struct msm_display_topology topology = {0};
-	int i, intf_count = 0;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct msm_display_info *disp_info;
+	struct drm_framebuffer *fb;
+	struct msm_drm_private *priv;
+	struct drm_dsc_config *dsc;
+
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
+			topology->num_intf++;
 
-	topology.num_intf = intf_count;
+	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
 	if (dsc) {
-		/*
-		 * In case of Display Stream Compression (DSC), we would use
-		 * 2 DSC encoders, 2 layer mixers and 1 interface
-		 * this is power optimal and can drive up to (including) 4k
-		 * screens
-		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
-		topology.num_intf = 1;
+		topology->num_dsc = 2;
+		topology->num_intf = 1;
 	}
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
+	if (!connector)
+		return;
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return;
+
+	disp_info = &dpu_enc->disp_info;
+
+	priv = drm_enc->dev->dev_private;
+
 	/*
 	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
 	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
 	 * earlier.
 	 */
 	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
-		struct drm_framebuffer *fb;
-
 		fb = conn_state->writeback_job->fb;
 
 		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
-			topology.needs_cdm = true;
+			topology->needs_cdm = true;
 	} else if (disp_info->intf_type == INTF_DP) {
-		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], mode))
-			topology.needs_cdm = true;
+		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
+			topology->needs_cdm = true;
 	}
-
-	return topology;
 }
 
-/**
- * dpu_encoder_virt_check_mode_changed: check if full modeset is required
- * @drm_enc:    Pointer to drm encoder structure
- * @crtc_state:	Corresponding CRTC state to be checked
- * @conn_state: Corresponding Connector's state to be checked
- *
- * Check if the changes in the object properties demand full mode set.
- */
-int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
+bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
 {
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_framebuffer *fb;
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	struct msm_display_topology topology;
-
-	DPU_DEBUG_ENC(dpu_enc, "\n");
-
-	/* Using mode instead of adjusted_mode as it wasn't computed yet */
-	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
-
-	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
-	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
-
-	return 0;
-}
-
-static int dpu_encoder_virt_atomic_check(
-		struct drm_encoder *drm_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
-{
-	struct dpu_encoder_virt *dpu_enc;
-	struct msm_drm_private *priv;
-	struct dpu_kms *dpu_kms;
-	struct drm_display_mode *adj_mode;
-	struct msm_display_topology topology;
-	struct dpu_global_state *global_state;
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
 
-	priv = drm_enc->dev->dev_private;
-	dpu_kms = to_dpu_kms(priv->kms);
-	adj_mode = &crtc_state->adjusted_mode;
-	global_state = dpu_kms_get_global_state(crtc_state->state);
-	if (IS_ERR(global_state))
-		return PTR_ERR(global_state);
+	if (!drm_enc || !state)
+		return false;
 
-	trace_dpu_enc_atomic_check(DRMID(drm_enc));
+	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
+	if (!connector)
+		return false;
 
-	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
 
-	/*
-	 * Release and Allocate resources on every modeset
+	/**
+	 * These checks are duplicated from dpu_encoder_update_topology() since
+	 * CRTC and encoder don't hold topology information
 	 */
-	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-		dpu_rm_release(global_state, drm_enc);
-
-		if (crtc_state->enable)
-			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, &topology);
+	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
+		fb = conn_state->writeback_job->fb;
+		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb))) {
+			if (!dpu_enc->cur_master->hw_cdm)
+				return true;
+		} else {
+			if (dpu_enc->cur_master->hw_cdm)
+				return true;
+		}
 	}
 
-	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
-
-	return ret;
+	return false;
 }
 
 static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
@@ -2615,7 +2552,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
 	.atomic_disable = dpu_encoder_virt_atomic_disable,
 	.atomic_enable = dpu_encoder_virt_atomic_enable,
-	.atomic_check = dpu_encoder_virt_atomic_check,
 };
 
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index da133ee4701a..b0ac10ebd02c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -80,6 +80,13 @@ int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
 
 bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
 
+void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
+				 struct msm_display_topology *topology,
+				 struct drm_atomic_state *state,
+				 const struct drm_display_mode *adj_mode);
+
+bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state);
+
 void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
 		struct drm_writeback_job *job);
 
@@ -88,8 +95,4 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
-int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state);
-
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5ce06e25990c..c6b3b2e147b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -449,24 +449,11 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
 static int dpu_kms_check_mode_changed(struct msm_kms *kms, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *new_crtc_state;
-	struct drm_connector *connector;
-	struct drm_connector_state *new_conn_state;
+	struct drm_crtc *crtc;
 	int i;
 
-	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
-		struct drm_encoder *encoder;
-
-		WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
-
-		if (!new_conn_state->crtc || !new_conn_state->best_encoder)
-			continue;
-
-		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
-
-		encoder = new_conn_state->best_encoder;
-
-		dpu_encoder_virt_check_mode_changed(encoder, new_crtc_state, new_conn_state);
-	}
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
+		dpu_crtc_check_mode_changed(new_crtc_state);
 
 	return 0;
 }

-- 
2.48.1

