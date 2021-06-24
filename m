Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84563B31EE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5DF6EC13;
	Thu, 24 Jun 2021 14:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758BC6EC14
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u13so10831798lfk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zdxuO3FXcMYXnxkLpZHy8crKZag9SkX+E8b620Ln9pw=;
 b=cykGp7ubjyVx8XXCI0fgrRViUFGxjm6cjAzX0svOBQMbugUbJivFvBvyN57aLUv1+S
 4iUG6X23ACy2rtX2bKN3M7iFaopOh7h2MJhDkeYhseKGTBH6A4Fe1rUCqmFXKwqvA7H4
 4PWbLJF2nECpLfDa94DcQCqbxZo2Q1t9UP1sur5sgYhPN5PI5tnU3DL/P7jmTuxDcQ1i
 XdztqWdsz2UyPgniZT0IRdNwEAb5Lt6ti2BvAhZc7QaHqetdRysMXMreyRJGAG+W1LY2
 +G7kwRlcrSiQnsl9PE47939+Neyn8DLrf9/Flboc42u0VqIXE5oKSSIeQb66px1mCM3V
 UoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zdxuO3FXcMYXnxkLpZHy8crKZag9SkX+E8b620Ln9pw=;
 b=AfSo41FrDqU7zvGNXurMghRu85uxwRSPFlpo1XsrIslCEdekmmWyJnR51UKwxmw1Kn
 qiErv2HgzuTvqLAWcUwrS4IwhMF7n1M57QSxZcXASISdBOtuPIJAo56s8XtBSkzdihdM
 Gtq/6p5mmNfqGJA6+6EygkHcdG15rUcJMVbods9ghoaEIRR3yO648H0neTnDUW6LtuYg
 3oKwqIVsZlr2yYUatEYjbsDkHRZ4pSahCq3TbhsXwquUQ1AMGhnq9bvwFJbgBclBIIZh
 MBtLaEl2KcMBcBJbcNKeUBe6bjrL7WCcn4ZqIy8ObQlra5yNXut35Vh/4butmSTZjKrM
 4Ycg==
X-Gm-Message-State: AOAM531FlcE5aWDyOj9Kel7mHtDVfhIzp71POF54givDZy5WwpO6mShW
 pVaxgQu86nInhQqj0Zr2uBw0og==
X-Google-Smtp-Source: ABdhPJwfJuAkhwSISm311pz7Q4TJDDd/JyHFZufGZe9QWOQ/eT/swqdfLoEPWKp3p6i2VUPoN5mR1A==
X-Received: by 2002:ac2:597a:: with SMTP id h26mr4194874lfp.406.1624546658871; 
 Thu, 24 Jun 2021 07:57:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 01/17] drm/msm/dpu: move LUT levels out of QOS config
Date: Thu, 24 Jun 2021 17:57:17 +0300
Message-Id: <20210624145733.2561992-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LUT levels are setup outside of setup_qos_ctrl, so remove them from the
struct dpu_hw_pipe_qos_cfg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 15 ++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 16 ++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 17 ++++++-----------
 3 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 69eed7932486..cbafb61404d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -569,19 +569,20 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_pipe *ctx, u32 color, enum
 }
 
 static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_qos_cfg *cfg)
+			u32 danger_lut,
+			u32 safe_lut)
 {
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT + idx, cfg->danger_lut);
-	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, cfg->safe_lut);
+	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT + idx, danger_lut);
+	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, safe_lut);
 }
 
 static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_qos_cfg *cfg)
+			u64 creq_lut)
 {
 	u32 idx;
 
@@ -589,11 +590,11 @@ static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
 		return;
 
 	if (ctx->cap && test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features)) {
-		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0 + idx, cfg->creq_lut);
+		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0 + idx, creq_lut);
 		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_1 + idx,
