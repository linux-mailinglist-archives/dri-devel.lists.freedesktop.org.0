Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C425980152F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3382A10E977;
	Fri,  1 Dec 2023 21:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACED10E961
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 21:18:58 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9d3aad61fso27096871fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465537; x=1702070337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8A2Dx7VYhQ6DejQmgmtOb7Y7Nu7+NFqerEdDyz1CvrU=;
 b=gFN2N5gPjq3QvWskaO/duilpLooznLD1k7LbJjpiX3OMdAoxyRaeSabIKJ25YLE6el
 g6qTkIW+DptmljKU4Lp0DBSmzZ+CEeA4p/PM8tApdMXvnPJ/DOzxN8KMlNG/l0JI/7dF
 uZWc3lsZWpDt0p0mKTTyulpIf1SfzaYkQ1asxyaTzhjG2X6wkquOSrzumCMvA2adm+Ae
 wHyx30s6LDQvqIgMGAGS4uJwW4a4PKZND/jm6Nkh1/+WmzTO31urhJ8QuvwgBsKBWoJh
 y52IhSp0EwTkkWgPKXeZLtFD347uXBTXncEUmJtzumoS1T7YP6fImnFAQH3rXe+74ms3
 srHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465537; x=1702070337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8A2Dx7VYhQ6DejQmgmtOb7Y7Nu7+NFqerEdDyz1CvrU=;
 b=RwxDGl8H/h9uerOuQi5r5veZJ4b06Qvb+qcid0kzkmGIxMRDzJ7vceP1zcz4CaiHlO
 Svkxj6MVJ2qgOEv2Nha1QYznJEsZRlwcYMfSTqGFuWLHqaf4d4zmE3kr9S0wB0Nw3/Fq
 9uXtpPp9o1ah2fXiED1b/SNY5AJSSlRE4toP7SuzhYYQMNuynez9JXzVbq9+kpWt1l1v
 FdqGxmX6TCxfy22qc9MEWdAbjqFXxBT2C/ncMe+y5Q5Oawa1uIiOH1EaZSfMjtx+YhRw
 Fa16J/pRh6oD9FOJLIQa6F2inOoVRJDd89WWsr3191viwCq/08rD5zoSD7e/ikpJoTo/
 aBfg==
X-Gm-Message-State: AOJu0Yydk4gLcdRprHd9+T9H/Jt77BDa0qWUx5CfpMaA+teMRb8KZ7hJ
 HNGCkk2MhfaXYJViyfo4ZWuEnQ==
X-Google-Smtp-Source: AGHT+IHX6Mb2s7pu/elJO/1eGQuHMRBR48UE4DjUSn4X4bgn/+S7y3OUSxPcInJMWLtVJ/n78TIC4w==
X-Received: by 2002:a2e:9f43:0:b0:2c8:8813:2e6e with SMTP id
 v3-20020a2e9f43000000b002c888132e6emr1378152ljk.11.1701465536941; 
 Fri, 01 Dec 2023 13:18:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:18:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 08/13] drm/msm/dpu: remove QoS teardown on plane destruction
Date: Sat,  2 Dec 2023 00:18:40 +0300
Message-Id: <20231201211845.1026967-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is little point in disabling QoS on plane destruction: it happens
during DPU device destruction process, after which there will be no
running planes.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 20908f3d8f81..ab9f93f15536 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1214,17 +1214,10 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 static void dpu_plane_destroy(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
-	struct dpu_plane_state *pstate;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
 	if (pdpu) {
-		pstate = to_dpu_plane_state(plane->state);
-		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false);
-
-		if (pstate->r_pipe.sspp)
-			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
-- 
2.39.2

