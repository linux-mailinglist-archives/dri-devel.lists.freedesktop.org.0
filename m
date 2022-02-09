Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2F74AF822
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CF910E407;
	Wed,  9 Feb 2022 17:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9426910E40C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:31 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bu29so324675lfb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TGzO28ZqexTrCZdbuG9OLZmVoU9i/k72luIGwLIkMAY=;
 b=ph+L0rqwniwIRHgOPRuTotf+FkCLXUJsyAt229g/frU9Rrk0LkpgbKUXIwhjABS5vr
 5A3WIt0cT2ee9adCF60JexiJ154ypuWol/aZNfYzPFNP+Pcnl7tqpqobbXXB+dtbXaYu
 sRHtiVKYVcPAb/JAC8RoYP1i4sxGqhTOcmTmGpZw+L+QlTYSAfW4EMK4rFzliV3phqRt
 JMsBR260bP8/GglcYA/61J4ZjsyiL2nNQ3N1IF23e2c5uic9qkTQt/KC4OAi1WUYTPvG
 171UXCABMVOkYIu+NbykOr++/kQdJVYdsLcFITroUmSmjxE1sfi6gCYe11tQPcpgm1/5
 F2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TGzO28ZqexTrCZdbuG9OLZmVoU9i/k72luIGwLIkMAY=;
 b=0lRCEOvvQkWhHvuFxQeULLn17hpplDQETJfqoaUgeUzJ2KAXPGnsME5Aw8gRBQPsL4
 5F+ldHE6R1gEkCWDso11T1I6ueS3N1iHi5dn9QwkxoUGGefJfRvOGHB9Zfe5u+U324JM
 g8D8AwsyFw2Fxprd4aaw2PSWAMQ7f+2IUwtP8XGFQkQwk3aXg21lci7y5f6DX8vKMnkv
 4wCZJQiajR0L37D+Hdv5uyqpBHDkJHZSuaF/RHNLggj1MVMvQcTriLqEw4icGDZMmczi
 XL7+sJ0/ptsQPpcZLcoCP92YLAVNw09h/fCxdYBeaK1qvz3sF4OQ3iyoCIJtzrBgvR5h
 mpFA==
X-Gm-Message-State: AOAM530o6LoO8gwTIkT4ngzhdWeZCjN6Gm3oJGM13S+QAUQ9Kwop2lbp
 Rr+S1EZgTJlOQg9QWBNA7PD5YQ==
X-Google-Smtp-Source: ABdhPJxwmwyfT5us2lR4w45nDwW8F1nYSvONM7Gy9FSWv5EVE+9WQi7G7jzgoiZgvk1IVGuWRJ8p3Q==
X-Received: by 2002:a05:6512:c13:: with SMTP id
 z19mr2257766lfu.309.1644427529878; 
 Wed, 09 Feb 2022 09:25:29 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 08/25] drm/msm/dpu: get rid of cached flush_mask
Date: Wed,  9 Feb 2022 20:25:03 +0300
Message-Id: <20220209172520.3719906-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of querying the CTL for the flush mask (for SSPP, LM or DSPP),
storing the mask in the mixer configuration and then pushing the mask to
the CTL, tell CTL to cache the flush in place.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c   | 25 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 78 +++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 35 +++++++---
 4 files changed, 66 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d21791db6ab1..e6c33022d560 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -396,7 +396,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 			_dpu_crtc_setup_blend_cfg(mixer + lm_idx,
 						pstate, format);
 
-			mixer[lm_idx].flush_mask |= ctl->ops.get_bitmask_sspp(ctl, sspp_idx);
+			mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
@@ -430,7 +430,6 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		mixer[i].mixer_op_mode = 0;
-		mixer[i].flush_mask = 0;
 		if (mixer[i].lm_ctl->ops.clear_all_blendstages)
 			mixer[i].lm_ctl->ops.clear_all_blendstages(
 					mixer[i].lm_ctl);
@@ -447,17 +446,14 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 
 		lm->ops.setup_alpha_out(lm, mixer[i].mixer_op_mode);
 
-		mixer[i].flush_mask |= ctl->ops.get_bitmask_mixer(ctl,
-			mixer[i].hw_lm->idx);
-
 		/* stage config flush mask */
-		ctl->ops.update_pending_flush(ctl, mixer[i].flush_mask);
+		ctl->ops.update_pending_flush_mixer(ctl,
+			mixer[i].hw_lm->idx);
 