-				cfg->creq_lut >> 32);
+				creq_lut >> 32);
 	} else {
-		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT + idx, cfg->creq_lut);
+		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT + idx, creq_lut);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index fdfd4b46e2c6..27263bc1a1ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -166,18 +166,12 @@ struct dpu_hw_pipe_cfg {
 
 /**
  * struct dpu_hw_pipe_qos_cfg : Source pipe QoS configuration
- * @danger_lut: LUT for generate danger level based on fill level
- * @safe_lut: LUT for generate safe level based on fill level
- * @creq_lut: LUT for generate creq level based on fill level
  * @creq_vblank: creq value generated to vbif during vertical blanking
  * @danger_vblank: danger value generated during vertical blanking
  * @vblank_en: enable creq_vblank and danger_vblank during vblank
  * @danger_safe_en: enable danger safe generation
  */
 struct dpu_hw_pipe_qos_cfg {
-	u32 danger_lut;
-	u32 safe_lut;
-	u64 creq_lut;
 	u32 creq_vblank;
 	u32 danger_vblank;
 	bool vblank_en;
@@ -302,20 +296,22 @@ struct dpu_hw_sspp_ops {
 	/**
 	 * setup_danger_safe_lut - setup danger safe LUTs
 	 * @ctx: Pointer to pipe context
-	 * @cfg: Pointer to pipe QoS configuration
+	 * @danger_lut: LUT for generate danger level based on fill level
+	 * @safe_lut: LUT for generate safe level based on fill level
 	 *
 	 */
 	void (*setup_danger_safe_lut)(struct dpu_hw_pipe *ctx,
-			struct dpu_hw_pipe_qos_cfg *cfg);
+			u32 danger_lut,
+			u32 safe_lut);
 
 	/**
 	 * setup_creq_lut - setup CREQ LUT
 	 * @ctx: Pointer to pipe context
-	 * @cfg: Pointer to pipe QoS configuration
+	 * @creq_lut: LUT for generate creq level based on fill level
 	 *
 	 */
 	void (*setup_creq_lut)(struct dpu_hw_pipe *ctx,
-			struct dpu_hw_pipe_qos_cfg *cfg);
+			u64 creq_lut);
 
 	/**
 	 * setup_qos_ctrl - setup QoS control
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ec4a6f04394a..1e2c53a3f47b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -348,8 +348,6 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 	qos_lut = _dpu_plane_get_qos_lut(
 			&pdpu->catalog->perf.qos_lut_tbl[lut_usage], total_fl);
 
-	pdpu->pipe_qos_cfg.creq_lut = qos_lut;
-
 	trace_dpu_perf_set_qos_luts(pdpu->pipe - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
 			pdpu->is_rt_pipe, total_fl, qos_lut, lut_usage);
@@ -359,7 +357,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			fmt ? (char *)&fmt->base.pixel_format : NULL,
 			pdpu->is_rt_pipe, total_fl, qos_lut);
 
-	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, &pdpu->pipe_qos_cfg);
+	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, qos_lut);
 }
 
 /**
@@ -397,24 +395,21 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		}
 	}
 
-	pdpu->pipe_qos_cfg.danger_lut = danger_lut;
-	pdpu->pipe_qos_cfg.safe_lut = safe_lut;
-
 	trace_dpu_perf_set_danger_luts(pdpu->pipe - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
 			(fmt) ? fmt->fetch_mode : 0,
-			pdpu->pipe_qos_cfg.danger_lut,
-			pdpu->pipe_qos_cfg.safe_lut);
+			danger_lut,
+			safe_lut);
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s mode:%d luts[0x%x, 0x%x]\n",
 		pdpu->pipe - SSPP_VIG0,
 		fmt ? (char *)&fmt->base.pixel_format : NULL,
 		fmt ? fmt->fetch_mode : -1,
-		pdpu->pipe_qos_cfg.danger_lut,
-		pdpu->pipe_qos_cfg.safe_lut);
+		danger_lut,
+		safe_lut);
 
 	pdpu->pipe_hw->ops.setup_danger_safe_lut(pdpu->pipe_hw,
-			&pdpu->pipe_qos_cfg);
+			danger_lut, safe_lut);
 }
 
 /**
-- 
2.30.2

