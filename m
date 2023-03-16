Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FAE6BD537
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D98E10ED7E;
	Thu, 16 Mar 2023 16:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C4310ED53
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:17:06 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id g18so2270325ljl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slEOkZMCU/vf9LrYsMSfwgXlLTlW5vbKRx5XnUTwAUw=;
 b=g7C/PFrp0vFJU4EdY/eu9u85gTZrFky6PghljiHza4vBUYod1up+cXl9ty8WSmDjpG
 dMzjtbJPTcQR8gU4U2GNfP7rlPixKDmX1v8xBwwpZ8fcfDrg+r/bOHLCDZL+9QzOb/B3
 nx3OMO38gNLHlsF1sSkIsovW18ha2XXYmNPFVeOBXgDh7NSVvQCWn574pPWPqRLmpbVT
 kWxMCZyD/43CRMsErNZm7u5Ww3lLkX4qxUuXMZiE0Tx4xFqrlKX6l9lWFmE4JjYxeTfQ
 4d0P+DUv46DJnJ9HDbpfl93b0ZpaZaCLv1nAqgTmJWyApZ+X2NR/rOH+vEjnWJGURCIw
 UVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=slEOkZMCU/vf9LrYsMSfwgXlLTlW5vbKRx5XnUTwAUw=;
 b=QOiFF3xZvvI5EzijY7Ym2YOFfM1/W72yLT3ZLPo3v8qcPbg7vJofxvkwmwwCPLnKMu
 PlsZFtGOnygoVaUFNcb0dzbJd5Rsksd0+pkbEcHIm9xV5CM+uMXlMwcca6jFuNzZsj4T
 10T6Qp2gq8+HCsuHTdWS3fSTpjW3ndyDuGZzMlF3fi/4jw0hv7XPIp7enx0o5Bu0er3D
 COyP1u3wlkqL+hssIhdxsJcnga0aCxube1H18OFxhT7OAewJGP3s0+OnJ0j3WAnYXpsV
 cRGjBhzqOY6wOjVaRzQmkQfpESF6AQxmQtc2Pssb+kIvqRe9OfP+8AZdjvHRarexOfDH
 neKA==
X-Gm-Message-State: AO0yUKWvlrRLi4zJUo4FVHVhXaLz9gEChAQrhrSYnzh2TNbpGv4rqG0j
 9QJcWuLuCMN5lN4xCXdffnOMXA==
X-Google-Smtp-Source: AK7set+e0nejx12LEFSLa+hY71g4aFjcIa0lHZJRjVj/DzA1ilt1HIF/q0ilLFzKy+Pz4eL/SI1J7w==
X-Received: by 2002:a05:651c:b10:b0:295:9659:fba5 with SMTP id
 b16-20020a05651c0b1000b002959659fba5mr2882260ljr.37.1678983425909; 
 Thu, 16 Mar 2023 09:17:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:17:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v7 12/32] drm/msm/dpu: remove dpu_hw_fmt_layout from struct
 dpu_hw_sspp_cfg
Date: Thu, 16 Mar 2023 19:16:33 +0300
Message-Id: <20230316161653.4106395-13-dmitry.baryshkov@linaro.org>
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

Remove dpu_hw_fmt_layout instance from struct dpu_hw_sspp_cfg, leaving
only src_rect and dst_rect. This way all the pipes used by the plane
will have a common layout instance (as the framebuffer is shared between
them), while still keeping a separate src/dst rectangle configuration
for each pipe.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 32 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 10 +++----
 3 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index ab95f2817378..e87c6377f315 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -490,7 +490,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 }
 
 static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
-		struct dpu_hw_sspp_cfg *cfg)
+		struct dpu_hw_fmt_layout *layout)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
 	u32 ystride0, ystride1;
@@ -501,41 +501,41 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 		return;
 
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
-		for (i = 0; i < ARRAY_SIZE(cfg->layout.plane_addr); i++)
+		for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
 			DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx + i * 0x4,
