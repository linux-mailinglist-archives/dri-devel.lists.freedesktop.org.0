Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF1A6784CA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA46894EA;
	Mon, 23 Jan 2023 18:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280D910E541;
 Mon, 23 Jan 2023 18:25:16 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NESboY021523; Mon, 23 Jan 2023 18:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=LCkNhE5YReZZLDM45+VvJIjTTt6jg624wFRIsYsBBgM=;
 b=Z0vyeK4ef50GqgIxQ7MwhJtMJuMEyeZuzKo7+oyNZ2v0AlbBav88aEL3ENgn4fX0AzVy
 NozabcPbttY6VIrFgYc5a2HJ3u5ESbOOap5hGjYRbCdf2wwt57/Q8VayRWZqz+yNhU+K
 kfBjfkUpJ2UuAnnLaukGTRt08eSqjk3ADiXkbzQxBmixxFmNOykJ06iKz5S+nB3Pzw1l
 ntxFgauRyZk2CGIxGszYUSUVVpomFTtbdU4r/9cauX2Z7t45S5jSDa3FUcnRnd3eV8wE
 WrqvU0RS7NLVjNYidQH6vtGUS8gsCxOMydsnDcKMiUXebQNckzil2sFJNi1eSXG9fxHP CQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89htuhkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:25:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NIP81Z003617
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:25:08 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 10:25:07 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 13/14] drm/msm/disp/dpu1: add dsc supporting functions to
 dpu encoder
Date: Mon, 23 Jan 2023 10:24:33 -0800
Message-ID: <1674498274-6010-14-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BF8xfKjsi7WR6QMxdogYlQxQsJI_suFC
X-Proofpoint-GUID: BF8xfKjsi7WR6QMxdogYlQxQsJI_suFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230177
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since display Port is an external peripheral, runtime compression
detection is added to handle plug in and unplugged events. Currently
only DSC compression supported. Once DSC compression detected, topology
is static added and used to allocate system resources to accommodate
DSC requirement. DSC related parameters are calculated and committed to
DSC encoder. Also compression information are propagated to phy and
committed to timing engine at video mode. This patch completes DSC
implementation.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 314 ++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  34 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  10 +-
 5 files changed, 292 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d2625b3..d7f5f93 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -15,6 +15,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_bridge.h>
 
 #include "msm_drv.h"
 #include "dpu_kms.h"
@@ -30,6 +31,7 @@
 #include "dpu_crtc.h"
 #include "dpu_trace.h"
 #include "dpu_core_irq.h"
+#include "dpu_dsc_helper.h"
 #include "disp/msm_disp_snapshot.h"
 
 #define DPU_DEBUG_ENC(e, fmt, ...) DRM_DEBUG_ATOMIC("enc%d " fmt,\
@@ -542,12 +544,12 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
 
-static struct msm_display_topology dpu_encoder_get_topology(
+static void dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
-			struct drm_display_mode *mode)
+			struct drm_display_mode *mode,
+			struct msm_display_topology *topology)
 {
-	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
@@ -567,19 +569,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	 * sufficient number
 	 */
 	if (intf_count == 2)
-		topology.num_lm = 2;
+		topology->num_lm = 2;
 	else if (!dpu_kms->catalog->caps->has_3d_merge)
-		topology.num_lm = 1;
+		topology->num_lm = 1;
 	else
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+		topology->num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
 	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
 		if (dpu_kms->catalog->dspp &&
-			(dpu_kms->catalog->dspp_count >= topology.num_lm))
-			topology.num_dspp = topology.num_lm;
+			(dpu_kms->catalog->dspp_count >= topology->num_lm))
+			topology->num_dspp = topology->num_lm;
 	}
 
