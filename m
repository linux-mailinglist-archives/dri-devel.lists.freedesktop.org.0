Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5721A68A1C5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE1F10E863;
	Fri,  3 Feb 2023 18:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A0F10E855
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:45 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id q19so6033639edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GTPp09b5uJQXPDaZcCzTRl5EAkwEFA+cgIpJ3U4JKkA=;
 b=eJwdHVvSu9PhZ5iyK9RkIlSymMm5P8TWd6RHYXj/NIQJt1E5Mhhj5MDeGg38qjyWAm
 sW6cyB9m6r2U62UHZHEMpEW9GgqhnFGiOTV5jhDI+rFQpFhjRv7kETbkwaP6dE8EpTnf
 vMAi2JSRTUP5Uei6BSuuisRWdog0faFUwa7RGGUPdyEde6JA1VikgbaH8Iy069LcoFtV
 0DRhR+p/k27hqh3pZCY4/lRb+aVCExBhIjNLUFbYHwWjXmi25k10GTsDHLebtCWPpaiM
 q3BE8ZfjQKHx3Ag1JwJRKL2xl9UYnZK7H7hpb8yBS2iRc8xkYotg3QdfUfFivCw1hM1Y
 WJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GTPp09b5uJQXPDaZcCzTRl5EAkwEFA+cgIpJ3U4JKkA=;
 b=iMTqAgVm70yfDBJHYzr4dgqHZO/hE3+xat+MezijBqXJoOFnUgbBdaANP1+NocC2+d
 0yCdYrzJrhPSdVpbm846IJePv7eR69byMiJ+GJmmkJkK0jaoec8oQMFfoSmmEk85DUGf
 nzkqardm6p4kFQyAUkGDF+arHjNaw3rvaCyRVTSvJAHcyXcXNWAPZ4aIvjuO7p3aYJSb
 drH/hhrqmJWKGr3SRYN4KK23HQclfs1DjqbvblQAVyZXTjHIihBw4iW5VSclCuhFBswU
 n+4VEQGYbWLl73OD9F8zRZWVyDT1dByEkQa0IHIuQScYL94nkkMWHlIq7vXeLimQDQjs
 PLyw==
X-Gm-Message-State: AO0yUKXbKqcA6+aKFATL/qASmBXY/vye8oJTwEw0LOcOP7IhEhof9n5K
 Igio3Sg8443QvDAy7NIEhPHYM3EXOPKMEvdL
X-Google-Smtp-Source: AK7set874w2d0N4y6MfsKxTy1HwxjeOwQLGj5jT+ggXeW1BN56MIe7V5IY9DNE0m2CSRnP+mAUPTRw==
X-Received: by 2002:aa7:c48a:0:b0:4a2:4abc:29be with SMTP id
 m10-20020aa7c48a000000b004a24abc29bemr10936738edq.35.1675448503794; 
 Fri, 03 Feb 2023 10:21:43 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 08/27] drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp
 callbacks
Date: Fri,  3 Feb 2023 20:21:13 +0200
Message-Id: <20230203182132.1307834-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
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

Where feasible, use dpu_sw_pipe rather than a combo of dpu_hw_sspp and
multirect_index/_mode arguments.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 59 +++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 46 +++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 73 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  9 ++-
 4 files changed, 84 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 5cf0803e4187..4d3ca8532563 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -168,17 +168,16 @@ static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
 	return rc;
 }
 
