Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8758CBF35
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F33010F48D;
	Wed, 22 May 2024 10:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vvoSSB0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2383010F48D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:24:32 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51fdc9af005so9272370e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716373470; x=1716978270; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IuuZbtTxQbyoy45odG0qTznmh20zGHX67BYPrGUhl7w=;
 b=vvoSSB0ONQ+qnvq0WG4Ga/Cyk4baugAnrdDsdDFfgnEqVXDmKVp4NghexQzDtZ8veF
 EKROPQ76r0hSQCOChxBxqSgPPvKF7OKsptbG7VY82XlRPPo/a3OdWzS+ipqxqwQFcrkZ
 MLeJlZ2cvXsO+TqepQBvEQUvFPdv1n8wpVdV0rVfRtoPgkdIyZHEP/kzC3eli61NssHs
 2bzGN7kG2jMlHwzdwbvh/z6f9xlhC3+AnDrSiArYN1tV3x7Ouw2ThMIxiSIXheXWJuNc
 6q+kBL0baVaQKBwf0hQXlqL59Wb+I83iGz2V9QI/U49Z68HyqM8W1Q1Hs4CtFt9Hkken
 NaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716373470; x=1716978270;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IuuZbtTxQbyoy45odG0qTznmh20zGHX67BYPrGUhl7w=;
 b=f6GqV2nge6IDaLa0ibDzHkNYHVtFWYWJDN7jxVlkeZAMqFc7eudYemnC03eqUR6/nC
 lWgN37AqkWYUCPjFR+OMCz2yWe9I6oxU0V8Do3J0nk95Et9nTtkmsyEx8WTS7V8wqCwb
 jyPxFEE8dyPNak8Ja9YUjFKK0JECBDaseuNLwzF0Qqos09gc94smjsQdfpLZCMyb+kDD
 IBKITjXUHy3KMPWzU3HWGx3Lqs06S224DpAWKhNOiiRLG0NoEBnwOmS84WBKuwRBFZJA
 WeP2ROsdORYzRDUSckwRHhUUpCZQzui4g+FlIkxGK7vwBMwrILG5c1dSmL6B3u9EG3ec
 GBOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6JunRF7mm9Puv2NG7rQpUhqPKNhxBkigYXzHvKao3HaY2NmhlKOdiIPSDi8qqTgp133SaJ0AkKg93wVT+4DnVB0FhH4AJluVSyy2ZvMAN
X-Gm-Message-State: AOJu0Yx7XrFu5pJQCR1XLgO9W5uudXrl0XJytZf5BgWGiigexDgWh8Qm
 pvxkJujZPaIohi5Pho8ROyuxpLl9AVxX4eOWxK2rdir7ssxacot7ZDGGPCBS13OKybPu+lV5WOK
 r
X-Google-Smtp-Source: AGHT+IHPbVr1ifPzejL1oqr8FOtzXHojewq+wtSz0YT2lBxTujeSpXY3ge7i7C++WLRBRstGJcuY6Q==
X-Received: by 2002:ac2:5466:0:b0:521:cc8a:46dd with SMTP id
 2adb3069b0e04-526bebb3e10mr1075615e87.11.1716373470166; 
 Wed, 22 May 2024 03:24:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f9a9563dsm4801499e87.74.2024.05.22.03.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:24:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:24:28 +0300
Subject: [PATCH v2] Revert "drm/msm/dpu: drop
 dpu_encoder_phys_ops.atomic_mode_set"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-dpu-revert-ams-v2-1-b37825d708e1@linaro.org>
X-B4-Tracking: v=1; b=H4sIANvHTWYC/3WMQQ6CMBBFr0Jm7RimFKKuuIdhUegAkyglUyQaw
 t2t7F2+n//eBpFVOMIt20B5lShhSmBOGXSjmwZG8YnB5MbmJVn08wvTkXVB94x4tZS7tiNme4E
 kzcq9vI/gvUk8SlyCfo7+Sr/1b2olJGypqEzhq86Xff2QyWk4Bx2g2ff9C04CNlutAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9785;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/wEmGaBmLdTni55W6XkvEa18Wfmd70BaIonNgCkUxsI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTcfdOeXb51BBPnr7B3dfbxayUHEHecGFAvX7E
 YByYqKbkiGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3H3QAKCRCLPIo+Aiko
 1V1pB/sG2eavn1innxyXOIT0CghxLl/OiBSpT7gFwrxWpk6n8SUzavY3m8SSzEY2qQLUoRldXk3
 nUe+5zeQowbTJcqeqWpegGZ7FRf8NFCElx/WD77fyEJG5KTvFKG4G8gt41Odo+pnWXOtCgBsbVs
 cIOG6ZfY8O9y5S31FQ++sUw/qxLoWUuWWXzumEogg4aMtBkUdM4qe9+kzFWGQcsQrmZ9qiFNXDj
 3C4AdI93ExZKF9JSgXLVeXwUZfd27VWgA7Dz50p2LhauMnNnffI40L1URwnVk6yh0JPmlF92sdf
 X2L5s80LK6kQ7Yb215nQEWbUqDfd2opRMZiD8cvoymKCiGe1
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

