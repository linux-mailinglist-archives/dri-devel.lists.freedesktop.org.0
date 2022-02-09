Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDCF4AF84A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAD710E50C;
	Wed,  9 Feb 2022 17:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E172C10E4C2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:37 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id a25so4395067lji.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O8HtQCczVQEB27RhUL5MHWQy1J7awJd4RX9HC6K9174=;
 b=uQ1gJwdKPQ1VDGOUEMvqGB2S4n4Y6h/8N2I4vUTyLzMdBP2EYgJ1KrKdbvQuruU4Uf
 Zm5HZ4gEEkdie+prL0j6kXc3OmKmIBil62roEpV09I/XwVf7MJ4jod2zplZmKfBJslhz
 7RO1hOeSrZlJKgvJO3vILRNLqMDZ3zulg3j9j5AXs9K0eoJy7EOEapGno1mqOOBYtQQl
 aesQjBZWQW1tjVefS2OscnqDvw+1+oVFS6zmNdvkqakGMtOoL3H9vnkT7RDzjLbx7Rcf
 VdKUC2TRmJUgmrKAIp21t2QcyE/oFA86FnNwkdLbVIgCU69n0pB3D6tAKOkqs0Iol0+0
 wxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O8HtQCczVQEB27RhUL5MHWQy1J7awJd4RX9HC6K9174=;
 b=OsmRpzdwMoXTQLPM4UHhV/XLOTQkKkl4zgdZh9jhZtJ75G8JS8LoPyjkMB6lk/cKwG
 /m17Y+YMlFcxh3ld/8u9j+5hzfvfJObQ3gF1jmDinJLu2k6HdLrBoSsP6Jpqun7J6hd4
 WGAKehLKg7H+NKqsb3VX2xSMk2BkzYwUTmMrUXMqPQTQ9niW8E3E6dRUK89ouYJhLC6w
 KMW8ZKS1SoEexom6zNwhvN1wAEFJOTs21SOlkGsMwuaBswKetUzzs9TvdTaKkuCBgJEn
 RwHwQAw3OncXfkDPEL/ek9P1uXeQy06rlbbvJwZA7KJs2oHFGUsVcF3Vuh8X1AFLIhL1
 chvg==
X-Gm-Message-State: AOAM531jyW9vatT2lhF4Ei79x4wJgKEGcO1mEU2qHnP+5pqx6lCKTyR3
 T0Ma3Q28DhLhYaPk1myqH/Zc0Q==
X-Google-Smtp-Source: ABdhPJxqZ6aWHevVc9rWZYb8D44I+FU2kLwtI2gTDFnYtxX5KBC9ZnRba9QhKM5TJ+Og5sI88iJRgg==
X-Received: by 2002:a05:651c:50f:: with SMTP id
 o15mr2107141ljp.58.1644427536178; 
 Wed, 09 Feb 2022 09:25:36 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 15/25] drm/msm/dpu: remove dpu_hw_fmt_layout from struct
 dpu_hw_pipe_cfg
Date: Wed,  9 Feb 2022 20:25:10 +0300
Message-Id: <20220209172520.3719906-16-dmitry.baryshkov@linaro.org>
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

Remove dpu_hw_fmt_layout instance from struct dpu_hw_fmt_layout, leaving
only src_rect and dst_rect.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 30 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  7 ++---
 3 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 2186506e6315..df6698778b6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -486,7 +486,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 }
 
 static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
-		struct dpu_hw_pipe_cfg *cfg)
+		struct dpu_hw_fmt_layout *layout)
 {
 	struct dpu_hw_pipe *ctx = pipe->sspp;
 	u32 ystride0, ystride1;
@@ -497,41 +497,41 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index eee8501ea80d..93b60545ba98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -155,13 +155,11 @@ struct dpu_hw_pixel_ext {
 
 /**
  * struct dpu_hw_pipe_cfg : Pipe description
- * @layout:    format layout information for programming buffer to hardware
  * @src_rect:  src ROI, caller takes into account the different operations
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
  */
 struct dpu_hw_pipe_cfg {
-	struct dpu_hw_fmt_layout layout;
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
 };
@@ -260,10 +258,10 @@ struct dpu_hw_sspp_ops {
 	/**
 	 * setup_sourceaddress - setup pipe source addresses
 	 * @pipe: Pointer to software pipe context
-	 * @cfg: Pointer to pipe config structure
+	 * @layout: format layout information for programming buffer to hardware
 	 */
 	void (*setup_sourceaddress)(struct dpu_sw_pipe *ctx,
-			struct dpu_hw_pipe_cfg *cfg);
+			struct dpu_hw_fmt_layout *layout);
 
 	/**
 	 * setup_csc - setup color space coversion
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index e9421fa2fb2e..a521c0681af6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1052,6 +1052,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
 	struct dpu_hw_pipe_cfg pipe_cfg;
+	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	struct msm_gem_address_space *aspace = kms->base.aspace;
 	bool update_src_addr = true;
@@ -1059,7 +1060,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
 
-	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg.layout);
+	ret = dpu_format_populate_layout(aspace, fb, &layout);
 	if (ret == -EAGAIN) {
 		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
 		update_src_addr = false;
@@ -1070,8 +1071,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	if (update_src_addr &&
 	    pipe->sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(pipe, &pipe_cfg.layout);
-		pipe->sspp->ops.setup_sourceaddress(pipe, &pipe_cfg);
+		trace_dpu_plane_set_scanout(pipe, &layout);
+		pipe->sspp->ops.setup_sourceaddress(pipe, &layout);
 	}
 
 	pstate->pending = true;
-- 
2.34.1