-	topology.num_intf = intf_count;
+	topology->num_intf = intf_count;
 
 	if (dpu_enc->dsc) {
 		/*
@@ -588,12 +590,31 @@ static struct msm_display_topology dpu_encoder_get_topology(
 		 * this is power optimal and can drive up to (including) 4k
 		 * screens
 		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
-		topology.num_intf = 1;
+		topology->num_dsc = 2;
+		topology->num_intf = 1;
+		topology->num_lm = 2;
 	}
 
-	return topology;
+	/*
+	 * default topology for display port DSC implementation.
+	 * TODO:
+	 *	change to runtime resource calculation
+	 */
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS) {
+		topology->num_dsc = 0;
+		topology->num_intf = intf_count;
+
+		if (dpu_enc->comp_info) {
+			/* In case of Display Stream Compression (DSC), we would use
+			 * 2 encoders, 2 layer mixers and 1 interface
+			 * this is power optimal and can drive up to (including) 4k
+			 * screens
+			 */
+			topology->num_dsc = 1;
+			topology->num_intf = 1;
+			topology->num_lm = 1;
+		}
+	}
 }
 
 static int dpu_encoder_virt_atomic_check(
@@ -605,7 +626,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode *adj_mode;
-	struct msm_display_topology topology;
+	struct msm_display_topology *topology;
 	struct dpu_global_state *global_state;
 	int i = 0;
 	int ret = 0;
@@ -642,7 +663,27 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
+	/*
+	 * For display port, at this moment we know panel had been plugged in
+	 * and dsc supported is detected.
+	 * however we do not know the details of resolution will be used
+	 * until mode_set had been done.
+	 *
+	 * use default topology to reserve system resource for dsc
+	 *
+	 * TODO: run time calculation of topology instead of hardcode it now
+	 */
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS) {
+		struct drm_bridge *bridge;
+
+		if (!dpu_enc->comp_info) {
+			bridge = drm_bridge_chain_get_first_bridge(drm_enc);
+			dpu_enc->comp_info = msm_dp_bridge_get_compression(bridge);
+		}
+	}
+
+	topology = &dpu_enc->topology;
+	dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, topology);
 
 	/* Reserve dynamic resources now. */
 	if (!ret) {
@@ -655,7 +696,7 @@ static int dpu_encoder_virt_atomic_check(
 
 			if (!crtc_state->active_changed || crtc_state->active)
 				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-						drm_enc, crtc_state, topology);
+						drm_enc, crtc_state, *topology);
 		}
 	}
 
@@ -1009,7 +1050,37 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 
 		if (phys->ops.cleanup_wb_job)
 			phys->ops.cleanup_wb_job(phys, job);
+	}
+}
+
+static void dpu_encoder_populate_encoder_phys(struct drm_encoder *drm_enc,
+					struct dpu_encoder_virt *dpu_enc)
+{
+	struct msm_compression_info *comp_info;
+	struct msm_display_dsc_info *dsc_info;
+	int i;
+
+	if (!dpu_enc->comp_info)
+		return;
+
+	comp_info = dpu_enc->comp_info;
+	dsc_info = &comp_info->msm_dsc_info;
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (!phys)
+			continue;
+
+		phys->comp_type = comp_info->comp_type;
+		phys->comp_ratio = comp_info->comp_ratio;
 
+		if (phys->comp_type == MSM_DISPLAY_COMPRESSION_DSC) {
+			phys->dsc_extra_pclk_cycle_cnt = dsc_info->pclk_per_line;
+			phys->dsc_extra_disp_width = dsc_info->extra_width;
+			phys->dce_bytes_per_line =
+				dsc_info->bytes_per_pkt * dsc_info->pkt_per_line;
+		}
 	}
 }
 
@@ -1050,6 +1121,24 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
+	/*
+	 * For display port, msm_dp_bridge_mode_set() will conver panel info
+	 * into dp_mode. This including detail dsc information if it is enabled.
+	 * after that, msm_dp_bridge_get_compression() will return detail
+	 * dsc compression info
+	 */
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS) {
+		struct drm_display_mode *mode, *adjusted_mode;
+		struct drm_bridge *bridge;
+
+		mode = &crtc_state->mode;
+		adjusted_mode = &crtc_state->adjusted_mode;
+		bridge = drm_bridge_chain_get_first_bridge(drm_enc);
+		msm_dp_bridge_mode_set(bridge, mode, adjusted_mode);
+
+		dpu_enc->comp_info = msm_dp_bridge_get_compression(bridge);
+	}
+
 	/* Query resource that have been reserved in atomic check step. */
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
@@ -1061,19 +1150,18 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
 		ARRAY_SIZE(hw_dspp));