In the DPU driver blank IRQ handling is called from a vblank worker and
can happen outside of the irq_enable / irq_disable pair. Using the
worker makes that completely asynchronous with the rest of the code.
Revert commit d13f638c9b88 ("drm/msm/dpu: drop
dpu_encoder_phys_ops.atomic_mode_set") to fix vblank IRQ assignment for
CMD DSI panels.

Call trace:
 dpu_encoder_phys_cmd_control_vblank_irq+0x218/0x294
  dpu_encoder_toggle_vblank_for_crtc+0x160/0x194
  dpu_crtc_vblank+0xbc/0x228
  dpu_kms_enable_vblank+0x18/0x24
  vblank_ctrl_worker+0x34/0x6c
  process_one_work+0x218/0x620
  worker_thread+0x1ac/0x37c
  kthread+0x114/0x118
  ret_from_fork+0x10/0x20

Fixes: d13f638c9b88 ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Expanded commit message to describe the reason for revert and added a
  call trace (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240514-dpu-revert-ams-v1-1-b13623d6cd5f@linaro.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  5 ++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 32 ++++++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 13 +++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 11 +++++++-
 5 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..a7d8ecf3f5be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1200,6 +1200,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
 		phys->cached_mode = crtc_state->adjusted_mode;
+		if (phys->ops.atomic_mode_set)
+			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 002e89cc1705..30470cd15a48 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -69,6 +69,8 @@ struct dpu_encoder_phys;
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
  *				on split_role and current mode (CMD/VID).
+ * @atomic_mode_set:		DRM Call. Set a DRM mode.
+ *				This likely caches the mode, for use at enable.
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
@@ -93,6 +95,9 @@ struct dpu_encoder_phys;
 struct dpu_encoder_phys_ops {
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
+	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
+			struct drm_crtc_state *crtc_state,
+			struct drm_connector_state *conn_state);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 489be1c0c704..95cd39b49668 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -142,6 +142,23 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg)
 	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
 }
 
+static void dpu_encoder_phys_cmd_atomic_mode_set(
+		struct dpu_encoder_phys *phys_enc,
+		struct drm_crtc_state *crtc_state,
+		struct drm_connector_state *conn_state)
+{
+	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
+
+	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
+
+	if (phys_enc->has_intf_te)
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
+	else
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
+
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
+}
+
 static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -280,14 +297,6 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 					  phys_enc->hw_pp->idx - PINGPONG_0,
 					  phys_enc->vblank_refcount);
 
-	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
-	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
-
-	if (phys_enc->has_intf_te)
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
-	else
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
-
 	dpu_core_irq_register_callback(phys_enc->dpu_kms,
 				       phys_enc->irq[INTR_IDX_PINGPONG],
 				       dpu_encoder_phys_cmd_pp_tx_done_irq,
@@ -318,10 +327,6 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
 	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
-
-	phys_enc->irq[INTR_IDX_CTL_START] = 0;
-	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
-	phys_enc->irq[INTR_IDX_RDPTR] = 0;
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -698,6 +703,7 @@ static void dpu_encoder_phys_cmd_init_ops(
 		struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
+	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
@@ -736,8 +742,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
 
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_CMD;
-	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
-
 	cmd_enc->stream_sel = 0;
 
 	if (!phys_enc->hw_intf) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ef69c2f408c3..636a97432d51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -356,6 +356,16 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
 	return phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
+static void dpu_encoder_phys_vid_atomic_mode_set(
+		struct dpu_encoder_phys *phys_enc,
+		struct drm_crtc_state *crtc_state,
+		struct drm_connector_state *conn_state)
+{
+	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
+
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
+}
+
 static int dpu_encoder_phys_vid_control_vblank_irq(
 		struct dpu_encoder_phys *phys_enc,
 		bool enable)
@@ -699,6 +709,7 @@ static int dpu_encoder_phys_vid_get_frame_count(
 static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_vid_is_master;
+	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
@@ -737,8 +748,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
 
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
-	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
-	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
 
 	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index d3ea91c1d7d2..356dca5e5ea9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -404,6 +404,15 @@ static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
 		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
 }
 
+static void dpu_encoder_phys_wb_atomic_mode_set(
+		struct dpu_encoder_phys *phys_enc,
+		struct drm_crtc_state *crtc_state,
+		struct drm_connector_state *conn_state)
+{
+
+	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
+}
+
 static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -640,6 +649,7 @@ static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phy
 static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_wb_is_master;
+	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
 	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
@@ -685,7 +695,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
-	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
 
 	atomic_set(&wb_enc->wbirq_refcount, 0);
 

---
base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
change-id: 20240514-dpu-revert-ams-9410abc1ee48

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

