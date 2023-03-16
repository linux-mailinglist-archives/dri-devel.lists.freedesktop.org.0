Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C96D6BD518
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764B110ED58;
	Thu, 16 Mar 2023 16:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BD410ED5C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:17:05 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id by8so1050026ljb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4jYEQpBTAsdIQL9tDisZQBWijquFgkds2ldcP5WEm+8=;
 b=xa3EqNfNyY2+sezwp/HyNGSgpX3Zj+wphsWlVFfA8fBGCnkk+kddNCeZOYuN+fFHA3
 Yf3eqpD+Qeh/2uN1dwiWqyA1YuUaFvNE67c38VLz11TCntoFi5SwzCH77XyqbYXwZ58t
 7xjfjFPI1QEqnwdDxAKm4emdPbOFX2dP4qLzkFzudpu68Dkyk4SHWW+DGw6UqAqzTiJm
 Nt9N18Hg0Y634NDZ+jsCh3RDAeNHtz7EqAvNRp2ekUInOlDs6A7C0TqjY0LfJvR1lCtB
 cE+ZIR53giY15YJZDIwGps0/SHs7JvulUnP7P5PBIaylQ/ImzPTHJ6geoJNUqoUqt9yt
 +zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4jYEQpBTAsdIQL9tDisZQBWijquFgkds2ldcP5WEm+8=;
 b=v0gXTpy4Z1iCLP9QyjNz6qadnLdcIvS6RbVtqyEIyd7iWoplfQl8ppv8ypSluScKqx
 qht4uI4CeGto7REWmDgZQglsjXuZUOHwluQ1j6cpxbgslv3A1ztSVTJQLdMHYqIcOXmg
 vNwCwBORE73/xbsUKMX9v+9/vfu3dhqOLy4GNQDkpoqGhaLJ9JqPSPU8vOkpV4Ji7gob
 Uxv4iFuDg5hNtacdUtAmR3PyEM8u7CIPQWCnudqVLQYYDnfW+As2vLEy6+yHylCMv6oQ
 qJdtW8igBSYyK/O9Ahkmi8p8vDjEWcquO35Y8I0lptBrbf1ASlDAWcwc7bOMsugzUrfr
 y+oA==
X-Gm-Message-State: AO0yUKVqJ1BrbBoiZloOU5mGX1eGBs8W5vqR1fFpGN9on9WxPljbw0q6
 j62UsiAX/2uTFXk+hQp3+bfnSg==
X-Google-Smtp-Source: AK7set8CtNFZfJOfBrtOvhPlQ0lKuFm0+9PacTZk2ctsV8jq6yw05xbNlja+ZvnSjHQ8/j/qvFcYAQ==
X-Received: by 2002:a2e:9d0c:0:b0:298:9627:2538 with SMTP id
 t12-20020a2e9d0c000000b0029896272538mr2364469lji.12.1678983423711; 
 Thu, 16 Mar 2023 09:17:03 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:17:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v7 09/32] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
Date: Thu, 16 Mar 2023 19:16:30 +0300
Message-Id: <20230316161653.4106395-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
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
2.30.2

