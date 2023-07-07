Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266FF74B815
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 22:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03FF10E5FE;
	Fri,  7 Jul 2023 20:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F0E10E5E7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 20:37:32 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb96e2b573so3785305e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762251; x=1691354251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VnCpK+iKc2+4eSXclvEGj+oEVEYKbITWlrI6Ck5I78=;
 b=cTqIKR8B+ag0CBCLz9M6TAb7r1HUX4gp6yPKmfFmM4QHW/tZl3P/xMaT19zfKw+8OU
 zWjguvFnlll2+OP5QebPb4HUPpfqL3WVlwsG5Fk5s/BCgjEsRS67qA8pRK5pgWHEudNz
 tL5Kjcxkdb+bGDi11mbrUVVjYFrmt2pIYZY306t/HQGLeEBHfzyJAogxTvIZXVJsVb0Z
 laf3YcjaFrWZaGgx0Ault45FHqYdKIUsxZaSjl8JCwmUPnsGdgJyZYtDhbAkPVCp+aoD
 ZLXodWMu7Fa/brymIZVTGq1oswqQaKTKS5TLY60C+cm5YFxuJ1fwsSUnhRopkAvQmhZm
 w6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762251; x=1691354251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8VnCpK+iKc2+4eSXclvEGj+oEVEYKbITWlrI6Ck5I78=;
 b=LG/IUopB2UReKdFoFaqUWVuvtVAorkgzEWYpt0SgLINXbJpX43PLzrBsc3PnBNZlsH
 VCwn3n0kBJvhonPZUlCrER+zyNWJWangEzDU+8/6u+D9nkXl/6Q5QAA4pFdXtUXN58p7
 411U3XhpYU6cCsIozpoWwGZpZotvI2jAo3+C6stw+KYT9JFe8u4Aca0hEocUG+tkJWoT
 ahVnF63vN9EOcD/DAnfv8edcxqXGJnb8thd6q8OkSGg/xgEaHYKrVUO1/MnCdfUPobRd
 z1peoZH4X92Iasc2pJar3M7IGWrWyiGrvUHQmG3mBqjLbFy8Xy3pS6XlJ/v9wcADUcei
 OF6Q==
X-Gm-Message-State: ABy/qLar6EKQEJGflU8Bj2KS9faNs6kFM0BUbCgrZcx1l70Iil64guFM
 iTqnJ42vc/eSVLAHGmlpFT1T4A==
X-Google-Smtp-Source: APBJJlF4nKTujKWsskVHypWkiKNVeH1aujkdg8PrzYznjvhbTuh8hBr+nzNvdgN7g9TeOD6pC0lSIw==
X-Received: by 2002:a05:6512:3145:b0:4f6:29cf:c0dd with SMTP id
 s5-20020a056512314500b004f629cfc0ddmr4520992lfi.8.1688762250973; 
 Fri, 07 Jul 2023 13:37:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 13:37:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 09/13] drm/msm/dpu: use drmm-managed allocation for dpu_plane
Date: Fri,  7 Jul 2023 23:37:20 +0300
Message-Id: <20230707203724.3820757-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
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

Change struct dpu_plane allocation to use drmm_universal_plane_alloc().
This removes the need to perform any actions on plane destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 44 +++++------------------
 1 file changed, 9 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f114efee1b57..bbf47151adde 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1170,20 +1170,6 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	}
 }
 
-static void dpu_plane_destroy(struct drm_plane *plane)
-{
-	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
-
-	DPU_DEBUG_PLANE(pdpu, "\n");
-
-	if (pdpu) {
-		/* this will destroy the states as well */
-		drm_plane_cleanup(plane);
-
-		kfree(pdpu);
-	}
-}
-
 static void dpu_plane_destroy_state(struct drm_plane *plane,
 		struct drm_plane_state *state)
 {
@@ -1353,7 +1339,6 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 static const struct drm_plane_funcs dpu_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
-		.destroy = dpu_plane_destroy,
 		.reset = dpu_plane_reset,
 		.atomic_duplicate_state = dpu_plane_duplicate_state,
 		.atomic_destroy_state = dpu_plane_destroy_state,
@@ -1383,33 +1368,26 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	uint32_t supported_rotations;
 	int ret = -EINVAL;
 
-	/* create and zero local structure */
-	pdpu = kzalloc(sizeof(*pdpu), GFP_KERNEL);
-	if (!pdpu) {
-		DPU_ERROR("[%u]failed to allocate local plane struct\n", pipe);
-		ret = -ENOMEM;
-		return ERR_PTR(ret);
-	}
-
-	/* cache local stuff for later */
-	plane = &pdpu->base;
-	pdpu->pipe = pipe;
-
 	/* initialize underlying h/w driver */
 	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
 	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
 		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
-		goto clean_plane;
+		return ERR_CAST(pdpu);
 	}
 
 	format_list = pipe_hw->cap->sblk->format_list;
 	num_formats = pipe_hw->cap->sblk->num_formats;
 
-	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
+	pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
+				0xff, &dpu_plane_funcs,
 				format_list, num_formats,
 				supported_format_modifiers, type, NULL);
-	if (ret)
-		goto clean_plane;
+	if (IS_ERR(pdpu))
+		return ERR_CAST(pdpu);
+
+	/* cache local stuff for later */
+	plane = &pdpu->base;
+	pdpu->pipe = pipe;
 
 	pdpu->catalog = kms->catalog;
 
@@ -1439,8 +1417,4 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
 	return plane;
-
-clean_plane:
-	kfree(pdpu);
-	return ERR_PTR(ret);
 }
-- 
2.39.2

