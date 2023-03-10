Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5218F6B333E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A0710E929;
	Fri, 10 Mar 2023 00:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572B010E905
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:15 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d36so4607318lfv.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFgAXnkO9HoVCfEVaNPBdaBqkA0/oPvI0GCIR4oV0Vk=;
 b=bALT0ey/QjHIR1s0JWGTnoNCs+RiGXd2gpwyLrOukLf0LLKx1GRmch8HVIUYssl/vl
 2e9pAwnTmvOoPp+eoTyuVgBYBjVvVXg5IGnhbjO4RKmS416fWZvzK02CQEZyaffDZMHy
 bmGVK056iSnODE/rL+yxYHzTOpOUiJJCQhhzvO49TiPcP5TcLXgX3j1UfsyiK3yvM8uL
 XkXcL2p6kJD3Zx+OBrD8TnUiGgHXHvCW7wmcOfm5Cn+/2FWZIBnjr7gFaIqqThslhz1f
 Zmns4ca1/IT+87f5PqgIT3gl0u0tCu5DiaZanrY7vh1XenHEh9JQ1EQdO2X7zPoScMte
 H4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFgAXnkO9HoVCfEVaNPBdaBqkA0/oPvI0GCIR4oV0Vk=;
 b=KqHNVLAgxOUUhyyXJx4ac0u/MLzZkJjN5cI+pjPVl8EmwXCO/k2v8sE4XSd4WMGsOD
 P/edICogkuXi7OcUCRpawtvNFgv67tp2gEI3XQQdANwpoD+z4yvF9C9/ne2ypoIDye9p
 Zw5E/z3ed0NVdoPGhnyFflrXaoEx3weVgZd18Aff88mwOoHYZXsX8wqJg3nThjViIl25
 OwvMjJqkBhXabDm9uK2qPva7kDf8A/bvFIhTe2Ws44U+ZOE8M/q2f1Vf0kXwXi65ZM49
 WErrNlDCuo2fm76AS19HkpkIpNR6Z2olXpTEsiN1fOicuCZaKPn0svGu+ypS9thFybBo
 rjvw==
X-Gm-Message-State: AO0yUKUQTJhJfuHGnB0Jk4+R6O8tc2dS4UYq+S0T0ZAzQyCvQuylecon
 Egw91BMXtQ3vSxzzLYipbUAAEQ==
X-Google-Smtp-Source: AK7set9ZGayts/xNhmrwjEnSQxQeotIhxeZmXQaVCu77M1GF4m/ZEhlf6eQVdqnEBBUwdisyUote2w==
X-Received: by 2002:ac2:5312:0:b0:4db:3877:817a with SMTP id
 c18-20020ac25312000000b004db3877817amr7246222lfh.28.1678409833653; 
 Thu, 09 Mar 2023 16:57:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 09/32] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
Date: Fri, 10 Mar 2023 02:56:41 +0200
Message-Id: <20230310005704.1332368-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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

There is no need to pass full dpu_hw_sspp_cfg instance to
_dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 9 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index a1492a7e43ce..3030cd3b253a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -419,19 +419,18 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 }
 
 static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_sspp_cfg *sspp,
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
index 5903413256ea..136b8713943f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -317,13 +317,12 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_scaler - setup scaler
-	 * @ctx: Pointer to pipe context
-	 * @pipe_cfg: Pointer to pipe configuration
-	 * @scaler_cfg: Pointer to scaler configuration
+	 * @scaler3_cfg: Pointer to scaler configuration
+	 * @format: pixel format parameters
 	 */
 	void (*setup_scaler)(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_sspp_cfg *pipe_cfg,
-		void *scaler_cfg);
+		struct dpu_hw_scaler3_cfg *scaler3_cfg,
+		const struct dpu_format *format);
 
 	/**
 	 * get_scaler_ver - get scaler h/w version
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6ec39f937042..8c98385303ea 100644
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
2.39.2

