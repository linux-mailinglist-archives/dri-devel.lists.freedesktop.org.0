Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF506B3362
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F153110E904;
	Fri, 10 Mar 2023 00:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A78510E931
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:29 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id r27so4588867lfe.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9aJ5jicF9C8vMK5aC+d8/WlOn4/QqskwYJwHac+MO44=;
 b=YXdtBA+gHoC8CE13NJUZ0tgzqk6HJxsBjcjwz5ideHa6WJU7JcdqHXCep6PvvDn4M4
 C6ekC3CjWrdCSV8s/GYkDhN8AbPnwjVcHjz1k0pgKgADYNb9C4hyliUOO2uKpO8cltt9
 /rqWiK9pLYrbvVbIWWe8irzPHYgKIdEoOfe159lfvuL4WlbjeAT5GehvJZL2gNFRK3vS
 03OFP8WbURW3yYdojDDIZ1f+J59K+q2OGlQxW3khAUjItJkSaXiQNzHwOLH8OXYjZDHE
 oHQqlN3ZGSfnPoBslYbQVUdzqUmk2GTVJ7mP/3JpoGp1v2sV7qlkbklboo9z7DdYgIyh
 Ybbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9aJ5jicF9C8vMK5aC+d8/WlOn4/QqskwYJwHac+MO44=;
 b=OPOQ4XTV+4Z7/pfk0RP38Oa8vVqd40mWCKZYoUPsfDXaf+flairIGybXdu2L1s4luJ
 ZPpGtHbkJ+qcel+KGUfh2bb6TL+FOQq5Uk/Cv1T2wmJov1zjIdUQAP5fR35labUZOkBz
 NJE53mnPPkN+/G0bvl1l+MR9yFc9J5WiREvYuhGtnODmXoIhExb5ViCCLMNsQdTgC50j
 1HEkl/hfYFhfElQJRxgyNDv2ObCFxwN6aRSkv9aRp6PIGTwf3AMW7qBzOVV6+ETzVo86
 nYsn/k6X1hg5JAsAw/BpISztJgNOpY8cZtqG94TvBjkVBvJ3+Kf+l9BgdJdJgKQgS299
 5Azg==
X-Gm-Message-State: AO0yUKWVp/C+xAVMAvVGYrZIYP3GrzFB71oZrwt9JChSD6T1PWHkenJq
 MPqNHMBfQglo/uiQVJafKYHhj5unBoCwrId/x+8=
X-Google-Smtp-Source: AK7set+W+qX7X3i8I/INJv4ObxBbypnt+ZrcN3/61+lU2+EjwrqoQ5Bd9KAWPo4vaWU3ZxhPQQRhWg==
X-Received: by 2002:a19:550f:0:b0:4dd:aefc:8777 with SMTP id
 n15-20020a19550f000000b004ddaefc8777mr6481980lfe.47.1678409848841; 
 Thu, 09 Mar 2023 16:57:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 25/32] drm/msm/dpu: rework static color fill code
Date: Fri, 10 Mar 2023 02:56:57 +0200
Message-Id: <20230310005704.1332368-26-dmitry.baryshkov@linaro.org>
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

Rework static color fill code to separate the pipe / pipe_cfg handling.
This is a preparation for the r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 69 +++++++++++++----------
 1 file changed, 40 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c637713e23c7..3d798b939faa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -640,20 +640,52 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 				fmt);
 }
 
+static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
+				       struct dpu_sw_pipe *pipe,
+				       struct drm_rect *dst_rect,
+				       u32 fill_color,
+				       const struct dpu_format *fmt)
+{
+	struct dpu_sw_pipe_cfg pipe_cfg;
+
+	/* update sspp */
+	if (!pipe->sspp->ops.setup_solidfill)
+		return;
+
+	pipe->sspp->ops.setup_solidfill(pipe, fill_color);
+
+	/* override scaler/decimation if solid fill */
+	pipe_cfg.dst_rect = *dst_rect;
+
+	pipe_cfg.src_rect.x1 = 0;
+	pipe_cfg.src_rect.y1 = 0;
+	pipe_cfg.src_rect.x2 =
+		drm_rect_width(&pipe_cfg.dst_rect);
+	pipe_cfg.src_rect.y2 =
+		drm_rect_height(&pipe_cfg.dst_rect);
+
+	if (pipe->sspp->ops.setup_format)
+		pipe->sspp->ops.setup_format(pipe, fmt, DPU_SSPP_SOLID_FILL);
+
+	if (pipe->sspp->ops.setup_rects)
+		pipe->sspp->ops.setup_rects(pipe, &pipe_cfg);
+
+	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
+}
+
 /**
  * _dpu_plane_color_fill - enables color fill on plane
  * @pdpu:   Pointer to DPU plane object
  * @color:  RGB fill color value, [23..16] Blue, [15..8] Green, [7..0] Red
  * @alpha:  8-bit fill alpha value, 255 selects 100% alpha
- * Returns: 0 on success
  */
-static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
+static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		uint32_t color, uint32_t alpha)
 {
 	const struct dpu_format *fmt;
 	const struct drm_plane *plane = &pdpu->base;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
-	struct dpu_sw_pipe_cfg pipe_cfg;
+	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
@@ -662,34 +694,13 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 	 * h/w only supports RGB variants
 	 */
 	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
+	/* should not happen ever */
+	if (!fmt)
+		return;
 
 	/* update sspp */
-	if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
-		pstate->pipe.sspp->ops.setup_solidfill(&pstate->pipe,
-				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
-
-		/* override scaler/decimation if solid fill */
-		pipe_cfg.dst_rect = pstate->base.dst;
-
-		pipe_cfg.src_rect.x1 = 0;
-		pipe_cfg.src_rect.y1 = 0;
-		pipe_cfg.src_rect.x2 =
-			drm_rect_width(&pipe_cfg.dst_rect);
-		pipe_cfg.src_rect.y2 =
-			drm_rect_height(&pipe_cfg.dst_rect);
-
-		if (pstate->pipe.sspp->ops.setup_format)
-			pstate->pipe.sspp->ops.setup_format(&pstate->pipe,
-					fmt, DPU_SSPP_SOLID_FILL);
-
-		if (pstate->pipe.sspp->ops.setup_rects)
-			pstate->pipe.sspp->ops.setup_rects(&pstate->pipe,
-					&pipe_cfg);
-
-		_dpu_plane_setup_scaler(&pstate->pipe, fmt, true, &pipe_cfg, pstate->rotation);
-	}
-
-	return 0;
+	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
+				   fill_color, fmt);
 }
 
 int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
-- 
2.39.2