+	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_DSC,
+		hw_dsc, ARRAY_SIZE(hw_dsc));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
 						: NULL;
 
-	if (dpu_enc->dsc) {
-		num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-							drm_enc->base.id, DPU_HW_BLK_DSC,
-							hw_dsc, ARRAY_SIZE(hw_dsc));
-		for (i = 0; i < num_dsc; i++) {
-			dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
-			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
-		}
+	for (i = 0; i < num_dsc; i++) {
+		dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
+		dpu_enc->hw_pp[i]->dsc = dpu_enc->hw_dsc[i]; /* bind dsc to pp */
+		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
 	dpu_enc->dsc_mask = dsc_mask;
@@ -1110,10 +1198,22 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_pp = dpu_enc->hw_pp[i];
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
+		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
+			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
+
+		/* phys->hw_intf populated at dpu_encoder_setup_display() */
+		if (!phys->hw_intf) {
+			DPU_ERROR_ENC(dpu_enc,
+				"no intf block assigned at idx: %d\n", i);
+			return;
+		}
+
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)
 			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
 	}
+
+	dpu_encoder_populate_encoder_phys(drm_enc, dpu_enc);
 }
 
 static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
@@ -1208,6 +1308,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
+static void dpu_encoder_unprep_dsc(struct dpu_encoder_virt *dpu_enc);
+
 static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
@@ -1233,6 +1335,10 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 			phys->ops.disable(phys);
 	}
 
+	if (dpu_enc->comp_info && (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS)) {
+		dpu_encoder_unprep_dsc(dpu_enc);
+		dpu_enc->comp_info = NULL;
+	}
 
 	/* after phys waits for frame-done, should be no more frames pending */
 	if (atomic_xchg(&dpu_enc->frame_done_timeout_ms, 0)) {
@@ -1795,40 +1901,16 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
 			nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
 }
 
-static u32
-dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
-				  u32 enc_ip_width)
-{
-	int ssm_delay, total_pixels, soft_slice_per_enc;
-
-	soft_slice_per_enc = enc_ip_width / dsc->slice_width;
-
-	/*
-	 * minimum number of initial line pixels is a sum of:
-	 * 1. sub-stream multiplexer delay (83 groups for 8bpc,
-	 *    91 for 10 bpc) * 3
-	 * 2. for two soft slice cases, add extra sub-stream multiplexer * 3
-	 * 3. the initial xmit delay
-	 * 4. total pipeline delay through the "lock step" of encoder (47)
-	 * 5. 6 additional pixels as the output of the rate buffer is
-	 *    48 bits wide
-	 */
-	ssm_delay = ((dsc->bits_per_component < 10) ? 84 : 92);
-	total_pixels = ssm_delay * 3 + dsc->initial_xmit_delay + 47;
-	if (soft_slice_per_enc > 1)
-		total_pixels += (ssm_delay * 3);
-	return DIV_ROUND_UP(total_pixels, dsc->slice_width);
-}
-
 static void dpu_encoder_dsc_pipe_cfg(struct dpu_encoder_virt *dpu_enc,
 				     struct dpu_hw_dsc *hw_dsc,
 				     struct dpu_hw_pingpong *hw_pp,
-				     struct drm_dsc_config *dsc,
+				     struct msm_display_dsc_info *dsc_info,
 				     u32 common_mode,
 				     u32 initial_lines)
 {
 	struct dpu_encoder_phys *cur_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl;
+	struct drm_dsc_config *dsc = &dsc_info->drm_dsc;
 
 	ctl = cur_master->hw_ctl;
 
@@ -1852,51 +1934,137 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_encoder_virt *dpu_enc,
 
 }
 
