Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA08A216B0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 04:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5454D10E73D;
	Wed, 29 Jan 2025 03:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JuHcR/yt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5851C10E735;
 Wed, 29 Jan 2025 03:21:16 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2hLw6026851;
 Wed, 29 Jan 2025 03:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 psvM7kgECixb/F+vLdjprHZ+gS7EjJa1GBdIvq0y9Uc=; b=JuHcR/ytr7s4NZ9O
 SvvgIaN15FKxWRav/MdPb0Yz6D6U0Nj4ukgfl+la9U7mIiBUCW3ScAXe9g3IodXu
 FrVJvK/AtZTTe+4Px6Bzfw8Y3fC2o693cUg34SglndlkXzmmxZdLz0rle4a9PVrp
 T/TMEYf1+XSyR2UMduM2VtK+mRcen24aBZY4fYb1+hfBSYX+czsptDYg8CtfzUae
 SnbohuOd7RgrYaH+fQ5DdNt7Jt7voCWBTNh1wy7J+7OVCyvoih153pZtxv2iTDmi
 B0DlUyJmQ6XUlSNCmBjUoOxNoRF1Gxu9ESu+YEGarQKUYpLPYEeCPffnauSXUXaV
 PoeQ2g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f54dgsc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:21:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T3L6f4023631
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:21:06 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 19:21:05 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 28 Jan 2025 19:20:33 -0800
Subject: [PATCH v5 01/14] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-concurrent-wb-v5-1-6464ca5360df@quicinc.com>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
In-Reply-To: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
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
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738120865; l=5787;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=RPq6PTUm6LpSxG+EGUTAQtLAK4m/tJTQoNnORYeTbns=;
 b=VFy2DWiA+G8B7ZXSBZ1FBx/H5r99pbEDTTKmcB+h+rQ6GYs4EQPeIOxCLHfkyEUxj9KMDIGlm
 ylUfLt86/GQDq0wQ2vGuGS1TnSDtp/4TiNl+E2dDQTd6aMePAoTz912
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lN445K0JdTyQpDuKk1jrsHgkZyyjd_Jh
X-Proofpoint-ORIG-GUID: lN445K0JdTyQpDuKk1jrsHgkZyyjd_Jh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=832
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290025
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

Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
from dpu_crtc_assign_resources().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[quic_abhinavk@quicinc.com: cleaned up formatting]
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v5:
- Reordered to prevent breaking CI or upon partial application
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 66 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 37 ----------------
 2 files changed, 66 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 29485e76f531fad765d586612528cf3f0c9e7a89..505827174a685617bfa6fb5c790670c80a3f6101 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1230,6 +1230,66 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 	return ret;
 }
 
+#define MAX_CHANNELS_PER_CRTC 2
+
+static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
+				     struct drm_crtc_state *crtc_state)
+{
+	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_CRTC];
+	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_CRTC];
+	int i, num_lm, num_ctl, num_dspp;
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	struct dpu_global_state *global_state;
+	struct dpu_crtc_state *cstate;
+	struct drm_encoder *drm_enc;
+
+	if (!crtc_state->encoder_mask)
+		return 0;
+
+	/*
+	 * For now, grab the first encoder in the crtc state as we don't
+	 * support clone mode yet
+	 */
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
+		break;
+
+	global_state = dpu_kms_get_global_state(crtc_state->state);
+	if (IS_ERR(global_state))
+		return PTR_ERR(global_state);
+
+	if (!crtc_state->enable)
+		return 0;
+
+	cstate = to_dpu_crtc_state(crtc_state);
+
+	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+						drm_enc->base.id,
+						DPU_HW_BLK_CTL, hw_ctl,
+						ARRAY_SIZE(hw_ctl));
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+					       drm_enc->base.id,
+					       DPU_HW_BLK_LM, hw_lm,
+					       ARRAY_SIZE(hw_lm));
+	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+						 drm_enc->base.id,
+						 DPU_HW_BLK_DSPP, hw_dspp,
+						 ARRAY_SIZE(hw_dspp));
+
+	for (i = 0; i < num_lm; i++) {
+		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
+
+		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
+		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
+		if (i < num_dspp)
+			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+	}
+
+	cstate->num_mixers = num_lm;
+
+	return 0;
+}
+
 static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		struct drm_atomic_state *state)
 {
@@ -1245,6 +1305,12 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		rc = dpu_crtc_assign_resources(crtc, crtc_state);
+		if (rc < 0)
+			return rc;
+	}
+
 	if (dpu_use_virtual_planes &&
 	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
 		rc = dpu_crtc_reassign_planes(crtc, crtc_state);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a24fedb5ba4f1c84777b71c669bac0241acdd421..84e6a5ad4a1edd4ef5f3ed82500c99068e0645ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -719,40 +719,6 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	return topology;
 }
 
-static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
-					      struct drm_encoder *drm_enc,
-					      struct dpu_global_state *global_state,
-					      struct drm_crtc_state *crtc_state)
-{
-	struct dpu_crtc_state *cstate;
-	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_dspp, i;
-
-	cstate = to_dpu_crtc_state(crtc_state);
-
-	memset(cstate->mixers, 0, sizeof(cstate->mixers));
-
-	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
-	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
-	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
-		ARRAY_SIZE(hw_dspp));
-
-	for (i = 0; i < num_lm; i++) {
-		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
-
-		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
-		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
-	}
-
-	cstate->num_mixers = num_lm;
-}
-
 /**
  * dpu_encoder_virt_check_mode_changed: check if full modeset is required
  * @drm_enc:    Pointer to drm encoder structure
@@ -823,9 +789,6 @@ static int dpu_encoder_virt_atomic_check(
 		if (crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
 					drm_enc, crtc_state, &topology);
-		if (!ret)
-			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
-							  global_state, crtc_state);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);

-- 
2.34.1

