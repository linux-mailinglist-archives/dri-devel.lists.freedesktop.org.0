Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB2F347B6C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B5D6EBB7;
	Wed, 24 Mar 2021 15:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44646EC5C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:51 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id n138so32439066lfa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YpnhVRI0osV9SLwEgj/UyBszU1XPTdC6tTCpmF9tbKM=;
 b=HWlQvpGixVBxwkNt6pBtJ6mbUfh/YAbJ+MzBAhMWUEo4o5lZ2Jhdd7qr+HDOHmI1kP
 2kJ7wiYRuMLi7k3vDyEnXWLc/OMCcs/hFR+bgSlOB+xeVFCHwtoVwh4ykYilPbVN9vrf
 NwuVMJW9V5V5jpActQ1Z5xibhrMwzLttFhSvcTOZ6Ynfi28aonouzOIouYQah/NkVI5U
 rvILbN3kME8QtPyzhr1U+wIffn9U8Bo2iMR9qpZSoI78tQyaLDmq4FLmoA84Hkr8a3tP
 7gOxdPlfxdCKHqSJfbtz0nNJ09XW+8BkYd+wpWhnnPTUCKghRzYKpLxuOnpP/TRGCPtb
 +Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YpnhVRI0osV9SLwEgj/UyBszU1XPTdC6tTCpmF9tbKM=;
 b=s1xddNNGIfX6K7dJEN4xZR7N4AVPqzCStTfKf86kpGueWVcYZ5i36e7i5ikhLRGZGX
 zsHP9Fbx+0bhe44e0v1e1Kygj8GzaBCgUW/IFjHshhgFQQjvUsJ1QXbYEY35KeZhxRDL
 58AlLsuhBIcnAV1p7zC7aVrf34WwukGmHzikXJHhwGyLZz09/0bJagE8/AJFGHebDJ0S
 66zEwHk/j0yCT/bCRUD+qFOaHZZbQlWY8hutr7nSLZI+NEPwsByvtOvUTNP8KTDQxjNK
 DQut9pJ1Yb6foFoDlunDIvQqsRJbpTz2cyvhKvgtd4wcqH9/3XZTsN2gZFCdGAjkczsK
 dhlA==
X-Gm-Message-State: AOAM531TqZSs0JGKV1Cr3YCAO+33ZEDEPmIThIYbRWsLUuosXRyhR5eZ
 LD59Ylx9CYGQCrYIu67GWtBEQA==
X-Google-Smtp-Source: ABdhPJx6b9nV38fgFZ/MVlcIKezTQfHW7bspK2gQBlEaUOryVyY07nU+8l2KDSeyGBrV2YdDvfM05Q==
X-Received: by 2002:ac2:491d:: with SMTP id n29mr2232810lfi.541.1616598049666; 
 Wed, 24 Mar 2021 08:00:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 16/21] drm/msm/dpu: call hw_intf ops directly
Date: Wed, 24 Mar 2021 18:00:19 +0300
Message-Id: <20210324150024.2768215-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace dpu_hw_intf callbacks with direct functions calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 28 +++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 28 ++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 49 +++++++++----------
 3 files changed, 38 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 868bb2f06125..e7a30246eb00 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -202,9 +202,6 @@ static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
 	u32 vfp_fetch_start_vsync_counter = 0;
 	unsigned long lock_flags;
 
-	if (WARN_ON_ONCE(!phys_enc->hw_intf->ops.setup_prg_fetch))
-		return;
-
 	vfp_fetch_lines = programmable_fetch_get_num_lines(phys_enc, timing);
 	if (vfp_fetch_lines) {
 		vert_total = get_vertical_total(timing);
@@ -220,7 +217,7 @@ static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
 		vfp_fetch_lines, vfp_fetch_start_vsync_counter);
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
-	phys_enc->hw_intf->ops.setup_prg_fetch(phys_enc->hw_intf, &f);
+	dpu_hw_intf_setup_prg_fetch(phys_enc->hw_intf, &f);
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 }
 
@@ -253,10 +250,6 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	}
 
 	mode = phys_enc->cached_mode;
