Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B982084E3E9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E846310E8CB;
	Thu,  8 Feb 2024 15:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fmyiqwSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89C310E8E0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:20:46 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d0a0e40672so10559791fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 07:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707405645; x=1708010445; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=D67SHaFW97kK6G1v5sE/VNmdoJi9sv44R3pWMndVFYQ=;
 b=fmyiqwSyv4vV7JHci/Cnyfe8M1uIh2SidHpFipJk691K7zr1ro8HfzwL74FMDPIMat
 ivZFWdf8yUTj447RS6FNT1Lpbvd2/6DJ63Xg91lN8yXUSdGSBADI4jRcPM3TslIx58wB
 Qg/PDaqolxn4saaX6oGoE0WYOpGDKiULBYPpNoiVDd8zt8B3thElhbQAHwEWcc7XD/cN
 sM9+FZ176IdAqbuuZxSduKoskSaohMXADjLoZ+iC5grBC01kCqL8Z/QFrVs/wg3lAXJ0
 BJpTHc2KR+oW6YpUSGl9xieZZm8bpNFohr4ovrpcUIuG8hjOWNa6U3Jdc0BQ33DEjABx
 Ic6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707405645; x=1708010445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D67SHaFW97kK6G1v5sE/VNmdoJi9sv44R3pWMndVFYQ=;
 b=Dq/nInrb/xwAwSOr7d615HQ4RSW3Gm1GdVoF7jGZLft/pEDj38NFqSRfM+b3fvV97D
 kULn+spKuDNd8FFFMUeFFr2UoZ/qi1AsxDTMpzhiTYzs5QgbG57fsdteGYIgWRKjqQqO
 WTAFqmM8owGb6J7YFczFWZYKwSkZyccO3h2jDZYxvJgEescomPa7IkuYlVz5oyqf6SII
 VgqeAa5WJbiU0cItS9fyLXNJUmVgUSm847sQ0YJLPj7tK9q3H0KVHo4ADxLDRYo5Cyz3
 14s7VJ7X5OrFiF8vz5q5GyvL58mPetKtmGNIHUimAaR2ow1C3ZGdqFKW5x9VmTF3+4xU
 ab9g==
X-Gm-Message-State: AOJu0YxH6VH4uwjH5M9Qlg/vorqdrP7H2r1ldL3c+8guFt3dJiWV4+mo
 15pkFZuG1lWTT5pD6bO81DpcWxex4IBHv/FyXBzuTkimW/fUXD++IfCr0b22Jm0=
X-Google-Smtp-Source: AGHT+IH9A/ZhsSGXhJI3AvEfUGwKLfOMvZISJTSd9vZctnai1z9WUucY5FBPn2uD81GHgLA8a1cEzQ==
X-Received: by 2002:a2e:90d0:0:b0:2d0:b3c7:ce03 with SMTP id
 o16-20020a2e90d0000000b002d0b3c7ce03mr1267781ljg.8.1707405644921; 
 Thu, 08 Feb 2024 07:20:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCURdqkJ2WRSXfdyEBttXogks7xwVwn87M1KqdeOYrfXikpeA61qO9FWjLDMnE6ovGiSqrAgcWDxoLA0EcAEDQ5ZyJsP4MJcYwt0zGGkZBvxcl+yG53txbu/iiTkUgmoUkpl4sMhl/gx+fdUmc4jlTCecEcPMRjbuNUe8or+SM5I821P/r4zUvXbWPJijLpxtGrQR/WPKFXh5MfcQHkZrFQu9WuFhJK6mrY1wJrGWihfJYCWEwXKsZluatJ5qSOAhuMYYkEipNBAOcCZtwfJ9qX8AB+cQox2AcSBw3OS5Hg2i/PVSKjPQU8lzXoinK24uUXDjxrRdNeamIFk+hc=
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y4-20020a2e9d44000000b002d0d1caf26bsm22116ljj.7.2024.02.08.07.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:20:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:20:43 +0200
Subject: [PATCH v4 3/5] drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-3-caf5dcd125c0@linaro.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=9079;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zjZbYdMAqyu+oLAUzHy6Hmx+VEZSTigImPrKgFvEAZw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxPFKrsE8LWDGMW9/nvqV4MfCMOgGTrO0ueVzR
 R0wCthAr8qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTxSgAKCRCLPIo+Aiko
 1SVqB/9cI+TTRJMkCqPPSd4FnVJasvzalLfLfSvZX/EWpGJkcizbEF1+rGdSf2Bf9bXXjXGzt/Y
 W2iV5XBhVce/i22hjCqLtG4G+ricH7BXLo0UDs8OoejQrlE8axMhEbkyMuuxm1ZXyH11CgvVQ4c
 KXT2UzPKiylPKgxjU8jxw3HqlChTn5kdkcIKubiyNXnGFbci5N2iWldJlRvcc7nsIO4/93065Aw
 KofzXRs2Kx6Kf7nBlNnBkey+0PmRQWg0OaE4OofPLD/URmMPWX++dxKMXrQlvCmPLmP4EBRmOPV
 ju/6/WaH/1IHBx9D7XFuU2RvzTRfYquVfP0aeTNFZGRZ9h0+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The atomic_mode_set() callback only sets the phys_enc's IRQ data. As the