-		DRM_DEBUG_ATOMIC("lm %d, op_mode 0x%X, ctl %d, flush mask 0x%x\n",
+		DRM_DEBUG_ATOMIC("lm %d, op_mode 0x%X, ctl %d\n",
 			mixer[i].hw_lm->idx - LM_0,
 			mixer[i].mixer_op_mode,
-			ctl->idx - CTL_0,
-			mixer[i].flush_mask);
+			ctl->idx - CTL_0);
 
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
 			&stage_cfg);
@@ -701,16 +697,9 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 			dspp->ops.setup_pcc(dspp, &cfg);
 		}
 
-		mixer[i].flush_mask |= ctl->ops.get_bitmask_dspp(ctl,
-			mixer[i].hw_dspp->idx);
-
 		/* stage config flush mask */
-		ctl->ops.update_pending_flush(ctl, mixer[i].flush_mask);
-
-		DRM_DEBUG_ATOMIC("lm %d, ctl %d, flush mask 0x%x\n",
-			mixer[i].hw_lm->idx - DSPP_0,
-			ctl->idx - CTL_0,
-			mixer[i].flush_mask);
+		ctl->ops.update_pending_flush_dspp(ctl,
+			mixer[i].hw_dspp->idx);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b8785c394fcc..9f87fc32b1bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -95,7 +95,6 @@ struct dpu_crtc_mixer {
 	struct dpu_hw_ctl *lm_ctl;
 	struct dpu_hw_dspp *hw_dspp;
 	u32 mixer_op_mode;
-	u32 flush_mask;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 02da9ecf71f1..8dc59659bd18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -139,92 +139,84 @@ static inline void dpu_hw_ctl_trigger_flush(struct dpu_hw_ctl *ctx)
 	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
 }
 
