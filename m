Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4613BB4E3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23C889C25;
	Mon,  5 Jul 2021 01:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E244F89BE8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:24 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id q18so29472343lfc.7
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Pu7+dqTzZbkt2YgBElREbnaQXKS8GXHzOUm46jFcp4=;
 b=EWiPcUk2ilVB0g/D+ZdTh3buVWSo3uy72vObBLpv2sAIu6LMOQyvJ9Hr1hp/0OtkRC
 dRbyfS2Cca/tg+xYFeAHkyKAaTDnliH/P9Kc7KEMrZgPZh2T6xIEdYsVmShCbpXIKUdC
 Vd6d6LCfFJ8NdM4D7stjHsOHCww/BIfJwt9B5eIxxYtVVbqe6Nbpp2ibRkoNwD6WzGH3
 hD+aFEzPAYVq5i0PGhU1idwl6zWJSquO7rrqRNMNF5IRNcaNJRrUD1iB8zulhjz1q9kK
 68YsycnMtxgtbPFrU2gUepyuFsgWSvZRtkCS2Ed4wLNi04E58B+mUh11z9StFuV4gq7O
 mz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Pu7+dqTzZbkt2YgBElREbnaQXKS8GXHzOUm46jFcp4=;
 b=OaBlk0CuOdTe2kSbiVRxGT7BuyXvg1jfN9Jb6xjnffmJzNG7o00M5WZtCxPk2NeQPM
 HX4vij5qhe9MOkDeLDCFf05n/QVAAt1pEzeIFCmFenLYTOqsfGJYsZGRDI7iomaf+2H6
 nRLKynMSw4OFg+D+xgwSmkcKo0n4kTeHvX+qIhz9h/Sqebrqh8HQaTut396coW9/8O1V
 H8fP8tbrowSoxltOsbqapCF9mr+v4UOJyTwj79mTeBtZpFIEEnihrTzOPLa01r8Sia79
 cpQCNtCuPPUiJnIQUA06A3vRkTczt9EWPowPsjCXv/hQxyl4vBFd9DL9iC375DHFbFrx
 WrCg==
X-Gm-Message-State: AOAM531nTRgO+bY8UDxoxkDMRtr7aZWIL94b7CH8RCNk2GuAhLF6u0lH
 17Flk8NY4dmXBBeb0eui1lZ2DQ==
X-Google-Smtp-Source: ABdhPJxo72oW5dTX2LSzYKC/ejYUIC3SD9jaHNlys8V48kRcGBR0Bfxjz1QUp66jxXz0p1yN+xGTVg==
X-Received: by 2002:ac2:4570:: with SMTP id k16mr8651752lfm.263.1625448323206; 
 Sun, 04 Jul 2021 18:25:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 21/22] drm/msm/dpu: fix CDP setup to account for multirect
 index
Date: Mon,  5 Jul 2021 04:21:14 +0300
Message-Id: <20210705012115.4179824-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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

Client driven prefetch (CDP) is properly setup only for SSPP REC0
currently. Enable client driven prefetch also for SSPP REC1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 12 ++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  4 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  2 +-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index f93cdeb08ac7..96f2f3f12f34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -75,6 +75,7 @@
 #define SSPP_TRAFFIC_SHAPER                0x130
 #define SSPP_CDP_CNTL                      0x134
 #define SSPP_UBWC_ERROR_STATUS             0x138
+#define SSPP_CDP_CNTL_REC1                 0x13c
 #define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
 #define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
 #define SSPP_TRAFFIC_SHAPER_REC1           0x158
@@ -624,10 +625,12 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
 }
 
 static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_cdp_cfg *cfg)
+		struct dpu_hw_pipe_cdp_cfg *cfg,
+		enum dpu_sspp_multirect_index index)
 {
 	u32 idx;
 	u32 cdp_cntl = 0;
+	u32 cdp_cntl_offset = 0;
 
 	if (!ctx || !cfg)
 		return;
@@ -635,6 +638,11 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	if (index == DPU_SSPP_RECT_SOLO || index == DPU_SSPP_RECT_0)
+		cdp_cntl_offset = SSPP_CDP_CNTL;
+	else
+		cdp_cntl_offset = SSPP_CDP_CNTL_REC1;
+
 	if (cfg->enable)
 		cdp_cntl |= BIT(0);
 	if (cfg->ubwc_meta_enable)
@@ -644,7 +652,7 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
 	if (cfg->preload_ahead == DPU_SSPP_CDP_PRELOAD_AHEAD_64)
 		cdp_cntl |= BIT(3);
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_CDP_CNTL, cdp_cntl);
+	DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
 }
 
 static void _setup_layer_ops(struct dpu_hw_pipe *c,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index c5ac8defa073..19c5358b962c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -358,9 +358,11 @@ struct dpu_hw_sspp_ops {
 	 * setup_cdp - setup client driven prefetch
 	 * @ctx: Pointer to pipe context
 	 * @cfg: Pointer to cdp configuration
+	 * @index: rectangle index in multirect
 	 */
 	void (*setup_cdp)(struct dpu_hw_pipe *ctx,
-			struct dpu_hw_pipe_cdp_cfg *cfg);
+			struct dpu_hw_pipe_cdp_cfg *cfg,
+			enum dpu_sspp_multirect_index index);
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d692136884ad..420cdd90e89b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1241,7 +1241,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 					DPU_FORMAT_IS_TILE(fmt);
 			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, &cdp_cfg);
+			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, &cdp_cfg, pstate->multirect_index);
 		}
 	}
 
-- 
2.30.2

