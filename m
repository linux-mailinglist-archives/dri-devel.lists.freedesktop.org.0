Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888D4659120
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6611610E400;
	Thu, 29 Dec 2022 19:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539E210E231
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:19 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id f34so28715720lfv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T56voTK7b2K1vHMG2HmJVyspDzmZqS3rg5P5AFvBOX4=;
 b=YKkvNOHKhoqL21AGNwiZKNA4CyabMpCQeNg9y1QNlU/reb7cRX3MP+2A6RH5BNt7qE
 KwDgy5HS4FEzeuhhX5DXnNpkoI8ksIbHZf5H1+a6NFYHEFd6dKBcADE3E3Kx6nUxolm3
 Tasw+nGKSuXHLxB6e3HqfzT/mfhzjLhBVU1/s6vOoezLF758DJZOOHf7lZZoRIHbVLwH
 qTTtWBNvfls94rREr6Upt/fqRxz1qNwlNqv+cmXjzYjsFB/rUvAGgJr8hW+ZtIvxWRfT
 dpnzkjiky/z7hezCMWNryTpA0RKpIa03PhjicngQghAet1euZ/WJQys6p5xvWgFz2ky2
 bCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T56voTK7b2K1vHMG2HmJVyspDzmZqS3rg5P5AFvBOX4=;
 b=Zxyh4uJJHitGuBLMUHujmBJCyl35h0KsG4kJbCQlvxO8Ka3rsWH5QwO2KI85NoS0r4
 C9q9pMRH0UNz6CSYX0ljNt7lg+2rxQ7+YAk2nH+cYbPSZsCxkU4TYmmueiqPNc+9VKAJ
 dtnsomMW25MT7hkzok1Lpk1K8D+JtJH4TG5hEotRmQ66GP24gwN5CMFQdJ/JANaExEDg
 PXEwRvghvCE7Kplw2hogrTi0exJ3r9jM8Ya5fxmyyBa5faQ3F4OJIEKN26GGj3unhe78
 fSj5kpI6NquwV1NsV8fNQHbkUkljfxtNlzEmPrWoD+KMgiaMw9Q5Wjg8ouydkVYeOZD9
 kvOg==
X-Gm-Message-State: AFqh2krDhqv7LBxwFdYwehKeJ750RVkQlCSXyIDXl8Llf2I0laEK8/3Q
 HEoiu6ljnexa49j2GXBaA+fNZcnu2uJUFBmj
X-Google-Smtp-Source: AMrXdXvrsIeTwFLFdoveipRTBi092sgSZK6m4vN3JoRDzkSjRNvOwUSUbo7Xzy6udByTf6AeiDH2Kg==
X-Received: by 2002:a05:6512:695:b0:4b5:2bbc:e119 with SMTP id
 t21-20020a056512069500b004b52bbce119mr15070428lfe.65.1672341558905; 
 Thu, 29 Dec 2022 11:19:18 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 21/27] drm/msm/dpu: make _dpu_plane_calc_clk accept mode
 directly
Date: Thu, 29 Dec 2022 21:18:50 +0200
Message-Id: <20221229191856.3508092-22-dmitry.baryshkov@linaro.org>
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

Rework bandwidth/clock calculation functions to use mode directly rather
than fetching it through the plane data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 39 ++++++++++-------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7fc2c767c6d1..3d0c5a36a7dc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -127,20 +127,19 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
 
 /**
  * _dpu_plane_calc_bw - calculate bandwidth required for a plane
- * @plane: Pointer to drm plane.
+ * @catalog: Points to dpu catalog structure
  * @fmt: Pointer to source buffer format
+ * @mode: Pointer to drm display mode
  * @pipe_cfg: Pointer to pipe configuration
  * Result: Updates calculated bandwidth in the plane state.
  * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
  * Prefill BW Equation: line src bytes * line_time
  */
-static void _dpu_plane_calc_bw(struct drm_plane *plane,
+static u64 _dpu_plane_calc_bw(const struct dpu_mdss_cfg *catalog,
 	const struct dpu_format *fmt,
+	const struct drm_display_mode *mode,
 	struct dpu_hw_pipe_cfg *pipe_cfg)
 {
-	struct dpu_plane_state *pstate;
-	struct drm_display_mode *mode;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	int src_width, src_height, dst_height, fps;
 	u64 plane_prefill_bw;
 	u64 plane_bw;
@@ -148,9 +147,6 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	u64 scale_factor;
 	int vbp, vpw, vfp;
 
-	pstate = to_dpu_plane_state(plane->state);
-	mode = &plane->state->crtc->mode;
-
 	src_width = drm_rect_width(&pipe_cfg->src_rect);
 	src_height = drm_rect_height(&pipe_cfg->src_rect);
 	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
@@ -158,7 +154,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	vbp = mode->vtotal - mode->vsync_end;
 	vpw = mode->vsync_end - mode->vsync_start;
 	vfp = mode->vsync_start - mode->vdisplay;
-	hw_latency_lines =  dpu_kms->catalog->perf->min_prefill_lines;
+	hw_latency_lines =  catalog->perf->min_prefill_lines;
 	scale_factor = src_height > dst_height ?
 		mult_frac(src_height, 1, dst_height) : 1;
 
@@ -178,37 +174,36 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 		do_div(plane_prefill_bw, hw_latency_lines);
 
 
-	pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
+	return max(plane_bw, plane_prefill_bw);
 }
 
 /**
  * _dpu_plane_calc_clk - calculate clock required for a plane
- * @plane: Pointer to drm plane.
+ * @mode: Pointer to drm display mode
  * @pipe_cfg: Pointer to pipe configuration
  * Result: Updates calculated clock in the plane state.
  * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
  */
-static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_pipe_cfg *pipe_cfg)
+static u64 _dpu_plane_calc_clk(const struct drm_display_mode *mode,
+		struct dpu_hw_pipe_cfg *pipe_cfg)
 {
-	struct dpu_plane_state *pstate;
-	struct drm_display_mode *mode;
 	int dst_width, src_height, dst_height, fps;
-
-	pstate = to_dpu_plane_state(plane->state);
-	mode = &plane->state->crtc->mode;
+	u64 plane_clk;
 
 	src_height = drm_rect_height(&pipe_cfg->src_rect);
 	dst_width = drm_rect_width(&pipe_cfg->dst_rect);
 	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
 	fps = drm_mode_vrefresh(mode);
 
-	pstate->plane_clk =
+	plane_clk =
 		dst_width * mode->vtotal * fps;
 
 	if (src_height > dst_height) {
-		pstate->plane_clk *= src_height;
-		do_div(pstate->plane_clk, dst_height);
+		plane_clk *= src_height;
+		do_div(plane_clk, dst_height);
 	}
+
+	return plane_clk;
 }
 
 /**
@@ -1201,9 +1196,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_qos_remap(plane, pipe);
 	}
 
-	_dpu_plane_calc_bw(plane, fmt, &pstate->pipe_cfg);
+	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, &pstate->pipe_cfg);
 
-	_dpu_plane_calc_clk(plane, &pstate->pipe_cfg);
+	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, &pstate->pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
-- 
2.39.0