-static void dpu_hw_sspp_setup_multirect(struct dpu_hw_sspp *ctx,
-		enum dpu_sspp_multirect_index index,
-		enum dpu_sspp_multirect_mode mode)
+static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	u32 mode_mask;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
-	if (index == DPU_SSPP_RECT_SOLO) {
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
 		/**
 		 * if rect index is RECT_SOLO, we cannot expect a
 		 * virtual plane sharing the same SSPP id. So we go
@@ -187,8 +186,8 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_hw_sspp *ctx,
 		mode_mask = 0;
 	} else {
 		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE + idx);
-		mode_mask |= index;
-		if (mode == DPU_SSPP_MULTIRECT_TIME_MX)
+		mode_mask |= pipe->multirect_index;
+		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
 			mode_mask |= BIT(2);
 		else
 			mode_mask &= ~BIT(2);
@@ -239,10 +238,10 @@ static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
 /*
  * Setup source pixel format, flip,
  */
-static void dpu_hw_sspp_setup_format(struct dpu_hw_sspp *ctx,
-		const struct dpu_format *fmt, u32 flags,
-		enum dpu_sspp_multirect_index rect_mode)
+static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
+		const struct dpu_format *fmt, u32 flags)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	struct dpu_hw_blk_reg_map *c;
 	u32 chroma_samp, unpack, src_format;
 	u32 opmode = 0;
@@ -253,7 +252,8 @@ static void dpu_hw_sspp_setup_format(struct dpu_hw_sspp *ctx,
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx) || !fmt)
 		return;
 
-	if (rect_mode == DPU_SSPP_RECT_SOLO || rect_mode == DPU_SSPP_RECT_0) {
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0) {
 		op_mode_off = SSPP_SRC_OP_MODE;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN;
 		format_off = SSPP_SRC_FORMAT;
@@ -447,10 +447,10 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
 /*
  * dpu_hw_sspp_setup_rects()
  */
-static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_sspp_cfg *cfg,
-		enum dpu_sspp_multirect_index rect_index)
+static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
+		struct dpu_hw_sspp_cfg *cfg)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	struct dpu_hw_blk_reg_map *c;
 	u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
 	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
@@ -461,7 +461,8 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
 
 	c = &ctx->hw;
 
-	if (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0) {
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0) {
 		src_size_off = SSPP_SRC_SIZE;
 		src_xy_off = SSPP_SRC_XY;
 		out_size_off = SSPP_OUT_SIZE;
@@ -482,7 +483,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
 	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
 		drm_rect_width(&cfg->dst_rect);
 
-	if (rect_index == DPU_SSPP_RECT_SOLO) {
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
 		ystride0 = (cfg->layout.plane_pitch[0]) |
 			(cfg->layout.plane_pitch[1] << 16);
 		ystride1 = (cfg->layout.plane_pitch[2]) |
@@ -491,7 +492,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
 		ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
 		ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
 
-		if (rect_index == DPU_SSPP_RECT_0) {
+		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
 			ystride0 = (ystride0 & 0xFFFF0000) |
 				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
 			ystride1 = (ystride1 & 0xFFFF0000)|
@@ -516,21 +517,21 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
 	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
 }
 
-static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_sspp_cfg *cfg,
-		enum dpu_sspp_multirect_index rect_mode)
+static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
+		struct dpu_hw_sspp_cfg *cfg)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	int i;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
-	if (rect_mode == DPU_SSPP_RECT_SOLO) {
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
 		for (i = 0; i < ARRAY_SIZE(cfg->layout.plane_addr); i++)
 			DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx + i * 0x4,
 					cfg->layout.plane_addr[i]);
-	} else if (rect_mode == DPU_SSPP_RECT_0) {
+	} else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
 				cfg->layout.plane_addr[0]);
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
@@ -560,15 +561,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 	dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
 }
 
-static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_sspp *ctx, u32 color, enum
-		dpu_sspp_multirect_index rect_index)
+static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
-	if (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0)
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
 	else
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1 + idx,
@@ -630,10 +632,10 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL + idx, qos_ctrl);
 }
 
-static void dpu_hw_sspp_setup_cdp(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_cdp_cfg *cfg,
-		enum dpu_sspp_multirect_index index)
+static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
+		struct dpu_hw_cdp_cfg *cfg)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	u32 idx;
 	u32 cdp_cntl = 0;
 	u32 cdp_cntl_offset = 0;
