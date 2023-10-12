Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841AB7C68D6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6082710E474;
	Thu, 12 Oct 2023 09:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE4110E472
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:01:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4064867903cso8735835e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697101296; x=1697706096; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VOmmZW8Dw1fZcgCPJ8ioitBx55qRc6aeqLoaoa57hWY=;
 b=aCmGCRAeVRVrOp3iuhABTcAnYuSLHbqfgSa3cKPJIP9dboYUSY8xTgzpvtJktRqk91
 KVuuX193fncvBKPUEJZI6n1derAZjuRqMo7vMAskmHvdYUpyNBsOycqbeXMVXlXXUS1T
 Zr66LujxJp+6yxlcoU4ZPLhM5UJrsjbLNod5XoAXzDaPTlFVu4vyerKTuEzbuwNUGdm+
 sic9yMwKlt/nHzx4GXNHsKC2qjkPIFizZmxif1LIsSwX5jbOvptNeQ7vZxAj2DTdZICt
 95CJWOWDQPHKIg9zb358cVmb9IfHtSkxaN5A0ZuQZCVrKReLVDCkfV8Ct/Nx12kjwbVo
 +wIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697101296; x=1697706096;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOmmZW8Dw1fZcgCPJ8ioitBx55qRc6aeqLoaoa57hWY=;
 b=aqv3b+I6T48tRUv5ByWohoBxyY9Ok4MMUwz3vj3WuUSLwhOBAsZfWOsH25ZTBuD1GG
 6m1aaOX6V71Pgkaca2K9kXMSRtT9ZOid0DG9gcArjhuRbjovEpX1Zw6Al2XbrXixJ4Sg
 yBomlUFjxzE89r2XPdISfkMP/bvA04BifvIRd5wyL4/v1TaTyikTbUu4663AlpIAIUiV
 lgNcRwBwshlTqaYc3g+amKRzIzlNoqPcRE7jIJiPF78hKaRH34omA2SaNRsNYOn1XnMi
 oc/AwVZaSS4NPWoHdSqbxHfLXuujW3+DWCN8AH5Kh6B/rvkJfI+VJfXX9QZ0XW1n/y84
 O1sw==
X-Gm-Message-State: AOJu0YzctO+zM6GryXL4uqh6i3XpYkd5e3c0MCSoC5ie4u0qyC+qk43r
 gB8aBPoK7xivXPAlJzgpKKP67g==
X-Google-Smtp-Source: AGHT+IHTCJ5ZJflHtgx0+UdrGQQr0NprFicoDNSbJmJMBRJcTwhEO/UTF280v/iEGxsr1BxQvVr+aw==
X-Received: by 2002:adf:b60c:0:b0:329:6aae:47dc with SMTP id
 f12-20020adfb60c000000b003296aae47dcmr13427158wre.67.1697101296423; 
 Thu, 12 Oct 2023 02:01:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm17811176wru.35.2023.10.12.02.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 02:01:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 12 Oct 2023 11:01:29 +0200
Subject: [PATCH v3 3/5] drm/msm/dpu: move setup_force_clk_ctrl handling
 into plane and wb
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-3-4bcad69812d3@linaro.org>
References: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-0-4bcad69812d3@linaro.org>
In-Reply-To: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-0-4bcad69812d3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10512;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=tRsFQ5yvi3FsmKUjIpMBVnmpLp7RFv9kenfDDpCNb7I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJ7XrqiSCvBNCtO5cFx6PLRAjxC2MYnw9/b4Z9s95
 K3AlJEmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSe16wAKCRB33NvayMhJ0YuWD/
 9t7VcecLDogiCdb2D/3KyzaKDKf2rZC3gw8+VV9mwcWO9hXVyk7fabfYCWZjwp2fJ6EYvtwvu0WKFX
 Zae1Qk2E2Xt+4SWgKm/dJ9nN7f2Qg3bOfiKVx/gg16Nmmn838MCbtb6hvmmjS4bFZcRDHXezVzeDwP
 XholmWRYZVp0BhAtmN1LBjW5h6nc5BodFfbAyfXSrCuUdANOqkNrqYvDakS6xeHECOOP/JDFZGDWKx
 vvU4dmcHJ59ZvicLpb81SS+1N7Pd3j4caky/n1cqWXaARAoFSav4N/NMGcSjfGaQ81G+Sxzg5YJ74o
 0T6kGBhCRZeRyqRA/JWM4bcBkct4Aa5HtgBCpyFzosa/6NJUAGWyg+fcLYMy7ttxQO7NwDyuk5eAym
 fzIeGh/osHZFlfRhV23pgLMCGVIvND9dESBk7Lz9eqGHj6KdP6ZLFoPIRLZ0GS48R4ISJ6XGGJBQQE
 ycLGc2eue1+MdvIFMdOlbNEH34T5bdxuD1VZNMdmm3k1i1SNBXw0UryinqTaGq7OLanxhWSfrsP2KD
 iX/jVm9YbioJD42tq4ct+anCAcsceBlpkpkrRThQn5BNHniKLHwa+nQA3jRdxDUeHeyLp3y6ZFqAk0
 yXYlUs9s0q+k6XDmGuUmLTEMKr76L6w+4imb+Lzx30vpT05zDGJfJ7QHAK4g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now SSPP and WB can have setup_force_clk_ctrl() ops, it's simpler to call
