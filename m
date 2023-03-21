Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A2E6C2743
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 02:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063F010E6C3;
	Tue, 21 Mar 2023 01:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE4510E6B7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:28 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j11so17185900lfg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gIZhnj34tFDqJ571tBldatObNZ/9X2iSU1FEGNAtdzI=;
 b=h2Lz8JJrX2VcM8Vh4sQrkJfCvGm0RE+pY3w2RFXg3sWRX/06kdq2rM1aOdpkX6pYLb
 P1FEnGA6G+NwVpQNHlN+mdEn3sbCksaHJOYM2LJUx/etRIWXp/o9ORAmjFUhoed2WBy4
 5ZENnpQ9A4+AK6rEiRlvOF2l3tS6nnsb0aTtosYiLt41ojcKcNWRPj+zRBfIpJaw3GIe
 G5t8jeOs5my5QajzHO5VuH8wjSRQU1QwR9CayrqRfdWp4hiq0QSSN92F/UuEvL3PMNF2
 QCTU3Bat6ecxPySBmKZcz2yuzDoiMzndRbJeqaR4aF6Tdnd82Ts6KuPOwkVEF3eyam+V
 IEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gIZhnj34tFDqJ571tBldatObNZ/9X2iSU1FEGNAtdzI=;
 b=5Hiy/KmaeHg2aZGqJ1zEpDP19rJuXxUBMreyI1XXNvB5abkmXA6+48uUmCMxsxQlOZ
 vrnRGSUmiUJ0EJB6gXqZHrjZpfmLegAWPOPNiYjRtychoP+mE17jCZ3nZ/EQjm2I+lRZ
 XkjEqvXbeW1X/SMhsfA/HSEJ6x/8JUv2a5h0BUzo9wVU04KvNJ31rZtNOq5QdgLuO/Fr
 yoZ6CKczNU+o8+/2St7Gb1DN1bDdbsJenp/H7JmfzcIsTs2T4rUsFQa7faWl6pROIy5t
 iFEttiO54df6+fk3PynuwgUMF3BXuBjNpEMibBFIuGB+X1lQCnMyoX0sm2rQpwqgOcCu
 TnLA==
X-Gm-Message-State: AO0yUKX/0CV34RhIsM8Ooh326sxIPVwJyF8ATU8g/7j/vNbxqKWDiUPr
 rLpf518CPOxvQD8pu6kFhHin7w==
X-Google-Smtp-Source: AK7set/05PMdWN2X//Ae0Bm+GTyz04uZ5T0FFTJJXJP+hOgTp5M6pbfZL+V7ePC2F+bWdc2FeJem6g==
X-Received: by 2002:a19:f61a:0:b0:4de:3774:2d97 with SMTP id
 x26-20020a19f61a000000b004de37742d97mr230467lfe.13.1679361506234; 
 Mon, 20 Mar 2023 18:18:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v2 05/13] drm/msm/dpu: get rid of struct
 dpu_rm_requirements
Date: Tue, 21 Mar 2023 04:18:13 +0300
Message-Id: <20230321011821.635977-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct dpu_rm_requirements was used to wrap display topology and
hw resources, which meant INTF indices. As of commit ef58e0ad3436
("drm/msm/dpu: get INTF blocks directly rather than through RM") the hw
resources struct was removed, leaving struct dpu_rm_requirements
containing a single field (topology). Remove the useless wrapper.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 69 +++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +-
 3 files changed, 23 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4ee708264f3b..a2cb23dea0b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -638,7 +638,7 @@ static int dpu_encoder_virt_atomic_check(
 
 		if (!crtc_state->active_changed || crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, topology);
+					drm_enc, crtc_state, &topology);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f4dda88a73f7..952e139c0234 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -24,15 +24,6 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
 	return res_map[idx] && res_map[idx] != enc_id;
 }
 
-/**
- * struct dpu_rm_requirements - Reservation requirements parameter bundle
- * @topology:  selected topology for the display
- * @hw_res:	   Hardware resources required as reported by the encoders
- */
-struct dpu_rm_requirements {
-	struct msm_display_topology topology;
-};
-
 int dpu_rm_destroy(struct dpu_rm *rm)
 {
 	int i;
@@ -329,14 +320,13 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
  *      mixer in rm->pingpong_blks[].
  * @dspp_idx: output parameter, index of dspp block attached to the layer
  *      mixer in rm->dspp_blks[].
- * @reqs: input parameter, rm requirements for HW blocks needed in the
- *      datapath.
+ * @topology:  selected topology for the display
  * Return: true if lm matches all requirements, false otherwise
  */
 static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
-		struct dpu_rm_requirements *reqs)
+		struct msm_display_topology *topology)
 {
 	const struct dpu_lm_cfg *lm_cfg;
 	int idx;
@@ -361,7 +351,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	}
 	*pp_idx = idx;
 