+static void dpu_encoder_dsc_disable(struct dpu_encoder_virt *dpu_enc,
+				     struct dpu_hw_dsc *hw_dsc,
+				     struct dpu_hw_pingpong *hw_pp)
+{
+	struct dpu_encoder_phys *cur_master = dpu_enc->cur_master;
+	struct dpu_hw_ctl *ctl;
+
+	ctl = cur_master->hw_ctl;
+
+	if (hw_dsc->ops.dsc_disable)
+		hw_dsc->ops.dsc_disable(hw_dsc);
+
+	if (hw_pp->ops.disable_dsc)
+		hw_pp->ops.disable_dsc(hw_pp);
+
+}
+
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
-				 struct drm_dsc_config *dsc)
+				 struct msm_display_dsc_info *dsc_info)
 {
 	/* coding only for 2LM, 2enc, 1 dsc config */
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	struct msm_display_topology *topology = &dpu_enc->topology;
+	enum dpu_3d_blend_mode mode_3d;
 	int this_frame_slices;
 	int intf_ip_w, enc_ip_w;
-	int dsc_common_mode;
-	int pic_width;
-	u32 initial_lines;
+	int dsc_common_mode = 0;
+	int dsc_pic_width;
+	int num_lm, num_dsc, num_intf;
+	bool dsc_merge, merge_3d, dsc_4hsmerge;
+	bool disable_merge_3d = false;
+	int ich_res;
 	int i;
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
+	}
 
-		if (!hw_pp[i] || !hw_dsc[i]) {
-			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
-			return;
-		}
+	num_lm = topology->num_lm;
+	num_dsc = topology->num_dsc;
+	num_intf = topology->num_intf;
+
+
+	mode_3d = (num_lm > num_dsc) ? BLEND_3D_H_ROW_INT : BLEND_3D_NONE;
+	merge_3d = ((mode_3d != BLEND_3D_NONE) && !(enc_master->hw_intf->cfg.split_link_en)) ?
+			true : false;
+
+	dsc_merge = ((num_dsc > num_intf) && !dsc_info->half_panel_pu &&
+			!(enc_master->hw_intf->cfg.split_link_en)) ? true : false;
+	disable_merge_3d = (merge_3d && dsc_info->half_panel_pu) ?  false : true;
+	dsc_4hsmerge = (dsc_merge && num_dsc == 4 && num_intf == 1) ?  true : false;
+
+	/*
+	 * If this encoder is driving more than one DSC encoder, they
+	 * operate in tandem, same pic dimension needs to be used by
+	 * each of them.(pp-split is assumed to be not supported)
+	 *
+	 * If encoder is driving more than 2 DSCs, each DSC pair will operate
+	 * on half of the picture in tandem.
+	 */
+	dsc_pic_width = dsc_info->drm_dsc.pic_width;
+
+	if (num_dsc > 2) {
+		dsc_pic_width /= 2;
+		dsc_info->dsc_4hsmerge_en = dsc_4hsmerge;
 	}
 
-	dsc_common_mode = 0;
-	pic_width = dsc->pic_width;
+	this_frame_slices = dsc_pic_width / dsc_info->drm_dsc.slice_width;
+	intf_ip_w = this_frame_slices * dsc_info->drm_dsc.slice_width;
+	enc_ip_w = intf_ip_w;
+
+	if (!dsc_info->half_panel_pu)
+		intf_ip_w /= num_intf;
+	if (!dsc_info->half_panel_pu && (num_dsc > 1))
+		dsc_common_mode |= DSC_MODE_SPLIT_PANEL;
+	if (dsc_merge) {
+		dsc_common_mode |= DSC_MODE_MULTIPLEX;
+		/*
+		 * in dsc merge case: when using 2 encoders for the same
+		 * stream, no. of slices need to be same on both the
+		 * encoders.
+		 */
+		enc_ip_w = intf_ip_w / 2;
+	}
 
-	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
 	if (enc_master->intf_mode == INTF_MODE_VIDEO)
 		dsc_common_mode |= DSC_MODE_VIDEO;
 