-	if (!phys_enc->hw_intf->ops.setup_timing_gen) {
-		DPU_ERROR("timing engine setup is not supported\n");
-		return;
-	}
 
 	DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
 	drm_mode_debug_printmodeline(&mode);
@@ -287,13 +280,12 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
-	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
+	dpu_hw_intf_setup_timing_engine(phys_enc->hw_intf,
 			&timing_params, fmt);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
-	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
-		phys_enc->hw_intf->ops.bind_pingpong_blk(
+	dpu_hw_intf_bind_pingpong_blk(
 				phys_enc->hw_intf,
 				true,
 				phys_enc->hw_pp->idx);
@@ -440,9 +432,6 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
-	if (WARN_ON(!phys_enc->hw_intf->ops.enable_timing))
-		return;
-
 	dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
 
 	dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
@@ -560,16 +549,13 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 		return;
 	}
 
-	if (WARN_ON(!phys_enc->hw_intf->ops.enable_timing))
-		return;
-
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
 		DPU_ERROR("already disabled\n");
 		return;
 	}
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
-	phys_enc->hw_intf->ops.enable_timing(phys_enc->hw_intf, 0);
+	dpu_hw_intf_enable_timing_engine(phys_enc->hw_intf, 0);
 	if (dpu_encoder_phys_vid_is_master(phys_enc))
 		dpu_encoder_phys_inc_pending(phys_enc);
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
@@ -608,7 +594,7 @@ static void dpu_encoder_phys_vid_handle_post_kickoff(
 		trace_dpu_enc_phys_vid_post_kickoff(DRMID(phys_enc->parent),
 				    phys_enc->hw_intf->idx - INTF_0);
 		spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
-		phys_enc->hw_intf->ops.enable_timing(phys_enc->hw_intf, 1);
+		dpu_hw_intf_enable_timing_engine(phys_enc->hw_intf, 1);
 		spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 		phys_enc->enable_state = DPU_ENC_ENABLED;
 	}
@@ -642,10 +628,10 @@ static int dpu_encoder_phys_vid_get_line_count(
 	if (!dpu_encoder_phys_vid_is_master(phys_enc))
 		return -EINVAL;
 
-	if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.get_line_count)
+	if (!phys_enc->hw_intf)
 		return -EINVAL;
 
-	return phys_enc->hw_intf->ops.get_line_count(phys_enc->hw_intf);
+	return dpu_hw_intf_get_line_count(phys_enc->hw_intf);
 }
 
 static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8df75936d906..3988700dcc85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -80,7 +80,7 @@ static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
 	return ERR_PTR(-EINVAL);
 }
 
-static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
+void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 		const struct intf_timing_params *p,
 		const struct dpu_format *fmt)
 {
@@ -197,7 +197,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
 }
 
