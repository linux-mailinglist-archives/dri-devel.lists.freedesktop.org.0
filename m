Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937D13901EE
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6576EA24;
	Tue, 25 May 2021 13:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5528C89C07
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:13:21 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j10so45978823lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HxICzGGN4fuXTc0Zj3Y27W3FaudSqWT627W4/GXnsjo=;
 b=fKXCubLdDGDtY81Iade17LUJ6X87IalYN5PCyrn0cItiZkBSJnsDTMBMjf0Sl1hOnK
 GCDSx4LJB/wW3G69RR8XBj3jqCg7Csq8tm5zhD1ysOI2Qy1c4BBwTd5I/fK5esofodE9
 BoAeBu4HIxuvtdvS4px6oisjq1snVv+iAYMplvBlMsUYUDQpAASavr+Cdol5Ia5pMkPM
 nQdrwQrMHWzf27t+8tJEfXyyxvRr1tmc+X58pEHCVEcjrlDI3pdaau+OKZMMzzBUlXW6
 q51AWz0MSIiKHlUE21I29ouvaH6sEwJAkwCpOuKRSOO1X1XIx/+WB3k6gytx+YD87Aek
 RYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HxICzGGN4fuXTc0Zj3Y27W3FaudSqWT627W4/GXnsjo=;
 b=i0N8CFJEpbAN0tSIZ+bGdB0+wnELscCzdu4VI614NzBrAZMLTva7dmEmFz9chmyDGG
 orxaAFe1uotXyxvbc/zz+YSOXhQH7UOEuT/nvzrd/QRUb6+c9B/nxwPCykbbjZ4feUZN
 hcQoqV653kyfdMUMyqAk5ZdogepRYz72aZMe4FdiT164JN4KSYo4Xx7cKur++MVXAgN0
 rNdFdH0qctiLXhtecJEIKkENNJXRClYY8ZNC5O7bldAoLBGPyhJATJaa9nyIMV26Hkr1
 OOOch9AjnGbiGAlWWc08ODp6VJkLDyxg2BygKhR4tRrzLELfOfgxVP+yxKUwTtUfD7to
 I9Bw==
X-Gm-Message-State: AOAM533RpROeat1xv42JMHZEIfRwQ6YoUTTxLIJMGXGPaccZJv+ilb5W
 Wfcduy19BVfWFNxNRemZwUP96w==
X-Google-Smtp-Source: ABdhPJxxNGJI+xDegeeXxQC9tCKUVa/Epay1ErC+mkYWXHqe25FEoCKZ28JgkhLFFWtgfJixa2MdUQ==
X-Received: by 2002:ac2:4211:: with SMTP id y17mr13176558lfh.607.1621948399749; 
 Tue, 25 May 2021 06:13:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:13:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 2/7] drm/msm/mdp5: use drm_plane_state for storing alpha value
Date: Tue, 25 May 2021 16:13:11 +0300
Message-Id: <20210525131316.3117809-3-dmitry.baryshkov@linaro.org>
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

Use drm_plane_state's 'alpha' field rather than adding extra 'alpha'
field to mdp5_plane_state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  | 4 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h   | 1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index f5d71b274079..b98d5abafd1f 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -291,8 +291,8 @@ static void blend_setup(struct drm_crtc *crtc)
 		plane = pstates[i]->base.plane;
 		blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_CONST) |
 			MDP5_LM_BLEND_OP_MODE_BG_ALPHA(BG_CONST);
-		fg_alpha = pstates[i]->alpha;
-		bg_alpha = 0xFF - pstates[i]->alpha;
+		fg_alpha = pstates[i]->base.alpha >> 8;
+		bg_alpha = 0xFF - fg_alpha;
 
 		if (!format->alpha_enable && bg_alpha_enabled)
 			mixer_op_mode = 0;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 128866742593..d7e04e99fb4e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -101,7 +101,6 @@ struct mdp5_plane_state {
 	/* aligned with property */
 	uint8_t premultiplied;
 	uint8_t zpos;
-	uint8_t alpha;
 
 	/* assigned by crtc blender */
 	enum mdp_mixer_stage_id stage;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 8c29026d770d..0fd1d10352aa 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -168,7 +168,7 @@ mdp5_plane_atomic_print_state(struct drm_printer *p,
 					      "(null)");
 	drm_printf(p, "\tpremultiplied=%u\n", pstate->premultiplied);
 	drm_printf(p, "\tzpos=%u\n", pstate->zpos);
-	drm_printf(p, "\talpha=%u\n", pstate->alpha);
+	drm_printf(p, "\talpha=%u\n", pstate->base.alpha);
 	drm_printf(p, "\tstage=%s\n", stage2name(pstate->stage));
 }
 
@@ -183,7 +183,6 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
 
 	/* assign default blend parameters */
-	mdp5_state->alpha = 255;
 	mdp5_state->premultiplied = 0;
 
 	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
-- 
2.30.2