-	this_frame_slices = pic_width / dsc->slice_width;
-	intf_ip_w = this_frame_slices * dsc->slice_width;
+	dsc_info->num_active_ss_per_enc = dsc_info->drm_dsc.slice_count;
+
+	if (dsc_info->dsc_4hsmerge_en)
+		dsc_info->num_active_ss_per_enc = dsc_info->drm_dsc.slice_count >> 2;
+	else if ((dsc_common_mode & DSC_MODE_MULTIPLEX) || (dsc_info->half_panel_pu))
+		dsc_info->num_active_ss_per_enc = dsc_info->drm_dsc.slice_count >> 1;
+
+	dpu_dsc_populate_dsc_private_params(dsc_info, intf_ip_w);
+
+	dpu_dsc_initial_line_calc(dsc_info, enc_ip_w, dsc_common_mode);
 
 	/*
 	 * dsc merge case: when using 2 encoders for the same stream,
 	 * no. of slices need to be same on both the encoders.
 	 */
-	enc_ip_w = intf_ip_w / 2;
-	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
+	ich_res = dpu_dsc_ich_reset_override_needed(dsc_info->half_panel_pu, dsc_info);
+
+	for (i = 0; i < num_dsc; i++) {
+		dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc_info,
+					dsc_common_mode, 0);
+	}
+}
+
+static void dpu_encoder_unprep_dsc(struct dpu_encoder_virt *dpu_enc)
+{
+	/* coding only for 2LM, 2enc, 1 dsc config */
+	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	struct msm_display_topology *topology = &dpu_enc->topology;
+	int i, num_dsc;
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
-		dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
-					dsc_common_mode, initial_lines);
+		hw_pp[i] = dpu_enc->hw_pp[i];
+		hw_dsc[i] = dpu_enc->hw_dsc[i];
 	}
+
+	num_dsc = topology->num_dsc;
+
+	for (i = 0; i < num_dsc; i++)
+		dpu_encoder_dsc_disable(dpu_enc, hw_dsc[i], hw_pp[i]);
 }
 
 void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
@@ -1904,6 +2072,7 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 	struct dpu_encoder_virt *dpu_enc;
 	struct dpu_encoder_phys *phys;
 	bool needs_hw_reset = false;
+	bool needs_phy_enable = false;
 	unsigned int i;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
@@ -1918,6 +2087,9 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 			phys->ops.prepare_for_kickoff(phys);
 		if (phys->enable_state == DPU_ENC_ERR_NEEDS_HW_RESET)
 			needs_hw_reset = true;
+
+		if (phys->enable_state == DPU_ENC_ENABLING)
+			needs_phy_enable = true;
 	}
 	DPU_ATRACE_END("enc_prepare_for_kickoff");
 
@@ -1931,8 +2103,10 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 		}
 	}
 
-	if (dpu_enc->dsc)
-		dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
+	if (needs_phy_enable && dpu_enc->comp_info)
+		dpu_encoder_prep_dsc(dpu_enc, &dpu_enc->comp_info->msm_dsc_info);
+
+
 }
 
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
@@ -2295,7 +2469,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				dpu_kms->catalog->caps->has_idle_pc;
 
 	dpu_enc->comp_info = disp_info->comp_info;
-	if (dpu_enc->comp_info)
+	if (dpu_enc->comp_info && dpu_enc->comp_info->enabled)
 		dpu_enc->dsc = &dpu_enc->comp_info->msm_dsc_info.drm_dsc;
 
 	mutex_lock(&dpu_enc->enc_lock);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 0569b36..ae4f6a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
  */
 
