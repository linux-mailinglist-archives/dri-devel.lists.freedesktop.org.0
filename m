Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4040D3901EC
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A9E6EA20;
	Tue, 25 May 2021 13:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3300C6EA1F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:13:22 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id v5so38027666ljg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gpuqQrkSszYjpRL6dWUYSBVUoBVLpy578W8ZqjiamV8=;
 b=TGTDA0LY6Rac9WrS1gx9qGXob8SCe4/HQn3VIWjT7j3etrTQR28E4ckeXbh9yFwIrT
 uDLR9OvvL1JEQQfKlAd0QD9g1dV1N3oqRg6vfJJiyzdk/ntW2JnJ6RwpDBXZqLdPCMGP
 Cf1schqs1AaxJJ+1CUd1So/GwaYqV4VuAwjBdDAbazMlMNYFXBPqXoG49ZYI3XoNxlbu
 SFw1SornWFEOW76OxnOK+Relb6GWPeqvRIuNVGptgHUqLClVeq2Q+7Q/0p0f+heR+2hW
 4Tkd4DDlPCBItQqr/eRae/SneOrdeZfQEXD4Fnc+XrTSsam4FWUDYxo1qeb5BFLcRznH
 8bCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gpuqQrkSszYjpRL6dWUYSBVUoBVLpy578W8ZqjiamV8=;
 b=jtQaTiOxHny+lHZVj5Pv4zyRrmn7nT+H16o1+n6o5IjDIqm5d1jdbbMaA4ERETU/I7
 m84SRvJclmEJob+28y3gP0dDayWOKKh4nHAeSSEF5UuMzbZix2jc7GFPNkNjKUVaKUiB
 rO+3paocEJdETglHmx46ps4dmb7F7E93ZvFjG+j7yIsbcCmaZRCxNBDJgqPfbQlHGVPJ
 CCIqJFqfc6+uzMRWwMeqD8MykBesnbypDNqjgyiQREyziyxnIM6n7wprLzkxFRp3lHEI
 fQmW/yCyRSRu73qebVWLmmoe5njXoO4pkkcHvwx76iCG0RdZoaDJ1zHfphwAAuNRtCKr
 ErKA==
X-Gm-Message-State: AOAM532pQjwn79l9lqQ2oUfLcCydxLt9S8ZgKkyxpeLgm/5uD7YZ9/S0
 A0hmA39ezvMZNYN10bVoNXaR2Q==
X-Google-Smtp-Source: ABdhPJylU5OL91/hgVLeXN67BlbSWcIeBx4Ab3nhTByBqSheAPVqNIRxKvzQRct4Owc9YL6cejegbw==
X-Received: by 2002:a2e:a554:: with SMTP id e20mr20270267ljn.23.1621948400405; 
 Tue, 25 May 2021 06:13:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:13:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 3/7] drm/msm/mdp5: use drm_plane_state for pixel blend mode
Date: Tue, 25 May 2021 16:13:12 +0300
Message-Id: <20210525131316.3117809-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_plane_state's 'pixel_blend_mode' field rather than using
'premultiplied' field to mdp5_plane_state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  | 6 ++++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h   | 1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 5 +----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index b98d5abafd1f..ed4d91420417 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -301,7 +301,8 @@ static void blend_setup(struct drm_crtc *crtc)
 
 		DBG("Stage %d fg_alpha %x bg_alpha %x", i, fg_alpha, bg_alpha);
 
-		if (format->alpha_enable && pstates[i]->premultiplied) {
+		if (format->alpha_enable &&
+		    pstates[i]->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 			blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_CONST) |
 				MDP5_LM_BLEND_OP_MODE_BG_ALPHA(FG_PIXEL);
 			if (fg_alpha != 0xff) {
@@ -312,7 +313,8 @@ static void blend_setup(struct drm_crtc *crtc)
 			} else {
 				blend_op |= MDP5_LM_BLEND_OP_MODE_BG_INV_ALPHA;
 			}
-		} else if (format->alpha_enable) {
+		} else if (format->alpha_enable &&
+			   pstates[i]->base.pixel_blend_mode == DRM_MODE_BLEND_COVERAGE) {
 			blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_PIXEL) |
 				MDP5_LM_BLEND_OP_MODE_BG_ALPHA(FG_PIXEL);
 			if (fg_alpha != 0xff) {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index d7e04e99fb4e..d124c9bcdc60 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -99,7 +99,6 @@ struct mdp5_plane_state {
 	struct mdp5_hw_pipe *r_hwpipe;	/* right hwpipe */
 
 	/* aligned with property */
-	uint8_t premultiplied;
 	uint8_t zpos;
 
 	/* assigned by crtc blender */
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 0fd1d10352aa..90cd825df16b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -166,7 +166,7 @@ mdp5_plane_atomic_print_state(struct drm_printer *p,
 		drm_printf(p, "\tright-hwpipe=%s\n",
 			   pstate->r_hwpipe ? pstate->r_hwpipe->name :
 					      "(null)");
-	drm_printf(p, "\tpremultiplied=%u\n", pstate->premultiplied);
+	drm_printf(p, "\tblend_mode=%u\n", pstate->base.pixel_blend_mode);
 	drm_printf(p, "\tzpos=%u\n", pstate->zpos);
 	drm_printf(p, "\talpha=%u\n", pstate->base.alpha);
 	drm_printf(p, "\tstage=%s\n", stage2name(pstate->stage));
@@ -182,9 +182,6 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 	kfree(to_mdp5_plane_state(plane->state));
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
 
-	/* assign default blend parameters */
-	mdp5_state->premultiplied = 0;
-
 	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 		mdp5_state->zpos = STAGE_BASE;
 	else
-- 
2.30.2