-	if (!reqs->topology.num_dspp)
+	if (!topology->num_dspp)
 		return true;
 
 	idx = lm_cfg->dspp - DSPP_0;
@@ -383,7 +373,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
 			       uint32_t enc_id,
-			       struct dpu_rm_requirements *reqs)
+			       struct msm_display_topology *topology)
 
 {
 	int lm_idx[MAX_BLOCKS];
@@ -391,14 +381,14 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	int dspp_idx[MAX_BLOCKS] = {0};
 	int i, j, lm_count = 0;
 
-	if (!reqs->topology.num_lm) {
-		DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
+	if (!topology->num_lm) {
+		DPU_ERROR("invalid number of lm: %d\n", topology->num_lm);
 		return -EINVAL;
 	}
 
 	/* Find a primary mixer */
 	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
-			lm_count < reqs->topology.num_lm; i++) {
+			lm_count < topology->num_lm; i++) {
 		if (!rm->mixer_blks[i])
 			continue;
 
@@ -407,7 +397,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
 				enc_id, i, &pp_idx[lm_count],
-				&dspp_idx[lm_count], reqs)) {
+				&dspp_idx[lm_count], topology)) {
 			continue;
 		}
 
@@ -415,7 +405,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 		/* Valid primary mixer found, find matching peers */
 		for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
-				lm_count < reqs->topology.num_lm; j++) {
+				lm_count < topology->num_lm; j++) {
 			if (!rm->mixer_blks[j])
 				continue;
 
@@ -428,7 +418,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
 					global_state, enc_id, j,
 					&pp_idx[lm_count], &dspp_idx[lm_count],
-					reqs)) {
+					topology)) {
 				continue;
 			}
 
@@ -437,7 +427,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		}
 	}
 
-	if (lm_count != reqs->topology.num_lm) {
+	if (lm_count != topology->num_lm) {
 		DPU_DEBUG("unable to find appropriate mixers\n");
 		return -ENAVAIL;
 	}
@@ -446,7 +436,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
 		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
 		global_state->dspp_to_enc_id[dspp_idx[i]] =
-			reqs->topology.num_dspp ? enc_id : 0;
+			topology->num_dspp ? enc_id : 0;
 
 		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
 					 pp_idx[i] + PINGPONG_0);
@@ -539,44 +529,30 @@ static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		struct drm_encoder *enc,
-		struct dpu_rm_requirements *reqs)
+		struct msm_display_topology *topology)
 {
 	int ret;
 
-	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, reqs);
+	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate mixers\n");
 		return ret;
 	}
 
 	ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
-				&reqs->topology);
+				   topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate CTL\n");
 		return ret;
 	}
 
-	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
+	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, topology);
 	if (ret)
 		return ret;
 
 	return ret;
 }
 
-static int _dpu_rm_populate_requirements(
-		struct drm_encoder *enc,
-		struct dpu_rm_requirements *reqs,
-		struct msm_display_topology req_topology)
-{
-	reqs->topology = req_topology;
-
-	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
-		      reqs->topology.num_lm, reqs->topology.num_dsc,
-		      reqs->topology.num_intf);
-
-	return 0;
-}
-
 static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
 				  uint32_t enc_id)
 {
@@ -608,9 +584,8 @@ int dpu_rm_reserve(
 		struct dpu_global_state *global_state,
 		struct drm_encoder *enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology)
+		struct msm_display_topology *topology)
 {
-	struct dpu_rm_requirements reqs;
 	int ret;
 
 	/* Check if this is just a page-flip */
@@ -625,13 +600,11 @@ int dpu_rm_reserve(
 	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
 		      enc->base.id, crtc_state->crtc->base.id);
 
-	ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
-	if (ret) {
-		DPU_ERROR("failed to populate hw requirements\n");
-		return ret;
-	}
+	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
+		      topology->num_lm, topology->num_dsc,
+		      topology->num_intf);
 
-	ret = _dpu_rm_make_reservation(rm, global_state, enc, &reqs);
+	ret = _dpu_rm_make_reservation(rm, global_state, enc, topology);
 	if (ret)
 		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index d62c2edb2460..f05697462856 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -71,7 +71,7 @@ int dpu_rm_reserve(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology);
+		struct msm_display_topology *topology);
 
 /**
  * dpu_rm_reserve - Given the encoder for the display chain, release any
-- 
2.30.2

