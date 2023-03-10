Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D906B331B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0E410E919;
	Fri, 10 Mar 2023 00:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E715510E912
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:12 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id k14so4602768lfj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kWF5ZM6PaVPWATZwb/4bc8LqWxYGoR6BESuDzLzJXaI=;
 b=tFo7razIunirpYvwPr0C51u5VQts7n2cIUsvPkZN/WPNCU20kD8Vs3b2oCA505rJvY
 SOtmtm+aqrmAmjudvdiLGQRHEdI4tZZDtHffKGKAzlqp/60FQNPTsBHy9DuUJr/AQ4JS
 RXj7slVLkDWQyDGuBoDgDW5XWK2t6hbKFKx5AkOAvKh2p174jh1OrGX605Qw7Clx2S5r
 4AiWU0heZ4Ifkcbvg4znxvBAxbQPxNI0pokG8puDJOTYmaCuCxc9uJAM9jQQ4RfsnuRU
 ZXVVUcgBPGoRNSQLx/lVAHQ8xGBjYThEB1iTS7yXr7bTVbvHbCFpHCtBuD8p3Qj5k7W6
 oV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kWF5ZM6PaVPWATZwb/4bc8LqWxYGoR6BESuDzLzJXaI=;
 b=JMvVY2zXe5rsURHqQWID0IeWBtHeEHj44+Mzeft9ImW556NSGkZFAbvwzu2a9RVjlO
 7bIo3CgT3oXdt3JG/bj3hS4Qjgm2TyPwRdTRe2nEP+XNmt0B5eIqc/7ostJ+LNhkbWp9
 gENOzl7Eng/R7GZkF0OFvPBDHjaDYxOfgJER35Rn0CeQM1EI1ggWgl3HESR+/sDIt0Xe
 CBiPJgXCNrcT5QX5uZtmpQRSsoUtHwzsMp0bGHO44CsgtmvtYZ1aTDRWzNC5+X9E+hC+
 fb8bPSvCLxq9KKj/vYjkpyClBnPAsRevA+Is8XuWmNlmxBlZcuntAzJUpf+FWmgEjDRR
 2txQ==
X-Gm-Message-State: AO0yUKWGpnELaf5zFIcHs7LH9B4vYJagtn1BUkEORvtMIT89nVI5M26m
 xZ5IrjiFFWJUVHn501/5D97Xrg==
X-Google-Smtp-Source: AK7set8GG58fTM/vndqE3O0LvceL/lAy2o/RSbHiW6K1e1S2eohwXVBXSnsK3XBPdul4L3tXocaOhw==
X-Received: by 2002:ac2:4421:0:b0:4e0:ff8e:bbfe with SMTP id
 w1-20020ac24421000000b004e0ff8ebbfemr6057003lfl.12.1678409831202; 
 Thu, 09 Mar 2023 16:57:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 06/32] drm/msm/dpu: drop dpu_plane_pipe function
Date: Fri, 10 Mar 2023 02:56:38 +0200
Message-Id: <20230310005704.1332368-7-dmitry.baryshkov@linaro.org>
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

There no more need for the dpu_plane_pipe() function, crtc code can
access pstate->pipe_hw.idx directly.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h | 7 -------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f29a339a3705..eff1a3cc1cec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -431,7 +431,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
-		sspp_idx = dpu_plane_pipe(plane);
+		sspp_idx = pstate->hw_sspp->idx;
 		set_bit(sspp_idx, fetch_active);
 
 		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
@@ -1202,7 +1202,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		pstates[cnt].dpu_pstate = dpu_pstate;
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-		pstates[cnt].pipe_id = dpu_plane_pipe(plane);
+		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->hw_sspp->idx;
 
 		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 546629232e3d..10678f6502a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1442,11 +1442,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 		.atomic_update = dpu_plane_atomic_update,
 };
 
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane)
-{
-	return plane ? to_dpu_plane(plane)->pipe : SSPP_NONE;
-}
-
 /* initialize plane */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 08a4b6a99f51..25e261cabadc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -59,13 +59,6 @@ struct dpu_multirect_plane_states {
 #define to_dpu_plane_state(x) \
 	container_of(x, struct dpu_plane_state, base)
 
-/**
- * dpu_plane_pipe - return sspp identifier for the given plane
- * @plane:   Pointer to DRM plane object
- * Returns: sspp identifier of the given plane
- */
-enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
-
 /**
  * dpu_plane_flush - final plane operations before commit flush
  * @plane: Pointer to drm plane structure
-- 
2.39.2

