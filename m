Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A38E836638
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D88F10F2A3;
	Mon, 22 Jan 2024 15:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF3410F2A3;
 Mon, 22 Jan 2024 15:00:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 51931CE2B10;
 Mon, 22 Jan 2024 14:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B46C43390;
 Mon, 22 Jan 2024 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935585;
 bh=PZYbt2vXSI+CUdsvG3KBlsiiJ83fxhrAvAHF72l/hjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oP+2HtYwQBTCxMN7V9I9azNZzpnV+SuWZ/k7mVsTfTt4RTpqbn8tm3j9u3WX4CRYK
 9VCL7W0Ep0PrHUtIW6D9976BOHt3OPhsxUaB6/9Saq+O00qRIJwz7Q0c4G0+vNIFMR
 iC0cLQ06Lar7KB6jSyKzW+A9jKCNhjIdVRfQP6rGl1i28tmm/NvWpmUXLWx3CVggwk
 baxMxY04F3NV5RiYoJo/T1TgEQwCOCy5pjItgIkNcuYjKrzM2vgoDzMH+D3TbEo6JA
 WH0JhpTj5CRLymNJ/cPT/92lTUlerCnlyMSultLH2iCQi75i7KBo42TGPYl0pDESwQ
 cQzp1Lks+nlfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 57/88] drm/msm/dpu: Add mutex lock in control
 vblank irq
Date: Mon, 22 Jan 2024 09:51:30 -0500
Message-ID: <20240122145608.990137-57-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>, quic_kalyant@quicinc.com,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 Paloma Arellano <quic_parellan@quicinc.com>, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 marijn.suijten@somainline.org, quic_vpolimer@quicinc.com, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paloma Arellano <quic_parellan@quicinc.com>

[ Upstream commit 45284ff733e4caf6c118aae5131eb7e7cf3eea5a ]

Add a mutex lock to control vblank irq to synchronize vblank
enable/disable operations happening from different threads to prevent
race conditions while registering/unregistering the vblank irq callback.

v4: -Removed vblank_ctl_lock from dpu_encoder_virt, so it is only a
    parameter of dpu_encoder_phys.
    -Switch from atomic refcnt to a simple int counter as mutex has
    now been added
v3: Mistakenly did not change wording in last version. It is done now.
v2: Slightly changed wording of commit message

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Patchwork: https://patchwork.freedesktop.org/patch/571854/
Link: https://lore.kernel.org/r/20231212231101.9240-2-quic_parellan@quicinc.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 ++-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 32 ++++++++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 33 ++++++++++++-------
 4 files changed, 47 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ff0e3591b44d..289e4a615a08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2500,7 +2500,6 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 	phys_enc->enc_spinlock = p->enc_spinlock;
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 
-	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
 	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 6f04c3d56e77..96bda57b6959 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -155,6 +155,7 @@ enum dpu_intr_idx {
  * @hw_wb:		Hardware interface to the wb registers
  * @dpu_kms:		Pointer to the dpu_kms top level
  * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
+ * @vblank_ctl_lock:	Vblank ctl mutex lock to protect vblank_refcount
  * @enabled:		Whether the encoder has enabled and running a mode
  * @split_role:		Role to play in a split-panel configuration
  * @intf_mode:		Interface mode
@@ -183,11 +184,12 @@ struct dpu_encoder_phys {
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode cached_mode;
+	struct mutex vblank_ctl_lock;
 	enum dpu_enc_split_role split_role;
 	enum dpu_intf_mode intf_mode;
 	spinlock_t *enc_spinlock;
 	enum dpu_enc_enable_state enable_state;
-	atomic_t vblank_refcount;
+	int vblank_refcount;
 	atomic_t vsync_cnt;
 	atomic_t underrun_cnt;
 	atomic_t pending_ctlstart_cnt;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index be185fe69793..2d788c5e26a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -244,7 +244,8 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 		return -EINVAL;
 	}
 
-	refcount = atomic_read(&phys_enc->vblank_refcount);
+	mutex_lock(&phys_enc->vblank_ctl_lock);
+	refcount = phys_enc->vblank_refcount;
 
 	/* Slave encoders don't report vblank */
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
@@ -260,16 +261,24 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 		      phys_enc->hw_pp->idx - PINGPONG_0,
 		      enable ? "true" : "false", refcount);
 
