Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C33B6F46AC
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F37210E59C;
	Tue,  2 May 2023 15:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D2910E592
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 15:05:39 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so28890086e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 08:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683039938; x=1685631938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fRTUjNAovFxHHJip4pkjqd6JPwFqTmtn1T/ylsG5TIg=;
 b=RlYgrqHs4Rax2JHON5jgD1G9Fj21fk5dVS9phPCQLoHyTWnLMuDZIGPCSeCQbydP90
 IgqFpeFgtmVNaTbPOlI+BvamEfJRk3ByTGDi5j7zfzu6QEzOscgabUONGvz7mNuIMYm8
 ndtwUUrzmCDWVB8e75xXIPso4T3ElR3GeN333svOnRtgoB2jhqvCmqmpT8XwBscqBjao
 AAcqeG/Xx17M1pZaSnTCtMqt0BVMCww3B6xKZI3vxBP5+5Ti0i2TQ4C7TAaUM9PKiiaS
 8b+KoGTnSsHPMxl/FJRBDzICVfbgSj14PCMWnAT9RCn3Ufh9P+s/EBZdN/74wj3AtG33
 ubIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039938; x=1685631938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fRTUjNAovFxHHJip4pkjqd6JPwFqTmtn1T/ylsG5TIg=;
 b=FQoq9ZhpIMIi2Hb60M5FN8KgJEm68raULCm2wNZ8AQpbe6GqfJyG3O4yZYZygV8Om0
 qGq+sLYs13cirNn33esNTOJZ7Su0W5nZZkX7ngzpPDGVmyLWSN3TsV15lbnAtBmnyC2n
 DYjNqsaOg4jCe0UVq2y1WLe592qt6ZhdDRcAaTR05vxkv+gBysUP6wsCNY9LVMf2C2TZ
 KUo6y7/MrDuIWJuxS5CGC9rhWelTxEqwEWuug6gw7B+XeZlxww7m39uikErWGCeNjN3l
 NL/6BRhnejaexE0xZsb2tFBp+CAjXbWPpf9b0MM2V5MFgWJy1iHDzMYCrHSpBv2NZkmW
 u4EA==
X-Gm-Message-State: AC+VfDzmiaCsS5T6gw1OrQ4vm4BbMg6+hRvF6vRp3sX0VTRRvOZQCORp
 eiPCIeXYOQ4wlWvgPsyG+PzSew==
X-Google-Smtp-Source: ACHHUZ4k8lIYRR/JiHiQvC1D/fLoYFOGiV5RHqzIcWIDGuxeiiZ7t92TnX0v8RWoNp3BhdMyu+7d6Q==
X-Received: by 2002:a2e:9d0b:0:b0:2a8:baea:2554 with SMTP id
 t11-20020a2e9d0b000000b002a8baea2554mr4904498lji.3.1683039938118; 
 Tue, 02 May 2023 08:05:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:05:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 4/9] drm/msm/dpu: rearrange QoS setting code
Date: Tue,  2 May 2023 18:05:28 +0300
Message-Id: <20230502150533.3672840-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
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

Slightly rearrainge code in dpu_plane_sspp_update_pipe() to group
QoS/LUT related functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b8ed7247a6af..586f089756fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1079,10 +1079,10 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		pipe->sspp->ops.setup_sourceaddress(pipe, layout);
 	}
 
-	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
+		_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+
 		/* skip remaining processing on color fill */
 		return;
 	}
@@ -1125,12 +1125,14 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
+	_dpu_plane_set_qos_ctrl(plane, pipe,
+				pipe->sspp->idx != SSPP_CURSOR0 &&
+				pipe->sspp->idx != SSPP_CURSOR1,
+				DPU_PLANE_QOS_PANIC_CTRL);
 
 	if (pipe->sspp->idx != SSPP_CURSOR0 &&
-	    pipe->sspp->idx != SSPP_CURSOR1) {
-		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
+	    pipe->sspp->idx != SSPP_CURSOR1)
 		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
-	}
 
 	if (pstate->needs_qos_remap)
 		_dpu_plane_set_qos_remap(plane, pipe);
-- 
2.39.2

