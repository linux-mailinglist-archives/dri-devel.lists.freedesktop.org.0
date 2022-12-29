Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922266590FE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846AD10E22B;
	Thu, 29 Dec 2022 19:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD80D10E226
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:08 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b3so28762455lfv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JT8JMnQG+MQncGRlo8pARWxuBMUoYN7MHqcFl2riZB8=;
 b=e6xCtEnZTSQ4o57iZnFOtmbbt4UsUFZo1o6atDqRWpE34zyBe2R9i29CSiPFZCQf8z
 mCN/jUN2lUMkaRpphPGhgB49pn/ixwM5tTHEmNSQ17Yd+JFvsVnBXEj+lrSSEaH0h0wT
 kCc2SoA9c08m1Ig0ZJOnUFj6QWOFIQ3b4xLl4w5bKUX84gsK9y5JTyYAb38D+/7zhX40
 GQASqquqQNVojCMXmB99s5+ouS4XVSGMVkDdDjKW5DM+q7ACEM/oSrPmpi7rj1QE2WV8
 nZwUPPmVUssu8vM7K4GxABU3E65eTJvSX+qxy/Qh9UEg9rm89/6P2NjkISNIX8cUOXaF
 0Kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JT8JMnQG+MQncGRlo8pARWxuBMUoYN7MHqcFl2riZB8=;
 b=d9sti7Wnf4oc/mCzVddTCRrIVah95rZEkcmzJw4dx/SbpgziEZfmVNfDi9n2UfNGgt
 MCObb5UntiWyUXj8lPOK6lt3KpBC9E/WiaRmrbr1whpE48OZYgiSM9QLZGbUlI0d0Sti
 E5hMq2Vj304Hy5fpMU4P9ziA33FFwu5zf9oXa+aWU2pVyv63pAuDNsixCv7MZy3mtyat
 Ghw4vnZNptp9D2U1O59lb9Y5ub2AXYIBkFDLq4bo7y9HRgGBn8ZCErCaRLhmqvt73PVt
 ap99fmng2Np1DfMCiWM7O6eoRI0AI3FelY9KU66u+Qx2bNeesFfzDS8Jzfep/b0N7k8x
 l8jQ==
X-Gm-Message-State: AFqh2koIK1sS/RYO3GCyNq99IpslsyEFIm3GIRJD7VnFzz77PNOgtbIz
 wQyo+HodwMM2gjuoRTTidK77t5zSh74CJ0Wp
X-Google-Smtp-Source: AMrXdXseUVddZG53/Beww3FaEBvQxb8f5Fp2DupheFfI+wmPhpg/35bBhL5NZyi6HsQeTx4wGjLBPA==
X-Received: by 2002:a05:6512:3a91:b0:4c0:2c1e:1d5b with SMTP id
 q17-20020a0565123a9100b004c02c1e1d5bmr8991229lfu.63.1672341548466; 
 Thu, 29 Dec 2022 11:19:08 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 10/27] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
Date: Thu, 29 Dec 2022 21:18:39 +0200
Message-Id: <20221229191856.3508092-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
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

There is no need to pass full dpu_hw_pipe_cfg instance to
_dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 7 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index f7f81ab08fa2..176cd6dc9a69 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -415,19 +415,18 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 }
 
 static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_pipe_cfg *sspp,
-		void *scaler_cfg)
+		struct dpu_hw_scaler3_cfg *scaler3_cfg,
+		const struct dpu_format *format)
 {
 	u32 idx;
-	struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
 
-	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
+	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
 		|| !scaler3_cfg)
 		return;
 
 	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
 			ctx->cap->sblk->scaler_blk.version,
-			sspp->layout.format);
+			format);
 }
 
 static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index f5aae563741a..c713343378aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -317,13 +317,12 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_scaler - setup scaler
-	 * @ctx: Pointer to pipe context
-	 * @pipe_cfg: Pointer to pipe configuration
 	 * @scaler_cfg: Pointer to scaler configuration
+	 * @format: pixel format parameters
 	 */
 	void (*setup_scaler)(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_pipe_cfg *pipe_cfg,
-		void *scaler_cfg);
+		struct dpu_hw_scaler3_cfg *scaler3_cfg,
+		const struct dpu_format *format);
 
 	/**
 	 * get_scaler_ver - get scaler h/w version
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 172a2c012917..cbff4dea8662 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -677,8 +677,8 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 	if (pipe_hw->ops.setup_scaler &&
 			pipe->multirect_index != DPU_SSPP_RECT_1)
 		pipe_hw->ops.setup_scaler(pipe_hw,
-				pipe_cfg,
-				&scaler3_cfg);
+				&scaler3_cfg,
+				fmt);
 }
 
 /**
-- 
2.39.0