-static void dpu_hw_intf_enable_timing_engine(
+void dpu_hw_intf_enable_timing_engine(
 		struct dpu_hw_intf *intf,
 		u8 enable)
 {
@@ -206,7 +206,7 @@ static void dpu_hw_intf_enable_timing_engine(
 	DPU_REG_WRITE(c, INTF_TIMING_ENGINE_EN, enable != 0);
 }
 
-static void dpu_hw_intf_setup_prg_fetch(
+void dpu_hw_intf_setup_prg_fetch(
 		struct dpu_hw_intf *intf,
 		const struct intf_prog_fetch *fetch)
 {
@@ -230,7 +230,7 @@ static void dpu_hw_intf_setup_prg_fetch(
 	DPU_REG_WRITE(c, INTF_CONFIG, fetch_enable);
 }
 
-static void dpu_hw_intf_bind_pingpong_blk(
+void dpu_hw_intf_bind_pingpong_blk(
 		struct dpu_hw_intf *intf,
 		bool enable,
 		const enum dpu_pingpong pp)
@@ -238,6 +238,9 @@ static void dpu_hw_intf_bind_pingpong_blk(
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 mux_cfg;
 
+	if (!test_bit(DPU_INTF_INPUT_CTRL, &intf->cap->features))
+		return;
+
 	mux_cfg = DPU_REG_READ(c, INTF_MUX);
 	mux_cfg &= ~0xf;
 
@@ -249,7 +252,7 @@ static void dpu_hw_intf_bind_pingpong_blk(
 	DPU_REG_WRITE(c, INTF_MUX, mux_cfg);
 }
 
-static void dpu_hw_intf_get_status(
+void dpu_hw_intf_get_status(
 		struct dpu_hw_intf *intf,
 		struct intf_status *s)
 {
@@ -265,7 +268,7 @@ static void dpu_hw_intf_get_status(
 	}
 }
 
-static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
+u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
 {
 	struct dpu_hw_blk_reg_map *c;
 
@@ -277,18 +280,6 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
 	return DPU_REG_READ(c, INTF_LINE_COUNT);
 }
 
-static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
-		unsigned long cap)
-{
-	ops->setup_timing_gen = dpu_hw_intf_setup_timing_engine;
-	ops->setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
-	ops->get_status = dpu_hw_intf_get_status;
-	ops->enable_timing = dpu_hw_intf_enable_timing_engine;
-	ops->get_line_count = dpu_hw_intf_get_line_count;
-	if (cap & BIT(DPU_INTF_INPUT_CTRL))
-		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
-}
-
 struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
@@ -313,7 +304,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 	c->idx = idx;
 	c->cap = cfg;
 	c->mdss = m;
-	_setup_intf_ops(&c->ops, c->cap->features);
 
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_INTF, idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 0ead64d3f63d..8661571fec67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -44,37 +44,35 @@ struct intf_status {
 	u32 line_count;		/* current line count including blanking */
 };
 
-/**
- * struct dpu_hw_intf_ops : Interface to the interface Hw driver functions
+/*
  *  Assumption is these functions will be called after clocks are enabled
- * @ setup_timing_gen : programs the timing engine
- * @ setup_prog_fetch : enables/disables the programmable fetch logic
- * @ enable_timing: enable/disable timing engine
- * @ get_status: returns if timing engine is enabled or not
- * @ get_line_count: reads current vertical line counter
- * @bind_pingpong_blk: enable/disable the connection with pingpong which will
- *                     feed pixels to this interface
  */
-struct dpu_hw_intf_ops {
-	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
-			const struct intf_timing_params *p,
-			const struct dpu_format *fmt);
 
-	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
-			const struct intf_prog_fetch *fetch);
+/* dpu_hw_intf_setup_timing_engine: programs the timing engine */
+void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
+		const struct intf_timing_params *p,
+		const struct dpu_format *fmt);
 
-	void (*enable_timing)(struct dpu_hw_intf *intf,
-			u8 enable);
+/* dpu_hw_intf_setup_prg_fetch : enables/disables the programmable fetch logic */
+void dpu_hw_intf_setup_prg_fetch(struct dpu_hw_intf *intf,
+		const struct intf_prog_fetch *fetch);
 
-	void (*get_status)(struct dpu_hw_intf *intf,
-			struct intf_status *status);
+/* dpu_hw_intf_enable_timing_engine: enable/disable timing engine */
+void dpu_hw_intf_enable_timing_engine(struct dpu_hw_intf *intf,
+		u8 enable);
 
-	u32 (*get_line_count)(struct dpu_hw_intf *intf);
+/* dpu_hw_intf_get_status: returns if timing engine is enabled or not */
+void dpu_hw_intf_get_status(struct dpu_hw_intf *intf,
+		struct intf_status *status);
 
-	void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
-			bool enable,
-			const enum dpu_pingpong pp);
-};
+/* dpu_hw_intf_get_line_count: reads current vertical line counter */
+u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf);
+
+/* dpu_hw_intf_bind_pingpong_blk: enable/disable the connection with pingpong
+ * which will feed pixels to this interface */
+void dpu_hw_intf_bind_pingpong_blk(struct dpu_hw_intf *intf,
+		bool enable,
+		const enum dpu_pingpong pp);
 
 struct dpu_hw_intf {
 	struct dpu_hw_blk base;
@@ -84,9 +82,6 @@ struct dpu_hw_intf {
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
 	const struct dpu_mdss_cfg *mdss;
-
-	/* ops */
-	struct dpu_hw_intf_ops ops;
 };
 
 /**
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
