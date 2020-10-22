Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7014E296A40
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66B56E4AD;
	Fri, 23 Oct 2020 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2096F52A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 13:17:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c141so2221887lfg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 06:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RL04LI93FOQ4yVNEQP9KahqHB0gaKlDd1DGby7YDZ6Y=;
 b=zjYIzK3hl3B+Bb0IQuRS7RphIQOSZZeVvfEt4o6PP2tjeUvUwHwr6vn3cpC/aGvbTo
 HRkSS57Lej7uChG3KuPUVEb5qEEydAz/NRjQ4LoL9L/qaoLjZoaxJwxpKDN6v4pXusUX
 p1b/l6z4/jGiY6c5M/5X91FXjPZebtFd/Z0SNBkbAP5+ghv23DOId/Fj90/p/IL6e9x5
 a2nb/+9G+Q8kXfX4zikMBQ8zxqZsa1o38aL2XaAQkTEsepu31u/iG5n1UbvW2Auhi0wc
 UGGZhmMlHs4TxGoQJl+zTJ54oh6U+8eYXSY9+IM+Ap7zlCnHe9C6tDchwLfD03jyqD/e
 Xc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RL04LI93FOQ4yVNEQP9KahqHB0gaKlDd1DGby7YDZ6Y=;
 b=SepdkcxLoF6xedmGixhluT8y6NEdfeKdOd4B/sZwNSAFZBhrC/hKuiSogJRPgt51vc
 kko7WEG+vaN5lXmdgoA06PsyhJhv6vpRuDQQap6iYvv7758Xxc/p93Enp+ubt0kMx26D
 rgR6PydrsrhI11mWiCXkIslHLl9iPx8h6KZXrCdQz0FU6v4nNhCHSXAarDWyJb5TQsCx
 5TPgG1tjZnVqwSP2yGjunkBp1P2Dux/3kx1kNE+yIGaINO87VIb1X9Cjx/67kvQckTFn
 wsZxLrHf0WHe21/s/JS3/lC1TCK3tA+kgozOp7HtZqXe8b8pDdQ2gBqpspWZ+5ocvebM
 NFgQ==
X-Gm-Message-State: AOAM530qyGCzvAYoGlTE3/mPo8eqskaFloKzB8Fn/Cm2xNGCfk9by2YU
 i8uC/JdyJO0a9GYWtrfUiKAAwg==
X-Google-Smtp-Source: ABdhPJxR8BeGCfoAw/OU31vEC5dlSStpveVpAv6gqMavK/msX4MzZVmX9FBkzTQYdiqF/5Ks/1mQLQ==
X-Received: by 2002:ac2:5962:: with SMTP id h2mr938232lfp.587.1603372627196;
 Thu, 22 Oct 2020 06:17:07 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
 by smtp.gmail.com with ESMTPSA id j10sm308514ljb.93.2020.10.22.06.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 06:17:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/5] drm/msm/dpu: simplify interface flush handling
Date: Thu, 22 Oct 2020 16:16:54 +0300
Message-Id: <20201022131658.181363-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
References: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of calling 4 callbacks to set pending masks, call just one to
update both pending_flush_mask and pending_intf_flush mask. Note, that
CMD mode support incorrectly did not update pending_intf_flush mask,
breaking CMD support on SC7180/SM8x50.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 16 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    | 46 ++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    | 25 ++--------
 4 files changed, 23 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 8493d68ad841..5a056c1191df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -437,7 +437,6 @@ static void dpu_encoder_phys_cmd_enable_helper(
 		struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_ctl *ctl;
-	u32 flush_mask = 0;
 
 	if (!phys_enc->hw_pp) {
 		DPU_ERROR("invalid arg(s), encoder %d\n", phys_enc != NULL);
@@ -452,8 +451,7 @@ static void dpu_encoder_phys_cmd_enable_helper(
 		return;
 
 	ctl = phys_enc->hw_ctl;
-	ctl->ops.get_bitmask_intf(ctl, &flush_mask, phys_enc->intf_idx);
-	ctl->ops.update_pending_flush(ctl, flush_mask);
+	ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
 }
 
 static void dpu_encoder_phys_cmd_enable(struct dpu_encoder_phys *phys_enc)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 805e059b50b7..a0d8aeec3e75 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -429,8 +429,6 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_ctl *ctl;
-	u32 flush_mask = 0;
-	u32 intf_flush_mask = 0;
 
 	ctl = phys_enc->hw_ctl;
 
@@ -452,20 +450,12 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 		!dpu_encoder_phys_vid_is_master(phys_enc))
 		goto skip_flush;
 
-	ctl->ops.get_bitmask_intf(ctl, &flush_mask, phys_enc->hw_intf->idx);
-	ctl->ops.update_pending_flush(ctl, flush_mask);
-
-	if (ctl->ops.get_bitmask_active_intf)
-		ctl->ops.get_bitmask_active_intf(ctl, &intf_flush_mask,
-			phys_enc->hw_intf->idx);
-
-	if (ctl->ops.update_pending_intf_flush)
-		ctl->ops.update_pending_intf_flush(ctl, intf_flush_mask);
+	ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
 
 skip_flush:
 	DPU_DEBUG_VIDENC(phys_enc,
-		"update pending flush ctl %d flush_mask 0%x intf_mask 0x%x\n",
-		ctl->idx - CTL_0, flush_mask, intf_flush_mask);
+		"update pending flush ctl %d intf %d\n",
+		ctl->idx - CTL_0, phys_enc->hw_intf->idx);
 
 
 	/* ctl_flush & timing engine enable will be triggered by framework */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 758c355b4fd8..f61b545d7257 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -104,12 +104,6 @@ static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl *ctx,
 	ctx->pending_flush_mask |= flushbits;
 }
 