-static uint32_t dpu_hw_ctl_get_bitmask_sspp(struct dpu_hw_ctl *ctx,
+static void dpu_hw_ctl_update_pending_flush_sspp(struct dpu_hw_ctl *ctx,
 	enum dpu_sspp sspp)
 {
-	uint32_t flushbits = 0;
-
 	switch (sspp) {
 	case SSPP_VIG0:
-		flushbits =  BIT(0);
+		ctx->pending_flush_mask |=  BIT(0);
 		break;
 	case SSPP_VIG1:
-		flushbits = BIT(1);
+		ctx->pending_flush_mask |= BIT(1);
 		break;
 	case SSPP_VIG2:
-		flushbits = BIT(2);
+		ctx->pending_flush_mask |= BIT(2);
 		break;
 	case SSPP_VIG3:
-		flushbits = BIT(18);
+		ctx->pending_flush_mask |= BIT(18);
 		break;
 	case SSPP_RGB0:
-		flushbits = BIT(3);
+		ctx->pending_flush_mask |= BIT(3);
 		break;
 	case SSPP_RGB1:
-		flushbits = BIT(4);
+		ctx->pending_flush_mask |= BIT(4);
 		break;
 	case SSPP_RGB2:
-		flushbits = BIT(5);
+		ctx->pending_flush_mask |= BIT(5);
 		break;
 	case SSPP_RGB3:
-		flushbits = BIT(19);
+		ctx->pending_flush_mask |= BIT(19);
 		break;
 	case SSPP_DMA0:
-		flushbits = BIT(11);
+		ctx->pending_flush_mask |= BIT(11);
 		break;
 	case SSPP_DMA1:
-		flushbits = BIT(12);
+		ctx->pending_flush_mask |= BIT(12);
 		break;
 	case SSPP_DMA2:
-		flushbits = BIT(24);
+		ctx->pending_flush_mask |= BIT(24);
 		break;
 	case SSPP_DMA3:
-		flushbits = BIT(25);
+		ctx->pending_flush_mask |= BIT(25);
 		break;
 	case SSPP_CURSOR0:
-		flushbits = BIT(22);
+		ctx->pending_flush_mask |= BIT(22);
 		break;
 	case SSPP_CURSOR1:
-		flushbits = BIT(23);
+		ctx->pending_flush_mask |= BIT(23);
 		break;
 	default:
 		break;
 	}
-
-	return flushbits;
 }
 
-static uint32_t dpu_hw_ctl_get_bitmask_mixer(struct dpu_hw_ctl *ctx,
+static void dpu_hw_ctl_update_pending_flush_mixer(struct dpu_hw_ctl *ctx,
 	enum dpu_lm lm)
 {
-	uint32_t flushbits = 0;
-
 	switch (lm) {
 	case LM_0:
-		flushbits = BIT(6);
+		ctx->pending_flush_mask |= BIT(6);
 		break;
 	case LM_1:
-		flushbits = BIT(7);
+		ctx->pending_flush_mask |= BIT(7);
 		break;
 	case LM_2:
-		flushbits = BIT(8);
+		ctx->pending_flush_mask |= BIT(8);
 		break;
 	case LM_3:
-		flushbits = BIT(9);
+		ctx->pending_flush_mask |= BIT(9);
 		break;
 	case LM_4:
-		flushbits = BIT(10);
+		ctx->pending_flush_mask |= BIT(10);
 		break;
 	case LM_5:
-		flushbits = BIT(20);
+		ctx->pending_flush_mask |= BIT(20);
 		break;
 	default:
-		return -EINVAL;
+		break;
 	}
 
-	flushbits |= CTL_FLUSH_MASK_CTL;
-
-	return flushbits;
+	ctx->pending_flush_mask |= CTL_FLUSH_MASK_CTL;
 }
 
 static void dpu_hw_ctl_update_pending_flush_intf(struct dpu_hw_ctl *ctx,
@@ -262,29 +254,25 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
 	ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
 }
 
-static uint32_t dpu_hw_ctl_get_bitmask_dspp(struct dpu_hw_ctl *ctx,
+static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
 	enum dpu_dspp dspp)
 {
-	uint32_t flushbits = 0;
-
 	switch (dspp) {
 	case DSPP_0:
-		flushbits = BIT(13);
+		ctx->pending_flush_mask |= BIT(13);
 		break;
 	case DSPP_1:
-		flushbits = BIT(14);
+		ctx->pending_flush_mask |= BIT(14);
 		break;
 	case DSPP_2:
-		flushbits = BIT(15);
+		ctx->pending_flush_mask |= BIT(15);
 		break;
 	case DSPP_3:
-		flushbits = BIT(21);
+		ctx->pending_flush_mask |= BIT(21);
 		break;
 	default:
-		return 0;
+		break;
 	}
-
-	return flushbits;
 }
 
 static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32 timeout_us)
@@ -592,9 +580,9 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
 	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
 	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
-	ops->get_bitmask_sspp = dpu_hw_ctl_get_bitmask_sspp;
-	ops->get_bitmask_mixer = dpu_hw_ctl_get_bitmask_mixer;
-	ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp;
+	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
+	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
+	ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
 		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 806c171e5df2..84e8167c23a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -110,6 +110,32 @@ struct dpu_hw_ctl_ops {
 	void (*update_pending_flush_merge_3d)(struct dpu_hw_ctl *ctx,
 		enum dpu_merge_3d blk);
 
+	/**
+	 * OR in the given flushbits to the cached pending_flush_mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 * @blk       : SSPP block index
+	 */
+	void (*update_pending_flush_sspp)(struct dpu_hw_ctl *ctx,
+		enum dpu_sspp blk);
+
+	/**
+	 * OR in the given flushbits to the cached pending_flush_mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 * @blk       : LM block index
+	 */
+	void (*update_pending_flush_mixer)(struct dpu_hw_ctl *ctx,
+		enum dpu_lm blk);
+
+	/**
+	 * OR in the given flushbits to the cached pending_flush_mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 * @blk       : DSPP block index
+	 */
+	void (*update_pending_flush_dspp)(struct dpu_hw_ctl *ctx,
+		enum dpu_dspp blk);
 	/**
 	 * Write the value of the pending_flush_mask to hardware
 	 * @ctx       : ctl path ctx pointer
@@ -144,15 +170,6 @@ struct dpu_hw_ctl_ops {
 	 */
 	int (*wait_reset_status)(struct dpu_hw_ctl *ctx);
 
-	uint32_t (*get_bitmask_sspp)(struct dpu_hw_ctl *ctx,
-		enum dpu_sspp blk);
-
-	uint32_t (*get_bitmask_mixer)(struct dpu_hw_ctl *ctx,
-		enum dpu_lm blk);
-
-	uint32_t (*get_bitmask_dspp)(struct dpu_hw_ctl *ctx,
-		enum dpu_dspp blk);
-
 	/**
 	 * Set all blend stages to disabled
 	 * @ctx       : ctl path ctx pointer
-- 
2.34.1