@@ -202,6 +202,9 @@ struct dpu_encoder_phys {
 	int irq[INTR_IDX_MAX];
 	enum msm_display_compression_type comp_type;
 	u32 comp_ratio;
+	u32 dsc_extra_pclk_cycle_cnt;
+	u32 dsc_extra_disp_width;
+	u32 dce_bytes_per_line;
 };
 
 static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 3330e185..6c7d791 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -86,6 +86,11 @@ static void drm_mode_to_intf_timing_params(
 	timing->underflow_clr = 0xff;
 	timing->hsync_skew = mode->hskew;
 
+	if (phys_enc->comp_type != MSM_DISPLAY_COMPRESSION_NONE) {
+		timing->compression_en = true;
+		timing->dce_bytes_per_line = phys_enc->dce_bytes_per_line;
+	}
+
 	/* DSI controller cannot handle active-low sync signals. */
 	if (phys_enc->hw_intf->cap->type == INTF_DSI) {
 		timing->hsync_polarity = 0;
@@ -104,14 +109,36 @@ static void drm_mode_to_intf_timing_params(
 
 	/*
 	 * for DP, divide the horizonal parameters by 2 when
-	 * widebus is enabled
+	 * widebus or compression is enabled, irrespective of
+	 * compression ratio
 	 */
-	if (phys_enc->hw_intf->cap->type == INTF_DP && timing->wide_bus_en) {
+	if (phys_enc->hw_intf->cap->type == INTF_DP &&
+		(timing->wide_bus_en || (phys_enc->comp_ratio > 1))) {
 		timing->width = timing->width >> 1;
 		timing->xres = timing->xres >> 1;
 		timing->h_back_porch = timing->h_back_porch >> 1;
 		timing->h_front_porch = timing->h_front_porch >> 1;
 		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
+
+		if (phys_enc->comp_type == MSM_DISPLAY_COMPRESSION_DSC &&
+				(phys_enc->comp_ratio > 1)) {
+			timing->extra_dto_cycles =
+					phys_enc->dsc_extra_pclk_cycle_cnt;
+			timing->width += phys_enc->dsc_extra_disp_width;
+			timing->h_back_porch +=
+					phys_enc->dsc_extra_disp_width;
+		}
+	}
+
+	/*
+	 * for DSI, if compression is enabled, then divide the horizonal active
+	 * timing parameters by compression ratio.
+	 */
+	if ((phys_enc->hw_intf->cap->type != INTF_DP) &&
+			((phys_enc->comp_type == MSM_DISPLAY_COMPRESSION_DSC))) {
+		// adjust active dimensions
+		timing->width = DIV_ROUND_UP(timing->width, phys_enc->comp_ratio);
+		timing->xres = DIV_ROUND_UP(timing->xres, phys_enc->comp_ratio);
 	}
 }
 
@@ -281,6 +308,9 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	phys_enc->hw_intf->hw_rev = phys_enc->dpu_kms->core_rev;
 
+	if (phys_enc->hw_pp->dsc)
+		intf_cfg.dsc_num = phys_enc->hw_pp->dsc->idx;
+
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
 			&timing_params, fmt);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index c002234..ee71cee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _DPU_HW_PINGPONG_H
@@ -8,6 +9,7 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
+#include "dpu_hw_dsc.h"
 
 #define DITHER_MATRIX_SZ 16
 
@@ -149,6 +151,7 @@ struct dpu_hw_pingpong {
 	enum dpu_pingpong idx;
 	const struct dpu_pingpong_cfg *caps;
 	struct dpu_hw_merge_3d *merge_3d;
+	struct dpu_hw_dsc *dsc;
 
 	/* ops */
 	struct dpu_hw_pingpong_ops ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 396429e..bb22ec8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
@@ -246,6 +247,11 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_dsc *hw;
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
+		if (dsc->id < DSC_0 || dsc->id >= DSC_MAX) {
+			DPU_ERROR("skip dsc %d with invalid id\n", dsc->id);
+			continue;
+		}
+
 		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
 		if (IS_ERR_OR_NULL(hw)) {
 			rc = PTR_ERR(hw);
@@ -535,8 +541,10 @@ static int _dpu_rm_make_reservation(
 	}
 
 	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
-	if (ret)
+	if (ret) {
+		DPU_ERROR("unable to find appropriate DSC\n");
 		return ret;
+	}
 
 	return ret;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