@@ -644,7 +646,8 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_sspp *ctx,
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
-	if (index == DPU_SSPP_RECT_SOLO || index == DPU_SSPP_RECT_0)
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		cdp_cntl_offset = SSPP_CDP_CNTL;
 	else
 		cdp_cntl_offset = SSPP_CDP_CNTL_REC1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index a3bdce6e20df..8d566ad1877e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -217,24 +217,20 @@ struct dpu_sw_pipe {
 struct dpu_hw_sspp_ops {
 	/**
 	 * setup_format - setup pixel format cropping rectangle, flip
-	 * @ctx: Pointer to pipe context
+	 * @pipe: Pointer to software pipe context
 	 * @cfg: Pointer to pipe config structure
 	 * @flags: Extra flags for format config
-	 * @index: rectangle index in multirect
 	 */
-	void (*setup_format)(struct dpu_hw_sspp *ctx,
-			const struct dpu_format *fmt, u32 flags,
-			enum dpu_sspp_multirect_index index);
+	void (*setup_format)(struct dpu_sw_pipe *pipe,
+			     const struct dpu_format *fmt, u32 flags);
 
 	/**
 	 * setup_rects - setup pipe ROI rectangles
-	 * @ctx: Pointer to pipe context
+	 * @pipe: Pointer to software pipe context
 	 * @cfg: Pointer to pipe config structure
-	 * @index: rectangle index in multirect
 	 */
-	void (*setup_rects)(struct dpu_hw_sspp *ctx,
-			struct dpu_hw_sspp_cfg *cfg,
-			enum dpu_sspp_multirect_index index);
+	void (*setup_rects)(struct dpu_sw_pipe *pipe,
+			    struct dpu_hw_sspp_cfg *cfg);
 
 	/**
 	 * setup_pe - setup pipe pixel extension
@@ -246,13 +242,11 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_sourceaddress - setup pipe source addresses
-	 * @ctx: Pointer to pipe context
+	 * @pipe: Pointer to software pipe context
 	 * @cfg: Pointer to pipe config structure
-	 * @index: rectangle index in multirect
 	 */
-	void (*setup_sourceaddress)(struct dpu_hw_sspp *ctx,
-			struct dpu_hw_sspp_cfg *cfg,
-			enum dpu_sspp_multirect_index index);
+	void (*setup_sourceaddress)(struct dpu_sw_pipe *ctx,
+				    struct dpu_hw_sspp_cfg *cfg);
 
 	/**
 	 * setup_csc - setup color space coversion
@@ -263,24 +257,18 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_solidfill - enable/disable colorfill
-	 * @ctx: Pointer to pipe context
+	 * @pipe: Pointer to software pipe context
 	 * @const_color: Fill color value
 	 * @flags: Pipe flags
-	 * @index: rectangle index in multirect
 	 */
-	void (*setup_solidfill)(struct dpu_hw_sspp *ctx, u32 color,
-			enum dpu_sspp_multirect_index index);
+	void (*setup_solidfill)(struct dpu_sw_pipe *pipe, u32 color);
 
 	/**
 	 * setup_multirect - setup multirect configuration
-	 * @ctx: Pointer to pipe context
-	 * @index: rectangle index in multirect
-	 * @mode: parallel fetch / time multiplex multirect mode
+	 * @pipe: Pointer to software pipe context
 	 */
 
-	void (*setup_multirect)(struct dpu_hw_sspp *ctx,
-			enum dpu_sspp_multirect_index index,
-			enum dpu_sspp_multirect_mode mode);
+	void (*setup_multirect)(struct dpu_sw_pipe *pipe);
 
 	/**
 	 * setup_sharpening - setup sharpening
@@ -345,13 +333,11 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_cdp - setup client driven prefetch
-	 * @ctx: Pointer to pipe context
+	 * @pipe: Pointer to software pipe context
 	 * @cfg: Pointer to cdp configuration
-	 * @index: rectangle index in multirect
 	 */
-	void (*setup_cdp)(struct dpu_hw_sspp *ctx,
-			struct dpu_hw_cdp_cfg *cfg,
-			enum dpu_sspp_multirect_index index);
+	void (*setup_cdp)(struct dpu_sw_pipe *pipe,
+			  struct dpu_hw_cdp_cfg *cfg);
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 229447ca1e0f..8f1767619d06 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -483,23 +483,21 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
 	if (ret)
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(pstate->pipe.sspp->idx,
-					    &pipe_cfg->layout,
-					    pstate->pipe.multirect_index);
-		pstate->pipe.sspp->ops.setup_sourceaddress(pstate->pipe.sspp, pipe_cfg,
-						pstate->pipe.multirect_index);
+		trace_dpu_plane_set_scanout(&pstate->pipe,
+					    &pipe_cfg->layout);
+		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, pipe_cfg);
 	}
 }
 
