Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C2C68A1AA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB42010E864;
	Fri,  3 Feb 2023 18:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483C010E85B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gr7so17684590ejb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SdAjZqjdCk8IsJ8MvPndY+/TqkEcmwAepofIV5H7WHE=;
 b=lj8E+6EDP4r2gDg10oCwr61RHidXl3wgi6jNtdPFYRVO9PhP95a4klhhK+9auIjRwt
 E5qzA8DX4BlsfZCj/Sq/v0hfAKgTxZI+UL3zvN0MqLI1SCfACRODdMkWyh0vQFW8gUDd
 tJBoJCUPKjywinYLmCB4v8pTUfsnqUNoD70CrxnVgZHPhH0UqERq/6V7W4b7n/2oZef3
 lkhKXpTacq7X2RuG2DjJBuhdXELI453uvKVb/I96V0rKj24hOCDAkCzDHEYH//dV3HhG
 mZPmCnQDTPaMw+k+m1F2D4DvSdfHHLdthdTQt9FPwaQLqs28JKv2Jn6SjLP1fOuIsrDL
 j6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SdAjZqjdCk8IsJ8MvPndY+/TqkEcmwAepofIV5H7WHE=;
 b=NR0wQLK6VvdqWcJ5KfnpYluPvbXpcQXHqOgO3drsqf9Nq4EsPOHQ+Lp8Vcs45R39L5
 U1Zb7yR3fRxIWvydp9OQiAv02M38G0QWPVE4KaYNK+v99b+AYdhjXXq6QJC1+stuqums
 FCyWM+uuoxXRDK2Me3Vm90S3Qfnkl+SteCUcRfESsvjpsfPE0KAMmhuec+CX81VthSQV
 eWLDGvJxElfLdG0F0oKGRQG9LdJbWYU7/4E2oknMr5RTAK/kpD1EaUtSdtVVxYmiT7IC
 //M2rkjgFHTbo9QPD7XLPrJEMt58xOlRcSUFrREWAl56MfZ9Lqwb415TRYmJhwFaKyK0
 VO/A==
X-Gm-Message-State: AO0yUKUeiMMB6nUh6K3BP65VfB5z2xk4w43THYmGrPeA2j3J/vY6yK2s
 bfH7taAJ2o2GU5bbstizrpt6Yw==
X-Google-Smtp-Source: AK7set9W4+AKVTeF5PU2JXLGWKFhy8+iTWpR9Rmja84paXqvElQrYAYorj4oj2DB02D9uxpVG78BYQ==
X-Received: by 2002:a17:906:9610:b0:878:68e5:e52b with SMTP id
 s16-20020a170906961000b0087868e5e52bmr12353192ejx.66.1675448501323; 
 Fri, 03 Feb 2023 10:21:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 06/27] drm/msm/dpu: drop dpu_plane_pipe function
Date: Fri,  3 Feb 2023 20:21:11 +0200
Message-Id: <20230203182132.1307834-7-dmitry.baryshkov@linaro.org>
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
index 9eac02f53fc1..c2b34d97e065 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1441,11 +1441,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
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
2.39.1

