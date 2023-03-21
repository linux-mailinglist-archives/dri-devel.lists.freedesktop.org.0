Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC176C274B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 02:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF5110E6C2;
	Tue, 21 Mar 2023 01:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE0010E6B7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id k37so4278667lfv.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcuLgUbx7g9v2Vy1Q8jG9BrjLhWzTu+kdHKk66znflY=;
 b=a1+cG1s3NmYitaFCorUcyoDeU+MAInIIYljt8rMlOYM2o2qmqEI6McJkkpUjzc5th3
 00AnRiShk6t7uHwdtxLhQNDi51TrfTnzqqixdVBFq7VeE/btUxuM2Qcn/1m2RMpoe+Dz
 BTsr8TwIrEuHuj4E13vRbw4tZHUBsZ0Co3CyM9bUU7vn0ba/bF/InswiHYQiTaKNJCZ/
 AHY5zvwLUtQZugGttMhLdHTb6Pqz79tQtL8MdgsXbqFUH1PzdY4gSNhGwCinpMOqHT/d
 DQhmd/4P/56HYTNWYjg08saWDKHoJ0DJ5El/WaeRtpgUL5opAegB9LkmGUhTENeKpTUO
 OA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcuLgUbx7g9v2Vy1Q8jG9BrjLhWzTu+kdHKk66znflY=;
 b=dUnCBYsVDpSbmj19BGShXp4gjZgdM+fgIWKNwsZo/fPj+DUby5KZ1Ur7VJ7vioBc/A
 OEiBjsYEs69EfLVb4Ax+4YDfwZOhKA9bgzYZxuUYNnX+p3sMND3GkiwXu1qyVzOPtGpB
 C6VX4IcEC9T6LTq0ZwNfSWW+ieHnBGC4g2VlnCtfKXo7H/mu4VmV7CQipjCtfFia+tjY
 fy6Q9RpvksPu3zwgQc9KwJ+ryFz/FeNeZ2O9UOl0PyI5xnJmrv2CXkWqk0UlaHk7jBQF
 YNmr4kKR6s9VCSNKhl3uj7uOBhTCgSfmKS/3uCF89MP3GbSn0Fxa2QH2z2RxHIKekv46
 nPhQ==
X-Gm-Message-State: AO0yUKWkJR3K2/U19Chvy7Nwu69mAuqD0zQraBny0E3NwXjuYUOqM/TK
 E1rfGTgxaAaE7VFuM4Gb1+39Cw==
X-Google-Smtp-Source: AK7set9IJ9TmyxKZuxZzsVQWlCZYAjsOfL+3u41SC10erZpLaPsauXq2bjMI1/usrlKBHJhC2XaaHw==
X-Received: by 2002:ac2:5598:0:b0:4e9:d5e5:3ff2 with SMTP id
 v24-20020ac25598000000b004e9d5e53ff2mr254745lfg.40.1679361507744; 
 Mon, 20 Mar 2023 18:18:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v2 07/13] drm/msm/dpu: move resource allocation to CRTC
Date: Tue, 21 Mar 2023 04:18:15 +0300
Message-Id: <20230321011821.635977-8-dmitry.baryshkov@linaro.org>
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

All resource allocation is centered around the LMs. Then other blocks
(except DSCs) are allocated basing on the LMs that was selected, and LM
powers up the CRTC rather than the encoder.

Moreover if at some point the driver supports encoder cloning,
allocating resources from the encoder will be incorrect, as all clones
will have different encoder IDs, while LMs are to be shared by these
encoders.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 76 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 88 +++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 ++
 3 files changed, 94 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 508e5b950e52..77226de54363 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1176,6 +1176,76 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	return false;
 }
 
+#define MAX_HDISPLAY_SPLIT 1080
+
+static struct msm_display_topology dpu_crtc_get_topology(
+			struct drm_crtc *crtc,
+			struct dpu_kms *dpu_kms,
+			struct drm_crtc_state *crtc_state)
+{
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct msm_display_topology topology = {0};
+	struct drm_encoder *drm_enc;
+
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
+		dpu_encoder_update_topology(drm_enc, &topology);
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
+	global_state = dpu_kms_get_global_state(crtc_state->state);
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
@@ -1191,6 +1261,12 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		rc = dpu_crtc_assign_resources(crtc, crtc_state);
+		if (rc < 0)
+			return rc;
+	}
+
 	if (!crtc_state->enable || !crtc_state->active) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 270c85ea898a..204360485b81 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -53,8 +53,6 @@
 
 #define IDLE_SHORT_TIMEOUT	1
 
-#define MAX_HDISPLAY_SPLIT 1080
-
 /* timeout in frames waiting for frame done */
 #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
 
@@ -514,71 +512,28 @@ void dpu_encoder_helper_split_config(
 	}
 }
 
-bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
+void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
+				 struct msm_display_topology *topology)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	int i, intf_count = 0, num_dsc = 0;
+	int i;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
 		if (dpu_enc->phys_encs[i])
-			intf_count++;
+			topology->num_intf++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
-
-	return (num_dsc > 0) && (num_dsc > intf_count);
+		topology->num_dsc += 2;
 }
 
-static struct msm_display_topology dpu_encoder_get_topology(
-			struct dpu_encoder_virt *dpu_enc,
-			struct dpu_kms *dpu_kms,
-			struct drm_display_mode *mode,
-			struct drm_crtc_state *crtc_state)
+bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 {
-	struct msm_display_topology topology = {0};
-	int i, intf_count = 0;
-
-	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
-		if (dpu_enc->phys_encs[i])
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
+	struct msm_display_topology topology = { 0 };
 
-	topology.num_intf = intf_count;
+	dpu_encoder_update_topology(drm_enc, &topology);
 
-	if (dpu_enc->dsc) {
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
-
-	return topology;
+	return (topology.num_dsc > 0) && (topology.num_dsc > topology.num_intf);
 }
 
 static int dpu_encoder_virt_atomic_check(
@@ -587,11 +542,7 @@ static int dpu_encoder_virt_atomic_check(
 		struct drm_connector_state *conn_state)
 {
 	struct dpu_encoder_virt *dpu_enc;
-	struct msm_drm_private *priv;
-	struct dpu_kms *dpu_kms;
 	struct drm_display_mode *adj_mode;
-	struct msm_display_topology topology;
-	struct dpu_global_state *global_state;
 	int i = 0;
 	int ret = 0;
 
@@ -604,12 +555,7 @@ static int dpu_encoder_virt_atomic_check(
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-	priv = drm_enc->dev->dev_private;
-	dpu_kms = to_dpu_kms(priv->kms);
 	adj_mode = &crtc_state->adjusted_mode;
-	global_state = dpu_kms_get_global_state(crtc_state->state);
-	if (IS_ERR(global_state))
-		return PTR_ERR(global_state);
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
@@ -627,20 +573,6 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
-
-	/*
-	 * Release and Allocate resources on every modeset
-	 * Dont allocate when active is false.
-	 */
-	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-		dpu_rm_release(global_state, crtc_state->crtc);
-
-		if (!crtc_state->active_changed || crtc_state->enable)
-			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					crtc_state->crtc, &topology);
-	}
-
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 9e7236ef34e6..88248b9faf1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -202,6 +202,14 @@ int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
  */
 bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_update_topology - update topology with the requirements for the encoder
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @topology:	Topology to be updated
+ */
+void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
+				 struct msm_display_topology *topology);
+
 /**
  * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
  * @drm_enc:    Pointer to previously created drm encoder structure
-- 
2.30.2

