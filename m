Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5357B68DAEF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 15:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C5410E52E;
	Tue,  7 Feb 2023 14:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5A510E52E;
 Tue,  7 Feb 2023 14:30:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317Dtr40015974; Tue, 7 Feb 2023 14:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=GwcZMBJ+t9sh8tBQ7PFQ+Eh5/Zaszc1egC6gMYlmjmk=;
 b=NOzW+4otNduEsl83UtEZchssWkVuqafyXV/x+032luxEkheA+qehj56FU9sPTL7Dfg6V
 IyNym39XdRn5Ho4H8Hfdr/CCc7+r5X9pAk65k5lQw8MY2liCattuvjG2gsvMWyJT7vGl
 QWzrZ3yQNyFvzjOEJazoJ8lpMWCP+WRvHJo8GoCSdDTak3r+FTAUZx+VdPs3br3tK4fG
 sYQN6IZusS5ZSNzHcY387qG3Ro5pA+aV8NaJatMS0a69QjXHIPWgBSfm36XBxwPnNFIL
 Aclyu+36jAyfqQdkuJ2b8w1cvo6hFiFumqzpnjp+B9FY/LRKwmmSHlQk5qHz7QvJUUty fA== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkk0dgqar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 14:30:09 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 317EU40p003191; 
 Tue, 7 Feb 2023 14:30:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3nhgeke6f8-1;
 Tue, 07 Feb 2023 14:30:04 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317EU4bO003174;
 Tue, 7 Feb 2023 14:30:04 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 317EU44Z003162;
 Tue, 07 Feb 2023 14:30:04 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 8B29B4BDD; Tue,  7 Feb 2023 06:30:03 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] drm/msm/dpu: reserve the resources on topology change
Date: Tue,  7 Feb 2023 06:29:56 -0800
Message-Id: <1675780196-3076-5-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1675780196-3076-1-git-send-email-quic_kalyant@quicinc.com>
References: <1675780196-3076-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 80fGcj61k9ziaqQf2A0Y29FZpsBY9Nno
X-Proofpoint-ORIG-GUID: 80fGcj61k9ziaqQf2A0Y29FZpsBY9Nno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_06,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070129
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

Some features like CTM can be enabled dynamically. Release
and reserve the DPU resources whenever a topology change
occurs such that required hw blocks are allocated appropriately.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
Changes in v1:
- Avoid mode_set call directly (Dmitry)

Changes in v2:
- Minor nits (Dmitry)
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 ++++++++++++++++++++++-----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 539b68b..85bd5645 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -204,6 +204,7 @@ struct dpu_crtc {
  * @hw_ctls       : List of active ctl paths
  * @crc_source    : CRC source
  * @crc_frame_skip_count: Number of frames skipped before getting CRC
+ * @ctm_enabled   : Cached color management enablement state
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
index 3920efd..7bb4840 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -217,6 +217,22 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+static bool _dpu_enc_is_dspp_changed(struct drm_crtc_state *crtc_state,
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
@@ -642,14 +658,15 @@ static int dpu_encoder_virt_atomic_check(
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
 
+	_dpu_enc_is_dspp_changed(crtc_state, topology);
+
 	/*
 	 * Release and Allocate resources on every modeset
-	 * Dont allocate when active is false.
 	 */
 	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 		dpu_rm_release(global_state, drm_enc);
 
-		if (!crtc_state->active_changed || crtc_state->active)
+		if (crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
 					drm_enc, crtc_state, topology);
 	}
@@ -1022,7 +1039,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_pp, num_dsc;
+	int num_lm, num_ctl, num_pp, num_dsc, num_dspp;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1053,7 +1070,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
-	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
 		ARRAY_SIZE(hw_dspp));
 
@@ -1084,7 +1101,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	}
 
 	cstate->num_mixers = num_lm;
-
+	cstate->ctm_enabled = !!num_dspp;
 	dpu_enc->connector = conn_state->connector;
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-- 
2.7.4

