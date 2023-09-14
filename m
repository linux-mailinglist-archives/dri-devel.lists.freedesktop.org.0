Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6DB79F9D3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 07:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBA310E4FF;
	Thu, 14 Sep 2023 05:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BE810E4F8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:11 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bfc8c02e82so3896231fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668030; x=1695272830; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDVBklRS/zpCaNNSChXZ8oT1YIvTUFQciSEHjoiQ7eM=;
 b=SxswQ2tzER7E7PXyTXo3LVl/GteC1m+ZfDokJubsUWzW35duOfEkVfi+yuUCLPH+z/
 KApM8NK1QIZke/yv7QF4cWYeyjz5DpJKjR6x0BQIueCJ99Ismy9V2SYtSJGl6F25rmdb
 8zS4GiVcsi0SIX5mJOzBGYUEIWhHfPBp0QWr+OnKC2ap9rOezwgbyTR3i9RNlEwr9jpz
 nRl5eu7FUQwENB/x5xb5kvJDm4n39xeHIiZto1SxOph025mFo1h2KDCIovpWAVCpAls6
 URwSQrm3hWfkOENgJaofcEGl7YbEk0g+XnZqD2yzReajHR1zKyDmQi7+mMTA3qG75zS0
 KmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668030; x=1695272830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDVBklRS/zpCaNNSChXZ8oT1YIvTUFQciSEHjoiQ7eM=;
 b=aMi/eF5WoMRHlYbhcnfJzp6GzFLNJ4DF0EZs0GZdQ8LGnR38S10XW+0YBtWVd+cpT2
 UOpeuo4UDl5+8BYZlH7xfI7Y5VC028nO9b6EYinsw/lAIVYfcyu3OWEk37IWi1iK9jgj
 YQvy5P10JDkOmMWaVRHlwLd7czj0NSzlkQ3rW2BbaAasjD7dcM+Y12F3r/eN4JBZKUOS
 d3yv+udfkiXYMITKS/qDeujHZnOri5MMnL4LpRUHVgnXgVESDB1chGD7SYKM+RKmqbRF
 4sj4l5odk2fJdfQiwg3RCKqcKXtOhZ5ByZOSUca3kYOyI/HXs25XtS4YfWXB1D38eKEB
 rW8A==
X-Gm-Message-State: AOJu0YzlozRyeaMyiI5+xRVd+H5kczXUijRPKoOKAGWYHWgxmGz3AXgE
 3IZG/I4JG/DjTALljxGyBtuxyA==
X-Google-Smtp-Source: AGHT+IHPChJTKjldNEoz195k+W1j/GESq9pdPTvGHhkhrGfQyU4w3OWF9yh/r4UEcZrnrjDEfCYaoQ==
X-Received: by 2002:a2e:9bc3:0:b0:2b9:3684:165 with SMTP id
 w3-20020a2e9bc3000000b002b936840165mr3830429ljj.8.1694668030013; 
 Wed, 13 Sep 2023 22:07:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 03/12] drm/msm/dpu: take plane rotation into account for
 wide planes
Date: Thu, 14 Sep 2023 08:06:57 +0300
Message-Id: <20230914050706.1058620-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
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

Take into account the plane rotation and flipping when calculating src
positions for the wide plane parts.

This is not an issue yet, because rotation is only supported for the
UBWC planes and wide UBWC planes are rejected anyway because in parallel
multirect case only the half of the usual width is supported for tiled
formats. However it's better to fix this now rather than stumbling upon
it later.

Fixes: 80e8ae3b38ab ("drm/msm/dpu: add support for wide planes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..67f9c2a62a17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -827,16 +827,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	pipe_cfg->src_rect = new_plane_state->src;
-
-	/* state->src is 16.16, src_rect is not */
-	pipe_cfg->src_rect.x1 >>= 16;
-	pipe_cfg->src_rect.x2 >>= 16;
-	pipe_cfg->src_rect.y1 >>= 16;
-	pipe_cfg->src_rect.y2 >>= 16;
-
-	pipe_cfg->dst_rect = new_plane_state->dst;
-
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
@@ -852,6 +842,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
+
+	drm_rect_rotate(&pipe_cfg->src_rect,
+			new_plane_state->fb->width, new_plane_state->fb->height,
+			new_plane_state->rotation);
+
 	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 		/*
 		 * In parallel multirect case only the half of the usual width
@@ -899,6 +898,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
 	}
 
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    new_plane_state->fb->width, new_plane_state->fb->height,
+			    new_plane_state->rotation);
+	if (r_pipe->sspp)
+		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+				    new_plane_state->fb->width, new_plane_state->fb->height,
+				    new_plane_state->rotation);
+
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
 	if (ret)
 		return ret;
-- 
2.39.2