INTF and WB are statically allocated to each encoder/phys_enc, drop the
atomic_mode_set callback and set the IRQs during encoder init.

For the CMD panel usecase some of IRQ indexes depend on the selected
resources. Move setting them to the irq_enable() callback.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  5 ----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 32 ++++++++++------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 13 ++-------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 11 +-------
 5 files changed, 17 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6cf2e186a350..2da50ce0c999 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1152,8 +1152,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
 		phys->cached_mode = crtc_state->adjusted_mode;
-		if (phys->ops.atomic_mode_set)
-			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 8c5b0c853572..7eb8bdfe6bbe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -69,8 +69,6 @@ struct dpu_encoder_phys;
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
  *				on split_role and current mode (CMD/VID).
- * @atomic_mode_set:		DRM Call. Set a DRM mode.
- *				This likely caches the mode, for use at enable.
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
  * @atomic_check:		DRM Call. Atomic check new DRM state.
@@ -96,9 +94,6 @@ struct dpu_encoder_phys;
 struct dpu_encoder_phys_ops {
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
-	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
-			struct drm_crtc_state *crtc_state,
-			struct drm_connector_state *conn_state);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
 	int (*atomic_check)(struct dpu_encoder_phys *encoder,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index de826f9745e5..fc1d5736d7fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -142,23 +142,6 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg)
 	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
 }
 
-static void dpu_encoder_phys_cmd_atomic_mode_set(
-		struct dpu_encoder_phys *phys_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
-{
-	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
-
-	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
-
-	if (phys_enc->has_intf_te)
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
-	else
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
-
-	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
-}
-
 static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -297,6 +280,14 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 					  phys_enc->hw_pp->idx - PINGPONG_0,
 					  phys_enc->vblank_refcount);
 
+	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
+	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
+
+	if (phys_enc->has_intf_te)
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
+	else
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
+
 	dpu_core_irq_register_callback(phys_enc->dpu_kms,
 				       phys_enc->irq[INTR_IDX_PINGPONG],
 				       dpu_encoder_phys_cmd_pp_tx_done_irq,
@@ -327,6 +318,10 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
 	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
+
+	phys_enc->irq[INTR_IDX_CTL_START] = 0;
+	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
+	phys_enc->irq[INTR_IDX_RDPTR] = 0;
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -706,7 +701,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 		struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
-	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
@@ -745,6 +739,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
 
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_CMD;
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
+
 	cmd_enc->stream_sel = 0;
 
 	if (!phys_enc->hw_intf) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 9743ec43d862..bc4ac7e2e4ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -349,16 +349,6 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
 	return phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
-static void dpu_encoder_phys_vid_atomic_mode_set(
-		struct dpu_encoder_phys *phys_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
-{
-	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
-
-	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
-}
-
 static int dpu_encoder_phys_vid_control_vblank_irq(
 		struct dpu_encoder_phys *phys_enc,
 		bool enable)
@@ -686,7 +676,6 @@ static int dpu_encoder_phys_vid_get_frame_count(
 static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_vid_is_master;
-	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
@@ -725,6 +714,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
 
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
+	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
 
 	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 602013725484..a0a28230fc31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -539,15 +539,6 @@ static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
 		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
 }
 
-static void dpu_encoder_phys_wb_atomic_mode_set(
-		struct dpu_encoder_phys *phys_enc,
-		struct drm_crtc_state *crtc_state,
-		struct drm_connector_state *conn_state)
-{
-
-	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
-}
-
 static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -784,7 +775,6 @@ static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phy
 static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_wb_is_master;
-	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
 	ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
@@ -831,6 +821,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
+	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
 
 	atomic_set(&wb_enc->wbirq_refcount, 0);
 

-- 
2.39.2