them from the plane and wb code and call into the mdp ops if not present.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 37 +++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 42 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           | 30 +++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |  4 ---
 4 files changed, 77 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 78037a697633..8802e007f8e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -34,6 +34,23 @@ static bool dpu_encoder_phys_wb_is_master(struct dpu_encoder_phys *phys_enc)
 	return true;
 }
 
+static bool _dpu_encoder_phys_wb_clk_force_ctrl(struct dpu_hw_wb *wb,
+						struct dpu_hw_mdp *mdp,
+						bool enable, bool *forced_on)
+{
+	if (wb->ops.setup_clk_force_ctrl) {
+		*forced_on = wb->ops.setup_clk_force_ctrl(wb, enable);
+		return true;
+	}
+
+	if (mdp->ops.setup_clk_force_ctrl) {
+		*forced_on = mdp->ops.setup_clk_force_ctrl(mdp, wb->caps->clk_ctrl, enable);
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * dpu_encoder_phys_wb_set_ot_limit - set OT limit for writeback interface
  * @phys_enc:	Pointer to physical encoder
@@ -43,6 +60,7 @@ static void dpu_encoder_phys_wb_set_ot_limit(
 {
 	struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
 	struct dpu_vbif_set_ot_params ot_params;
+	bool forced_on = false;
 
 	memset(&ot_params, 0, sizeof(ot_params));
 	ot_params.xin_id = hw_wb->caps->xin_id;
@@ -52,10 +70,17 @@ static void dpu_encoder_phys_wb_set_ot_limit(
 	ot_params.is_wfd = true;
 	ot_params.frame_rate = drm_mode_vrefresh(&phys_enc->cached_mode);
 	ot_params.vbif_idx = hw_wb->caps->vbif_idx;
-	ot_params.clk_ctrl = hw_wb->caps->clk_ctrl;
 	ot_params.rd = false;
 
+	if (!_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
+						 true, &forced_on))
+		return;
+
 	dpu_vbif_set_ot_limit(phys_enc->dpu_kms, &ot_params);
+
+	if (forced_on)
+		_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
+						    false, &forced_on);
 }
 
 /**
@@ -67,6 +92,7 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 {
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_vbif_set_qos_params qos_params;
+	bool forced_on = false;
 
 	if (!phys_enc || !phys_enc->parent || !phys_enc->parent->crtc) {
 		DPU_ERROR("invalid arguments\n");
@@ -83,7 +109,6 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 	memset(&qos_params, 0, sizeof(qos_params));
 	qos_params.vbif_idx = hw_wb->caps->vbif_idx;
 	qos_params.xin_id = hw_wb->caps->xin_id;
-	qos_params.clk_ctrl = hw_wb->caps->clk_ctrl;
 	qos_params.num = hw_wb->idx - WB_0;
 	qos_params.is_rt = false;
 
@@ -92,7 +117,15 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 			qos_params.vbif_idx,
 			qos_params.xin_id, qos_params.is_rt);
 
+	if (!_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
+						 true, &forced_on))
+		return;
+
 	dpu_vbif_set_qos_remap(phys_enc->dpu_kms, &qos_params);
+
+	if (forced_on)
+		_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
+						    false, &forced_on);
 }
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..c63cae8fb35c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -333,6 +333,23 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 				       enable);
 }
 
+static bool _dpu_plane_sspp_clk_force_ctrl(struct dpu_hw_sspp *sspp,
+					   struct dpu_hw_mdp *mdp,
+					   bool enable, bool *forced_on)
+{
+	if (sspp->ops.setup_clk_force_ctrl) {
+		*forced_on = sspp->ops.setup_clk_force_ctrl(sspp, enable);
+		return true;
+	}
+
+	if (mdp->ops.setup_clk_force_ctrl) {
+		*forced_on = mdp->ops.setup_clk_force_ctrl(mdp, sspp->cap->clk_ctrl, enable);
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * _dpu_plane_set_ot_limit - set OT limit for the given plane
  * @plane:		Pointer to drm plane
@@ -348,6 +365,7 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_ot_params ot_params;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	bool forced_on = false;
 
 	memset(&ot_params, 0, sizeof(ot_params));
 	ot_params.xin_id = pipe->sspp->cap->xin_id;
@@ -357,10 +375,17 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = frame_rate;
 	ot_params.vbif_idx = VBIF_RT;
-	ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
 	ot_params.rd = true;
 
+	if (!_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
+					    true, &forced_on))
+		return;
+
 	dpu_vbif_set_ot_limit(dpu_kms, &ot_params);
+
+	if (forced_on)
+		_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
+					       false, &forced_on);
 }
 
 /**
@@ -374,21 +399,28 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_qos_params qos_params;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	bool forced_on = false;
 
 	memset(&qos_params, 0, sizeof(qos_params));
 	qos_params.vbif_idx = VBIF_RT;
-	qos_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
 	qos_params.xin_id = pipe->sspp->cap->xin_id;
 	qos_params.num = pipe->sspp->idx - SSPP_VIG0;
 	qos_params.is_rt = pdpu->is_rt_pipe;
 
-	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
+	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d\n",
 			qos_params.num,
 			qos_params.vbif_idx,
-			qos_params.xin_id, qos_params.is_rt,
-			qos_params.clk_ctrl);
+			qos_params.xin_id, qos_params.is_rt);
+
+	if (!_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
+					    true, &forced_on))
+		return;
 
 	dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
+
+	if (forced_on)
+		_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
+					       false, &forced_on);
 }
 
 static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 1305e250b71e..47c02b98eac3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -169,23 +169,16 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 		struct dpu_vbif_set_ot_params *params)
 {
 	struct dpu_hw_vbif *vbif;
-	struct dpu_hw_mdp *mdp;
-	bool forced_on = false;
 	u32 ot_lim;
 	int ret;
 
-	mdp = dpu_kms->hw_mdp;
-
 	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
-	if (!vbif || !mdp) {
-		DRM_DEBUG_ATOMIC("invalid arguments vbif %d mdp %d\n",
-				vbif != NULL, mdp != NULL);
+	if (!vbif) {
+		DRM_DEBUG_ATOMIC("invalid arguments vbif %d\n", vbif != NULL);
 		return;
 	}
 
-	if (!mdp->ops.setup_clk_force_ctrl ||
-			!vbif->ops.set_limit_conf ||
-			!vbif->ops.set_halt_ctrl)
+	if (!vbif->ops.set_limit_conf || !vbif->ops.set_halt_ctrl)
 		return;
 
 	/* set write_gather_en for all write clients */
@@ -200,8 +193,6 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	trace_dpu_perf_set_ot(params->num, params->xin_id, ot_lim,
 		params->vbif_idx);
 
-	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
-
 	vbif->ops.set_limit_conf(vbif, params->xin_id, params->rd, ot_lim);
 
 	vbif->ops.set_halt_ctrl(vbif, params->xin_id, true);
@@ -211,25 +202,19 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 		trace_dpu_vbif_wait_xin_halt_fail(vbif->idx, params->xin_id);
 
 	vbif->ops.set_halt_ctrl(vbif, params->xin_id, false);
-
-	if (forced_on)
-		mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
 }
 
 void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		struct dpu_vbif_set_qos_params *params)
 {
 	struct dpu_hw_vbif *vbif;
-	struct dpu_hw_mdp *mdp;
-	bool forced_on = false;
 	const struct dpu_vbif_qos_tbl *qos_tbl;
 	int i;
 
-	if (!params || !dpu_kms->hw_mdp) {
+	if (!params) {
 		DPU_ERROR("invalid arguments\n");
 		return;
 	}
-	mdp = dpu_kms->hw_mdp;
 
 	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
 
@@ -238,7 +223,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	if (!vbif->ops.set_qos_remap || !mdp->ops.setup_clk_force_ctrl) {
+	if (!vbif->ops.set_qos_remap) {
 		DRM_DEBUG_ATOMIC("qos remap not supported\n");
 		return;
 	}
@@ -251,8 +236,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
-
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
 		DRM_DEBUG_ATOMIC("%s xin:%d lvl:%d/%d\n",
 				dpu_vbif_name(params->vbif_idx), params->xin_id, i,
@@ -260,9 +243,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 	}
-
-	if (forced_on)
-		mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
 }
 
 void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
index ab490177d886..e1b1f7f4e4be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
@@ -16,13 +16,11 @@ struct dpu_vbif_set_ot_params {
 	bool rd;
 	bool is_wfd;
 	u32 vbif_idx;
-	u32 clk_ctrl;
 };
 
 struct dpu_vbif_set_memtype_params {
 	u32 xin_id;
 	u32 vbif_idx;
-	u32 clk_ctrl;
 	bool is_cacheable;
 };
 
@@ -30,14 +28,12 @@ struct dpu_vbif_set_memtype_params {
  * struct dpu_vbif_set_qos_params - QoS remapper parameter
  * @vbif_idx: vbif identifier
  * @xin_id: client interface identifier
- * @clk_ctrl: clock control identifier of the xin
  * @num: pipe identifier (debug only)
  * @is_rt: true if pipe is used in real-time use case
  */
 struct dpu_vbif_set_qos_params {
 	u32 vbif_idx;
 	u32 xin_id;
-	u32 clk_ctrl;
 	u32 num;
 	bool is_rt;
 };

-- 
2.34.1