-static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
-		struct dpu_plane_state *pstate,
+static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
 		const struct dpu_format *fmt,
-		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
+		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v,
+		unsigned int rotation)
 {
 	uint32_t i;
-	bool inline_rotation = pstate->rotation & DRM_MODE_ROTATE_90;
+	bool inline_rotation = rotation & DRM_MODE_ROTATE_90;
 
 	/*
 	 * For inline rotation cases, scaler config is post-rotation,
@@ -538,7 +536,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 			scale_cfg->src_height[i] /= chroma_subsmpl_v;
 		}
 
-		if (pstate->pipe.sspp->cap->features &
+		if (pipe_hw->cap->features &
 			BIT(DPU_SSPP_SCALER_QSEED4)) {
 			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
 			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
@@ -635,11 +633,12 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 	return csc_ptr;
 }
 
-static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
-		struct dpu_plane_state *pstate,
+static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 		const struct dpu_format *fmt, bool color_fill,
-		struct dpu_hw_sspp_cfg *pipe_cfg)
+		struct dpu_hw_sspp_cfg *pipe_cfg,
+		unsigned int rotation)
 {
+	struct dpu_hw_sspp *pipe_hw = pipe->sspp;
 	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
 	struct dpu_hw_scaler3_cfg scaler3_cfg;
 	struct dpu_hw_pixel_ext pixel_ext;
@@ -653,20 +652,21 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 
 	/* don't chroma subsample if decimating */
 	/* update scaler. calculate default config for QSEED3 */
-	_dpu_plane_setup_scaler3(pdpu, pstate,
+	_dpu_plane_setup_scaler3(pipe_hw,
 			src_width,
 			src_height,
 			dst_width,
 			dst_height,
 			&scaler3_cfg, fmt,
-			info->hsub, info->vsub);
+			info->hsub, info->vsub,
+			rotation);
 
 	/* configure pixel extension based on scalar config */
 	_dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
 			src_width, src_height, info->hsub, info->vsub);
 