-static inline void dpu_hw_ctl_update_pending_intf_flush(struct dpu_hw_ctl *ctx,
-		u32 flushbits)
-{
-	ctx->pending_intf_flush_mask |= flushbits;
-}
-
 static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
 {
 	return ctx->pending_flush_mask;
@@ -220,40 +214,32 @@ static uint32_t dpu_hw_ctl_get_bitmask_mixer(struct dpu_hw_ctl *ctx,
 	return flushbits;
 }
 
-static int dpu_hw_ctl_get_bitmask_intf(struct dpu_hw_ctl *ctx,
-		u32 *flushbits, enum dpu_intf intf)
+static void dpu_hw_ctl_update_pending_flush_intf(struct dpu_hw_ctl *ctx,
+		enum dpu_intf intf)
 {
 	switch (intf) {
 	case INTF_0:
-		*flushbits |= BIT(31);
+		ctx->pending_flush_mask |= BIT(31);
 		break;
 	case INTF_1:
-		*flushbits |= BIT(30);
+		ctx->pending_flush_mask |= BIT(30);
 		break;
 	case INTF_2:
-		*flushbits |= BIT(29);
+		ctx->pending_flush_mask |= BIT(29);
 		break;
 	case INTF_3:
-		*flushbits |= BIT(28);
+		ctx->pending_flush_mask |= BIT(28);
 		break;
 	default:
-		return -EINVAL;
+		break;
 	}
-	return 0;
-}
-
-static int dpu_hw_ctl_get_bitmask_intf_v1(struct dpu_hw_ctl *ctx,
-		u32 *flushbits, enum dpu_intf intf)
-{
-	*flushbits |= BIT(31);
-	return 0;
 }
 
-static int dpu_hw_ctl_active_get_bitmask_intf(struct dpu_hw_ctl *ctx,
-		u32 *flushbits, enum dpu_intf intf)
+static void dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
+		enum dpu_intf intf)
 {
-	*flushbits |= BIT(intf - INTF_0);
-	return 0;
+	ctx->pending_intf_flush_mask |= BIT(intf - INTF_0);
+	ctx->pending_flush_mask |= BIT(INTF_IDX);
 }
 
 static uint32_t dpu_hw_ctl_get_bitmask_dspp(struct dpu_hw_ctl *ctx,
@@ -535,15 +521,13 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
-		ops->get_bitmask_intf = dpu_hw_ctl_get_bitmask_intf_v1;
-		ops->get_bitmask_active_intf =
-			dpu_hw_ctl_active_get_bitmask_intf;
-		ops->update_pending_intf_flush =
-			dpu_hw_ctl_update_pending_intf_flush;
+		ops->update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf_v1;
 	} else {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
-		ops->get_bitmask_intf = dpu_hw_ctl_get_bitmask_intf;
+		ops->update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf;
 	}
 	ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
 	ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index ec579b470a80..73378fcba2d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -91,13 +91,13 @@ struct dpu_hw_ctl_ops {
 		u32 flushbits);
 
 	/**
-	 * OR in the given flushbits to the cached pending_intf_flush_mask
+	 * OR in the given flushbits to the cached pending_(intf_)flush_mask
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
-	 * @flushbits : module flushmask
+	 * @blk       : interface block index
 	 */
-	void (*update_pending_intf_flush)(struct dpu_hw_ctl *ctx,
-		u32 flushbits);
+	void (*update_pending_flush_intf)(struct dpu_hw_ctl *ctx,
+		enum dpu_intf blk);
 
 	/**
 	 * Write the value of the pending_flush_mask to hardware
@@ -142,23 +142,6 @@ struct dpu_hw_ctl_ops {
 	uint32_t (*get_bitmask_dspp)(struct dpu_hw_ctl *ctx,
 		enum dpu_dspp blk);
 
-	/**
-	 * Query the value of the intf flush mask
-	 * No effect on hardware
-	 * @ctx       : ctl path ctx pointer
-	 */
-	int (*get_bitmask_intf)(struct dpu_hw_ctl *ctx,
-		u32 *flushbits,
-		enum dpu_intf blk);
-
-	/**
-	 * Query the value of the intf active flush mask
-	 * No effect on hardware
-	 * @ctx       : ctl path ctx pointer
-	 */
-	int (*get_bitmask_active_intf)(struct dpu_hw_ctl *ctx,
-		u32 *flushbits, enum dpu_intf blk);
-
 	/**
 	 * Set all blend stages to disabled
 	 * @ctx       : ctl path ctx pointer
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
