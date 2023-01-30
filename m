Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF16814D9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 16:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1220010E280;
	Mon, 30 Jan 2023 15:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9C089711;
 Mon, 30 Jan 2023 15:21:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30UEbeT6032076; Mon, 30 Jan 2023 15:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=/ePCxqBnxFe/fpczWR/KMLWZ0/uwNVcq/CIDg/GAN1E=;
 b=Z57dJrG5WWwHp8FFHkt1pPwEZAL6cIigWFqcly9noL3GwTIHx/Vd8AhRQPVlQQUpY37Z
 4uCW9IhuWQWcHsuEEqHn7Zyp4jl9Netdp3g/umymB4n+khdmmeLEKLzNAitjqSgYdqaH
 ulLyDAKFZHW2UsEJphF3lkk5siiuuHsgXpOZfrO19hVTruDeaqBCTprNmeiheo858Cu3
 sp0xhCtr7I9SiEOJc6cTXqDe0dEsdeqIz9VAkGA9STuZS/xbVYW0GBu2WM3QmJex6eBl
 LDozd3MWER+enhWrIlZW/fTU0JbV2VxJw6hUnuIvJtuKqyy6x0+VAFwhMYJ3wzUWr5Gi Lw== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ncw0g3t55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 15:21:41 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30UFLbjS027562; 
 Mon, 30 Jan 2023 15:21:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3ncvsk4n41-1;
 Mon, 30 Jan 2023 15:21:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30UFLbS4027542;
 Mon, 30 Jan 2023 15:21:37 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 30UFLax8027538;
 Mon, 30 Jan 2023 15:21:37 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id E850C4BAB; Mon, 30 Jan 2023 07:21:36 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1 3/3] drm/msm/disp/dpu1: reserve the resources on topology change
Date: Mon, 30 Jan 2023 07:21:32 -0800
Message-Id: <1675092092-26412-4-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1t-b9xBGoUXOY-h4_6zHCcT2Ci0s4SWD
X-Proofpoint-ORIG-GUID: 1t-b9xBGoUXOY-h4_6zHCcT2Ci0s4SWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_14,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 mlxlogscore=938
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301300148
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

Changes in v1:
- Avoid mode_set call directly instead change the mode_changed (Dmitry)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++-
 3 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 539b68b..58e8c72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -204,6 +204,7 @@ struct dpu_crtc {
  * @hw_ctls       : List of active ctl paths
  * @crc_source    : CRC source
  * @crc_frame_skip_count: Number of frames skipped before getting CRC
+ * @ctm_enabled   : Cached ctm reservation state
  */
 struct dpu_crtc_state {
 	struct drm_crtc_state base;
@@ -225,6 +226,7 @@ struct dpu_crtc_state {
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
+	bool ctm_enabled;
 };
 
 #define to_dpu_crtc_state(x) \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3bd46b4..0ddf2c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -217,6 +217,22 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+static bool _dpu_enc_is_dspps_changed(struct drm_crtc_state *crtc_state,
+	struct msm_display_topology topology)
+{
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+
+	if (drm_atomic_crtc_needs_modeset(crtc_state))
+		return true;
+
+	if ((cstate->ctm_enabled && !topology.num_dspp) ||
+	    (!cstate->ctm_enabled && topology.num_dspp)) {
+		crtc_state->mode_changed = true;
+		return true;
+	}
+
+	return false;
+}
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
@@ -638,25 +654,21 @@ static int dpu_encoder_virt_atomic_check(
 		if (ret) {
 			DPU_ERROR_ENC(dpu_enc,
 					"mode unsupported, phys idx %d\n", i);
-			break;
+			return ret;
 		}
 	}
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
 
+	_dpu_enc_is_dspps_changed(crtc_state, topology);
+
 	/* Reserve dynamic resources now. */
-	if (!ret) {
-		/*
-		 * Release and Allocate resources on every modeset
-		 * Dont allocate when active is false.
-		 */
-		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-			dpu_rm_release(global_state, drm_enc);
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		dpu_rm_release(global_state, drm_enc);
 
-			if (!crtc_state->active_changed || crtc_state->active)
-				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-						drm_enc, crtc_state, topology);
-		}
+		if (crtc_state->enable)
+			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
+					drm_enc, crtc_state, topology);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
@@ -1027,7 +1039,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_pp, num_dsc;
+	int num_lm, num_ctl, num_pp, num_dsc, num_dspp;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1058,7 +1070,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
-	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
 		ARRAY_SIZE(hw_dspp));
 
@@ -1089,7 +1101,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	}
 
 	cstate->num_mixers = num_lm;
-
+	cstate->ctm_enabled = !!num_dspp;
 	dpu_enc->connector = conn_state->connector;
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
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
-- 
2.7.4