-	if (pstate->pipe.sspp->ops.setup_pe)
-		pstate->pipe.sspp->ops.setup_pe(pstate->pipe.sspp,
+	if (pipe_hw->ops.setup_pe)
+		pipe_hw->ops.setup_pe(pipe_hw,
 				&pixel_ext);
 
 	/**
@@ -674,9 +674,9 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	 * bypassed. Still we need to update alpha and bitwidth
 	 * ONLY for RECT0
 	 */
-	if (pstate->pipe.sspp->ops.setup_scaler &&
-			pstate->pipe.multirect_index != DPU_SSPP_RECT_1)
-		pstate->pipe.sspp->ops.setup_scaler(pstate->pipe.sspp,
+	if (pipe_hw->ops.setup_scaler &&
+			pipe->multirect_index != DPU_SSPP_RECT_1)
+		pipe_hw->ops.setup_scaler(pipe_hw,
 				pipe_cfg,
 				&scaler3_cfg);
 }
@@ -706,9 +706,8 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 
 	/* update sspp */
 	if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
-		pstate->pipe.sspp->ops.setup_solidfill(pstate->pipe.sspp,
-				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
-				pstate->pipe.multirect_index);
+		pstate->pipe.sspp->ops.setup_solidfill(&pstate->pipe,
+				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
 
 		/* override scaler/decimation if solid fill */
 		pipe_cfg.dst_rect = pstate->base.dst;
@@ -721,16 +720,14 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 			drm_rect_height(&pipe_cfg.dst_rect);
 
 		if (pstate->pipe.sspp->ops.setup_format)
-			pstate->pipe.sspp->ops.setup_format(pstate->pipe.sspp,
-					fmt, DPU_SSPP_SOLID_FILL,
-					pstate->pipe.multirect_index);
+			pstate->pipe.sspp->ops.setup_format(&pstate->pipe,
+					fmt, DPU_SSPP_SOLID_FILL);
 
 		if (pstate->pipe.sspp->ops.setup_rects)
-			pstate->pipe.sspp->ops.setup_rects(pstate->pipe.sspp,
-					&pipe_cfg,
-					pstate->pipe.multirect_index);
+			pstate->pipe.sspp->ops.setup_rects(&pstate->pipe,
+					&pipe_cfg);
 
-		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
+		_dpu_plane_setup_scaler(&pstate->pipe, fmt, true, &pipe_cfg, pstate->rotation);
 	}
 
 	return 0;
@@ -1169,18 +1166,15 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	}
 
 	if (pipe->sspp->ops.setup_rects) {
-		pipe->sspp->ops.setup_rects(pipe->sspp,
-				&pipe_cfg,
-				pipe->multirect_index);
+		pipe->sspp->ops.setup_rects(pipe,
+				&pipe_cfg);
 	}
 
-	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
+	_dpu_plane_setup_scaler(pipe, fmt, false, &pipe_cfg, pstate->rotation);
 
 	if (pipe->sspp->ops.setup_multirect)
 		pipe->sspp->ops.setup_multirect(
-				pipe->sspp,
-				pipe->multirect_index,
-				pipe->multirect_mode);
+				pipe);
 
 	if (pipe->sspp->ops.setup_format) {
 		unsigned int rotation = pstate->rotation;
@@ -1197,8 +1191,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			src_flags |= DPU_SSPP_ROT_90;
 
 		/* update format */
-		pipe->sspp->ops.setup_format(pipe->sspp, fmt, src_flags,
-				pipe->multirect_index);
+		pipe->sspp->ops.setup_format(pipe, fmt, src_flags);
 
 		if (pipe->sspp->ops.setup_cdp) {
 			struct dpu_hw_cdp_cfg cdp_cfg;
@@ -1214,7 +1207,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 					DPU_FORMAT_IS_TILE(fmt);
 			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pipe->sspp->ops.setup_cdp(pipe->sspp, &cdp_cfg, pipe->multirect_index);
+			pipe->sspp->ops.setup_cdp(pipe, &cdp_cfg);
 		}
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index d7059972499f..0ad148cc2fb8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -762,18 +762,17 @@ TRACE_EVENT(dpu_crtc_disable_frame_pending,
 );
 
 TRACE_EVENT(dpu_plane_set_scanout,
-	TP_PROTO(enum dpu_sspp index, struct dpu_hw_fmt_layout *layout,
-		 enum dpu_sspp_multirect_index multirect_index),
-	TP_ARGS(index, layout, multirect_index),
+	TP_PROTO(struct dpu_sw_pipe *pipe, struct dpu_hw_fmt_layout *layout),
+	TP_ARGS(pipe, layout),
 	TP_STRUCT__entry(
 		__field(	enum dpu_sspp,			index	)
 		__field_struct(	struct dpu_hw_fmt_layout,	layout	)
 		__field(	enum dpu_sspp_multirect_index,	multirect_index)
 	),
 	TP_fast_assign(
-		__entry->index = index;
+		__entry->index = pipe->sspp->idx;
 		__entry->layout = *layout;
-		__entry->multirect_index = multirect_index;
+		__entry->multirect_index = pipe->multirect_index;
 	),
 	TP_printk("index:%d layout:{%ux%u @ [%u/%u, %u/%u, %u/%u, %u/%u]} "
 		  "multirect_index:%d", __entry->index, __entry->layout.width,
-- 
2.39.1

