Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D237A46598D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 23:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095F46E961;
	Wed,  1 Dec 2021 22:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE8E6E91F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 22:51:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id c32so66881378lfv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 14:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7uia5p7FpJ6FhJvovwEFuE5jTgtrwEvm9hq5sHRfsao=;
 b=PgwEtvI9kE93H3hOhQhgfzf+gv8KHEeRsHnqy2wL9BaV7mdJnmcVEGS/oEfonE5FnV
 5jpmnhcapqJ5insRwv8i8ZNbczNhJqWqLG+VcZMB7kzQhU72o+6TX5mR2HN+TLRdf5W/
 yNOWfOwTsz5X3W0P+ctjWGI+iO+xbyiP8aCgM3M73KDOuaCSA+N6Sj+s2VWA1Hq8OqZI
 KLuTRrHpNwGuNP1ISYHWtuZLaQ0L1FL9fCcxfgcTF1pAGHaicNSHzvSVIHPy9gIdjPY3
 0KQNhYl9cv6QltzfiBI7tThTorzLOoobtncBG2meevzxiw4hV6JSJRsLdb3up5GviO+n
 hj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7uia5p7FpJ6FhJvovwEFuE5jTgtrwEvm9hq5sHRfsao=;
 b=UwzeUYzntuKulz0A2EDbXvFwrnx4HpHpC+QhUDXLAJl1RpzALCsbDJtAwmQQ4PuLpF
 qLiq8sT6YWu4P9+pePX2aYwtmsre5j8gFXTZWhiOx8tdJSBAtWHfzA2EYJZ4JCgu+zu3
 WAp0VnCz49NYEO4KmNAAIRP33fuFceFbqTFgTU18k7fyiFpPlkGmK64iVt2qsUmsydG3
 nXyJK4LZRdbMUYM3QRriiME1Euk7B8XmSrQSvV2cMGicyF8GAEqiTv5BRh41RFfbOF20
 80NOIRhvIOx3cRnVFFKUBtrItw6TQUV1p9Rv8pPCDHzn50XcHNjIdWlvVsyu3wFhzYvf
 lK4Q==
X-Gm-Message-State: AOAM532DNszP8/rNLwxcQoAcT2NsIri8qIN06/sWyjyTFPTPy8V+9Yhj
 W+rJvrDbjWyBjudN9qnczlVYjg==
X-Google-Smtp-Source: ABdhPJyV6aXB2B/ea3M3KpreXTvEZVMtsKBTzWxDvdn1CNWx4Pr3i4/K4dLxCbzd+lFOZOIMtDsgBA==
X-Received: by 2002:ac2:4d5b:: with SMTP id 27mr8702045lfp.596.1638399108311; 
 Wed, 01 Dec 2021 14:51:48 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm124819ljh.49.2021.12.01.14.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:51:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 4/4] drm/msm/dpu: fix CDP setup to account for multirect
 index
Date: Thu,  2 Dec 2021 01:51:40 +0300
Message-Id: <20211201225140.2481577-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
References: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
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
index 7235605bfc9e..75aa47835214 100644
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
index 3c53bd03bdeb..227b09fa4689 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -356,9 +356,11 @@ struct dpu_hw_sspp_ops {
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
index 911f5f0b41d8..1134171f4d1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1191,7 +1191,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 					DPU_FORMAT_IS_TILE(fmt);
 			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg);
+			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg, pstate->multirect_index);
 		}
 	}
 
-- 
2.33.0