-					cfg->layout.plane_addr[i]);
+					layout->plane_addr[i]);
 	} else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
-				cfg->layout.plane_addr[0]);
+				layout->plane_addr[0]);
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
-				cfg->layout.plane_addr[2]);
+				layout->plane_addr[2]);
 	} else {
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC1_ADDR + idx,
-				cfg->layout.plane_addr[0]);
+				layout->plane_addr[0]);
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
-				cfg->layout.plane_addr[2]);
+				layout->plane_addr[2]);
 	}
 
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
-		ystride0 = (cfg->layout.plane_pitch[0]) |
-			(cfg->layout.plane_pitch[1] << 16);
-		ystride1 = (cfg->layout.plane_pitch[2]) |
-			(cfg->layout.plane_pitch[3] << 16);
+		ystride0 = (layout->plane_pitch[0]) |
+			(layout->plane_pitch[1] << 16);
+		ystride1 = (layout->plane_pitch[2]) |
+			(layout->plane_pitch[3] << 16);
 	} else {
 		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
 		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
 
 		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
 			ystride0 = (ystride0 & 0xFFFF0000) |
-				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
+				(layout->plane_pitch[0] & 0x0000FFFF);
 			ystride1 = (ystride1 & 0xFFFF0000)|
-				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
+				(layout->plane_pitch[2] & 0x0000FFFF);
 		} else {
 			ystride0 = (ystride0 & 0x0000FFFF) |
-				((cfg->layout.plane_pitch[0] << 16) &
+				((layout->plane_pitch[0] << 16) &
 				 0xFFFF0000);
 			ystride1 = (ystride1 & 0x0000FFFF) |
-				((cfg->layout.plane_pitch[2] << 16) &
+				((layout->plane_pitch[2] << 16) &
 				 0xFFFF0000);
 		}
 	}
@@ -564,7 +564,7 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
-	struct dpu_hw_sspp_cfg cfg;
+	struct dpu_hw_fmt_layout cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 136b8713943f..100d8e06c90d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -154,13 +154,11 @@ struct dpu_hw_pixel_ext {
 
 /**
  * struct dpu_hw_sspp_cfg : SSPP configuration
- * @layout:    format layout information for programming buffer to hardware
  * @src_rect:  src ROI, caller takes into account the different operations
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
  */
 struct dpu_hw_sspp_cfg {
-	struct dpu_hw_fmt_layout layout;
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
 };
@@ -243,10 +241,10 @@ struct dpu_hw_sspp_ops {
 	/**
 	 * setup_sourceaddress - setup pipe source addresses
 	 * @pipe: Pointer to software pipe context
-	 * @cfg: Pointer to pipe config structure
+	 * @layout: format layout information for programming buffer to hardware
 	 */
 	void (*setup_sourceaddress)(struct dpu_sw_pipe *ctx,
-				    struct dpu_hw_sspp_cfg *cfg);
+				    struct dpu_hw_fmt_layout *layout);
 
 	/**
 	 * setup_csc - setup color space coversion
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 8c98385303ea..4ae70d21c37a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -471,21 +471,21 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
 
 static void _dpu_plane_set_scanout(struct drm_plane *plane,
 		struct dpu_plane_state *pstate,
-		struct dpu_hw_sspp_cfg *pipe_cfg,
 		struct drm_framebuffer *fb)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	struct msm_gem_address_space *aspace = kms->base.aspace;
+	struct dpu_hw_fmt_layout layout;
 	int ret;
 
-	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
+	ret = dpu_format_populate_layout(aspace, fb, &layout);
 	if (ret)
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
 		trace_dpu_plane_set_scanout(&pstate->pipe,
-					    &pipe_cfg->layout);
-		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, pipe_cfg);
+					    &layout);
+		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, &layout);
 	}
 }
 
@@ -1134,7 +1134,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_sspp_cfg));
 
-	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
+	_dpu_plane_set_scanout(plane, pstate, fb);
 
 	pstate->pending = true;
 
-- 
2.30.2

