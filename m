Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541416B334E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDA610E931;
	Fri, 10 Mar 2023 00:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989FC10E917
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:16 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g17so4629616lfv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aPNtR9kxAK2PELrzoxDJ6AaBr9TFEwND+5d4Z8IdyCo=;
 b=uIoehPnbsi+8/f7BlEEIFxA7JEVcbDmS6QXUmQ1mtKSrSasjvaowVr5tZxveHLkLbu
 /w3RkDMLDJgnaCjFBicCUWjcczXx5PzBPpi+YYLMDHjPeZIrvlopqK/Vsasybv64HYk3
 Y+oU5gBh7t1ZKroNECIdc1i/CYPL9l+KHoEPMrzqA8q87iMwaaLnHRdpsoULLP6IMM1Z
 TwHQ3cxCMMpXMcQkzeQfRBbLpo6+DgqbNKdCZYvK8V00tyP+zj8Bm24nkHYL2b5kDDFi
 G5OGGcuc0hmf3my5cON9l0Jr6lJ2N2i6UzGmsU2Vf6UULJVQFvbEjaab1XbZG5YHSxJq
 FTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aPNtR9kxAK2PELrzoxDJ6AaBr9TFEwND+5d4Z8IdyCo=;
 b=QbZsEGRSNn3mcXF336fuMwFwdS0//vtwMi+F6mqieGmXPrExaBr4yZvv3Ax5wL00UD
 /itpVe1rViBPjHL/prEHQHtq/xLLDkEK/X3FrLV2juPCuGzwd7qgKsSdYZKay5LKa4w+
 ML15+oHRh9wui23p+X0v5u6Ejd/CTzySdvmHNUMu552YdhnXuMvp9UTKGc9XsFFqzMiV
 idje6wRoFyFPgm3g7EpeN9cx92i8PF6ACkbr9nXh9AjIlocvQsROB1WPu/GXFC4f3fTd
 EEtgZi83LHtu6F7X9GwcXtu8CSpHjwaiCGKFXMtsd0pYsijcLmL8lYFa2F+nTUZ8ptUo
 SN+Q==
X-Gm-Message-State: AO0yUKX/XH+hQOgh/kfwSnrd4NKzMinzHoQWhHyPtZNaLIxGJbKVqivz
 2+MonSXlaGxoXhxoZGESOiGdDQ==
X-Google-Smtp-Source: AK7set/d8nBbLyYDylzjxyAuLxXHicglcewydaxajKnGttNaNInwQueUGvGYJI8Yn5uRur0Zgaa9Cg==
X-Received: by 2002:a19:c508:0:b0:4e4:b9b4:bf25 with SMTP id
 w8-20020a19c508000000b004e4b9b4bf25mr7646921lfe.68.1678409836107; 
 Thu, 09 Mar 2023 16:57:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 12/32] drm/msm/dpu: remove dpu_hw_fmt_layout from struct
 dpu_hw_sspp_cfg
Date: Fri, 10 Mar 2023 02:56:44 +0200
Message-Id: <20230310005704.1332368-13-dmitry.baryshkov@linaro.org>
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

Remove dpu_hw_fmt_layout instance from struct dpu_hw_sspp_cfg, leaving
only src_rect and dst_rect. This way all the pipes used by the plane
will have a common layout instance (as the framebuffer is shared between
them), while still keeping a separate src/dst rectangle configuration
for each pipe.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
2.39.2