-	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
-		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_RDPTR],
-				dpu_encoder_phys_cmd_te_rd_ptr_irq,
-				phys_enc);
-	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
-		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_RDPTR]);
+	if (enable) {
+		if (phys_enc->vblank_refcount == 0)
+			ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
+					phys_enc->irq[INTR_IDX_RDPTR],
+					dpu_encoder_phys_cmd_te_rd_ptr_irq,
+					phys_enc);
+		if (!ret)
+			phys_enc->vblank_refcount++;
+	} else if (!enable) {
+		if (phys_enc->vblank_refcount == 1)
+			ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+					phys_enc->irq[INTR_IDX_RDPTR]);
+		if (!ret)
+			phys_enc->vblank_refcount--;
+	}
 
 end:
+	mutex_unlock(&phys_enc->vblank_ctl_lock);
 	if (ret) {
 		DRM_ERROR("vblank irq err id:%u pp:%d ret:%d, enable %s/%d\n",
 			  DRMID(phys_enc->parent),
@@ -285,7 +294,7 @@ static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
 {
 	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
 			phys_enc->hw_pp->idx - PINGPONG_0,
-			enable, atomic_read(&phys_enc->vblank_refcount));
+			enable, phys_enc->vblank_refcount);
 
 	if (enable) {
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
@@ -763,6 +772,9 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 
 	dpu_encoder_phys_init(phys_enc, p);
 
+	mutex_init(&phys_enc->vblank_ctl_lock);
+	phys_enc->vblank_refcount = 0;
+
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index a01fda711883..eeb0acf9665e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -364,7 +364,8 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 	int ret = 0;
 	int refcount;
 
-	refcount = atomic_read(&phys_enc->vblank_refcount);
+	mutex_lock(&phys_enc->vblank_ctl_lock);
+	refcount = phys_enc->vblank_refcount;
 
 	/* Slave encoders don't report vblank */
 	if (!dpu_encoder_phys_vid_is_master(phys_enc))
@@ -377,18 +378,26 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 	}
 
 	DRM_DEBUG_VBL("id:%u enable=%d/%d\n", DRMID(phys_enc->parent), enable,
-		      atomic_read(&phys_enc->vblank_refcount));
+		      refcount);
 
-	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
-		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_VSYNC],
-				dpu_encoder_phys_vid_vblank_irq,
-				phys_enc);
-	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
-		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_VSYNC]);
+	if (enable) {
+		if (phys_enc->vblank_refcount == 0)
+			ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
+					phys_enc->irq[INTR_IDX_VSYNC],
+					dpu_encoder_phys_vid_vblank_irq,
+					phys_enc);
+		if (!ret)
+			phys_enc->vblank_refcount++;
+	} else if (!enable) {
+		if (phys_enc->vblank_refcount == 1)
+			ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+					phys_enc->irq[INTR_IDX_VSYNC]);
+		if (!ret)
+			phys_enc->vblank_refcount--;
+	}
 
 end:
+	mutex_unlock(&phys_enc->vblank_ctl_lock);
 	if (ret) {
 		DRM_ERROR("failed: id:%u intf:%d ret:%d enable:%d refcnt:%d\n",
 			  DRMID(phys_enc->parent),
@@ -618,7 +627,7 @@ static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
 	trace_dpu_enc_phys_vid_irq_ctrl(DRMID(phys_enc->parent),
 			    phys_enc->hw_intf->idx - INTF_0,
 			    enable,
-			    atomic_read(&phys_enc->vblank_refcount));
+			   phys_enc->vblank_refcount);
 
 	if (enable) {
 		ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
@@ -713,6 +722,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
 	dpu_encoder_phys_init(phys_enc, p);
+	mutex_init(&phys_enc->vblank_ctl_lock);
+	phys_enc->vblank_refcount = 0;
 
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
-- 
2.43.0

